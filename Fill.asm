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

	// Put your code here.
	(LOOP)
	@SCREEN // refers to memory location RAM[16384]
	D=A //puts the address of that location into D 
	@R0 // accesses Register0
	M=D //stores that address into R0. so R0 is currently 16384

	(SCREENLOOP)
	@KBD // refers to memory location RAM[24576]
	D=M // puts the contents of that register into D

	@WHITE
	D			; JEQ //JUMP TO WHITE IF THE CONTENTS OF THAT REGISTER is 0. NO KEY WAS PRESSED (D=0)

	(BLACK) //else make the screen go black
	@R0 // it's accessing R0 again which is 16384
	A=M // it's taking the address of R0 and also making M= the address of R0
	M=-1 // we set M to -1 bc now M's current value is the address. Also -1 is the binary representation of 1111-1111-1111-1111 which sets the 16 pixels to black
	@END
	0			;JEQ //jump to END

	(WHITE)
	@R0
	A=M
	M=0 // we set M to 0 which is the binary representation of 0000-0000-0000-0000 which sets the 16 pixels to white

	(END)
	@R0 
	M=M+1 // increments the register for the limitations of the screen RAM[16384, 24575]
	D=M // stores that value into D
	@KBD // accesses memory location RAM[24576]
	D=D-A // takes 16384=+1 and subtracts it from 24576. It's -8191. As it increments it'll get closer to 0. 
	@SCREENLOOP
	D			;JNE // here it'll jump to SCREENLOOP if not = 0. Overall, we've only made the first row black
	@LOOP
	D			;JEQ // here it goes back to the LOOP (?)

	@R0 
	D=M
	@KBD
	D=D-A
	@SCREENLOOP
	D			;JNE
	@LOOP
	D			;JEQ

	
	@LOOP
	0			;JEQ //infinite loop
	
	
	
