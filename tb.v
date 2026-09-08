module tb;

reg clk;
reg reset;
reg [7:0] data_in;
reg wr_en;
reg rd_en;

wire [7:0] data_out;
wire full;
wire empty;

synchronousFIFO uut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// Clock generation
initial begin
    clk = 0;

    forever #5 clk = ~clk;
end

// Waveform dump
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
end

// Test
initial begin

    // Initial values
    reset   = 1;
    wr_en   = 0;
    rd_en   = 0;
    data_in = 8'h00;

    // Reset
    #20;
    reset = 0;

    // -------------------------
    // WRITE DATA
    // -------------------------

    wr_en = 1;

    data_in = 8'h4C;
    #10;

    data_in = 8'h5C;
    #10;

    data_in = 8'h34;
    #10;

    data_in = 8'h7C;
    #10;

    wr_en = 0;

    // -------------------------
    // READ DATA
    // -------------------------

    #10;

    rd_en = 1;

    #10;
    #10;
    #10;
    #10;

    rd_en = 0;

    // Wait
    #20;

    $finish;

end

endmodule
