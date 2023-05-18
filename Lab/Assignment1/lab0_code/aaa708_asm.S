#include "aaa708.h"


.align 11

lab_el3_vector_table:


.org (lab_el3_vector_table + 0x000)
	b	lab_el3_Sync_Curr_SP0

.org (lab_el3_vector_table + 0x080)
	b	lab_el3_IRQ_Curr_SP0

.org (lab_el3_vector_table + 0x100)
	b	lab_el3_FIQ_Curr_SP0

.org (lab_el3_vector_table + 0x180)
	b	lab_el3_SError_Curr_SP0


.org (lab_el3_vector_table + 0x200)
	b	lab_el3_Sync_Curr_SPx

.org (lab_el3_vector_table + 0x280)
	b	lab_el3_IRQ_Curr_SPx

.org (lab_el3_vector_table + 0x300)
	b	lab_el3_FIQ_Curr_SPx

.org (lab_el3_vector_table + 0x380)
	b	lab_el3_SError_Curr_SPx


.org (lab_el3_vector_table + 0x400)
	b	lab_el3_Sync_Lower_64

.org (lab_el3_vector_table + 0x480)
	b	lab_el3_IRQ_Lower_64

.org (lab_el3_vector_table + 0x500)
	b	lab_el3_FIQ_Lower_64

.org (lab_el3_vector_table + 0x580)
	b	lab_el3_SError_Lower_64


.org (lab_el3_vector_table + 0x600)
	b	lab_el3_Sync_Lower_32

.org (lab_el3_vector_table + 0x680)
	b	lab_el3_IRQ_Lower_32

.org (lab_el3_vector_table + 0x700)
	b	lab_el3_FIQ_Lower_32

.org (lab_el3_vector_table + 0x780)
	b	lab_el3_SError_Lower_32


	.align 11

lab_el2_vector_table:

.org (lab_el2_vector_table + 0x000)
	b	lab_el2_Sync_Curr_SP0

.org (lab_el2_vector_table + 0x080)
	b	lab_el2_IRQ_Curr_SP0

.org (lab_el2_vector_table + 0x100)
	b	lab_el2_FIQ_Curr_SP0

.org (lab_el2_vector_table + 0x180)
	b	lab_el2_SError_Curr_SP0


.org (lab_el2_vector_table + 0x200)
	b	lab_el2_Sync_Curr_SPx

.org (lab_el2_vector_table + 0x280)
	b	lab_el2_IRQ_Curr_SPx

.org (lab_el2_vector_table + 0x300)
	b	lab_el2_FIQ_Curr_SPx

.org (lab_el2_vector_table + 0x380)
	b	lab_el2_SError_Curr_SPx


.org (lab_el2_vector_table + 0x400)
	b	lab_el2_Sync_Lower_64

.org (lab_el2_vector_table + 0x480)
	b	lab_el2_IRQ_Lower_64

.org (lab_el2_vector_table + 0x500)
	b	lab_el2_FIQ_Lower_64

.org (lab_el2_vector_table + 0x580)
	b	lab_el2_SError_Lower_64


.org (lab_el2_vector_table + 0x600)
	b	lab_el2_Sync_Lower_32

.org (lab_el2_vector_table + 0x680)
	b	lab_el2_IRQ_Lower_32

.org (lab_el2_vector_table + 0x700)
	b	lab_el2_FIQ_Lower_32

.org (lab_el2_vector_table + 0x780)
	b	lab_el2_SError_Lower_32


	.align 11

lab_el1_vector_table:

.org (lab_el1_vector_table + 0x000)
	b	lab_el1_Sync_Curr_SP0

.org (lab_el1_vector_table + 0x080)
	b	lab_el1_IRQ_Curr_SP0

.org (lab_el1_vector_table + 0x100)
	b	lab_el1_FIQ_Curr_SP0

.org (lab_el1_vector_table + 0x180)
	b	lab_el1_SError_Curr_SP0


.org (lab_el1_vector_table + 0x200)
	b	lab_el1_Sync_Curr_SPx

