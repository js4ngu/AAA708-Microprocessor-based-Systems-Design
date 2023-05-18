
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
	mov r1, #1
	mov r1, r1, lsl #23 // 0x0080_0000
	mvn r1, r1          // 0xFF7F_FFFF

	ldr r0, =GPIO_BANK0_DIRM
	str r1, [r0]    // Direction: Output

	ldr r0, =GPIO_BANK0_OEN
	str r1, [r0]    // Output enabled

loop:
	//
	ldr r0, =GPIO_BANK0_DATA
	mov r1, #0b0000 << 17
	str r1, [r0]

	bl button_input
	bl aes_main

	//
	ldr r0, =GPIO_BANK0_DATA
	mov r1, #0b1000 << 17
	str r1, [r0]

	bl button_input
	bl aes_main

	//
	ldr r0, =GPIO_BANK0_DATA
	mov r1, #0b0100 << 17
	str r1, [r0]

	bl button_input
	bl aes_main

	//
	ldr r0, =GPIO_BANK0_DATA
	mov r1, #0b0010 << 17
	str r1, [r0]

	bl button_input
	bl aes_main

	//
	ldr r0, =GPIO_BANK0_DATA
	mov r1, #0b0001 << 17
	str r1, [r0]

	bl button_input
	bl aes_main

	b loop


button_input:
	ldr r0, =GPIO_BANK0_DATA_RO
	ldr r3, [r0]
//	b button_input

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
