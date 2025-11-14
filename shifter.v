module shifter(
    input i_clock,
    input i_switch,
    output o_led0,
    output o_led1,
    output o_led2,
    output o_led3
);

reg [3:0] r_shift;
always @(posedge i_clock) begin
    r_shift[3:1] <= r_shift[2:0];
    r_shift[0] <= i_switch;
end
assign o_led0 = r_shift[0];
assign o_led1 = r_shift[1];
assign o_led2 = r_shift[2];
assign o_led3 = r_shift[3];

endmodule