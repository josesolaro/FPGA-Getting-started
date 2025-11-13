`timescale 1ns/1ps

module main_TB ();
  reg r_sel0 = 1'b0, r_sel1 = 1'b0;
  reg r_data0 = 1'b1, r_data1 = 1'b0, r_data2 = 1'b1, r_data3 = 1'b0;
  wire w_output;

  multiplexer  UUT (
      .i_sel0  (r_sel0), .i_sel1  (r_sel1),
      .i_data0  (r_data0), .i_data1  (r_data1), .i_data2  (r_data2), .i_data3  (r_data3),
      .o (w_output)
  );

  initial begin
    $dumpvars;
    #1 assert(w_output == 1'b1);
    #10
    r_sel0 = 1'b1;
    #1 assert(w_output == 1'b0);
    #10
    r_sel0 = 1'b0;
    r_sel1 = 1'b1;
    #1 assert(w_output == 1'b1);
    #10
    r_sel0 = 1'b1;
    #1 assert(w_output == 1'b0);
    #10
    $finish;
  end

endmodule
