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