.org (lab_el1_vector_table + 0x280)
	b	lab_el1_IRQ_Curr_SPx

.org (lab_el1_vector_table + 0x300)
	b	lab_el1_FIQ_Curr_SPx

.org (lab_el1_vector_table + 0x380)
	b	lab_el1_SError_Curr_SPx


.org (lab_el1_vector_table + 0x400)
	b	lab_el1_Sync_Lower_64

.org (lab_el1_vector_table + 0x480)
	b	lab_el1_IRQ_Lower_64

.org (lab_el1_vector_table + 0x500)
	b	lab_el1_FIQ_Lower_64

.org (lab_el1_vector_table + 0x580)
	b	lab_el1_SError_Lower_64


.org (lab_el1_vector_table + 0x600)
	b	lab_el1_Sync_Lower_32

.org (lab_el1_vector_table + 0x680)
	b	lab_el1_IRQ_Lower_32

.org (lab_el1_vector_table + 0x700)
	b	lab_el1_FIQ_Lower_32

.org (lab_el1_vector_table + 0x780)
	b	lab_el1_SError_Lower_32


.global main
csd_reset:
main:

	// Conditional instructions in ARMv8
	cmp x0, #1
	csel x1, x2, x3, gt
	//


	// Generic Timer access (Spec looks not straightfoward. Leave it as a future work
	//mrs x0, CNTKCTL_EL1
	//orr x0, x0, #0x3ff
	//msr CNTKCTL_EL1, x0
	//
	//mrs x0, CNTFRQ_EL0
	//

	mrs	x3, RVBAR_EL3   // read RVBAR_el3 (reset vector base address register)

// Exception generated when executing the following insts
//	mrs	x2, RVBAR_EL2   // read RVBAR_el2 (reset vector base address register)
//	mrs	x1, RVBAR_EL1   // read RVBAR_el1 (reset vector base address register)

	/*Set vector table base address*/
	ldr	x1, =lab_el3_vector_table
	msr	VBAR_EL3,x1


	/*Set vector table base address*/
	ldr	x2, =lab_el2_vector_table
	msr	VBAR_EL2,x2


	/*Set vector table base address*/
	ldr	x3, =lab_el1_vector_table
	msr	VBAR_EL1,x3


	// ----------------------------------------------------
	// * Generic Interrupt Controller (GIC) setup for RTC (ID#59) interrupt generation
	// * RTC is one of SPIs (Shared Peripheral Interrupts)
	// * ID for RTC alarm interrupt is 58
	// * ID for RTC secnods interrupt is 59
	// ----------------------------------------------------


// ---------------------------
// Generic Interrupt Controller (GIC) setup - Begin
//

	// CPU Interface ID Register
	ldr x0, =GICC_IIDR
	ldr w3, [x0]

	// CPU Controller Type Register
	ldr x0, =GICD_TYPER
	ldr w3, [x0]

	// CPU Binary Pointer Register
	ldr x0, =GICC_BPR
	ldr w3, [x0]

	// Distributor Control Register
	ldr x0, =GICD_CTLR
	ldr w1, [x0]
	mov w2, #1       // Enable
	orr w1, w1, w2
	str w1, [x0]
	ldr w3, [x0]

	 // Interrupt Set-Enable Register 0
	ldr x0, =GICD_ISENABLER1
	ldr w1, [x0]
	mov w2, #1 << (59-32)   // Enable ID #59 (RTC seconds ID:59)
	orr w1, w1, w2
	str w1, [x0]
	ldr w3, [x0]

	// Interrupt Priority Register #7
	ldr x0, =GICD_PRIOR7
	ldr w1, [x0]
	mov w2, #1 << 24    // 2nd Highest: 1 for ID# #59 (RTC seconds ID:59)
	orr w1, w1, w2
	str w1, [x0]
	ldr w3, [x0]

	// CPU Interface Control Register
	ldr x0, =GICC_CTLR
	ldr w1, [x0]
	mov w2, #1        // Enable
	orr w1, w1, w2
	str w1, [x0]
	ldr w3, [x0]

 	// CPU Interface Interrupt Priority Mask Register
	ldr x0, =GICC_PMR
	ldr w1, [x0]
	mov w2, #0xFF     // Lowest
	orr w1, w1, w2
	str w1, [x0]
	ldr w3, [x0]

