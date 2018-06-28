#ifndef __FUNC_H__
#define __FUNC_H__

#include <stdio.h>
#include <tgmath.h>
#define LAYER 4
#define MAT_DIM_FIXED 50

int32_t 	conv2fixed(float, int );
int8_t 		argmax(int32_t*, uint8_t );
uint8_t*** 	get_weight(uint8_t ***, int32_t *, int32_t );
uint8_t* 	get_vector(uint8_t *, char * , int32_t*, int32_t );
void 		send2fpga(int, int32_t*, int32_t , int32_t, uint8_t*, uint8_t*, void*, uint8_t*** );
void 		read_from_fpga(int, int32_t, int32_t , int32_t* , void*  );



int32_t conv2fixed(float fp,int bit_num){
	int8_t buf = 0;
	fp*=pow(2,bit_num-1);
	//buf = (int8_t)nearbyint(fp);
	buf = (int8_t)fp;
	return buf;
}
int8_t argmax(int32_t* VEC,uint8_t size){
	int8_t VECidx = 0;
	int16_t maxVEC = VEC[0];
	////printf("0: %d\n",maxVEC);
    int i=1;
	for(;i<size;i++){
		////printf("%d: %d\n",i,VEC[i]);
		if(VEC[i]>maxVEC){
			maxVEC = VEC[i];
			VECidx = i;
		}
	}
	return VECidx;
}

uint8_t*** get_weight(uint8_t *** MAT, int32_t * COL_NUM, int32_t  MAT_DIM)
{
    FILE *fp;
    //fpos_t pos;
    int i;
    char buff; 

    fp = fopen("./bin/W_pad.bin","rb");
    if(!fp){
        printf("MATRIX File not Open!!\n");
        return 1;
    }
    //int pos = 0x00;
    //fsetpos(fp, &pos);

    //int length_of_fp = fseek(fp, 0, SEEK_END);
    //fread(buff, sizeof(char),1,fp);

    //Initialize MAT
    int r, c, l;
    MAT = (uint8_t ***) malloc (sizeof(uint8_t ***)*LAYER);
    for (l=0;l<LAYER;l++){
        MAT[l] =(uint8_t **) malloc(sizeof(uint8_t *)*MAT_DIM);
        for (r=0;r<MAT_DIM;r++){
            MAT[l][r] =(uint8_t *) malloc(sizeof(uint8_t)*COL_NUM[l]);
        }
    }

    ////printf("READY to READ MATRIX!\n");
	for(l=0;l<LAYER;l++){
		for(c=0;c<COL_NUM[l];c++){
			for(r=0;r<MAT_DIM;r++){
				fread(&buff,sizeof(char),1,fp);
				MAT[l][r][c] = buff;
			}
		}
	}
    
  	////printf("READ MATRIX OK!\n");
    //MATRIX show
  	/*for(l=0;l<LAYER;l++){
  		for(r=0;r<MAT_DIM;r++){
  			for(c=0;c<COL_NUM[l];c++){
  				printf("%d ",MAT[l][r][c]);
  			}
  			printf("\n");
  		}
  		printf("\n");
  	}*/
	fclose(fp);

    return MAT;

}


uint8_t* get_vector(uint8_t * VEC, char * s, int32_t * COL_NUM, int32_t  MAT_DIM)
{
    FILE *fp;
    //fpos_t pos;
    char buff; 

    fp = fopen(s,"rb");
    if(!fp){
        printf("VECTOR File %s not Open!!\n",s);
        return 1;
    }
    //int pos = 0x00;
    
    ///printf("READY to READ VECTOR!\n");
    VEC = (uint8_t*)malloc (sizeof(uint8_t*)*COL_NUM[0]);
    

	int i=0;
	for(;i<COL_NUM[0];i++){
		fread(&buff, sizeof(char),1,fp);  		
		VEC[i] = buff;
	}
	
    //printf("READ VECTOR OK!\n");
	//for(i=0;i<784;i++) {
		//printf(" VEC[%d]=%d ",i,VEC[i]);
	//}
	fclose(fp);
    return VEC;

}

bool checkValid(uint32_t curr,uint32_t* prev_ptr) {
    if(curr == *prev_ptr+1) {
        *prev_ptr = curr;
        return true;
    }
    if(*prev_ptr==12 && curr==1) return true;
    return false;
}


void send2fpga(int layer, int32_t * COL_NUM, int32_t  MAT_DIM, int32_t Trans_num, uint8_t* iniVEC, uint8_t* o_VEC, void* nn_wrapper_addr, uint8_t*** MAT){
	int r=0,c=0,v=0;
	//alt_8 instruction = 1;
	uint8_t mat_cnt = 0;
	uint32_t Tdata = 0;
	uint8_t Tcnt = 0;
	uint8_t finish = 0;
	
	for(c=0;c<COL_NUM[layer-1];c++){
		if(c==COL_NUM[layer-1]-1){
			Tdata = 0b10000000;
		}
		else{
			Tdata = 0;
		}
		Tdata = Tdata << 8;
		Tcnt= 3;
		finish = 0;
		r=0;
        int i=0;
        
        uint32_t prev=0;
		for(;i<Trans_num;i++){            
			if(i!=0)Tcnt = 4;
			while(Tcnt){

				if(finish){
					Tdata = Tdata|0b00000000;
				}
				else{
					if(mat_cnt!=MAT_DIM_FIXED){
						//if((MAT_DIM[layer-1]<MAT_DIM_FIXED)&& (mat_cnt>10)) {
							//Tdata = 0;
							//printf("padding...\n");
						//}
						//else{
							Tdata = Tdata|MAT[layer-1][r][c];
						//}
						mat_cnt++;
						r++;
					}
					else{
						if(layer==1){
							Tdata = Tdata|iniVEC[v];
						}
						else{
							Tdata = Tdata|o_VEC[v];
						}
						v++;
						mat_cnt = 0;
						finish = 1;
					}
				}



				if(Tcnt!=1){
					Tdata = Tdata << 8;
				}
				Tcnt--;
			}
			*(uint32_t*)nn_wrapper_addr = Tdata;
            
            while(!checkValid(*(uint32_t*)nn_wrapper_addr,&prev)) ;
            
			Tdata = 0;
		}
	}

}
void read_from_fpga(int layer, int32_t MAT_DIM, int32_t i_Trans_num, int32_t* VEC, void* nn_wrapper_addr ){
	
	//VEC = (int16_t*)malloc (sizeof(int16_t*)*MAT_DIM_FIXED);
	int v = 0;
	int start = 0;
	uint32_t Tdata = 0;
	int iter=0;
	
	//for(;iter<10;iter++) {
	//	printf("in read %d\n",*(uint32_t*)nn_wrapper_addr);
	//}
	
	while(!start){
		Tdata = *(uint32_t*)nn_wrapper_addr;
		//printf("in read: %d\n",Tdata);
		if(Tdata){
			start=1;
		}
	}
	
    int i=0;
	for(;i<i_Trans_num;i++){
		*(int32_t*)nn_wrapper_addr = 0;
		//usleep(500*1000);
		VEC[v] = *(int32_t*)nn_wrapper_addr;
		//printf("%d\n",VEC[v]);
		v++;
		if(i==i_Trans_num-1){
			*(int32_t*)nn_wrapper_addr = 0;
			//usleep(100);
		}
	}
}



#endif /* __FUNC_H__ */