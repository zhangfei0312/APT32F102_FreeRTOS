/*
  ******************************************************************************
  * @file    apt32f102_tkey_parameter.c
  * @author  APT AE Team
  * @version V1.16
  * @date    2023/03/24
  ******************************************************************************
  *THIS SOFTWARE WHICH IS FOR ILLUSTRATIVE PURPOSES ONLY WHICH PROVIDES 
  *CUSTOMER WITH CODING INFORMATION REGARDING THEIR PRODUCTS.
  *APT CHIP SHALL NOT BE HELD RESPONSIBILITY ADN LIABILITY FOR ANY DIRECT, 
  *INDIRECT DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE CONTENT OF 
  *SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING INFORMATION 
  *CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.AND APT CHIP RESERVES 
  *THE RIGHT TO MAKE CHANGES IN THE SOFTWARE WITHOUT NOTIFICATION
  ******************************************************************************
  */
#include "apt32f102_tkey.h"

/****************************************************
//TCHx GPIO Map
*****************************************************/  
/*
  ___________________    ___________________    ___________________   
 | PIN    |tkey CH  |   | PIN    |tkey CH  |   | PIN    |tkey CH  |    
 |--------|---------|   |--------|---------|   |--------|---------|   
 | PB0.1  |  TCH0   |   | PA0.8  |  TCH8   |   | PB0.5  |  TCH16  |   
 |--------|---------|   |--------|---------|   |--------|---------|  
 | PA0.0  |  TCH1   |   | PA0.9  |  TCH9   |   
 |--------|---------|   |--------|---------|   
 | PA0.1  |  TCH2   |   | PA0.10 |  TCH10  |   
 |--------|---------|   |--------|---------|   
 | PA0.2  |  TCH3*  |   | PA0.11 |  TCH11  |   
 |--------|---------|   |--------|---------|   
 | PA0.3  |  TCH4*  |   | PA0.12 |  TCH12  |   
 |--------|---------|   |--------|---------|   
 | PA0.4  |  TCH5*  |   | PA0.13 |  TCH13  |   
 |--------|---------|   |--------|---------|   
 | PB0.2  |  TCH6   |   | PB0.0  |  TCH14  |   
 |--------|---------|   |--------|---------|   
 | PB0.3  |  TCH7   |   | PB0.4  |  TCH15  |   
  -------------------    -------------------  
 */
//TCH3=FVR TCH4=OSC_XI TCH5=OSC_XO
/****************************************************
//define
*****************************************************/
//#define _102_Slider_Function




