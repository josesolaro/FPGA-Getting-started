module clock_divider #(parameter COUNTER=20)(input i_clock, output o_clock);

reg [$clog2(COUNTER-1):0] r_time_count = 0;
reg r_divided_clock = 1'b1;

always @(posedge i_clock) begin
    r_time_count <= r_time_count + 1;
    if(r_time_count == COUNTER) begin
        r_divided_clock <= !r_divided_clock;
        r_time_count <= 0;
    end
end

assign o_clock = r_divided_clock;

endmodule