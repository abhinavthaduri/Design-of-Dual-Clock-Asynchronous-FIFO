#  Need of Asynchronous-FIFO
◦ Asynchronous First-In-First-Out (FIFO) is a widely used design technique in  when dealing 
  with Clock Domain Crossing (CDC) issues.
◦ CDC refers to the transfer of data signals between different clock domains, which can result in metastability, data loss, 
  or other issues.
#   Design of Asynchronous-FIFO 
◦ Designed an Asynchronus FIFO using Verilog and simulated using Modelsim-Altera tool.
◦ Used Gray Code encoding for inter-clock domain control data transfer to avoid multi-bit signal transitions.
◦ Implemented Two Flip-Flop Synchronizer to avoid metastability issues in CDC