//
// Generic Interrupt Controller (GIC) setup - End
// ---------------------------

	// ----------------------------------------------------
	// Real-time Clock (RTC) setup for interrupt generation
	// ----------------------------------------------------

	ldr x0, =RTC_SET_TIME_WRITE
	mov x1, #0
	str w1, [x0]

	ldr x0, =RTC_SET_TIME_READ
	ldr w2, [x0]

	ldr x0, =RTC_CALIB_READ
	ldr w3, [x0]

	ldr x0, =RTC_INT_DIS
	mov x1, #0b00		// interrupt disable turned off
	str w1, [x0]

	ldr x0, =RTC_INT_EN
	mov x1, #0b11		// interrupt enable turned on
	str w1, [x0]

	ldr x0, =RTC_INT_MASK
	ldr w4, [x0]		// read interrupt mask status


	// Enable interrupt: Turn off I bit in CPSR
    msr DAIFClr, #0b0010


time_check:

	ldr x0, =RTC_CURRENT_TIME
	ldr w1, [x0]

	ldr x0, =RTC_INT_STATUS
	ldr w5, [x0]    // According to various trials, bit 0 is an interrupt to inform a new second
	mov x2, #1      // to clear interrupt
	str w2, [x0]
	ldr w6, [x0]    // just to check it is cleared.

	mov x2, #0x10000000
goback:
	subs x2, x2, #1
	bne goback
	b time_check

	// check if it goes to el3_sync_spx_handler
	svc #0

	// check if it goes to el3_sync_sp0_handler
	msr SPSel, #0
	svc #0

	// I believe there is NO way to directly change PSTATE exception level
	// I think the exception level change from EL3 to EL2 is done by "eret"
	//         after setting SPSR_EL3 and ELR_EL3

/*
	mov x0, #0
	msr CurrentEL, x0

	svc #0
*/
	//
	// According to the guideline in the application node
	// "bare-metal boot code for ARMv8-A Provessors Version 1.0
	//

	// 1. Initialize SCTLR_EL2 and HCR_EL2 to save values (?) before entering EL2
	mrs x1, SCTLR_EL2
	mrs x2, HCR_EL2

	mov x0, #0x0
	msr SCTLR_EL2, x0
	msr HCR_EL2, x0

	// 2. Determine the EL2 execution state
	mrs x0, SCR_EL3
	orr x0, x0, #1 << 10 // RW: EL2 execution state is AArch64
	orr x0, x0, #1 << 0  // NS: EL1 is non-secure world
	msr SCR_EL3, x0

	mov x0, #0b01001  // DAIF=0000, M[4:0]=01001 (EL2h (?) must match SCR_EL3.RW)
	msr SPSR_EL3, x0

	adr x1, el2_entry
	msr ELR_EL3, x1

	eret


forever:
	nop
	b forever


el2_entry:
	mov x0, #0x0
	msr SCTLR_EL1, x0  // Initialize SCTLR_EL1 before entering EL1

	mrs x0, HCR_EL2
	orr x0, x0, #1<<31 // RW=1: EL1 execution state is AArch64
//	bic x0, x0, #1<<31 // RW=0: EL1 execution state is AArch32
	msr HCR_EL2, x0

	mov x0, #0b00101   // DAIF=0000, M[4:0]=00101 (EL1h (?) must match HCR_EL2.RW
//	mov x0, #0b10011   // DAIF=0000, M[4:0]=00011 (EL1h (?) must match HCR_EL2.RW
	msr SPSR_EL2, x0

	adr x0, el1_entry
//	adr x0, el1_entry_arm32
	msr ELR_EL2, x0

	eret

