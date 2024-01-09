  /******************************************************************************
  * @file    apt32f102_clkcalib.h
  * @author  APT AE Team
  * @version V1.23
  * @date    2023/08/08
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


#include "apt32f102.h"


/**
  * @brief  CALIB OSC SELECTE SET
  */
typedef enum
{
	CLK_HFOSC_48M	=	(0x0ul),
	CLK_HFOSC_24M	=	(0x1ul),
	CLK_HFOSC_12M	=	(0x2ul),
	CLK_HFOSC_6M	=	(0x3ul),
	CLK_IMOSC_5556K	=	(0x4ul),
	CLK_IMOSC_4194K	=	(0x5ul),
	CLK_IMOSC_2097K	=	(0x6ul),
	CLK_IMOSC_131K	=	(0x7ul)
}CALIB_OSC_SELECTE_TypeDef;



/**
  * @brief  CALIB OSC SELECTE SET
  */
typedef enum
{
	CLK_ISOSC_27K		=	(0x0ul),
	CLK_EMOSC_32_768K	=	(0x1ul),
}CALIB_SRC_SELECTE_TypeDef;

extern U8_T std_clk_calib(CALIB_OSC_SELECTE_TypeDef OSC_CALIB_X);
extern void std_clk_calib_source(CALIB_SRC_SELECTE_TypeDef SRC_CALIB_X);