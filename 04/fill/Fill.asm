// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//  Put your code here.
    @SCREEN
    D = A
    @addr
    M = D

(DETEC_KBD)
    @n
    M = 0   // n = 0
    @KBD
    D = M
    @SCREEN_BLACK
    D; JGT  // if KBD > 0 goto SCREEN_BLACK
    @n
    M = 0   // n = 0
    @SCREEN_WHITE
    D; JEQ  //if KBD == 0 goto SCREEN_WHITE
    @DETEC_KBD
    0; JMP

(SCREEN_BLACK)
    @n
    D = M
    @8191   // 512 pixel * 256 rows // 16 - 1 = 8191
    D = D - A
    @DETEC_KBD
    D; JGT  // if n > 8191 goto END
    @addr
    D = M
    @n
    D = D + M
    A = D
    M = -1  // MEM[addr + n] = -1
    @n
    M = M + 1   // n++
    @SCREEN_BLACK   // goto SCREEN_BLACK
    0; JMP

(SCREEN_WHITE)
    @n
    D = M
    @8191   // 512 pixel * 256 rows // 16 - 1 = 8191
    D = D - A
    @DETEC_KBD
    D; JGT  // if n > 8191 goto END
    @addr
    D = M
    @n
    D = D + M
    A = D
    M = 0   // MEM[addr + n] = 0
    @n
    M = M + 1   // n++
    @SCREEN_WHITE   // goto SCREEN_WHITE
    0; JMP