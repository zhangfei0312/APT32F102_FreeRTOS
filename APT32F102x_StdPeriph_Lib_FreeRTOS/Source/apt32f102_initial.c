/*
  ******************************************************************************
  * @file    apt32f102_initial.c
  * @author  APT AE Team
  * @version V1.17
  * @date    2023/08/30
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

/****************************************************
//include
*****************************************************/
#include "apt32f102.h"
#include "apt32f102_adc.h"
#include "apt32f102_bt.h"
#include "apt32f102_coret.h"
#include "apt32f102_countera.h"
#include "apt32f102_crc.h"
#include "apt32f102_ept.h"
#include "apt32f102_et.h"
#include "apt32f102_gpio.h"
#include "apt32f102_gpt.h"
#include "apt32f102_i2c.h"
#include "apt32f102_ifc.h"
#include "apt32f102_lpt.h"
#include "apt32f102_rtc.h"
#include "apt32f102_sio.h"
#include "apt32f102_spi.h"
#include "apt32f102_syscon.h"
#include "apt32f102_uart.h"
#include "apt32f102_wwdt.h"
#include "apt32f102_types_local.h"
#include "apt32f102_tkey.h"
#include "apt32f102_clkcalib.h"

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "stack_macros.h"

/****************************************************
//define
*****************************************************/


/****************************************************
//extern
*****************************************************/

/*************************************************************/
//software delay
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void delay_nms(unsigned int t)
{
    volatile unsigned int i,j ,k=0;
    j = 50* t;
    for ( i = 0; i < j; i++ )
    {
        k++;
		SYSCON_IWDCNT_Reload(); 
    }
}
void delay_nus(unsigned int t)
{
    volatile unsigned int i,j ,k=0;
    j = 1* t;
    for ( i = 0; i < j; i++ )
    {
        k++;
    }
}
/*************************************************************/
//GPIO Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void GPIO_CONFIG(void)
{
	GPIO_Init(GPIOA0,4,0);
	GPIO_Write_High(GPIOA0,4);				
	GPIO_Write_Low(GPIOA0,4);				
//------------  EXI FUNTION  --------------------------------/
//EXI0_INT= EXI0/EXI16,EXI1_INT= EXI1/EXI17, EXI2_INT=EXI2~EXI3/EXI18/EXI19, EXI3_INT=EXI4~EXI9, EXI4_INT=EXI10~EXI15    
#if 0
	GPIO_IntGroup_Set(PA0,0,Selete_EXI_PIN0);					//PA0.0 set as EXI0  
	GPIOA0_EXI_Init(EXI0);                                   	//PA0.0 set as input
	EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIFT);                   //ENABLE falling edge
	EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);                 //ENABLE rising edge
    EXTI_interrupt_CMD(ENABLE,EXI_PIN0);                	   	//enable EXI
    GPIO_EXTI_interrupt(GPIOA0,0b0000000000000001);				//enable GPIOA0.0 as EXI
	
	GPIO_IntGroup_Set(PB0,0,Selete_EXI_PIN18);					//PB0.0 set as EXI18 
	GPIO_Init(GPIOB0,0,1);										//PB0.0 set as input                                	
	EXTI_trigger_CMD(ENABLE,EXI_PIN18,_EXIFT);                  //ENABLE falling edge
	EXTI_trigger_CMD(ENABLE,EXI_PIN18,_EXIRT);                 //ENABLE rising edge
    EXTI_interrupt_CMD(ENABLE,EXI_PIN18);                	   	//enable EXI
    GPIO_EXTI_interrupt(GPIOB0,0b0000000000000001);				//enable GPIOB0.0 as EXI
	
	
	EXI0_Int_Enable();                                         //EXI0 / EXI16 INT Vector
    //EXI1_Int_Enable();                                       //EXI1 / EXI17 INT Vector
    EXI2_Int_Enable();                                         //EXI2~EXI3 / EXI18~19 INT Vector
    //EXI3_Int_Enable();                                       //EXI4~EXI9 INT Vector
    //EXI4_Int_Enable();                                       //EXI10~EXI15 INT Vector
	
    //EXI0_WakeUp_Enable();										//EXI0 interrupt wake up enable
	//EXI1_WakeUp_Enable();										//EXI1 interrupt wake up enable
	//EXI2_WakeUp_Enable();										//EXI2~EXI3 interrupt wake up enable
	//EXI3_WakeUp_Enable();										//EXI4~EXI9 interrupt wake up enable
	//EXI4_WakeUp_Enable();										//EXI10~EXI15 interrupt wake up enable
	#endif
}

