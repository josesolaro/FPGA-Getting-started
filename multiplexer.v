module multiplexer(
    input i_data0, input i_data1, input i_data2, input i_data3,
    input i_sel0, input i_sel1,
    output o
);

assign o = i_data0 && (!i_sel0 && !i_sel1) ||
            i_data1 && (i_sel0 && !i_sel1) ||
            i_data2 && (!i_sel0 && i_sel1) ||
            i_data3 && (i_sel0 && i_sel1);

endmodule