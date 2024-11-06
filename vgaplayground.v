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

module id_rom (
  input wire [7:0] addr,
  output wire [3:0] data
);

  reg [3:0] mem[255:0];
  initial begin
    mem[0] = 4'h0;
    mem[1] = 4'h0;
    mem[2] = 4'h0;
    mem[3] = 4'h0;
    mem[4] = 4'h0;
    mem[5] = 4'h0;
    mem[6] = 4'h0;
    mem[7] = 4'h0;
    mem[8] = 4'h0;
    mem[9] = 4'h0;
    mem[10] = 4'h0;
    mem[11] = 4'h0;
    mem[12] = 4'h0;
    mem[13] = 4'h0;
    mem[14] = 4'h0;
    mem[15] = 4'h0;
    mem[16] = 4'h0;
    mem[17] = 4'h3;
    mem[18] = 4'hC;
    mem[19] = 4'h0;
    mem[20] = 4'h0;
    mem[21] = 4'h0;
    mem[22] = 4'h0;
    mem[23] = 4'h0;
    mem[24] = 4'h0;
    mem[25] = 4'h0;
    mem[26] = 4'h0;
    mem[27] = 4'h0;
    mem[28] = 4'h0;
    mem[29] = 4'h0;
    mem[30] = 4'h0;
    mem[31] = 4'h0;
    mem[32] = 4'h0;
    mem[33] = 4'h4;
    mem[34] = 4'h2;
    mem[35] = 4'h0;
    mem[36] = 4'h0;
    mem[37] = 4'h0;
    mem[38] = 4'h0;
    mem[39] = 4'h0;
    mem[40] = 4'h0;
    mem[41] = 4'h0;
    mem[42] = 4'h0;
    mem[43] = 4'h0;
    mem[44] = 4'h0;
    mem[45] = 4'h0;
    mem[46] = 4'h0;
    mem[47] = 4'h0;
    mem[48] = 4'h0;
    mem[49] = 4'h4;
    mem[50] = 4'h2;
    mem[51] = 4'h0;
    mem[52] = 4'h0;
    mem[53] = 4'h0;
    mem[54] = 4'h0;
    mem[55] = 4'h0;
    mem[56] = 4'h0;
    mem[57] = 4'h0;
    mem[58] = 4'h0;
    mem[59] = 4'h0;
    mem[60] = 4'h0;
    mem[61] = 4'h0;
    mem[62] = 4'h0;
    mem[63] = 4'h0;
    mem[64] = 4'h0;
    mem[65] = 4'h8;
    mem[66] = 4'h1;
    mem[67] = 4'h1;
    mem[68] = 4'hD;
    mem[69] = 4'hD;
    mem[70] = 4'h9;
    mem[71] = 4'h4;
    mem[72] = 4'h7;
    mem[73] = 4'h2;
    mem[74] = 4'h6;
    mem[75] = 4'h7;
    mem[76] = 4'h2;
    mem[77] = 4'h5;
    mem[78] = 4'h7;
    mem[79] = 4'h0;
    mem[80] = 4'h0;
    mem[81] = 4'hF;
    mem[82] = 4'h1;
    mem[83] = 4'h0;
    mem[84] = 4'h8;
    mem[85] = 4'h9;
    mem[86] = 4'h5;
    mem[87] = 4'h4;
    mem[88] = 4'h2;
    mem[89] = 4'h5;
    mem[90] = 4'h5;
    mem[91] = 4'h4;
    mem[92] = 4'h5;
    mem[93] = 4'h5;
    mem[94] = 4'h2;
    mem[95] = 4'h0;
    mem[96] = 4'h0;
    mem[97] = 4'h2;
    mem[98] = 4'h1;
    mem[99] = 4'h0;
    mem[100] = 4'h8;
    mem[101] = 4'h9;
    mem[102] = 4'h5;
    mem[103] = 4'h4;
    mem[104] = 4'h2;
    mem[105] = 4'h5;
    mem[106] = 4'h5;
    mem[107] = 4'h4;
    mem[108] = 4'h5;
    mem[109] = 4'h5;
    mem[110] = 4'h2;
    mem[111] = 4'h0;
    mem[112] = 4'h0;
    mem[113] = 4'hA;
    mem[114] = 4'h1;
    mem[115] = 4'h0;
    mem[116] = 4'h8;
    mem[117] = 4'h9;
    mem[118] = 4'h4;
    mem[119] = 4'h8;
    mem[120] = 4'h2;
    mem[121] = 4'h5;
    mem[122] = 4'h5;
    mem[123] = 4'h6;
    mem[124] = 4'h5;
    mem[125] = 4'h5;
    mem[126] = 4'h2;
    mem[127] = 4'h0;
    mem[128] = 4'h0;
    mem[129] = 4'hB;
    mem[130] = 4'hD;
    mem[131] = 4'h0;
    mem[132] = 4'h8;
    mem[133] = 4'h9;
    mem[134] = 4'h4;
    mem[135] = 4'h8;
    mem[136] = 4'h2;
    mem[137] = 4'h7;
    mem[138] = 4'h6;
    mem[139] = 4'h4;
    mem[140] = 4'h5;
    mem[141] = 4'h5;
    mem[142] = 4'h2;
    mem[143] = 4'h0;
    mem[144] = 4'h0;
    mem[145] = 4'hA;
    mem[146] = 4'h9;
    mem[147] = 4'h0;
    mem[148] = 4'h8;
    mem[149] = 4'h9;
    mem[150] = 4'h4;
    mem[151] = 4'h8;
    mem[152] = 4'h2;
    mem[153] = 4'h5;
    mem[154] = 4'h4;
    mem[155] = 4'h4;
    mem[156] = 4'h5;
    mem[157] = 4'h5;
    mem[158] = 4'h2;
    mem[159] = 4'h0;
    mem[160] = 4'h0;
    mem[161] = 4'hA;
    mem[162] = 4'h9;
    mem[163] = 4'h0;
    mem[164] = 4'h8;
    mem[165] = 4'h9;
    mem[166] = 4'h4;
    mem[167] = 4'h8;
    mem[168] = 4'h2;
    mem[169] = 4'h5;
    mem[170] = 4'h4;
    mem[171] = 4'h4;
    mem[172] = 4'h5;
    mem[173] = 4'h5;
    mem[174] = 4'h2;
    mem[175] = 4'h0;
    mem[176] = 4'h0;
    mem[177] = 4'h8;
    mem[178] = 4'h9;
    mem[179] = 4'h0;
    mem[180] = 4'h9;
    mem[181] = 4'hD;
    mem[182] = 4'h4;
    mem[183] = 4'h8;
    mem[184] = 4'h2;
    mem[185] = 4'h5;
    mem[186] = 4'h4;
    mem[187] = 4'h7;
    mem[188] = 4'h2;
    mem[189] = 4'h2;
    mem[190] = 4'h2;
    mem[191] = 4'h0;
    mem[192] = 4'h0;
    mem[193] = 4'h4;
    mem[194] = 4'hA;
    mem[195] = 4'h0;
    mem[196] = 4'h0;
    mem[197] = 4'h0;
    mem[198] = 4'h0;
    mem[199] = 4'h0;
    mem[200] = 4'h0;
    mem[201] = 4'h0;
    mem[202] = 4'h0;
    mem[203] = 4'h0;
    mem[204] = 4'h0;
    mem[205] = 4'h0;
    mem[206] = 4'h0;
    mem[207] = 4'h0;
    mem[208] = 4'h0;
    mem[209] = 4'h4;
    mem[210] = 4'hA;
    mem[211] = 4'h0;
    mem[212] = 4'h0;
    mem[213] = 4'h0;
    mem[214] = 4'h0;
    mem[215] = 4'h0;
    mem[216] = 4'h0;
    mem[217] = 4'h0;
    mem[218] = 4'h0;
    mem[219] = 4'h0;
    mem[220] = 4'h0;
    mem[221] = 4'h0;
    mem[222] = 4'h0;
    mem[223] = 4'h0;
    mem[224] = 4'h0;
    mem[225] = 4'h3;
    mem[226] = 4'h8;
    mem[227] = 4'h0;
    mem[228] = 4'h0;
    mem[229] = 4'h0;
    mem[230] = 4'h0;
    mem[231] = 4'h0;
    mem[232] = 4'h0;
    mem[233] = 4'h0;
    mem[234] = 4'h0;
    mem[235] = 4'h0;
    mem[236] = 4'h0;
    mem[237] = 4'h0;
    mem[238] = 4'h0;
    mem[239] = 4'h0;
    mem[240] = 4'h0;
    mem[241] = 4'h0;
    mem[242] = 4'h0;
    mem[243] = 4'h0;
    mem[244] = 4'h0;
    mem[245] = 4'h0;
    mem[246] = 4'h0;
    mem[247] = 4'h0;
    mem[248] = 4'h0;
    mem[249] = 4'h0;
    mem[250] = 4'h0;
    mem[251] = 4'h0;
    mem[252] = 4'h0;
    mem[253] = 4'h0;
    mem[254] = 4'h0;
    mem[255] = 4'h0;
  end

  assign data = mem[addr];

