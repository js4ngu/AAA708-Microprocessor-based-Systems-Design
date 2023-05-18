#include "lab0.h"
.extern aes_main
.align 8
.global main

main:
	ldr r0, =src	//x0 = *src
	ldr r1, =dst	//x1 = *dst ofset addr
	mov r2, #32		//cpy arg

					//r6 array[]
					//r7 array arg
	mov r8 , #0		//r8  = i
	mov r9, #0		//r9 = j
	mov r10, #0		//r10 = min
	mov r11, #0		//r11 = indxs
	mov r12, #0		//r12 = temp

copy:
	ldr r3, [r0], #4   // load a word into r3 and upate r0 (= r0 + 4)
	str r3, [r1], #4   // store the word to memory and upate r1 (= r1 + 4)
	subs r2, r2, #1
	bne  copy

loop1:
	cmp r8, #32      //for(i = 0; i<10; i++)
	mov r9, r8		//r9 = j
	mov r10, #100	 //min = 100
	bge forever      //if i >= 16, exit the loop

	ldr r1, =dst			 //x1 = *dst ofset addr
	lsl r7, r8, #2
	add r1, r1, r7		//[r1] == array[i]

loop2:
	cmp r9, #32      		// compare j to 10
	bge end_loop2    		// if j >= 10, exit the loop

	ldr r6, [r1], #4		 // r6 = array[j]

	//이하 검증안됨
	cmp r10, r6				// array[j] > min
	blge min_update

	add r9, r9, #1   // increment j by 1
	b loop2          // go back to the start of loop2

min_update:
	mov r10, r6	//min = array[j] -> r12에 r10이 아니라 r6를 넣어야함
	mov r11, r9	//inex = j
	bx lr

end_loop2:
	// access arrayp[i]
	ldr r1, =dst	//x1 = *dst ofset addr
	lsl r7, r8, #2
	add r1, r1, r7		//[r1] == array[i]

	// temp = array[i];
	ldr r12, [r1]

	// access array[index]
	ldr r2, =dst	//x1 = *dst ofset addr
	lsl r11, r11, #2
	add r2, r2, r11		//[r2] == array[index]

	// array[i] = array[index];
	ldr r5, [r2]
	str r5, [r1]

	// array[index] = temp;        //최소값과 현재 위치를 swap
	str r12, [r2]

	add r8, r8, #1   // increment i by 1
	b loop1          // go back to the start of loop1

forever:
	ldr r1, =dst
	b forever


.data
.align 4

src:
	.word 2, 0, -7, -1, 3, 8, -4, 10
	.word -9, -16, 15, 13, 1, 4, -3, 14
	.word -8, -10, -15, 6, -13, -5, 9, 12
	.word -11, -14, -6, 11, 5, 7, -2, -12

dst:
	.space 16  // allocate memory for 16 words


// Normal Interrupt Service Routine
aes_irq:
	b .

//과제완료
