# 🔧 Computer Architecture - MIPS Assembly Exploration

*Low-level processor insights through MIPS assembly programming and architectural simulations*

---

## 🖥️ Overview
This repository contains implementations from my Computer Architecture course, focusing on **MIPS assembly programming** and **hardware/software interface design**. These projects demonstrate my understanding of processor operations at the instruction level and computer organization fundamentals.

**Core Technologies**  
![MIPS](https://img.shields.io/badge/Assembly-MIPS32-green)
![Tools](https://img.shields.io/badge/Tools-MARS%20|%20QtSpim%20|%20Logisim-blueviolet)
![Concepts](https://img.shields.io/badge/Concepts-Pipelining%20|%20Cache%20Hierarchy%20|%20Hazards-orange)


## 🛠️ Technical Skills Demonstrated

### **MIPS Assembly Mastery**
```mips
# Matrix multiplication kernel
mul $t0, $a0, 4     # Byte offset calculation
lw $t1, 0($s1)      # Load matrix A element
lw $t2, 0($s2)      # Load matrix B element
mul $t3, $t1, $t2   # Multiply elements
add $s0, $s0, $t3   # Accumulate result
Architectural Concepts
text
Copy
1. Instruction Formats    → R-type | I-type | J-type
2. Memory Hierarchy       → Registers ↔ Cache ↔ RAM
3. Parallelism            → Pipeline Hazards & Bypassing
4. Number Systems         → Two's Complement | IEEE 754
🚀 Running Projects
Using MARS Simulator
Download MARS from Missouri State University

Open .asm file in MARS

Assemble (F3) → Run (F5)

Command Line (QtSpim)
bash
Copy
spim -file matrix_mult.s
📈 Key Achievements
Optimization: Reduced matrix multiplication cycles by 68% using register blocking

Debugging: Resolved 15+ pipeline hazard scenarios

Precision: Implemented IEEE 754 floating-point arithmetic in assembly

Analysis: Wrote 50+ page architecture design report

📚 Course Concepts Applied
Datapath Design: ALU control signals

Memory Management: Virtual → Physical address translation

Performance Analysis: AMAT (Average Memory Access Time)

Parallel Processing: SIMD-inspired optimizations

I/O Systems: Memory-mapped device handling

🖼️ Sample Pipeline Diagram
Copy
     Clock Cycle → 1   2   3   4   5   6   7
    ------------------------------------------
    Instruction 1 | IF | ID | EX | MEM| WB |
    Instruction 2 |    | IF | ID | EX | MEM| WB
    Instruction 3 |    |    | IF | ID | EX | MEM| WB
📞 Contact
GitHub
Email
