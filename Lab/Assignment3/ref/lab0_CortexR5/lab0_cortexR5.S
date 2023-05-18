
#include "lab0.h"

.extern aes_main

.align 8

// Our interrupt vector table
aes_entry:
	b aes_reset
	b .
	b .
	b .
	b .
	b .
	b aes_irq
	b .

.global main
aes_reset:
main:

	mov r0, #10
	mov r1, #3
	add r0, r0, r1

	ldr r0, =src
	ldr r1, =dst
	mov r2, #16

loop:
	ldr r3, [r0], #4   // load a word into r3 and upate r0 (= r0 + 4)
	str r3, [r1], #4   // store the word to memory and upate r1 (= r1 + 4)
	subs r2, r2, #1
	bne  loop

	mov r1, #1
	mov r1, r1, lsl #23 // 0x0080_0000
	mvn r1, r1          // 0xFF7F_FFFF

// Prof. Suh:
// For LEDs and Button, check out PCB schematic
// to figure out the GPIO connections to Zynq-Ultrascale+

	ldr r0, =GPIO_BANK0_DIRM
	str r1, [r0]    // Direction: Output

	ldr r0, =GPIO_BANK0_OEN
	str r1, [r0]    // Output enabled

	ldr r0, =GPIO_BANK0_DATA
	mov r1, #0b1010 << 17
	str r1, [r0]

button_input:
	ldr r0, =GPIO_BANK0_DATA_RO
	ldr r3, [r0]
	b button_input
//
// Prof. Suh:
// * The code below is working fine as well.
// (it is checking the status of SW1):
// * Check either DATA register or DATA_RO register
//
//button_input:
//	ldr r0, =GPIO_BANK0_DATA
//	ldr r3, [r0]
//	b button_input

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
