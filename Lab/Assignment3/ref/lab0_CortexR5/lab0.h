// GPIO Bank0 registers
#define GPIO_BANK0_BASE			0xFF0A0000
#define GPIO_BANK0_DATA			GPIO_BANK0_BASE + 0x40
#define GPIO_BANK0_DIRM			GPIO_BANK0_BASE + 0x204   // input or output
#define GPIO_BANK0_OEN			GPIO_BANK0_BASE + 0x208   // output enable if configured as output
#define GPIO_BANK0_DATA_RO		GPIO_BANK0_BASE + 0x60


// Real-time Clock (RTC) registers

#define RTC_BASE				0xFFA60000
#define RTC_SET_TIME_WRITE		RTC_BASE + 0x0
#define RTC_SET_TIME_READ		RTC_BASE + 0x4
#define RTC_CALIB_WRITE			RTC_BASE + 0x8
#define RTC_CALIB_READ			RTC_BASE + 0xC
#define RTC_CURRENT_TIME		RTC_BASE + 0x10
#define RTC_CURRENT_TICK		RTC_BASE + 0x14
#define RTC_ALARM				RTC_BASE + 0x18
#define RTC_INT_STATUS			RTC_BASE + 0x20
#define RTC_INT_MASK			RTC_BASE + 0x24
#define RTC_INT_EN				RTC_BASE + 0x28
#define RTC_INT_DIS				RTC_BASE + 0x2C
#define RTC_ADDR_ERROR			RTC_BASE + 0x30


// Generic Interrupt Controller (GIC) registers

#define GICD_BASE	      	0xF9000000         // Distributor Base Address
#define GICD_CTLR	      	GICD_BASE + 0x0    // Distributor Control Register
#define GICD_TYPER	 		GICD_BASE + 0x4    // Interrupt Controller Type Register
#define GICD_IGROUP0	   	GICD_BASE + 0x80   // Interrupt Group Register
#define GICD_ISENABLER0		GICD_BASE + 0x100  // Interrupt Set-Enable Register 0
#define GICD_ISENABLER1		GICD_BASE + 0x104  // Interrupt Set-Enable Register 1
#define GICD_ISPENDR0		GICD_BASE + 0x200  // Interrupt Set-Pending Register 0
#define GICD_ICACTIVE0		GICD_BASE + 0x380  // Interrupt Clear-Active 0
#define GICD_ICACTIVE1		GICD_BASE + 0x384  // Interrupt Clear-Active 1
#define GICD_ICACTIVE2		GICD_BASE + 0x388  // Interrupt Clear-Active 2
#define GICD_ICACTIVE3		GICD_BASE + 0x38c  // Interrupt Clear-Active 3
#define GICD_ICACTIVE4		GICD_BASE + 0x390  // Interrupt Clear-Active 4
#define GICD_ICACTIVE5		GICD_BASE + 0x394  // Interrupt Clear-Active 5
#define GICD_ICACTIVE6		GICD_BASE + 0x398  // Interrupt Clear-Active 6
#define GICD_ICACTIVE7		GICD_BASE + 0x39c  // Interrupt Clear-Active 7
#define GICD_PRIOR0			GICD_BASE + 0x400  // Interrupt Priority Register 0
#define GICD_PRIOR7			GICD_PRIOR0 + 4*7  // Interrupt Priority Register 7
#define GICD_PRIOR14		GICD_PRIOR0 + 4*14  // Interrupt Priority Register 14
#define GICD_SGIR	  	   	GICD_BASE + 0xF00  // Software Generated Interrupt Register
#define GICD_SPENDSGIR0		GICD_BASE + 0xF20  // SGI Set-Pending Register 0


#define GICC_CTLR   		0xF9002000        // CPU Interface Control Register
#define GICC_PMR	    	GICC_CTLR + 0x4   // CPU Interface Priority Mask Register
#define GICC_BPR	    	GICC_CTLR + 0x8   // CPU Binary Pointer Register
#define GICC_IAR	    	GICC_CTLR + 0xC   // CPU Interface Ack Register
#define GICC_EOIR	    	GICC_CTLR + 0x10  // CPU Interface End of Interrupt Register
#define GICC_IIDR	    	GICC_CTLR + 0xFC  // CPU Interface Identification Register
