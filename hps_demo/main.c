#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"
#include "math.h"
#include "func.h"
#include <time.h>

#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

//#define MAT_DIM 50
//#define LAYER 1

int32_t MAT_DIM   = 50;
int32_t COL_NUM[LAYER+1] = {784,50,50,50,10}; 	//last one dummy element as the last one
//int32_t COL_NUM[LAYER+1] = {784,50};
int32_t Trans_num = 13; // ceil((MAT_DIM+1)/4)
int32_t i_Trans_num = 50; //MAT_DIM/2



int main() {

	void *virtual_base;
	int fd;
	//int led_mask;
	//void *h2p_lw_led_addr;
    //void *h2p_lw_botton_addr;
    void *nn_wrapper_addr;

    int layer = 1;
	
	clock_t start_time;

	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}
	
	//h2p_lw_led_addr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	//h2p_lw_botton_addr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + BUTTON_PIO_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
    nn_wrapper_addr = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + NN_WRAPPER_0_BASE ) & ( unsigned long)( HW_REGS_MASK ) );	

	// toggle the LEDs a bit
	//led_mask = 0x0A + (0x01 << 6);
    // control led
	//*(uint32_t *)h2p_lw_led_addr = led_mask; 



	/////////////////////////////////////////////////////////////////////////////////////
	//Step.1
  	//MATRIX initialize and READ MATRIX
  	uint8_t ***MAT;//layer
  	MAT = get_weight(MAT,COL_NUM,MAT_DIM);

  	//Step.2
  	//VECTOR initialize and READ MATRIX
  	uint8_t *iniVEC;
	int itermax = 10;
	uint8_t *ARGMAX_V;
	ARGMAX_V = (uint8_t*)malloc (sizeof(uint8_t*)*itermax);
	int iteration = 1;
	//while(iteration<=itermax){
	while(1){
		char fileName[20] = "bin/data/";
		char keyin[5];
		printf("KEY IN THE INDEX : ");
		scanf("%s",keyin);
		//sprintf(keyin, "%d", iteration);
		strcat(fileName,keyin);
		strcat(fileName,".bin");
		start_time = clock();
		iniVEC = get_vector(iniVEC,fileName,COL_NUM,MAT_DIM);
		printf("Load Time : %f\n",(float)(clock()-start_time)/CLOCKS_PER_SEC);
		start_time = clock();
		layer = 1;

		while(layer<=LAYER){
			//printf("layer:%d\n",layer);
			static uint8_t *o_VEC;
			//printf("TRANSMIT MATRIX & VECTOR\n");
			send2fpga(layer, COL_NUM, MAT_DIM, Trans_num, iniVEC, o_VEC, nn_wrapper_addr, MAT);
			//printf("TRANSMIT MATRIX OK\n");

			//printf("RECEIVE CALC VECTOR\n");
			int32_t *VEC;
			VEC = (int32_t*)malloc(sizeof(int32_t*)*50);
			read_from_fpga(layer, MAT_DIM, i_Trans_num, VEC, nn_wrapper_addr);
			//printf("RECEIVE CALC VECTOR OK\n");

			if(layer==LAYER){
				int8_t idx=argmax(VEC,COL_NUM[LAYER]);
				printf("ARGMAX : %d\n",idx);
				ARGMAX_V[iteration-1]=idx;
			}
			free(o_VEC);
			o_VEC = (uint8_t*)malloc (sizeof(uint8_t*)*COL_NUM[layer]);
			//VECTOR TO TANH
			float *VECH;
			VECH = (float*)malloc (sizeof(float*)*COL_NUM[layer]);
			int i=0;
			for(;i<COL_NUM[layer];i++){
				//VECH[i] = (float)VEC[i]*SCALING_FAC[layer-1];
				VECH[i] = (float)VEC[i];
				VECH[i]/=pow(2,7);
				VECH[i] = tanh(VECH[i]);
				o_VEC[i] = conv2fixed(VECH[i],8);
			}
			free(VECH);
			free(VEC);
			layer = layer+1;

		}
		printf("Inference Time : %f\n",(float)(clock()-start_time)/CLOCKS_PER_SEC);
		
		//stpcpy(fileName,"display png/");
		//strcat(fileName, keyin);
		//strcat(fileName, ".png");
		//system(fileName);
		//iteration++;
	}
	/*
  	int arg_idx = 1;
	for(;arg_idx<=itermax;arg_idx++){
		printf("ARGMAX[%d] = %d\n",arg_idx, ARGMAX_V[arg_idx-1] );
	}
	*/
	
	// clean up our memory mapping and exit
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
