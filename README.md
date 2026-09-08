Synchronous FIFO – Verilog HDL

Project Overview

This project implements a Synchronous FIFO (First-In First-Out) memory using Verilog HDL.

The FIFO stores 8-bit data and supports synchronous read and write operations using a common clock.

Specifications

Parameter	Value

Data Width	8 bits
FIFO Depth	8 entries
Memory	8 × 8-bit
Clock	Single synchronous clock
Reset	Synchronous reset
Status Flags	Full, Empty


Design Features

8-bit data input and output

8-entry FIFO memory

Read pointer and write pointer

4-bit occupancy counter

Full and empty flag generation

Synchronous reset

Prevents writing when FIFO is full

Prevents reading when FIFO is empty


Project Files

Synchronous-FIFO/
│
├── synchronousFIFO.v
├── tb.v
├── waveform.png
└── README.md

FIFO Operation

Write Operation

When wr_en is high and the FIFO is not full, the input data is stored in memory and the write pointer increments.

Read Operation

When rd_en is high and the FIFO is not empty, the stored data is read and the read pointer increments.

Status Flags

assign full  = (count == 4'd8);
assign empty = (count == 4'd0);

Verification

The testbench writes the following data sequence:

4C → 5C → 34 → 7C

The data is then read from the FIFO in the same order:

4C → 5C → 34 → 7C

The simulation waveform was analyzed to verify:

Clock operation

Reset operation

Write operation

Read operation

Data input and output

Read and write pointers

FIFO count

Full and empty flags


Tools Used

Verilog HDL

Ecironix Verilog Simulator

VCD waveform simulation

GitHub


Learning Outcomes

This project provided practical experience in:

Verilog RTL coding

Sequential logic design

Memory modeling

Counters and pointers

FIFO architecture

Testbench development

Simulation and waveform debugging

RTL verification


Author

B.Tech ECE | VLSI / Semiconductor Enthusiast