endmodule

module palette (
  input wire [3:0] color_index,
  output wire [5:0] rrggbb
);

  reg [5:0] palette[15:0];
  initial begin
    palette[0]  = 6'b000000; // sync            (rgb(0%, 0%, 0%))
    palette[1]  = 6'b000000; // NTSC superblack (rgb(3.5%, 3.5%, 3.5%))
    palette[2]  = 6'b000000; // NTSC black      (rgb(7.5%, 7.5%, 7.5%))
    palette[3]  = 6'b000000; // NTSC PLUGE      (rgb(11.5%, 11.5%, 11.5%))
    palette[4]  = 6'b000001; // NTSC -I         (rgb(0%, 12%, 30%))
    palette[5]  = 6'b010000; // NTSC +I
    palette[6]  = 6'b010010; // NTSC +Q         (rgb(20%, 0%, 42%))
    palette[7]  = 6'b000100; // NTSC -Q
    palette[8]  = 6'b000010; // NTSC blue       (rgb(0%, 0%, 75%))
    palette[9]  = 6'b100000; // NTSC red        (rgb(75%, 0%, 0%))
    palette[10] = 6'b100010; // NTSC magenta    (rgb(75%, 0%, 75%))
    palette[11] = 6'b001000; // NTSC green      (rgb(0%, 75%, 0%))
    palette[12] = 6'b001010; // NTSC cyan       (rgb(0%, 75%, 75%))
    palette[13] = 6'b101000; // NTSC yellow     (rgb(75%, 75%, 0%))
    palette[14] = 6'b101010; // NTSC white      (rgb(75%, 75%, 75%))
    palette[15] = 6'b111111; // NTSC superwhite (rgb(100%, 100%, 100%))
  end

  assign rrggbb = palette[color_index];

endmodule

module tt_um_vga_example(
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
