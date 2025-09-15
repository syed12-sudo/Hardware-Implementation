# Edge-Optimized CNNs: A Co-Designed Software-Hardware Framework for Lightweight Deep Learning

## Overview: Convolution Processing Elements (PE) 
This repository contains Verilog modules implementing 1D and 2D Processing Elements (PEs) for convolution operations in CNNs. The framework supports both multiplier-based and barrel-shifter-based designs for efficient computation, covering kernel sizes of 3×3 and 5×5.

All the models are pretrained and loaded from memory. We perform experimentation on FPGA Virtex-7 (xc7vx485t) using Verilog HDL in Xilinx Vivado Design Suite 2018.3, synthesizing the design for hardware evaluation.
### USAGE 

Each module can be instantiated and connected according to the kernel size and layer type (NP-layer or P-layer).

Multipliers are used in dense layers (NP-layers), while barrel shifters are applied for sparse/quantized layers (P-layers) to reduce hardware resource utilization.

Output pixels are generated across multiple clock cycles based on kernel size.

### Modules Overview

| Module                              | Description                                                                                                                  |
| ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| **D1\_PE.v**                        | 1D Processing Element (1D-PE) using multipliers for convolution. Generates N output pixels in N clock cycles for NP-layers.  |
| **D2\_PE\_Multiplier\_3\_Kernel.v** | 2D-PE design for 3×3 kernels. Combines three D1-PE units in parallel for computation and data-level parallelism.            |
| **D1\_PE\_5K.v**                    | 1D-PE variant for 5×5 kernels, performing 5 parallel MAC operations per row.                                                 |
| **D2\_PE\_Mult\_5\_Kernel.v**       | 2D-PE for 5×5 kernels using five D1-PE\_5K units for high-throughput convolution.                                            |
| **PE\_BS.v**                        | Barrel-shifter-based 1D-PE for 3×3 kernels, replacing multipliers with fast shift operations when weights are powers of two. |
| **D2\_PE\_Shifter\_3\_kernel.v**    | 2D-PE design using three PE\_BS units for 3×3 kernels, performing shift-based convolution efficiently.                       |
| **PE\_BS\_5K.v**                    | Barrel-shifter-based PE for 5×5 kernels, extending shift-based convolution to larger kernel sizes.                           |
| **D2\_PE\_Shifter\_5\_kernel.v**    | 2D-PE for 5×5 kernels using five PE\_BS\_5K units, enabling scalable shift-based convolution.                                |


### Input/Output

**Input:** Feature map rows with associated kernel weights (3×3 or 5×5), and a selection signal for multiplexing.

**Output:** Convolved pixels after MAC (multiplier-based) or shift (barrel-shifter-based) operations.

#### Notes:

- For a 3×3 kernel, each 1D-PE produces 3 intermediate outputs per clock cycle.

- For a 5×5 kernel, each 1D-PE produces 5 outputs per cycle.

- 2D-PE modules accumulate results across multiple 1D-PE units to generate full row outputs.
