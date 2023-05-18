
#include "lab0.h"

.extern aes_main

.align 8

.global main
aes_reset:
main:

	mov x0, #10
	mov x1, #3
	add x0, x0, x1

	ldr x0, =src
	ldr x1, =dst
	mov x2, #16

loop:
	ldr w3, [x0], #4   // load a word into r3 and upate r0 (= r0 + 4)
	str w3, [x1], #4   // store the word to memory and upate r1 (= r1 + 4)
	subs x2, x2, #1
	bne  loop

	mov x1, #0
	mvn x1, x1
	ldr x0, =GPIO_BANK0_DIRM0   
	str w1, [x0]    // Direction: Output

	ldr x0, =GPIO_BANK0_OEN0
	str w1, [x0]    // Output enabled

	ldr x0, =GPIO_BANK0_DATA0
	mov x1, #0b1010 << 17
	str w1, [x0]

	bl aes_main

forever:
	nop
	b forever


.data
.align 4

src:
	.word  1,  2,  3,  4,  5,  6,  7,  8
	.word 11, 12, 13, 14, 15, 16, 17, 18

dst:
	.space 16  // allocate memory for 16 words


// Normal Interrupt Service Routine
aes_irq:
	b .
