/*
 * FreeRTOS V202212.00
 * Copyright (C) 2020 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * https://www.FreeRTOS.org
 * https://github.com/FreeRTOS
 *
 */

#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H
#include "stdio.h"
/*-----------------------------------------------------------
 * Application specific definitions.
 *
 * These definitions should be adjusted for your particular hardware and
 * application requirements.
 *
 * THESE PARAMETERS ARE DESCRIBED WITHIN THE 'CONFIGURATION' SECTION OF THE
 * FreeRTOS API DOCUMENTATION AVAILABLE ON THE FreeRTOS.org WEB SITE.
 *
 * See http://www.freertos.org/a00110.html.
 *----------------------------------------------------------*/
 
/* 置1：RTOS使用抢占式调度器；置0：RTOS使用协作式调度器（时间片）
 * 
 * 注：在多任务管理机制上，操作系统可以分为抢占式和协作式两种。
 * 协作式操作系统是任务主动释放CPU后，切换到下一个任务。
 * 任务切换的时机完全取决于正在运行的任务。
 */
#define configUSE_PREEMPTION                     1			
		
#define configUSE_IDLE_HOOK                      0
#define configUSE_TICK_HOOK                      0
/*
 * 写入实际的CPU内核时钟频率，也就是CPU指令执行频率，通常称为Fclk
 * Fclk为供给CPU内核的时钟信号，我们所说的cpu主频为 XX MHz，
 * 就是指的这个时钟信号，相应的，1/Fclk即为cpu时钟周期；
 */
 
#define configCPU_CLOCK_HZ                     ( ( unsigned long ) 24000000 )

//RTOS系统节拍中断的频率。即一秒中断的次数，每次中断RTOS都会进行任务调度
#define configTICK_RATE_HZ                     ( ( portTickType ) 100 )		//100us
//空闲任务使用的堆栈大小
#define configMINIMAL_STACK_SIZE               ( ( unsigned short ) (64) )
//系统所有总的堆大小
#define configTOTAL_HEAP_SIZE                  ( ( size_t ) (3*1024) )   
//任务名字字符串长度
#define configMAX_TASK_NAME_LEN                ( 12 )	
					
#define configUSE_TRACE_FACILITY                 0
#define configUSE_16_BIT_TICKS                   0
//空闲任务放弃CPU使用权给其他同优先级的用户任务
#define configIDLE_SHOULD_YIELD                  1
//使用互斥信号量
#define configUSE_MUTEXES                        1
/*
 * 大于0时启用堆栈溢出检测功能，如果使用此功能 
 * 用户必须提供一个栈溢出钩子函数，如果使用的话
 * 此值可以为1或者2，因为有两种栈溢出检测方法 */
#define configCHECK_FOR_STACK_OVERFLOW           1
#define configUSE_RECURSIVE_MUTEXES              0

/* 设置可以注册的信号量和消息队列个数 */
#define configQUEUE_REGISTRY_SIZE                10
//使用内存申请失败钩子函数
#define configUSE_MALLOC_FAILED_HOOK             1

/* 与宏configUSE_TRACE_FACILITY同时为1时会编译下面3个函数
 * prvWriteNameToBuffer()
 * vTaskList(),
 * vTaskGetRunTimeStats()
*/
#define configUSE_STATS_FORMATTING_FUNCTIONS     0 
 //启用软件定时器
#define configUSE_TIMERS                         0
/***********************************************************************
                FreeRTOS与软件定时器有关的配置选项      
**********************************************************************/
//软件定时器优先级
#define configTIMER_TASK_PRIORITY                1
//软件定时器队列长度
#define configTIMER_QUEUE_LENGTH                36
//软件定时器任务堆栈大小
#define configTIMER_TASK_STACK_DEPTH          configMINIMAL_STACK_SIZE

//1使能时间片调度(默认式使能的)	
#define configUSE_TIME_SLICING                   1
//为1时使用计数信号量
#define configUSE_COUNTING_SEMAPHORES            1

#define portCRITICAL_NESTING_IN_TCB              0




/*#define configGENERATE_RUN_TIME_STATS 1*/

#define configMAX_PRIORITIES                   ( 5 )

/* Set the following definitions to 1 to include the API function, or zero
to exclude the API function. */

#define INCLUDE_vTaskPrioritySet        1
#define INCLUDE_uxTaskPriorityGet       1
#define INCLUDE_vTaskDelete             1
#define INCLUDE_vTaskCleanUpResources   0
#define INCLUDE_vTaskSuspend            1
#define INCLUDE_vTaskDelayUntil         1
#define INCLUDE_vTaskDelay              1

#define configASSERT( a )   do {if ((a)==0){printf("Assert : %s %d\r\n", __FILE__, __LINE__);while(1);}}while(0)
//系统可管理的最高中断优先级
#define configKERNEL_INTERRUPT_PRIORITY         ( ( unsigned char ) 7 << ( unsigned char ) 5 )  /* Priority 7, or 255 as only the top three bits are implemented.  This is the lowest priority. */
#define configMAX_SYSCALL_INTERRUPT_PRIORITY    ( ( unsigned char ) 5 << ( unsigned char ) 5 )  /* Priority 5, or 160 as only the top three bits are implemented. */

extern volatile unsigned long ulHighFrequencyTimerTicks;
/* There is already a high frequency timer running - just reset its count back
to zero. */
/*
#define portCONFIGURE_TIMER_FOR_RUN_TIME_STATS() ( ulHighFrequencyTimerTicks = 0UL )
#define portGET_RUN_TIME_COUNTER_VALUE()    ulHighFrequencyTimerTicks
*/
#endif /* FREERTOS_CONFIG_H */
