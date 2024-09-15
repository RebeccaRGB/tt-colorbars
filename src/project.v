/*
 * Copyright (c) 2024 Rebecca G. Bettencourt
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

parameter Y_5_12 = 200;
parameter Y_7_12 = 280;
parameter Y_8_12 = 320;
parameter Y_9_12 = 360;

parameter X_1_7 = 90;
parameter X_2_7 = 182;
parameter X_3_7 = 274;
parameter X_4_7 = 366;
parameter X_5_7 = 458;
parameter X_6_7 = 550;

parameter X_05_28 = 113;
parameter X_10_28 = 228;
parameter X_15_28 = 343;
parameter X_20_28 = 458;
parameter X_16_21 = 489;
parameter X_17_21 = 519;
parameter X_18_21 = 550;

parameter SUPERBLACK = 4'd1;
parameter BLACK      = 4'd2;
parameter PLUGE      = 4'd3;
parameter I          = 4'd4;
parameter Q          = 4'd6;
parameter BLUE       = 4'd8;
parameter RED        = 4'd9;
parameter MAGENTA    = 4'd10;
parameter GREEN      = 4'd11;
parameter CYAN       = 4'd12;
parameter YELLOW     = 4'd13;
parameter WHITE      = 4'd14;
parameter SUPERWHITE = 4'd15;

module tt_um_rebeccargb_colorbars (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // VGA signals
  wire hsync;
  wire vsync;
  wire [1:0] R;
  wire [1:0] G;
  wire [1:0] B;
  wire video_active;
  wire [9:0] pix_x;
  wire [9:0] pix_y;

  // TinyVGA PMOD
  assign uo_out = {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]};

  // ID ROM address
  wire [9:0] id_x = (ui_in[2] ? ((pix_x + counter) % 640) : pix_x) / ((640 / 4) / 16);
  wire [9:0] id_y = (pix_y - Y_5_12) / ((Y_7_12 - Y_5_12) / 16);
  assign uio_out = {id_y[3:0], id_x[5:2]};
  assign uio_oe  = 8'hFF;

  // Suppress unused signals warning
  wire _unused_ok = &{ena, ui_in, uio_in, id_x[9:6], id_y[9:4]};

  reg [9:0] counter;

  hvsync_generator hvsync_gen(
    .clk(clk),
    .reset(~rst_n),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(video_active),
    .hpos(pix_x),
    .vpos(pix_y)
  );

  wire [9:0] bar_x = (ui_in[3] ? ((pix_x + (640 - counter)) % 640) : pix_x);

  wire [3:0] bar_color = (
    bar_x < X_1_7 ? WHITE :
    bar_x < X_2_7 ? YELLOW :
    bar_x < X_3_7 ? CYAN :
    bar_x < X_4_7 ? GREEN :
    bar_x < X_5_7 ? MAGENTA :
    bar_x < X_6_7 ? RED :
    BLUE
  );

  wire [3:0] rom_in;
  id_rom id(uio_out, rom_in);

  wire id_ui_in = ui_in[4 + id_x[1:0]];
  wire id_rom_in = rom_in[3 - id_x[1:0]];
  wire id_pixel = ui_in[1] ? id_ui_in : id_rom_in;
  wire [3:0] id_color = id_pixel ? WHITE : BLACK;

  wire [3:0] cas_color = (
    bar_x < X_1_7 ? BLUE :
    bar_x < X_2_7 ? BLACK :
    bar_x < X_3_7 ? MAGENTA :
    bar_x < X_4_7 ? BLACK :
    bar_x < X_5_7 ? CYAN :
    bar_x < X_6_7 ? BLACK :
    WHITE
  );

  wire [3:0] bot_color = (
    pix_x < X_05_28 ? I :
    pix_x < X_10_28 ? SUPERWHITE :
    pix_x < X_15_28 ? Q :
    pix_x < X_20_28 ? BLACK :
    pix_x < X_16_21 ? SUPERBLACK :
    pix_x < X_17_21 ? BLACK :
    pix_x < X_18_21 ? PLUGE :
    BLACK
  );

  wire [3:0] color_index = (
    pix_y < Y_5_12 ? bar_color :
    (pix_y < Y_7_12 && ui_in[0]) ? id_color :
    pix_y < Y_8_12 ? bar_color :
    pix_y < Y_9_12 ? cas_color :
    bot_color
  );

  wire [5:0] color;
  palette pal(color_index, color);

  assign R = video_active ? color[5:4] : 2'b00;
  assign G = video_active ? color[3:2] : 2'b00;
  assign B = video_active ? color[1:0] : 2'b00;

  always @(posedge vsync) begin
    if (~rst_n) begin
      counter <= 0;
    end else begin
      counter <= (counter + 5) % 640;
    end
  end

endmodule