/*
el1_entry:
	mov x0, #0x0   // DAIF=0000, M[4:0]=00000
	msr SPSR_EL1, x0

	adr x0, el0_entry
	msr ELR_EL1, x0

	eret
*/

el1_entry:
	mov x0, #0b10000   // DAIF=0000, M[4:0]=10000 (User mode)
	msr SPSR_EL1, x0

	adr x0, el0_entry_arm32
	msr ELR_EL1, x0

	eret

el1_entry_arm32:
.incbin "../src/arm32_test.bin"



el0_entry:
	nop
	nop
	svc #0


el0_entry_arm32:
.incbin "../src/arm32_test.bin"


// ------------------------- //
// --- Exception Level 3 --- //
// ------------------------- //

lab_el3_Sync_Curr_SP0:
	eret
	b .

lab_el3_IRQ_Curr_SP0:
	b .

lab_el3_FIQ_Curr_SP0:
	b .

lab_el3_SError_Curr_SP0:
	b .

// ----------------- //

lab_el3_Sync_Curr_SPx:
	eret
	b .

lab_el3_IRQ_Curr_SPx:
	b .

lab_el3_FIQ_Curr_SPx:
	b .

lab_el3_SError_Curr_SPx:
	b .

// ----------------- //

lab_el3_Sync_Lower_64:
	b .

lab_el3_IRQ_Lower_64:
	b .

lab_el3_FIQ_Lower_64:
	b .

lab_el3_SError_Lower_64:
	b .

// ----------------- //

lab_el3_Sync_Lower_32:
	b .

lab_el3_IRQ_Lower_32:
	b .

lab_el3_FIQ_Lower_32:
	b .

lab_el3_SError_Lower_32:
	b .


// ------------------------- //
// --- Exception Level 2 --- //
// ------------------------- //

lab_el2_Sync_Curr_SP0:
	b .

lab_el2_IRQ_Curr_SP0:
	b .

lab_el2_FIQ_Curr_SP0:
	b .

lab_el2_SError_Curr_SP0:
	b .

// ----------------- //

lab_el2_Sync_Curr_SPx:
	b .

lab_el2_IRQ_Curr_SPx:
	b .

lab_el2_FIQ_Curr_SPx:
	b .

lab_el2_SError_Curr_SPx:
	b .

// ----------------- //

lab_el2_Sync_Lower_64:
	b .

lab_el2_IRQ_Lower_64:
	b .

lab_el2_FIQ_Lower_64:
	b .

lab_el2_SError_Lower_64:
	b .

// ----------------- //

lab_el2_Sync_Lower_32:
	b .

lab_el2_IRQ_Lower_32:
	b .

lab_el2_FIQ_Lower_32:
	b .

lab_el2_SError_Lower_32:
	b .


// ------------------------- //
// --- Exception Level 1 --- //
// ------------------------- //

lab_el1_Sync_Curr_SP0:
	b .

lab_el1_IRQ_Curr_SP0:
	b .

lab_el1_FIQ_Curr_SP0:
	b .

lab_el1_SError_Curr_SP0:
	b .

// ----------------- //

lab_el1_Sync_Curr_SPx:
	b .

lab_el1_IRQ_Curr_SPx:
	b .

lab_el1_FIQ_Curr_SPx:
	b .

lab_el1_SError_Curr_SPx:
	b .

// ----------------- //

lab_el1_Sync_Lower_64:
	b .

lab_el1_IRQ_Lower_64:
	b .

lab_el1_FIQ_Lower_64:
	b .

lab_el1_SError_Lower_64:
	b .

// ----------------- //

lab_el1_Sync_Lower_32:
	b .

lab_el1_IRQ_Lower_32:
	b .

lab_el1_FIQ_Lower_32:
	b .

lab_el1_SError_Lower_32:
	b .


.data
.align 4

src:
	.word  1,  2,  3,  4,  5,  6,  7,  8
	.word 11, 12, 13, 14, 15, 16, 17, 18

dst:
	.space 16  // allocate memory for 16 words


// Normal Interrupt Service Routine
csd_irq:
	b .