void tk_parameter_init(void)
{
/****************************************************
//TK parameter define
*****************************************************/
	TK_IO_ENABLE=TCH_EN(6)|TCH_EN(7)|TCH_EN(8)|TCH_EN(9)|TCH_EN(10)|TCH_EN(11)|TCH_EN(12)|TCH_EN(13);	
	TK_senprd[0]=50;								//TCH0 scan period = TCH0 sens
	TK_senprd[1]=50;								//TCH1 scan period = TCH1 sens
	TK_senprd[2]=50;								//TCH2 scan period = TCH2 sens
	TK_senprd[3]=50;								//TCH3 scan period = TCH3 sens
	TK_senprd[4]=50;								//TCH4 scan period = TCH4 sens
	TK_senprd[5]=50;								//TCH5 scan period = TCH5 sens
	TK_senprd[6]=50;								//TCH6 scan period = TCH6 sens
	TK_senprd[7]=50;								//TCH7 scan period = TCH7 sens
	TK_senprd[8]=50;								//TCH8 scan period = TCH8 sens
	TK_senprd[9]=50;								//TCH9 scan period = TCH9 sens
	TK_senprd[10]=50;								//TCH10 scan period = TCH10 sens
	TK_senprd[11]=50;								//TCH11 scan period = TCH11 sens
	TK_senprd[12]=50;								//TCH12 scan period = TCH12 sens
	TK_senprd[13]=50;								//TCH13 scan period = TCH13 sens
	TK_senprd[14]=50;								//TCH14 scan period = TCH14 sens
	TK_senprd[15]=50;								//TCH15 scan period = TCH15 sens
	TK_senprd[16]=50;								//TCH16 scan period = TCH16 sens
	TK_Triggerlevel[0]=60;							//TCH0 TK_Trigger level
	TK_Triggerlevel[1]=60;							//TCH1 TK_Trigger level
	TK_Triggerlevel[2]=60;							//TCH2 TK_Trigger level
	TK_Triggerlevel[3]=60;							//TCH3 TK_Trigger level
	TK_Triggerlevel[4]=60;							//TCH4 TK_Trigger level
	TK_Triggerlevel[5]=60;							//TCH5 TK_Trigger level
	TK_Triggerlevel[6]=60;							//TCH6 TK_Trigger level
	TK_Triggerlevel[7]=60;							//TCH7 TK_Trigger level
	TK_Triggerlevel[8]=60;							//TCH8 TK_Trigger level
	TK_Triggerlevel[9]=60;							//TCH9 TK_Trigger level
	TK_Triggerlevel[10]=60;							//TCH10 TK_Trigger level
	TK_Triggerlevel[11]=60;							//TCH11 TK_Trigger level
	TK_Triggerlevel[12]=60;							//TCH12 TK_Trigger level
	TK_Triggerlevel[13]=60;							//TCH13 TK_Trigger level
	TK_Triggerlevel[14]=60;							//TCH14 TK_Trigger level
	TK_Triggerlevel[15]=60;							//TCH15 TK_Trigger level
	TK_Triggerlevel[16]=60;							//TCH16 TK_Trigger level
	Press_debounce_data=5;							//Press debounce 1~10
	Release_debounce_data=5;						//Release debounce 1~10
	Key_mode=0;										//Key mode 0=single key 1=multi key
	MultiTimes_Filter=0;							//MultiTimes Filter,>4 ENABLE <4 DISABLE
	Valid_Key_Num=4;								//Valid Key number when touched
	Base_Speed=10;									//baseline update speed
	TK_longpress_time=16;							//longpress rebuild time = _TK_longpress_time1*1s  0=disable
	TK_BaseCnt=59999;								//10ms  TK_BaseCnt=10ms*48M/8-1,this register need to modify when mcu's Freq changed
/****************************************************
//TK function define
*****************************************************/
	TK_Lowpower_mode=DISABLE;						//touch key can goto sleep when TK lowpower mode enable
	TK_Lowpower_level=2;							//0=20ms 1=50ms 2=100ms 3=150ms 4=200ms,Scan interval when sleep
	TK_Wakeup_level=50;								//touch key Trigger level in sleep
/****************************************************
//TK special parameter define
*****************************************************/
	TK_PSEL_MODE=TK_PSEL_AVDD;						//tk power sel:TK_PSEL_FVR/TK_PSEL_AVDD   when select TK_PSEL_FVR PA0.2(TCH3) need a 104 cap
	TK_FVR_LEVEL=TK_FVR_4096V;						//FVR level:TK_FVR_2048V/TK_FVR_4096V
	TK_EC_LEVEL=TK_EC_3V;							//C0 voltage sel:TK_EC_1V/TK_EC_2V/TK_EC_3V/TK_EC_3_6V
	TK_icon[0]=4;									//TCH0 TK Scan icon
	TK_icon[1]=4;									//TCH1 TK Scan icon
	TK_icon[2]=4;									//TCH2 TK Scan icon
	TK_icon[3]=4;									//TCH3 TK Scan icon
	TK_icon[4]=4;									//TCH4 TK Scan icon
	TK_icon[5]=4;									//TCH5 TK Scan icon
	TK_icon[6]=4;									//TCH6 TK Scan icon
	TK_icon[7]=4;									//TCH7 TK Scan icon
	TK_icon[8]=4;									//TCH8 TK Scan icon
	TK_icon[9]=4;									//TCH9 TK Scan icon
	TK_icon[10]=4;									//TCH10 TK Scan icon
	TK_icon[11]=4;									//TCH11 TK Scan icon
	TK_icon[12]=4;									//TCH12 TK Scan icon
	TK_icon[13]=4;									//TCH13 TK Scan icon
	TK_icon[14]=4;									//TCH14 TK Scan icon
	TK_icon[15]=4;									//TCH15 TK Scan icon
	TK_icon[16]=4;									//TCH16 TK Scan icon
/****************************************************
//TK slider/Wheel parameter define
//Need to select lib_102TKey_Slider_x_xx.a in linker->Library name
*****************************************************/
#ifdef _102_Slider_Function
//-------------------slider 0--------------------	
	TK_Slider0_Function=DISABLE;
	TK_Slider0_Level=255;							//255/128/64
	TK_Slider0_Seq[0]=10;
	TK_Slider0_Seq[1]=11;
	TK_Slider0_Seq[2]=12;
	TK_Slider0_Seq[3]=13;
//-------------------slider 1--------------------	
	TK_Slider1_Function=ENABLE;
	TK_Slider1_Level=255;							//255/128/64
	TK_Slider1_Seq[0]=6;
	TK_Slider1_Seq[1]=7;
	TK_Slider1_Seq[2]=8;
	TK_Slider1_Seq[3]=9;
//--------------------wheel--------------------------
	TK_Wheel_Function=ENABLE;
	TK_Wheel_Level=128;								//128/64
	TK_Wheel_Seq[0]=14;								
	TK_Wheel_Seq[1]=0;
	TK_Wheel_Seq[2]=15;
	TK_Wheel_Seq[3]=1;	
#endif
}