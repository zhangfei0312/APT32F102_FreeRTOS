/*
 * Copyright (C) 2017 C-SKY Microsystems Co., Ltd. All rights reserved.
 *
 * SPDX-License-Identifier: MIT
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
 */

//#include <csi_config.h>

/********************************************************************
 * Functions: vPortStartTask
 *
 ********************************************************************/
.global vPortStartTask
.type   vPortStartTask, %function
vPortStartTask:
    psrclr   ie
    lrw      r4, pxCurrentTCB
    ld.w     r4, (r4)                // the current task stack pointer is the first member
    ld.w     sp, (r4)

    ldw      r0, (sp, 48)
    mtcr     r0, epc
    ldw      r0, (sp, 44)
    mtcr     r0, epsr
    ldw      r15, (sp, 40)
	ldw      r13, (sp,36)
	ldw      r8, (sp,32)
	ldw      r7, (sp,28)
	ldw      r6, (sp,24)
	ldw      r5, (sp,20)
	ldw      r4, (sp,16)
	ldw      r3, (sp,12)
	ldw      r2, (sp,8)
	ldw      r1, (sp,4)
	ldw      r0, (sp,0)
    addi     sp, 52
    rte

/********************************************************************
 * Functions: vPortYield
 *
 ********************************************************************/
.global vPortYield
.type   vPortYield, %function
vPortYield:
    psrclr  ee
    subi    sp, 52
	stw     r0, (sp,0)
	stw     r1, (sp,4)
	stw     r2, (sp,8)
	stw     r3, (sp,12)
	stw     r4, (sp,16)
	stw     r5, (sp,20)
	stw     r6, (sp,24)
	stw     r7, (sp,28)
	stw     r8, (sp,32)
	stw     r13, (sp,36)
	stw     r15, (sp,40)
    mfcr    r0, psr
    bseti   r0, 8
    stw     r0, (sp, 44)
    stw     r15, (sp, 48)

    lrw     r2, pxCurrentTCB
    ld.w    r3, (r2)
    st.w    sp, (r3)

    jbsr    vTaskSwitchContext
	
    lrw     r4, pxCurrentTCB
    ld.w    r4, (r4)
    ld.w    sp, (r4)

    ldw      r0, (sp, 48)
    mtcr     r0, epc
    ldw      r0, (sp, 44)
    mtcr     r0, epsr
    ldw      r15, (sp, 40)
	ldw      r13, (sp,36)
	ldw      r8, (sp,32)
	ldw      r7, (sp,28)
	ldw      r6, (sp,24)
	ldw      r5, (sp,20)
	ldw      r4, (sp,16)
	ldw      r3, (sp,12)
	ldw      r2, (sp,8)
	ldw      r1, (sp,4)
	ldw      r0, (sp,0)
    addi     sp, 52

    rte

/********************************************************************
 * Functions: NOVIC_IRQ_Default_Handler
 *
 ********************************************************************/
//.global NOVIC_IRQ_Default_Handler
//.type   NOVIC_IRQ_Default_Handler, %function
//NOVIC_IRQ_Default_Handler:
//    psrset  ee
//    subi    sp, 68
//    stm     r0-r13, (sp)
//    stw     r15, (sp, 56)
//    mfcr    r0, epsr
//    stw     r0, (sp, 60)
//    mfcr    r0, epc
//    stw     r0, (sp, 64)
//	
//    lrw     r7, pxCurrentTCB
//    ldw     r7, (r7)
//    stw     sp, (r7)
//
//    lrw     sp, g_top_irqstack
//
//    lrw     r1, g_irqvector
//    mfcr    r0, psr
//    lsri    r0, 16
//    sextb   r0
//    subi    r0, 32
//    lsli    r0, 2
//    add     r1, r0
//    ldw     r1, (r1)
//    lsri    r0, 2
//    jsr     r1
//
//    lrw     r7, pxCurrentTCB
//    ldw     r7, (r7)
//    ldw     sp, (r7)
//
//    ldw     r0, (sp, 64)
//    mtcr    r0, epc
//    ldw     r0, (sp, 60)
//    mtcr    r0, epsr
//    ldm     r0-r13, (sp)
//    ldw     r15, (sp, 56)
//    addi    sp, 68
//    rte
