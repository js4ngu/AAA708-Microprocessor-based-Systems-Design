#include <stdio.h>

int main(void){
	int i, j, min, index, temp;
	int array[10] = {1, 10, 5, 8, 7 , 6, 4, 3, 2, 9};

	for(i = 0; i<10; i++){         
		min = 100;                 
		for(j = i; j < 10; j++){   
			if( min> array[j]) {    //최소값 탐색
				min = array[j];
				index = j;          //최소값 위치
			}
		}
		temp = array[i];            
		array[i] = array[index];
		array[index] = temp;        //최소값과 현재 위치를 swap
	}
}




	//test
	lsl r8, r8, #2
	add r1, r1, r8		//[r1] == array[i]
	// lsl r7, r7, #2
	// add r1, r1, r7		//[r1] == array[i]
	// temp = array[i];
	ldr r12, [r1]


	