/*************************************************************/
//ETP0 Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void EPT0_CONFIG(void)
{
	EPT_Software_Prg();								//EPT software reset
//------------  EPT GPIO Setting  --------------------------------/
	EPT_IO_SET(EPT_IO_CHAX,IO_NUM_PA10);			//AX channel selection
	EPT_IO_SET(EPT_IO_CHAY,IO_NUM_PB03);			//AY channel selection
	EPT_IO_SET(EPT_IO_CHBX,IO_NUM_PB02);			//BX channel selection
	EPT_IO_SET(EPT_IO_CHBY,IO_NUM_PB04);			//BY channel selection
	EPT_IO_SET(EPT_IO_CHCX,IO_NUM_PB05);			//CX channel selection
	EPT_IO_SET(EPT_IO_CHCY,IO_NUM_PA04);			//CY channel selection
	//EPT_IO_SET(EPT_IO_CHD,IO_NUM_PA08);			//D channel selection
//------------  EPT Control  --------------------------------/
	EPT_PWM_Config(EPT_Selecte_PCLK,EPT_CNTMD_increase,EPT_OPM_Continue,0);//PCLK as clock，increasing mode,continuous mode,TCLK=PCLK/(0+1) 
	//EPT_Tevent_Selecte(0x00,0x00);				//T1 source selection SYNCIN4,T2 source selectionSYNCIN5
	//EPT_SYNCR_Config(EPT_Triggle_Continue,EPT_SYNCUSR0_REARMTrig_DIS,EPT_TRGSRC0_ExtSync_SYNCUSR0,EPT_TRGSRC1_ExtSync_SYNCUSR4,0x30);//enable SYNCUSR4 SYNCUSR5 as trigger event,continuous mode
	EPT_PWMX_Output_Control(EPT_PWMA,EPT_CA_Selecte_CMPA,EPT_CB_Selecte_CMPA,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);
	EPT_PWMX_Output_Control(EPT_PWMB,EPT_CA_Selecte_CMPB,EPT_CB_Selecte_CMPB,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);						
	EPT_PWMX_Output_Control(EPT_PWMC,EPT_CA_Selecte_CMPC,EPT_CB_Selecte_CMPC,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);	
	EPT_PWMX_Output_Control(EPT_PWMD,EPT_CA_Selecte_CMPD,EPT_CB_Selecte_CMPD,EPT_PWM_ZRO_Event_OutHigh,EPT_PWM_PRD_Event_Nochange,EPT_PWM_CAU_Event_OutLow,EPT_PWM_CAD_Event_OutLow,
							EPT_PWM_CBU_Event_Nochange,EPT_PWM_CBD_Event_Nochange,EPT_PWM_T1U_Event_Nochange,EPT_PWM_T1D_Event_Nochange,EPT_PWM_T2U_Event_Nochange,EPT_PWM_T2D_Event_Nochange);		
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(4800,2400,1200,600,0);//PRDR=2400,CMPA=1200,CMPB=600,CMPC=2400,CMPD=0	
	EPT_DB_CLK_Config(0,24,24);//Fdbclk=Fhclk/(0+1)，DTR=24clk，DTF=24clk
	EPT_DBCR_Config(EPT_CHA_Selecte,EPT_CHAINSEL_PWMA_RISE_FALL,EPT_CHA_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMA Complementary,CHX rising edge,CHY falling edge		
	EPT_DBCR_Config(EPT_CHB_Selecte,EPT_CHBINSEL_PWMB_RISE_FALL,EPT_CHB_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMB Complementary,CHX rising edge,CHY falling edge		
	EPT_DBCR_Config(EPT_CHC_Selecte,EPT_CHCINSEL_PWMC_RISE_FALL,EPT_CHC_OUTSEL_EnRise_EnFall,EPT_PB_OUT_Reverse,EPT_PAtoCHX_PBtoCHY);//PWMC Complementary,CHX rising edge,CHY falling edge
//------------  EPT interruption  --------------------------------/
	//EPT_Int_Enable(EPT_CAP_LD0);//CMPA load interrupt
	//EPT_Int_Enable(EPT_CAP_LD1);//CMPB load interrupt
	//EPT_Int_Enable(EPT_CAP_LD2);//CMPC load interrupt
	//EPT_Int_Enable(EPT_CAP_LD3);//CMPD load interrupt	
	//EPT_Int_Enable(EPT_CAU);//Up-Counting phase CNT = CMPA interrupt request raw status
	//EPT_Int_Enable(EPT_CAD);//Down-Counting phase CNT = CMPA interrupt request raw statu
	//EPT_Int_Enable(EPT_CBU);//Up-Counting phase CNT = CMPB interrupt request raw status
	//EPT_Int_Enable(EPT_CBD);//Down-Counting phase CNT = CMPB interrupt request raw status
	//EPT_Int_Enable(EPT_CCU);//Up-Counting phase CNT = CMPC interrupt request raw status
	//EPT_Int_Enable(EPT_CCD);//Down-Counting phase CNT = CMPC interrupt request raw status
	//EPT_Int_Enable(EPT_CDU);//Up-Counting phase CNT = CMPD interrupt request raw status
	//EPT_Int_Enable(EPT_CDD);//Down-Counting phase CNT = CMPD interrupt request raw status
	//EPT_Int_Enable(EPT_PEND);//End of cycle interrupt request raw status
	//EPT_Vector_Int_Enable();
//------------  EPT start  --------------------------------/	
	EPT_Start();
//------------  EPT capture config  --------------------------------/
	/*EPT_Software_Prg();
	EPT_Capture_Config(EPT_Selecte_PCLK,EPT_CNTMD_increase,EPT_CAPMD_Continue,EPT_CAP_EN,EPT_LDARST_EN,EPT_LDBRST_DIS,EPT_LDCRST_DIS,EPT_LDDRST_DIS,1,0);//TCLK=pclk/(1+0),CMPAload CMPBload
	EPT_SYNCR_Config(EPT_Triggle_Continue,EPT_SYNCUSR0_REARMTrig_DIS,EPT_TRGSRC0_ExtSync_SYNCUSR0,EPT_TRGSRC1_ExtSync_SYNCUSR4,0x04);//Enable SYNCUSR2 ,Continuous trigger
	EPT_PRDR_CMPA_CMPB_CMPC_CMPD_Config(0XFFFF,0,0,0,0);
	EPT_Int_Enable(EPT_CAP_LD0);//Capture Load to CMPA interrupt request raw status
	EPT_Int_Enable(EPT_CAP_LD1);//Capture Load to CMPB interrupt request raw status
	EPT_Vector_Int_Enable();
	EPT_Start();*/
}
/*************************************************************/
//GPT0 Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void GPT0_CONFIG(void)
{
	GPT_IO_Init(GPT_CHA_PA09);
	GPT_IO_Init(GPT_CHB_PA010);
	GPT_Configure(GPTCLK_EN,GPT_PCLK,GPT_IMMEDIATE,1);
	GPT_WaveCtrl_Configure(GPT_INCREASE,GPT_SWSYNDIS,GPT_IDLE_LOW,GPT_PRDLD_PEND,GPT_OPM_CONTINUOUS,GPT_BURST_DIS,GPT_CKS_PCLK,GPT_CG_CHAX,GPT_CGFLT_00,GPT_PRDLD_ZERO);
	GPT_Period_CMP_Write(2000,1500,50);
	GPT_WaveLoad_Configure(GPT_WAVEA_IMMEDIATE,GPT_WAVEB_SHADOW,GPT_AQLDA_ZERO,GPT_AQLDB_ZERO);
	GPT_WaveOut_Configure(GPT_CHA,GPT_CASEL_CMPA,GPT_CBSEL_CMPA,2,0,1,1,0,0,0,0,0,0);
	GPT_WaveOut_Configure(GPT_CHB,GPT_CASEL_CMPA,GPT_CBSEL_CMPB,2,0,0,0,1,1,0,0,0,0);
	//GPT_SyncSet_Configure(GPT_SYNCUSR0_EN,GPT_OST_CONTINUOUS,GPT_TXREARM_DIS,GPT_TRGO0SEL_SR0,GPT_TRG10SEL_SR0,GPT_AREARM_DIS);
	//GPT_Trigger_Configure(GPT_SRCSEL_TRGUSR0EN,GPT_BLKINV_DIS,GPT_ALIGNMD_PRD,GPT_CROSSMD_DIS,5,5);
	//GPT_EVTRG_Configure(GPT_TRGSRC0_PRD,GPT_TRGSRC1_PRD,GPT_ESYN0OE_EN,GPT_ESYN1OE_EN,GPT_CNT0INIT_EN,GPT_CNT1INIT_EN,3,3,3,3);
	GPT_Start();
	GPT_ConfigInterrupt_CMD(ENABLE,GPT_INT_PEND);
	GPT_INT_ENABLE();
	//INTC_ISER_WRITE(GPT0_INT); 
	//INTC_IWER_WRITE(GPT0_INT); 
}
/*************************************************************/
//BT Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void BT_CONFIG(void)
{
	BT_DeInit(BT0);
	//BT_IO_Init(BT0_PA15);
	BT_Configure(BT0,BTCLK_EN,23,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
	BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_EN,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_Trigger_Configure(BT0,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT0,100,0);
	BT_Start(BT0);
	BT_ConfigInterrupt_CMD(BT0,ENABLE,BT_PEND);
	BT0_INT_ENABLE();
	
	/*BT_DeInit(BT1);
	BT_IO_Init(BT1_PA08);
	BT_Configure(BT1,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);
	BT_ControlSet_Configure(BT1,BT_START_LOW,BT_IDLE_HIGH,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	BT_Trigger_Configure(BT1,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT1,1000,500);
	BT_Start(BT1);
	BT_ConfigInterrupt_CMD(BT1,ENABLE,BT_PEND);
	BT1_INT_ENABLE();*/
}
/*************************************************************/
//COUNTA Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void COUNTA_CONFIG(void)
{
    COUNT_DeInit();                                                                      //clear all countA Register
    //COUNTA_IO_Init(COUNTA_PB01);                                                       //set PA0.07 as counter IO
    COUNTA_Init(1000,0,Period_H,DIV1,REPEAT_MODE,CARRIER_ON,OSP_LOW);                    //Data_H=Time/(1/sysclock)
    COUNTA_Config(SW_STROBE,PENDREM_OFF,MATCHREM_OFF,REMSTAT_0,ENVELOPE_0);              //countA mode set  
    COUNTA_Start();                                                                      //countA start
    //COUNTA_Stop();                                                                     //countA stop  
    COUNTA_Int_Enable();                                                                 //countA INT enable
}
/*************************************************************/
//RTC Initial
//EntryParameter:NONE
//ReturnValue:NONE
//RTC CLK=(CLKSRC_EMOSC)/(DIVS+1)/(DIVA+1)/4
//		  (ISCLK)/(DIVS+1)/(DIVA+1)/4
//		  (IMCLK)/(DIVS+1)/(DIVA+1)/4
/*************************************************************/	
void RTC_CONFIG(void)
{
	RTC_RST_VALUE();
	RTC_Stop();												//if you want set time data, must be stop RTC clk.
	//RTC_ALM_IO_SET(Alarm_A_pulse_output);					//PA0.2  1pulse =1 rtc clk
	RTCCLK_CONFIG(2047,3,CLKSRC_EMOSC_4div);						//32.768K/4/(2047+1)/(3+1)=1S
	RTC_Function_Config(RTC_24H,CPRD_1S,COSEL_NoCali_1hz);	//Enalbe AlarmA , Enalbe AlarmB , RTC Select 24h , CPRD Select 1s
	RTC_TimeDate_buf.u8Second=0x00;					
	RTC_TimeDate_buf.u8Minute=0x09;
	RTC_TimeDate_buf.u8Hour=0X11;								//24-hour clock
	RTC_TimeDate_buf.u8Day=0X29;
	RTC_TimeDate_buf.u8Month=0X05;
	RTC_TimeDate_buf.u8Year=0X20;
	RTC_TimeDate_buf.u8DayOfWeek=0x04;
	RTC_TIMR_DATR_SET(&RTC_TimeDate_buf);						//20/5/20,14:42:00
	RTC_AlarmA_buf.u8Second=0x59;								//ALARMA must be turned on to set the time to adjust the hour carry error problem
	RTC_AlarmA_buf.u8Minute=0x59;
	RTC_AlarmA_buf.u8Hour=0X09;								
	RTC_Alarm_TIMR_DATR_SET(Alarm_A,&RTC_AlarmA_buf,
			Alarm_Second_Compare_EN,Alarm_Minute_Compare_EN,Alarm_Hour_Compare_EN,Alarm_DataOrWeek_Compare_DIS,Alarm_data_selecte);//AlarmA time 7:00:00:00, weekend alarm
	RTC_AlarmB_buf.u8Second=0x02;					
	RTC_AlarmB_buf.u8Minute=0x01;
	RTC_AlarmB_buf.u8Hour=0X20;								//24-hour Alarm
	RTC_AlarmB_buf.u8WeekOrData=0X22;		
	RTC_Alarm_TIMR_DATR_SET(Alarm_B,&RTC_AlarmB_buf,
			Alarm_Second_Compare_EN,Alarm_Minute_Compare_EN,Alarm_Hour_Compare_EN,Alarm_DataOrWeek_Compare_EN,Alarm_data_selecte);//AlarmB time 7:00:00:00, weekend alarm	
	
	RTC_Int_Enable(ALRA_INT);
	//RTC_Int_Enable(ALRB_INT);
	RTC_Int_Enable(CPRD_INT);
	//RTC_Int_Enable(RTC_TRGEV0_INT);
	//RTC_Int_Enable(RTC_TRGEV1_INT);
	RTC_Vector_Int_Enable();
	RTC_WakeUp_Enable();
	RTC_Start();
	//RTC EVT
	//RTC_TRGSRC0_Config(RTC_EVTRG_TRGSRC0_CPRD,RTC_ESYNxOE_EN,1);
	//RTC_TRGSRC1_Config(RTC_EVTRG_TRGSRC1_CPRD,RTC_ESYNxOE_EN,2);	
	//RTC_TRGSRC0_SWFTRG();					//RTC_TRGEV0 	SW SET
	//RTC_TRGSRC1_SWFTRG();					//RTC_TRGEV1 	SW SET
}
/*************************************************************/
//ET Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void ET_CONFIG(void)
{
	ET_DeInit();
	//BT0 trigger LPT
	/*ET_CH0_SRCSEL(ET_SRC0,ENABLE,ET_BT_SYNC0);
	ET_CH0_CONTROL(ENABLE,TRG_HW,ET_LPT_TRGSRC);*/
	//LPT trigger BT0
	/*ET_CH0_SRCSEL(ET_SRC0,ENABLE,ET_LPT_SYNC);
	ET_CH0_CONTROL(ENABLE,TRG_HW,ET_BT0_TRGSRC0);*/
	//GTP0 SYNC0 trigger LPT
	//ET_CH0_SRCSEL(ET_SRC0,ENABLE,ET_EXI_SYNC0);
	//ET_CH0_CONTROL(ENABLE,TRG_HW,ET_EPT0_TRGSRC3);
	//LPT trigger GTP0 SYNC0 
	//ET_CH0_SRCSEL(ET_SRC0,ENABLE,ET_LPT_SYNC);
	//ET_CH0_CONTROL(ENABLE,TRG_HW,ET_GPT0_TRGSRC0);
	//LPT trigger TOUCH SYNC0 
	ET_CH0_SRCSEL(ET_SRC0,ENABLE,ET_LPT_SYNC);
	ET_CH0_CONTROL(ENABLE,TRG_HW,ET_TOUCH_TRGSRC);
	ET_ENABLE();
}
/*************************************************************/
//SIO Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void SIO_CONFIG(void)
{
	SIO_DeInit();
	SIO_IO_Init(SIO_PA03);
	SIO_TX_Init(SIOCLK_EN,20);
	SIO_TX_Configure(SIO_IDLE_HIGH,SIO_TX_MSB,15,8,0,0,SIO_OBH_3BIT,SIO_OBL_3BIT,3,1);
	//SIO_TXBUF_Set(TX_DH,TX_DL,TX_DH,TX_DL,TX_DH,TX_DL,TX_DH,TX_DL,TX_D1,TX_D0,TX_D1,TX_D0,TX_D1,TX_D0,TX_D1,TX_D0);
	//SIO_ConfigInterrupt_CMD(ENABLE,SIO_TXDNE);
	//SIO_INT_ENABLE();
}
/*************************************************************/
//SPI MASTER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void SPI_MASTER_CONFIG(void)
{
	SPI_DeInit();
	SPI_NSS_IO_Init(1);										//spi NSS io selection
	SPI_Master_Init(SPI_G2,SPI_DATA_SIZE_8BIT,SPI_SPO_0,SPI_SPH_0,SPI_LBM_0,SPI_RXIFLSEL_1_8,0,10);
	//SPI IO group1; 8bis; ; clk low when no data transmission;  first clock edge transition; Normal serial port; Receive Interrupt FIFO Level Selection 1/8; FSSPCLKOUT=20M/10=1M
	SPI_ConfigInterrupt_CMD(ENABLE,SPI_RXIM);				//enable FIFO receive interrupt
	SPI_Int_Enable();										//enable spi interrupt
	nop;
}
/*************************************************************/
//SPI SLAVE Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void SPI_SLAVE_CONFIG(void)
{
	SPI_DeInit();
	SPI_NSS_IO_Init(1);										//spi NSS io selection
	SPI_Slave_Init(SPI_G2,SPI_DATA_SIZE_8BIT,SPI_SPH_0,SPI_RXIFLSEL_1_8,0,12);			
	//SPI IO group1; 8bis; first clock edge transition;Receive Interrupt FIFO Level Selection 1/8;FSSPCLKOUT=20M/12=1.6M
	SPI_ConfigInterrupt_CMD(ENABLE,SPI_RXIM);				//enable FIFO receive interrupt
	SPI_Int_Enable();										//enable spi interrupt
}
/*************************************************************/
//IIC MASTER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void I2C_MASTER_CONFIG(void)
{
	I2C_DeInit();
	I2C_Master_CONFIG(I2C_SDA_PA014,I2C_SCL_PA015,FAST_MODE,I2C_MASTRER_7BIT,0X57,0Xa0,0Xa0);//address=0X57,SCL=IIClk*250=5us
	I2C_SDA_TSETUP_THOLD_CONFIG(0x40,0x40,0x40);										     //TSETUP=0X20*IICLK,RX_THOLD=0X20*IICLK,TX_THOLD=0X20*IICLK
	I2C_Enable();
}
/*************************************************************/
//IIC SLAVER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void I2C_SLAVE_CONFIG(void)
{
	I2C_DeInit();	
    GPIO_OpenDrain_EN(GPIOA0,14);																	   			//I2C de-initial
	GPIO_OpenDrain_EN(GPIOA0,15);	
	GPIO_TTL_COSM_Selecte(GPIOA0,14,INPUT_MODE_SETECTED_TTL2);
	GPIO_TTL_COSM_Selecte(GPIOA0,15,INPUT_MODE_SETECTED_TTL2);
	I2C_Slave_CONFIG(I2C_SDA_PA014,I2C_SCL_PA015,FAST_MODE,I2C_SLAVE_7BIT,0X56,0XA0,0XA0);
	//400k
	//I2C IO selection,fast mode,slave 7 bit,slave address 0x57(slave address cant set as 0x00~0x07,0x78~0x7f)
	I2C_SDA_TSETUP_THOLD_CONFIG(0x40,0x40,0x40);
	I2C_FIFO_TriggerData(0,0);															  //I2C  FIFO setting
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_SCL_SLOW);										  //I2C interrupt enable/disable
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_STOP_DET);
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RD_REQ);
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RX_FULL);
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_ABRT);
	I2C_Enable();
	I2C_Int_Enable();
	
}
/*************************************************************/
//UART0  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART0_CONFIG(void)
{
	UART0_DeInit();                                               //clear all UART Register
    UART_IO_Init(IO_UART0,0);                                     //use PA0.1->RXD0, PA0.0->TXD0
	UARTInit(UART0,416,UART_PAR_NONE);							  //baudrate=sysclock 48M/416=115200
    //UARTInitRxTxIntEn(UART0,416,UART_PAR_NONE);				  //baudrate=sysclock 48M/416=115200,tx rx int enabled 
	//UART0_Int_Enable();
}	
/*************************************************************/
//UART1  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART1_CONFIG(void)
{
	UART1_DeInit();                                                 //clear all UART Register
    UART_IO_Init(IO_UART1,2);                                    	//PA0.15->RXD1, PA0.14->TXD1
	UARTInit(UART1,208,UART_PAR_NONE);							  //baudrate=sysclock 48M/416=115200
	//UARTInitRxTxIntEn(UART1,416,UART_PAR_NONE);					//baudrate=sysclock 48M/416=115200 tx rx int enabled 
	//UART1_Int_Enable();
}	
/*************************************************************/
//UART2  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART2_CONFIG(void)
{
	UART2_DeInit();                                                 //clear all UART Register
    UART_IO_Init(IO_UART2,2);                                    	//use PA0.7->RXD2, PA0.6->TXD2
	UARTInit(UART2,416,UART_PAR_NONE);							  //baudrate=sysclock 48M/416=115200
	//UARTInitRxTxIntEn(UART2,416,UART_PAR_NONE);					//baudrate=sysclock 48M/416=115200 tx rx int enabled 
	//UART2_Int_Enable();
}	
/*************************************************************/
//adc config
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void ADC12_CONFIG(void)
{
	ADC12_Software_Reset();
	ADC12_CLK_CMD(ADC_CLK_CR , ENABLE);                                         //enable ADC CLK
	ADC12_Configure_Mode(ADC12_12BIT , Continuous_mode ,0, 6 ,2 , 1);           //12BIT ADC; Continuous mode; Conversion priority selection 0; Holding cycles=6 ;ADC_CLK=PCLK/2*2=0.2us; Number of Conversions=1
	ADC12_Configure_VREF_Selecte(ADC12_VREFP_FVR2048_VREFN_VSS);					    //ADC VREF Positive FVR4.096V,negative VSS
	ADC12_ConversionChannel_Config(ADC12_ADCIN0,ADC12_CV_RepeatNum1,ADC12_AVGDIS,0);    //SEQ0 chose ADCIN0, 6 Holding cycles, Average 1 time
	//ADC12_ConversionChannel_Config(ADC12_ADCIN1,ADC12_CV_RepeatNum1,ADC12_AVGDIS,1);  //SEQ1 chose ADCIN1, 6 Holding cycles , Average 1 time
	ADC12_CMD(ENABLE);                                                                  //enable ADC
	ADC12_ready_wait(); 																//wait ADC get ready
	ADC12_Control(ADC12_START);															//ADC convert start
}
/*************************************************************/
//TK config
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void TK_CONFIG(void)
{
	tk_init();																//tk initial
}
/*************************************************************/
//syscon Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CONFIG(void)
{
//------SYSTEM CLK AND PCLK FUNTION---------------------------/
	SYSCON_RST_VALUE();                                                         //SYSCON all register clr
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC);										//SYSCON enable/disable clock source
	//EMOSC_OSTR_Config(0XAD,0X1f,EM_LFSEL_EN,EM_FLEN_EN,EM_FLSEL_10ns);		//EM_CNT=0X3FF,0xAD(36K),EM_GM=0,Low F modedisable,EM filter disable,if enable,cont set 5ns
	//SYSCON_General_CMD(ENABLE,ENDIS_EMOSC);
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_24M);									//HFOSC selected 48MHz
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC,HCLK_DIV_1,PCLK_DIV_1,HFOSC_24M);//system clock set, Hclk div ,Pclk div  set system clock=SystemCLK/Hclk div/Pclk div
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_4S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
    SYSCON_WDT_CMD(DISABLE);                                                  	//enable/disable WDT		
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
	//IWDT_Int_Enable();
