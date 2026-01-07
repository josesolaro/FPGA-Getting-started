
module shift_register_main(
    input i_clock,
    input i_switch,
    output o_led0,
    output o_led1,
    output o_led2,
    output o_led3
);

wire w_divided_clock;
wire w_debounced_switch;
clock_divider #(.COUNTER(5000000)) 
    clock_divider_int(
        .i_clock(i_clock), 
        .o_clock(w_divided_clock));

debounced #(.DEBOUNCE_LIMIT(5000000)) 
    debounced_int(
        .i_clock(i_clock), .i_switch(i_switch), 
        .o_filtered_switch(w_debounced_switch));

shifter shifter_inst(
    .i_clock(w_divided_clock), .i_switch(w_debounced_switch),
    .o_led0(o_led0),.o_led1(o_led1),.o_led2(o_led2),.o_led3(o_led3));
endmodule