// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R0
D=M     // D = RAM[0]
@n
M=D     // n = D

@R1
D=M     // D = RAM[1]
@add
M=D     // add = D

@i
M=1     // i = 1

@sum
M=0     // sum = 0

(LOOP)
    @i
    D=M
    @n
    D=D-M
    @STOP
    D;JGT //   is i - n > 0? if so, goto STOP

    @sum
    D=M
    @add
    D=D+M
    @sum
    M=D   //   sum = sum + add

    @i
    M=M+1 //   i = i + 1
    
    @LOOP
    0;JMP //   goto LOOP

(STOP)
    @sum
    D=M
    @R2
    M=D  //   R2 = sum

(END)
    @END
    0;JMP 
    
    // infinite to protect against
    // NOP slides