#include <stdio.h>
#include "sleep.h"
#include "lab0.h"



int csd_main(){
	unsigned char *sw;

	sw = (unsigned *) GPIO_BANK0_DATA;
	if(*sw == 0x00) usleep(100000);
	else  usleep(500000);

    return 0;
}