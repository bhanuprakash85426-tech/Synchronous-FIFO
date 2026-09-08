Synchronous FIFO – Verilog HDL

📌 Project Overview

This project implements a Synchronous FIFO (First-In First-Out) memory using Verilog HDL.

The FIFO stores 8-bit data and supports synchronous write and read operations controlled by a common clock.

⚙️ Specifications

Parameter	Value

Data Width	8 bits
FIFO Depth	8 entries
Memory	8 × 8-bit
Clock	Single synchronous clock
Reset	Synchronous reset
Read/Write	Independent enable signals
Status Flags	Full, Empty


🧩 Design Features

8-bit data input and output

8-entry FIFO memory

Read pointer and write pointer

4-bit occupancy counter

full flag generation

empty flag generation

Synchronous reset

Prevents writing when FIFO is full

Prevents reading when FIFO is empty


📁 Project Files

Synchronous-FIFO/
│
├── synchronousFIFO.v    # FIFO RTL design
├── tb.v                 # Verilog testbench
├── waveform.png         # Simulation waveform
└── README.md            # Project documentation

🔄 FIFO Operation

Write

When:

wr_en = 1
full  = 0

data is written into the FIFO memory and the write pointer increments.

Read

When:

rd_en = 1
empty = 0

data is read from the FIFO and the read pointer increments.

Status

full  = (count == 8);
empty = (count == 0);

🧪 Verification

The testbench verifies the FIFO using the following data sequence:

Write:
4C → 5C → 34 → 7C

Read:
4C → 5C → 34 → 7C

This confirms the FIFO property: First In, First Out.

The simulation waveform was analyzed to verify:

Clock operation

Reset operation

Write enable

Read enable

Data input/output

Read/write pointers

FIFO count

Full and empty flags


🛠️ Tools Used

Verilog HDL

Ecironix Verilog Simulator

VCD waveform simulation

GitHub


🎯 Learning Outcomes

Through this project, I practiced:

Verilog RTL coding

Sequential logic design

Memory modeling

Counters and pointers

FIFO architecture

Testbench development

Simulation and waveform debugging

RTL verification


👨‍💻 Author

B.Tech ECE | VLSI / Semiconductor Enthusiast
