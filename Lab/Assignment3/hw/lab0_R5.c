/*
 * lab0_cortexR5.c
 *
 *  Created on: Sep 9, 2018
 *      Author: suhtw
 */

#include "lab0.h"
#include "sleep.h"

#define MIO23_PIN_MASK 0x00800000

int aes_main() {
    volatile unsigned int *gpio_data = (unsigned int *)0xFF0A0060;
    int button_value;

    button_value = (*gpio_data & MIO23_PIN_MASK) ? 1 : 0;

    if (button_value == 0) usleep(100000);
    else usleep(500000);

    return 0;

}
