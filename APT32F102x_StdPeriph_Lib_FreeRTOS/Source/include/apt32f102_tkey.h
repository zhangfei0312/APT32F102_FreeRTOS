/*
  ******************************************************************************
  * @file    apt32f102_tkey.h
  * @author  APT AE Team
  * @version V1.17
  * @date    2023/08/31
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

#ifndef _apt32f102_TK_H
#define _apt32f102_TK_H

#include "apt32f102.h"
  
/**
  * @brief  tkey mode register
  */
typedef enum
{
    TK_HM_DIS = 0<<0,
	TK_HM_EN = 1<<0,
}TKEY_HMEN_TypeDef;
/**
  * @brief  tkey mode register
  */
typedef enum
{
    TK_SINGLE = 0<<1,
	TK_SEQ = 1<<1,
}TKEY_MODE_TypeDef;
/**
  * @brief  tkey ckspr register
  */
typedef enum
{
    TK_CKSPR_DIS = 0<<9,
	TK_CKSPR_EN = 1<<9,
}TKEY_CKSPR_TypeDef;
/**
  * @brief  tkey CKRND register
  */
typedef enum
{
    TK_CKRND_DIS = 0<<10,
	TK_CKRND_EN = 1<<10,
}TKEY_CKRND_TypeDef;
/**
  * @brief  tkey CKFEQ register
  */
typedef enum
{
    TK_CKFEQ_LOW = 0<<11,
	TK_CKREQ_HIGH = 1<<11,
}TKEY_CKFEQ_TypeDef;

/**
  * @brief  tkey RSSEL register
  */
typedef enum
{
    TK_RSSEL_OVW = 0<<12,
	TK_RSSEL_OverTHR = 1<<12,
}TKEY_RSSEL_TypeDef;
/**
  * @brief  tkey IDLEP register
  */
typedef enum
{
    TK_IDLEP_DIS = 0<<14,
	TK_IDLEP_EN = 1<<14,
}TKEY_IDLEP_TypeDef;

/**
  * @brief  tkey DSR register
  */
typedef enum
{
    TK_DSR_Z = 0<<16,
	TK_DSR_LOW = 1<<16,
	TK_DSR_HIGH = 2<<16,
}TKEY_DSR_TypeDef;

/**
  * @brief  tkey TSCANSTB register
  */
typedef enum
{
    TK_STB_1 = 0<<20,
	TK_STB_2 = 1<<20,
	TK_STB_3 = 2<<20,
	TK_STB_4 = 3<<20,
}TKEY_TSSTB_TypeDef;

/**
  * @brief  tkey OTHRCN register
  */
typedef enum
{
    TK_DCKDIV_0 = 0<<12,
	TK_DCKDIV_2 = 1<<12,
	TK_DCKDIV_4 = 2<<12,
	TK_DCKDIV_8 = 3<<12,
}TKEY_DCKDIV_TypeDef;
#define     TK_PSEL_FVR  0
#define 	TK_PSEL_AVDD 1
#define 	TK_FVR_2048V 0
#define		TK_FVR_4096V 1
#define 	TK_EC_1V 	 0
#define		TK_EC_2V 	 1
#define		TK_EC_3V 	 2
#define		TK_EC_3_6V   3

U32_T 	TK_IO_ENABLE;					 		
U16_T 	TK_senprd[17];
U16_T 	TK_Triggerlevel[17];	
U8_T 	Press_debounce_data;		
U8_T 	Release_debounce_data;	
U16_T 	TK_icon[17];
U8_T 	MultiTimes_Filter;			
U8_T 	Valid_Key_Num;				
U8_T 	Key_mode;					
U8_T 	Base_Speed;				
U32_T 	TK_longpress_time;			
U32_T 	TK_BaseCnt;				
U16_T 	TK_PSEL_MODE;		
U16_T 	TK_FVR_LEVEL;		
U16_T 	TK_EC_LEVEL;
U8_T 	TK_Lowpower_mode;
U8_T 	TK_Lowpower_level;	
U8_T 	TK_Wakeup_level;	
//----------------------------------------------
U8_T	TK_Wheel_Function;
U8_T	TK_Wheel_Level;
U8_T	TK_Slider0_Function;
U8_T	TK_Slider0_Level;
U8_T	TK_Slider1_Function;
U8_T	TK_Slider1_Level;
U8_T	TK_Wheel_Seq[4];
U8_T	TK_Slider0_Seq[4];
U8_T	TK_Slider1_Seq[4];
U8_T 	TK_Slider0_Value;
U8_T 	TK_Slider1_Value;
U8_T	TK_Wheel_Value;
//****************************************************************
#define TK_CLK_EN 	(TKEY->CLKEN|=0X01)
#define TK_CLK_DIS 	(TKEY->CLKEN&=0XFFE)
#define TK_SCANTIME_DIS (0<<12)
#define TK_SCANTIME_1ms (1<<12)
#define TK_SCANTIME_1_5ms (2<<12)
#define TK_SCANTIME_2ms (3<<12)
#define TK_SCANTIME_3ms (4<<12)
#define TK_SCANTIME_5ms (5<<12)
#define TK_SCANTIME_10ms (6<<12)
#define TK_SCANTIME_100ms (7<<12)
  
#define TKEY_TCHEN(val) (val)     /**< TKEY CH Enable         */
#define TKEY_ICON(val)  (((val) & 0x0Ful) << 8)  
#define TKEY_START      (0x01ul << 0) 
#define TCH_EN(val)      (0x01ul << val) 

#define TKEY_SINDNE      (0x01ul << 0)
#define TKEY_DNE      (0x01ul << 1)
#define TKEY_THR      (0x01ul << 2)
#define TKEY_FLW      (0x01ul << 3)
#define TKEY_OVW      (0x01ul << 4)
#define TKEY_TIME      (0x01ul << 5)


extern void tk_init(void);
extern void tk_prgm(void);
extern void TK_Baseline_prog(void);
extern void tk_parameter_init(void);
extern void TK_setup_sleep(void);
extern void TK_quit_sleep(void);
extern volatile U16_T offset_data0_abs[17];
extern volatile U16_T offset_data1_abs[17];
extern volatile U16_T offset_data2_abs[17];
extern volatile U16_T sampling_data0[17];
extern volatile U16_T baseline_data0[17];
extern volatile S16_T offset_data0[17];
extern volatile U16_T sampling_data1[17];
extern volatile U16_T baseline_data1[17];
extern volatile S16_T offset_data1[17];
extern volatile U16_T sampling_data2[17];
extern volatile U16_T baseline_data2[17];
extern volatile S16_T offset_data2[17];
extern volatile U32_T Key_Map;
extern volatile U8_T  base_update_f;
extern volatile U8_T  neg_build_bounce;
extern volatile U8_T  pos_build_bounce;
extern volatile U8_T  keymap_strict_mode;
extern volatile U8_T  tk_overflow_en;
extern volatile U8_T  tk_dataturn_en;
extern volatile U8_T  TkeyRebaseTime;
extern volatile U32_T tk_scan_para0;
extern volatile U32_T tk_scan_para1;
extern volatile U32_T tk_scan_para2;
#endif		/**< apt32f102_tkey.h */