/*
  ******************************************************************************
  * @file    main.c
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
/*#include "apt32f102_tkey.h"*/
#include <stdio.h>
#include <stdint.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
/****************************************************
//define
*****************************************************/

/****************************************************
//extern
*****************************************************/
extern void delay_nms(unsigned int t);
extern void APT32F102_init(void);

int putchar(int ch)
{
    if (ch == '\n') {
        UARTTxByte(UART1,'\r');
    }

    UARTTxByte(UART1, ch);

    return 0;
}

int fputc(int ch, FILE *fp)
{
    if (ch == '\n') {
        UARTTxByte(UART1,'\r');
    }

    UARTTxByte(UART1, ch);

    return 0;
}

TaskHandle_t STARTTASK_HANDLE;
#define      STARTTASK_STK_SIZE  256
#define      STARTTASK_PRIORITY  1

TaskHandle_t TASK1_HANDLE;
#define      TASK1_STK_SIZE  64
#define      TASK1_PRIORITY  2

TaskHandle_t TASK2_HANDLE;
#define      TASK2_STK_SIZE  64
#define      TASK2_PRIORITY  3

/***************************************************/
//main
/**************************************************/
void Task1()
{
	while(1)
	{
		printf("Task1 is running!!!\r\n");
		vTaskDelay(10000);
	}
}


void Task2()
{
	while(1)
	{
		printf("Task2 is running!!!\r\n");
		//GPIO_Reverse(GPIOA0,4);
		vTaskDelay(10000);
	}
}

void StartTask()
{
	printf("StartTask is running!!!\r\n");
	
	taskENTER_CRITICAL();
	
	if(pdPASS != xTaskCreate((TaskFunction_t )Task1, 
							 (const char*    )"TASK1", 
							 (uint16_t       )TASK1_STK_SIZE,  
							 (void*          )NULL,  
							 (UBaseType_t    )TASK1_PRIORITY, 
							 (TaskHandle_t*  )&TASK1_HANDLE))
	{
		printf("Task1 create fail!!!\r\n");
	}
	else 
	{
		printf("Task1 create sucess!!!\r\n");
	}
	
	 
	if(pdPASS != xTaskCreate((TaskFunction_t )Task2, 
							 (const char*    )"TASK2",
							 (uint16_t       )TASK2_STK_SIZE,
							 (void*          )NULL,
							 (UBaseType_t    )TASK2_PRIORITY,
							 (TaskHandle_t*  )&TASK2_HANDLE))
	{
		printf("task2 create fail!!!\r\n");
	}
	else 
	{
		printf("Task2 create sucess!!!\r\n");
	}
	
	printf("StartTask is deleted !!!\r\n");
	vTaskDelete(STARTTASK_HANDLE);
	
	taskEXIT_CRITICAL();
}

/***************************************************/
//main
/**************************************************/
int main(void) 
{
	APT32F102_init();
	
	printf("--->This is APT32F1023 FreeRTOS demo\r\n");

	if(pdPASS != xTaskCreate((TaskFunction_t)StartTask, 
							(const char*    )"STARTTASK", 
							(uint16_t       )STARTTASK_STK_SIZE,  
							(void*          )NULL,  
							(UBaseType_t    )STARTTASK_PRIORITY, 
							(TaskHandle_t*  )&STARTTASK_HANDLE))
	{
		printf("StartTask create fail!!!\r\n");
	}
	else 
	{
		printf("StartTask create sucess!!!\r\n");
	}
	
	vTaskStartScheduler();  
	
    while(1)
	{
		SYSCON_IWDCNT_Reload(); 

    }
}
/******************* (C) COPYRIGHT 2019 APT Chip *****END OF FILE****/