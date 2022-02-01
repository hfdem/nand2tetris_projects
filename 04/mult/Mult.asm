// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

//     i = 1
//     value = R0
//     n = R1
//     sum = 0
//     R2 = 0
// LOOP:
//     if i > n goto STOP
//     sum = sum + value
//     i++ 
//     goto LOOP
// STOP:
//     R2 = sum

// Put your code here.
    @i
    M = 1
    @R0
    D = M
    @value
    M = D
    @R1
    D = M
    @n
    M = D
    @sum
    M = 0
    @R2
    M = 0

(LOOP)
    @i
    D = M
    @n
    D = D - M
    @STOP
    D; JGT  // if i > n goto STOP
    @sum
    D = M
    @value
    D = D + M
    @sum
    M = D   // sum = sum + value
    @i
    M = M + 1   // i++
    @LOOP
    0; JMP

(STOP)
    @sum
    D = M
    @R2
    M = D   // R2 = sum

(END)
    @END
    0; JMP