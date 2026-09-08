module synchronousFIFO(
    input clk,
    input reset,
    input [7:0] data_in,
    input wr_en,
    input rd_en,
    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] mem [0:7];
reg [2:0] rd_ptr;
reg [2:0] wr_ptr;
reg [3:0] count;

assign full  = (count == 4'd8);
assign empty = (count == 4'd0);

always @(posedge clk) begin

    if (reset) begin
        wr_ptr   <= 3'd0;
        rd_ptr   <= 3'd0;
        count    <= 4'd0;
        data_out <= 8'd0;
    end

    else begin

        // Write operation
        if (wr_en && !full) begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 3'd1;
        end

        // Read operation
        if (rd_en && !empty) begin
            data_out <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 3'd1;
        end

        // FIFO count
        case ({wr_en && !full, rd_en && !empty})

            2'b00: count <= count;             // No operation
            2'b01: count <= count - 4'd1;      // Read only
            2'b10: count <= count + 4'd1;      // Write only
            2'b11: count <= count;             // Read and write

        endcase

    end

end

endmodule