//------------  WWDT FUNTION  --------------------------------/
	WWDT_CNT_Load(0xFF);
	WWDT_CONFIG(PCLK_4096_DIV0,0xFF,WWDT_DBGDIS);
	WWDT_Int_Config(DISABLE);													
	//WWDT_CMD(ENABLE);															//enable wwdt
//------------  CLO Output --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA08);												//CLO output setting
	//SYSCON_CLO_SRC_SET(CLO_HFCLK,CLO_DIV16);									//CLO output clock and div
//------------  LVD FUNTION  --------------------------------/ 
    SYSCON_LVD_Config(DISABLE_LVDEN,INTDET_LVL_3_9V,RSTDET_LVL_1_9V,DISABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
    //LVD_Int_Enable();	
//------------  SYSCON Vector  --------------------------------/ 	
	//SYSCON_Int_Enable();    														//SYSCON VECTOR
	//SYSCON_WakeUp_Enable();    													//Enable WDT wakeup INT
//------------------------------------------------------------/
//OSC CLOCK Calibration
//------------------------------------------------------------/	
	std_clk_calib_source(CLK_ISOSC_27K);
	std_clk_calib(CLK_HFOSC_24M);												//Select the same clock source as the system
	
}
/*********************************************************************************/  
/*********************************************************************************/
//APT32F102_init                                                                  /
//EntryParameter:NONE                                                             /
//ReturnValue:NONE                                                                /
/*********************************************************************************/
/*********************************************************************************/  
/*********************************************************************************/
void APT32F102_init(void) 
{
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
//------------------------------------------------------------/
//ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON_CONFIG();                                                 //syscon  initial
	CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
	SYSCON_INT_Priority();										 //initial all Priority=0xC0
	//Set_INT_Priority(BT0_IRQ,0);									 //0:set int priority 1st
//------------------------------------------------------------/
//Other IP config
//------------------------------------------------------------/
	GPIO_CONFIG();                                                //GPIO initial     
	//EPT0_CONFIG();                                                //EPT0 initial 
	//GPT0_CONFIG();												//GPT0 initial	
	BT_CONFIG();													//BT initial
	//COUNTA_CONFIG();                                              //CountA initial	
	//RTC_CONFIG();													//RCT initial		              
	//ET_CONFIG();													//ETCB initial
    //I2C_MASTER_CONFIG();                                          //I2C harware master initial 
	//I2C_SLAVE_CONFIG();                                           //I2C harware slave initial 
	//SPI_MASTER_CONFIG();											//SPI Master initial 	
	//SPI_SLAVE_CONFIG();											//SPI Slaver initial 
	//SIO_CONFIG();													//SIO initial
    //UART0_CONFIG();                                               //UART0 initial 
	UART1_CONFIG();                                               //UART1 initial 
	//UART2_CONFIG();                                               //UART2 initial 
	//ADC12_CONFIG();                                               //ADC initial 
	//TK_CONFIG();													//Touch Key initial
}

/******************* (C) COPYRIGHT 2019 APT Chip *****END OF FILE****/