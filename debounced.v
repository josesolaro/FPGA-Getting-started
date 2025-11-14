module debounced #(parameter DEBOUNCE_LIMIT = 20) (
    input i_clock,
    input i_switch,

    output reg o_filtered_switch
);
reg [$clog2(DEBOUNCE_LIMIT)-1:0] r_count = 0;
reg r_state = 1'b0;
always @(posedge i_clock) begin
    if( r_state != i_switch) begin
        r_count <= r_count + 1;
    end
    if(r_count == DEBOUNCE_LIMIT) begin
        r_state <= i_switch;
    end
    if(r_state == i_switch) begin
        r_count <= 0;
    end
    o_filtered_switch <= r_state;
end

endmodule