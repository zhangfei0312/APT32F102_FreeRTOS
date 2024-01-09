
.//Obj/Release_APT32F102.elf:     file format elf32-csky-little


Disassembly of section .text:

00000000 <vector_table>:
   0:	0000010c 	.long	0x0000010c
   4:	00001622 	.long	0x00001622
   8:	00001612 	.long	0x00001612
   c:	00000184 	.long	0x00000184
  10:	0000161a 	.long	0x0000161a
  14:	000015d8 	.long	0x000015d8
  18:	00000184 	.long	0x00000184
  1c:	0000160a 	.long	0x0000160a
  20:	00001602 	.long	0x00001602
  24:	00000184 	.long	0x00000184
  28:	00000184 	.long	0x00000184
  2c:	00000184 	.long	0x00000184
  30:	00000184 	.long	0x00000184
  34:	00000184 	.long	0x00000184
  38:	00000184 	.long	0x00000184
  3c:	00000184 	.long	0x00000184
  40:	000015fa 	.long	0x000015fa
  44:	000015f2 	.long	0x000015f2
  48:	000015ea 	.long	0x000015ea
  4c:	000015e2 	.long	0x000015e2
  50:	00000184 	.long	0x00000184
  54:	00000184 	.long	0x00000184
  58:	00000184 	.long	0x00000184
  5c:	00000184 	.long	0x00000184
  60:	00000184 	.long	0x00000184
  64:	00000184 	.long	0x00000184
  68:	00000184 	.long	0x00000184
  6c:	00000184 	.long	0x00000184
  70:	00000184 	.long	0x00000184
  74:	00000184 	.long	0x00000184
  78:	00000184 	.long	0x00000184
  7c:	000015da 	.long	0x000015da
  80:	00001642 	.long	0x00001642
  84:	00000cf8 	.long	0x00000cf8
  88:	00000df0 	.long	0x00000df0
  8c:	00000e58 	.long	0x00000e58
  90:	00000ec0 	.long	0x00000ec0
  94:	00000184 	.long	0x00000184
  98:	00001068 	.long	0x00001068
  9c:	000013ac 	.long	0x000013ac
  a0:	000013dc 	.long	0x000013dc
  a4:	0000109c 	.long	0x0000109c
  a8:	00000184 	.long	0x00000184
  ac:	00000184 	.long	0x00000184
  b0:	0000111c 	.long	0x0000111c
  b4:	0000118c 	.long	0x0000118c
  b8:	000011c8 	.long	0x000011c8
  bc:	00001204 	.long	0x00001204
  c0:	00000184 	.long	0x00000184
  c4:	00001632 	.long	0x00001632
  c8:	00000184 	.long	0x00000184
  cc:	00001240 	.long	0x00001240
  d0:	00001328 	.long	0x00001328
  d4:	0000140c 	.long	0x0000140c
  d8:	00001454 	.long	0x00001454
  dc:	000014b0 	.long	0x000014b0
  e0:	0000162a 	.long	0x0000162a
  e4:	0000163a 	.long	0x0000163a
  e8:	00001510 	.long	0x00001510
  ec:	00000184 	.long	0x00000184
  f0:	00001544 	.long	0x00001544
  f4:	00001590 	.long	0x00001590
  f8:	00000184 	.long	0x00000184
  fc:	00000184 	.long	0x00000184
 100:	55aa0005 	.long	0x55aa0005
	...

0000010c <__start>:
//  .long __start
__start:

	
  //initialize all registers
  movi r0, 0
 10c:	3000      	movi      	r0, 0
  movi r1, 0
 10e:	3100      	movi      	r1, 0
  movi r2, 0
 110:	3200      	movi      	r2, 0
  movi r3, 0
 112:	3300      	movi      	r3, 0
  movi r4, 0
 114:	3400      	movi      	r4, 0
  movi r5, 0
 116:	3500      	movi      	r5, 0
  movi r6, 0
 118:	3600      	movi      	r6, 0
  movi r7, 0
 11a:	3700      	movi      	r7, 0
  //movi r13, 0
  //movi r14, 0
  //movi r15, 0

//set VBR
  lrw r2, vector_table
 11c:	105b      	lrw      	r2, 0x0	// 188 <DummyHandler+0x4>
  mtcr r2, cr<1,0>
 11e:	c0026421 	mtcr      	r2, cr<1, 0>

//enable EE bit of psr
  mfcr r2, cr<0,0>
 122:	c0006022 	mfcr      	r2, cr<0, 0>
  bseti r2, r2, 8
 126:	3aa8      	bseti      	r2, 8
  mtcr r2, cr<0,0>
 128:	c0026420 	mtcr      	r2, cr<0, 0>
//  st.w    r2, (r1,0x4)
//  movi    r2, 0x1
//  st.w    r2, (r1,0x0)

//disable power peak 
  lrw     r1, 0xe000ef90
 12c:	1038      	lrw      	r1, 0xe000ef90	// 18c <DummyHandler+0x8>
  movi    r2, 0x0
 12e:	3200      	movi      	r2, 0
  st.w    r2, (r1, 0x0)
 130:	b140      	st.w      	r2, (r1, 0x0)



//initialize kernel stack
  lrw  r7, __kernel_stack
 132:	10f8      	lrw      	r7, 0x20000ff8	// 190 <DummyHandler+0xc>
  mov r14,r7
 134:	6f9f      	mov      	r14, r7
  subi r6,r7,0x4
 136:	5fcf      	subi      	r6, r7, 4

  //lrw  r3, 0x40
  lrw  r3, 0x04
 138:	3304      	movi      	r3, 4
	
  subu r4, r7, r3
 13a:	5f8d      	subu      	r4, r7, r3
  lrw  r5, 0x0
 13c:	3500      	movi      	r5, 0

0000013e <INIT_KERLE_STACK>:
INIT_KERLE_STACK:
  addi r4, 0x4
 13e:	2403      	addi      	r4, 4
  st.w r5, (r4)
 140:	b4a0      	st.w      	r5, (r4, 0x0)
  //cmphs r7, r4
  cmphs r6, r4
 142:	6518      	cmphs      	r6, r4
  bt  INIT_KERLE_STACK
 144:	0bfd      	bt      	0x13e	// 13e <INIT_KERLE_STACK>

00000146 <__to_main>:
        
__to_main:
  lrw r0,__main
 146:	1014      	lrw      	r0, 0x5bc	// 194 <DummyHandler+0x10>
  jsr r0
 148:	7bc1      	jsr      	r0
  mov r0, r0
 14a:	6c03      	mov      	r0, r0
  mov r0, r0
 14c:	6c03      	mov      	r0, r0


  
  lrw r15, __exit
 14e:	ea8f0013 	lrw      	r15, 0x160	// 198 <DummyHandler+0x14>
  lrw r0,main
 152:	1013      	lrw      	r0, 0x1744	// 19c <DummyHandler+0x18>
  jmp r0
 154:	7800      	jmp      	r0
  mov r0, r0
 156:	6c03      	mov      	r0, r0
  mov r0, r0
 158:	6c03      	mov      	r0, r0
  mov r0, r0
 15a:	6c03      	mov      	r0, r0
  mov r0, r0
 15c:	6c03      	mov      	r0, r0
  mov r0, r0
 15e:	6c03      	mov      	r0, r0

00000160 <__exit>:

.export __exit
__exit:

  lrw r4, 0x20003000
 160:	1090      	lrw      	r4, 0x20003000	// 1a0 <DummyHandler+0x1c>
  //lrw r5, 0x0
  mov r5, r0
 162:	6d43      	mov      	r5, r0
  st.w r5, (r4)
 164:	b4a0      	st.w      	r5, (r4, 0x0)

  mfcr r1, cr<0,0>
 166:	c0006021 	mfcr      	r1, cr<0, 0>
  lrw  r1, 0xFFFF
 16a:	102f      	lrw      	r1, 0xffff	// 1a4 <DummyHandler+0x20>
  mtcr r1, cr<11,0>
 16c:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xFFF
 170:	102e      	lrw      	r1, 0xfff	// 1a8 <DummyHandler+0x24>
  movi    r0, 0x0
 172:	3000      	movi      	r0, 0
  st      r1, (r0)
 174:	b020      	st.w      	r1, (r0, 0x0)

00000176 <__fail>:

.export __fail
__fail:
  lrw  r1, 0xEEEE
 176:	102e      	lrw      	r1, 0xeeee	// 1ac <DummyHandler+0x28>
  mtcr r1, cr<11,0>
 178:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xEEE
 17c:	102d      	lrw      	r1, 0xeee	// 1b0 <DummyHandler+0x2c>
  movi    r0, 0x0
 17e:	3000      	movi      	r0, 0
  st      r1, (r0)
 180:	b020      	st.w      	r1, (r0, 0x0)

00000182 <__dummy>:

__dummy:
  br      __fail
 182:	07fa      	br      	0x176	// 176 <__fail>

00000184 <DummyHandler>:

.export DummyHandler
DummyHandler:
  br      __fail
 184:	07f9      	br      	0x176	// 176 <__fail>
 186:	0000      	.short	0x0000
 188:	00000000 	.long	0x00000000
 18c:	e000ef90 	.long	0xe000ef90
 190:	20000ff8 	.long	0x20000ff8
 194:	000005bc 	.long	0x000005bc
 198:	00000160 	.long	0x00000160
 19c:	00001744 	.long	0x00001744
 1a0:	20003000 	.long	0x20003000
 1a4:	0000ffff 	.long	0x0000ffff
 1a8:	00000fff 	.long	0x00000fff
 1ac:	0000eeee 	.long	0x0000eeee
 1b0:	00000eee 	.long	0x00000eee

000001b4 <vPortStartTask>:
 *
 ********************************************************************/
.global vPortStartTask
.type   vPortStartTask, %function
vPortStartTask:
    psrclr   ie
 1b4:	c0807020 	psrclr      	ie
    lrw      r4, pxCurrentTCB
 1b8:	118a      	lrw      	r4, 0x200000dc	// 260 <vPortYield+0x72>
    ld.w     r4, (r4)                // the current task stack pointer is the first member
 1ba:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 1bc:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 48)
 1c0:	980c      	ld.w      	r0, (r14, 0x30)
    mtcr     r0, epc
 1c2:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 44)
 1c6:	980b      	ld.w      	r0, (r14, 0x2c)
    mtcr     r0, epsr
 1c8:	c0006422 	mtcr      	r0, cr<2, 0>
    ldw      r15, (sp, 40)
 1cc:	d9ee200a 	ld.w      	r15, (r14, 0x28)
	ldw      r13, (sp,36)
 1d0:	d9ae2009 	ld.w      	r13, (r14, 0x24)
	ldw      r8, (sp,32)
 1d4:	d90e2008 	ld.w      	r8, (r14, 0x20)
	ldw      r7, (sp,28)
 1d8:	98e7      	ld.w      	r7, (r14, 0x1c)
	ldw      r6, (sp,24)
 1da:	98c6      	ld.w      	r6, (r14, 0x18)
	ldw      r5, (sp,20)
 1dc:	98a5      	ld.w      	r5, (r14, 0x14)
	ldw      r4, (sp,16)
 1de:	9884      	ld.w      	r4, (r14, 0x10)
	ldw      r3, (sp,12)
 1e0:	9863      	ld.w      	r3, (r14, 0xc)
	ldw      r2, (sp,8)
 1e2:	9842      	ld.w      	r2, (r14, 0x8)
	ldw      r1, (sp,4)
 1e4:	9821      	ld.w      	r1, (r14, 0x4)
	ldw      r0, (sp,0)
 1e6:	9800      	ld.w      	r0, (r14, 0x0)
    addi     sp, 52
 1e8:	140d      	addi      	r14, r14, 52
    rte
 1ea:	c0004020 	rte

000001ee <vPortYield>:
 *
 ********************************************************************/
.global vPortYield
.type   vPortYield, %function
vPortYield:
    psrclr  ee
 1ee:	c1007020 	psrclr      	ee
    subi    sp, 52
 1f2:	142d      	subi      	r14, r14, 52
	stw     r0, (sp,0)
 1f4:	b800      	st.w      	r0, (r14, 0x0)
	stw     r1, (sp,4)
 1f6:	b821      	st.w      	r1, (r14, 0x4)
	stw     r2, (sp,8)
 1f8:	b842      	st.w      	r2, (r14, 0x8)
	stw     r3, (sp,12)
 1fa:	b863      	st.w      	r3, (r14, 0xc)
	stw     r4, (sp,16)
 1fc:	b884      	st.w      	r4, (r14, 0x10)
	stw     r5, (sp,20)
 1fe:	b8a5      	st.w      	r5, (r14, 0x14)
	stw     r6, (sp,24)
 200:	b8c6      	st.w      	r6, (r14, 0x18)
	stw     r7, (sp,28)
 202:	b8e7      	st.w      	r7, (r14, 0x1c)
	stw     r8, (sp,32)
 204:	dd0e2008 	st.w      	r8, (r14, 0x20)
	stw     r13, (sp,36)
 208:	ddae2009 	st.w      	r13, (r14, 0x24)
	stw     r15, (sp,40)
 20c:	ddee200a 	st.w      	r15, (r14, 0x28)
    mfcr    r0, psr
 210:	c0006020 	mfcr      	r0, cr<0, 0>
    bseti   r0, 8
 214:	38a8      	bseti      	r0, 8
    stw     r0, (sp, 44)
 216:	b80b      	st.w      	r0, (r14, 0x2c)
    stw     r15, (sp, 48)
 218:	ddee200c 	st.w      	r15, (r14, 0x30)

    lrw     r2, pxCurrentTCB
 21c:	1051      	lrw      	r2, 0x200000dc	// 260 <vPortYield+0x72>
    ld.w    r3, (r2)
 21e:	9260      	ld.w      	r3, (r2, 0x0)
    st.w    sp, (r3)
 220:	ddc32000 	st.w      	r14, (r3, 0x0)

    jbsr    vTaskSwitchContext
 224:	e0000e98 	bsr      	0x1f54	// 1f54 <vTaskSwitchContext>
	
    lrw     r4, pxCurrentTCB
 228:	108e      	lrw      	r4, 0x200000dc	// 260 <vPortYield+0x72>
    ld.w    r4, (r4)
 22a:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w    sp, (r4)
 22c:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 48)
 230:	980c      	ld.w      	r0, (r14, 0x30)
    mtcr     r0, epc
 232:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 44)
 236:	980b      	ld.w      	r0, (r14, 0x2c)
    mtcr     r0, epsr
 238:	c0006422 	mtcr      	r0, cr<2, 0>
    ldw      r15, (sp, 40)
 23c:	d9ee200a 	ld.w      	r15, (r14, 0x28)
	ldw      r13, (sp,36)
 240:	d9ae2009 	ld.w      	r13, (r14, 0x24)
	ldw      r8, (sp,32)
 244:	d90e2008 	ld.w      	r8, (r14, 0x20)
	ldw      r7, (sp,28)
 248:	98e7      	ld.w      	r7, (r14, 0x1c)
	ldw      r6, (sp,24)
 24a:	98c6      	ld.w      	r6, (r14, 0x18)
	ldw      r5, (sp,20)
 24c:	98a5      	ld.w      	r5, (r14, 0x14)
	ldw      r4, (sp,16)
 24e:	9884      	ld.w      	r4, (r14, 0x10)
	ldw      r3, (sp,12)
 250:	9863      	ld.w      	r3, (r14, 0xc)
	ldw      r2, (sp,8)
 252:	9842      	ld.w      	r2, (r14, 0x8)
	ldw      r1, (sp,4)
 254:	9821      	ld.w      	r1, (r14, 0x4)
	ldw      r0, (sp,0)
 256:	9800      	ld.w      	r0, (r14, 0x0)
    addi     sp, 52
 258:	140d      	addi      	r14, r14, 52

    rte
 25a:	c0004020 	rte
 25e:	0000      	.short	0x0000
 260:	200000dc 	.long	0x200000dc

00000264 <___gnu_csky_case_uqi>:
 264:	1421      	subi      	r14, r14, 4
 266:	b820      	st.w      	r1, (r14, 0x0)
 268:	6c7f      	mov      	r1, r15
 26a:	6040      	addu      	r1, r0
 26c:	8120      	ld.b      	r1, (r1, 0x0)
 26e:	4121      	lsli      	r1, r1, 1
 270:	63c4      	addu      	r15, r1
 272:	9820      	ld.w      	r1, (r14, 0x0)
 274:	1401      	addi      	r14, r14, 4
 276:	783c      	jmp      	r15

00000278 <__cskyvprintfprintf>:
 278:	1424      	subi      	r14, r14, 16
 27a:	b863      	st.w      	r3, (r14, 0xc)
 27c:	b842      	st.w      	r2, (r14, 0x8)
 27e:	b821      	st.w      	r1, (r14, 0x4)
 280:	b800      	st.w      	r0, (r14, 0x0)
 282:	14d0      	push      	r15
 284:	1421      	subi      	r14, r14, 4
 286:	9802      	ld.w      	r0, (r14, 0x8)
 288:	1903      	addi      	r1, r14, 12
 28a:	b800      	st.w      	r0, (r14, 0x0)
 28c:	e000002e 	bsr      	0x2e8	// 2e8 <__cskyvprintfvprintf>
 290:	1401      	addi      	r14, r14, 4
 292:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 296:	1405      	addi      	r14, r14, 20
 298:	783c      	jmp      	r15
	...

0000029c <__GI_puts>:
 29c:	14d1      	push      	r4, r15
 29e:	1085      	lrw      	r4, 0x20000090	// 2b0 <__GI_puts+0x14>
 2a0:	9420      	ld.w      	r1, (r4, 0x0)
 2a2:	e0000033 	bsr      	0x308	// 308 <__GI_fputs>
 2a6:	9420      	ld.w      	r1, (r4, 0x0)
 2a8:	300a      	movi      	r0, 10
 2aa:	e0000a3b 	bsr      	0x1720	// 1720 <fputc>
 2ae:	1491      	pop      	r4, r15
 2b0:	20000090 	.long	0x20000090

000002b4 <__stdio_outs>:
 2b4:	14d3      	push      	r4-r6, r15
 2b6:	10ac      	lrw      	r5, 0x20000090	// 2e4 <__stdio_outs+0x30>
 2b8:	6d03      	mov      	r4, r0
 2ba:	9500      	ld.w      	r0, (r5, 0x0)
 2bc:	6d87      	mov      	r6, r1
 2be:	2017      	addi      	r0, 24
 2c0:	e00000c0 	bsr      	0x440	// 440 <__GI_os_critical_enter>
 2c4:	6190      	addu      	r6, r4
 2c6:	6592      	cmpne      	r4, r6
 2c8:	0807      	bt      	0x2d6	// 2d6 <__stdio_outs+0x22>
 2ca:	9500      	ld.w      	r0, (r5, 0x0)
 2cc:	2017      	addi      	r0, 24
 2ce:	e00000bb 	bsr      	0x444	// 444 <__GI_os_critical_exit>
 2d2:	3001      	movi      	r0, 1
 2d4:	1493      	pop      	r4-r6, r15
 2d6:	8400      	ld.b      	r0, (r4, 0x0)
 2d8:	9520      	ld.w      	r1, (r5, 0x0)
 2da:	e0000a23 	bsr      	0x1720	// 1720 <fputc>
 2de:	2400      	addi      	r4, 1
 2e0:	07f3      	br      	0x2c6	// 2c6 <__stdio_outs+0x12>
 2e2:	0000      	bkpt
 2e4:	20000090 	.long	0x20000090

000002e8 <__cskyvprintfvprintf>:
 2e8:	14d0      	push      	r15
 2ea:	1422      	subi      	r14, r14, 8
 2ec:	6c87      	mov      	r2, r1
 2ee:	1026      	lrw      	r1, 0x2b4	// 304 <__cskyvprintfvprintf+0x1c>
 2f0:	3300      	movi      	r3, 0
 2f2:	b821      	st.w      	r1, (r14, 0x4)
 2f4:	6c43      	mov      	r1, r0
 2f6:	6c3b      	mov      	r0, r14
 2f8:	b860      	st.w      	r3, (r14, 0x0)
 2fa:	e00000a9 	bsr      	0x44c	// 44c <__v2_printf>
 2fe:	1402      	addi      	r14, r14, 8
 300:	1490      	pop      	r15
 302:	0000      	bkpt
 304:	000002b4 	.long	0x000002b4

00000308 <__GI_fputs>:
 308:	14d4      	push      	r4-r7, r15
 30a:	1422      	subi      	r14, r14, 8
 30c:	3940      	cmpnei      	r1, 0
 30e:	6dc3      	mov      	r7, r0
 310:	6d87      	mov      	r6, r1
 312:	0806      	bt      	0x31e	// 31e <__GI_fputs+0x16>
 314:	3400      	movi      	r4, 0
 316:	2c00      	subi      	r4, 1
 318:	6c13      	mov      	r0, r4
 31a:	1402      	addi      	r14, r14, 8
 31c:	1494      	pop      	r4-r7, r15
 31e:	3018      	movi      	r0, 24
 320:	6004      	addu      	r0, r1
 322:	b800      	st.w      	r0, (r14, 0x0)
 324:	e000008e 	bsr      	0x440	// 440 <__GI_os_critical_enter>
 328:	3200      	movi      	r2, 0
 32a:	6d5f      	mov      	r5, r7
 32c:	2a00      	subi      	r2, 1
 32e:	8500      	ld.b      	r0, (r5, 0x0)
 330:	3840      	cmpnei      	r0, 0
 332:	5d9d      	subu      	r4, r5, r7
 334:	0805      	bt      	0x33e	// 33e <__GI_fputs+0x36>
 336:	9800      	ld.w      	r0, (r14, 0x0)
 338:	e0000086 	bsr      	0x444	// 444 <__GI_os_critical_exit>
 33c:	07ee      	br      	0x318	// 318 <__GI_fputs+0x10>
 33e:	6c5b      	mov      	r1, r6
 340:	b841      	st.w      	r2, (r14, 0x4)
 342:	e00009ef 	bsr      	0x1720	// 1720 <fputc>
 346:	9841      	ld.w      	r2, (r14, 0x4)
 348:	6482      	cmpne      	r0, r2
 34a:	0fe5      	bf      	0x314	// 314 <__GI_fputs+0xc>
 34c:	2500      	addi      	r5, 1
 34e:	07f0      	br      	0x32e	// 32e <__GI_fputs+0x26>

00000350 <__memset_fast>:
 350:	14c3      	push      	r4-r6
 352:	7444      	zextb      	r1, r1
 354:	3a40      	cmpnei      	r2, 0
 356:	0c1f      	bf      	0x394	// 394 <__memset_fast+0x44>
 358:	6d43      	mov      	r5, r0
 35a:	6d03      	mov      	r4, r0
 35c:	3603      	movi      	r6, 3
 35e:	6918      	and      	r4, r6
 360:	3c40      	cmpnei      	r4, 0
 362:	0c1a      	bf      	0x396	// 396 <__memset_fast+0x46>
 364:	a520      	st.b      	r1, (r5, 0x0)
 366:	2a00      	subi      	r2, 1
 368:	3a40      	cmpnei      	r2, 0
 36a:	0c15      	bf      	0x394	// 394 <__memset_fast+0x44>
 36c:	2500      	addi      	r5, 1
 36e:	6d17      	mov      	r4, r5
 370:	3603      	movi      	r6, 3
 372:	6918      	and      	r4, r6
 374:	3c40      	cmpnei      	r4, 0
 376:	0c10      	bf      	0x396	// 396 <__memset_fast+0x46>
 378:	a520      	st.b      	r1, (r5, 0x0)
 37a:	2a00      	subi      	r2, 1
 37c:	3a40      	cmpnei      	r2, 0
 37e:	0c0b      	bf      	0x394	// 394 <__memset_fast+0x44>
 380:	2500      	addi      	r5, 1
 382:	6d17      	mov      	r4, r5
 384:	3603      	movi      	r6, 3
 386:	6918      	and      	r4, r6
 388:	3c40      	cmpnei      	r4, 0
 38a:	0c06      	bf      	0x396	// 396 <__memset_fast+0x46>
 38c:	a520      	st.b      	r1, (r5, 0x0)
 38e:	2a00      	subi      	r2, 1
 390:	2500      	addi      	r5, 1
 392:	0402      	br      	0x396	// 396 <__memset_fast+0x46>
 394:	1483      	pop      	r4-r6
 396:	4168      	lsli      	r3, r1, 8
 398:	6c4c      	or      	r1, r3
 39a:	4170      	lsli      	r3, r1, 16
 39c:	6c4c      	or      	r1, r3
 39e:	3a2f      	cmplti      	r2, 16
 3a0:	0809      	bt      	0x3b2	// 3b2 <__memset_fast+0x62>
 3a2:	b520      	st.w      	r1, (r5, 0x0)
 3a4:	b521      	st.w      	r1, (r5, 0x4)
 3a6:	b522      	st.w      	r1, (r5, 0x8)
 3a8:	b523      	st.w      	r1, (r5, 0xc)
 3aa:	2a0f      	subi      	r2, 16
 3ac:	250f      	addi      	r5, 16
 3ae:	3a2f      	cmplti      	r2, 16
 3b0:	0ff9      	bf      	0x3a2	// 3a2 <__memset_fast+0x52>
 3b2:	3a23      	cmplti      	r2, 4
 3b4:	0806      	bt      	0x3c0	// 3c0 <__memset_fast+0x70>
 3b6:	2a03      	subi      	r2, 4
 3b8:	b520      	st.w      	r1, (r5, 0x0)
 3ba:	2503      	addi      	r5, 4
 3bc:	3a23      	cmplti      	r2, 4
 3be:	0ffc      	bf      	0x3b6	// 3b6 <__memset_fast+0x66>
 3c0:	3a40      	cmpnei      	r2, 0
 3c2:	0fe9      	bf      	0x394	// 394 <__memset_fast+0x44>
 3c4:	2a00      	subi      	r2, 1
 3c6:	a520      	st.b      	r1, (r5, 0x0)
 3c8:	3a40      	cmpnei      	r2, 0
 3ca:	0fe5      	bf      	0x394	// 394 <__memset_fast+0x44>
 3cc:	2a00      	subi      	r2, 1
 3ce:	a521      	st.b      	r1, (r5, 0x1)
 3d0:	3a40      	cmpnei      	r2, 0
 3d2:	0fe1      	bf      	0x394	// 394 <__memset_fast+0x44>
 3d4:	a522      	st.b      	r1, (r5, 0x2)
 3d6:	1483      	pop      	r4-r6

000003d8 <__memcpy_fast>:
 3d8:	14c3      	push      	r4-r6
 3da:	6d83      	mov      	r6, r0
 3dc:	6d07      	mov      	r4, r1
 3de:	6d18      	or      	r4, r6
 3e0:	3303      	movi      	r3, 3
 3e2:	690c      	and      	r4, r3
 3e4:	3c40      	cmpnei      	r4, 0
 3e6:	0c0b      	bf      	0x3fc	// 3fc <__memcpy_fast+0x24>
 3e8:	3a40      	cmpnei      	r2, 0
 3ea:	0c08      	bf      	0x3fa	// 3fa <__memcpy_fast+0x22>
 3ec:	8160      	ld.b      	r3, (r1, 0x0)
 3ee:	2100      	addi      	r1, 1
 3f0:	2a00      	subi      	r2, 1
 3f2:	a660      	st.b      	r3, (r6, 0x0)
 3f4:	2600      	addi      	r6, 1
 3f6:	3a40      	cmpnei      	r2, 0
 3f8:	0bfa      	bt      	0x3ec	// 3ec <__memcpy_fast+0x14>
 3fa:	1483      	pop      	r4-r6
 3fc:	3a2f      	cmplti      	r2, 16
 3fe:	080e      	bt      	0x41a	// 41a <__memcpy_fast+0x42>
 400:	91a0      	ld.w      	r5, (r1, 0x0)
 402:	9161      	ld.w      	r3, (r1, 0x4)
 404:	9182      	ld.w      	r4, (r1, 0x8)
 406:	b6a0      	st.w      	r5, (r6, 0x0)
 408:	91a3      	ld.w      	r5, (r1, 0xc)
 40a:	b661      	st.w      	r3, (r6, 0x4)
 40c:	b682      	st.w      	r4, (r6, 0x8)
 40e:	b6a3      	st.w      	r5, (r6, 0xc)
 410:	2a0f      	subi      	r2, 16
 412:	210f      	addi      	r1, 16
 414:	260f      	addi      	r6, 16
 416:	3a2f      	cmplti      	r2, 16
 418:	0ff4      	bf      	0x400	// 400 <__memcpy_fast+0x28>
 41a:	3a23      	cmplti      	r2, 4
 41c:	0808      	bt      	0x42c	// 42c <__memcpy_fast+0x54>
 41e:	9160      	ld.w      	r3, (r1, 0x0)
 420:	2a03      	subi      	r2, 4
 422:	2103      	addi      	r1, 4
 424:	b660      	st.w      	r3, (r6, 0x0)
 426:	2603      	addi      	r6, 4
 428:	3a23      	cmplti      	r2, 4
 42a:	0ffa      	bf      	0x41e	// 41e <__memcpy_fast+0x46>
 42c:	3a40      	cmpnei      	r2, 0
 42e:	0fe6      	bf      	0x3fa	// 3fa <__memcpy_fast+0x22>
 430:	8160      	ld.b      	r3, (r1, 0x0)
 432:	2100      	addi      	r1, 1
 434:	2a00      	subi      	r2, 1
 436:	a660      	st.b      	r3, (r6, 0x0)
 438:	2600      	addi      	r6, 1
 43a:	07f9      	br      	0x42c	// 42c <__memcpy_fast+0x54>

0000043c <__GI_os_critical_open>:
 43c:	3000      	movi      	r0, 0
 43e:	783c      	jmp      	r15

00000440 <__GI_os_critical_enter>:
 440:	3000      	movi      	r0, 0
 442:	783c      	jmp      	r15

00000444 <__GI_os_critical_exit>:
 444:	3000      	movi      	r0, 0
 446:	783c      	jmp      	r15

00000448 <__GI_os_critical_close>:
 448:	3000      	movi      	r0, 0
 44a:	783c      	jmp      	r15

0000044c <__v2_printf>:
 44c:	14d4      	push      	r4-r7, r15
 44e:	142e      	subi      	r14, r14, 56
 450:	6d83      	mov      	r6, r0
 452:	6dcb      	mov      	r7, r2
 454:	b820      	st.w      	r1, (r14, 0x0)
 456:	3500      	movi      	r5, 0
 458:	b8a1      	st.w      	r5, (r14, 0x4)
 45a:	9880      	ld.w      	r4, (r14, 0x0)
 45c:	3125      	movi      	r1, 37
 45e:	8460      	ld.b      	r3, (r4, 0x0)
 460:	3b40      	cmpnei      	r3, 0
 462:	082d      	bt      	0x4bc	// 4bc <__v2_printf+0x70>
 464:	9800      	ld.w      	r0, (r14, 0x0)
 466:	5ca1      	subu      	r5, r4, r0
 468:	3d40      	cmpnei      	r5, 0
 46a:	0c09      	bf      	0x47c	// 47c <__v2_printf+0x30>
 46c:	6c57      	mov      	r1, r5
 46e:	9661      	ld.w      	r3, (r6, 0x4)
 470:	9640      	ld.w      	r2, (r6, 0x0)
 472:	9800      	ld.w      	r0, (r14, 0x0)
 474:	7bcd      	jsr      	r3
 476:	9821      	ld.w      	r1, (r14, 0x4)
 478:	6054      	addu      	r1, r5
 47a:	b821      	st.w      	r1, (r14, 0x4)
 47c:	8440      	ld.b      	r2, (r4, 0x0)
 47e:	3a40      	cmpnei      	r2, 0
 480:	0c9b      	bf      	0x5b6	// 5b6 <__v2_printf+0x16a>
 482:	3500      	movi      	r5, 0
 484:	dcae000f 	st.b      	r5, (r14, 0xf)
 488:	2400      	addi      	r4, 1
 48a:	3100      	movi      	r1, 0
 48c:	3200      	movi      	r2, 0
 48e:	3563      	movi      	r5, 99
 490:	5c02      	addi      	r0, r4, 1
 492:	8480      	ld.b      	r4, (r4, 0x0)
 494:	6552      	cmpne      	r4, r5
 496:	b800      	st.w      	r0, (r14, 0x0)
 498:	0c33      	bf      	0x4fe	// 4fe <__v2_printf+0xb2>
 49a:	6514      	cmphs      	r5, r4
 49c:	0c14      	bf      	0x4c4	// 4c4 <__v2_printf+0x78>
 49e:	332b      	movi      	r3, 43
 4a0:	64d2      	cmpne      	r4, r3
 4a2:	0c2c      	bf      	0x4fa	// 4fa <__v2_printf+0xae>
 4a4:	302d      	movi      	r0, 45
 4a6:	6412      	cmpne      	r4, r0
 4a8:	0c08      	bf      	0x4b8	// 4b8 <__v2_printf+0x6c>
 4aa:	3320      	movi      	r3, 32
 4ac:	64d2      	cmpne      	r4, r3
 4ae:	0813      	bt      	0x4d4	// 4d4 <__v2_printf+0x88>
 4b0:	3a40      	cmpnei      	r2, 0
 4b2:	0803      	bt      	0x4b8	// 4b8 <__v2_printf+0x6c>
 4b4:	3220      	movi      	r2, 32
 4b6:	3101      	movi      	r1, 1
 4b8:	9880      	ld.w      	r4, (r14, 0x0)
 4ba:	07eb      	br      	0x490	// 490 <__v2_printf+0x44>
 4bc:	644e      	cmpne      	r3, r1
 4be:	0fd3      	bf      	0x464	// 464 <__v2_printf+0x18>
 4c0:	2400      	addi      	r4, 1
 4c2:	07ce      	br      	0x45e	// 45e <__v2_printf+0x12>
 4c4:	3069      	movi      	r0, 105
 4c6:	6412      	cmpne      	r4, r0
 4c8:	0c25      	bf      	0x512	// 512 <__v2_printf+0xc6>
 4ca:	6500      	cmphs      	r0, r4
 4cc:	0c0c      	bf      	0x4e4	// 4e4 <__v2_printf+0x98>
 4ce:	3364      	movi      	r3, 100
 4d0:	64d2      	cmpne      	r4, r3
 4d2:	0c20      	bf      	0x512	// 512 <__v2_printf+0xc6>
 4d4:	3c40      	cmpnei      	r4, 0
 4d6:	0c70      	bf      	0x5b6	// 5b6 <__v2_printf+0x16a>
 4d8:	3500      	movi      	r5, 0
 4da:	dc8e0010 	st.b      	r4, (r14, 0x10)
 4de:	dcae000f 	st.b      	r5, (r14, 0xf)
 4e2:	0415      	br      	0x50c	// 50c <__v2_printf+0xc0>
 4e4:	3273      	movi      	r2, 115
 4e6:	6492      	cmpne      	r4, r2
 4e8:	0c2e      	bf      	0x544	// 544 <__v2_printf+0xf8>
 4ea:	3175      	movi      	r1, 117
 4ec:	6452      	cmpne      	r4, r1
 4ee:	0bf3      	bt      	0x4d4	// 4d4 <__v2_printf+0x88>
 4f0:	5f8e      	addi      	r4, r7, 4
 4f2:	b882      	st.w      	r4, (r14, 0x8)
 4f4:	97e0      	ld.w      	r7, (r7, 0x0)
 4f6:	3000      	movi      	r0, 0
 4f8:	0419      	br      	0x52a	// 52a <__v2_printf+0xde>
 4fa:	322b      	movi      	r2, 43
 4fc:	07dd      	br      	0x4b6	// 4b6 <__v2_printf+0x6a>
 4fe:	8740      	ld.b      	r2, (r7, 0x0)
 500:	3300      	movi      	r3, 0
 502:	dc4e0010 	st.b      	r2, (r14, 0x10)
 506:	dc6e000f 	st.b      	r3, (r14, 0xf)
 50a:	2703      	addi      	r7, 4
 50c:	3501      	movi      	r5, 1
 50e:	1c04      	addi      	r4, r14, 16
 510:	0425      	br      	0x55a	// 55a <__v2_printf+0x10e>
 512:	3940      	cmpnei      	r1, 0
 514:	0c03      	bf      	0x51a	// 51a <__v2_printf+0xce>
 516:	dc4e000f 	st.b      	r2, (r14, 0xf)
 51a:	5f2e      	addi      	r1, r7, 4
 51c:	97e0      	ld.w      	r7, (r7, 0x0)
 51e:	3fdf      	btsti      	r7, 31
 520:	b822      	st.w      	r1, (r14, 0x8)
 522:	0c06      	bf      	0x52e	// 52e <__v2_printf+0xe2>
 524:	3500      	movi      	r5, 0
 526:	5dfd      	subu      	r7, r5, r7
 528:	302d      	movi      	r0, 45
 52a:	dc0e000f 	st.b      	r0, (r14, 0xf)
 52e:	3f09      	cmphsi      	r7, 10
 530:	0832      	bt      	0x594	// 594 <__v2_printf+0x148>
 532:	1c0c      	addi      	r4, r14, 48
 534:	272f      	addi      	r7, 48
 536:	a4e7      	st.b      	r7, (r4, 0x7)
 538:	1c04      	addi      	r4, r14, 16
 53a:	2426      	addi      	r4, 39
 53c:	180e      	addi      	r0, r14, 56
 53e:	58b1      	subu      	r5, r0, r4
 540:	98e2      	ld.w      	r7, (r14, 0x8)
 542:	040c      	br      	0x55a	// 55a <__v2_printf+0x10e>
 544:	9780      	ld.w      	r4, (r7, 0x0)
 546:	5f6e      	addi      	r3, r7, 4
 548:	3700      	movi      	r7, 0
 54a:	dcee000f 	st.b      	r7, (r14, 0xf)
 54e:	6d53      	mov      	r5, r4
 550:	8540      	ld.b      	r2, (r5, 0x0)
 552:	3a40      	cmpnei      	r2, 0
 554:	081e      	bt      	0x590	// 590 <__v2_printf+0x144>
 556:	6152      	subu      	r5, r4
 558:	6dcf      	mov      	r7, r3
 55a:	3ddf      	btsti      	r5, 31
 55c:	b8a2      	st.w      	r5, (r14, 0x8)
 55e:	0c03      	bf      	0x564	// 564 <__v2_printf+0x118>
 560:	3100      	movi      	r1, 0
 562:	b822      	st.w      	r1, (r14, 0x8)
 564:	d80e000f 	ld.b      	r0, (r14, 0xf)
 568:	3840      	cmpnei      	r0, 0
 56a:	0c0a      	bf      	0x57e	// 57e <__v2_printf+0x132>
 56c:	9842      	ld.w      	r2, (r14, 0x8)
 56e:	2200      	addi      	r2, 1
 570:	1803      	addi      	r0, r14, 12
 572:	b842      	st.w      	r2, (r14, 0x8)
 574:	9661      	ld.w      	r3, (r6, 0x4)
 576:	9640      	ld.w      	r2, (r6, 0x0)
 578:	3101      	movi      	r1, 1
 57a:	2002      	addi      	r0, 3
 57c:	7bcd      	jsr      	r3
 57e:	6c57      	mov      	r1, r5
 580:	6c13      	mov      	r0, r4
 582:	9661      	ld.w      	r3, (r6, 0x4)
 584:	9640      	ld.w      	r2, (r6, 0x0)
 586:	7bcd      	jsr      	r3
 588:	98a1      	ld.w      	r5, (r14, 0x4)
 58a:	9882      	ld.w      	r4, (r14, 0x8)
 58c:	6150      	addu      	r5, r4
 58e:	0765      	br      	0x458	// 458 <__v2_printf+0xc>
 590:	2500      	addi      	r5, 1
 592:	07df      	br      	0x550	// 550 <__v2_printf+0x104>
 594:	1c0e      	addi      	r4, r14, 56
 596:	3530      	movi      	r5, 48
 598:	310a      	movi      	r1, 10
 59a:	6c1f      	mov      	r0, r7
 59c:	e0000910 	bsr      	0x17bc	// 17bc <__umodsi3>
 5a0:	6014      	addu      	r0, r5
 5a2:	2c00      	subi      	r4, 1
 5a4:	a400      	st.b      	r0, (r4, 0x0)
 5a6:	310a      	movi      	r1, 10
 5a8:	6c1f      	mov      	r0, r7
 5aa:	e00008f7 	bsr      	0x1798	// 1798 <__udivsi3>
 5ae:	3840      	cmpnei      	r0, 0
 5b0:	6dc3      	mov      	r7, r0
 5b2:	0bf3      	bt      	0x598	// 598 <__v2_printf+0x14c>
 5b4:	07c4      	br      	0x53c	// 53c <__v2_printf+0xf0>
 5b6:	9801      	ld.w      	r0, (r14, 0x4)
 5b8:	140e      	addi      	r14, r14, 56
 5ba:	1494      	pop      	r4-r7, r15

Disassembly of section .text.__main:

000005bc <__main>:
extern char _bss_start[];
extern char _ebss[];


void __main( void ) 
{
 5bc:	14d0      	push      	r15

  /* if the start of data (dst)
     is not equal to end of text (src) then
     copy it, else it's already in the right place
     */
  if( _start_data != _end_rodata ) {
 5be:	1009      	lrw      	r0, 0x20000000	// 5e0 <__main+0x24>
 5c0:	1029      	lrw      	r1, 0x2720	// 5e4 <__main+0x28>
 5c2:	6442      	cmpne      	r0, r1
 5c4:	0c05      	bf      	0x5ce	// 5ce <__main+0x12>
//    __memcpy_fast( dst, src, (_end_data - _start_data));
    memcpy( dst, src, (_end_data - _start_data));
 5c6:	1049      	lrw      	r2, 0x200000d0	// 5e8 <__main+0x2c>
 5c8:	6082      	subu      	r2, r0
 5ca:	e3ffff07 	bsr      	0x3d8	// 3d8 <__memcpy_fast>
  }

  /* zero the bss 
   */
  if( _ebss - _bss_start ) {
 5ce:	1048      	lrw      	r2, 0x20000e38	// 5ec <__main+0x30>
 5d0:	1008      	lrw      	r0, 0x200000d0	// 5f0 <__main+0x34>
 5d2:	640a      	cmpne      	r2, r0
 5d4:	0c05      	bf      	0x5de	// 5de <__main+0x22>
//    __memset_fast( _bss_start, 0x00, ( _ebss - _bss_start ));
    memset( _bss_start, 0x00, ( _ebss - _bss_start ));
 5d6:	6082      	subu      	r2, r0
 5d8:	3100      	movi      	r1, 0
 5da:	e3fffebb 	bsr      	0x350	// 350 <__memset_fast>
  }

	
}
 5de:	1490      	pop      	r15
 5e0:	20000000 	.long	0x20000000
 5e4:	00002720 	.long	0x00002720
 5e8:	200000d0 	.long	0x200000d0
 5ec:	20000e38 	.long	0x20000e38
 5f0:	200000d0 	.long	0x200000d0

Disassembly of section .text.SYSCON_General_CMD.part.0:

000005f4 <SYSCON_General_CMD.part.0>:
/*************************************************************/  
void SYSCON_General_CMD(FunctionalStatus NewState, SYSCON_General_CMD_TypeDef ENDIS_X )
{
	if (NewState != DISABLE)
	{
		if(ENDIS_X==ENDIS_EMOSC) 
 5f4:	3848      	cmpnei      	r0, 8
 5f6:	080a      	bt      	0x60a	// 60a <SYSCON_General_CMD.part.0+0x16>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFF00FFF)|0x00044000;					//enable EMOSC PIN
 5f8:	107a      	lrw      	r3, 0x2000004c	// 660 <SYSCON_General_CMD.part.0+0x6c>
 5fa:	32ff      	movi      	r2, 255
 5fc:	9320      	ld.w      	r1, (r3, 0x0)
 5fe:	9160      	ld.w      	r3, (r1, 0x0)
 600:	424c      	lsli      	r2, r2, 12
 602:	68c9      	andn      	r3, r2
 604:	3bae      	bseti      	r3, 14
 606:	3bb2      	bseti      	r3, 18
 608:	b160      	st.w      	r3, (r1, 0x0)
		SYSCON->GCER|=ENDIS_X;													//enable SYSCON General Control
 60a:	1077      	lrw      	r3, 0x2000005c	// 664 <SYSCON_General_CMD.part.0+0x70>
 60c:	9360      	ld.w      	r3, (r3, 0x0)
 60e:	9341      	ld.w      	r2, (r3, 0x4)
 610:	6c80      	or      	r2, r0
 612:	b341      	st.w      	r2, (r3, 0x4)
		while(!(SYSCON->GCSR&ENDIS_X));											//check  Enable?	
 614:	9343      	ld.w      	r2, (r3, 0xc)
 616:	6880      	and      	r2, r0
 618:	3a40      	cmpnei      	r2, 0
 61a:	0ffd      	bf      	0x614	// 614 <SYSCON_General_CMD.part.0+0x20>
		switch(ENDIS_X)
 61c:	3842      	cmpnei      	r0, 2
 61e:	0807      	bt      	0x62c	// 62c <SYSCON_General_CMD.part.0+0x38>
		{
			case ENDIS_IMOSC:
				while (!(SYSCON->CKST & ENDIS_IMOSC)); 	
 620:	3102      	movi      	r1, 2
 622:	9344      	ld.w      	r2, (r3, 0x10)
 624:	6884      	and      	r2, r1
 626:	3a40      	cmpnei      	r2, 0
 628:	0ffd      	bf      	0x622	// 622 <SYSCON_General_CMD.part.0+0x2e>
	{
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
		while(SYSCON->GCSR&ENDIS_X);											//check Disable?
		SYSCON->ICR|=ENDIS_X;													//Clear ENDIS_X stable bit
	}
}
 62a:	783c      	jmp      	r15
		switch(ENDIS_X)
 62c:	3802      	cmphsi      	r0, 3
 62e:	0809      	bt      	0x640	// 640 <SYSCON_General_CMD.part.0+0x4c>
 630:	3841      	cmpnei      	r0, 1
 632:	0bfc      	bt      	0x62a	// 62a <SYSCON_General_CMD.part.0+0x36>
				while (!(SYSCON->CKST & ENDIS_ISOSC)); 
 634:	3101      	movi      	r1, 1
 636:	9344      	ld.w      	r2, (r3, 0x10)
 638:	6884      	and      	r2, r1
 63a:	3a40      	cmpnei      	r2, 0
 63c:	0ffd      	bf      	0x636	// 636 <SYSCON_General_CMD.part.0+0x42>
 63e:	07f6      	br      	0x62a	// 62a <SYSCON_General_CMD.part.0+0x36>
		switch(ENDIS_X)
 640:	3848      	cmpnei      	r0, 8
 642:	0807      	bt      	0x650	// 650 <SYSCON_General_CMD.part.0+0x5c>
				while (!(SYSCON->CKST & ENDIS_EMOSC)); 
 644:	3108      	movi      	r1, 8
 646:	9344      	ld.w      	r2, (r3, 0x10)
 648:	6884      	and      	r2, r1
 64a:	3a40      	cmpnei      	r2, 0
 64c:	0ffd      	bf      	0x646	// 646 <SYSCON_General_CMD.part.0+0x52>
 64e:	07ee      	br      	0x62a	// 62a <SYSCON_General_CMD.part.0+0x36>
		switch(ENDIS_X)
 650:	3850      	cmpnei      	r0, 16
 652:	0bec      	bt      	0x62a	// 62a <SYSCON_General_CMD.part.0+0x36>
				while (!(SYSCON->CKST & ENDIS_HFOSC)); 
 654:	3110      	movi      	r1, 16
 656:	9344      	ld.w      	r2, (r3, 0x10)
 658:	6884      	and      	r2, r1
 65a:	3a40      	cmpnei      	r2, 0
 65c:	0ffd      	bf      	0x656	// 656 <SYSCON_General_CMD.part.0+0x62>
 65e:	07e6      	br      	0x62a	// 62a <SYSCON_General_CMD.part.0+0x36>
 660:	2000004c 	.long	0x2000004c
 664:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_RST_VALUE:

00000668 <SYSCON_RST_VALUE>:
	SYSCON->RAMCHK=SYSCON_RAMCHK_RST;
 668:	106f      	lrw      	r3, 0x2000005c	// 6a4 <SYSCON_RST_VALUE+0x3c>
 66a:	1050      	lrw      	r2, 0xffff	// 6a8 <SYSCON_RST_VALUE+0x40>
 66c:	9360      	ld.w      	r3, (r3, 0x0)
 66e:	b345      	st.w      	r2, (r3, 0x14)
	SYSCON->EFLCHK=SYSCON_EFLCHK_RST;
 670:	104f      	lrw      	r2, 0xffffff	// 6ac <SYSCON_RST_VALUE+0x44>
 672:	b346      	st.w      	r2, (r3, 0x18)
	SYSCON->SCLKCR=SYSCON_SCLKCR_RST;
 674:	104f      	lrw      	r2, 0xd22d0000	// 6b0 <SYSCON_RST_VALUE+0x48>
 676:	b347      	st.w      	r2, (r3, 0x1c)
	SYSCON->OSTR=SYSCON_OSTR_RST;
 678:	104f      	lrw      	r2, 0x70ff3bff	// 6b4 <SYSCON_RST_VALUE+0x4c>
 67a:	b350      	st.w      	r2, (r3, 0x40)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
 67c:	3180      	movi      	r1, 128
	SYSCON->LVDCR=SYSCON_LVDCR_RST;
 67e:	320a      	movi      	r2, 10
 680:	b353      	st.w      	r2, (r3, 0x4c)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
 682:	604c      	addu      	r1, r3
 684:	3200      	movi      	r2, 0
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
 686:	100d      	lrw      	r0, 0x70c	// 6b8 <SYSCON_RST_VALUE+0x50>
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
 688:	b145      	st.w      	r2, (r1, 0x14)
	SYSCON->UREG0=SYSCON_UREG0_RST;
 68a:	23ff      	addi      	r3, 256
	SYSCON->EXIFT=SYSCON_EXIFT_RST;
 68c:	b146      	st.w      	r2, (r1, 0x18)
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
 68e:	b10d      	st.w      	r0, (r1, 0x34)
	SYSCON->IWDCNT=SYSCON_IWDCNT_RST;
 690:	100b      	lrw      	r0, 0x3fe	// 6bc <SYSCON_RST_VALUE+0x54>
 692:	b10e      	st.w      	r0, (r1, 0x38)
	SYSCON->EVTRG=SYSCON_EVTRG_RST;
 694:	b15d      	st.w      	r2, (r1, 0x74)
	SYSCON->EVPS=SYSCON_EVPS_RST;
 696:	b15e      	st.w      	r2, (r1, 0x78)
	SYSCON->EVSWF=SYSCON_EVSWF_RST;
 698:	b15f      	st.w      	r2, (r1, 0x7c)
	SYSCON->UREG0=SYSCON_UREG0_RST;
 69a:	b340      	st.w      	r2, (r3, 0x0)
	SYSCON->UREG1=SYSCON_UREG1_RST;
 69c:	b341      	st.w      	r2, (r3, 0x4)
	SYSCON->UREG2=SYSCON_UREG2_RST;
 69e:	b342      	st.w      	r2, (r3, 0x8)
	SYSCON->UREG3=SYSCON_UREG3_RST;
 6a0:	b343      	st.w      	r2, (r3, 0xc)
}
 6a2:	783c      	jmp      	r15
 6a4:	2000005c 	.long	0x2000005c
 6a8:	0000ffff 	.long	0x0000ffff
 6ac:	00ffffff 	.long	0x00ffffff
 6b0:	d22d0000 	.long	0xd22d0000
 6b4:	70ff3bff 	.long	0x70ff3bff
 6b8:	0000070c 	.long	0x0000070c
 6bc:	000003fe 	.long	0x000003fe

Disassembly of section .text.SYSCON_General_CMD:

000006c0 <SYSCON_General_CMD>:
{
 6c0:	14d0      	push      	r15
	if (NewState != DISABLE)
 6c2:	3840      	cmpnei      	r0, 0
 6c4:	0c05      	bf      	0x6ce	// 6ce <SYSCON_General_CMD+0xe>
 6c6:	6c07      	mov      	r0, r1
 6c8:	e3ffff96 	bsr      	0x5f4	// 5f4 <SYSCON_General_CMD.part.0>
}
 6cc:	1490      	pop      	r15
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
 6ce:	1068      	lrw      	r3, 0x2000005c	// 6ec <SYSCON_General_CMD+0x2c>
 6d0:	9360      	ld.w      	r3, (r3, 0x0)
 6d2:	9342      	ld.w      	r2, (r3, 0x8)
 6d4:	6c84      	or      	r2, r1
 6d6:	b342      	st.w      	r2, (r3, 0x8)
		while(SYSCON->GCSR&ENDIS_X);											//check Disable?
 6d8:	9343      	ld.w      	r2, (r3, 0xc)
 6da:	6884      	and      	r2, r1
 6dc:	3a40      	cmpnei      	r2, 0
 6de:	0bfd      	bt      	0x6d8	// 6d8 <SYSCON_General_CMD+0x18>
		SYSCON->ICR|=ENDIS_X;													//Clear ENDIS_X stable bit
 6e0:	237f      	addi      	r3, 128
 6e2:	9301      	ld.w      	r0, (r3, 0x4)
 6e4:	6c40      	or      	r1, r0
 6e6:	b321      	st.w      	r1, (r3, 0x4)
}
 6e8:	07f2      	br      	0x6cc	// 6cc <SYSCON_General_CMD+0xc>
 6ea:	0000      	bkpt
 6ec:	2000005c 	.long	0x2000005c

Disassembly of section .text.SystemCLK_HCLKDIV_PCLKDIV_Config:

000006f0 <SystemCLK_HCLKDIV_PCLKDIV_Config>:
//SystemClk_data_x:EMOSC_24M,EMOSC_16M,EMOSC_12M,EMOSC_8M,EMOSC_4M,EMOSC_36K,
//ISOSC,IMOSC,HFOSC_48M,HFOSC_24M,HFOSC_12M,HFOSC_6M
//ReturnValue:NONE
/*************************************************************/ 
void SystemCLK_HCLKDIV_PCLKDIV_Config(SystemCLK_TypeDef SYSCLK_X , SystemCLK_Div_TypeDef HCLK_DIV_X , PCLK_Div_TypeDef PCLK_DIV_X , SystemClk_data_TypeDef SystemClk_data_x )
{
 6f0:	14c2      	push      	r4-r5
	if(SystemClk_data_x==HFOSC_48M)
 6f2:	3b48      	cmpnei      	r3, 8
 6f4:	0828      	bt      	0x744	// 744 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x54>
	{
		IFC->CEDR=0X01;						//CLKEN
 6f6:	109d      	lrw      	r4, 0x20000060	// 768 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x78>
 6f8:	3501      	movi      	r5, 1
 6fa:	9480      	ld.w      	r4, (r4, 0x0)
 6fc:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X04|(0X00<<16);			//High speed mode
 6fe:	3504      	movi      	r5, 4
 700:	b4a5      	st.w      	r5, (r4, 0x14)
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==HFOSC_24M))
	{
		IFC->CEDR=0X01;						//CLKEN
		IFC->MR=0X02|(0X00<<16);			//Medium speed mode
	}
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==EMOSC_16M))
 702:	5b83      	subi      	r4, r3, 1
 704:	3c01      	cmphsi      	r4, 2
 706:	0c2b      	bf      	0x75c	// 75c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x6c>
	{
		IFC->CEDR=0X01;						//CLKEN
		IFC->MR=0X01|(0X00<<16);			//Low speed mode
	}
	if((SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_6M))
 708:	5b8b      	subi      	r4, r3, 3
	if((SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
 70a:	3c04      	cmphsi      	r4, 5
 70c:	0c03      	bf      	0x712	// 712 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x22>
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_6M))
 70e:	3b4b      	cmpnei      	r3, 11
 710:	0807      	bt      	0x71e	// 71e <SystemCLK_HCLKDIV_PCLKDIV_Config+0x2e>
	{
		IFC->CEDR=0X01;						//CLKEN
 712:	1076      	lrw      	r3, 0x20000060	// 768 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x78>
 714:	3401      	movi      	r4, 1
 716:	9360      	ld.w      	r3, (r3, 0x0)
 718:	b381      	st.w      	r4, (r3, 0x4)
		IFC->MR=0X00|(0X00<<16);			//Low speed mode
 71a:	3400      	movi      	r4, 0
 71c:	b385      	st.w      	r4, (r3, 0x14)
	}
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
 71e:	1094      	lrw      	r4, 0xd22d0000	// 76c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x7c>
 720:	6c10      	or      	r0, r4
 722:	1074      	lrw      	r3, 0x2000005c	// 770 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x80>
 724:	6c40      	or      	r1, r0
 726:	9360      	ld.w      	r3, (r3, 0x0)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
 728:	3080      	movi      	r0, 128
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
 72a:	b327      	st.w      	r1, (r3, 0x1c)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
 72c:	4001      	lsli      	r0, r0, 1
 72e:	9324      	ld.w      	r1, (r3, 0x10)
 730:	6840      	and      	r1, r0
 732:	3940      	cmpnei      	r1, 0
 734:	0ffd      	bf      	0x72e	// 72e <SystemCLK_HCLKDIV_PCLKDIV_Config+0x3e>
	SYSCON->PCLKCR=PCLK_KEY|PCLK_DIV_X;											//PCLK DIV 1 2 4 6 8 16		
 736:	1030      	lrw      	r1, 0xc33c0000	// 774 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x84>
 738:	6c48      	or      	r1, r2
 73a:	b328      	st.w      	r1, (r3, 0x20)
	while(SYSCON->PCLKCR!=PCLK_DIV_X);											//Wait PCLK DIV
 73c:	9328      	ld.w      	r1, (r3, 0x20)
 73e:	644a      	cmpne      	r2, r1
 740:	0bfe      	bt      	0x73c	// 73c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x4c>
}
 742:	1482      	pop      	r4-r5
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==HFOSC_24M))
 744:	3b40      	cmpnei      	r3, 0
 746:	0c03      	bf      	0x74c	// 74c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x5c>
 748:	3b49      	cmpnei      	r3, 9
 74a:	0807      	bt      	0x758	// 758 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x68>
		IFC->CEDR=0X01;						//CLKEN
 74c:	1087      	lrw      	r4, 0x20000060	// 768 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x78>
 74e:	3501      	movi      	r5, 1
 750:	9480      	ld.w      	r4, (r4, 0x0)
 752:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X02|(0X00<<16);			//Medium speed mode
 754:	3502      	movi      	r5, 2
 756:	b4a5      	st.w      	r5, (r4, 0x14)
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==EMOSC_16M))
 758:	3b4a      	cmpnei      	r3, 10
 75a:	0bd4      	bt      	0x702	// 702 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x12>
		IFC->CEDR=0X01;						//CLKEN
 75c:	1083      	lrw      	r4, 0x20000060	// 768 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x78>
 75e:	3501      	movi      	r5, 1
 760:	9480      	ld.w      	r4, (r4, 0x0)
 762:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X01|(0X00<<16);			//Low speed mode
 764:	b4a5      	st.w      	r5, (r4, 0x14)
 766:	07d1      	br      	0x708	// 708 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x18>
 768:	20000060 	.long	0x20000060
 76c:	d22d0000 	.long	0xd22d0000
 770:	2000005c 	.long	0x2000005c
 774:	c33c0000 	.long	0xc33c0000

Disassembly of section .text.SYSCON_HFOSC_SELECTE:

00000778 <SYSCON_HFOSC_SELECTE>:
//EntryParameter:HFOSC_SELECTE_X
//HFOSC_SELECTE_X:HFOSC_SELECTE_48M,HFOSC_SELECTE_24M;HFOSC_SELECTE_12M;HFOSC_SELECTE_6M
//ReturnValue:NONE
/*************************************************************/  
void SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_TypeDef HFOSC_SELECTE_X)
{		
 778:	14d1      	push      	r4, r15
 77a:	6d03      	mov      	r4, r0
	SYSCON_General_CMD(DISABLE,ENDIS_HFOSC);					//disable HFOSC
 77c:	3110      	movi      	r1, 16
 77e:	3000      	movi      	r0, 0
 780:	e3ffffa0 	bsr      	0x6c0	// 6c0 <SYSCON_General_CMD>
	SYSCON->OPT1 = (SYSCON->OPT1 & 0XFFFFFFCF)|HFOSC_SELECTE_X;
 784:	1066      	lrw      	r3, 0x2000005c	// 79c <SYSCON_HFOSC_SELECTE+0x24>
 786:	9360      	ld.w      	r3, (r3, 0x0)
 788:	9319      	ld.w      	r0, (r3, 0x64)
 78a:	3884      	bclri      	r0, 4
 78c:	3885      	bclri      	r0, 5
 78e:	6c10      	or      	r0, r4
 790:	b319      	st.w      	r0, (r3, 0x64)
 792:	3010      	movi      	r0, 16
 794:	e3ffff30 	bsr      	0x5f4	// 5f4 <SYSCON_General_CMD.part.0>
	SYSCON_General_CMD(ENABLE,ENDIS_HFOSC);						//enable HFOSC
}
 798:	1491      	pop      	r4, r15
 79a:	0000      	bkpt
 79c:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_WDT_CMD:

000007a0 <SYSCON_WDT_CMD>:
//EntryParameter:,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_WDT_CMD(FunctionalStatus NewState)
{
 7a0:	106c      	lrw      	r3, 0x2000005c	// 7d0 <SYSCON_WDT_CMD+0x30>
	if(NewState != DISABLE)
 7a2:	3840      	cmpnei      	r0, 0
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
 7a4:	9360      	ld.w      	r3, (r3, 0x0)
 7a6:	237f      	addi      	r3, 128
	if(NewState != DISABLE)
 7a8:	0c0a      	bf      	0x7bc	// 7bc <SYSCON_WDT_CMD+0x1c>
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
 7aa:	104b      	lrw      	r2, 0x78870000	// 7d4 <SYSCON_WDT_CMD+0x34>
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
 7ac:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
 7ae:	b34f      	st.w      	r2, (r3, 0x3c)
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
 7b0:	4125      	lsli      	r1, r1, 5
 7b2:	934d      	ld.w      	r2, (r3, 0x34)
 7b4:	6884      	and      	r2, r1
 7b6:	3a40      	cmpnei      	r2, 0
 7b8:	0ffd      	bf      	0x7b2	// 7b2 <SYSCON_WDT_CMD+0x12>
	else
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
	}
}
 7ba:	783c      	jmp      	r15
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
 7bc:	1047      	lrw      	r2, 0x788755aa	// 7d8 <SYSCON_WDT_CMD+0x38>
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
 7be:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
 7c0:	b34f      	st.w      	r2, (r3, 0x3c)
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
 7c2:	4125      	lsli      	r1, r1, 5
 7c4:	934d      	ld.w      	r2, (r3, 0x34)
 7c6:	6884      	and      	r2, r1
 7c8:	3a40      	cmpnei      	r2, 0
 7ca:	0bfd      	bt      	0x7c4	// 7c4 <SYSCON_WDT_CMD+0x24>
 7cc:	07f7      	br      	0x7ba	// 7ba <SYSCON_WDT_CMD+0x1a>
 7ce:	0000      	bkpt
 7d0:	2000005c 	.long	0x2000005c
 7d4:	78870000 	.long	0x78870000
 7d8:	788755aa 	.long	0x788755aa

Disassembly of section .text.SYSCON_IWDCNT_Reload:

000007dc <SYSCON_IWDCNT_Reload>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Reload(void)
{
	SYSCON->IWDCNT=CLR_IWDT;
 7dc:	1064      	lrw      	r3, 0x2000005c	// 7ec <SYSCON_IWDCNT_Reload+0x10>
 7de:	32b4      	movi      	r2, 180
 7e0:	9360      	ld.w      	r3, (r3, 0x0)
 7e2:	237f      	addi      	r3, 128
 7e4:	4257      	lsli      	r2, r2, 23
 7e6:	b34e      	st.w      	r2, (r3, 0x38)
}
 7e8:	783c      	jmp      	r15
 7ea:	0000      	bkpt
 7ec:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_IWDCNT_Config:

000007f0 <SYSCON_IWDCNT_Config>:
//IWDT_INTW_DIV_X:IWDT_INTW_DIV_1/2/3/4/4/5/6
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Config(IWDT_TIME_TypeDef IWDT_TIME_X , IWDT_TIMEDIV_TypeDef IWDT_INTW_DIV_X )
{
	SYSCON->IWDCR=IWDT_KEY|IWDT_TIME_X|IWDT_INTW_DIV_X;
 7f0:	1044      	lrw      	r2, 0x87780000	// 800 <SYSCON_IWDCNT_Config+0x10>
 7f2:	1065      	lrw      	r3, 0x2000005c	// 804 <SYSCON_IWDCNT_Config+0x14>
 7f4:	6c48      	or      	r1, r2
 7f6:	9360      	ld.w      	r3, (r3, 0x0)
 7f8:	6c04      	or      	r0, r1
 7fa:	237f      	addi      	r3, 128
 7fc:	b30d      	st.w      	r0, (r3, 0x34)
}
 7fe:	783c      	jmp      	r15
 800:	87780000 	.long	0x87780000
 804:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_LVD_Config:

00000808 <SYSCON_LVD_Config>:
//X_LVD_INT:ENABLE_LVD_INT,DISABLE_LVD_INT
//INTDET_POL_X:INTDET_POL_fall,INTDET_POL_X_rise,INTDET_POL_X_riseORfall
//ReturnValue: NONE
/*************************************************************/
void SYSCON_LVD_Config(X_LVDEN_TypeDef X_LVDEN , INTDET_LVL_X_TypeDef INTDET_LVL_X , RSTDET_LVL_X_TypeDef RSTDET_LVL_X , X_LVD_INT_TypeDef X_LVD_INT , INTDET_POL_X_TypeDef INTDET_POL_X)
{
 808:	14c3      	push      	r4-r6
 80a:	9883      	ld.w      	r4, (r14, 0xc)
	//SYSCON->LVDCR=LVD_KEY;
	SYSCON->LVDCR=LVD_KEY|X_LVDEN|INTDET_LVL_X|RSTDET_LVL_X|X_LVD_INT|INTDET_POL_X;
 80c:	10c5      	lrw      	r6, 0xb44b0000	// 820 <SYSCON_LVD_Config+0x18>
 80e:	6d18      	or      	r4, r6
 810:	6cd0      	or      	r3, r4
 812:	6c8c      	or      	r2, r3
 814:	6c48      	or      	r1, r2
 816:	10a4      	lrw      	r5, 0x2000005c	// 824 <SYSCON_LVD_Config+0x1c>
 818:	6c04      	or      	r0, r1
 81a:	95a0      	ld.w      	r5, (r5, 0x0)
 81c:	b513      	st.w      	r0, (r5, 0x4c)
}
 81e:	1483      	pop      	r4-r6
 820:	b44b0000 	.long	0xb44b0000
 824:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXTI_trigger_CMD:

00000828 <EXTI_trigger_CMD>:
//EXI_tringer_mode:_EXIRT,_EXIFT
//ReturnValue: LVD detection flag
/*************************************************************/
void EXTI_trigger_CMD(FunctionalStatus NewState , SYSCON_EXIPIN_TypeDef  EXIPIN , EXI_tringer_mode_TypeDef EXI_tringer_mode)
{
	switch(EXI_tringer_mode)
 828:	3a40      	cmpnei      	r2, 0
 82a:	0c04      	bf      	0x832	// 832 <EXTI_trigger_CMD+0xa>
 82c:	3a41      	cmpnei      	r2, 1
 82e:	0c0e      	bf      	0x84a	// 84a <EXTI_trigger_CMD+0x22>
		{
			SYSCON->EXIFT &=~EXIPIN;	
		}
		break;
	}	
}
 830:	783c      	jmp      	r15
 832:	106d      	lrw      	r3, 0x2000005c	// 864 <EXTI_trigger_CMD+0x3c>
		if(NewState != DISABLE)
 834:	3840      	cmpnei      	r0, 0
			SYSCON->EXIRT |=EXIPIN;
 836:	9360      	ld.w      	r3, (r3, 0x0)
 838:	237f      	addi      	r3, 128
 83a:	9345      	ld.w      	r2, (r3, 0x14)
		if(NewState != DISABLE)
 83c:	0c04      	bf      	0x844	// 844 <EXTI_trigger_CMD+0x1c>
			SYSCON->EXIRT |=EXIPIN;
 83e:	6c48      	or      	r1, r2
 840:	b325      	st.w      	r1, (r3, 0x14)
 842:	07f7      	br      	0x830	// 830 <EXTI_trigger_CMD+0x8>
			SYSCON->EXIRT &=~EXIPIN;	
 844:	6885      	andn      	r2, r1
 846:	b345      	st.w      	r2, (r3, 0x14)
 848:	07f4      	br      	0x830	// 830 <EXTI_trigger_CMD+0x8>
 84a:	1067      	lrw      	r3, 0x2000005c	// 864 <EXTI_trigger_CMD+0x3c>
		if(NewState != DISABLE)
 84c:	3840      	cmpnei      	r0, 0
			SYSCON->EXIFT |=EXIPIN;
 84e:	9360      	ld.w      	r3, (r3, 0x0)
 850:	237f      	addi      	r3, 128
 852:	9346      	ld.w      	r2, (r3, 0x18)
		if(NewState != DISABLE)
 854:	0c04      	bf      	0x85c	// 85c <EXTI_trigger_CMD+0x34>
			SYSCON->EXIFT |=EXIPIN;
 856:	6c48      	or      	r1, r2
 858:	b326      	st.w      	r1, (r3, 0x18)
 85a:	07eb      	br      	0x830	// 830 <EXTI_trigger_CMD+0x8>
			SYSCON->EXIFT &=~EXIPIN;	
 85c:	6885      	andn      	r2, r1
 85e:	b346      	st.w      	r2, (r3, 0x18)
}
 860:	07e8      	br      	0x830	// 830 <EXTI_trigger_CMD+0x8>
 862:	0000      	bkpt
 864:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_INT_Priority:

00000868 <SYSCON_INT_Priority>:
//80:Priority 2
//C0:Priority 3		lowest
/*************************************************************/
void SYSCON_INT_Priority(void)
{
	INTC_IPR0_WRITE(0XC0C0C0C0);   //IQR0-3  low bit-->high bit
 868:	1066      	lrw      	r3, 0xe000e400	// 880 <SYSCON_INT_Priority+0x18>
 86a:	1047      	lrw      	r2, 0xc0c0c0c0	// 884 <SYSCON_INT_Priority+0x1c>
	INTC_IPR1_WRITE(0XC0C0C0C0);   //IQR4-7  
	INTC_IPR2_WRITE(0XC0C0C0C0);   //IQR8-11  
	INTC_IPR3_WRITE(0XC0C0C0C0);   //IQR12-15  
	INTC_IPR4_WRITE(0XC0C0C0C0);   //IQR16-19  
	INTC_IPR5_WRITE(0XC0C0C0C0);   //IQR20-23 
	INTC_IPR6_WRITE(0XC0C000C0);   //IQR24-27  
 86c:	1027      	lrw      	r1, 0xc0c000c0	// 888 <SYSCON_INT_Priority+0x20>
	INTC_IPR0_WRITE(0XC0C0C0C0);   //IQR0-3  low bit-->high bit
 86e:	b340      	st.w      	r2, (r3, 0x0)
	INTC_IPR1_WRITE(0XC0C0C0C0);   //IQR4-7  
 870:	b341      	st.w      	r2, (r3, 0x4)
	INTC_IPR2_WRITE(0XC0C0C0C0);   //IQR8-11  
 872:	b342      	st.w      	r2, (r3, 0x8)
	INTC_IPR3_WRITE(0XC0C0C0C0);   //IQR12-15  
 874:	b343      	st.w      	r2, (r3, 0xc)
	INTC_IPR4_WRITE(0XC0C0C0C0);   //IQR16-19  
 876:	b344      	st.w      	r2, (r3, 0x10)
	INTC_IPR5_WRITE(0XC0C0C0C0);   //IQR20-23 
 878:	b345      	st.w      	r2, (r3, 0x14)
	INTC_IPR6_WRITE(0XC0C000C0);   //IQR24-27  
 87a:	b326      	st.w      	r1, (r3, 0x18)
	INTC_IPR7_WRITE(0XC0C0C0C0);   //IQR28-31
 87c:	b347      	st.w      	r2, (r3, 0x1c)
}
 87e:	783c      	jmp      	r15
 880:	e000e400 	.long	0xe000e400
 884:	c0c0c0c0 	.long	0xc0c0c0c0
 888:	c0c000c0 	.long	0xc0c000c0

Disassembly of section .text.GPIO_Init:

0000088c <GPIO_Init>:
//byte:Lowbyte(PIN_0~7),Highbyte(PIN_8~15)
//Dir:0:output 1:input
//ReturnValue:NONE
/*************************************************************/  
void GPIO_Init(CSP_GPIO_T *GPIOx,uint8_t PinNum,GPIO_Dir_TypeDef Dir)
{
 88c:	14d1      	push      	r4, r15
    uint32_t data_temp;
    uint8_t GPIO_Pin;
    if(PinNum<8)
 88e:	3907      	cmphsi      	r1, 8
{
 890:	6d03      	mov      	r4, r0
    if(PinNum<8)
 892:	0830      	bt      	0x8f2	// 8f2 <GPIO_Init+0x66>
    {
    switch (PinNum)
 894:	5903      	subi      	r0, r1, 1
 896:	3806      	cmphsi      	r0, 7
 898:	0827      	bt      	0x8e6	// 8e6 <GPIO_Init+0x5a>
 89a:	e3fffce5 	bsr      	0x264	// 264 <___gnu_csky_case_uqi>
 89e:	1004      	.short	0x1004
 8a0:	1d1a1613 	.long	0x1d1a1613
 8a4:	0021      	.short	0x0021
    {
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
        case 1:data_temp=0xffffff0f;GPIO_Pin=4;break;
 8a6:	3300      	movi      	r3, 0
 8a8:	3104      	movi      	r1, 4
 8aa:	2bf0      	subi      	r3, 241
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
    }
        if (Dir)
 8ac:	3a40      	cmpnei      	r2, 0
        {
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
 8ae:	9440      	ld.w      	r2, (r4, 0x0)
 8b0:	68c8      	and      	r3, r2
        if (Dir)
 8b2:	0c1e      	bf      	0x8ee	// 8ee <GPIO_Init+0x62>
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
 8b4:	3201      	movi      	r2, 1
        }
        else
        {
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
 8b6:	7084      	lsl      	r2, r1
 8b8:	6cc8      	or      	r3, r2
 8ba:	b460      	st.w      	r3, (r4, 0x0)
        else
        {
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
        }
    }
}
 8bc:	1491      	pop      	r4, r15
        case 2:data_temp=0xfffff0ff;GPIO_Pin=8;break;
 8be:	3108      	movi      	r1, 8
 8c0:	1166      	lrw      	r3, 0xfffff0ff	// 958 <GPIO_Init+0xcc>
 8c2:	07f5      	br      	0x8ac	// 8ac <GPIO_Init+0x20>
        case 3:data_temp=0xffff0fff;GPIO_Pin=12;break;
 8c4:	310c      	movi      	r1, 12
 8c6:	1166      	lrw      	r3, 0xffff0fff	// 95c <GPIO_Init+0xd0>
 8c8:	07f2      	br      	0x8ac	// 8ac <GPIO_Init+0x20>
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
 8ca:	3110      	movi      	r1, 16
 8cc:	1165      	lrw      	r3, 0xfff10000	// 960 <GPIO_Init+0xd4>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
 8ce:	2b00      	subi      	r3, 1
 8d0:	07ee      	br      	0x8ac	// 8ac <GPIO_Init+0x20>
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
 8d2:	3114      	movi      	r1, 20
 8d4:	1164      	lrw      	r3, 0xff100000	// 964 <GPIO_Init+0xd8>
 8d6:	07fc      	br      	0x8ce	// 8ce <GPIO_Init+0x42>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
 8d8:	33f1      	movi      	r3, 241
 8da:	3118      	movi      	r1, 24
 8dc:	4378      	lsli      	r3, r3, 24
 8de:	07f8      	br      	0x8ce	// 8ce <GPIO_Init+0x42>
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
 8e0:	311c      	movi      	r1, 28
 8e2:	1162      	lrw      	r3, 0xfffffff	// 968 <GPIO_Init+0xdc>
 8e4:	07e4      	br      	0x8ac	// 8ac <GPIO_Init+0x20>
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
 8e6:	3300      	movi      	r3, 0
 8e8:	3100      	movi      	r1, 0
 8ea:	2b0f      	subi      	r3, 16
 8ec:	07e0      	br      	0x8ac	// 8ac <GPIO_Init+0x20>
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
 8ee:	3202      	movi      	r2, 2
 8f0:	07e3      	br      	0x8b6	// 8b6 <GPIO_Init+0x2a>
    else if (PinNum<16)
 8f2:	390f      	cmphsi      	r1, 16
 8f4:	0be4      	bt      	0x8bc	// 8bc <GPIO_Init+0x30>
        switch (PinNum)
 8f6:	2908      	subi      	r1, 9
 8f8:	3906      	cmphsi      	r1, 7
 8fa:	6c07      	mov      	r0, r1
 8fc:	0827      	bt      	0x94a	// 94a <GPIO_Init+0xbe>
 8fe:	e3fffcb3 	bsr      	0x264	// 264 <___gnu_csky_case_uqi>
 902:	1004      	.short	0x1004
 904:	1d1a1613 	.long	0x1d1a1613
 908:	0021      	.short	0x0021
        case 9:data_temp=0xffffff0f;GPIO_Pin=4;break;
 90a:	3300      	movi      	r3, 0
 90c:	3104      	movi      	r1, 4
 90e:	2bf0      	subi      	r3, 241
      if (Dir)
 910:	3a40      	cmpnei      	r2, 0
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
 912:	9441      	ld.w      	r2, (r4, 0x4)
 914:	68c8      	and      	r3, r2
      if (Dir)
 916:	0c1e      	bf      	0x952	// 952 <GPIO_Init+0xc6>
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
 918:	3201      	movi      	r2, 1
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
 91a:	7084      	lsl      	r2, r1
 91c:	6cc8      	or      	r3, r2
 91e:	b461      	st.w      	r3, (r4, 0x4)
}
 920:	07ce      	br      	0x8bc	// 8bc <GPIO_Init+0x30>
        case 10:data_temp=0xfffff0ff;GPIO_Pin=8;break;
 922:	3108      	movi      	r1, 8
 924:	106d      	lrw      	r3, 0xfffff0ff	// 958 <GPIO_Init+0xcc>
 926:	07f5      	br      	0x910	// 910 <GPIO_Init+0x84>
        case 11:data_temp=0xffff0fff;GPIO_Pin=12;break;
 928:	310c      	movi      	r1, 12
 92a:	106d      	lrw      	r3, 0xffff0fff	// 95c <GPIO_Init+0xd0>
 92c:	07f2      	br      	0x910	// 910 <GPIO_Init+0x84>
        case 12:data_temp=0xfff0ffff;GPIO_Pin=16;break;
 92e:	3110      	movi      	r1, 16
 930:	106c      	lrw      	r3, 0xfff10000	// 960 <GPIO_Init+0xd4>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
 932:	2b00      	subi      	r3, 1
 934:	07ee      	br      	0x910	// 910 <GPIO_Init+0x84>
        case 13:data_temp=0xff0fffff;GPIO_Pin=20;break;
 936:	3114      	movi      	r1, 20
 938:	106b      	lrw      	r3, 0xff100000	// 964 <GPIO_Init+0xd8>
 93a:	07fc      	br      	0x932	// 932 <GPIO_Init+0xa6>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
 93c:	33f1      	movi      	r3, 241
 93e:	3118      	movi      	r1, 24
 940:	4378      	lsli      	r3, r3, 24
 942:	07f8      	br      	0x932	// 932 <GPIO_Init+0xa6>
        case 15:data_temp=0x0fffffff;GPIO_Pin=28;break;
 944:	311c      	movi      	r1, 28
 946:	1069      	lrw      	r3, 0xfffffff	// 968 <GPIO_Init+0xdc>
 948:	07e4      	br      	0x910	// 910 <GPIO_Init+0x84>
        case 8:data_temp=0xfffffff0;GPIO_Pin=0;break;
 94a:	3300      	movi      	r3, 0
 94c:	3100      	movi      	r1, 0
 94e:	2b0f      	subi      	r3, 16
 950:	07e0      	br      	0x910	// 910 <GPIO_Init+0x84>
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
 952:	3202      	movi      	r2, 2
 954:	07e3      	br      	0x91a	// 91a <GPIO_Init+0x8e>
 956:	0000      	bkpt
 958:	fffff0ff 	.long	0xfffff0ff
 95c:	ffff0fff 	.long	0xffff0fff
 960:	fff10000 	.long	0xfff10000
 964:	ff100000 	.long	0xff100000
 968:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.GPIO_Write_High:

0000096c <GPIO_Write_High>:
//bit:0~15
//ReturnValue:VALUE
/*************************************************************/
void GPIO_Write_High(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->SODR = (1ul<<bit);
 96c:	3301      	movi      	r3, 1
 96e:	70c4      	lsl      	r3, r1
 970:	b063      	st.w      	r3, (r0, 0xc)
}
 972:	783c      	jmp      	r15

Disassembly of section .text.GPIO_Write_Low:

00000974 <GPIO_Write_Low>:
void GPIO_Write_Low(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->CODR = (1ul<<bit);
 974:	3301      	movi      	r3, 1
 976:	70c4      	lsl      	r3, r1
 978:	b064      	st.w      	r3, (r0, 0x10)
}
 97a:	783c      	jmp      	r15

Disassembly of section .text.WWDT_CONFIG:

0000097c <WWDT_CONFIG>:
//WWDT CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CONFIG(WWDT_PSCDIV_TypeDef PSCDIVX,U8_T WND_DATA,WWDT_DBGEN_TypeDef DBGENX)
{
 97c:	14c1      	push      	r4
	WWDT->CFGR =WND_DATA;
 97e:	1065      	lrw      	r3, 0x20000010	// 990 <WWDT_CONFIG+0x14>
 980:	9380      	ld.w      	r4, (r3, 0x0)
 982:	b421      	st.w      	r1, (r4, 0x4)
	WWDT->CFGR |= PSCDIVX |DBGENX;
 984:	9461      	ld.w      	r3, (r4, 0x4)
 986:	6c8c      	or      	r2, r3
 988:	6c08      	or      	r0, r2
 98a:	b401      	st.w      	r0, (r4, 0x4)
}
 98c:	1481      	pop      	r4
 98e:	0000      	bkpt
 990:	20000010 	.long	0x20000010

Disassembly of section .text.WWDT_CNT_Load:

00000994 <WWDT_CNT_Load>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CNT_Load(U8_T cnt_data)
{
	WWDT->CR  |= cnt_data;						//SET
 994:	1063      	lrw      	r3, 0x20000010	// 9a0 <WWDT_CNT_Load+0xc>
 996:	9360      	ld.w      	r3, (r3, 0x0)
 998:	9340      	ld.w      	r2, (r3, 0x0)
 99a:	6c08      	or      	r0, r2
 99c:	b300      	st.w      	r0, (r3, 0x0)
}
 99e:	783c      	jmp      	r15
 9a0:	20000010 	.long	0x20000010

Disassembly of section .text.WWDT_Int_Config:

000009a4 <WWDT_Int_Config>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void WWDT_Int_Config(FunctionalStatus NewState)
{
	if (NewState != DISABLE)
 9a4:	3840      	cmpnei      	r0, 0
 9a6:	106a      	lrw      	r3, 0x20000010	// 9cc <WWDT_Int_Config+0x28>
 9a8:	0c0b      	bf      	0x9be	// 9be <WWDT_Int_Config+0x1a>
	{
		WWDT->ICR = WWDT_EVI;				
 9aa:	9360      	ld.w      	r3, (r3, 0x0)
 9ac:	3101      	movi      	r1, 1
 9ae:	b325      	st.w      	r1, (r3, 0x14)
		WWDT->IMCR  |= WWDT_EVI;
 9b0:	9344      	ld.w      	r2, (r3, 0x10)
 9b2:	6c84      	or      	r2, r1
 9b4:	b344      	st.w      	r2, (r3, 0x10)
		INTC_ISER_WRITE(WWDT_INT);  
 9b6:	3240      	movi      	r2, 64
 9b8:	1066      	lrw      	r3, 0xe000e100	// 9d0 <WWDT_Int_Config+0x2c>
	}
	else
	{
		WWDT->IMCR  &= ~WWDT_EVI;					//CLR
		INTC_ICER_WRITE(WWDT_INT);  
 9ba:	b340      	st.w      	r2, (r3, 0x0)
	}
 9bc:	783c      	jmp      	r15
		WWDT->IMCR  &= ~WWDT_EVI;					//CLR
 9be:	9340      	ld.w      	r2, (r3, 0x0)
 9c0:	9264      	ld.w      	r3, (r2, 0x10)
 9c2:	3b80      	bclri      	r3, 0
 9c4:	b264      	st.w      	r3, (r2, 0x10)
		INTC_ICER_WRITE(WWDT_INT);  
 9c6:	3240      	movi      	r2, 64
 9c8:	1063      	lrw      	r3, 0xe000e180	// 9d4 <WWDT_Int_Config+0x30>
 9ca:	07f8      	br      	0x9ba	// 9ba <WWDT_Int_Config+0x16>
 9cc:	20000010 	.long	0x20000010
 9d0:	e000e100 	.long	0xe000e100
 9d4:	e000e180 	.long	0xe000e180

Disassembly of section .text.BT_DeInit:

000009d8 <BT_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void BT_DeInit(CSP_BT_T *BTx)
{
	BTx->RSSR=BT_RESET_VALUE;
 9d8:	3300      	movi      	r3, 0
 9da:	b060      	st.w      	r3, (r0, 0x0)
	BTx->CR=BT_RESET_VALUE;
 9dc:	b061      	st.w      	r3, (r0, 0x4)
	BTx->PSCR=BT_RESET_VALUE;
 9de:	b062      	st.w      	r3, (r0, 0x8)
	BTx->PRDR=BT_RESET_VALUE;
 9e0:	b063      	st.w      	r3, (r0, 0xc)
	BTx->CMP=BT_RESET_VALUE;
 9e2:	b064      	st.w      	r3, (r0, 0x10)
	BTx->CNT=BT_RESET_VALUE;
 9e4:	b065      	st.w      	r3, (r0, 0x14)
	BTx->EVTRG=BT_RESET_VALUE;
 9e6:	b066      	st.w      	r3, (r0, 0x18)
	BTx->EVSWF=BT_RESET_VALUE;
 9e8:	b069      	st.w      	r3, (r0, 0x24)
	BTx->RISR=BT_RESET_VALUE;
 9ea:	b06a      	st.w      	r3, (r0, 0x28)
	BTx->IMCR=BT_RESET_VALUE;
 9ec:	b06b      	st.w      	r3, (r0, 0x2c)
	BTx->MISR=BT_RESET_VALUE;
 9ee:	b06c      	st.w      	r3, (r0, 0x30)
	BTx->ICR=BT_RESET_VALUE;
 9f0:	b06d      	st.w      	r3, (r0, 0x34)
}
 9f2:	783c      	jmp      	r15

Disassembly of section .text.BT_Start:

000009f4 <BT_Start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Start(CSP_BT_T *BTx)
{
	BTx->RSSR |=0X01;
 9f4:	9060      	ld.w      	r3, (r0, 0x0)
 9f6:	3ba0      	bseti      	r3, 0
 9f8:	b060      	st.w      	r3, (r0, 0x0)
}
 9fa:	783c      	jmp      	r15

Disassembly of section .text.BT_Configure:

000009fc <BT_Configure>:
//BT Configure
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Configure(CSP_BT_T *BTx,BT_CLK_TypeDef BTCLK,U16_T PSCR_DATA,BT_SHDWSTP_TypeDef BTSHDWSTP,BT_OPM_TypeDef BTOPM,BT_EXTCKM_TypeDef BTEXTCKM)
{
 9fc:	14c3      	push      	r4-r6
 9fe:	98a4      	ld.w      	r5, (r14, 0x10)
 a00:	6d97      	mov      	r6, r5
 a02:	9883      	ld.w      	r4, (r14, 0xc)
	BTx->CR |=BTCLK| BTSHDWSTP| BTOPM| BTEXTCKM;
 a04:	6d18      	or      	r4, r6
 a06:	6cd0      	or      	r3, r4
 a08:	90a1      	ld.w      	r5, (r0, 0x4)
 a0a:	6c4c      	or      	r1, r3
 a0c:	6c54      	or      	r1, r5
 a0e:	b021      	st.w      	r1, (r0, 0x4)
	BTx->PSCR = PSCR_DATA;
 a10:	b042      	st.w      	r2, (r0, 0x8)
}
 a12:	1483      	pop      	r4-r6

Disassembly of section .text.BT_ControlSet_Configure:

00000a14 <BT_ControlSet_Configure>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_ControlSet_Configure(CSP_BT_T *BTx,BT_STARTST_TypeDef BTSTART,BT_IDLEST_TypeDef BTIDLE,BT_SYNCEN_TypeDef BTSYNC,BT_SYNCMD_TypeDef BTSYNCMD,
							BT_OSTMDX_TypeDef BTOSTMD,BT_AREARM_TypeDef BTAREARM,BT_CNTRLD_TypeDef BTCNTRLD)
{
 a14:	14c4      	push      	r4-r7
 a16:	1421      	subi      	r14, r14, 4
 a18:	9885      	ld.w      	r4, (r14, 0x14)
 a1a:	6dd3      	mov      	r7, r4
 a1c:	9886      	ld.w      	r4, (r14, 0x18)
 a1e:	b880      	st.w      	r4, (r14, 0x0)
 a20:	9887      	ld.w      	r4, (r14, 0x1c)
 a22:	6d93      	mov      	r6, r4
 a24:	98a8      	ld.w      	r5, (r14, 0x20)
	BTx->CR |=BTSTART| BTIDLE| BTSYNC| BTSYNCMD| BTOSTMD| BTAREARM| BTCNTRLD;
 a26:	6d58      	or      	r5, r6
 a28:	98c0      	ld.w      	r6, (r14, 0x0)
 a2a:	6d58      	or      	r5, r6
 a2c:	6d5c      	or      	r5, r7
 a2e:	6cd4      	or      	r3, r5
 a30:	6c8c      	or      	r2, r3
 a32:	9081      	ld.w      	r4, (r0, 0x4)
 a34:	6c48      	or      	r1, r2
 a36:	6d04      	or      	r4, r1
 a38:	6d9f      	mov      	r6, r7
 a3a:	b081      	st.w      	r4, (r0, 0x4)
}
 a3c:	1401      	addi      	r14, r14, 4
 a3e:	1484      	pop      	r4-r7

Disassembly of section .text.BT_Period_CMP_Write:

00000a40 <BT_Period_CMP_Write>:
//ReturnValue:NONE
/*************************************************************/
void BT_Period_CMP_Write(CSP_BT_T *BTx,U16_T BTPRDR_DATA,U16_T BTCMP_DATA)
{
	//BTx->CR|=0X01<<2;
	BTx->PRDR =BTPRDR_DATA;
 a40:	b023      	st.w      	r1, (r0, 0xc)
	BTx->CMP =BTCMP_DATA;
 a42:	b044      	st.w      	r2, (r0, 0x10)
}
 a44:	783c      	jmp      	r15

Disassembly of section .text.BT_ConfigInterrupt_CMD:

00000a46 <BT_ConfigInterrupt_CMD>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void BT_ConfigInterrupt_CMD(CSP_BT_T *BTx,FunctionalStatus NewState,BT_IMSCR_TypeDef BT_IMSCR_X)
{
	if (NewState != DISABLE)
 a46:	3940      	cmpnei      	r1, 0
	{
		BTx->IMCR  |= BT_IMSCR_X;						
 a48:	906b      	ld.w      	r3, (r0, 0x2c)
	if (NewState != DISABLE)
 a4a:	0c04      	bf      	0xa52	// a52 <BT_ConfigInterrupt_CMD+0xc>
		BTx->IMCR  |= BT_IMSCR_X;						
 a4c:	6c8c      	or      	r2, r3
 a4e:	b04b      	st.w      	r2, (r0, 0x2c)
	}
	else
	{
		BTx->IMCR  &= ~BT_IMSCR_X;					
	}
}
 a50:	783c      	jmp      	r15
		BTx->IMCR  &= ~BT_IMSCR_X;					
 a52:	68c9      	andn      	r3, r2
 a54:	b06b      	st.w      	r3, (r0, 0x2c)
}
 a56:	07fd      	br      	0xa50	// a50 <BT_ConfigInterrupt_CMD+0xa>

Disassembly of section .text.BT0_INT_ENABLE:

00000a58 <BT0_INT_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT0_INT);
 a58:	3380      	movi      	r3, 128
 a5a:	4375      	lsli      	r3, r3, 21
 a5c:	1042      	lrw      	r2, 0xe000e100	// a64 <BT0_INT_ENABLE+0xc>
 a5e:	b260      	st.w      	r3, (r2, 0x0)
}
 a60:	783c      	jmp      	r15
 a62:	0000      	bkpt
 a64:	e000e100 	.long	0xe000e100

Disassembly of section .text.UART1_DeInit:

00000a68 <UART1_DeInit>:
    UART0->ISR  = UART_RESET_VALUE;
    UART0->BRDIV =UART_RESET_VALUE;
}
void UART1_DeInit(void)
{
    UART1->DATA = UART_RESET_VALUE;
 a68:	1065      	lrw      	r3, 0x2000003c	// a7c <UART1_DeInit+0x14>
 a6a:	3200      	movi      	r2, 0
 a6c:	9360      	ld.w      	r3, (r3, 0x0)
 a6e:	b340      	st.w      	r2, (r3, 0x0)
    UART1->SR   = UART_RESET_VALUE;
 a70:	b341      	st.w      	r2, (r3, 0x4)
    UART1->CTRL = UART_RESET_VALUE;
 a72:	b342      	st.w      	r2, (r3, 0x8)
    UART1->ISR  = UART_RESET_VALUE;
 a74:	b343      	st.w      	r2, (r3, 0xc)
    UART1->BRDIV =UART_RESET_VALUE;
 a76:	b344      	st.w      	r2, (r3, 0x10)
}
 a78:	783c      	jmp      	r15
 a7a:	0000      	bkpt
 a7c:	2000003c 	.long	0x2000003c

Disassembly of section .text.UART_IO_Init:

00000a80 <UART_IO_Init>:
//UART_IO_G:0 1
//ReturnValue:NONE
/*************************************************************/
void UART_IO_Init(UART_NUM_TypeDef IO_UART_NUM , U8_T UART_IO_G)
{
    if (IO_UART_NUM==IO_UART0)
 a80:	3840      	cmpnei      	r0, 0
 a82:	0821      	bt      	0xac4	// ac4 <UART_IO_Init+0x44>
    {
		if(UART_IO_G==0)
 a84:	3940      	cmpnei      	r1, 0
 a86:	080a      	bt      	0xa9a	// a9a <UART_IO_Init+0x1a>
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000044;       //PA0.1->RXD0, PA0.0->TXD0
 a88:	1177      	lrw      	r3, 0x2000004c	// b64 <UART_IO_Init+0xe4>
 a8a:	31ff      	movi      	r1, 255
 a8c:	9340      	ld.w      	r2, (r3, 0x0)
 a8e:	9260      	ld.w      	r3, (r2, 0x0)
 a90:	68c5      	andn      	r3, r1
 a92:	3ba2      	bseti      	r3, 2
 a94:	3ba6      	bseti      	r3, 6
    }
	 if (IO_UART_NUM==IO_UART2)
    {
        if(UART_IO_G==0)
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000077;       //PA0.0->RXD2, PA0.1->TXD2
 a96:	b260      	st.w      	r3, (r2, 0x0)
 a98:	0415      	br      	0xac2	// ac2 <UART_IO_Init+0x42>
		else if(UART_IO_G==1)
 a9a:	3941      	cmpnei      	r1, 1
 a9c:	0813      	bt      	0xac2	// ac2 <UART_IO_Init+0x42>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00700000;      //PA0.5->RXD0, PA0.12->TXD0
 a9e:	1172      	lrw      	r3, 0x2000004c	// b64 <UART_IO_Init+0xe4>
 aa0:	31f0      	movi      	r1, 240
 aa2:	9340      	ld.w      	r2, (r3, 0x0)
 aa4:	9260      	ld.w      	r3, (r2, 0x0)
 aa6:	4130      	lsli      	r1, r1, 16
 aa8:	68c5      	andn      	r3, r1
 aaa:	31e0      	movi      	r1, 224
 aac:	412f      	lsli      	r1, r1, 15
 aae:	6cc4      	or      	r3, r1
 ab0:	b260      	st.w      	r3, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)  | 0x00070000;      
 ab2:	31f0      	movi      	r1, 240
 ab4:	9261      	ld.w      	r3, (r2, 0x4)
 ab6:	412c      	lsli      	r1, r1, 12
 ab8:	68c5      	andn      	r3, r1
 aba:	31e0      	movi      	r1, 224
 abc:	412b      	lsli      	r1, r1, 11
 abe:	6cc4      	or      	r3, r1
 ac0:	b261      	st.w      	r3, (r2, 0x4)
		else if(UART_IO_G==2)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
		}
    }
}
 ac2:	783c      	jmp      	r15
     if (IO_UART_NUM==IO_UART1)
 ac4:	3841      	cmpnei      	r0, 1
 ac6:	082d      	bt      	0xb20	// b20 <UART_IO_Init+0xa0>
        if(UART_IO_G==0)
 ac8:	3940      	cmpnei      	r1, 0
 aca:	0814      	bt      	0xaf2	// af2 <UART_IO_Init+0x72>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000007;       //PA0.13->RXD1, PB0.0->TXD1
 acc:	1167      	lrw      	r3, 0x20000048	// b68 <UART_IO_Init+0xe8>
 ace:	310f      	movi      	r1, 15
 ad0:	9340      	ld.w      	r2, (r3, 0x0)
 ad2:	9260      	ld.w      	r3, (r2, 0x0)
 ad4:	68c5      	andn      	r3, r1
 ad6:	3107      	movi      	r1, 7
 ad8:	6cc4      	or      	r3, r1
 ada:	b260      	st.w      	r3, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00700000;       
 adc:	32f0      	movi      	r2, 240
 ade:	1162      	lrw      	r3, 0x2000004c	// b64 <UART_IO_Init+0xe4>
 ae0:	4250      	lsli      	r2, r2, 16
 ae2:	9320      	ld.w      	r1, (r3, 0x0)
 ae4:	9161      	ld.w      	r3, (r1, 0x4)
 ae6:	68c9      	andn      	r3, r2
 ae8:	32e0      	movi      	r2, 224
 aea:	424f      	lsli      	r2, r2, 15
			GPIOA0->CONHR = (GPIOA0->CONHR&0X00FFFFFF) | 0X77000000;        //PA0.15->RXD1, PA0.14->TXD1
 aec:	6cc8      	or      	r3, r2
 aee:	b161      	st.w      	r3, (r1, 0x4)
 af0:	07e9      	br      	0xac2	// ac2 <UART_IO_Init+0x42>
		else if(UART_IO_G==1)
 af2:	3941      	cmpnei      	r1, 1
 af4:	080c      	bt      	0xb0c	// b0c <UART_IO_Init+0x8c>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF) | 0X00077000;        //PA0.4->RXD1, PA0.3->TXD1
 af6:	107c      	lrw      	r3, 0x2000004c	// b64 <UART_IO_Init+0xe4>
 af8:	32ff      	movi      	r2, 255
 afa:	9320      	ld.w      	r1, (r3, 0x0)
 afc:	424c      	lsli      	r2, r2, 12
 afe:	9160      	ld.w      	r3, (r1, 0x0)
 b00:	68c9      	andn      	r3, r2
 b02:	32ee      	movi      	r2, 238
 b04:	424b      	lsli      	r2, r2, 11
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
 b06:	6cc8      	or      	r3, r2
 b08:	b160      	st.w      	r3, (r1, 0x0)
}
 b0a:	07dc      	br      	0xac2	// ac2 <UART_IO_Init+0x42>
		else if(UART_IO_G==2)
 b0c:	3942      	cmpnei      	r1, 2
 b0e:	0bda      	bt      	0xac2	// ac2 <UART_IO_Init+0x42>
			GPIOA0->CONHR = (GPIOA0->CONHR&0X00FFFFFF) | 0X77000000;        //PA0.15->RXD1, PA0.14->TXD1
 b10:	1075      	lrw      	r3, 0x2000004c	// b64 <UART_IO_Init+0xe4>
 b12:	32ee      	movi      	r2, 238
 b14:	9320      	ld.w      	r1, (r3, 0x0)
 b16:	9161      	ld.w      	r3, (r1, 0x4)
 b18:	4368      	lsli      	r3, r3, 8
 b1a:	4b68      	lsri      	r3, r3, 8
 b1c:	4257      	lsli      	r2, r2, 23
 b1e:	07e7      	br      	0xaec	// aec <UART_IO_Init+0x6c>
	 if (IO_UART_NUM==IO_UART2)
 b20:	3842      	cmpnei      	r0, 2
 b22:	0bd0      	bt      	0xac2	// ac2 <UART_IO_Init+0x42>
        if(UART_IO_G==0)
 b24:	3940      	cmpnei      	r1, 0
 b26:	0809      	bt      	0xb38	// b38 <UART_IO_Init+0xb8>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000077;       //PA0.0->RXD2, PA0.1->TXD2
 b28:	106f      	lrw      	r3, 0x2000004c	// b64 <UART_IO_Init+0xe4>
 b2a:	31ff      	movi      	r1, 255
 b2c:	9340      	ld.w      	r2, (r3, 0x0)
 b2e:	9260      	ld.w      	r3, (r2, 0x0)
 b30:	68c5      	andn      	r3, r1
 b32:	3177      	movi      	r1, 119
 b34:	6cc4      	or      	r3, r1
 b36:	07b0      	br      	0xa96	// a96 <UART_IO_Init+0x16>
		else if(UART_IO_G==1)
 b38:	3941      	cmpnei      	r1, 1
 b3a:	0809      	bt      	0xb4c	// b4c <UART_IO_Init+0xcc>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X00FFFFFF) | 0X77000000;        //PA0.7->RXD2, PA0.6->TXD2
 b3c:	106a      	lrw      	r3, 0x2000004c	// b64 <UART_IO_Init+0xe4>
 b3e:	32ee      	movi      	r2, 238
 b40:	9320      	ld.w      	r1, (r3, 0x0)
 b42:	9160      	ld.w      	r3, (r1, 0x0)
 b44:	4368      	lsli      	r3, r3, 8
 b46:	4b68      	lsri      	r3, r3, 8
 b48:	4257      	lsli      	r2, r2, 23
 b4a:	07de      	br      	0xb06	// b06 <UART_IO_Init+0x86>
		else if(UART_IO_G==2)
 b4c:	3942      	cmpnei      	r1, 2
 b4e:	0bba      	bt      	0xac2	// ac2 <UART_IO_Init+0x42>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
 b50:	1066      	lrw      	r3, 0x20000048	// b68 <UART_IO_Init+0xe8>
 b52:	32ff      	movi      	r2, 255
 b54:	9320      	ld.w      	r1, (r3, 0x0)
 b56:	4250      	lsli      	r2, r2, 16
 b58:	9160      	ld.w      	r3, (r1, 0x0)
 b5a:	68c9      	andn      	r3, r2
 b5c:	32cc      	movi      	r2, 204
 b5e:	424f      	lsli      	r2, r2, 15
 b60:	07d3      	br      	0xb06	// b06 <UART_IO_Init+0x86>
 b62:	0000      	bkpt
 b64:	2000004c 	.long	0x2000004c
 b68:	20000048 	.long	0x20000048

Disassembly of section .text.UARTInit:

00000b6c <UARTInit>:
//ReturnValue:NONE
/*************************************************************/
void UARTInit(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX |PAR_DAT);
 b6c:	3aa0      	bseti      	r2, 0
 b6e:	3aa1      	bseti      	r2, 1
 b70:	b042      	st.w      	r2, (r0, 0x8)
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
 b72:	b024      	st.w      	r1, (r0, 0x10)
}
 b74:	783c      	jmp      	r15

Disassembly of section .text.UARTTxByte:

00000b76 <UARTTxByte>:
/*************************************************************/
void UARTTxByte(CSP_UART_T *uart,U8_T txdata_u8)
{
	unsigned int  DataI;
	// Write the transmit buffer
	CSP_UART_SET_DATA(uart,txdata_u8);
 b76:	b020      	st.w      	r1, (r0, 0x0)
	do
	{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_TX_FULL;
 b78:	3201      	movi      	r2, 1
		DataI = CSP_UART_GET_SR(uart);
 b7a:	9061      	ld.w      	r3, (r0, 0x4)
		DataI = DataI & UART_TX_FULL;
 b7c:	68c8      	and      	r3, r2
	}
	while(DataI == UART_TX_FULL);    //Loop  when tx is full
 b7e:	3b40      	cmpnei      	r3, 0
 b80:	0bfd      	bt      	0xb7a	// b7a <UARTTxByte+0x4>
}
 b82:	783c      	jmp      	r15

Disassembly of section .text.delay_nms:

00000b84 <delay_nms>:
//software delay
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void delay_nms(unsigned int t)
{
 b84:	14d0      	push      	r15
 b86:	1423      	subi      	r14, r14, 12
    volatile unsigned int i,j ,k=0;
    j = 50* t;
 b88:	3232      	movi      	r2, 50
    volatile unsigned int i,j ,k=0;
 b8a:	3300      	movi      	r3, 0
    j = 50* t;
 b8c:	7c08      	mult      	r0, r2
    volatile unsigned int i,j ,k=0;
 b8e:	b862      	st.w      	r3, (r14, 0x8)
    j = 50* t;
 b90:	b801      	st.w      	r0, (r14, 0x4)
    for ( i = 0; i < j; i++ )
 b92:	b860      	st.w      	r3, (r14, 0x0)
 b94:	9840      	ld.w      	r2, (r14, 0x0)
 b96:	9861      	ld.w      	r3, (r14, 0x4)
 b98:	64c8      	cmphs      	r2, r3
 b9a:	0c03      	bf      	0xba0	// ba0 <delay_nms+0x1c>
    {
        k++;
		SYSCON_IWDCNT_Reload(); 
    }
}
 b9c:	1403      	addi      	r14, r14, 12
 b9e:	1490      	pop      	r15
        k++;
 ba0:	9862      	ld.w      	r3, (r14, 0x8)
 ba2:	2300      	addi      	r3, 1
 ba4:	b862      	st.w      	r3, (r14, 0x8)
		SYSCON_IWDCNT_Reload(); 
 ba6:	e3fffe1b 	bsr      	0x7dc	// 7dc <SYSCON_IWDCNT_Reload>
    for ( i = 0; i < j; i++ )
 baa:	9860      	ld.w      	r3, (r14, 0x0)
 bac:	2300      	addi      	r3, 1
 bae:	07f2      	br      	0xb92	// b92 <delay_nms+0xe>

Disassembly of section .text.GPIO_CONFIG:

00000bb0 <GPIO_CONFIG>:
//GPIO Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void GPIO_CONFIG(void)
{
 bb0:	14d1      	push      	r4, r15
	GPIO_Init(GPIOA0,4,0);
 bb2:	1088      	lrw      	r4, 0x2000004c	// bd0 <GPIO_CONFIG+0x20>
 bb4:	3200      	movi      	r2, 0
 bb6:	9400      	ld.w      	r0, (r4, 0x0)
 bb8:	3104      	movi      	r1, 4
 bba:	e3fffe69 	bsr      	0x88c	// 88c <GPIO_Init>
	GPIO_Write_High(GPIOA0,4);				
 bbe:	9400      	ld.w      	r0, (r4, 0x0)
 bc0:	3104      	movi      	r1, 4
 bc2:	e3fffed5 	bsr      	0x96c	// 96c <GPIO_Write_High>
	GPIO_Write_Low(GPIOA0,4);				
 bc6:	9400      	ld.w      	r0, (r4, 0x0)
 bc8:	3104      	movi      	r1, 4
 bca:	e3fffed5 	bsr      	0x974	// 974 <GPIO_Write_Low>
	//EXI1_WakeUp_Enable();										//EXI1 interrupt wake up enable
	//EXI2_WakeUp_Enable();										//EXI2~EXI3 interrupt wake up enable
	//EXI3_WakeUp_Enable();										//EXI4~EXI9 interrupt wake up enable
	//EXI4_WakeUp_Enable();										//EXI10~EXI15 interrupt wake up enable
	#endif
}
 bce:	1491      	pop      	r4, r15
 bd0:	2000004c 	.long	0x2000004c

Disassembly of section .text.BT_CONFIG:

00000bd4 <BT_CONFIG>:
//BT Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void BT_CONFIG(void)
{
 bd4:	14d2      	push      	r4-r5, r15
 bd6:	1424      	subi      	r14, r14, 16
	BT_DeInit(BT0);
 bd8:	1095      	lrw      	r4, 0x2000000c	// c2c <BT_CONFIG+0x58>
	//BT_IO_Init(BT0_PA15);
	BT_Configure(BT0,BTCLK_EN,23,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
 bda:	3500      	movi      	r5, 0
	BT_DeInit(BT0);
 bdc:	9400      	ld.w      	r0, (r4, 0x0)
 bde:	e3fffefd 	bsr      	0x9d8	// 9d8 <BT_DeInit>
	BT_Configure(BT0,BTCLK_EN,23,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
 be2:	9400      	ld.w      	r0, (r4, 0x0)
 be4:	b8a1      	st.w      	r5, (r14, 0x4)
 be6:	b8a0      	st.w      	r5, (r14, 0x0)
 be8:	3308      	movi      	r3, 8
 bea:	3217      	movi      	r2, 23
 bec:	3101      	movi      	r1, 1
 bee:	e3ffff07 	bsr      	0x9fc	// 9fc <BT_Configure>
	BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
 bf2:	3380      	movi      	r3, 128
 bf4:	4363      	lsli      	r3, r3, 3
 bf6:	b861      	st.w      	r3, (r14, 0x4)
 bf8:	9400      	ld.w      	r0, (r4, 0x0)
 bfa:	3300      	movi      	r3, 0
 bfc:	b8a3      	st.w      	r5, (r14, 0xc)
 bfe:	b8a2      	st.w      	r5, (r14, 0x8)
 c00:	b8a0      	st.w      	r5, (r14, 0x0)
 c02:	3200      	movi      	r2, 0
 c04:	3180      	movi      	r1, 128
 c06:	e3ffff07 	bsr      	0xa14	// a14 <BT_ControlSet_Configure>
	//BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_EN,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_Trigger_Configure(BT0,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT0,100,0);
 c0a:	3200      	movi      	r2, 0
 c0c:	3164      	movi      	r1, 100
 c0e:	9400      	ld.w      	r0, (r4, 0x0)
 c10:	e3ffff18 	bsr      	0xa40	// a40 <BT_Period_CMP_Write>
	BT_Start(BT0);
 c14:	9400      	ld.w      	r0, (r4, 0x0)
 c16:	e3fffeef 	bsr      	0x9f4	// 9f4 <BT_Start>
	BT_ConfigInterrupt_CMD(BT0,ENABLE,BT_PEND);
 c1a:	9400      	ld.w      	r0, (r4, 0x0)
 c1c:	3201      	movi      	r2, 1
 c1e:	3101      	movi      	r1, 1
 c20:	e3ffff13 	bsr      	0xa46	// a46 <BT_ConfigInterrupt_CMD>
	BT0_INT_ENABLE();
 c24:	e3ffff1a 	bsr      	0xa58	// a58 <BT0_INT_ENABLE>
	BT_Trigger_Configure(BT1,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT1,1000,500);
	BT_Start(BT1);
	BT_ConfigInterrupt_CMD(BT1,ENABLE,BT_PEND);
	BT1_INT_ENABLE();*/
}
 c28:	1404      	addi      	r14, r14, 16
 c2a:	1492      	pop      	r4-r5, r15
 c2c:	2000000c 	.long	0x2000000c

Disassembly of section .text.UART1_CONFIG:

00000c30 <UART1_CONFIG>:
//UART1  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART1_CONFIG(void)
{
 c30:	14d0      	push      	r15
	UART1_DeInit();                                                 //clear all UART Register
 c32:	e3ffff1b 	bsr      	0xa68	// a68 <UART1_DeInit>
    UART_IO_Init(IO_UART1,2);                                    	//PA0.15->RXD1, PA0.14->TXD1
 c36:	3102      	movi      	r1, 2
 c38:	3001      	movi      	r0, 1
 c3a:	e3ffff23 	bsr      	0xa80	// a80 <UART_IO_Init>
	UARTInit(UART1,208,UART_PAR_NONE);							  //baudrate=sysclock 48M/416=115200
 c3e:	1064      	lrw      	r3, 0x2000003c	// c4c <UART1_CONFIG+0x1c>
 c40:	3200      	movi      	r2, 0
 c42:	9300      	ld.w      	r0, (r3, 0x0)
 c44:	31d0      	movi      	r1, 208
 c46:	e3ffff93 	bsr      	0xb6c	// b6c <UARTInit>
	//UARTInitRxTxIntEn(UART1,416,UART_PAR_NONE);					//baudrate=sysclock 48M/416=115200 tx rx int enabled 
	//UART1_Int_Enable();
}	
 c4a:	1490      	pop      	r15
 c4c:	2000003c 	.long	0x2000003c

Disassembly of section .text.SYSCON_CONFIG:

00000c50 <SYSCON_CONFIG>:
//syscon Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CONFIG(void)
{
 c50:	14d0      	push      	r15
 c52:	1421      	subi      	r14, r14, 4
//------SYSTEM CLK AND PCLK FUNTION---------------------------/
	SYSCON_RST_VALUE();                                                         //SYSCON all register clr
 c54:	e3fffd0a 	bsr      	0x668	// 668 <SYSCON_RST_VALUE>
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC);										//SYSCON enable/disable clock source
 c58:	3101      	movi      	r1, 1
 c5a:	3001      	movi      	r0, 1
 c5c:	e3fffd32 	bsr      	0x6c0	// 6c0 <SYSCON_General_CMD>
	//EMOSC_OSTR_Config(0XAD,0X1f,EM_LFSEL_EN,EM_FLEN_EN,EM_FLSEL_10ns);		//EM_CNT=0X3FF,0xAD(36K),EM_GM=0,Low F modedisable,EM filter disable,if enable,cont set 5ns
	//SYSCON_General_CMD(ENABLE,ENDIS_EMOSC);
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_24M);									//HFOSC selected 48MHz
 c60:	3010      	movi      	r0, 16
 c62:	e3fffd8b 	bsr      	0x778	// 778 <SYSCON_HFOSC_SELECTE>
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC,HCLK_DIV_1,PCLK_DIV_1,HFOSC_24M);//system clock set, Hclk div ,Pclk div  set system clock=SystemCLK/Hclk div/Pclk div
 c66:	3180      	movi      	r1, 128
 c68:	3309      	movi      	r3, 9
 c6a:	3200      	movi      	r2, 0
 c6c:	4121      	lsli      	r1, r1, 1
 c6e:	3002      	movi      	r0, 2
 c70:	e3fffd40 	bsr      	0x6f0	// 6f0 <SystemCLK_HCLKDIV_PCLKDIV_Config>
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_4S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
 c74:	30c0      	movi      	r0, 192
 c76:	3118      	movi      	r1, 24
 c78:	4003      	lsli      	r0, r0, 3
 c7a:	e3fffdbb 	bsr      	0x7f0	// 7f0 <SYSCON_IWDCNT_Config>
    SYSCON_WDT_CMD(DISABLE);                                                  	//enable/disable WDT		
 c7e:	3000      	movi      	r0, 0
 c80:	e3fffd90 	bsr      	0x7a0	// 7a0 <SYSCON_WDT_CMD>
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
 c84:	e3fffdac 	bsr      	0x7dc	// 7dc <SYSCON_IWDCNT_Reload>
	//IWDT_Int_Enable();
//------------  WWDT FUNTION  --------------------------------/
	WWDT_CNT_Load(0xFF);
 c88:	30ff      	movi      	r0, 255
 c8a:	e3fffe85 	bsr      	0x994	// 994 <WWDT_CNT_Load>
	WWDT_CONFIG(PCLK_4096_DIV0,0xFF,WWDT_DBGDIS);
 c8e:	3200      	movi      	r2, 0
 c90:	31ff      	movi      	r1, 255
 c92:	3000      	movi      	r0, 0
 c94:	e3fffe74 	bsr      	0x97c	// 97c <WWDT_CONFIG>
	WWDT_Int_Config(DISABLE);													
 c98:	3000      	movi      	r0, 0
 c9a:	e3fffe85 	bsr      	0x9a4	// 9a4 <WWDT_Int_Config>
	//WWDT_CMD(ENABLE);															//enable wwdt
//------------  CLO Output --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA08);												//CLO output setting
	//SYSCON_CLO_SRC_SET(CLO_HFCLK,CLO_DIV16);									//CLO output clock and div
//------------  LVD FUNTION  --------------------------------/ 
    SYSCON_LVD_Config(DISABLE_LVDEN,INTDET_LVL_3_9V,RSTDET_LVL_1_9V,DISABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
 c9e:	3340      	movi      	r3, 64
 ca0:	31c0      	movi      	r1, 192
 ca2:	3200      	movi      	r2, 0
 ca4:	4123      	lsli      	r1, r1, 3
 ca6:	b860      	st.w      	r3, (r14, 0x0)
 ca8:	300a      	movi      	r0, 10
 caa:	3300      	movi      	r3, 0
 cac:	e3fffdae 	bsr      	0x808	// 808 <SYSCON_LVD_Config>
	//SYSCON_Int_Enable();    														//SYSCON VECTOR
	//SYSCON_WakeUp_Enable();    													//Enable WDT wakeup INT
//------------------------------------------------------------/
//OSC CLOCK Calibration
//------------------------------------------------------------/	
	std_clk_calib_source(CLK_ISOSC_27K);
 cb0:	3000      	movi      	r0, 0
 cb2:	e0000b21 	bsr      	0x22f4	// 22f4 <std_clk_calib_source>
	std_clk_calib(CLK_HFOSC_24M);												//Select the same clock source as the system
 cb6:	3001      	movi      	r0, 1
 cb8:	e0000b36 	bsr      	0x2324	// 2324 <std_clk_calib>
	
}
 cbc:	1401      	addi      	r14, r14, 4
 cbe:	1490      	pop      	r15

Disassembly of section .text.APT32F102_init:

00000cc0 <APT32F102_init>:
//ReturnValue:NONE                                                                /
/*********************************************************************************/
/*********************************************************************************/  
/*********************************************************************************/
void APT32F102_init(void) 
{
 cc0:	14d0      	push      	r15
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable
 cc2:	106c      	lrw      	r3, 0x2000005c	// cf0 <APT32F102_init+0x30>
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
 cc4:	3101      	movi      	r1, 1
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable
 cc6:	9340      	ld.w      	r2, (r3, 0x0)
 cc8:	106b      	lrw      	r3, 0xfffffff	// cf4 <APT32F102_init+0x34>
 cca:	b26a      	st.w      	r3, (r2, 0x28)
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
 ccc:	b26d      	st.w      	r3, (r2, 0x34)
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
 cce:	926c      	ld.w      	r3, (r2, 0x30)
 cd0:	68c4      	and      	r3, r1
 cd2:	3b40      	cmpnei      	r3, 0
 cd4:	0ffd      	bf      	0xcce	// cce <APT32F102_init+0xe>
//------------------------------------------------------------/
//ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON_CONFIG();                                                 //syscon  initial
 cd6:	e3ffffbd 	bsr      	0xc50	// c50 <SYSCON_CONFIG>
	CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
 cda:	e0000583 	bsr      	0x17e0	// 17e0 <CK_CPU_EnAllNormalIrq>
	SYSCON_INT_Priority();										 //initial all Priority=0xC0
 cde:	e3fffdc5 	bsr      	0x868	// 868 <SYSCON_INT_Priority>
	//Set_INT_Priority(BT0_IRQ,0);									 //0:set int priority 1st
//------------------------------------------------------------/
//Other IP config
//------------------------------------------------------------/
	GPIO_CONFIG();                                                //GPIO initial     
 ce2:	e3ffff67 	bsr      	0xbb0	// bb0 <GPIO_CONFIG>
	//EPT0_CONFIG();                                                //EPT0 initial 
	//GPT0_CONFIG();												//GPT0 initial	
	BT_CONFIG();													//BT initial
 ce6:	e3ffff77 	bsr      	0xbd4	// bd4 <BT_CONFIG>
	//I2C_SLAVE_CONFIG();                                           //I2C harware slave initial 
	//SPI_MASTER_CONFIG();											//SPI Master initial 	
	//SPI_SLAVE_CONFIG();											//SPI Slaver initial 
	//SIO_CONFIG();													//SIO initial
    //UART0_CONFIG();                                               //UART0 initial 
	UART1_CONFIG();                                               //UART1 initial 
 cea:	e3ffffa3 	bsr      	0xc30	// c30 <UART1_CONFIG>
	//UART2_CONFIG();                                               //UART2 initial 
	//ADC12_CONFIG();                                               //ADC initial 
	//TK_CONFIG();													//Touch Key initial
}
 cee:	1490      	pop      	r15
 cf0:	2000005c 	.long	0x2000005c
 cf4:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.SYSCONIntHandler:

00000cf8 <SYSCONIntHandler>:
//SYSCON Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCONIntHandler(void) 
{
 cf8:	1460      	nie
 cfa:	1462      	ipush
    // ISR content ...
	nop;
 cfc:	6c03      	mov      	r0, r0
	if((SYSCON->MISR&ISOSC_ST)==ISOSC_ST)				//ISOSC stable interrupt
 cfe:	117c      	lrw      	r3, 0x2000005c	// dec <SYSCONIntHandler+0xf4>
 d00:	3280      	movi      	r2, 128
 d02:	9360      	ld.w      	r3, (r3, 0x0)
 d04:	60c8      	addu      	r3, r2
 d06:	9323      	ld.w      	r1, (r3, 0xc)
 d08:	3001      	movi      	r0, 1
 d0a:	6840      	and      	r1, r0
 d0c:	3940      	cmpnei      	r1, 0
 d0e:	0c04      	bf      	0xd16	// d16 <SYSCONIntHandler+0x1e>
	{
		SYSCON->ICR = EMOSC_ST;
	} 
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)			//HFOSC stable interrupt
	{
		SYSCON->ICR = HFOSC_ST;
 d10:	b301      	st.w      	r0, (r3, 0x4)
	}
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)		//Command error interrupt
	{
		SYSCON->ICR = CMD_ERR_ST;
	}
}
 d12:	1463      	ipop
 d14:	1461      	nir
	else if((SYSCON->MISR&IMOSC_ST)==IMOSC_ST)			//IMOSC stable interrupt
 d16:	9323      	ld.w      	r1, (r3, 0xc)
 d18:	3002      	movi      	r0, 2
 d1a:	6840      	and      	r1, r0
 d1c:	3940      	cmpnei      	r1, 0
 d1e:	0bf9      	bt      	0xd10	// d10 <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&EMOSC_ST)==EMOSC_ST)			//EMOSC stable interrupt
 d20:	9323      	ld.w      	r1, (r3, 0xc)
 d22:	3008      	movi      	r0, 8
 d24:	6840      	and      	r1, r0
 d26:	3940      	cmpnei      	r1, 0
 d28:	0bf4      	bt      	0xd10	// d10 <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)			//HFOSC stable interrupt
 d2a:	9323      	ld.w      	r1, (r3, 0xc)
 d2c:	3010      	movi      	r0, 16
 d2e:	6840      	and      	r1, r0
 d30:	3940      	cmpnei      	r1, 0
 d32:	0bef      	bt      	0xd10	// d10 <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&SYSCLK_ST)==SYSCLK_ST)		//SYSCLK change end & stable interrupt
 d34:	9323      	ld.w      	r1, (r3, 0xc)
 d36:	6848      	and      	r1, r2
 d38:	3940      	cmpnei      	r1, 0
 d3a:	0c03      	bf      	0xd40	// d40 <SYSCONIntHandler+0x48>
		SYSCON->ICR = CMD_ERR_ST;
 d3c:	b341      	st.w      	r2, (r3, 0x4)
}
 d3e:	07ea      	br      	0xd12	// d12 <SYSCONIntHandler+0x1a>
	else if((SYSCON->MISR&IWDT_INT_ST)==IWDT_INT_ST)	//IWDT alarm window interrupt
 d40:	3280      	movi      	r2, 128
 d42:	9323      	ld.w      	r1, (r3, 0xc)
 d44:	4241      	lsli      	r2, r2, 1
 d46:	6848      	and      	r1, r2
 d48:	3940      	cmpnei      	r1, 0
 d4a:	0c06      	bf      	0xd56	// d56 <SYSCONIntHandler+0x5e>
		SYSCON->ICR = IWDT_INT_ST;
 d4c:	b341      	st.w      	r2, (r3, 0x4)
		SYSCON->IWDCNT=0x5aul<<24;
 d4e:	32b4      	movi      	r2, 180
 d50:	4257      	lsli      	r2, r2, 23
 d52:	b34e      	st.w      	r2, (r3, 0x38)
 d54:	07df      	br      	0xd12	// d12 <SYSCONIntHandler+0x1a>
	else if((SYSCON->MISR&WKI_INT_ST)==WKI_INT_ST)
 d56:	3280      	movi      	r2, 128
 d58:	9323      	ld.w      	r1, (r3, 0xc)
 d5a:	4242      	lsli      	r2, r2, 2
 d5c:	6848      	and      	r1, r2
 d5e:	3940      	cmpnei      	r1, 0
 d60:	0bee      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&RAMERRINT_ST)==RAMERRINT_ST)	//SRAM check fail interrupt
 d62:	3280      	movi      	r2, 128
 d64:	9323      	ld.w      	r1, (r3, 0xc)
 d66:	4243      	lsli      	r2, r2, 3
 d68:	6848      	and      	r1, r2
 d6a:	3940      	cmpnei      	r1, 0
 d6c:	0be8      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&LVD_INT_ST)==LVD_INT_ST)		//LVD threshold interrupt
 d6e:	3280      	movi      	r2, 128
 d70:	9323      	ld.w      	r1, (r3, 0xc)
 d72:	4244      	lsli      	r2, r2, 4
 d74:	6848      	and      	r1, r2
 d76:	3940      	cmpnei      	r1, 0
 d78:	0c03      	bf      	0xd7e	// d7e <SYSCONIntHandler+0x86>
		nop;
 d7a:	6c03      	mov      	r0, r0
 d7c:	07e0      	br      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&HWD_ERR_ST)==HWD_ERR_ST)		//Hardware Divider divisor = 0 interrupt
 d7e:	3280      	movi      	r2, 128
 d80:	9323      	ld.w      	r1, (r3, 0xc)
 d82:	4245      	lsli      	r2, r2, 5
 d84:	6848      	and      	r1, r2
 d86:	3940      	cmpnei      	r1, 0
 d88:	0bda      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EFL_ERR_ST)==EFL_ERR_ST)		//Flash check fail interrupt
 d8a:	3280      	movi      	r2, 128
 d8c:	9323      	ld.w      	r1, (r3, 0xc)
 d8e:	4246      	lsli      	r2, r2, 6
 d90:	6848      	and      	r1, r2
 d92:	3940      	cmpnei      	r1, 0
 d94:	0bd4      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&OPTERR_INT)==OPTERR_INT)		//Option load fail interrupt
 d96:	3280      	movi      	r2, 128
 d98:	9323      	ld.w      	r1, (r3, 0xc)
 d9a:	4247      	lsli      	r2, r2, 7
 d9c:	6848      	and      	r1, r2
 d9e:	3940      	cmpnei      	r1, 0
 da0:	0bce      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_CMLST_ST)==EM_CMLST_ST)	//EMOSC clock monitor fail interrupt
 da2:	3280      	movi      	r2, 128
 da4:	9323      	ld.w      	r1, (r3, 0xc)
 da6:	424b      	lsli      	r2, r2, 11
 da8:	6848      	and      	r1, r2
 daa:	3940      	cmpnei      	r1, 0
 dac:	0bc8      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_EVTRG0_ST)==EM_EVTRG0_ST)	//Event Trigger Channel 0 Interrupt
 dae:	3280      	movi      	r2, 128
 db0:	9323      	ld.w      	r1, (r3, 0xc)
 db2:	424c      	lsli      	r2, r2, 12
 db4:	6848      	and      	r1, r2
 db6:	3940      	cmpnei      	r1, 0
 db8:	0bc2      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_EVTRG1_ST)==EM_EVTRG1_ST)	//Event Trigger Channel 1 Interrupt
 dba:	3280      	movi      	r2, 128
 dbc:	9323      	ld.w      	r1, (r3, 0xc)
 dbe:	424d      	lsli      	r2, r2, 13
 dc0:	6848      	and      	r1, r2
 dc2:	3940      	cmpnei      	r1, 0
 dc4:	0bbc      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_EVTRG2_ST)==EM_EVTRG2_ST)	//Event Trigger Channel 2 Interrupt
 dc6:	3280      	movi      	r2, 128
 dc8:	9323      	ld.w      	r1, (r3, 0xc)
 dca:	424e      	lsli      	r2, r2, 14
 dcc:	6848      	and      	r1, r2
 dce:	3940      	cmpnei      	r1, 0
 dd0:	0bb6      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&EM_EVTRG3_ST)==EM_EVTRG3_ST)	//Event Trigger Channel 3 Interrupt
 dd2:	3280      	movi      	r2, 128
 dd4:	9323      	ld.w      	r1, (r3, 0xc)
 dd6:	424f      	lsli      	r2, r2, 15
 dd8:	6848      	and      	r1, r2
 dda:	3940      	cmpnei      	r1, 0
 ddc:	0bb0      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)		//Command error interrupt
 dde:	3280      	movi      	r2, 128
 de0:	9323      	ld.w      	r1, (r3, 0xc)
 de2:	4256      	lsli      	r2, r2, 22
 de4:	6848      	and      	r1, r2
 de6:	3940      	cmpnei      	r1, 0
 de8:	0baa      	bt      	0xd3c	// d3c <SYSCONIntHandler+0x44>
 dea:	0794      	br      	0xd12	// d12 <SYSCONIntHandler+0x1a>
 dec:	2000005c 	.long	0x2000005c

Disassembly of section .text.IFCIntHandler:

00000df0 <IFCIntHandler>:
//IFC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void IFCIntHandler(void) 
{
 df0:	1460      	nie
 df2:	1462      	ipush
    // ISR content ...
	if(IFC->MISR&ERS_END_INT)			
 df4:	1078      	lrw      	r3, 0x20000060	// e54 <IFCIntHandler+0x64>
 df6:	3101      	movi      	r1, 1
 df8:	9360      	ld.w      	r3, (r3, 0x0)
 dfa:	934b      	ld.w      	r2, (r3, 0x2c)
 dfc:	6884      	and      	r2, r1
 dfe:	3a40      	cmpnei      	r2, 0
 e00:	0c04      	bf      	0xe08	// e08 <IFCIntHandler+0x18>
	{
		IFC->ICR=RGM_END_INT;
	}
	else if(IFC->MISR&PEP_END_INT)		
	{
		IFC->ICR=PEP_END_INT;
 e02:	b32c      	st.w      	r1, (r3, 0x30)
	}
	else if(IFC->MISR&OVW_ERR_INT)		
	{
		IFC->ICR=OVW_ERR_INT;
	}
}
 e04:	1463      	ipop
 e06:	1461      	nir
	else if(IFC->MISR&RGM_END_INT)		
 e08:	934b      	ld.w      	r2, (r3, 0x2c)
 e0a:	3102      	movi      	r1, 2
 e0c:	6884      	and      	r2, r1
 e0e:	3a40      	cmpnei      	r2, 0
 e10:	0bf9      	bt      	0xe02	// e02 <IFCIntHandler+0x12>
	else if(IFC->MISR&PEP_END_INT)		
 e12:	934b      	ld.w      	r2, (r3, 0x2c)
 e14:	3104      	movi      	r1, 4
 e16:	6884      	and      	r2, r1
 e18:	3a40      	cmpnei      	r2, 0
 e1a:	0bf4      	bt      	0xe02	// e02 <IFCIntHandler+0x12>
	else if(IFC->MISR&PROT_ERR_INT)		
 e1c:	3280      	movi      	r2, 128
 e1e:	932b      	ld.w      	r1, (r3, 0x2c)
 e20:	4245      	lsli      	r2, r2, 5
 e22:	6848      	and      	r1, r2
 e24:	3940      	cmpnei      	r1, 0
 e26:	0c03      	bf      	0xe2c	// e2c <IFCIntHandler+0x3c>
		IFC->ICR=OVW_ERR_INT;
 e28:	b34c      	st.w      	r2, (r3, 0x30)
}
 e2a:	07ed      	br      	0xe04	// e04 <IFCIntHandler+0x14>
	else if(IFC->MISR&UDEF_ERR_INT)		
 e2c:	3280      	movi      	r2, 128
 e2e:	932b      	ld.w      	r1, (r3, 0x2c)
 e30:	4246      	lsli      	r2, r2, 6
 e32:	6848      	and      	r1, r2
 e34:	3940      	cmpnei      	r1, 0
 e36:	0bf9      	bt      	0xe28	// e28 <IFCIntHandler+0x38>
	else if(IFC->MISR&ADDR_ERR_INT)		
 e38:	3280      	movi      	r2, 128
 e3a:	932b      	ld.w      	r1, (r3, 0x2c)
 e3c:	4247      	lsli      	r2, r2, 7
 e3e:	6848      	and      	r1, r2
 e40:	3940      	cmpnei      	r1, 0
 e42:	0bf3      	bt      	0xe28	// e28 <IFCIntHandler+0x38>
	else if(IFC->MISR&OVW_ERR_INT)		
 e44:	3280      	movi      	r2, 128
 e46:	932b      	ld.w      	r1, (r3, 0x2c)
 e48:	4248      	lsli      	r2, r2, 8
 e4a:	6848      	and      	r1, r2
 e4c:	3940      	cmpnei      	r1, 0
 e4e:	0bed      	bt      	0xe28	// e28 <IFCIntHandler+0x38>
 e50:	07da      	br      	0xe04	// e04 <IFCIntHandler+0x14>
 e52:	0000      	bkpt
 e54:	20000060 	.long	0x20000060

Disassembly of section .text.ADCIntHandler:

00000e58 <ADCIntHandler>:
//ADC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void ADCIntHandler(void) 
{
 e58:	1460      	nie
 e5a:	1462      	ipush
    // ISR content ...
	if((ADC0->SR&ADC12_EOC)==ADC12_EOC)				//ADC EOC interrupt
 e5c:	1078      	lrw      	r3, 0x20000050	// ebc <ADCIntHandler+0x64>
 e5e:	3101      	movi      	r1, 1
 e60:	9360      	ld.w      	r3, (r3, 0x0)
 e62:	9348      	ld.w      	r2, (r3, 0x20)
 e64:	6884      	and      	r2, r1
 e66:	3a40      	cmpnei      	r2, 0
 e68:	0c04      	bf      	0xe70	// e70 <ADCIntHandler+0x18>
	{
		ADC0->CSR = ADC12_CMP1H;
	}
	else if((ADC0->SR&ADC12_CMP1L)==ADC12_CMP1L)	//ADC CMP1L interrupt.
	{
		ADC0->CSR = ADC12_CMP1L;
 e6a:	b327      	st.w      	r1, (r3, 0x1c)
	}
	else if((ADC0->SR&ADC12_SEQ_END0)==ADC12_SEQ_END0) //ADC SEQ0 interrupt,SEQ1~SEQ15 replace the parameter with ADC12_SEQ_END1~ADC12_SEQ_END15
	{
		ADC0->CSR = ADC12_SEQ_END0;
	}
}
 e6c:	1463      	ipop
 e6e:	1461      	nir
	else if((ADC0->SR&ADC12_READY)==ADC12_READY)	//ADC READY interrupt
 e70:	9348      	ld.w      	r2, (r3, 0x20)
 e72:	3102      	movi      	r1, 2
 e74:	6884      	and      	r2, r1
 e76:	3a40      	cmpnei      	r2, 0
 e78:	0bf9      	bt      	0xe6a	// e6a <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_OVR)==ADC12_OVR)		//ADC OVR interrupt
 e7a:	9348      	ld.w      	r2, (r3, 0x20)
 e7c:	3104      	movi      	r1, 4
 e7e:	6884      	and      	r2, r1
 e80:	3a40      	cmpnei      	r2, 0
 e82:	0bf4      	bt      	0xe6a	// e6a <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP0H)==ADC12_CMP0H)	//ADC CMP0H interrupt
 e84:	9348      	ld.w      	r2, (r3, 0x20)
 e86:	3110      	movi      	r1, 16
 e88:	6884      	and      	r2, r1
 e8a:	3a40      	cmpnei      	r2, 0
 e8c:	0bef      	bt      	0xe6a	// e6a <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP0L)==ADC12_CMP0L)	//ADC CMP0L interrupt.
 e8e:	9348      	ld.w      	r2, (r3, 0x20)
 e90:	3120      	movi      	r1, 32
 e92:	6884      	and      	r2, r1
 e94:	3a40      	cmpnei      	r2, 0
 e96:	0bea      	bt      	0xe6a	// e6a <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP1H)==ADC12_CMP1H)	//ADC CMP1H interrupt.
 e98:	9348      	ld.w      	r2, (r3, 0x20)
 e9a:	3140      	movi      	r1, 64
 e9c:	6884      	and      	r2, r1
 e9e:	3a40      	cmpnei      	r2, 0
 ea0:	0be5      	bt      	0xe6a	// e6a <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_CMP1L)==ADC12_CMP1L)	//ADC CMP1L interrupt.
 ea2:	9348      	ld.w      	r2, (r3, 0x20)
 ea4:	3180      	movi      	r1, 128
 ea6:	6884      	and      	r2, r1
 ea8:	3a40      	cmpnei      	r2, 0
 eaa:	0be0      	bt      	0xe6a	// e6a <ADCIntHandler+0x12>
	else if((ADC0->SR&ADC12_SEQ_END0)==ADC12_SEQ_END0) //ADC SEQ0 interrupt,SEQ1~SEQ15 replace the parameter with ADC12_SEQ_END1~ADC12_SEQ_END15
 eac:	3280      	movi      	r2, 128
 eae:	9328      	ld.w      	r1, (r3, 0x20)
 eb0:	4249      	lsli      	r2, r2, 9
 eb2:	6848      	and      	r1, r2
 eb4:	3940      	cmpnei      	r1, 0
 eb6:	0fdb      	bf      	0xe6c	// e6c <ADCIntHandler+0x14>
		ADC0->CSR = ADC12_SEQ_END0;
 eb8:	b347      	st.w      	r2, (r3, 0x1c)
}
 eba:	07d9      	br      	0xe6c	// e6c <ADCIntHandler+0x14>
 ebc:	20000050 	.long	0x20000050

Disassembly of section .text.EPT0IntHandler:

00000ec0 <EPT0IntHandler>:
//EPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPT0IntHandler(void) 
{
     ec0:	1460      	nie
     ec2:	1462      	ipush
     ec4:	14d1      	push      	r4, r15
    // ISR content ...
	if((EPT0->MISR&EPT_TRGEV0_INT)==EPT_TRGEV0_INT)			//TRGEV0 interrupt
     ec6:	1386      	lrw      	r4, 0x20000020	// 105c <EPT0IntHandler+0x19c>
     ec8:	3280      	movi      	r2, 128
     eca:	9460      	ld.w      	r3, (r4, 0x0)
     ecc:	60c8      	addu      	r3, r2
     ece:	9335      	ld.w      	r1, (r3, 0x54)
     ed0:	3001      	movi      	r0, 1
     ed2:	6840      	and      	r1, r0
     ed4:	3940      	cmpnei      	r1, 0
     ed6:	0c03      	bf      	0xedc	// edc <EPT0IntHandler+0x1c>
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIFT);
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
	}
	else if((EPT0->MISR&EPT_CAP_LD2)==EPT_CAP_LD2)			//Capture Load to CMPC interrupt
	{
		EPT0->ICR=EPT_CAP_LD2;
     ed8:	b317      	st.w      	r0, (r3, 0x5c)
     eda:	0424      	br      	0xf22	// f22 <EPT0IntHandler+0x62>
	else if((EPT0->MISR&EPT_TRGEV1_INT)==EPT_TRGEV1_INT)	//TRGEV1 interrupt
     edc:	9335      	ld.w      	r1, (r3, 0x54)
     ede:	3002      	movi      	r0, 2
     ee0:	6840      	and      	r1, r0
     ee2:	3940      	cmpnei      	r1, 0
     ee4:	0bfa      	bt      	0xed8	// ed8 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_TRGEV2_INT)==EPT_TRGEV2_INT)	//TRGEV2 interrupt
     ee6:	9335      	ld.w      	r1, (r3, 0x54)
     ee8:	3004      	movi      	r0, 4
     eea:	6840      	and      	r1, r0
     eec:	3940      	cmpnei      	r1, 0
     eee:	0bf5      	bt      	0xed8	// ed8 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_TRGEV3_INT)==EPT_TRGEV3_INT)	//TRGEV3 interrupt
     ef0:	9335      	ld.w      	r1, (r3, 0x54)
     ef2:	3008      	movi      	r0, 8
     ef4:	6840      	and      	r1, r0
     ef6:	3940      	cmpnei      	r1, 0
     ef8:	0bf0      	bt      	0xed8	// ed8 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_CAP_LD0)==EPT_CAP_LD0)			//Capture Load to CMPA interrupt
     efa:	9335      	ld.w      	r1, (r3, 0x54)
     efc:	3010      	movi      	r0, 16
     efe:	6840      	and      	r1, r0
     f00:	3940      	cmpnei      	r1, 0
     f02:	0c1f      	bf      	0xf40	// f40 <EPT0IntHandler+0x80>
		EPT0->ICR=EPT_CAP_LD0;
     f04:	b317      	st.w      	r0, (r3, 0x5c)
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIRT);
     f06:	3200      	movi      	r2, 0
     f08:	3101      	movi      	r1, 1
     f0a:	3000      	movi      	r0, 0
     f0c:	e3fffc8e 	bsr      	0x828	// 828 <EXTI_trigger_CMD>
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIFT);
     f10:	3201      	movi      	r2, 1
     f12:	3101      	movi      	r1, 1
     f14:	3001      	movi      	r0, 1
     f16:	e3fffc89 	bsr      	0x828	// 828 <EXTI_trigger_CMD>
		R_CMPA_BUF=EPT0->CMPA;			//Low voltage counter
     f1a:	9460      	ld.w      	r3, (r4, 0x0)
     f1c:	934b      	ld.w      	r2, (r3, 0x2c)
     f1e:	1271      	lrw      	r3, 0x20000dfc	// 1060 <EPT0IntHandler+0x1a0>
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
     f20:	b340      	st.w      	r2, (r3, 0x0)
	else if((EPT0->MISR&EPT_PEND)==EPT_PEND)				//End of cycle interrupt
	{
		EPT0->ICR=EPT_PEND;
	}
	//Emergency interruption
	if((EPT0->EMMISR&EPT_EP0_EMINT)==EPT_EP0_EMINT)			//interrupt flag of EP0 event
     f22:	9460      	ld.w      	r3, (r4, 0x0)
     f24:	3280      	movi      	r2, 128
     f26:	60c8      	addu      	r3, r2
     f28:	932b      	ld.w      	r1, (r3, 0x2c)
     f2a:	3001      	movi      	r0, 1
     f2c:	6840      	and      	r1, r0
     f2e:	3940      	cmpnei      	r1, 0
     f30:	0c5e      	bf      	0xfec	// fec <EPT0IntHandler+0x12c>
	{
		EPT0->EMICR=EPT_EP5_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP6_EMINT)==EPT_EP6_EMINT)	//interrupt flag of EP6 event
	{
		EPT0->EMICR=EPT_EP6_EMINT;
     f32:	b30d      	st.w      	r0, (r3, 0x34)
	}
	else if((EPT0->EMMISR&EPT_EOM_FAULT_EMINT)==EPT_EOM_FAULT_EMINT)	//interrupt flag of EOM_FAULT event
	{
		EPT0->EMICR=EPT_EOM_FAULT_EMINT;
	}
}
     f34:	d9ee2001 	ld.w      	r15, (r14, 0x4)
     f38:	9880      	ld.w      	r4, (r14, 0x0)
     f3a:	1402      	addi      	r14, r14, 8
     f3c:	1463      	ipop
     f3e:	1461      	nir
	else if((EPT0->MISR&EPT_CAP_LD1)==EPT_CAP_LD1)			//Capture Load to CMPB interrupt
     f40:	9335      	ld.w      	r1, (r3, 0x54)
     f42:	3020      	movi      	r0, 32
     f44:	6840      	and      	r1, r0
     f46:	3940      	cmpnei      	r1, 0
     f48:	0c10      	bf      	0xf68	// f68 <EPT0IntHandler+0xa8>
		EPT0->ICR=EPT_CAP_LD1;
     f4a:	b317      	st.w      	r0, (r3, 0x5c)
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);
     f4c:	3200      	movi      	r2, 0
     f4e:	3101      	movi      	r1, 1
     f50:	3001      	movi      	r0, 1
     f52:	e3fffc6b 	bsr      	0x828	// 828 <EXTI_trigger_CMD>
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIFT);
     f56:	3201      	movi      	r2, 1
     f58:	3101      	movi      	r1, 1
     f5a:	3000      	movi      	r0, 0
     f5c:	e3fffc66 	bsr      	0x828	// 828 <EXTI_trigger_CMD>
		R_CMPB_BUF=EPT0->CMPB;			//Duty counter
     f60:	9460      	ld.w      	r3, (r4, 0x0)
     f62:	934c      	ld.w      	r2, (r3, 0x30)
     f64:	1260      	lrw      	r3, 0x20000df4	// 1064 <EPT0IntHandler+0x1a4>
     f66:	07dd      	br      	0xf20	// f20 <EPT0IntHandler+0x60>
	else if((EPT0->MISR&EPT_CAP_LD2)==EPT_CAP_LD2)			//Capture Load to CMPC interrupt
     f68:	9335      	ld.w      	r1, (r3, 0x54)
     f6a:	3040      	movi      	r0, 64
     f6c:	6840      	and      	r1, r0
     f6e:	3940      	cmpnei      	r1, 0
     f70:	0bb4      	bt      	0xed8	// ed8 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_CAP_LD3)==EPT_CAP_LD3)			//Capture Load to CMPD interrupt
     f72:	9335      	ld.w      	r1, (r3, 0x54)
     f74:	6848      	and      	r1, r2
     f76:	3940      	cmpnei      	r1, 0
     f78:	0c03      	bf      	0xf7e	// f7e <EPT0IntHandler+0xbe>
		EPT0->ICR=EPT_PEND;
     f7a:	b357      	st.w      	r2, (r3, 0x5c)
     f7c:	07d3      	br      	0xf22	// f22 <EPT0IntHandler+0x62>
	else if((EPT0->MISR&EPT_CAU)==EPT_CAU)					//Up-Counting phase CNT = CMPA interrupt
     f7e:	3280      	movi      	r2, 128
     f80:	9335      	ld.w      	r1, (r3, 0x54)
     f82:	4241      	lsli      	r2, r2, 1
     f84:	6848      	and      	r1, r2
     f86:	3940      	cmpnei      	r1, 0
     f88:	0bf9      	bt      	0xf7a	// f7a <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CAD)==EPT_CAD)					//Down-Counting phase CNT = CMPA interrupt
     f8a:	3280      	movi      	r2, 128
     f8c:	9335      	ld.w      	r1, (r3, 0x54)
     f8e:	4242      	lsli      	r2, r2, 2
     f90:	6848      	and      	r1, r2
     f92:	3940      	cmpnei      	r1, 0
     f94:	0bf3      	bt      	0xf7a	// f7a <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CBU)==EPT_CBU)					//Up-Counting phase CNT = CMPB interrupt 
     f96:	3280      	movi      	r2, 128
     f98:	9335      	ld.w      	r1, (r3, 0x54)
     f9a:	4243      	lsli      	r2, r2, 3
     f9c:	6848      	and      	r1, r2
     f9e:	3940      	cmpnei      	r1, 0
     fa0:	0bed      	bt      	0xf7a	// f7a <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CBD)==EPT_CBD)					//Down-Counting phase CNT = CMPB interrupt
     fa2:	3280      	movi      	r2, 128
     fa4:	9335      	ld.w      	r1, (r3, 0x54)
     fa6:	4244      	lsli      	r2, r2, 4
     fa8:	6848      	and      	r1, r2
     faa:	3940      	cmpnei      	r1, 0
     fac:	0be7      	bt      	0xf7a	// f7a <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CCU)==EPT_CCU)					//Up-Counting phase CNT = CMPC interrupt 
     fae:	3280      	movi      	r2, 128
     fb0:	9335      	ld.w      	r1, (r3, 0x54)
     fb2:	4245      	lsli      	r2, r2, 5
     fb4:	6848      	and      	r1, r2
     fb6:	3940      	cmpnei      	r1, 0
     fb8:	0be1      	bt      	0xf7a	// f7a <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CCD)==EPT_CCD)					//Down-Counting phase CNT = CMPC interrupt
     fba:	3280      	movi      	r2, 128
     fbc:	9335      	ld.w      	r1, (r3, 0x54)
     fbe:	4246      	lsli      	r2, r2, 6
     fc0:	6848      	and      	r1, r2
     fc2:	3940      	cmpnei      	r1, 0
     fc4:	0bdb      	bt      	0xf7a	// f7a <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CDU)==EPT_CDU)					//Up-Counting phase CNT = CMPD interrupt
     fc6:	3280      	movi      	r2, 128
     fc8:	9335      	ld.w      	r1, (r3, 0x54)
     fca:	4247      	lsli      	r2, r2, 7
     fcc:	6848      	and      	r1, r2
     fce:	3940      	cmpnei      	r1, 0
     fd0:	0bd5      	bt      	0xf7a	// f7a <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CDD)==EPT_CDD)					//Down-Counting phase CNT = CMPD interrupt
     fd2:	3280      	movi      	r2, 128
     fd4:	9335      	ld.w      	r1, (r3, 0x54)
     fd6:	4248      	lsli      	r2, r2, 8
     fd8:	6848      	and      	r1, r2
     fda:	3940      	cmpnei      	r1, 0
     fdc:	0bcf      	bt      	0xf7a	// f7a <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_PEND)==EPT_PEND)				//End of cycle interrupt
     fde:	3280      	movi      	r2, 128
     fe0:	9335      	ld.w      	r1, (r3, 0x54)
     fe2:	4249      	lsli      	r2, r2, 9
     fe4:	6848      	and      	r1, r2
     fe6:	3940      	cmpnei      	r1, 0
     fe8:	0f9d      	bf      	0xf22	// f22 <EPT0IntHandler+0x62>
     fea:	07c8      	br      	0xf7a	// f7a <EPT0IntHandler+0xba>
	else if((EPT0->EMMISR&EPT_EP1_EMINT)==EPT_EP1_EMINT)	//interrupt flag of EP1 event
     fec:	932b      	ld.w      	r1, (r3, 0x2c)
     fee:	3002      	movi      	r0, 2
     ff0:	6840      	and      	r1, r0
     ff2:	3940      	cmpnei      	r1, 0
     ff4:	0b9f      	bt      	0xf32	// f32 <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP2_EMINT)==EPT_EP2_EMINT)	//interrupt flag of EP2 event
     ff6:	932b      	ld.w      	r1, (r3, 0x2c)
     ff8:	3004      	movi      	r0, 4
     ffa:	6840      	and      	r1, r0
     ffc:	3940      	cmpnei      	r1, 0
     ffe:	0b9a      	bt      	0xf32	// f32 <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP3_EMINT)==EPT_EP3_EMINT)	//interrupt flag of EP3 event
    1000:	932b      	ld.w      	r1, (r3, 0x2c)
    1002:	3008      	movi      	r0, 8
    1004:	6840      	and      	r1, r0
    1006:	3940      	cmpnei      	r1, 0
    1008:	0b95      	bt      	0xf32	// f32 <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP4_EMINT)==EPT_EP4_EMINT)	//interrupt flag of EP4 event
    100a:	932b      	ld.w      	r1, (r3, 0x2c)
    100c:	3010      	movi      	r0, 16
    100e:	6840      	and      	r1, r0
    1010:	3940      	cmpnei      	r1, 0
    1012:	0b90      	bt      	0xf32	// f32 <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP5_EMINT)==EPT_EP5_EMINT)	//interrupt flag of EP5 event
    1014:	932b      	ld.w      	r1, (r3, 0x2c)
    1016:	3020      	movi      	r0, 32
    1018:	6840      	and      	r1, r0
    101a:	3940      	cmpnei      	r1, 0
    101c:	0b8b      	bt      	0xf32	// f32 <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP6_EMINT)==EPT_EP6_EMINT)	//interrupt flag of EP6 event
    101e:	932b      	ld.w      	r1, (r3, 0x2c)
    1020:	3040      	movi      	r0, 64
    1022:	6840      	and      	r1, r0
    1024:	3940      	cmpnei      	r1, 0
    1026:	0b86      	bt      	0xf32	// f32 <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP7_EMINT)==EPT_EP7_EMINT)	//interrupt flag of EP7 event
    1028:	932b      	ld.w      	r1, (r3, 0x2c)
    102a:	6848      	and      	r1, r2
    102c:	3940      	cmpnei      	r1, 0
    102e:	0c03      	bf      	0x1034	// 1034 <EPT0IntHandler+0x174>
		EPT0->EMICR=EPT_EOM_FAULT_EMINT;
    1030:	b34d      	st.w      	r2, (r3, 0x34)
}
    1032:	0781      	br      	0xf34	// f34 <EPT0IntHandler+0x74>
	else if((EPT0->EMMISR&EPT_CPU_FAULT_EMINT)==EPT_CPU_FAULT_EMINT)	//interrupt flag of CPU_FAULT event
    1034:	3280      	movi      	r2, 128
    1036:	932b      	ld.w      	r1, (r3, 0x2c)
    1038:	4241      	lsli      	r2, r2, 1
    103a:	6848      	and      	r1, r2
    103c:	3940      	cmpnei      	r1, 0
    103e:	0bf9      	bt      	0x1030	// 1030 <EPT0IntHandler+0x170>
	else if((EPT0->EMMISR&EPT_MEM_FAULT_EMINT)==EPT_MEM_FAULT_EMINT)	//interrupt flag of MEM_FAULT event
    1040:	3280      	movi      	r2, 128
    1042:	932b      	ld.w      	r1, (r3, 0x2c)
    1044:	4242      	lsli      	r2, r2, 2
    1046:	6848      	and      	r1, r2
    1048:	3940      	cmpnei      	r1, 0
    104a:	0bf3      	bt      	0x1030	// 1030 <EPT0IntHandler+0x170>
	else if((EPT0->EMMISR&EPT_EOM_FAULT_EMINT)==EPT_EOM_FAULT_EMINT)	//interrupt flag of EOM_FAULT event
    104c:	3280      	movi      	r2, 128
    104e:	932b      	ld.w      	r1, (r3, 0x2c)
    1050:	4243      	lsli      	r2, r2, 3
    1052:	6848      	and      	r1, r2
    1054:	3940      	cmpnei      	r1, 0
    1056:	0bed      	bt      	0x1030	// 1030 <EPT0IntHandler+0x170>
    1058:	076e      	br      	0xf34	// f34 <EPT0IntHandler+0x74>
    105a:	0000      	bkpt
    105c:	20000020 	.long	0x20000020
    1060:	20000dfc 	.long	0x20000dfc
    1064:	20000df4 	.long	0x20000df4

Disassembly of section .text.WWDTHandler:

00001068 <WWDTHandler>:
//WWDT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void WWDTHandler(void)
{
    1068:	1460      	nie
    106a:	1462      	ipush
    106c:	14d2      	push      	r4-r5, r15
	WWDT->ICR=0X01;
    106e:	10ab      	lrw      	r5, 0x20000010	// 1098 <WWDTHandler+0x30>
    1070:	3401      	movi      	r4, 1
    1072:	9560      	ld.w      	r3, (r5, 0x0)
    1074:	b385      	st.w      	r4, (r3, 0x14)
	WWDT_CNT_Load(0xFF);
    1076:	30ff      	movi      	r0, 255
    1078:	e3fffc8e 	bsr      	0x994	// 994 <WWDT_CNT_Load>
	if((WWDT->MISR&WWDT_EVI)==WWDT_EVI)					//WWDT EVI interrupt
    107c:	9540      	ld.w      	r2, (r5, 0x0)
    107e:	9263      	ld.w      	r3, (r2, 0xc)
    1080:	68d0      	and      	r3, r4
    1082:	3b40      	cmpnei      	r3, 0
    1084:	0c02      	bf      	0x1088	// 1088 <WWDTHandler+0x20>
	{
		WWDT->ICR = WWDT_EVI;
    1086:	b285      	st.w      	r4, (r2, 0x14)
	} 
}
    1088:	d9ee2002 	ld.w      	r15, (r14, 0x8)
    108c:	98a1      	ld.w      	r5, (r14, 0x4)
    108e:	9880      	ld.w      	r4, (r14, 0x0)
    1090:	1403      	addi      	r14, r14, 12
    1092:	1463      	ipop
    1094:	1461      	nir
    1096:	0000      	bkpt
    1098:	20000010 	.long	0x20000010

Disassembly of section .text.GPT0IntHandler:

0000109c <GPT0IntHandler>:
//GPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPT0IntHandler(void) 
{
    109c:	1460      	nie
    109e:	1462      	ipush
    // ISR content ...
	if((GPT0->MISR&GPT_INT_TRGEV0)==GPT_INT_TRGEV0)			//TRGEV0 interrupt
    10a0:	107e      	lrw      	r3, 0x20000024	// 1118 <GPT0IntHandler+0x7c>
    10a2:	3101      	movi      	r1, 1
    10a4:	9360      	ld.w      	r3, (r3, 0x0)
    10a6:	237f      	addi      	r3, 128
    10a8:	9355      	ld.w      	r2, (r3, 0x54)
    10aa:	6884      	and      	r2, r1
    10ac:	3a40      	cmpnei      	r2, 0
    10ae:	0c04      	bf      	0x10b6	// 10b6 <GPT0IntHandler+0x1a>
	{
		GPT0->ICR = GPT_INT_CAPLD0;
	}
	else if((GPT0->MISR&GPT_INT_CAPLD1)==GPT_INT_CAPLD1)		//Capture Load to CMPB interrupt
	{
		GPT0->ICR = GPT_INT_CAPLD1;
    10b0:	b337      	st.w      	r1, (r3, 0x5c)
	}
	else if((GPT0->MISR&GPT_INT_PEND)==GPT_INT_PEND)		//End of cycle interrupt 
	{
		GPT0->ICR = GPT_INT_PEND;
	}
}
    10b2:	1463      	ipop
    10b4:	1461      	nir
	else if((GPT0->MISR&GPT_INT_TRGEV1)==GPT_INT_TRGEV1)	//TRGEV1 interrupt
    10b6:	9355      	ld.w      	r2, (r3, 0x54)
    10b8:	3102      	movi      	r1, 2
    10ba:	6884      	and      	r2, r1
    10bc:	3a40      	cmpnei      	r2, 0
    10be:	0bf9      	bt      	0x10b0	// 10b0 <GPT0IntHandler+0x14>
	else if((GPT0->MISR&GPT_INT_CAPLD0)==GPT_INT_CAPLD0)		//Capture Load to CMPA interrupt
    10c0:	9355      	ld.w      	r2, (r3, 0x54)
    10c2:	3110      	movi      	r1, 16
    10c4:	6884      	and      	r2, r1
    10c6:	3a40      	cmpnei      	r2, 0
    10c8:	0bf4      	bt      	0x10b0	// 10b0 <GPT0IntHandler+0x14>
	else if((GPT0->MISR&GPT_INT_CAPLD1)==GPT_INT_CAPLD1)		//Capture Load to CMPB interrupt
    10ca:	9355      	ld.w      	r2, (r3, 0x54)
    10cc:	3120      	movi      	r1, 32
    10ce:	6884      	and      	r2, r1
    10d0:	3a40      	cmpnei      	r2, 0
    10d2:	0bef      	bt      	0x10b0	// 10b0 <GPT0IntHandler+0x14>
	else if((GPT0->MISR&GPT_INT_CAU)==GPT_INT_CAU)			//Up-Counting phase CNT = CMPA Interrupt
    10d4:	3280      	movi      	r2, 128
    10d6:	9335      	ld.w      	r1, (r3, 0x54)
    10d8:	4241      	lsli      	r2, r2, 1
    10da:	6848      	and      	r1, r2
    10dc:	3940      	cmpnei      	r1, 0
    10de:	0c03      	bf      	0x10e4	// 10e4 <GPT0IntHandler+0x48>
		GPT0->ICR = GPT_INT_PEND;
    10e0:	b357      	st.w      	r2, (r3, 0x5c)
}
    10e2:	07e8      	br      	0x10b2	// 10b2 <GPT0IntHandler+0x16>
	else if((GPT0->MISR&GPT_INT_CAD)==GPT_INT_CAD)			//Down-Counting phase CNT = CMPA Interrupt
    10e4:	3280      	movi      	r2, 128
    10e6:	9335      	ld.w      	r1, (r3, 0x54)
    10e8:	4242      	lsli      	r2, r2, 2
    10ea:	6848      	and      	r1, r2
    10ec:	3940      	cmpnei      	r1, 0
    10ee:	0bf9      	bt      	0x10e0	// 10e0 <GPT0IntHandler+0x44>
	else if((GPT0->MISR&GPT_INT_CBU)==GPT_INT_CBU)			//Up-Counting phase CNT = CMPB Interrupt
    10f0:	3280      	movi      	r2, 128
    10f2:	9335      	ld.w      	r1, (r3, 0x54)
    10f4:	4243      	lsli      	r2, r2, 3
    10f6:	6848      	and      	r1, r2
    10f8:	3940      	cmpnei      	r1, 0
    10fa:	0bf3      	bt      	0x10e0	// 10e0 <GPT0IntHandler+0x44>
	else if((GPT0->MISR&GPT_INT_CBD)==GPT_INT_CBD)			//Down-Counting phase CNT = CMPB Interrupt
    10fc:	3280      	movi      	r2, 128
    10fe:	9335      	ld.w      	r1, (r3, 0x54)
    1100:	4244      	lsli      	r2, r2, 4
    1102:	6848      	and      	r1, r2
    1104:	3940      	cmpnei      	r1, 0
    1106:	0bed      	bt      	0x10e0	// 10e0 <GPT0IntHandler+0x44>
	else if((GPT0->MISR&GPT_INT_PEND)==GPT_INT_PEND)		//End of cycle interrupt 
    1108:	3280      	movi      	r2, 128
    110a:	9335      	ld.w      	r1, (r3, 0x54)
    110c:	4249      	lsli      	r2, r2, 9
    110e:	6848      	and      	r1, r2
    1110:	3940      	cmpnei      	r1, 0
    1112:	0be7      	bt      	0x10e0	// 10e0 <GPT0IntHandler+0x44>
    1114:	07cf      	br      	0x10b2	// 10b2 <GPT0IntHandler+0x16>
    1116:	0000      	bkpt
    1118:	20000024 	.long	0x20000024

Disassembly of section .text.RTCIntHandler:

0000111c <RTCIntHandler>:
//RTC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void RTCIntHandler(void) 
{
    111c:	1460      	nie
    111e:	1462      	ipush
    // ISR content ...
	if((RTC->MISR&ALRA_INT)==ALRA_INT)			//Interrupt of alarm A
    1120:	1079      	lrw      	r3, 0x20000018	// 1184 <RTCIntHandler+0x68>
    1122:	3101      	movi      	r1, 1
    1124:	9360      	ld.w      	r3, (r3, 0x0)
    1126:	934a      	ld.w      	r2, (r3, 0x28)
    1128:	6884      	and      	r2, r1
    112a:	3a40      	cmpnei      	r2, 0
    112c:	0c14      	bf      	0x1154	// 1154 <RTCIntHandler+0x38>
	{
		RTC->ICR=ALRA_INT;
		RTC->KEY=0XCA53;
    112e:	1057      	lrw      	r2, 0xca53	// 1188 <RTCIntHandler+0x6c>
		RTC->ICR=ALRA_INT;
    1130:	b32b      	st.w      	r1, (r3, 0x2c)
		RTC->KEY=0XCA53;
    1132:	b34c      	st.w      	r2, (r3, 0x30)
		RTC->CR=RTC->CR|0x01;
    1134:	9342      	ld.w      	r2, (r3, 0x8)
    1136:	6c84      	or      	r2, r1
    1138:	b342      	st.w      	r2, (r3, 0x8)
		RTC->TIMR=(0x10<<16)|(0x00<<8)|(0x00);			//Hour bit6->0:am 1:pm	
    113a:	3280      	movi      	r2, 128
    113c:	424d      	lsli      	r2, r2, 13
    113e:	b340      	st.w      	r2, (r3, 0x0)
		while(RTC->CR&0x02);							//busy TIMR DATR ALRAR ALRBR Update done
    1140:	3102      	movi      	r1, 2
    1142:	9342      	ld.w      	r2, (r3, 0x8)
    1144:	6884      	and      	r2, r1
    1146:	3a40      	cmpnei      	r2, 0
    1148:	0bfd      	bt      	0x1142	// 1142 <RTCIntHandler+0x26>
		RTC->CR &= ~0x1;
    114a:	9342      	ld.w      	r2, (r3, 0x8)
    114c:	3a80      	bclri      	r2, 0
    114e:	b342      	st.w      	r2, (r3, 0x8)
	}
	else if((RTC->MISR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)		//Interrupt of trigger event 1
	{
		RTC->ICR=RTC_TRGEV1_INT;
	}
}
    1150:	1463      	ipop
    1152:	1461      	nir
	else if((RTC->MISR&ALRB_INT)==ALRB_INT)			//Interrupt of alarm B				
    1154:	934a      	ld.w      	r2, (r3, 0x28)
    1156:	3102      	movi      	r1, 2
    1158:	6884      	and      	r2, r1
    115a:	3a40      	cmpnei      	r2, 0
    115c:	0c03      	bf      	0x1162	// 1162 <RTCIntHandler+0x46>
		RTC->ICR=RTC_TRGEV1_INT;
    115e:	b32b      	st.w      	r1, (r3, 0x2c)
}
    1160:	07f8      	br      	0x1150	// 1150 <RTCIntHandler+0x34>
	else if((RTC->MISR&CPRD_INT)==CPRD_INT)			//Interrupt of alarm CPRD
    1162:	934a      	ld.w      	r2, (r3, 0x28)
    1164:	3104      	movi      	r1, 4
    1166:	6884      	and      	r2, r1
    1168:	3a40      	cmpnei      	r2, 0
    116a:	0bfa      	bt      	0x115e	// 115e <RTCIntHandler+0x42>
	else if((RTC->MISR&RTC_TRGEV0_INT)==RTC_TRGEV0_INT)		//Interrupt of trigger event 0
    116c:	934a      	ld.w      	r2, (r3, 0x28)
    116e:	3108      	movi      	r1, 8
    1170:	6884      	and      	r2, r1
    1172:	3a40      	cmpnei      	r2, 0
    1174:	0bf5      	bt      	0x115e	// 115e <RTCIntHandler+0x42>
	else if((RTC->MISR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)		//Interrupt of trigger event 1
    1176:	934a      	ld.w      	r2, (r3, 0x28)
    1178:	3110      	movi      	r1, 16
    117a:	6884      	and      	r2, r1
    117c:	3a40      	cmpnei      	r2, 0
    117e:	0bf0      	bt      	0x115e	// 115e <RTCIntHandler+0x42>
    1180:	07e8      	br      	0x1150	// 1150 <RTCIntHandler+0x34>
    1182:	0000      	bkpt
    1184:	20000018 	.long	0x20000018
    1188:	0000ca53 	.long	0x0000ca53

Disassembly of section .text.UART0IntHandler:

0000118c <UART0IntHandler>:
//UART0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0IntHandler(void) 
{
    118c:	1460      	nie
    118e:	1462      	ipush
    // ISR content ...
	if ((UART0->ISR&UART_RX_INT_S)==UART_RX_INT_S)				//RX interrupt
    1190:	106d      	lrw      	r3, 0x20000040	// 11c4 <UART0IntHandler+0x38>
    1192:	3102      	movi      	r1, 2
    1194:	9360      	ld.w      	r3, (r3, 0x0)
    1196:	9343      	ld.w      	r2, (r3, 0xc)
    1198:	6884      	and      	r2, r1
    119a:	3a40      	cmpnei      	r2, 0
    119c:	0c03      	bf      	0x11a2	// 11a2 <UART0IntHandler+0x16>
	{
		UART0->ISR=UART_RX_IOV_S;
	}
	else if ((UART0->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
	{
		UART0->ISR=UART_TX_IOV_S;
    119e:	b323      	st.w      	r1, (r3, 0xc)
	}
}
    11a0:	0410      	br      	0x11c0	// 11c0 <UART0IntHandler+0x34>
	else if( (UART0->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 		//TX interrupt
    11a2:	9343      	ld.w      	r2, (r3, 0xc)
    11a4:	3101      	movi      	r1, 1
    11a6:	6884      	and      	r2, r1
    11a8:	3a40      	cmpnei      	r2, 0
    11aa:	0bfa      	bt      	0x119e	// 119e <UART0IntHandler+0x12>
	else if ((UART0->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)			//RX overrun interrupt
    11ac:	9343      	ld.w      	r2, (r3, 0xc)
    11ae:	3108      	movi      	r1, 8
    11b0:	6884      	and      	r2, r1
    11b2:	3a40      	cmpnei      	r2, 0
    11b4:	0bf5      	bt      	0x119e	// 119e <UART0IntHandler+0x12>
	else if ((UART0->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
    11b6:	9343      	ld.w      	r2, (r3, 0xc)
    11b8:	3104      	movi      	r1, 4
    11ba:	6884      	and      	r2, r1
    11bc:	3a40      	cmpnei      	r2, 0
    11be:	0bf0      	bt      	0x119e	// 119e <UART0IntHandler+0x12>
}
    11c0:	1463      	ipop
    11c2:	1461      	nir
    11c4:	20000040 	.long	0x20000040

Disassembly of section .text.UART1IntHandler:

000011c8 <UART1IntHandler>:
//UART1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART1IntHandler(void) 
{
    11c8:	1460      	nie
    11ca:	1462      	ipush
    // ISR content ...
	if ((UART1->ISR&UART_RX_INT_S)==UART_RX_INT_S)				//RX interrupt
    11cc:	106d      	lrw      	r3, 0x2000003c	// 1200 <UART1IntHandler+0x38>
    11ce:	3102      	movi      	r1, 2
    11d0:	9360      	ld.w      	r3, (r3, 0x0)
    11d2:	9343      	ld.w      	r2, (r3, 0xc)
    11d4:	6884      	and      	r2, r1
    11d6:	3a40      	cmpnei      	r2, 0
    11d8:	0c03      	bf      	0x11de	// 11de <UART1IntHandler+0x16>
	{
		UART1->ISR=UART_RX_IOV_S;
	}
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
	{
		UART1->ISR=UART_TX_IOV_S;
    11da:	b323      	st.w      	r1, (r3, 0xc)
	}
}
    11dc:	0410      	br      	0x11fc	// 11fc <UART1IntHandler+0x34>
	else if( (UART1->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 		//TX interrupt
    11de:	9343      	ld.w      	r2, (r3, 0xc)
    11e0:	3101      	movi      	r1, 1
    11e2:	6884      	and      	r2, r1
    11e4:	3a40      	cmpnei      	r2, 0
    11e6:	0bfa      	bt      	0x11da	// 11da <UART1IntHandler+0x12>
	else if ((UART1->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)			//RX overrun interrupt
    11e8:	9343      	ld.w      	r2, (r3, 0xc)
    11ea:	3108      	movi      	r1, 8
    11ec:	6884      	and      	r2, r1
    11ee:	3a40      	cmpnei      	r2, 0
    11f0:	0bf5      	bt      	0x11da	// 11da <UART1IntHandler+0x12>
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
    11f2:	9343      	ld.w      	r2, (r3, 0xc)
    11f4:	3104      	movi      	r1, 4
    11f6:	6884      	and      	r2, r1
    11f8:	3a40      	cmpnei      	r2, 0
    11fa:	0bf0      	bt      	0x11da	// 11da <UART1IntHandler+0x12>
}
    11fc:	1463      	ipop
    11fe:	1461      	nir
    1200:	2000003c 	.long	0x2000003c

Disassembly of section .text.UART2IntHandler:

00001204 <UART2IntHandler>:
//UART2 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART2IntHandler(void) 
{
    1204:	1460      	nie
    1206:	1462      	ipush
    // ISR content ...
	if ((UART2->ISR&UART_RX_INT_S)==UART_RX_INT_S)				//RX interrupt
    1208:	106d      	lrw      	r3, 0x20000038	// 123c <UART2IntHandler+0x38>
    120a:	3102      	movi      	r1, 2
    120c:	9360      	ld.w      	r3, (r3, 0x0)
    120e:	9343      	ld.w      	r2, (r3, 0xc)
    1210:	6884      	and      	r2, r1
    1212:	3a40      	cmpnei      	r2, 0
    1214:	0c03      	bf      	0x121a	// 121a <UART2IntHandler+0x16>
	{
		UART2->ISR=UART_RX_IOV_S;
	}
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
	{
		UART2->ISR=UART_TX_IOV_S;
    1216:	b323      	st.w      	r1, (r3, 0xc)
	}
}
    1218:	0410      	br      	0x1238	// 1238 <UART2IntHandler+0x34>
	else if( (UART2->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 		//TX interrupt
    121a:	9343      	ld.w      	r2, (r3, 0xc)
    121c:	3101      	movi      	r1, 1
    121e:	6884      	and      	r2, r1
    1220:	3a40      	cmpnei      	r2, 0
    1222:	0bfa      	bt      	0x1216	// 1216 <UART2IntHandler+0x12>
	else if ((UART2->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)			//RX overrun interrupt
    1224:	9343      	ld.w      	r2, (r3, 0xc)
    1226:	3108      	movi      	r1, 8
    1228:	6884      	and      	r2, r1
    122a:	3a40      	cmpnei      	r2, 0
    122c:	0bf5      	bt      	0x1216	// 1216 <UART2IntHandler+0x12>
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)			//TX overrun interrupt
    122e:	9343      	ld.w      	r2, (r3, 0xc)
    1230:	3104      	movi      	r1, 4
    1232:	6884      	and      	r2, r1
    1234:	3a40      	cmpnei      	r2, 0
    1236:	0bf0      	bt      	0x1216	// 1216 <UART2IntHandler+0x12>
}
    1238:	1463      	ipop
    123a:	1461      	nir
    123c:	20000038 	.long	0x20000038

Disassembly of section .text.SPI0IntHandler:

00001240 <SPI0IntHandler>:
//SPI Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SPI0IntHandler(void) 
{
    1240:	1460      	nie
    1242:	1462      	ipush
    // ISR content ...
	if((SPI0->MISR&SPI_PORIM)==SPI_PORIM)					//Receive Overrun Interrupt
    1244:	1178      	lrw      	r3, 0x20000034	// 1324 <SPI0IntHandler+0xe4>
    1246:	3101      	movi      	r1, 1
    1248:	9360      	ld.w      	r3, (r3, 0x0)
    124a:	9347      	ld.w      	r2, (r3, 0x1c)
    124c:	6884      	and      	r2, r1
    124e:	3a40      	cmpnei      	r2, 0
    1250:	0c03      	bf      	0x1256	// 1256 <SPI0IntHandler+0x16>
			}
		}
	}
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
	{
		SPI0->ICR = SPI_TXIM;
    1252:	b328      	st.w      	r1, (r3, 0x20)
	}

}
    1254:	0407      	br      	0x1262	// 1262 <SPI0IntHandler+0x22>
	else if((SPI0->MISR&SPI_RTIM)==SPI_RTIM)				//Receive Timeout Interrupt
    1256:	9347      	ld.w      	r2, (r3, 0x1c)
    1258:	3002      	movi      	r0, 2
    125a:	6880      	and      	r2, r0
    125c:	3a40      	cmpnei      	r2, 0
    125e:	0c04      	bf      	0x1266	// 1266 <SPI0IntHandler+0x26>
		SPI0->ICR = SPI_RTIM;
    1260:	b308      	st.w      	r0, (r3, 0x20)
}
    1262:	1463      	ipop
    1264:	1461      	nir
	else if((SPI0->MISR&SPI_RXIM)==SPI_RXIM)				//Receive FIFO Interrupt,FIFO can be set 1/8,1/4,1/2 FIFO Interrupt
    1266:	9347      	ld.w      	r2, (r3, 0x1c)
    1268:	3004      	movi      	r0, 4
    126a:	6880      	and      	r2, r0
    126c:	3a40      	cmpnei      	r2, 0
    126e:	0c55      	bf      	0x1318	// 1318 <SPI0IntHandler+0xd8>
		SPI0->ICR = SPI_RXIM;
    1270:	b308      	st.w      	r0, (r3, 0x20)
		if(SPI0->DR==0xaa)
    1272:	9302      	ld.w      	r0, (r3, 0x8)
    1274:	32aa      	movi      	r2, 170
    1276:	6482      	cmpne      	r0, r2
    1278:	083e      	bt      	0x12f4	// 12f4 <SPI0IntHandler+0xb4>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    127a:	3102      	movi      	r1, 2
    127c:	9343      	ld.w      	r2, (r3, 0xc)
    127e:	6884      	and      	r2, r1
    1280:	3a40      	cmpnei      	r2, 0
    1282:	0ffd      	bf      	0x127c	// 127c <SPI0IntHandler+0x3c>
			SPI0->DR = 0x11;
    1284:	3211      	movi      	r2, 17
    1286:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    1288:	3110      	movi      	r1, 16
    128a:	9343      	ld.w      	r2, (r3, 0xc)
    128c:	6884      	and      	r2, r1
    128e:	3a40      	cmpnei      	r2, 0
    1290:	0bfd      	bt      	0x128a	// 128a <SPI0IntHandler+0x4a>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    1292:	3102      	movi      	r1, 2
    1294:	9343      	ld.w      	r2, (r3, 0xc)
    1296:	6884      	and      	r2, r1
    1298:	3a40      	cmpnei      	r2, 0
    129a:	0ffd      	bf      	0x1294	// 1294 <SPI0IntHandler+0x54>
			SPI0->DR = 0x12;
    129c:	3212      	movi      	r2, 18
    129e:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    12a0:	3110      	movi      	r1, 16
    12a2:	9343      	ld.w      	r2, (r3, 0xc)
    12a4:	6884      	and      	r2, r1
    12a6:	3a40      	cmpnei      	r2, 0
    12a8:	0bfd      	bt      	0x12a2	// 12a2 <SPI0IntHandler+0x62>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    12aa:	3102      	movi      	r1, 2
    12ac:	9343      	ld.w      	r2, (r3, 0xc)
    12ae:	6884      	and      	r2, r1
    12b0:	3a40      	cmpnei      	r2, 0
    12b2:	0ffd      	bf      	0x12ac	// 12ac <SPI0IntHandler+0x6c>
			SPI0->DR = 0x13;
    12b4:	3213      	movi      	r2, 19
    12b6:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    12b8:	3110      	movi      	r1, 16
    12ba:	9343      	ld.w      	r2, (r3, 0xc)
    12bc:	6884      	and      	r2, r1
    12be:	3a40      	cmpnei      	r2, 0
    12c0:	0bfd      	bt      	0x12ba	// 12ba <SPI0IntHandler+0x7a>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    12c2:	3102      	movi      	r1, 2
    12c4:	9343      	ld.w      	r2, (r3, 0xc)
    12c6:	6884      	and      	r2, r1
    12c8:	3a40      	cmpnei      	r2, 0
    12ca:	0ffd      	bf      	0x12c4	// 12c4 <SPI0IntHandler+0x84>
			SPI0->DR = 0x14;
    12cc:	3214      	movi      	r2, 20
    12ce:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    12d0:	3110      	movi      	r1, 16
    12d2:	9343      	ld.w      	r2, (r3, 0xc)
    12d4:	6884      	and      	r2, r1
    12d6:	3a40      	cmpnei      	r2, 0
    12d8:	0bfd      	bt      	0x12d2	// 12d2 <SPI0IntHandler+0x92>
			while(((SPI0->SR) & SSP_TNF) != SSP_TNF);	//Transmit FIFO is not full？
    12da:	3102      	movi      	r1, 2
    12dc:	9343      	ld.w      	r2, (r3, 0xc)
    12de:	6884      	and      	r2, r1
    12e0:	3a40      	cmpnei      	r2, 0
    12e2:	0ffd      	bf      	0x12dc	// 12dc <SPI0IntHandler+0x9c>
			SPI0->DR = 0x15;
    12e4:	3215      	movi      	r2, 21
    12e6:	b342      	st.w      	r2, (r3, 0x8)
			while(((SPI0->SR) & SSP_BSY) == SSP_BSY);	//Send or receive over？
    12e8:	3110      	movi      	r1, 16
    12ea:	9343      	ld.w      	r2, (r3, 0xc)
    12ec:	6884      	and      	r2, r1
    12ee:	3a40      	cmpnei      	r2, 0
    12f0:	0bfd      	bt      	0x12ea	// 12ea <SPI0IntHandler+0xaa>
    12f2:	07b8      	br      	0x1262	// 1262 <SPI0IntHandler+0x22>
			if(((SPI0->SR) & SSP_TFE)!=SSP_TFE)
    12f4:	9343      	ld.w      	r2, (r3, 0xc)
    12f6:	6884      	and      	r2, r1
    12f8:	3a40      	cmpnei      	r2, 0
    12fa:	0bb4      	bt      	0x1262	// 1262 <SPI0IntHandler+0x22>
				SPI0->DR=0x0;								//FIFO=0
    12fc:	b342      	st.w      	r2, (r3, 0x8)
				while(((SPI0->SR) & SSP_BSY) == SSP_BSY);		//Send or receive over？
    12fe:	3110      	movi      	r1, 16
				SPI0->DR=0x0;								//FIFO=0
    1300:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    1302:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    1304:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    1306:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    1308:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    130a:	b342      	st.w      	r2, (r3, 0x8)
				SPI0->DR=0x0;								//FIFO=0
    130c:	b342      	st.w      	r2, (r3, 0x8)
				while(((SPI0->SR) & SSP_BSY) == SSP_BSY);		//Send or receive over？
    130e:	9343      	ld.w      	r2, (r3, 0xc)
    1310:	6884      	and      	r2, r1
    1312:	3a40      	cmpnei      	r2, 0
    1314:	0bfd      	bt      	0x130e	// 130e <SPI0IntHandler+0xce>
    1316:	07a6      	br      	0x1262	// 1262 <SPI0IntHandler+0x22>
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
    1318:	9347      	ld.w      	r2, (r3, 0x1c)
    131a:	3108      	movi      	r1, 8
    131c:	6884      	and      	r2, r1
    131e:	3a40      	cmpnei      	r2, 0
    1320:	0b99      	bt      	0x1252	// 1252 <SPI0IntHandler+0x12>
    1322:	07a0      	br      	0x1262	// 1262 <SPI0IntHandler+0x22>
    1324:	20000034 	.long	0x20000034

Disassembly of section .text.SIO0IntHandler:

00001328 <SIO0IntHandler>:
//SIO Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SIO0IntHandler(void) 
{
    1328:	1460      	nie
    132a:	1462      	ipush
		delay_nms(10);
		SIO0->TXBUF=(0x03<<30)|(0x02<<28)|(0x03<<26)|(0x02<<24)|(0x03<<22)|(0x02<<20)|(0x03<<18)|(0x02<<16)|
				(0x01<<14)|(0x00<<12)|(0x01<<10)|(0x00<<8)|(0x01<<6)|(0x00<<4)|(0x01<<2)|(0x0<<0);		//0:D0,1:D1,2:DL,3:DH;	
	}*/
	
	if(SIO0->MISR&0X02)					//RXDNE
    132c:	107d      	lrw      	r3, 0x2000002c	// 13a0 <SIO0IntHandler+0x78>
    132e:	3102      	movi      	r1, 2
    1330:	9360      	ld.w      	r3, (r3, 0x0)
    1332:	9349      	ld.w      	r2, (r3, 0x24)
    1334:	6884      	and      	r2, r1
    1336:	3a40      	cmpnei      	r2, 0
    1338:	0c13      	bf      	0x135e	// 135e <SIO0IntHandler+0x36>
	{
		SIO0->ICR=0X02;
    133a:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count>=1)
    133c:	101a      	lrw      	r0, 0x20000e00	// 13a4 <SIO0IntHandler+0x7c>
    133e:	9040      	ld.w      	r2, (r0, 0x0)
    1340:	3a20      	cmplti      	r2, 1
    1342:	080c      	bt      	0x135a	// 135a <SIO0IntHandler+0x32>
		{
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF&0xff000000;			//8bit
    1344:	9040      	ld.w      	r2, (r0, 0x0)
    1346:	9327      	ld.w      	r1, (r3, 0x1c)
    1348:	4938      	lsri      	r1, r1, 24
    134a:	4262      	lsli      	r3, r2, 2
    134c:	1057      	lrw      	r2, 0x20000e04	// 13a8 <SIO0IntHandler+0x80>
    134e:	4138      	lsli      	r1, r1, 24
    1350:	60c8      	addu      	r3, r2
    1352:	b320      	st.w      	r1, (r3, 0x0)
			nop;
    1354:	6c03      	mov      	r0, r0
			R_SIORX_count=0;
    1356:	3300      	movi      	r3, 0
    1358:	b060      	st.w      	r3, (r0, 0x0)
	}
	else if(SIO0->MISR&0X020)				//TIMEOUT
	{
		SIO0->ICR=0X20;
	}
}
    135a:	1463      	ipop
    135c:	1461      	nir
	else if(SIO0->MISR&0X08)					//RXBUFFULL	
    135e:	9349      	ld.w      	r2, (r3, 0x24)
    1360:	3108      	movi      	r1, 8
    1362:	6884      	and      	r2, r1
    1364:	3a40      	cmpnei      	r2, 0
    1366:	0c10      	bf      	0x1386	// 1386 <SIO0IntHandler+0x5e>
		SIO0->ICR=0X08;
    1368:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count<1)
    136a:	102f      	lrw      	r1, 0x20000e00	// 13a4 <SIO0IntHandler+0x7c>
    136c:	9140      	ld.w      	r2, (r1, 0x0)
    136e:	3a20      	cmplti      	r2, 1
    1370:	0ff5      	bf      	0x135a	// 135a <SIO0IntHandler+0x32>
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF;				//32bit
    1372:	9140      	ld.w      	r2, (r1, 0x0)
    1374:	9307      	ld.w      	r0, (r3, 0x1c)
    1376:	4262      	lsli      	r3, r2, 2
    1378:	104c      	lrw      	r2, 0x20000e04	// 13a8 <SIO0IntHandler+0x80>
    137a:	60c8      	addu      	r3, r2
    137c:	b300      	st.w      	r0, (r3, 0x0)
			R_SIORX_count++;
    137e:	9160      	ld.w      	r3, (r1, 0x0)
    1380:	2300      	addi      	r3, 1
    1382:	b160      	st.w      	r3, (r1, 0x0)
    1384:	07eb      	br      	0x135a	// 135a <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X010)				//BREAK
    1386:	9349      	ld.w      	r2, (r3, 0x24)
    1388:	3110      	movi      	r1, 16
    138a:	6884      	and      	r2, r1
    138c:	3a40      	cmpnei      	r2, 0
    138e:	0c03      	bf      	0x1394	// 1394 <SIO0IntHandler+0x6c>
		SIO0->ICR=0X20;
    1390:	b32b      	st.w      	r1, (r3, 0x2c)
}
    1392:	07e4      	br      	0x135a	// 135a <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X020)				//TIMEOUT
    1394:	9349      	ld.w      	r2, (r3, 0x24)
    1396:	3120      	movi      	r1, 32
    1398:	6884      	and      	r2, r1
    139a:	3a40      	cmpnei      	r2, 0
    139c:	0bfa      	bt      	0x1390	// 1390 <SIO0IntHandler+0x68>
    139e:	07de      	br      	0x135a	// 135a <SIO0IntHandler+0x32>
    13a0:	2000002c 	.long	0x2000002c
    13a4:	20000e00 	.long	0x20000e00
    13a8:	20000e04 	.long	0x20000e04

Disassembly of section .text.EXI0IntHandler:

000013ac <EXI0IntHandler>:
//EXT0/16 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0IntHandler(void) 
{
    13ac:	1460      	nie
    13ae:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN0)==EXI_PIN0) 			//EXT0 Interrupt
    13b0:	106a      	lrw      	r3, 0x2000005c	// 13d8 <EXI0IntHandler+0x2c>
    13b2:	3101      	movi      	r1, 1
    13b4:	9360      	ld.w      	r3, (r3, 0x0)
    13b6:	237f      	addi      	r3, 128
    13b8:	934c      	ld.w      	r2, (r3, 0x30)
    13ba:	6884      	and      	r2, r1
    13bc:	3a40      	cmpnei      	r2, 0
    13be:	0c04      	bf      	0x13c6	// 13c6 <EXI0IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN0;
    13c0:	b32b      	st.w      	r1, (r3, 0x2c)
	}
	else if ((SYSCON->EXIRS&EXI_PIN16)==EXI_PIN16) 		//EXT16 Interrupt
	{
		SYSCON->EXICR = EXI_PIN16;
	}
}
    13c2:	1463      	ipop
    13c4:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN16)==EXI_PIN16) 		//EXT16 Interrupt
    13c6:	3280      	movi      	r2, 128
    13c8:	932c      	ld.w      	r1, (r3, 0x30)
    13ca:	4249      	lsli      	r2, r2, 9
    13cc:	6848      	and      	r1, r2
    13ce:	3940      	cmpnei      	r1, 0
    13d0:	0ff9      	bf      	0x13c2	// 13c2 <EXI0IntHandler+0x16>
		SYSCON->EXICR = EXI_PIN16;
    13d2:	b34b      	st.w      	r2, (r3, 0x2c)
}
    13d4:	07f7      	br      	0x13c2	// 13c2 <EXI0IntHandler+0x16>
    13d6:	0000      	bkpt
    13d8:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI1IntHandler:

000013dc <EXI1IntHandler>:
//EXT1/17 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1IntHandler(void) 
{
    13dc:	1460      	nie
    13de:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN1)==EXI_PIN1) 			//EXT1 Interrupt
    13e0:	106a      	lrw      	r3, 0x2000005c	// 1408 <EXI1IntHandler+0x2c>
    13e2:	3102      	movi      	r1, 2
    13e4:	9360      	ld.w      	r3, (r3, 0x0)
    13e6:	237f      	addi      	r3, 128
    13e8:	934c      	ld.w      	r2, (r3, 0x30)
    13ea:	6884      	and      	r2, r1
    13ec:	3a40      	cmpnei      	r2, 0
    13ee:	0c04      	bf      	0x13f6	// 13f6 <EXI1IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN1;
    13f0:	b32b      	st.w      	r1, (r3, 0x2c)
	}
	else if ((SYSCON->EXIRS&EXI_PIN17)==EXI_PIN17) 		//EXT17 Interrupt
	{
		SYSCON->EXICR = EXI_PIN17;
	}
}
    13f2:	1463      	ipop
    13f4:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN17)==EXI_PIN17) 		//EXT17 Interrupt
    13f6:	3280      	movi      	r2, 128
    13f8:	932c      	ld.w      	r1, (r3, 0x30)
    13fa:	424a      	lsli      	r2, r2, 10
    13fc:	6848      	and      	r1, r2
    13fe:	3940      	cmpnei      	r1, 0
    1400:	0ff9      	bf      	0x13f2	// 13f2 <EXI1IntHandler+0x16>
		SYSCON->EXICR = EXI_PIN17;
    1402:	b34b      	st.w      	r2, (r3, 0x2c)
}
    1404:	07f7      	br      	0x13f2	// 13f2 <EXI1IntHandler+0x16>
    1406:	0000      	bkpt
    1408:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI2to3IntHandler:

0000140c <EXI2to3IntHandler>:
//EXI2~3 18~19Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2to3IntHandler(void) 
{
    140c:	1460      	nie
    140e:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN2)==EXI_PIN2) 			//EXT2 Interrupt
    1410:	1070      	lrw      	r3, 0x2000005c	// 1450 <EXI2to3IntHandler+0x44>
    1412:	3104      	movi      	r1, 4
    1414:	9360      	ld.w      	r3, (r3, 0x0)
    1416:	237f      	addi      	r3, 128
    1418:	934c      	ld.w      	r2, (r3, 0x30)
    141a:	6884      	and      	r2, r1
    141c:	3a40      	cmpnei      	r2, 0
    141e:	0c04      	bf      	0x1426	// 1426 <EXI2to3IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN2;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 		//EXT3 Interrupt
	{
		SYSCON->EXICR = EXI_PIN3;
    1420:	b32b      	st.w      	r1, (r3, 0x2c)
	}
	else if ((SYSCON->EXIRS&EXI_PIN19)==EXI_PIN19) 		//EXT19 Interrupt
	{
		SYSCON->EXICR = EXI_PIN19;
	}
}
    1422:	1463      	ipop
    1424:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 		//EXT3 Interrupt
    1426:	934c      	ld.w      	r2, (r3, 0x30)
    1428:	3108      	movi      	r1, 8
    142a:	6884      	and      	r2, r1
    142c:	3a40      	cmpnei      	r2, 0
    142e:	0bf9      	bt      	0x1420	// 1420 <EXI2to3IntHandler+0x14>
	else if ((SYSCON->EXIRS&EXI_PIN18)==EXI_PIN18) 		//EXT18 Interrupt
    1430:	3280      	movi      	r2, 128
    1432:	932c      	ld.w      	r1, (r3, 0x30)
    1434:	424b      	lsli      	r2, r2, 11
    1436:	6848      	and      	r1, r2
    1438:	3940      	cmpnei      	r1, 0
    143a:	0c03      	bf      	0x1440	// 1440 <EXI2to3IntHandler+0x34>
		SYSCON->EXICR = EXI_PIN19;
    143c:	b34b      	st.w      	r2, (r3, 0x2c)
}
    143e:	07f2      	br      	0x1422	// 1422 <EXI2to3IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN19)==EXI_PIN19) 		//EXT19 Interrupt
    1440:	3280      	movi      	r2, 128
    1442:	932c      	ld.w      	r1, (r3, 0x30)
    1444:	424c      	lsli      	r2, r2, 12
    1446:	6848      	and      	r1, r2
    1448:	3940      	cmpnei      	r1, 0
    144a:	0bf9      	bt      	0x143c	// 143c <EXI2to3IntHandler+0x30>
    144c:	07eb      	br      	0x1422	// 1422 <EXI2to3IntHandler+0x16>
    144e:	0000      	bkpt
    1450:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI4to9IntHandler:

00001454 <EXI4to9IntHandler>:
//EXI4~9 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI4to9IntHandler(void) 
{
    1454:	1460      	nie
    1456:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN4)==EXI_PIN4) 			//EXT4 Interrupt
    1458:	1075      	lrw      	r3, 0x2000005c	// 14ac <EXI4to9IntHandler+0x58>
    145a:	3280      	movi      	r2, 128
    145c:	9360      	ld.w      	r3, (r3, 0x0)
    145e:	60c8      	addu      	r3, r2
    1460:	932c      	ld.w      	r1, (r3, 0x30)
    1462:	3010      	movi      	r0, 16
    1464:	6840      	and      	r1, r0
    1466:	3940      	cmpnei      	r1, 0
    1468:	0c04      	bf      	0x1470	// 1470 <EXI4to9IntHandler+0x1c>
	{
		SYSCON->EXICR = EXI_PIN5;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 		//EXT6 Interrupt
	{
		SYSCON->EXICR = EXI_PIN6;
    146a:	b30b      	st.w      	r0, (r3, 0x2c)
	else if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 		//EXT9 Interrupt
	{
		SYSCON->EXICR = EXI_PIN9;
	} 

}
    146c:	1463      	ipop
    146e:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN5)==EXI_PIN5) 		//EXT5 Interrupt
    1470:	932c      	ld.w      	r1, (r3, 0x30)
    1472:	3020      	movi      	r0, 32
    1474:	6840      	and      	r1, r0
    1476:	3940      	cmpnei      	r1, 0
    1478:	0bf9      	bt      	0x146a	// 146a <EXI4to9IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 		//EXT6 Interrupt
    147a:	932c      	ld.w      	r1, (r3, 0x30)
    147c:	3040      	movi      	r0, 64
    147e:	6840      	and      	r1, r0
    1480:	3940      	cmpnei      	r1, 0
    1482:	0bf4      	bt      	0x146a	// 146a <EXI4to9IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN7)==EXI_PIN7) 		//EXT7 Interrupt
    1484:	932c      	ld.w      	r1, (r3, 0x30)
    1486:	6848      	and      	r1, r2
    1488:	3940      	cmpnei      	r1, 0
    148a:	0c03      	bf      	0x1490	// 1490 <EXI4to9IntHandler+0x3c>
		SYSCON->EXICR = EXI_PIN9;
    148c:	b34b      	st.w      	r2, (r3, 0x2c)
}
    148e:	07ef      	br      	0x146c	// 146c <EXI4to9IntHandler+0x18>
	else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 		//EXT8 Interrupt
    1490:	3280      	movi      	r2, 128
    1492:	932c      	ld.w      	r1, (r3, 0x30)
    1494:	4241      	lsli      	r2, r2, 1
    1496:	6848      	and      	r1, r2
    1498:	3940      	cmpnei      	r1, 0
    149a:	0bf9      	bt      	0x148c	// 148c <EXI4to9IntHandler+0x38>
	else if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 		//EXT9 Interrupt
    149c:	3280      	movi      	r2, 128
    149e:	932c      	ld.w      	r1, (r3, 0x30)
    14a0:	4242      	lsli      	r2, r2, 2
    14a2:	6848      	and      	r1, r2
    14a4:	3940      	cmpnei      	r1, 0
    14a6:	0bf3      	bt      	0x148c	// 148c <EXI4to9IntHandler+0x38>
    14a8:	07e2      	br      	0x146c	// 146c <EXI4to9IntHandler+0x18>
    14aa:	0000      	bkpt
    14ac:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI10to15IntHandler:

000014b0 <EXI10to15IntHandler>:
//EXI4 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI10to15IntHandler(void) 
{
    14b0:	1460      	nie
    14b2:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN10)==EXI_PIN10) 			//EXT10 Interrupt
    14b4:	1076      	lrw      	r3, 0x2000005c	// 150c <EXI10to15IntHandler+0x5c>
    14b6:	3280      	movi      	r2, 128
    14b8:	9360      	ld.w      	r3, (r3, 0x0)
    14ba:	237f      	addi      	r3, 128
    14bc:	932c      	ld.w      	r1, (r3, 0x30)
    14be:	4243      	lsli      	r2, r2, 3
    14c0:	6848      	and      	r1, r2
    14c2:	3940      	cmpnei      	r1, 0
    14c4:	0c03      	bf      	0x14ca	// 14ca <EXI10to15IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN14;
	}
	else if ((SYSCON->EXIRS&EXI_PIN15)==EXI_PIN15) 		//EXT15 Interrupt
	{
		SYSCON->EXICR = EXI_PIN15;
    14c6:	b34b      	st.w      	r2, (r3, 0x2c)
	}
}
    14c8:	041f      	br      	0x1506	// 1506 <EXI10to15IntHandler+0x56>
	else if ((SYSCON->EXIRS&EXI_PIN11)==EXI_PIN11) 		//EXT11 Interrupt
    14ca:	3280      	movi      	r2, 128
    14cc:	932c      	ld.w      	r1, (r3, 0x30)
    14ce:	4244      	lsli      	r2, r2, 4
    14d0:	6848      	and      	r1, r2
    14d2:	3940      	cmpnei      	r1, 0
    14d4:	0bf9      	bt      	0x14c6	// 14c6 <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN12)==EXI_PIN12) 		//EXT12 Interrupt
    14d6:	3280      	movi      	r2, 128
    14d8:	932c      	ld.w      	r1, (r3, 0x30)
    14da:	4245      	lsli      	r2, r2, 5
    14dc:	6848      	and      	r1, r2
    14de:	3940      	cmpnei      	r1, 0
    14e0:	0bf3      	bt      	0x14c6	// 14c6 <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN13)==EXI_PIN13) 		//EXT13 Interrupt
    14e2:	3280      	movi      	r2, 128
    14e4:	932c      	ld.w      	r1, (r3, 0x30)
    14e6:	4246      	lsli      	r2, r2, 6
    14e8:	6848      	and      	r1, r2
    14ea:	3940      	cmpnei      	r1, 0
    14ec:	0bed      	bt      	0x14c6	// 14c6 <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN14)==EXI_PIN14) 		//EXT14 Interrupt
    14ee:	3280      	movi      	r2, 128
    14f0:	932c      	ld.w      	r1, (r3, 0x30)
    14f2:	4247      	lsli      	r2, r2, 7
    14f4:	6848      	and      	r1, r2
    14f6:	3940      	cmpnei      	r1, 0
    14f8:	0be7      	bt      	0x14c6	// 14c6 <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN15)==EXI_PIN15) 		//EXT15 Interrupt
    14fa:	3280      	movi      	r2, 128
    14fc:	932c      	ld.w      	r1, (r3, 0x30)
    14fe:	4248      	lsli      	r2, r2, 8
    1500:	6848      	and      	r1, r2
    1502:	3940      	cmpnei      	r1, 0
    1504:	0be1      	bt      	0x14c6	// 14c6 <EXI10to15IntHandler+0x16>
}
    1506:	1463      	ipop
    1508:	1461      	nir
    150a:	0000      	bkpt
    150c:	2000005c 	.long	0x2000005c

Disassembly of section .text.LPTIntHandler:

00001510 <LPTIntHandler>:
//LPT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void LPTIntHandler(void) 
{
    1510:	1460      	nie
    1512:	1462      	ipush
    // ISR content ...
	if((LPT->MISR&LPT_TRGEV0)==LPT_TRGEV0)			//TRGEV0 interrupt
    1514:	106b      	lrw      	r3, 0x20000014	// 1540 <LPTIntHandler+0x30>
    1516:	3101      	movi      	r1, 1
    1518:	9360      	ld.w      	r3, (r3, 0x0)
    151a:	934e      	ld.w      	r2, (r3, 0x38)
    151c:	6884      	and      	r2, r1
    151e:	3a40      	cmpnei      	r2, 0
    1520:	0c03      	bf      	0x1526	// 1526 <LPTIntHandler+0x16>
	{
		LPT->ICR = LPT_MATCH;
	}
	else if((LPT->MISR&LPT_PEND)==LPT_PEND)			//PEND interrupt
	{
		LPT->ICR = LPT_PEND;
    1522:	b330      	st.w      	r1, (r3, 0x40)
	}
}
    1524:	040b      	br      	0x153a	// 153a <LPTIntHandler+0x2a>
	else if((LPT->MISR&LPT_MATCH)==LPT_MATCH)		//MATCH interrupt
    1526:	934e      	ld.w      	r2, (r3, 0x38)
    1528:	3102      	movi      	r1, 2
    152a:	6884      	and      	r2, r1
    152c:	3a40      	cmpnei      	r2, 0
    152e:	0bfa      	bt      	0x1522	// 1522 <LPTIntHandler+0x12>
	else if((LPT->MISR&LPT_PEND)==LPT_PEND)			//PEND interrupt
    1530:	934e      	ld.w      	r2, (r3, 0x38)
    1532:	3104      	movi      	r1, 4
    1534:	6884      	and      	r2, r1
    1536:	3a40      	cmpnei      	r2, 0
    1538:	0bf5      	bt      	0x1522	// 1522 <LPTIntHandler+0x12>
}
    153a:	1463      	ipop
    153c:	1461      	nir
    153e:	0000      	bkpt
    1540:	20000014 	.long	0x20000014

Disassembly of section .text.BT0IntHandler:

00001544 <BT0IntHandler>:
//BT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0IntHandler(void) 
{
    1544:	1460      	nie
    1546:	1462      	ipush
    1548:	14d0      	push      	r15
    // ISR content ...
	if((BT0->MISR&BT_PEND)==BT_PEND)				//BT0 PEND interrupt
    154a:	1071      	lrw      	r3, 0x2000000c	// 158c <BT0IntHandler+0x48>
    154c:	3101      	movi      	r1, 1
    154e:	9360      	ld.w      	r3, (r3, 0x0)
    1550:	934c      	ld.w      	r2, (r3, 0x30)
    1552:	6884      	and      	r2, r1
    1554:	3a40      	cmpnei      	r2, 0
    1556:	0c09      	bf      	0x1568	// 1568 <BT0IntHandler+0x24>
	{
		BT0->ICR = BT_PEND;
    1558:	b32d      	st.w      	r1, (r3, 0x34)
		//if(xTaskGetSchedulerState()!=taskSCHEDULER_NOT_STARTED)//系统已经运行 
		{ 
			xPortSysTickHandler();
    155a:	e00006af 	bsr      	0x22b8	// 22b8 <xPortSysTickHandler>
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)			//BT0 Event trigger interrupt
	{
		BT0->ICR = BT_EVTRG;
	} 
}
    155e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    1562:	1401      	addi      	r14, r14, 4
    1564:	1463      	ipop
    1566:	1461      	nir
	else if((BT0->MISR&BT_CMP)==BT_CMP)				//BT0 CMP Match interrupt 
    1568:	934c      	ld.w      	r2, (r3, 0x30)
    156a:	3102      	movi      	r1, 2
    156c:	6884      	and      	r2, r1
    156e:	3a40      	cmpnei      	r2, 0
    1570:	0c03      	bf      	0x1576	// 1576 <BT0IntHandler+0x32>
		BT0->ICR = BT_EVTRG;
    1572:	b32d      	st.w      	r1, (r3, 0x34)
}
    1574:	07f5      	br      	0x155e	// 155e <BT0IntHandler+0x1a>
	else if((BT0->MISR&BT_OVF)==BT_OVF)				//BT0 OVF interrupt
    1576:	934c      	ld.w      	r2, (r3, 0x30)
    1578:	3104      	movi      	r1, 4
    157a:	6884      	and      	r2, r1
    157c:	3a40      	cmpnei      	r2, 0
    157e:	0bfa      	bt      	0x1572	// 1572 <BT0IntHandler+0x2e>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)			//BT0 Event trigger interrupt
    1580:	934c      	ld.w      	r2, (r3, 0x30)
    1582:	3108      	movi      	r1, 8
    1584:	6884      	and      	r2, r1
    1586:	3a40      	cmpnei      	r2, 0
    1588:	0bf5      	bt      	0x1572	// 1572 <BT0IntHandler+0x2e>
    158a:	07ea      	br      	0x155e	// 155e <BT0IntHandler+0x1a>
    158c:	2000000c 	.long	0x2000000c

Disassembly of section .text.BT1IntHandler:

00001590 <BT1IntHandler>:
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1IntHandler(void) 
{
    1590:	1460      	nie
    1592:	1462      	ipush
    // ISR content ...
	if((BT1->MISR&BT_PEND)==BT_PEND)				//BT1 PEND interrupt
    1594:	106f      	lrw      	r3, 0x20000008	// 15d0 <BT1IntHandler+0x40>
    1596:	3101      	movi      	r1, 1
    1598:	9360      	ld.w      	r3, (r3, 0x0)
    159a:	934c      	ld.w      	r2, (r3, 0x30)
    159c:	6884      	and      	r2, r1
    159e:	3a40      	cmpnei      	r2, 0
    15a0:	0c03      	bf      	0x15a6	// 15a6 <BT1IntHandler+0x16>
	{
		BT1->ICR = BT_OVF;
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)			//BT1 Event trigger interrupt
	{
		BT1->ICR = BT_EVTRG;
    15a2:	b32d      	st.w      	r1, (r3, 0x34)
	} 
}
    15a4:	0409      	br      	0x15b6	// 15b6 <BT1IntHandler+0x26>
	else if((BT0->MISR&BT_CMP)==BT_CMP)				//BT1 CMP Match interrupt 
    15a6:	104c      	lrw      	r2, 0x2000000c	// 15d4 <BT1IntHandler+0x44>
    15a8:	3002      	movi      	r0, 2
    15aa:	9240      	ld.w      	r2, (r2, 0x0)
    15ac:	922c      	ld.w      	r1, (r2, 0x30)
    15ae:	6840      	and      	r1, r0
    15b0:	3940      	cmpnei      	r1, 0
    15b2:	0c04      	bf      	0x15ba	// 15ba <BT1IntHandler+0x2a>
		BT1->ICR = BT_OVF;
    15b4:	b30d      	st.w      	r0, (r3, 0x34)
}
    15b6:	1463      	ipop
    15b8:	1461      	nir
	else if((BT0->MISR&BT_OVF)==BT_OVF)				//BT1 OVF interrupt
    15ba:	922c      	ld.w      	r1, (r2, 0x30)
    15bc:	3004      	movi      	r0, 4
    15be:	6840      	and      	r1, r0
    15c0:	3940      	cmpnei      	r1, 0
    15c2:	0bf9      	bt      	0x15b4	// 15b4 <BT1IntHandler+0x24>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)			//BT1 Event trigger interrupt
    15c4:	924c      	ld.w      	r2, (r2, 0x30)
    15c6:	3108      	movi      	r1, 8
    15c8:	6884      	and      	r2, r1
    15ca:	3a40      	cmpnei      	r2, 0
    15cc:	0beb      	bt      	0x15a2	// 15a2 <BT1IntHandler+0x12>
    15ce:	07f4      	br      	0x15b6	// 15b6 <BT1IntHandler+0x26>
    15d0:	20000008 	.long	0x20000008
    15d4:	2000000c 	.long	0x2000000c

Disassembly of section .text.PriviledgeVioHandler:

000015d8 <PriviledgeVioHandler>:
    15d8:	783c      	jmp      	r15

Disassembly of section .text.PendTrapHandler:

000015da <PendTrapHandler>:
    // ISR content ...

}

void PendTrapHandler(void) 
{
    15da:	1460      	nie
    15dc:	1462      	ipush
    // ISR content ...

}
    15de:	1463      	ipop
    15e0:	1461      	nir

Disassembly of section .text.Trap3Handler:

000015e2 <Trap3Handler>:
    15e2:	1460      	nie
    15e4:	1462      	ipush
    15e6:	1463      	ipop
    15e8:	1461      	nir

Disassembly of section .text.Trap2Handler:

000015ea <Trap2Handler>:
    15ea:	1460      	nie
    15ec:	1462      	ipush
    15ee:	1463      	ipop
    15f0:	1461      	nir

Disassembly of section .text.Trap1Handler:

000015f2 <Trap1Handler>:
    15f2:	1460      	nie
    15f4:	1462      	ipush
    15f6:	1463      	ipop
    15f8:	1461      	nir

Disassembly of section .text.Trap0Handler:

000015fa <Trap0Handler>:
    15fa:	1460      	nie
    15fc:	1462      	ipush
    15fe:	1463      	ipop
    1600:	1461      	nir

Disassembly of section .text.UnrecExecpHandler:

00001602 <UnrecExecpHandler>:
    1602:	1460      	nie
    1604:	1462      	ipush
    1606:	1463      	ipop
    1608:	1461      	nir

Disassembly of section .text.BreakPointHandler:

0000160a <BreakPointHandler>:
    160a:	1460      	nie
    160c:	1462      	ipush
    160e:	1463      	ipop
    1610:	1461      	nir

Disassembly of section .text.AccessErrHandler:

00001612 <AccessErrHandler>:
    1612:	1460      	nie
    1614:	1462      	ipush
    1616:	1463      	ipop
    1618:	1461      	nir

Disassembly of section .text.IllegalInstrHandler:

0000161a <IllegalInstrHandler>:
    161a:	1460      	nie
    161c:	1462      	ipush
    161e:	1463      	ipop
    1620:	1461      	nir

Disassembly of section .text.MisalignedHandler:

00001622 <MisalignedHandler>:
    1622:	1460      	nie
    1624:	1462      	ipush
    1626:	1463      	ipop
    1628:	1461      	nir

Disassembly of section .text.CNTAIntHandler:

0000162a <CNTAIntHandler>:
    162a:	1460      	nie
    162c:	1462      	ipush
    162e:	1463      	ipop
    1630:	1461      	nir

Disassembly of section .text.I2CIntHandler:

00001632 <I2CIntHandler>:
    1632:	1460      	nie
    1634:	1462      	ipush
    1636:	1463      	ipop
    1638:	1461      	nir

Disassembly of section .text.TKEYIntHandler:

0000163a <TKEYIntHandler>:
    163a:	1460      	nie
    163c:	1462      	ipush
    163e:	1463      	ipop
    1640:	1461      	nir

Disassembly of section .text.CORETHandler:

00001642 <CORETHandler>:
    1642:	1460      	nie
    1644:	1462      	ipush
    1646:	1463      	ipop
    1648:	1461      	nir

Disassembly of section .text.Task1:

0000164c <Task1>:

/***************************************************/
//main
/**************************************************/
void Task1()
{
    164c:	14d1      	push      	r4, r15
	while(1)
	{
		printf("Task1 is running!!!\r\n");
    164e:	1085      	lrw      	r4, 0x25a8	// 1660 <Task1+0x14>
    1650:	6c13      	mov      	r0, r4
    1652:	e3fff625 	bsr      	0x29c	// 29c <__GI_puts>
		vTaskDelay(10000);
    1656:	1004      	lrw      	r0, 0x2710	// 1664 <Task1+0x18>
    1658:	e000044a 	bsr      	0x1eec	// 1eec <vTaskDelay>
    165c:	07fa      	br      	0x1650	// 1650 <Task1+0x4>
    165e:	0000      	bkpt
    1660:	000025a8 	.long	0x000025a8
    1664:	00002710 	.long	0x00002710

Disassembly of section .text.Task2:

00001668 <Task2>:
	}
}


void Task2()
{
    1668:	14d1      	push      	r4, r15
	while(1)
	{
		printf("Task2 is running!!!\r\n");
    166a:	1085      	lrw      	r4, 0x25bd	// 167c <Task2+0x14>
    166c:	6c13      	mov      	r0, r4
    166e:	e3fff617 	bsr      	0x29c	// 29c <__GI_puts>
		//GPIO_Reverse(GPIOA0,4);
		vTaskDelay(10000);
    1672:	1004      	lrw      	r0, 0x2710	// 1680 <Task2+0x18>
    1674:	e000043c 	bsr      	0x1eec	// 1eec <vTaskDelay>
    1678:	07fa      	br      	0x166c	// 166c <Task2+0x4>
    167a:	0000      	bkpt
    167c:	000025bd 	.long	0x000025bd
    1680:	00002710 	.long	0x00002710

Disassembly of section .text.StartTask:

00001684 <StartTask>:
	}
}

void StartTask()
{
    1684:	14d0      	push      	r15
    1686:	1422      	subi      	r14, r14, 8
	printf("StartTask is running!!!\r\n");
    1688:	1019      	lrw      	r0, 0x25d2	// 16ec <StartTask+0x68>
    168a:	e3fff609 	bsr      	0x29c	// 29c <__GI_puts>
	
	taskENTER_CRITICAL();
    168e:	e00005f1 	bsr      	0x2270	// 2270 <vPortEnterCritical>
	
	if(pdPASS != xTaskCreate((TaskFunction_t )Task1, 
    1692:	1078      	lrw      	r3, 0x20000e34	// 16f0 <StartTask+0x6c>
    1694:	3240      	movi      	r2, 64
    1696:	b861      	st.w      	r3, (r14, 0x4)
    1698:	3302      	movi      	r3, 2
    169a:	b860      	st.w      	r3, (r14, 0x0)
    169c:	3300      	movi      	r3, 0
    169e:	1036      	lrw      	r1, 0x25eb	// 16f4 <StartTask+0x70>
    16a0:	1016      	lrw      	r0, 0x164c	// 16f8 <StartTask+0x74>
    16a2:	e0000169 	bsr      	0x1974	// 1974 <xTaskCreate>
    16a6:	3841      	cmpnei      	r0, 1
    16a8:	0c1e      	bf      	0x16e4	// 16e4 <StartTask+0x60>
							 (uint16_t       )TASK1_STK_SIZE,  
							 (void*          )NULL,  
							 (UBaseType_t    )TASK1_PRIORITY, 
							 (TaskHandle_t*  )&TASK1_HANDLE))
	{
		printf("Task1 create fail!!!\r\n");
    16aa:	1015      	lrw      	r0, 0x25f1	// 16fc <StartTask+0x78>
	}
	else 
	{
		printf("Task1 create sucess!!!\r\n");
    16ac:	e3fff5f8 	bsr      	0x29c	// 29c <__GI_puts>
	}
	
	 
	if(pdPASS != xTaskCreate((TaskFunction_t )Task2, 
    16b0:	1074      	lrw      	r3, 0x20000e30	// 1700 <StartTask+0x7c>
    16b2:	3240      	movi      	r2, 64
    16b4:	b861      	st.w      	r3, (r14, 0x4)
    16b6:	3303      	movi      	r3, 3
    16b8:	b860      	st.w      	r3, (r14, 0x0)
    16ba:	3300      	movi      	r3, 0
    16bc:	1032      	lrw      	r1, 0x261f	// 1704 <StartTask+0x80>
    16be:	1013      	lrw      	r0, 0x1668	// 1708 <StartTask+0x84>
    16c0:	e000015a 	bsr      	0x1974	// 1974 <xTaskCreate>
    16c4:	3841      	cmpnei      	r0, 1
    16c6:	0c11      	bf      	0x16e8	// 16e8 <StartTask+0x64>
							 (uint16_t       )TASK2_STK_SIZE,
							 (void*          )NULL,
							 (UBaseType_t    )TASK2_PRIORITY,
							 (TaskHandle_t*  )&TASK2_HANDLE))
	{
		printf("task2 create fail!!!\r\n");
    16c8:	1011      	lrw      	r0, 0x2625	// 170c <StartTask+0x88>
	}
	else 
	{
		printf("Task2 create sucess!!!\r\n");
    16ca:	e3fff5e9 	bsr      	0x29c	// 29c <__GI_puts>
	}
	
	printf("StartTask is deleted !!!\r\n");
    16ce:	1011      	lrw      	r0, 0x2653	// 1710 <StartTask+0x8c>
    16d0:	e3fff5e6 	bsr      	0x29c	// 29c <__GI_puts>
	vTaskDelete(STARTTASK_HANDLE);
    16d4:	1070      	lrw      	r3, 0x20000e2c	// 1714 <StartTask+0x90>
    16d6:	9300      	ld.w      	r0, (r3, 0x0)
    16d8:	e0000230 	bsr      	0x1b38	// 1b38 <vTaskDelete>
	
	taskEXIT_CRITICAL();
    16dc:	e00005d4 	bsr      	0x2284	// 2284 <vPortExitCritical>
}
    16e0:	1402      	addi      	r14, r14, 8
    16e2:	1490      	pop      	r15
		printf("Task1 create sucess!!!\r\n");
    16e4:	100d      	lrw      	r0, 0x2607	// 1718 <StartTask+0x94>
    16e6:	07e3      	br      	0x16ac	// 16ac <StartTask+0x28>
		printf("Task2 create sucess!!!\r\n");
    16e8:	100d      	lrw      	r0, 0x263b	// 171c <StartTask+0x98>
    16ea:	07f0      	br      	0x16ca	// 16ca <StartTask+0x46>
    16ec:	000025d2 	.long	0x000025d2
    16f0:	20000e34 	.long	0x20000e34
    16f4:	000025eb 	.long	0x000025eb
    16f8:	0000164c 	.long	0x0000164c
    16fc:	000025f1 	.long	0x000025f1
    1700:	20000e30 	.long	0x20000e30
    1704:	0000261f 	.long	0x0000261f
    1708:	00001668 	.long	0x00001668
    170c:	00002625 	.long	0x00002625
    1710:	00002653 	.long	0x00002653
    1714:	20000e2c 	.long	0x20000e2c
    1718:	00002607 	.long	0x00002607
    171c:	0000263b 	.long	0x0000263b

Disassembly of section .text.fputc:

00001720 <fputc>:
{
    1720:	14d2      	push      	r4-r5, r15
    if (ch == '\n') {
    1722:	384a      	cmpnei      	r0, 10
{
    1724:	6d03      	mov      	r4, r0
    1726:	10a7      	lrw      	r5, 0x2000003c	// 1740 <fputc+0x20>
    if (ch == '\n') {
    1728:	0805      	bt      	0x1732	// 1732 <fputc+0x12>
        UARTTxByte(UART1,'\r');
    172a:	310d      	movi      	r1, 13
    172c:	9500      	ld.w      	r0, (r5, 0x0)
    172e:	e3fffa24 	bsr      	0xb76	// b76 <UARTTxByte>
    UARTTxByte(UART1, ch);
    1732:	9500      	ld.w      	r0, (r5, 0x0)
    1734:	7450      	zextb      	r1, r4
    1736:	e3fffa20 	bsr      	0xb76	// b76 <UARTTxByte>
}
    173a:	3000      	movi      	r0, 0
    173c:	1492      	pop      	r4-r5, r15
    173e:	0000      	bkpt
    1740:	2000003c 	.long	0x2000003c

Disassembly of section .text.startup.main:

00001744 <main>:

/***************************************************/
//main
/**************************************************/
int main(void) 
{
    1744:	14d0      	push      	r15
    1746:	1422      	subi      	r14, r14, 8
	APT32F102_init();
    1748:	e3fffabc 	bsr      	0xcc0	// cc0 <APT32F102_init>
	
	printf("--->This is APT32F1023 FreeRTOS demo\r\n");
    174c:	100d      	lrw      	r0, 0x266d	// 1780 <main+0x3c>
    174e:	e3fff5a7 	bsr      	0x29c	// 29c <__GI_puts>

	if(pdPASS != xTaskCreate((TaskFunction_t)StartTask, 
    1752:	106d      	lrw      	r3, 0x20000e2c	// 1784 <main+0x40>
    1754:	3280      	movi      	r2, 128
    1756:	b861      	st.w      	r3, (r14, 0x4)
    1758:	3301      	movi      	r3, 1
    175a:	b860      	st.w      	r3, (r14, 0x0)
    175c:	4241      	lsli      	r2, r2, 1
    175e:	3300      	movi      	r3, 0
    1760:	102a      	lrw      	r1, 0x2693	// 1788 <main+0x44>
    1762:	100b      	lrw      	r0, 0x1684	// 178c <main+0x48>
    1764:	e0000108 	bsr      	0x1974	// 1974 <xTaskCreate>
    1768:	3841      	cmpnei      	r0, 1
    176a:	0c09      	bf      	0x177c	// 177c <main+0x38>
							(uint16_t       )STARTTASK_STK_SIZE,  
							(void*          )NULL,  
							(UBaseType_t    )STARTTASK_PRIORITY, 
							(TaskHandle_t*  )&STARTTASK_HANDLE))
	{
		printf("StartTask create fail!!!\r\n");
    176c:	1009      	lrw      	r0, 0x269d	// 1790 <main+0x4c>
	}
	else 
	{
		printf("StartTask create sucess!!!\r\n");
    176e:	e3fff597 	bsr      	0x29c	// 29c <__GI_puts>
	}
	
	vTaskStartScheduler();  
    1772:	e0000241 	bsr      	0x1bf4	// 1bf4 <vTaskStartScheduler>
	
    while(1)
	{
		SYSCON_IWDCNT_Reload(); 
    1776:	e3fff833 	bsr      	0x7dc	// 7dc <SYSCON_IWDCNT_Reload>
    177a:	07fe      	br      	0x1776	// 1776 <main+0x32>
		printf("StartTask create sucess!!!\r\n");
    177c:	1006      	lrw      	r0, 0x26b7	// 1794 <main+0x50>
    177e:	07f8      	br      	0x176e	// 176e <main+0x2a>
    1780:	0000266d 	.long	0x0000266d
    1784:	20000e2c 	.long	0x20000e2c
    1788:	00002693 	.long	0x00002693
    178c:	00001684 	.long	0x00001684
    1790:	0000269d 	.long	0x0000269d
    1794:	000026b7 	.long	0x000026b7

Disassembly of section .text.__udivsi3:

00001798 <__udivsi3>:
					);
					
	return HWD->QUOTIENT;
}
 unsigned int __udivsi3 ( unsigned int a,  unsigned int b)
{   
    1798:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    179a:	c0006023 	mfcr      	r3, cr<0, 0>
    179e:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    17a2:	1046      	lrw      	r2, 0x20000000	// 17b8 <__udivsi3+0x20>
    17a4:	3401      	movi      	r4, 1
    17a6:	9240      	ld.w      	r2, (r2, 0x0)
    17a8:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    17aa:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    17ac:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    17ae:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    17b0:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);

	return HWD->QUOTIENT;
    17b4:	9202      	ld.w      	r0, (r2, 0x8)
}
    17b6:	1481      	pop      	r4
    17b8:	20000000 	.long	0x20000000

Disassembly of section .text.__umodsi3:

000017bc <__umodsi3>:
					);	
	return HWD->REMAIN;
}

unsigned int __umodsi3 ( unsigned int a,  unsigned int b)
{   
    17bc:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    17be:	c0006023 	mfcr      	r3, cr<0, 0>
    17c2:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    17c6:	1046      	lrw      	r2, 0x20000000	// 17dc <__umodsi3+0x20>
    17c8:	3401      	movi      	r4, 1
    17ca:	9240      	ld.w      	r2, (r2, 0x0)
    17cc:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    17ce:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    17d0:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    17d2:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    17d4:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);	
	return HWD->REMAIN;
    17d8:	9203      	ld.w      	r0, (r2, 0xc)
}
    17da:	1481      	pop      	r4
    17dc:	20000000 	.long	0x20000000

Disassembly of section .text.CK_CPU_EnAllNormalIrq:

000017e0 <CK_CPU_EnAllNormalIrq>:
}


void CK_CPU_EnAllNormalIrq(void)
{
  asm  ("psrset ee,ie");
    17e0:	c1807420 	psrset      	ee, ie
}
    17e4:	783c      	jmp      	r15

Disassembly of section .text.vListInitialise:

000017e6 <vListInitialise>:
void vListInitialise( List_t * const pxList )
{
    /* The list structure contains a list item which is used to mark the
     * end of the list.  To initialise the list the list end is inserted
     * as the only list entry. */
    pxList->pxIndex = ( ListItem_t * ) &( pxList->xListEnd ); /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    17e6:	587e      	addi      	r3, r0, 8

    listSET_FIRST_LIST_ITEM_INTEGRITY_CHECK_VALUE( &( pxList->xListEnd ) );

    /* The list end value is the highest possible value in the list to
     * ensure it remains at the end of the list. */
    pxList->xListEnd.xItemValue = portMAX_DELAY;
    17e8:	3200      	movi      	r2, 0
    pxList->pxIndex = ( ListItem_t * ) &( pxList->xListEnd ); /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    17ea:	b061      	st.w      	r3, (r0, 0x4)
    pxList->xListEnd.xItemValue = portMAX_DELAY;
    17ec:	2a00      	subi      	r2, 1

    /* The list end next and previous pointers point to itself so we know
     * when the list is empty. */
    pxList->xListEnd.pxNext = ( ListItem_t * ) &( pxList->xListEnd );     /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    17ee:	b063      	st.w      	r3, (r0, 0xc)
    pxList->xListEnd.pxPrevious = ( ListItem_t * ) &( pxList->xListEnd ); /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    17f0:	b064      	st.w      	r3, (r0, 0x10)
        pxList->xListEnd.pxContainer = NULL;
        listSET_SECOND_LIST_ITEM_INTEGRITY_CHECK_VALUE( &( pxList->xListEnd ) );
    }
    #endif

    pxList->uxNumberOfItems = ( UBaseType_t ) 0U;
    17f2:	3300      	movi      	r3, 0
    pxList->xListEnd.xItemValue = portMAX_DELAY;
    17f4:	b042      	st.w      	r2, (r0, 0x8)
    pxList->uxNumberOfItems = ( UBaseType_t ) 0U;
    17f6:	b060      	st.w      	r3, (r0, 0x0)

    /* Write known values into the list if
     * configUSE_LIST_DATA_INTEGRITY_CHECK_BYTES is set to 1. */
    listSET_LIST_INTEGRITY_CHECK_1_VALUE( pxList );
    listSET_LIST_INTEGRITY_CHECK_2_VALUE( pxList );
}
    17f8:	783c      	jmp      	r15

Disassembly of section .text.vListInitialiseItem:

000017fa <vListInitialiseItem>:
/*-----------------------------------------------------------*/

void vListInitialiseItem( ListItem_t * const pxItem )
{
    /* Make sure the list item is not recorded as being on a list. */
    pxItem->pxContainer = NULL;
    17fa:	3300      	movi      	r3, 0
    17fc:	b064      	st.w      	r3, (r0, 0x10)

    /* Write known values into the list item if
     * configUSE_LIST_DATA_INTEGRITY_CHECK_BYTES is set to 1. */
    listSET_FIRST_LIST_ITEM_INTEGRITY_CHECK_VALUE( pxItem );
    listSET_SECOND_LIST_ITEM_INTEGRITY_CHECK_VALUE( pxItem );
}
    17fe:	783c      	jmp      	r15

Disassembly of section .text.vListInsertEnd:

00001800 <vListInsertEnd>:
/*-----------------------------------------------------------*/

void vListInsertEnd( List_t * const pxList,
                     ListItem_t * const pxNewListItem )
{
    ListItem_t * const pxIndex = pxList->pxIndex;
    1800:	9061      	ld.w      	r3, (r0, 0x4)

    /* Insert a new list item into pxList, but rather than sort the list,
     * makes the new list item the last item to be removed by a call to
     * listGET_OWNER_OF_NEXT_ENTRY(). */
    pxNewListItem->pxNext = pxIndex;
    pxNewListItem->pxPrevious = pxIndex->pxPrevious;
    1802:	9342      	ld.w      	r2, (r3, 0x8)
    1804:	b142      	st.w      	r2, (r1, 0x8)

    /* Only used during decision coverage testing. */
    mtCOVERAGE_TEST_DELAY();

    pxIndex->pxPrevious->pxNext = pxNewListItem;
    1806:	9342      	ld.w      	r2, (r3, 0x8)
    pxNewListItem->pxNext = pxIndex;
    1808:	b161      	st.w      	r3, (r1, 0x4)
    pxIndex->pxPrevious->pxNext = pxNewListItem;
    180a:	b221      	st.w      	r1, (r2, 0x4)
    pxIndex->pxPrevious = pxNewListItem;
    180c:	b322      	st.w      	r1, (r3, 0x8)

    /* Remember which list the item is in. */
    pxNewListItem->pxContainer = pxList;

    ( pxList->uxNumberOfItems )++;
    180e:	9060      	ld.w      	r3, (r0, 0x0)
    1810:	2300      	addi      	r3, 1
    pxNewListItem->pxContainer = pxList;
    1812:	b104      	st.w      	r0, (r1, 0x10)
    ( pxList->uxNumberOfItems )++;
    1814:	b060      	st.w      	r3, (r0, 0x0)
}
    1816:	783c      	jmp      	r15

Disassembly of section .text.vListInsert:

00001818 <vListInsert>:
/*-----------------------------------------------------------*/

void vListInsert( List_t * const pxList,
                  ListItem_t * const pxNewListItem )
{
    1818:	14c2      	push      	r4-r5
     * new list item should be placed after it.  This ensures that TCBs which are
     * stored in ready lists (all of which have the same xItemValue value) get a
     * share of the CPU.  However, if the xItemValue is the same as the back marker
     * the iteration loop below will not end.  Therefore the value is checked
     * first, and the algorithm slightly modified if necessary. */
    if( xValueOfInsertion == portMAX_DELAY )
    181a:	3300      	movi      	r3, 0
    const TickType_t xValueOfInsertion = pxNewListItem->xItemValue;
    181c:	9140      	ld.w      	r2, (r1, 0x0)
    if( xValueOfInsertion == portMAX_DELAY )
    181e:	2b00      	subi      	r3, 1
    1820:	64ca      	cmpne      	r2, r3
    1822:	080c      	bt      	0x183a	// 183a <vListInsert+0x22>
    {
        pxIterator = pxList->xListEnd.pxPrevious;
    1824:	9064      	ld.w      	r3, (r0, 0x10)
            /* There is nothing to do here, just iterating to the wanted
             * insertion position. */
        }
    }

    pxNewListItem->pxNext = pxIterator->pxNext;
    1826:	9341      	ld.w      	r2, (r3, 0x4)
    1828:	b141      	st.w      	r2, (r1, 0x4)
    pxNewListItem->pxNext->pxPrevious = pxNewListItem;
    182a:	b222      	st.w      	r1, (r2, 0x8)
    pxNewListItem->pxPrevious = pxIterator;
    182c:	b162      	st.w      	r3, (r1, 0x8)
    pxIterator->pxNext = pxNewListItem;
    182e:	b321      	st.w      	r1, (r3, 0x4)

    /* Remember which list the item is in.  This allows fast removal of the
     * item later. */
    pxNewListItem->pxContainer = pxList;

    ( pxList->uxNumberOfItems )++;
    1830:	9060      	ld.w      	r3, (r0, 0x0)
    1832:	2300      	addi      	r3, 1
    pxNewListItem->pxContainer = pxList;
    1834:	b104      	st.w      	r0, (r1, 0x10)
    ( pxList->uxNumberOfItems )++;
    1836:	b060      	st.w      	r3, (r0, 0x0)
}
    1838:	1482      	pop      	r4-r5
        for( pxIterator = ( ListItem_t * ) &( pxList->xListEnd ); pxIterator->pxNext->xItemValue <= xValueOfInsertion; pxIterator = pxIterator->pxNext ) /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. *//*lint !e440 The iterator moves to a different value, not xValueOfInsertion. */
    183a:	587e      	addi      	r3, r0, 8
    183c:	9381      	ld.w      	r4, (r3, 0x4)
    183e:	94a0      	ld.w      	r5, (r4, 0x0)
    1840:	6548      	cmphs      	r2, r5
    1842:	0ff2      	bf      	0x1826	// 1826 <vListInsert+0xe>
    1844:	6cd3      	mov      	r3, r4
    1846:	07fb      	br      	0x183c	// 183c <vListInsert+0x24>

Disassembly of section .text.uxListRemove:

00001848 <uxListRemove>:
{
/* The list item knows which list it is in.  Obtain the list from the list
 * item. */
    List_t * const pxList = pxItemToRemove->pxContainer;

    pxItemToRemove->pxNext->pxPrevious = pxItemToRemove->pxPrevious;
    1848:	9021      	ld.w      	r1, (r0, 0x4)
    184a:	9042      	ld.w      	r2, (r0, 0x8)
    List_t * const pxList = pxItemToRemove->pxContainer;
    184c:	9064      	ld.w      	r3, (r0, 0x10)
    pxItemToRemove->pxNext->pxPrevious = pxItemToRemove->pxPrevious;
    184e:	b142      	st.w      	r2, (r1, 0x8)
    pxItemToRemove->pxPrevious->pxNext = pxItemToRemove->pxNext;
    1850:	9042      	ld.w      	r2, (r0, 0x8)
    1852:	b221      	st.w      	r1, (r2, 0x4)

    /* Only used during decision coverage testing. */
    mtCOVERAGE_TEST_DELAY();

    /* Make sure the index is left pointing to a valid item. */
    if( pxList->pxIndex == pxItemToRemove )
    1854:	9321      	ld.w      	r1, (r3, 0x4)
    1856:	6442      	cmpne      	r0, r1
    1858:	0802      	bt      	0x185c	// 185c <uxListRemove+0x14>
    {
        pxList->pxIndex = pxItemToRemove->pxPrevious;
    185a:	b341      	st.w      	r2, (r3, 0x4)
    else
    {
        mtCOVERAGE_TEST_MARKER();
    }

    pxItemToRemove->pxContainer = NULL;
    185c:	3200      	movi      	r2, 0
    185e:	b044      	st.w      	r2, (r0, 0x10)
    ( pxList->uxNumberOfItems )--;
    1860:	9340      	ld.w      	r2, (r3, 0x0)
    1862:	2a00      	subi      	r2, 1
    1864:	b340      	st.w      	r2, (r3, 0x0)

    return pxList->uxNumberOfItems;
    1866:	9300      	ld.w      	r0, (r3, 0x0)
}
    1868:	783c      	jmp      	r15

Disassembly of section .text.prvResetNextTaskUnblockTime:

0000186c <prvResetNextTaskUnblockTime>:
#endif /* INCLUDE_vTaskDelete */
/*-----------------------------------------------------------*/

static void prvResetNextTaskUnblockTime( void )
{
    if( listLIST_IS_EMPTY( pxDelayedTaskList ) != pdFALSE )
    186c:	1066      	lrw      	r3, 0x200000d0	// 1884 <prvResetNextTaskUnblockTime+0x18>
    186e:	9340      	ld.w      	r2, (r3, 0x0)
    1870:	9240      	ld.w      	r2, (r2, 0x0)
    1872:	3a40      	cmpnei      	r2, 0
    1874:	0804      	bt      	0x187c	// 187c <prvResetNextTaskUnblockTime+0x10>
    {
        /* The new current delayed list is empty.  Set xNextTaskUnblockTime to
         * the maximum possible value so it is  extremely unlikely that the
         * if( xTickCount >= xNextTaskUnblockTime ) test will pass until
         * there is an item in the delayed list. */
        xNextTaskUnblockTime = portMAX_DELAY;
    1876:	2a00      	subi      	r2, 1
    {
        /* The new current delayed list is not empty, get the value of
         * the item at the head of the delayed list.  This is the time at
         * which the task at the head of the delayed list should be removed
         * from the Blocked state. */
        xNextTaskUnblockTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxDelayedTaskList );
    1878:	b341      	st.w      	r2, (r3, 0x4)
    }
}
    187a:	783c      	jmp      	r15
        xNextTaskUnblockTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxDelayedTaskList );
    187c:	9340      	ld.w      	r2, (r3, 0x0)
    187e:	9243      	ld.w      	r2, (r2, 0xc)
    1880:	9240      	ld.w      	r2, (r2, 0x0)
    1882:	07fb      	br      	0x1878	// 1878 <prvResetNextTaskUnblockTime+0xc>
    1884:	200000d0 	.long	0x200000d0

Disassembly of section .text.prvAddCurrentTaskToDelayedList:

00001888 <prvAddCurrentTaskToDelayedList>:
#endif /* if ( ( configGENERATE_RUN_TIME_STATS == 1 ) && ( INCLUDE_xTaskGetIdleTaskHandle == 1 ) ) */
/*-----------------------------------------------------------*/

static void prvAddCurrentTaskToDelayedList( TickType_t xTicksToWait,
                                            const BaseType_t xCanBlockIndefinitely )
{
    1888:	14d4      	push      	r4-r7, r15
    188a:	1421      	subi      	r14, r14, 4
    TickType_t xTimeToWake;
    const TickType_t xConstTickCount = xTickCount;
    188c:	109e      	lrw      	r4, 0x200000d0	// 1904 <prvAddCurrentTaskToDelayedList+0x7c>
{
    188e:	6d83      	mov      	r6, r0
    const TickType_t xConstTickCount = xTickCount;
    1890:	94e2      	ld.w      	r7, (r4, 0x8)
    }
    #endif

    /* Remove the task from the ready list before adding it to the blocked list
     * as the same list item is used for both lists. */
    if( uxListRemove( &( pxCurrentTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
    1892:	9403      	ld.w      	r0, (r4, 0xc)
    1894:	2003      	addi      	r0, 4
{
    1896:	b820      	st.w      	r1, (r14, 0x0)
    if( uxListRemove( &( pxCurrentTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
    1898:	e3ffffd8 	bsr      	0x1848	// 1848 <uxListRemove>
        mtCOVERAGE_TEST_MARKER();
    }

    #if ( INCLUDE_vTaskSuspend == 1 )
    {
        if( ( xTicksToWait == portMAX_DELAY ) && ( xCanBlockIndefinitely != pdFALSE ) )
    189c:	3300      	movi      	r3, 0
    189e:	2b00      	subi      	r3, 1
    18a0:	64da      	cmpne      	r6, r3
    18a2:	6d53      	mov      	r5, r4
    18a4:	9820      	ld.w      	r1, (r14, 0x0)
    18a6:	0819      	bt      	0x18d8	// 18d8 <prvAddCurrentTaskToDelayedList+0x50>
    18a8:	3940      	cmpnei      	r1, 0
    18aa:	0c17      	bf      	0x18d8	// 18d8 <prvAddCurrentTaskToDelayedList+0x50>
        {
            /* Add the task to the suspended task list instead of a delayed task
             * list to ensure it is not woken by a timing event.  It will block
             * indefinitely. */
            listINSERT_END( &xSuspendedTaskList, &( pxCurrentTCB->xStateListItem ) );
    18ac:	3310      	movi      	r3, 16
    18ae:	60d0      	addu      	r3, r4
    18b0:	9423      	ld.w      	r1, (r4, 0xc)
    18b2:	9341      	ld.w      	r2, (r3, 0x4)
    18b4:	b142      	st.w      	r2, (r1, 0x8)
    18b6:	9202      	ld.w      	r0, (r2, 0x8)
    18b8:	9423      	ld.w      	r1, (r4, 0xc)
    18ba:	b103      	st.w      	r0, (r1, 0xc)
    18bc:	9423      	ld.w      	r1, (r4, 0xc)
    18be:	9202      	ld.w      	r0, (r2, 0x8)
    18c0:	2103      	addi      	r1, 4
    18c2:	b021      	st.w      	r1, (r0, 0x4)
    18c4:	9423      	ld.w      	r1, (r4, 0xc)
    18c6:	2103      	addi      	r1, 4
    18c8:	b222      	st.w      	r1, (r2, 0x8)
    18ca:	9443      	ld.w      	r2, (r4, 0xc)
    18cc:	b265      	st.w      	r3, (r2, 0x14)
    18ce:	9340      	ld.w      	r2, (r3, 0x0)
    18d0:	2200      	addi      	r2, 1
    18d2:	b340      	st.w      	r2, (r3, 0x0)

        /* Avoid compiler warning when INCLUDE_vTaskSuspend is not 1. */
        ( void ) xCanBlockIndefinitely;
    }
    #endif /* INCLUDE_vTaskSuspend */
}
    18d4:	1401      	addi      	r14, r14, 4
    18d6:	1494      	pop      	r4-r7, r15
            xTimeToWake = xConstTickCount + xTicksToWait;
    18d8:	619c      	addu      	r6, r7
            listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xStateListItem ), xTimeToWake );
    18da:	9563      	ld.w      	r3, (r5, 0xc)
            if( xTimeToWake < xConstTickCount )
    18dc:	65d8      	cmphs      	r6, r7
            listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xStateListItem ), xTimeToWake );
    18de:	b3c1      	st.w      	r6, (r3, 0x4)
            if( xTimeToWake < xConstTickCount )
    18e0:	0807      	bt      	0x18ee	// 18ee <prvAddCurrentTaskToDelayedList+0x66>
                vListInsert( pxOverflowDelayedTaskList, &( pxCurrentTCB->xStateListItem ) );
    18e2:	9509      	ld.w      	r0, (r5, 0x24)
    18e4:	9523      	ld.w      	r1, (r5, 0xc)
    18e6:	2103      	addi      	r1, 4
    18e8:	e3ffff98 	bsr      	0x1818	// 1818 <vListInsert>
    18ec:	07f4      	br      	0x18d4	// 18d4 <prvAddCurrentTaskToDelayedList+0x4c>
                vListInsert( pxDelayedTaskList, &( pxCurrentTCB->xStateListItem ) );
    18ee:	9500      	ld.w      	r0, (r5, 0x0)
    18f0:	9523      	ld.w      	r1, (r5, 0xc)
    18f2:	2103      	addi      	r1, 4
    18f4:	e3ffff92 	bsr      	0x1818	// 1818 <vListInsert>
                if( xTimeToWake < xNextTaskUnblockTime )
    18f8:	9561      	ld.w      	r3, (r5, 0x4)
    18fa:	64d8      	cmphs      	r6, r3
    18fc:	0bec      	bt      	0x18d4	// 18d4 <prvAddCurrentTaskToDelayedList+0x4c>
                    xNextTaskUnblockTime = xTimeToWake;
    18fe:	b5c1      	st.w      	r6, (r5, 0x4)
}
    1900:	07ea      	br      	0x18d4	// 18d4 <prvAddCurrentTaskToDelayedList+0x4c>
    1902:	0000      	bkpt
    1904:	200000d0 	.long	0x200000d0

Disassembly of section .text.prvIdleTask:

00001908 <prvIdleTask>:
{
    1908:	14d3      	push      	r4-r6, r15
        while( uxDeletedTasksWaitingCleanUp > ( UBaseType_t ) 0U )
    190a:	1097      	lrw      	r4, 0x200000d0	// 1964 <prvIdleTask+0x5c>
                pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xTasksWaitingTermination ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    190c:	3628      	movi      	r6, 40
    190e:	6190      	addu      	r6, r4
        while( uxDeletedTasksWaitingCleanUp > ( UBaseType_t ) 0U )
    1910:	9470      	ld.w      	r3, (r4, 0x40)
    1912:	3b40      	cmpnei      	r3, 0
    1914:	080e      	bt      	0x1930	// 1930 <prvIdleTask+0x28>
            if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ tskIDLE_PRIORITY ] ) ) > ( UBaseType_t ) 1 )
    1916:	1075      	lrw      	r3, 0x20000114	// 1968 <prvIdleTask+0x60>
    1918:	9360      	ld.w      	r3, (r3, 0x0)
    191a:	3b01      	cmphsi      	r3, 2
    191c:	0ffa      	bf      	0x1910	// 1910 <prvIdleTask+0x8>
                taskYIELD();
    191e:	1074      	lrw      	r3, 0x2000006c	// 196c <prvIdleTask+0x64>
    1920:	9360      	ld.w      	r3, (r3, 0x0)
    1922:	3b40      	cmpnei      	r3, 0
    1924:	081c      	bt      	0x195c	// 195c <prvIdleTask+0x54>
    1926:	e3fff464 	bsr      	0x1ee	// 1ee <vPortYield>
    192a:	6c03      	mov      	r0, r0
    192c:	6c03      	mov      	r0, r0
    192e:	07f1      	br      	0x1910	// 1910 <prvIdleTask+0x8>
            taskENTER_CRITICAL();
    1930:	e00004a0 	bsr      	0x2270	// 2270 <vPortEnterCritical>
                pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xTasksWaitingTermination ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1934:	9663      	ld.w      	r3, (r6, 0xc)
    1936:	93a3      	ld.w      	r5, (r3, 0xc)
                ( void ) uxListRemove( &( pxTCB->xStateListItem ) );
    1938:	5d0e      	addi      	r0, r5, 4
    193a:	e3ffff87 	bsr      	0x1848	// 1848 <uxListRemove>
                --uxCurrentNumberOfTasks;
    193e:	946f      	ld.w      	r3, (r4, 0x3c)
    1940:	2b00      	subi      	r3, 1
    1942:	b46f      	st.w      	r3, (r4, 0x3c)
                --uxDeletedTasksWaitingCleanUp;
    1944:	9470      	ld.w      	r3, (r4, 0x40)
    1946:	2b00      	subi      	r3, 1
    1948:	b470      	st.w      	r3, (r4, 0x40)
            taskEXIT_CRITICAL();
    194a:	e000049d 	bsr      	0x2284	// 2284 <vPortExitCritical>
            vPortFreeStack( pxTCB->pxStack );
    194e:	950c      	ld.w      	r0, (r5, 0x30)
    1950:	e0000402 	bsr      	0x2154	// 2154 <vPortFree>
            vPortFree( pxTCB );
    1954:	6c17      	mov      	r0, r5
    1956:	e00003ff 	bsr      	0x2154	// 2154 <vPortFree>
    195a:	07db      	br      	0x1910	// 1910 <prvIdleTask+0x8>
                taskYIELD();
    195c:	3201      	movi      	r2, 1
    195e:	1065      	lrw      	r3, 0x20000df0	// 1970 <prvIdleTask+0x68>
    1960:	b340      	st.w      	r2, (r3, 0x0)
    1962:	07e4      	br      	0x192a	// 192a <prvIdleTask+0x22>
    1964:	200000d0 	.long	0x200000d0
    1968:	20000114 	.long	0x20000114
    196c:	2000006c 	.long	0x2000006c
    1970:	20000df0 	.long	0x20000df0

Disassembly of section .text.xTaskCreate:

00001974 <xTaskCreate>:
    {
    1974:	14d4      	push      	r4-r7, r15
    1976:	1425      	subi      	r14, r14, 20
    1978:	b863      	st.w      	r3, (r14, 0xc)
    197a:	986b      	ld.w      	r3, (r14, 0x2c)
    197c:	b861      	st.w      	r3, (r14, 0x4)
            pxStack = pvPortMallocStack( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ) ); /*lint !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack and this allocation is the stack. */
    197e:	4262      	lsli      	r3, r2, 2
    {
    1980:	b802      	st.w      	r0, (r14, 0x8)
            pxStack = pvPortMallocStack( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ) ); /*lint !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack and this allocation is the stack. */
    1982:	6c0f      	mov      	r0, r3
    {
    1984:	6d07      	mov      	r4, r1
    1986:	98ea      	ld.w      	r7, (r14, 0x28)
            pxStack = pvPortMallocStack( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ) ); /*lint !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack and this allocation is the stack. */
    1988:	b860      	st.w      	r3, (r14, 0x0)
    198a:	e0000351 	bsr      	0x202c	// 202c <pvPortMalloc>
            if( pxStack != NULL )
    198e:	3840      	cmpnei      	r0, 0
            pxStack = pvPortMallocStack( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ) ); /*lint !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack and this allocation is the stack. */
    1990:	6d43      	mov      	r5, r0
            if( pxStack != NULL )
    1992:	0c19      	bf      	0x19c4	// 19c4 <xTaskCreate+0x50>
                pxNewTCB = ( TCB_t * ) pvPortMalloc( sizeof( TCB_t ) ); /*lint !e9087 !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack, and the first member of TCB_t is always a pointer to the task's stack. */
    1994:	3050      	movi      	r0, 80
    1996:	e000034b 	bsr      	0x202c	// 202c <pvPortMalloc>
                if( pxNewTCB != NULL )
    199a:	3840      	cmpnei      	r0, 0
                pxNewTCB = ( TCB_t * ) pvPortMalloc( sizeof( TCB_t ) ); /*lint !e9087 !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack, and the first member of TCB_t is always a pointer to the task's stack. */
    199c:	6d83      	mov      	r6, r0
                if( pxNewTCB != NULL )
    199e:	0c10      	bf      	0x19be	// 19be <xTaskCreate+0x4a>
                    memset( ( void * ) pxNewTCB, 0x00, sizeof( TCB_t ) );
    19a0:	3250      	movi      	r2, 80
    19a2:	3100      	movi      	r1, 0
    19a4:	e3fff4d6 	bsr      	0x350	// 350 <__memset_fast>
    if( pcName != NULL )
    19a8:	3c40      	cmpnei      	r4, 0
                    pxNewTCB->pxStack = pxStack;
    19aa:	b6ac      	st.w      	r5, (r6, 0x30)
    if( pcName != NULL )
    19ac:	0810      	bt      	0x19cc	// 19cc <xTaskCreate+0x58>
    configASSERT( uxPriority < configMAX_PRIORITIES );
    19ae:	3f04      	cmphsi      	r7, 5
    19b0:	0c20      	bf      	0x19f0	// 19f0 <xTaskCreate+0x7c>
    19b2:	125c      	lrw      	r2, 0x392	// 1b20 <xTaskCreate+0x1ac>
    19b4:	123c      	lrw      	r1, 0x26d3	// 1b24 <xTaskCreate+0x1b0>
    19b6:	121d      	lrw      	r0, 0x26e4	// 1b28 <xTaskCreate+0x1b4>
    19b8:	e3fff460 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    19bc:	0400      	br      	0x19bc	// 19bc <xTaskCreate+0x48>
                    vPortFreeStack( pxStack );
    19be:	6c17      	mov      	r0, r5
    19c0:	e00003ca 	bsr      	0x2154	// 2154 <vPortFree>
            xReturn = errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY;
    19c4:	3000      	movi      	r0, 0
    19c6:	2800      	subi      	r0, 1
    }
    19c8:	1405      	addi      	r14, r14, 20
    19ca:	1494      	pop      	r4-r7, r15
    19cc:	3234      	movi      	r2, 52
    19ce:	310c      	movi      	r1, 12
    19d0:	6098      	addu      	r2, r6
    19d2:	6050      	addu      	r1, r4
            pxNewTCB->pcTaskName[ x ] = pcName[ x ];
    19d4:	8460      	ld.b      	r3, (r4, 0x0)
    19d6:	a260      	st.b      	r3, (r2, 0x0)
            if( pcName[ x ] == ( char ) 0x00 )
    19d8:	8400      	ld.b      	r0, (r4, 0x0)
    19da:	3840      	cmpnei      	r0, 0
    19dc:	0c05      	bf      	0x19e6	// 19e6 <xTaskCreate+0x72>
    19de:	2400      	addi      	r4, 1
        for( x = ( UBaseType_t ) 0; x < ( UBaseType_t ) configMAX_TASK_NAME_LEN; x++ )
    19e0:	6506      	cmpne      	r1, r4
    19e2:	2200      	addi      	r2, 1
    19e4:	0bf8      	bt      	0x19d4	// 19d4 <xTaskCreate+0x60>
        pxNewTCB->pcTaskName[ configMAX_TASK_NAME_LEN - 1 ] = '\0';
    19e6:	3220      	movi      	r2, 32
    19e8:	6098      	addu      	r2, r6
    19ea:	3300      	movi      	r3, 0
    19ec:	a27f      	st.b      	r3, (r2, 0x1f)
    19ee:	07e0      	br      	0x19ae	// 19ae <xTaskCreate+0x3a>
    vListInitialiseItem( &( pxNewTCB->xStateListItem ) );
    19f0:	5e6e      	addi      	r3, r6, 4
    19f2:	6c0f      	mov      	r0, r3
    pxNewTCB->uxPriority = uxPriority;
    19f4:	b6eb      	st.w      	r7, (r6, 0x2c)
        pxNewTCB->uxBasePriority = uxPriority;
    19f6:	b6f0      	st.w      	r7, (r6, 0x40)
    vListInitialiseItem( &( pxNewTCB->xStateListItem ) );
    19f8:	b864      	st.w      	r3, (r14, 0x10)
    19fa:	e3ffff00 	bsr      	0x17fa	// 17fa <vListInitialiseItem>
    vListInitialiseItem( &( pxNewTCB->xEventListItem ) );
    19fe:	3018      	movi      	r0, 24
    1a00:	6018      	addu      	r0, r6
    1a02:	e3fffefc 	bsr      	0x17fa	// 17fa <vListInitialiseItem>
        pxTopOfStack = &( pxNewTCB->pxStack[ ulStackDepth - ( uint32_t ) 1 ] );
    1a06:	9800      	ld.w      	r0, (r14, 0x0)
    listSET_LIST_ITEM_VALUE( &( pxNewTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) uxPriority ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    1a08:	3205      	movi      	r2, 5
    1a0a:	609e      	subu      	r2, r7
        pxTopOfStack = &( pxNewTCB->pxStack[ ulStackDepth - ( uint32_t ) 1 ] );
    1a0c:	2803      	subi      	r0, 4
    listSET_LIST_ITEM_VALUE( &( pxNewTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) uxPriority ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    1a0e:	b646      	st.w      	r2, (r6, 0x18)
        pxTopOfStack = &( pxNewTCB->pxStack[ ulStackDepth - ( uint32_t ) 1 ] );
    1a10:	6014      	addu      	r0, r5
        pxTopOfStack = ( StackType_t * ) ( ( ( portPOINTER_SIZE_TYPE ) pxTopOfStack ) & ( ~( ( portPOINTER_SIZE_TYPE ) portBYTE_ALIGNMENT_MASK ) ) ); /*lint !e923 !e9033 !e9078 MISRA exception.  Avoiding casts between pointers and integers is not practical.  Size differences accounted for using portPOINTER_SIZE_TYPE type.  Checked by assert(). */
    1a12:	3207      	movi      	r2, 7
    1a14:	6809      	andn      	r0, r2
    listSET_LIST_ITEM_OWNER( &( pxNewTCB->xStateListItem ), pxNewTCB );
    1a16:	b6c4      	st.w      	r6, (r6, 0x10)
    listSET_LIST_ITEM_OWNER( &( pxNewTCB->xEventListItem ), pxNewTCB );
    1a18:	b6c9      	st.w      	r6, (r6, 0x24)
            pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters );
    1a1a:	9843      	ld.w      	r2, (r14, 0xc)
    1a1c:	9822      	ld.w      	r1, (r14, 0x8)
    1a1e:	e00003cf 	bsr      	0x21bc	// 21bc <pxPortInitialiseStack>
    if( pxCreatedTask != NULL )
    1a22:	9861      	ld.w      	r3, (r14, 0x4)
    1a24:	3b40      	cmpnei      	r3, 0
            pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters );
    1a26:	b600      	st.w      	r0, (r6, 0x0)
    if( pxCreatedTask != NULL )
    1a28:	0c02      	bf      	0x1a2c	// 1a2c <xTaskCreate+0xb8>
        *pxCreatedTask = ( TaskHandle_t ) pxNewTCB;
    1a2a:	b3c0      	st.w      	r6, (r3, 0x0)
        uxCurrentNumberOfTasks++;
    1a2c:	12a0      	lrw      	r5, 0x200000d0	// 1b2c <xTaskCreate+0x1b8>
    taskENTER_CRITICAL();
    1a2e:	e0000421 	bsr      	0x2270	// 2270 <vPortEnterCritical>
        uxCurrentNumberOfTasks++;
    1a32:	954f      	ld.w      	r2, (r5, 0x3c)
    1a34:	2200      	addi      	r2, 1
    1a36:	b54f      	st.w      	r2, (r5, 0x3c)
        if( pxCurrentTCB == NULL )
    1a38:	9543      	ld.w      	r2, (r5, 0xc)
    1a3a:	3444      	movi      	r4, 68
    1a3c:	3780      	movi      	r7, 128
    1a3e:	3a40      	cmpnei      	r2, 0
    1a40:	6114      	addu      	r4, r5
    1a42:	61d4      	addu      	r7, r5
    1a44:	085f      	bt      	0x1b02	// 1b02 <xTaskCreate+0x18e>
            pxCurrentTCB = pxNewTCB;
    1a46:	b5c3      	st.w      	r6, (r5, 0xc)
            if( uxCurrentNumberOfTasks == ( UBaseType_t ) 1 )
    1a48:	954f      	ld.w      	r2, (r5, 0x3c)
    1a4a:	3a41      	cmpnei      	r2, 1
    1a4c:	082f      	bt      	0x1aaa	// 1aaa <xTaskCreate+0x136>
        vListInitialise( &( pxReadyTasksLists[ uxPriority ] ) );
    1a4e:	6c13      	mov      	r0, r4
    1a50:	e3fffecb 	bsr      	0x17e6	// 17e6 <vListInitialise>
    1a54:	3014      	movi      	r0, 20
    1a56:	6010      	addu      	r0, r4
    1a58:	e3fffec7 	bsr      	0x17e6	// 17e6 <vListInitialise>
    1a5c:	3028      	movi      	r0, 40
    1a5e:	6010      	addu      	r0, r4
    1a60:	e3fffec3 	bsr      	0x17e6	// 17e6 <vListInitialise>
    1a64:	6c1f      	mov      	r0, r7
    1a66:	e3fffec0 	bsr      	0x17e6	// 17e6 <vListInitialise>
    1a6a:	3050      	movi      	r0, 80
    1a6c:	6010      	addu      	r0, r4
    1a6e:	e3fffebc 	bsr      	0x17e6	// 17e6 <vListInitialise>
    vListInitialise( &xDelayedTaskList1 );
    1a72:	31a8      	movi      	r1, 168
    1a74:	6054      	addu      	r1, r5
    1a76:	6c07      	mov      	r0, r1
    1a78:	b821      	st.w      	r1, (r14, 0x4)
    1a7a:	e3fffeb6 	bsr      	0x17e6	// 17e6 <vListInitialise>
    vListInitialise( &xDelayedTaskList2 );
    1a7e:	32bc      	movi      	r2, 188
    1a80:	6094      	addu      	r2, r5
    1a82:	6c0b      	mov      	r0, r2
    1a84:	b840      	st.w      	r2, (r14, 0x0)
    1a86:	e3fffeb0 	bsr      	0x17e6	// 17e6 <vListInitialise>
    vListInitialise( &xPendingReadyList );
    1a8a:	30d0      	movi      	r0, 208
    1a8c:	6014      	addu      	r0, r5
    1a8e:	e3fffeac 	bsr      	0x17e6	// 17e6 <vListInitialise>
        vListInitialise( &xTasksWaitingTermination );
    1a92:	3028      	movi      	r0, 40
    1a94:	6014      	addu      	r0, r5
    1a96:	e3fffea8 	bsr      	0x17e6	// 17e6 <vListInitialise>
        vListInitialise( &xSuspendedTaskList );
    1a9a:	3010      	movi      	r0, 16
    1a9c:	6014      	addu      	r0, r5
    1a9e:	e3fffea4 	bsr      	0x17e6	// 17e6 <vListInitialise>
    pxDelayedTaskList = &xDelayedTaskList1;
    1aa2:	9821      	ld.w      	r1, (r14, 0x4)
    pxOverflowDelayedTaskList = &xDelayedTaskList2;
    1aa4:	9840      	ld.w      	r2, (r14, 0x0)
    pxDelayedTaskList = &xDelayedTaskList1;
    1aa6:	b520      	st.w      	r1, (r5, 0x0)
    pxOverflowDelayedTaskList = &xDelayedTaskList2;
    1aa8:	b549      	st.w      	r2, (r5, 0x24)
        uxTaskNumber++;
    1aaa:	975a      	ld.w      	r2, (r7, 0x68)
    1aac:	2200      	addi      	r2, 1
    1aae:	b75a      	st.w      	r2, (r7, 0x68)
        prvAddTaskToReadyList( pxNewTCB );
    1ab0:	973b      	ld.w      	r1, (r7, 0x6c)
    1ab2:	964b      	ld.w      	r2, (r6, 0x2c)
    1ab4:	6484      	cmphs      	r1, r2
    1ab6:	0802      	bt      	0x1aba	// 1aba <xTaskCreate+0x146>
    1ab8:	b75b      	st.w      	r2, (r7, 0x6c)
    1aba:	4202      	lsli      	r0, r2, 2
    1abc:	6008      	addu      	r0, r2
    1abe:	4002      	lsli      	r0, r0, 2
    1ac0:	6010      	addu      	r0, r4
    1ac2:	9041      	ld.w      	r2, (r0, 0x4)
    1ac4:	9222      	ld.w      	r1, (r2, 0x8)
    1ac6:	b623      	st.w      	r1, (r6, 0xc)
    1ac8:	9222      	ld.w      	r1, (r2, 0x8)
    1aca:	5e6e      	addi      	r3, r6, 4
    1acc:	b642      	st.w      	r2, (r6, 0x8)
    1ace:	b161      	st.w      	r3, (r1, 0x4)
    1ad0:	b262      	st.w      	r3, (r2, 0x8)
    1ad2:	9040      	ld.w      	r2, (r0, 0x0)
    1ad4:	2200      	addi      	r2, 1
    1ad6:	b605      	st.w      	r0, (r6, 0x14)
    1ad8:	b040      	st.w      	r2, (r0, 0x0)
    taskEXIT_CRITICAL();
    1ada:	e00003d5 	bsr      	0x2284	// 2284 <vPortExitCritical>
    if( xSchedulerRunning != pdFALSE )
    1ade:	9759      	ld.w      	r2, (r7, 0x64)
    1ae0:	3a40      	cmpnei      	r2, 0
    1ae2:	0c0e      	bf      	0x1afe	// 1afe <xTaskCreate+0x18a>
        if( pxCurrentTCB->uxPriority < pxNewTCB->uxPriority )
    1ae4:	9543      	ld.w      	r2, (r5, 0xc)
    1ae6:	924b      	ld.w      	r2, (r2, 0x2c)
    1ae8:	966b      	ld.w      	r3, (r6, 0x2c)
    1aea:	64c8      	cmphs      	r2, r3
    1aec:	0809      	bt      	0x1afe	// 1afe <xTaskCreate+0x18a>
            taskYIELD_IF_USING_PREEMPTION();
    1aee:	1071      	lrw      	r3, 0x2000006c	// 1b30 <xTaskCreate+0x1bc>
    1af0:	9360      	ld.w      	r3, (r3, 0x0)
    1af2:	3b40      	cmpnei      	r3, 0
    1af4:	0811      	bt      	0x1b16	// 1b16 <xTaskCreate+0x1a2>
    1af6:	e3fff37c 	bsr      	0x1ee	// 1ee <vPortYield>
    1afa:	6c03      	mov      	r0, r0
    1afc:	6c03      	mov      	r0, r0
            xReturn = pdPASS;
    1afe:	3001      	movi      	r0, 1
        return xReturn;
    1b00:	0764      	br      	0x19c8	// 19c8 <xTaskCreate+0x54>
            if( xSchedulerRunning == pdFALSE )
    1b02:	9759      	ld.w      	r2, (r7, 0x64)
    1b04:	3a40      	cmpnei      	r2, 0
    1b06:	0bd2      	bt      	0x1aaa	// 1aaa <xTaskCreate+0x136>
                if( pxCurrentTCB->uxPriority <= pxNewTCB->uxPriority )
    1b08:	9543      	ld.w      	r2, (r5, 0xc)
    1b0a:	922b      	ld.w      	r1, (r2, 0x2c)
    1b0c:	964b      	ld.w      	r2, (r6, 0x2c)
    1b0e:	6448      	cmphs      	r2, r1
    1b10:	0fcd      	bf      	0x1aaa	// 1aaa <xTaskCreate+0x136>
                    pxCurrentTCB = pxNewTCB;
    1b12:	b5c3      	st.w      	r6, (r5, 0xc)
    1b14:	07cb      	br      	0x1aaa	// 1aaa <xTaskCreate+0x136>
            taskYIELD_IF_USING_PREEMPTION();
    1b16:	3201      	movi      	r2, 1
    1b18:	1067      	lrw      	r3, 0x20000df0	// 1b34 <xTaskCreate+0x1c0>
    1b1a:	b340      	st.w      	r2, (r3, 0x0)
    1b1c:	07ef      	br      	0x1afa	// 1afa <xTaskCreate+0x186>
    1b1e:	0000      	bkpt
    1b20:	00000392 	.long	0x00000392
    1b24:	000026d3 	.long	0x000026d3
    1b28:	000026e4 	.long	0x000026e4
    1b2c:	200000d0 	.long	0x200000d0
    1b30:	2000006c 	.long	0x2000006c
    1b34:	20000df0 	.long	0x20000df0

Disassembly of section .text.vTaskDelete:

00001b38 <vTaskDelete>:
    {
    1b38:	14d4      	push      	r4-r7, r15
    1b3a:	6d03      	mov      	r4, r0
        taskENTER_CRITICAL();
    1b3c:	e000039a 	bsr      	0x2270	// 2270 <vPortEnterCritical>
            pxTCB = prvGetTCBFromHandle( xTaskToDelete );
    1b40:	3c40      	cmpnei      	r4, 0
    1b42:	11a5      	lrw      	r5, 0x200000d0	// 1bd4 <vTaskDelete+0x9c>
    1b44:	0802      	bt      	0x1b48	// 1b48 <vTaskDelete+0x10>
    1b46:	9583      	ld.w      	r4, (r5, 0xc)
            if( uxListRemove( &( pxTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
    1b48:	5cee      	addi      	r7, r4, 4
    1b4a:	6c1f      	mov      	r0, r7
    1b4c:	e3fffe7e 	bsr      	0x1848	// 1848 <uxListRemove>
            if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) != NULL )
    1b50:	946a      	ld.w      	r3, (r4, 0x28)
    1b52:	3b40      	cmpnei      	r3, 0
    1b54:	0c05      	bf      	0x1b5e	// 1b5e <vTaskDelete+0x26>
                ( void ) uxListRemove( &( pxTCB->xEventListItem ) );
    1b56:	3018      	movi      	r0, 24
    1b58:	6010      	addu      	r0, r4
    1b5a:	e3fffe77 	bsr      	0x1848	// 1848 <uxListRemove>
            uxTaskNumber++;
    1b5e:	10df      	lrw      	r6, 0x20000150	// 1bd8 <vTaskDelete+0xa0>
    1b60:	967a      	ld.w      	r3, (r6, 0x68)
    1b62:	2300      	addi      	r3, 1
    1b64:	b67a      	st.w      	r3, (r6, 0x68)
            if( pxTCB == pxCurrentTCB )
    1b66:	9563      	ld.w      	r3, (r5, 0xc)
    1b68:	64d2      	cmpne      	r4, r3
    1b6a:	0822      	bt      	0x1bae	// 1bae <vTaskDelete+0x76>
                vListInsertEnd( &xTasksWaitingTermination, &( pxTCB->xStateListItem ) );
    1b6c:	6c5f      	mov      	r1, r7
    1b6e:	101c      	lrw      	r0, 0x200000f8	// 1bdc <vTaskDelete+0xa4>
    1b70:	e3fffe48 	bsr      	0x1800	// 1800 <vListInsertEnd>
                ++uxDeletedTasksWaitingCleanUp;
    1b74:	9570      	ld.w      	r3, (r5, 0x40)
    1b76:	2300      	addi      	r3, 1
    1b78:	b570      	st.w      	r3, (r5, 0x40)
        taskEXIT_CRITICAL();
    1b7a:	e0000385 	bsr      	0x2284	// 2284 <vPortExitCritical>
        if( pxTCB != pxCurrentTCB )
    1b7e:	9563      	ld.w      	r3, (r5, 0xc)
    1b80:	64d2      	cmpne      	r4, r3
    1b82:	0c07      	bf      	0x1b90	// 1b90 <vTaskDelete+0x58>
            vPortFreeStack( pxTCB->pxStack );
    1b84:	940c      	ld.w      	r0, (r4, 0x30)
    1b86:	e00002e7 	bsr      	0x2154	// 2154 <vPortFree>
            vPortFree( pxTCB );
    1b8a:	6c13      	mov      	r0, r4
    1b8c:	e00002e4 	bsr      	0x2154	// 2154 <vPortFree>
        if( xSchedulerRunning != pdFALSE )
    1b90:	9679      	ld.w      	r3, (r6, 0x64)
    1b92:	3b40      	cmpnei      	r3, 0
    1b94:	0c1b      	bf      	0x1bca	// 1bca <vTaskDelete+0x92>
            if( pxTCB == pxCurrentTCB )
    1b96:	9563      	ld.w      	r3, (r5, 0xc)
    1b98:	64d2      	cmpne      	r4, r3
    1b9a:	0818      	bt      	0x1bca	// 1bca <vTaskDelete+0x92>
                configASSERT( uxSchedulerSuspended == 0 );
    1b9c:	967c      	ld.w      	r3, (r6, 0x70)
    1b9e:	3b40      	cmpnei      	r3, 0
    1ba0:	0c0d      	bf      	0x1bba	// 1bba <vTaskDelete+0x82>
    1ba2:	1050      	lrw      	r2, 0x4af	// 1be0 <vTaskDelete+0xa8>
    1ba4:	1030      	lrw      	r1, 0x26d3	// 1be4 <vTaskDelete+0xac>
    1ba6:	1011      	lrw      	r0, 0x26e4	// 1be8 <vTaskDelete+0xb0>
    1ba8:	e3fff368 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    1bac:	0400      	br      	0x1bac	// 1bac <vTaskDelete+0x74>
                --uxCurrentNumberOfTasks;
    1bae:	956f      	ld.w      	r3, (r5, 0x3c)
    1bb0:	2b00      	subi      	r3, 1
    1bb2:	b56f      	st.w      	r3, (r5, 0x3c)
                prvResetNextTaskUnblockTime();
    1bb4:	e3fffe5c 	bsr      	0x186c	// 186c <prvResetNextTaskUnblockTime>
    1bb8:	07e1      	br      	0x1b7a	// 1b7a <vTaskDelete+0x42>
                portYIELD_WITHIN_API();
    1bba:	106d      	lrw      	r3, 0x2000006c	// 1bec <vTaskDelete+0xb4>
    1bbc:	9360      	ld.w      	r3, (r3, 0x0)
    1bbe:	3b40      	cmpnei      	r3, 0
    1bc0:	0806      	bt      	0x1bcc	// 1bcc <vTaskDelete+0x94>
    1bc2:	e3fff316 	bsr      	0x1ee	// 1ee <vPortYield>
    1bc6:	6c03      	mov      	r0, r0
    1bc8:	6c03      	mov      	r0, r0
    }
    1bca:	1494      	pop      	r4-r7, r15
                portYIELD_WITHIN_API();
    1bcc:	3201      	movi      	r2, 1
    1bce:	1069      	lrw      	r3, 0x20000df0	// 1bf0 <vTaskDelete+0xb8>
    1bd0:	b340      	st.w      	r2, (r3, 0x0)
    1bd2:	07fa      	br      	0x1bc6	// 1bc6 <vTaskDelete+0x8e>
    1bd4:	200000d0 	.long	0x200000d0
    1bd8:	20000150 	.long	0x20000150
    1bdc:	200000f8 	.long	0x200000f8
    1be0:	000004af 	.long	0x000004af
    1be4:	000026d3 	.long	0x000026d3
    1be8:	000026e4 	.long	0x000026e4
    1bec:	2000006c 	.long	0x2000006c
    1bf0:	20000df0 	.long	0x20000df0

Disassembly of section .text.vTaskStartScheduler:

00001bf4 <vTaskStartScheduler>:
{
    1bf4:	14d3      	push      	r4-r6, r15
    1bf6:	1422      	subi      	r14, r14, 8
        xReturn = xTaskCreate( prvIdleTask,
    1bf8:	1093      	lrw      	r4, 0x200000d0	// 1c44 <vTaskStartScheduler+0x50>
    1bfa:	33f8      	movi      	r3, 248
    1bfc:	60d0      	addu      	r3, r4
    1bfe:	3500      	movi      	r5, 0
    1c00:	b861      	st.w      	r3, (r14, 0x4)
    1c02:	b8a0      	st.w      	r5, (r14, 0x0)
    1c04:	3300      	movi      	r3, 0
    1c06:	3240      	movi      	r2, 64
    1c08:	1030      	lrw      	r1, 0x26f5	// 1c48 <vTaskStartScheduler+0x54>
    1c0a:	1011      	lrw      	r0, 0x1908	// 1c4c <vTaskStartScheduler+0x58>
    1c0c:	e3fffeb4 	bsr      	0x1974	// 1974 <xTaskCreate>
    1c10:	3680      	movi      	r6, 128
    1c12:	3300      	movi      	r3, 0
    if( xReturn == pdPASS )
    1c14:	3841      	cmpnei      	r0, 1
        xReturn = xTaskCreate( prvIdleTask,
    1c16:	6190      	addu      	r6, r4
    1c18:	2b00      	subi      	r3, 1
    if( xReturn == pdPASS )
    1c1a:	080c      	bt      	0x1c32	// 1c32 <vTaskStartScheduler+0x3e>
  \details Disables IRQ interrupts by clearing the IE-bit in the PSR.
  Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __disable_irq(void)
{
    __ASM volatile("psrclr ie");
    1c1c:	c0807020 	psrclr      	ie
        xNextTaskUnblockTime = portMAX_DELAY;
    1c20:	b461      	st.w      	r3, (r4, 0x4)
        xSchedulerRunning = pdTRUE;
    1c22:	b619      	st.w      	r0, (r6, 0x64)
        xTickCount = ( TickType_t ) configINITIAL_TICK_COUNT;
    1c24:	b4a2      	st.w      	r5, (r4, 0x8)
        xPortStartScheduler();
    1c26:	e000031b 	bsr      	0x225c	// 225c <xPortStartScheduler>
    ( void ) uxTopUsedPriority;
    1c2a:	106a      	lrw      	r3, 0x20000068	// 1c50 <vTaskStartScheduler+0x5c>
    1c2c:	9360      	ld.w      	r3, (r3, 0x0)
}
    1c2e:	1402      	addi      	r14, r14, 8
    1c30:	1493      	pop      	r4-r6, r15
        configASSERT( xReturn != errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY );
    1c32:	64c2      	cmpne      	r0, r3
    1c34:	0bfb      	bt      	0x1c2a	// 1c2a <vTaskStartScheduler+0x36>
    1c36:	1048      	lrw      	r2, 0x812	// 1c54 <vTaskStartScheduler+0x60>
    1c38:	1028      	lrw      	r1, 0x26d3	// 1c58 <vTaskStartScheduler+0x64>
    1c3a:	1009      	lrw      	r0, 0x26e4	// 1c5c <vTaskStartScheduler+0x68>
    1c3c:	e3fff31e 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    1c40:	0400      	br      	0x1c40	// 1c40 <vTaskStartScheduler+0x4c>
    1c42:	0000      	bkpt
    1c44:	200000d0 	.long	0x200000d0
    1c48:	000026f5 	.long	0x000026f5
    1c4c:	00001908 	.long	0x00001908
    1c50:	20000068 	.long	0x20000068
    1c54:	00000812 	.long	0x00000812
    1c58:	000026d3 	.long	0x000026d3
    1c5c:	000026e4 	.long	0x000026e4

Disassembly of section .text.vTaskSuspendAll:

00001c60 <vTaskSuspendAll>:
    ++uxSchedulerSuspended;
    1c60:	1043      	lrw      	r2, 0x20000150	// 1c6c <vTaskSuspendAll+0xc>
    1c62:	927c      	ld.w      	r3, (r2, 0x70)
    1c64:	2300      	addi      	r3, 1
    1c66:	b27c      	st.w      	r3, (r2, 0x70)
}
    1c68:	783c      	jmp      	r15
    1c6a:	0000      	bkpt
    1c6c:	20000150 	.long	0x20000150

Disassembly of section .text.xTaskIncrementTick:

00001c70 <xTaskIncrementTick>:
{
    1c70:	14d4      	push      	r4-r7, r15
    1c72:	1423      	subi      	r14, r14, 12
    if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    1c74:	126a      	lrw      	r3, 0x200000d0	// 1d9c <xTaskIncrementTick+0x12c>
    1c76:	3580      	movi      	r5, 128
    1c78:	614c      	addu      	r5, r3
    1c7a:	955c      	ld.w      	r2, (r5, 0x70)
    1c7c:	3a40      	cmpnei      	r2, 0
    1c7e:	6d0f      	mov      	r4, r3
    1c80:	b8a0      	st.w      	r5, (r14, 0x0)
    1c82:	0886      	bt      	0x1d8e	// 1d8e <xTaskIncrementTick+0x11e>
        const TickType_t xConstTickCount = xTickCount + ( TickType_t ) 1;
    1c84:	9342      	ld.w      	r2, (r3, 0x8)
    1c86:	5ae2      	addi      	r7, r2, 1
        if( xConstTickCount == ( TickType_t ) 0U ) /*lint !e774 'if' does not always evaluate to false as it is looking for an overflow. */
    1c88:	3f40      	cmpnei      	r7, 0
        xTickCount = xConstTickCount;
    1c8a:	b3e2      	st.w      	r7, (r3, 0x8)
        if( xConstTickCount == ( TickType_t ) 0U ) /*lint !e774 'if' does not always evaluate to false as it is looking for an overflow. */
    1c8c:	0816      	bt      	0x1cb8	// 1cb8 <xTaskIncrementTick+0x48>
            taskSWITCH_DELAYED_LISTS();
    1c8e:	9360      	ld.w      	r3, (r3, 0x0)
    1c90:	9360      	ld.w      	r3, (r3, 0x0)
    1c92:	3b40      	cmpnei      	r3, 0
    1c94:	0c07      	bf      	0x1ca2	// 1ca2 <xTaskIncrementTick+0x32>
    1c96:	1243      	lrw      	r2, 0xab7	// 1da0 <xTaskIncrementTick+0x130>
    1c98:	1223      	lrw      	r1, 0x26d3	// 1da4 <xTaskIncrementTick+0x134>
    1c9a:	1204      	lrw      	r0, 0x26e4	// 1da8 <xTaskIncrementTick+0x138>
    1c9c:	e3fff2ee 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    1ca0:	0400      	br      	0x1ca0	// 1ca0 <xTaskIncrementTick+0x30>
    1ca2:	9460      	ld.w      	r3, (r4, 0x0)
    1ca4:	9449      	ld.w      	r2, (r4, 0x24)
    1ca6:	b440      	st.w      	r2, (r4, 0x0)
    1ca8:	b469      	st.w      	r3, (r4, 0x24)
    1caa:	9860      	ld.w      	r3, (r14, 0x0)
    1cac:	937f      	ld.w      	r3, (r3, 0x7c)
    1cae:	2300      	addi      	r3, 1
    1cb0:	9840      	ld.w      	r2, (r14, 0x0)
    1cb2:	b27f      	st.w      	r3, (r2, 0x7c)
    1cb4:	e3fffddc 	bsr      	0x186c	// 186c <prvResetNextTaskUnblockTime>
        if( xConstTickCount >= xNextTaskUnblockTime )
    1cb8:	9461      	ld.w      	r3, (r4, 0x4)
    1cba:	64dc      	cmphs      	r7, r3
    1cbc:	117c      	lrw      	r3, 0x20000114	// 1dac <xTaskIncrementTick+0x13c>
    1cbe:	3000      	movi      	r0, 0
    1cc0:	b862      	st.w      	r3, (r14, 0x8)
    1cc2:	0c07      	bf      	0x1cd0	// 1cd0 <xTaskIncrementTick+0x60>
                if( listLIST_IS_EMPTY( pxDelayedTaskList ) != pdFALSE )
    1cc4:	9460      	ld.w      	r3, (r4, 0x0)
    1cc6:	9360      	ld.w      	r3, (r3, 0x0)
    1cc8:	3b40      	cmpnei      	r3, 0
    1cca:	0815      	bt      	0x1cf4	// 1cf4 <xTaskIncrementTick+0x84>
                    xNextTaskUnblockTime = portMAX_DELAY; /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    1ccc:	2b00      	subi      	r3, 1
    1cce:	b461      	st.w      	r3, (r4, 0x4)
            if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ pxCurrentTCB->uxPriority ] ) ) > ( UBaseType_t ) 1 )
    1cd0:	9463      	ld.w      	r3, (r4, 0xc)
    1cd2:	934b      	ld.w      	r2, (r3, 0x2c)
    1cd4:	4262      	lsli      	r3, r2, 2
    1cd6:	60c8      	addu      	r3, r2
    1cd8:	4362      	lsli      	r3, r3, 2
    1cda:	9842      	ld.w      	r2, (r14, 0x8)
    1cdc:	608c      	addu      	r2, r3
    1cde:	9260      	ld.w      	r3, (r2, 0x0)
    1ce0:	3b01      	cmphsi      	r3, 2
    1ce2:	0c02      	bf      	0x1ce6	// 1ce6 <xTaskIncrementTick+0x76>
                xSwitchRequired = pdTRUE;
    1ce4:	3001      	movi      	r0, 1
            if( xYieldPending != pdFALSE )
    1ce6:	9860      	ld.w      	r3, (r14, 0x0)
    1ce8:	937d      	ld.w      	r3, (r3, 0x74)
    1cea:	3b40      	cmpnei      	r3, 0
    1cec:	0c02      	bf      	0x1cf0	// 1cf0 <xTaskIncrementTick+0x80>
                xSwitchRequired = pdTRUE;
    1cee:	3001      	movi      	r0, 1
}
    1cf0:	1403      	addi      	r14, r14, 12
    1cf2:	1494      	pop      	r4-r7, r15
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( pxDelayedTaskList ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1cf4:	9460      	ld.w      	r3, (r4, 0x0)
    1cf6:	9363      	ld.w      	r3, (r3, 0xc)
    1cf8:	9363      	ld.w      	r3, (r3, 0xc)
                    xItemValue = listGET_LIST_ITEM_VALUE( &( pxTCB->xStateListItem ) );
    1cfa:	9341      	ld.w      	r2, (r3, 0x4)
                    if( xConstTickCount < xItemValue )
    1cfc:	649c      	cmphs      	r7, r2
    1cfe:	0803      	bt      	0x1d04	// 1d04 <xTaskIncrementTick+0x94>
                        xNextTaskUnblockTime = xItemValue;
    1d00:	b441      	st.w      	r2, (r4, 0x4)
    1d02:	07e7      	br      	0x1cd0	// 1cd0 <xTaskIncrementTick+0x60>
                    listREMOVE_ITEM( &( pxTCB->xStateListItem ) );
    1d04:	93c2      	ld.w      	r6, (r3, 0x8)
    1d06:	9323      	ld.w      	r1, (r3, 0xc)
    1d08:	9345      	ld.w      	r2, (r3, 0x14)
    1d0a:	b622      	st.w      	r1, (r6, 0x8)
    1d0c:	9323      	ld.w      	r1, (r3, 0xc)
    1d0e:	b1c1      	st.w      	r6, (r1, 0x4)
    1d10:	5bce      	addi      	r6, r3, 4
    1d12:	b8c1      	st.w      	r6, (r14, 0x4)
    1d14:	5bae      	addi      	r5, r3, 4
    1d16:	92c1      	ld.w      	r6, (r2, 0x4)
    1d18:	655a      	cmpne      	r6, r5
    1d1a:	0802      	bt      	0x1d1e	// 1d1e <xTaskIncrementTick+0xae>
    1d1c:	b221      	st.w      	r1, (r2, 0x4)
    1d1e:	3100      	movi      	r1, 0
    1d20:	b325      	st.w      	r1, (r3, 0x14)
    1d22:	9220      	ld.w      	r1, (r2, 0x0)
    1d24:	2900      	subi      	r1, 1
    1d26:	b220      	st.w      	r1, (r2, 0x0)
                    if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) != NULL )
    1d28:	934a      	ld.w      	r2, (r3, 0x28)
    1d2a:	3a40      	cmpnei      	r2, 0
    1d2c:	0c11      	bf      	0x1d4e	// 1d4e <xTaskIncrementTick+0xde>
                        listREMOVE_ITEM( &( pxTCB->xEventListItem ) );
    1d2e:	9327      	ld.w      	r1, (r3, 0x1c)
    1d30:	93c8      	ld.w      	r6, (r3, 0x20)
    1d32:	b1c2      	st.w      	r6, (r1, 0x8)
    1d34:	93c8      	ld.w      	r6, (r3, 0x20)
    1d36:	b621      	st.w      	r1, (r6, 0x4)
    1d38:	3118      	movi      	r1, 24
    1d3a:	604c      	addu      	r1, r3
    1d3c:	92a1      	ld.w      	r5, (r2, 0x4)
    1d3e:	6456      	cmpne      	r5, r1
    1d40:	0802      	bt      	0x1d44	// 1d44 <xTaskIncrementTick+0xd4>
    1d42:	b2c1      	st.w      	r6, (r2, 0x4)
    1d44:	3100      	movi      	r1, 0
    1d46:	b32a      	st.w      	r1, (r3, 0x28)
    1d48:	9220      	ld.w      	r1, (r2, 0x0)
    1d4a:	2900      	subi      	r1, 1
    1d4c:	b220      	st.w      	r1, (r2, 0x0)
                    prvAddTaskToReadyList( pxTCB );
    1d4e:	9840      	ld.w      	r2, (r14, 0x0)
    1d50:	932b      	ld.w      	r1, (r3, 0x2c)
    1d52:	925b      	ld.w      	r2, (r2, 0x6c)
    1d54:	6448      	cmphs      	r2, r1
    1d56:	0803      	bt      	0x1d5c	// 1d5c <xTaskIncrementTick+0xec>
    1d58:	9840      	ld.w      	r2, (r14, 0x0)
    1d5a:	b23b      	st.w      	r1, (r2, 0x6c)
    1d5c:	4142      	lsli      	r2, r1, 2
    1d5e:	6084      	addu      	r2, r1
    1d60:	98a2      	ld.w      	r5, (r14, 0x8)
    1d62:	4242      	lsli      	r2, r2, 2
    1d64:	6094      	addu      	r2, r5
    1d66:	92c1      	ld.w      	r6, (r2, 0x4)
    1d68:	96a2      	ld.w      	r5, (r6, 0x8)
    1d6a:	b3a3      	st.w      	r5, (r3, 0xc)
    1d6c:	96a2      	ld.w      	r5, (r6, 0x8)
    1d6e:	b841      	st.w      	r2, (r14, 0x4)
    1d70:	5b4e      	addi      	r2, r3, 4
    1d72:	b3c2      	st.w      	r6, (r3, 0x8)
    1d74:	b541      	st.w      	r2, (r5, 0x4)
    1d76:	b642      	st.w      	r2, (r6, 0x8)
    1d78:	9841      	ld.w      	r2, (r14, 0x4)
    1d7a:	b345      	st.w      	r2, (r3, 0x14)
    1d7c:	9260      	ld.w      	r3, (r2, 0x0)
    1d7e:	2300      	addi      	r3, 1
    1d80:	b260      	st.w      	r3, (r2, 0x0)
                        if( pxTCB->uxPriority > pxCurrentTCB->uxPriority )
    1d82:	9463      	ld.w      	r3, (r4, 0xc)
    1d84:	936b      	ld.w      	r3, (r3, 0x2c)
    1d86:	644c      	cmphs      	r3, r1
    1d88:	0b9e      	bt      	0x1cc4	// 1cc4 <xTaskIncrementTick+0x54>
                            xSwitchRequired = pdTRUE;
    1d8a:	3001      	movi      	r0, 1
    1d8c:	079c      	br      	0x1cc4	// 1cc4 <xTaskIncrementTick+0x54>
        ++xPendedTicks;
    1d8e:	23ff      	addi      	r3, 256
    1d90:	9340      	ld.w      	r2, (r3, 0x0)
    1d92:	2200      	addi      	r2, 1
    1d94:	b340      	st.w      	r2, (r3, 0x0)
    BaseType_t xSwitchRequired = pdFALSE;
    1d96:	3000      	movi      	r0, 0
    return xSwitchRequired;
    1d98:	07ac      	br      	0x1cf0	// 1cf0 <xTaskIncrementTick+0x80>
    1d9a:	0000      	bkpt
    1d9c:	200000d0 	.long	0x200000d0
    1da0:	00000ab7 	.long	0x00000ab7
    1da4:	000026d3 	.long	0x000026d3
    1da8:	000026e4 	.long	0x000026e4
    1dac:	20000114 	.long	0x20000114

Disassembly of section .text.xTaskResumeAll:

00001db0 <xTaskResumeAll>:
{
    1db0:	14d4      	push      	r4-r7, r15
    1db2:	1423      	subi      	r14, r14, 12
    configASSERT( uxSchedulerSuspended );
    1db4:	12a7      	lrw      	r5, 0x200000d0	// 1ed0 <xTaskResumeAll+0x120>
    1db6:	3480      	movi      	r4, 128
    1db8:	6114      	addu      	r4, r5
    1dba:	947c      	ld.w      	r3, (r4, 0x70)
    1dbc:	3b40      	cmpnei      	r3, 0
    1dbe:	0807      	bt      	0x1dcc	// 1dcc <xTaskResumeAll+0x1c>
    1dc0:	1245      	lrw      	r2, 0x885	// 1ed4 <xTaskResumeAll+0x124>
    1dc2:	1226      	lrw      	r1, 0x26d3	// 1ed8 <xTaskResumeAll+0x128>
    1dc4:	1206      	lrw      	r0, 0x26e4	// 1edc <xTaskResumeAll+0x12c>
    1dc6:	e3fff259 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    1dca:	0400      	br      	0x1dca	// 1dca <xTaskResumeAll+0x1a>
    taskENTER_CRITICAL();
    1dcc:	e0000252 	bsr      	0x2270	// 2270 <vPortEnterCritical>
        --uxSchedulerSuspended;
    1dd0:	947c      	ld.w      	r3, (r4, 0x70)
    1dd2:	2b00      	subi      	r3, 1
    1dd4:	b47c      	st.w      	r3, (r4, 0x70)
        if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    1dd6:	947c      	ld.w      	r3, (r4, 0x70)
    1dd8:	3b40      	cmpnei      	r3, 0
    1dda:	0c07      	bf      	0x1de8	// 1de8 <xTaskResumeAll+0x38>
    BaseType_t xAlreadyYielded = pdFALSE;
    1ddc:	3400      	movi      	r4, 0
    taskEXIT_CRITICAL();
    1dde:	e0000253 	bsr      	0x2284	// 2284 <vPortExitCritical>
}
    1de2:	6c13      	mov      	r0, r4
    1de4:	1403      	addi      	r14, r14, 12
    1de6:	1494      	pop      	r4-r7, r15
            if( uxCurrentNumberOfTasks > ( UBaseType_t ) 0U )
    1de8:	956f      	ld.w      	r3, (r5, 0x3c)
    1dea:	3b40      	cmpnei      	r3, 0
    1dec:	0ff8      	bf      	0x1ddc	// 1ddc <xTaskResumeAll+0x2c>
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xPendingReadyList ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1dee:	32d0      	movi      	r2, 208
    1df0:	6094      	addu      	r2, r5
    1df2:	9263      	ld.w      	r3, (r2, 0xc)
    1df4:	b841      	st.w      	r2, (r14, 0x4)
                    prvAddTaskToReadyList( pxTCB );
    1df6:	3244      	movi      	r2, 68
    1df8:	6094      	addu      	r2, r5
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xPendingReadyList ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1dfa:	b860      	st.w      	r3, (r14, 0x0)
                    prvAddTaskToReadyList( pxTCB );
    1dfc:	b842      	st.w      	r2, (r14, 0x8)
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xPendingReadyList ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1dfe:	3300      	movi      	r3, 0
                while( listLIST_IS_EMPTY( &xPendingReadyList ) == pdFALSE )
    1e00:	9841      	ld.w      	r2, (r14, 0x4)
    1e02:	9240      	ld.w      	r2, (r2, 0x0)
    1e04:	3a40      	cmpnei      	r2, 0
    1e06:	0821      	bt      	0x1e48	// 1e48 <xTaskResumeAll+0x98>
                if( pxTCB != NULL )
    1e08:	3b40      	cmpnei      	r3, 0
    1e0a:	0c03      	bf      	0x1e10	// 1e10 <xTaskResumeAll+0x60>
                    prvResetNextTaskUnblockTime();
    1e0c:	e3fffd30 	bsr      	0x186c	// 186c <prvResetNextTaskUnblockTime>
                    TickType_t xPendedCounts = xPendedTicks; /* Non-volatile copy. */
    1e10:	1174      	lrw      	r3, 0x200001d0	// 1ee0 <xTaskResumeAll+0x130>
    1e12:	93a0      	ld.w      	r5, (r3, 0x0)
                    if( xPendedCounts > ( TickType_t ) 0U )
    1e14:	3d40      	cmpnei      	r5, 0
    1e16:	6d8f      	mov      	r6, r3
    1e18:	0c0b      	bf      	0x1e2e	// 1e2e <xTaskResumeAll+0x7e>
                            if( xTaskIncrementTick() != pdFALSE )
    1e1a:	e3ffff2b 	bsr      	0x1c70	// 1c70 <xTaskIncrementTick>
    1e1e:	3840      	cmpnei      	r0, 0
    1e20:	0c03      	bf      	0x1e26	// 1e26 <xTaskResumeAll+0x76>
                                xYieldPending = pdTRUE;
    1e22:	3301      	movi      	r3, 1
    1e24:	b47d      	st.w      	r3, (r4, 0x74)
                            --xPendedCounts;
    1e26:	2d00      	subi      	r5, 1
                        } while( xPendedCounts > ( TickType_t ) 0U );
    1e28:	3d40      	cmpnei      	r5, 0
    1e2a:	0bf8      	bt      	0x1e1a	// 1e1a <xTaskResumeAll+0x6a>
                        xPendedTicks = 0;
    1e2c:	b6a0      	st.w      	r5, (r6, 0x0)
                if( xYieldPending != pdFALSE )
    1e2e:	947d      	ld.w      	r3, (r4, 0x74)
    1e30:	3b40      	cmpnei      	r3, 0
    1e32:	0fd5      	bf      	0x1ddc	// 1ddc <xTaskResumeAll+0x2c>
                    taskYIELD_IF_USING_PREEMPTION();
    1e34:	116c      	lrw      	r3, 0x2000006c	// 1ee4 <xTaskResumeAll+0x134>
    1e36:	9360      	ld.w      	r3, (r3, 0x0)
    1e38:	3b40      	cmpnei      	r3, 0
    1e3a:	0846      	bt      	0x1ec6	// 1ec6 <xTaskResumeAll+0x116>
    1e3c:	e3fff1d9 	bsr      	0x1ee	// 1ee <vPortYield>
    1e40:	6c03      	mov      	r0, r0
    1e42:	6c03      	mov      	r0, r0
                        xAlreadyYielded = pdTRUE;
    1e44:	3401      	movi      	r4, 1
    1e46:	07cc      	br      	0x1dde	// 1dde <xTaskResumeAll+0x2e>
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xPendingReadyList ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1e48:	9860      	ld.w      	r3, (r14, 0x0)
    1e4a:	9363      	ld.w      	r3, (r3, 0xc)
                    listREMOVE_ITEM( &( pxTCB->xEventListItem ) );
    1e4c:	9307      	ld.w      	r0, (r3, 0x1c)
    1e4e:	9328      	ld.w      	r1, (r3, 0x20)
    1e50:	934a      	ld.w      	r2, (r3, 0x28)
    1e52:	b022      	st.w      	r1, (r0, 0x8)
    1e54:	9328      	ld.w      	r1, (r3, 0x20)
    1e56:	b101      	st.w      	r0, (r1, 0x4)
    1e58:	3018      	movi      	r0, 24
    1e5a:	600c      	addu      	r0, r3
    1e5c:	92c1      	ld.w      	r6, (r2, 0x4)
    1e5e:	641a      	cmpne      	r6, r0
    1e60:	0802      	bt      	0x1e64	// 1e64 <xTaskResumeAll+0xb4>
    1e62:	b221      	st.w      	r1, (r2, 0x4)
    1e64:	3100      	movi      	r1, 0
    1e66:	b32a      	st.w      	r1, (r3, 0x28)
    1e68:	9220      	ld.w      	r1, (r2, 0x0)
    1e6a:	2900      	subi      	r1, 1
    1e6c:	b220      	st.w      	r1, (r2, 0x0)
                    listREMOVE_ITEM( &( pxTCB->xStateListItem ) );
    1e6e:	9302      	ld.w      	r0, (r3, 0x8)
    1e70:	9323      	ld.w      	r1, (r3, 0xc)
    1e72:	9345      	ld.w      	r2, (r3, 0x14)
    1e74:	b022      	st.w      	r1, (r0, 0x8)
    1e76:	9323      	ld.w      	r1, (r3, 0xc)
    1e78:	b101      	st.w      	r0, (r1, 0x4)
    1e7a:	5bce      	addi      	r6, r3, 4
    1e7c:	9201      	ld.w      	r0, (r2, 0x4)
    1e7e:	6582      	cmpne      	r0, r6
    1e80:	0802      	bt      	0x1e84	// 1e84 <xTaskResumeAll+0xd4>
    1e82:	b221      	st.w      	r1, (r2, 0x4)
    1e84:	3100      	movi      	r1, 0
    1e86:	b325      	st.w      	r1, (r3, 0x14)
    1e88:	9220      	ld.w      	r1, (r2, 0x0)
    1e8a:	2900      	subi      	r1, 1
    1e8c:	b220      	st.w      	r1, (r2, 0x0)
                    prvAddTaskToReadyList( pxTCB );
    1e8e:	945b      	ld.w      	r2, (r4, 0x6c)
    1e90:	932b      	ld.w      	r1, (r3, 0x2c)
    1e92:	6448      	cmphs      	r2, r1
    1e94:	0802      	bt      	0x1e98	// 1e98 <xTaskResumeAll+0xe8>
    1e96:	b43b      	st.w      	r1, (r4, 0x6c)
    1e98:	4142      	lsli      	r2, r1, 2
    1e9a:	6084      	addu      	r2, r1
    1e9c:	9802      	ld.w      	r0, (r14, 0x8)
    1e9e:	4242      	lsli      	r2, r2, 2
    1ea0:	6080      	addu      	r2, r0
    1ea2:	9201      	ld.w      	r0, (r2, 0x4)
    1ea4:	90e2      	ld.w      	r7, (r0, 0x8)
    1ea6:	b3e3      	st.w      	r7, (r3, 0xc)
    1ea8:	90e2      	ld.w      	r7, (r0, 0x8)
    1eaa:	b302      	st.w      	r0, (r3, 0x8)
    1eac:	b7c1      	st.w      	r6, (r7, 0x4)
    1eae:	b0c2      	st.w      	r6, (r0, 0x8)
    1eb0:	9200      	ld.w      	r0, (r2, 0x0)
    1eb2:	2000      	addi      	r0, 1
    1eb4:	b345      	st.w      	r2, (r3, 0x14)
    1eb6:	b200      	st.w      	r0, (r2, 0x0)
                    if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
    1eb8:	9543      	ld.w      	r2, (r5, 0xc)
    1eba:	924b      	ld.w      	r2, (r2, 0x2c)
    1ebc:	6484      	cmphs      	r1, r2
    1ebe:	0fa1      	bf      	0x1e00	// 1e00 <xTaskResumeAll+0x50>
                        xYieldPending = pdTRUE;
    1ec0:	3201      	movi      	r2, 1
    1ec2:	b45d      	st.w      	r2, (r4, 0x74)
    1ec4:	079e      	br      	0x1e00	// 1e00 <xTaskResumeAll+0x50>
                    taskYIELD_IF_USING_PREEMPTION();
    1ec6:	3201      	movi      	r2, 1
    1ec8:	1068      	lrw      	r3, 0x20000df0	// 1ee8 <xTaskResumeAll+0x138>
    1eca:	b340      	st.w      	r2, (r3, 0x0)
    1ecc:	07ba      	br      	0x1e40	// 1e40 <xTaskResumeAll+0x90>
    1ece:	0000      	bkpt
    1ed0:	200000d0 	.long	0x200000d0
    1ed4:	00000885 	.long	0x00000885
    1ed8:	000026d3 	.long	0x000026d3
    1edc:	000026e4 	.long	0x000026e4
    1ee0:	200001d0 	.long	0x200001d0
    1ee4:	2000006c 	.long	0x2000006c
    1ee8:	20000df0 	.long	0x20000df0

Disassembly of section .text.vTaskDelay:

00001eec <vTaskDelay>:
    {
    1eec:	14d0      	push      	r15
    1eee:	1421      	subi      	r14, r14, 4
        if( xTicksToDelay > ( TickType_t ) 0U )
    1ef0:	3840      	cmpnei      	r0, 0
    1ef2:	080a      	bt      	0x1f06	// 1f06 <vTaskDelay+0x1a>
            portYIELD_WITHIN_API();
    1ef4:	1072      	lrw      	r3, 0x2000006c	// 1f3c <vTaskDelay+0x50>
    1ef6:	9360      	ld.w      	r3, (r3, 0x0)
    1ef8:	3b40      	cmpnei      	r3, 0
    1efa:	081d      	bt      	0x1f34	// 1f34 <vTaskDelay+0x48>
    1efc:	e3fff179 	bsr      	0x1ee	// 1ee <vPortYield>
    1f00:	6c03      	mov      	r0, r0
    1f02:	6c03      	mov      	r0, r0
    }
    1f04:	0416      	br      	0x1f30	// 1f30 <vTaskDelay+0x44>
            configASSERT( uxSchedulerSuspended == 0 );
    1f06:	106f      	lrw      	r3, 0x20000150	// 1f40 <vTaskDelay+0x54>
    1f08:	937c      	ld.w      	r3, (r3, 0x70)
    1f0a:	3b40      	cmpnei      	r3, 0
    1f0c:	0c07      	bf      	0x1f1a	// 1f1a <vTaskDelay+0x2e>
    1f0e:	104e      	lrw      	r2, 0x51c	// 1f44 <vTaskDelay+0x58>
    1f10:	102e      	lrw      	r1, 0x26d3	// 1f48 <vTaskDelay+0x5c>
    1f12:	100f      	lrw      	r0, 0x26e4	// 1f4c <vTaskDelay+0x60>
    1f14:	e3fff1b2 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    1f18:	0400      	br      	0x1f18	// 1f18 <vTaskDelay+0x2c>
    1f1a:	b800      	st.w      	r0, (r14, 0x0)
            vTaskSuspendAll();
    1f1c:	e3fffea2 	bsr      	0x1c60	// 1c60 <vTaskSuspendAll>
                prvAddCurrentTaskToDelayedList( xTicksToDelay, pdFALSE );
    1f20:	3100      	movi      	r1, 0
    1f22:	9800      	ld.w      	r0, (r14, 0x0)
    1f24:	e3fffcb2 	bsr      	0x1888	// 1888 <prvAddCurrentTaskToDelayedList>
            xAlreadyYielded = xTaskResumeAll();
    1f28:	e3ffff44 	bsr      	0x1db0	// 1db0 <xTaskResumeAll>
        if( xAlreadyYielded == pdFALSE )
    1f2c:	3840      	cmpnei      	r0, 0
    1f2e:	0fe3      	bf      	0x1ef4	// 1ef4 <vTaskDelay+0x8>
    }
    1f30:	1401      	addi      	r14, r14, 4
    1f32:	1490      	pop      	r15
            portYIELD_WITHIN_API();
    1f34:	3201      	movi      	r2, 1
    1f36:	1067      	lrw      	r3, 0x20000df0	// 1f50 <vTaskDelay+0x64>
    1f38:	b340      	st.w      	r2, (r3, 0x0)
    1f3a:	07e3      	br      	0x1f00	// 1f00 <vTaskDelay+0x14>
    1f3c:	2000006c 	.long	0x2000006c
    1f40:	20000150 	.long	0x20000150
    1f44:	0000051c 	.long	0x0000051c
    1f48:	000026d3 	.long	0x000026d3
    1f4c:	000026e4 	.long	0x000026e4
    1f50:	20000df0 	.long	0x20000df0

Disassembly of section .text.vTaskSwitchContext:

00001f54 <vTaskSwitchContext>:
{
    1f54:	14d4      	push      	r4-r7, r15
    1f56:	1421      	subi      	r14, r14, 4
    if( uxSchedulerSuspended != ( UBaseType_t ) pdFALSE )
    1f58:	109f      	lrw      	r4, 0x200000d0	// 1fd4 <vTaskSwitchContext+0x80>
    1f5a:	3380      	movi      	r3, 128
    1f5c:	60d0      	addu      	r3, r4
    1f5e:	935c      	ld.w      	r2, (r3, 0x70)
    1f60:	3a40      	cmpnei      	r2, 0
    1f62:	6d4f      	mov      	r5, r3
    1f64:	0c05      	bf      	0x1f6e	// 1f6e <vTaskSwitchContext+0x1a>
        xYieldPending = pdTRUE;
    1f66:	3201      	movi      	r2, 1
    1f68:	b35d      	st.w      	r2, (r3, 0x74)
}
    1f6a:	1401      	addi      	r14, r14, 4
    1f6c:	1494      	pop      	r4-r7, r15
        xYieldPending = pdFALSE;
    1f6e:	b35d      	st.w      	r2, (r3, 0x74)
        taskCHECK_FOR_STACK_OVERFLOW();
    1f70:	9443      	ld.w      	r2, (r4, 0xc)
    1f72:	9463      	ld.w      	r3, (r4, 0xc)
    1f74:	9240      	ld.w      	r2, (r2, 0x0)
    1f76:	936c      	ld.w      	r3, (r3, 0x30)
    1f78:	648c      	cmphs      	r3, r2
    1f7a:	0c06      	bf      	0x1f86	// 1f86 <vTaskSwitchContext+0x32>
    1f7c:	9403      	ld.w      	r0, (r4, 0xc)
    1f7e:	9423      	ld.w      	r1, (r4, 0xc)
    1f80:	2133      	addi      	r1, 52
    1f82:	e00001b7 	bsr      	0x22f0	// 22f0 <vApplicationStackOverflowHook>
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1f86:	1015      	lrw      	r0, 0x20000114	// 1fd8 <vTaskSwitchContext+0x84>
    1f88:	957b      	ld.w      	r3, (r5, 0x6c)
    1f8a:	b800      	st.w      	r0, (r14, 0x0)
    1f8c:	4342      	lsli      	r2, r3, 2
    1f8e:	5a2c      	addu      	r1, r2, r3
    1f90:	4122      	lsli      	r1, r1, 2
    1f92:	58c4      	addu      	r6, r0, r1
    1f94:	96e0      	ld.w      	r7, (r6, 0x0)
    1f96:	3f40      	cmpnei      	r7, 0
    1f98:	0c13      	bf      	0x1fbe	// 1fbe <vTaskSwitchContext+0x6a>
    1f9a:	96e1      	ld.w      	r7, (r6, 0x4)
    1f9c:	2107      	addi      	r1, 8
    1f9e:	97e1      	ld.w      	r7, (r7, 0x4)
    1fa0:	6040      	addu      	r1, r0
    1fa2:	645e      	cmpne      	r7, r1
    1fa4:	b6e1      	st.w      	r7, (r6, 0x4)
    1fa6:	0803      	bt      	0x1fac	// 1fac <vTaskSwitchContext+0x58>
    1fa8:	9721      	ld.w      	r1, (r7, 0x4)
    1faa:	b621      	st.w      	r1, (r6, 0x4)
    1fac:	608c      	addu      	r2, r3
    1fae:	4242      	lsli      	r2, r2, 2
    1fb0:	9820      	ld.w      	r1, (r14, 0x0)
    1fb2:	6048      	addu      	r1, r2
    1fb4:	9141      	ld.w      	r2, (r1, 0x4)
    1fb6:	9243      	ld.w      	r2, (r2, 0xc)
    1fb8:	b443      	st.w      	r2, (r4, 0xc)
    1fba:	b57b      	st.w      	r3, (r5, 0x6c)
}
    1fbc:	07d7      	br      	0x1f6a	// 1f6a <vTaskSwitchContext+0x16>
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1fbe:	3b40      	cmpnei      	r3, 0
    1fc0:	0807      	bt      	0x1fce	// 1fce <vTaskSwitchContext+0x7a>
    1fc2:	1047      	lrw      	r2, 0xbf6	// 1fdc <vTaskSwitchContext+0x88>
    1fc4:	1027      	lrw      	r1, 0x26d3	// 1fe0 <vTaskSwitchContext+0x8c>
    1fc6:	1008      	lrw      	r0, 0x26e4	// 1fe4 <vTaskSwitchContext+0x90>
    1fc8:	e3fff158 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    1fcc:	0400      	br      	0x1fcc	// 1fcc <vTaskSwitchContext+0x78>
    1fce:	2b00      	subi      	r3, 1
    1fd0:	07de      	br      	0x1f8c	// 1f8c <vTaskSwitchContext+0x38>
    1fd2:	0000      	bkpt
    1fd4:	200000d0 	.long	0x200000d0
    1fd8:	20000114 	.long	0x20000114
    1fdc:	00000bf6 	.long	0x00000bf6
    1fe0:	000026d3 	.long	0x000026d3
    1fe4:	000026e4 	.long	0x000026e4

Disassembly of section .text.prvInsertBlockIntoFreeList:

00001fe8 <prvInsertBlockIntoFreeList>:
    xFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
}
/*-----------------------------------------------------------*/

static void prvInsertBlockIntoFreeList( BlockLink_t * pxBlockToInsert ) /* PRIVILEGED_FUNCTION */
{
    1fe8:	14c2      	push      	r4-r5
    BlockLink_t * pxIterator;
    uint8_t * puc;

    /* Iterate through the list until a block is found that has a higher address
     * than the block being inserted. */
    for( pxIterator = &xStart; pxIterator->pxNextFreeBlock < pxBlockToInsert; pxIterator = pxIterator->pxNextFreeBlock )
    1fea:	1070      	lrw      	r3, 0x200001d4	// 2028 <prvInsertBlockIntoFreeList+0x40>
    1fec:	6d4f      	mov      	r5, r3
    1fee:	9340      	ld.w      	r2, (r3, 0x0)
    1ff0:	6408      	cmphs      	r2, r0
    1ff2:	0c19      	bf      	0x2024	// 2024 <prvInsertBlockIntoFreeList+0x3c>

    /* Do the block being inserted, and the block it is being inserted after
     * make a contiguous block of memory? */
    puc = ( uint8_t * ) pxIterator;

    if( ( puc + pxIterator->xBlockSize ) == ( uint8_t * ) pxBlockToInsert )
    1ff4:	9381      	ld.w      	r4, (r3, 0x4)
    1ff6:	5b30      	addu      	r1, r3, r4
    1ff8:	6442      	cmpne      	r0, r1
    1ffa:	0805      	bt      	0x2004	// 2004 <prvInsertBlockIntoFreeList+0x1c>
    {
        pxIterator->xBlockSize += pxBlockToInsert->xBlockSize;
    1ffc:	9021      	ld.w      	r1, (r0, 0x4)
    1ffe:	6050      	addu      	r1, r4
    2000:	b321      	st.w      	r1, (r3, 0x4)
    2002:	6c0f      	mov      	r0, r3

    /* Do the block being inserted, and the block it is being inserted before
     * make a contiguous block of memory? */
    puc = ( uint8_t * ) pxBlockToInsert;

    if( ( puc + pxBlockToInsert->xBlockSize ) == ( uint8_t * ) pxIterator->pxNextFreeBlock )
    2004:	9081      	ld.w      	r4, (r0, 0x4)
    2006:	5830      	addu      	r1, r0, r4
    2008:	644a      	cmpne      	r2, r1
    200a:	0808      	bt      	0x201a	// 201a <prvInsertBlockIntoFreeList+0x32>
    {
        if( pxIterator->pxNextFreeBlock != pxEnd )
    200c:	9522      	ld.w      	r1, (r5, 0x8)
    200e:	644a      	cmpne      	r2, r1
    2010:	0c05      	bf      	0x201a	// 201a <prvInsertBlockIntoFreeList+0x32>
        {
            /* Form one big block from the two blocks. */
            pxBlockToInsert->xBlockSize += pxIterator->pxNextFreeBlock->xBlockSize;
    2012:	9221      	ld.w      	r1, (r2, 0x4)
    2014:	6050      	addu      	r1, r4
    2016:	b021      	st.w      	r1, (r0, 0x4)
            pxBlockToInsert->pxNextFreeBlock = pxIterator->pxNextFreeBlock->pxNextFreeBlock;
    2018:	9240      	ld.w      	r2, (r2, 0x0)

    /* If the block being inserted plugged a gab, so was merged with the block
     * before and the block after, then it's pxNextFreeBlock pointer will have
     * already been set, and should not be set here as that would make it point
     * to itself. */
    if( pxIterator != pxBlockToInsert )
    201a:	64c2      	cmpne      	r0, r3
        pxBlockToInsert->pxNextFreeBlock = pxIterator->pxNextFreeBlock;
    201c:	b040      	st.w      	r2, (r0, 0x0)
    if( pxIterator != pxBlockToInsert )
    201e:	0c02      	bf      	0x2022	// 2022 <prvInsertBlockIntoFreeList+0x3a>
    {
        pxIterator->pxNextFreeBlock = pxBlockToInsert;
    2020:	b300      	st.w      	r0, (r3, 0x0)
    }
    else
    {
        mtCOVERAGE_TEST_MARKER();
    }
}
    2022:	1482      	pop      	r4-r5
    2024:	6ccb      	mov      	r3, r2
    2026:	07e4      	br      	0x1fee	// 1fee <prvInsertBlockIntoFreeList+0x6>
    2028:	200001d4 	.long	0x200001d4

Disassembly of section .text.pvPortMalloc:

0000202c <pvPortMalloc>:
{
    202c:	14d4      	push      	r4-r7, r15
    202e:	1421      	subi      	r14, r14, 4
    2030:	6d03      	mov      	r4, r0
    vTaskSuspendAll();
    2032:	e3fffe17 	bsr      	0x1c60	// 1c60 <vTaskSuspendAll>
        if( pxEnd == NULL )
    2036:	1221      	lrw      	r1, 0x200001d4	// 2138 <pvPortMalloc+0x10c>
    2038:	9162      	ld.w      	r3, (r1, 0x8)
    203a:	3b40      	cmpnei      	r3, 0
    203c:	081d      	bt      	0x2076	// 2076 <pvPortMalloc+0x4a>
    uxAddress = ( portPOINTER_SIZE_TYPE ) ucHeap;
    203e:	320c      	movi      	r2, 12
    2040:	6084      	addu      	r2, r1
    if( ( uxAddress & portBYTE_ALIGNMENT_MASK ) != 0 )
    2042:	3307      	movi      	r3, 7
    2044:	6c0b      	mov      	r0, r2
    2046:	680c      	and      	r0, r3
    2048:	11bd      	lrw      	r5, 0xc0c	// 213c <pvPortMalloc+0x110>
    204a:	3840      	cmpnei      	r0, 0
    204c:	6144      	addu      	r5, r1
    204e:	0c2f      	bf      	0x20ac	// 20ac <pvPortMalloc+0x80>
        uxAddress += ( portBYTE_ALIGNMENT - 1 );
    2050:	2206      	addi      	r2, 7
        uxAddress &= ~( ( portPOINTER_SIZE_TYPE ) portBYTE_ALIGNMENT_MASK );
    2052:	688d      	andn      	r2, r3
        xTotalHeapSize -= uxAddress - ( portPOINTER_SIZE_TYPE ) ucHeap;
    2054:	5d69      	subu      	r3, r5, r2
    uxAddress = ( ( portPOINTER_SIZE_TYPE ) pucAlignedHeap ) + xTotalHeapSize;
    2056:	60c8      	addu      	r3, r2
    uxAddress -= xHeapStructSize;
    2058:	2b07      	subi      	r3, 8
    uxAddress &= ~( ( portPOINTER_SIZE_TYPE ) portBYTE_ALIGNMENT_MASK );
    205a:	3607      	movi      	r6, 7
    205c:	68d9      	andn      	r3, r6
    xStart.xBlockSize = ( size_t ) 0;
    205e:	3000      	movi      	r0, 0
    2060:	b101      	st.w      	r0, (r1, 0x4)
    xStart.pxNextFreeBlock = ( void * ) pucAlignedHeap;
    2062:	b140      	st.w      	r2, (r1, 0x0)
    pxEnd->xBlockSize = 0;
    2064:	b301      	st.w      	r0, (r3, 0x4)
    pxEnd->pxNextFreeBlock = NULL;
    2066:	b300      	st.w      	r0, (r3, 0x0)
    pxEnd = ( BlockLink_t * ) uxAddress;
    2068:	b162      	st.w      	r3, (r1, 0x8)
    pxFirstFreeBlock->xBlockSize = ( size_t ) ( uxAddress - ( portPOINTER_SIZE_TYPE ) pxFirstFreeBlock );
    206a:	5b09      	subu      	r0, r3, r2
    pxFirstFreeBlock->pxNextFreeBlock = pxEnd;
    206c:	b260      	st.w      	r3, (r2, 0x0)
    xFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
    206e:	1175      	lrw      	r3, 0x20000de4	// 2140 <pvPortMalloc+0x114>
    pxFirstFreeBlock->xBlockSize = ( size_t ) ( uxAddress - ( portPOINTER_SIZE_TYPE ) pxFirstFreeBlock );
    2070:	b201      	st.w      	r0, (r2, 0x4)
    xMinimumEverFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
    2072:	b500      	st.w      	r0, (r5, 0x0)
    xFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
    2074:	b300      	st.w      	r0, (r3, 0x0)
        if( xWantedSize > 0 )
    2076:	3c40      	cmpnei      	r4, 0
    2078:	0c18      	bf      	0x20a8	// 20a8 <pvPortMalloc+0x7c>
            xAdditionalRequiredSize = xHeapStructSize + portBYTE_ALIGNMENT - ( xWantedSize & portBYTE_ALIGNMENT_MASK );
    207a:	3207      	movi      	r2, 7
    207c:	6890      	and      	r2, r4
    207e:	3310      	movi      	r3, 16
    2080:	60ca      	subu      	r3, r2
            if( heapADD_WILL_OVERFLOW( xWantedSize, xAdditionalRequiredSize ) == 0 )
    2082:	6c8f      	mov      	r2, r3
    2084:	6c8a      	nor      	r2, r2
    2086:	6508      	cmphs      	r2, r4
    2088:	0c10      	bf      	0x20a8	// 20a8 <pvPortMalloc+0x7c>
                xWantedSize += xAdditionalRequiredSize;
    208a:	610c      	addu      	r4, r3
            if( ( xWantedSize > 0 ) && ( xWantedSize <= xFreeBytesRemaining ) )
    208c:	3c20      	cmplti      	r4, 1
    208e:	080d      	bt      	0x20a8	// 20a8 <pvPortMalloc+0x7c>
    2090:	114c      	lrw      	r2, 0x20000de4	// 2140 <pvPortMalloc+0x114>
    2092:	92e0      	ld.w      	r7, (r2, 0x0)
    2094:	651c      	cmphs      	r7, r4
    2096:	0c09      	bf      	0x20a8	// 20a8 <pvPortMalloc+0x7c>
                pxBlock = xStart.pxNextFreeBlock;
    2098:	91a0      	ld.w      	r5, (r1, 0x0)
                pxPreviousBlock = &xStart;
    209a:	1108      	lrw      	r0, 0x200001d4	// 2138 <pvPortMalloc+0x10c>
                while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock != NULL ) )
    209c:	9561      	ld.w      	r3, (r5, 0x4)
    209e:	650c      	cmphs      	r3, r4
    20a0:	0c09      	bf      	0x20b2	// 20b2 <pvPortMalloc+0x86>
                if( pxBlock != pxEnd )
    20a2:	9122      	ld.w      	r1, (r1, 0x8)
    20a4:	6456      	cmpne      	r5, r1
    20a6:	080c      	bt      	0x20be	// 20be <pvPortMalloc+0x92>
    void * pvReturn = NULL;
    20a8:	3600      	movi      	r6, 0
    20aa:	0432      	br      	0x210e	// 210e <pvPortMalloc+0xe2>
    size_t xTotalHeapSize = configTOTAL_HEAP_SIZE;
    20ac:	33c0      	movi      	r3, 192
    20ae:	4364      	lsli      	r3, r3, 4
    20b0:	07d3      	br      	0x2056	// 2056 <pvPortMalloc+0x2a>
                while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock != NULL ) )
    20b2:	95c0      	ld.w      	r6, (r5, 0x0)
    20b4:	3e40      	cmpnei      	r6, 0
    20b6:	0ff6      	bf      	0x20a2	// 20a2 <pvPortMalloc+0x76>
    20b8:	6c17      	mov      	r0, r5
    20ba:	6d5b      	mov      	r5, r6
    20bc:	07f0      	br      	0x209c	// 209c <pvPortMalloc+0x70>
                    if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
    20be:	60d2      	subu      	r3, r4
                    pvReturn = ( void * ) ( ( ( uint8_t * ) pxPreviousBlock->pxNextFreeBlock ) + xHeapStructSize );
    20c0:	90c0      	ld.w      	r6, (r0, 0x0)
                    pxPreviousBlock->pxNextFreeBlock = pxBlock->pxNextFreeBlock;
    20c2:	9520      	ld.w      	r1, (r5, 0x0)
                    if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
    20c4:	3b10      	cmphsi      	r3, 17
                    pvReturn = ( void * ) ( ( ( uint8_t * ) pxPreviousBlock->pxNextFreeBlock ) + xHeapStructSize );
    20c6:	2607      	addi      	r6, 8
                    pxPreviousBlock->pxNextFreeBlock = pxBlock->pxNextFreeBlock;
    20c8:	b020      	st.w      	r1, (r0, 0x0)
                    if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
    20ca:	0c12      	bf      	0x20ee	// 20ee <pvPortMalloc+0xc2>
                        pxNewBlockLink = ( void * ) ( ( ( uint8_t * ) pxBlock ) + xWantedSize );
    20cc:	5d10      	addu      	r0, r5, r4
                        configASSERT( ( ( ( size_t ) pxNewBlockLink ) & portBYTE_ALIGNMENT_MASK ) == 0 );
    20ce:	3107      	movi      	r1, 7
    20d0:	6840      	and      	r1, r0
    20d2:	3940      	cmpnei      	r1, 0
    20d4:	0c07      	bf      	0x20e2	// 20e2 <pvPortMalloc+0xb6>
    20d6:	32dc      	movi      	r2, 220
    20d8:	103b      	lrw      	r1, 0x26fa	// 2144 <pvPortMalloc+0x118>
    20da:	101c      	lrw      	r0, 0x26e4	// 2148 <pvPortMalloc+0x11c>
    20dc:	e3fff0ce 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    20e0:	0400      	br      	0x20e0	// 20e0 <pvPortMalloc+0xb4>
                        pxNewBlockLink->xBlockSize = pxBlock->xBlockSize - xWantedSize;
    20e2:	b061      	st.w      	r3, (r0, 0x4)
                        pxBlock->xBlockSize = xWantedSize;
    20e4:	b581      	st.w      	r4, (r5, 0x4)
    20e6:	b840      	st.w      	r2, (r14, 0x0)
                        prvInsertBlockIntoFreeList( pxNewBlockLink );
    20e8:	e3ffff80 	bsr      	0x1fe8	// 1fe8 <prvInsertBlockIntoFreeList>
    20ec:	9840      	ld.w      	r2, (r14, 0x0)
                    xFreeBytesRemaining -= pxBlock->xBlockSize;
    20ee:	9521      	ld.w      	r1, (r5, 0x4)
    20f0:	5f65      	subu      	r3, r7, r1
    20f2:	b260      	st.w      	r3, (r2, 0x0)
                    if( xFreeBytesRemaining < xMinimumEverFreeBytesRemaining )
    20f4:	1056      	lrw      	r2, 0x20000de0	// 214c <pvPortMalloc+0x120>
    20f6:	9200      	ld.w      	r0, (r2, 0x0)
    20f8:	640c      	cmphs      	r3, r0
    20fa:	0802      	bt      	0x20fe	// 20fe <pvPortMalloc+0xd2>
                        xMinimumEverFreeBytesRemaining = xFreeBytesRemaining;
    20fc:	b260      	st.w      	r3, (r2, 0x0)
                    pxBlock->pxNextFreeBlock = NULL;
    20fe:	3300      	movi      	r3, 0
                    xNumberOfSuccessfulAllocations++;
    2100:	1054      	lrw      	r2, 0x20000de8	// 2150 <pvPortMalloc+0x124>
                    pxBlock->pxNextFreeBlock = NULL;
    2102:	b560      	st.w      	r3, (r5, 0x0)
                    xNumberOfSuccessfulAllocations++;
    2104:	9260      	ld.w      	r3, (r2, 0x0)
                    heapALLOCATE_BLOCK( pxBlock );
    2106:	39bf      	bseti      	r1, 31
                    xNumberOfSuccessfulAllocations++;
    2108:	2300      	addi      	r3, 1
                    heapALLOCATE_BLOCK( pxBlock );
    210a:	b521      	st.w      	r1, (r5, 0x4)
                    xNumberOfSuccessfulAllocations++;
    210c:	b260      	st.w      	r3, (r2, 0x0)
    ( void ) xTaskResumeAll();
    210e:	e3fffe51 	bsr      	0x1db0	// 1db0 <xTaskResumeAll>
        if( pvReturn == NULL )
    2112:	3e40      	cmpnei      	r6, 0
    2114:	0803      	bt      	0x211a	// 211a <pvPortMalloc+0xee>
            vApplicationMallocFailedHook();
    2116:	e00000ee 	bsr      	0x22f2	// 22f2 <vApplicationMallocFailedHook>
    configASSERT( ( ( ( size_t ) pvReturn ) & ( size_t ) portBYTE_ALIGNMENT_MASK ) == 0 );
    211a:	3307      	movi      	r3, 7
    211c:	68d8      	and      	r3, r6
    211e:	3b40      	cmpnei      	r3, 0
    2120:	0c08      	bf      	0x2130	// 2130 <pvPortMalloc+0x104>
    2122:	328e      	movi      	r2, 142
    2124:	4241      	lsli      	r2, r2, 1
    2126:	1028      	lrw      	r1, 0x26fa	// 2144 <pvPortMalloc+0x118>
    2128:	1008      	lrw      	r0, 0x26e4	// 2148 <pvPortMalloc+0x11c>
    212a:	e3fff0a7 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    212e:	0400      	br      	0x212e	// 212e <pvPortMalloc+0x102>
}
    2130:	6c1b      	mov      	r0, r6
    2132:	1401      	addi      	r14, r14, 4
    2134:	1494      	pop      	r4-r7, r15
    2136:	0000      	bkpt
    2138:	200001d4 	.long	0x200001d4
    213c:	00000c0c 	.long	0x00000c0c
    2140:	20000de4 	.long	0x20000de4
    2144:	000026fa 	.long	0x000026fa
    2148:	000026e4 	.long	0x000026e4
    214c:	20000de0 	.long	0x20000de0
    2150:	20000de8 	.long	0x20000de8

Disassembly of section .text.vPortFree:

00002154 <vPortFree>:
{
    2154:	14d2      	push      	r4-r5, r15
    if( pv != NULL )
    2156:	3840      	cmpnei      	r0, 0
    2158:	0c28      	bf      	0x21a8	// 21a8 <vPortFree+0x54>
        puc -= xHeapStructSize;
    215a:	589f      	subi      	r4, r0, 8
        configASSERT( heapBLOCK_IS_ALLOCATED( pxLink ) != 0 );
    215c:	9461      	ld.w      	r3, (r4, 0x4)
    215e:	3bdf      	btsti      	r3, 31
    2160:	0807      	bt      	0x216e	// 216e <vPortFree+0x1a>
    2162:	1053      	lrw      	r2, 0x12f	// 21ac <vPortFree+0x58>
    2164:	1033      	lrw      	r1, 0x26fa	// 21b0 <vPortFree+0x5c>
    2166:	1014      	lrw      	r0, 0x26e4	// 21b4 <vPortFree+0x60>
    2168:	e3fff088 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    216c:	0400      	br      	0x216c	// 216c <vPortFree+0x18>
        configASSERT( pxLink->pxNextFreeBlock == NULL );
    216e:	9440      	ld.w      	r2, (r4, 0x0)
    2170:	3a40      	cmpnei      	r2, 0
    2172:	0c08      	bf      	0x2182	// 2182 <vPortFree+0x2e>
    2174:	3298      	movi      	r2, 152
    2176:	4241      	lsli      	r2, r2, 1
    2178:	102e      	lrw      	r1, 0x26fa	// 21b0 <vPortFree+0x5c>
    217a:	100f      	lrw      	r0, 0x26e4	// 21b4 <vPortFree+0x60>
    217c:	e3fff07e 	bsr      	0x278	// 278 <__cskyvprintfprintf>
    2180:	0400      	br      	0x2180	// 2180 <vPortFree+0x2c>
                heapFREE_BLOCK( pxLink );
    2182:	4361      	lsli      	r3, r3, 1
    2184:	4b61      	lsri      	r3, r3, 1
                    xFreeBytesRemaining += pxLink->xBlockSize;
    2186:	10ad      	lrw      	r5, 0x20000de4	// 21b8 <vPortFree+0x64>
                heapFREE_BLOCK( pxLink );
    2188:	b461      	st.w      	r3, (r4, 0x4)
                vTaskSuspendAll();
    218a:	e3fffd6b 	bsr      	0x1c60	// 1c60 <vTaskSuspendAll>
                    xFreeBytesRemaining += pxLink->xBlockSize;
    218e:	9540      	ld.w      	r2, (r5, 0x0)
    2190:	9461      	ld.w      	r3, (r4, 0x4)
    2192:	60c8      	addu      	r3, r2
                    prvInsertBlockIntoFreeList( ( ( BlockLink_t * ) pxLink ) );
    2194:	6c13      	mov      	r0, r4
                    xFreeBytesRemaining += pxLink->xBlockSize;
    2196:	b560      	st.w      	r3, (r5, 0x0)
                    prvInsertBlockIntoFreeList( ( ( BlockLink_t * ) pxLink ) );
    2198:	e3ffff28 	bsr      	0x1fe8	// 1fe8 <prvInsertBlockIntoFreeList>
                    xNumberOfSuccessfulFrees++;
    219c:	9562      	ld.w      	r3, (r5, 0x8)
    219e:	2300      	addi      	r3, 1
    21a0:	b562      	st.w      	r3, (r5, 0x8)
    21a2:	2507      	addi      	r5, 8
                ( void ) xTaskResumeAll();
    21a4:	e3fffe06 	bsr      	0x1db0	// 1db0 <xTaskResumeAll>
}
    21a8:	1492      	pop      	r4-r5, r15
    21aa:	0000      	bkpt
    21ac:	0000012f 	.long	0x0000012f
    21b0:	000026fa 	.long	0x000026fa
    21b4:	000026e4 	.long	0x000026e4
    21b8:	20000de4 	.long	0x20000de4

Disassembly of section .text.pxPortInitialiseStack:

000021bc <pxPortInitialiseStack>:
{
    StackType_t *stk  = NULL;

    stk = pxTopOfStack;

    *(--stk)  = (uint32_t)pxCode;            /* Entry Point                                         */
    21bc:	586f      	subi      	r3, r0, 4
    21be:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0xE0000140L;       /* PSR                                                 */
    21c0:	587f      	subi      	r3, r0, 8
    21c2:	103d      	lrw      	r1, 0xe0000140	// 2234 <pxPortInitialiseStack+0x78>
    21c4:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0xFFFFFFFEL;       /* R15 (LR) (init value will cause fault if ever used) */
    21c6:	3100      	movi      	r1, 0
    21c8:	290b      	subi      	r1, 12
    21ca:	3300      	movi      	r3, 0
    21cc:	6040      	addu      	r1, r0
    21ce:	2b01      	subi      	r3, 2
    21d0:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x13131313L;       /* R13                                                 */
    21d2:	3300      	movi      	r3, 0
    21d4:	2b0f      	subi      	r3, 16
    21d6:	60c0      	addu      	r3, r0
    21d8:	1038      	lrw      	r1, 0x13131313	// 2238 <pxPortInitialiseStack+0x7c>
    21da:	b320      	st.w      	r1, (r3, 0x0)
//    *(--stk)  = (uint32_t)0x12121212L;       /* R12                                                 */
//    *(--stk)  = (uint32_t)0x11111111L;       /* R11                                                 */
//    *(--stk)  = (uint32_t)0x10101010L;       /* R10                                                 */
//    *(--stk)  = (uint32_t)0x09090909L;       /* R9                                                  */
    *(--stk)  = (uint32_t)0x08080808L;       /* R8                                                  */
    21dc:	3300      	movi      	r3, 0
    21de:	2b13      	subi      	r3, 20
    21e0:	60c0      	addu      	r3, r0
    21e2:	1037      	lrw      	r1, 0x8080808	// 223c <pxPortInitialiseStack+0x80>
    21e4:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x07070707L;       /* R7                                                  */
    21e6:	3300      	movi      	r3, 0
    21e8:	2b17      	subi      	r3, 24
    21ea:	60c0      	addu      	r3, r0
    21ec:	1035      	lrw      	r1, 0x7070707	// 2240 <pxPortInitialiseStack+0x84>
    21ee:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x06060606L;       /* R6                                                  */
    21f0:	3300      	movi      	r3, 0
    21f2:	2b1b      	subi      	r3, 28
    21f4:	60c0      	addu      	r3, r0
    21f6:	1034      	lrw      	r1, 0x6060606	// 2244 <pxPortInitialiseStack+0x88>
    21f8:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x05050505L;       /* R5                                                  */
    21fa:	3300      	movi      	r3, 0
    21fc:	2b1f      	subi      	r3, 32
    21fe:	60c0      	addu      	r3, r0
    2200:	1032      	lrw      	r1, 0x5050505	// 2248 <pxPortInitialiseStack+0x8c>
    2202:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x04040404L;       /* R4                                                  */
    2204:	3300      	movi      	r3, 0
    2206:	2b23      	subi      	r3, 36
    2208:	60c0      	addu      	r3, r0
    220a:	1031      	lrw      	r1, 0x4040404	// 224c <pxPortInitialiseStack+0x90>
    220c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x03030303L;       /* R3                                                  */
    220e:	3300      	movi      	r3, 0
    2210:	2b27      	subi      	r3, 40
    2212:	60c0      	addu      	r3, r0
    2214:	102f      	lrw      	r1, 0x3030303	// 2250 <pxPortInitialiseStack+0x94>
    2216:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x02020202L;       /* R2                                                  */
    2218:	3300      	movi      	r3, 0
    221a:	2b2b      	subi      	r3, 44
    221c:	60c0      	addu      	r3, r0
    221e:	102e      	lrw      	r1, 0x2020202	// 2254 <pxPortInitialiseStack+0x98>
    2220:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x01010101L;       /* R1                                                  */
    2222:	3300      	movi      	r3, 0
    2224:	2b2f      	subi      	r3, 48
    2226:	60c0      	addu      	r3, r0
    2228:	102c      	lrw      	r1, 0x1010101	// 2258 <pxPortInitialiseStack+0x9c>
    *(--stk)  = (uint32_t)pvParameters;      /* R0 : argument                                       */
    222a:	2833      	subi      	r0, 52
    *(--stk)  = (uint32_t)0x01010101L;       /* R1                                                  */
    222c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)pvParameters;      /* R0 : argument                                       */
    222e:	b040      	st.w      	r2, (r0, 0x0)

    return stk;
}
    2230:	783c      	jmp      	r15
    2232:	0000      	bkpt
    2234:	e0000140 	.long	0xe0000140
    2238:	13131313 	.long	0x13131313
    223c:	08080808 	.long	0x08080808
    2240:	07070707 	.long	0x07070707
    2244:	06060606 	.long	0x06060606
    2248:	05050505 	.long	0x05050505
    224c:	04040404 	.long	0x04040404
    2250:	03030303 	.long	0x03030303
    2254:	02020202 	.long	0x02020202
    2258:	01010101 	.long	0x01010101

Disassembly of section .text.xPortStartScheduler:

0000225c <xPortStartScheduler>:

BaseType_t xPortStartScheduler( void )
{
    225c:	14d0      	push      	r15
    ulCriticalNesting = 0UL;
    225e:	3200      	movi      	r2, 0
    2260:	1063      	lrw      	r3, 0x2000006c	// 226c <xPortStartScheduler+0x10>
    2262:	b340      	st.w      	r2, (r3, 0x0)

    vPortStartTask();
    2264:	e3ffefa8 	bsr      	0x1b4	// 1b4 <vPortStartTask>

    return pdFALSE;
}
    2268:	3000      	movi      	r0, 0
    226a:	1490      	pop      	r15
    226c:	2000006c 	.long	0x2000006c

Disassembly of section .text.vPortEnterCritical:

00002270 <vPortEnterCritical>:
    2270:	c0807020 	psrclr      	ie
}

void vPortEnterCritical( void )
{
    portDISABLE_INTERRUPTS();
    ulCriticalNesting ++;
    2274:	1043      	lrw      	r2, 0x2000006c	// 2280 <vPortEnterCritical+0x10>
    2276:	9260      	ld.w      	r3, (r2, 0x0)
    2278:	2300      	addi      	r3, 1
    227a:	b260      	st.w      	r3, (r2, 0x0)
}
    227c:	783c      	jmp      	r15
    227e:	0000      	bkpt
    2280:	2000006c 	.long	0x2000006c

Disassembly of section .text.vPortExitCritical:

00002284 <vPortExitCritical>:

void vPortExitCritical( void )
{
    2284:	14d0      	push      	r15
    if (ulCriticalNesting == 0) {
    2286:	104b      	lrw      	r2, 0x2000006c	// 22b0 <vPortExitCritical+0x2c>
    2288:	9260      	ld.w      	r3, (r2, 0x0)
    228a:	3b40      	cmpnei      	r3, 0
    228c:	0802      	bt      	0x2290	// 2290 <vPortExitCritical+0xc>
    228e:	0400      	br      	0x228e	// 228e <vPortExitCritical+0xa>
        while(1);
    }

    ulCriticalNesting --;
    2290:	2b00      	subi      	r3, 1
    if (ulCriticalNesting == 0)
    2292:	3b40      	cmpnei      	r3, 0
    ulCriticalNesting --;
    2294:	b260      	st.w      	r3, (r2, 0x0)
    if (ulCriticalNesting == 0)
    2296:	080c      	bt      	0x22ae	// 22ae <vPortExitCritical+0x2a>
    __ASM volatile("psrset ie");
    2298:	c0807420 	psrset      	ie
    {
        portENABLE_INTERRUPTS();

        if (pendsvflag)
    229c:	1046      	lrw      	r2, 0x20000df0	// 22b4 <vPortExitCritical+0x30>
    229e:	9220      	ld.w      	r1, (r2, 0x0)
    22a0:	3940      	cmpnei      	r1, 0
    22a2:	0c06      	bf      	0x22ae	// 22ae <vPortExitCritical+0x2a>
        {
            pendsvflag = 0;
    22a4:	b260      	st.w      	r3, (r2, 0x0)
            portYIELD();
    22a6:	e3ffefa4 	bsr      	0x1ee	// 1ee <vPortYield>
    22aa:	6c03      	mov      	r0, r0
    22ac:	6c03      	mov      	r0, r0
        }
    }
}
    22ae:	1490      	pop      	r15
    22b0:	2000006c 	.long	0x2000006c
    22b4:	20000df0 	.long	0x20000df0

Disassembly of section .text.xPortSysTickHandler:

000022b8 <xPortSysTickHandler>:
}

#else

void xPortSysTickHandler( void )
{
    22b8:	14d1      	push      	r4, r15
 */
__ALWAYS_STATIC_INLINE uint32_t __get_PSR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, psr" : "=r"(result));
    22ba:	c0006024 	mfcr      	r4, cr<0, 0>
    __ASM volatile("psrclr ie");
    22be:	c0807020 	psrclr      	ie
    portLONG ulDummy;

    ulDummy = portSET_INTERRUPT_MASK_FROM_ISR();
    {
        if (xTaskIncrementTick() != pdFALSE)
    22c2:	e3fffcd7 	bsr      	0x1c70	// 1c70 <xTaskIncrementTick>
    22c6:	3840      	cmpnei      	r0, 0
    22c8:	0c09      	bf      	0x22da	// 22da <xPortSysTickHandler+0x22>
        {
            portYIELD_FROM_ISR(pdTRUE);
    22ca:	1068      	lrw      	r3, 0x2000006c	// 22e8 <xPortSysTickHandler+0x30>
    22cc:	9360      	ld.w      	r3, (r3, 0x0)
    22ce:	3b40      	cmpnei      	r3, 0
    22d0:	0808      	bt      	0x22e0	// 22e0 <xPortSysTickHandler+0x28>
    22d2:	e3ffef8e 	bsr      	0x1ee	// 1ee <vPortYield>
    22d6:	6c03      	mov      	r0, r0
    22d8:	6c03      	mov      	r0, r0
    return flags;
}

static inline void RestoreLocalPSR (portLONG newMask)
{
    __asm__ __volatile__(
    22da:	c0046420 	mtcr      	r4, cr<0, 0>
        }
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( ulDummy );
}
    22de:	1491      	pop      	r4, r15
            portYIELD_FROM_ISR(pdTRUE);
    22e0:	3201      	movi      	r2, 1
    22e2:	1063      	lrw      	r3, 0x20000df0	// 22ec <xPortSysTickHandler+0x34>
    22e4:	b340      	st.w      	r2, (r3, 0x0)
    22e6:	07f8      	br      	0x22d6	// 22d6 <xPortSysTickHandler+0x1e>
    22e8:	2000006c 	.long	0x2000006c
    22ec:	20000df0 	.long	0x20000df0

Disassembly of section .text.vApplicationStackOverflowHook:

000022f0 <vApplicationStackOverflowHook>:
}


__attribute__((weak)) void vApplicationStackOverflowHook( TaskHandle_t xTask,
                                        char * pcTaskName )
{
    22f0:	0400      	br      	0x22f0	// 22f0 <vApplicationStackOverflowHook>

Disassembly of section .text.vApplicationMallocFailedHook:

000022f2 <vApplicationMallocFailedHook>:
    for(;;);
}

__attribute__((weak)) void vApplicationMallocFailedHook( void )
{
    22f2:	0400      	br      	0x22f2	// 22f2 <vApplicationMallocFailedHook>

Disassembly of section .text.std_clk_calib_source:

000022f4 <std_clk_calib_source>:
    22f4:	3840      	cmpnei      	r0, 0
    22f6:	1069      	lrw      	r3, 0x20000014	// 2318 <std_clk_calib_source+0x24>
    22f8:	0807      	bt      	0x2306	// 2306 <std_clk_calib_source+0x12>
    22fa:	9360      	ld.w      	r3, (r3, 0x0)
    22fc:	1048      	lrw      	r2, 0xbe9c0005	// 231c <std_clk_calib_source+0x28>
    22fe:	b340      	st.w      	r2, (r3, 0x0)
    2300:	32d8      	movi      	r2, 216
    2302:	b345      	st.w      	r2, (r3, 0x14)
    2304:	0409      	br      	0x2316	// 2316 <std_clk_calib_source+0x22>
    2306:	3841      	cmpnei      	r0, 1
    2308:	0bf9      	bt      	0x22fa	// 22fa <std_clk_calib_source+0x6>
    230a:	9340      	ld.w      	r2, (r3, 0x0)
    230c:	1065      	lrw      	r3, 0xbe9c000d	// 2320 <std_clk_calib_source+0x2c>
    230e:	b260      	st.w      	r3, (r2, 0x0)
    2310:	3383      	movi      	r3, 131
    2312:	4361      	lsli      	r3, r3, 1
    2314:	b265      	st.w      	r3, (r2, 0x14)
    2316:	783c      	jmp      	r15
    2318:	20000014 	.long	0x20000014
    231c:	be9c0005 	.long	0xbe9c0005
    2320:	be9c000d 	.long	0xbe9c000d

Disassembly of section .text.std_clk_calib:

00002324 <std_clk_calib>:
    2324:	14d4      	push      	r4-r7, r15
    2326:	142d      	subi      	r14, r14, 52
    2328:	3201      	movi      	r2, 1
    232a:	03cd      	lrw      	r6, 0x2000005c	// 2570 <std_clk_calib+0x24c>
    232c:	6cc3      	mov      	r3, r0
    232e:	dc4e000a 	st.b      	r2, (r14, 0xa)
    2332:	9640      	ld.w      	r2, (r6, 0x0)
    2334:	9247      	ld.w      	r2, (r2, 0x1c)
    2336:	7488      	zextb      	r2, r2
    2338:	dc4e0009 	st.b      	r2, (r14, 0x9)
    233c:	d84e0009 	ld.b      	r2, (r14, 0x9)
    2340:	3a40      	cmpnei      	r2, 0
    2342:	0c08      	bf      	0x2352	// 2352 <std_clk_calib+0x2e>
    2344:	d84e0009 	ld.b      	r2, (r14, 0x9)
    2348:	3a42      	cmpnei      	r2, 2
    234a:	0c04      	bf      	0x2352	// 2352 <std_clk_calib+0x2e>
    234c:	3000      	movi      	r0, 0
    234e:	140d      	addi      	r14, r14, 52
    2350:	1494      	pop      	r4-r7, r15
    2352:	0396      	lrw      	r4, 0x2000000c	// 2574 <std_clk_calib+0x250>
    2354:	3209      	movi      	r2, 9
    2356:	9400      	ld.w      	r0, (r4, 0x0)
    2358:	3b40      	cmpnei      	r3, 0
    235a:	b041      	st.w      	r2, (r0, 0x4)
    235c:	0858      	bt      	0x240c	// 240c <std_clk_calib+0xe8>
    235e:	3307      	movi      	r3, 7
    2360:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2364:	037a      	lrw      	r3, 0x2dc6c00	// 2578 <std_clk_calib+0x254>
    2366:	b863      	st.w      	r3, (r14, 0xc)
    2368:	3380      	movi      	r3, 128
    236a:	4362      	lsli      	r3, r3, 2
    236c:	b867      	st.w      	r3, (r14, 0x1c)
    236e:	d86e000b 	ld.b      	r3, (r14, 0xb)
    2372:	74cc      	zextb      	r3, r3
    2374:	b062      	st.w      	r3, (r0, 0x8)
    2376:	037d      	lrw      	r3, 0xffff	// 257c <std_clk_calib+0x258>
    2378:	b063      	st.w      	r3, (r0, 0xc)
    237a:	3201      	movi      	r2, 1
    237c:	3101      	movi      	r1, 1
    237e:	03be      	lrw      	r5, 0x20000014	// 2580 <std_clk_calib+0x25c>
    2380:	e3fff363 	bsr      	0xa46	// a46 <BT_ConfigInterrupt_CMD>
    2384:	95e0      	ld.w      	r7, (r5, 0x0)
    2386:	3300      	movi      	r3, 0
    2388:	135f      	lrw      	r2, 0x30010	// 2584 <std_clk_calib+0x260>
    238a:	b762      	st.w      	r3, (r7, 0x8)
    238c:	b743      	st.w      	r2, (r7, 0xc)
    238e:	974f      	ld.w      	r2, (r7, 0x3c)
    2390:	3aa2      	bseti      	r2, 2
    2392:	b74f      	st.w      	r2, (r7, 0x3c)
    2394:	9803      	ld.w      	r0, (r14, 0xc)
    2396:	d82e000b 	ld.b      	r1, (r14, 0xb)
    239a:	327d      	movi      	r2, 125
    239c:	2100      	addi      	r1, 1
    239e:	7c48      	mult      	r1, r2
    23a0:	b861      	st.w      	r3, (r14, 0x4)
    23a2:	e3fff9fb 	bsr      	0x1798	// 1798 <__udivsi3>
    23a6:	b804      	st.w      	r0, (r14, 0x10)
    23a8:	32fa      	movi      	r2, 250
    23aa:	9824      	ld.w      	r1, (r14, 0x10)
    23ac:	4242      	lsli      	r2, r2, 2
    23ae:	6448      	cmphs      	r2, r1
    23b0:	0bce      	bt      	0x234c	// 234c <std_clk_calib+0x28>
    23b2:	9844      	ld.w      	r2, (r14, 0x10)
    23b4:	3178      	movi      	r1, 120
    23b6:	9804      	ld.w      	r0, (r14, 0x10)
    23b8:	b840      	st.w      	r2, (r14, 0x0)
    23ba:	e3fff9ef 	bsr      	0x1798	// 1798 <__udivsi3>
    23be:	9840      	ld.w      	r2, (r14, 0x0)
    23c0:	6082      	subu      	r2, r0
    23c2:	b845      	st.w      	r2, (r14, 0x14)
    23c4:	9804      	ld.w      	r0, (r14, 0x10)
    23c6:	3178      	movi      	r1, 120
    23c8:	9844      	ld.w      	r2, (r14, 0x10)
    23ca:	b840      	st.w      	r2, (r14, 0x0)
    23cc:	e3fff9e6 	bsr      	0x1798	// 1798 <__udivsi3>
    23d0:	9840      	ld.w      	r2, (r14, 0x0)
    23d2:	6008      	addu      	r0, r2
    23d4:	b806      	st.w      	r0, (r14, 0x18)
    23d6:	c0807020 	psrclr      	ie
    23da:	9640      	ld.w      	r2, (r6, 0x0)
    23dc:	9254      	ld.w      	r2, (r2, 0x50)
    23de:	b848      	st.w      	r2, (r14, 0x20)
    23e0:	9861      	ld.w      	r3, (r14, 0x4)
    23e2:	9440      	ld.w      	r2, (r4, 0x0)
    23e4:	b260      	st.w      	r3, (r2, 0x0)
    23e6:	b761      	st.w      	r3, (r7, 0x4)
    23e8:	d86e000a 	ld.b      	r3, (r14, 0xa)
    23ec:	3b40      	cmpnei      	r3, 0
    23ee:	0843      	bt      	0x2474	// 2474 <std_clk_calib+0x150>
    23f0:	9540      	ld.w      	r2, (r5, 0x0)
    23f2:	9261      	ld.w      	r3, (r2, 0x4)
    23f4:	3bac      	bseti      	r3, 12
    23f6:	3bae      	bseti      	r3, 14
    23f8:	b261      	st.w      	r3, (r2, 0x4)
    23fa:	9440      	ld.w      	r2, (r4, 0x0)
    23fc:	9260      	ld.w      	r3, (r2, 0x0)
    23fe:	3bac      	bseti      	r3, 12
    2400:	3bae      	bseti      	r3, 14
    2402:	b260      	st.w      	r3, (r2, 0x0)
    2404:	c1807420 	psrset      	ee, ie
    2408:	3001      	movi      	r0, 1
    240a:	07a2      	br      	0x234e	// 234e <std_clk_calib+0x2a>
    240c:	3b41      	cmpnei      	r3, 1
    240e:	0806      	bt      	0x241a	// 241a <std_clk_calib+0xf6>
    2410:	3303      	movi      	r3, 3
    2412:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2416:	127d      	lrw      	r3, 0x16e3600	// 2588 <std_clk_calib+0x264>
    2418:	07a7      	br      	0x2366	// 2366 <std_clk_calib+0x42>
    241a:	3b42      	cmpnei      	r3, 2
    241c:	0806      	bt      	0x2428	// 2428 <std_clk_calib+0x104>
    241e:	3301      	movi      	r3, 1
    2420:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2424:	127a      	lrw      	r3, 0xb71b00	// 258c <std_clk_calib+0x268>
    2426:	07a0      	br      	0x2366	// 2366 <std_clk_calib+0x42>
    2428:	3b43      	cmpnei      	r3, 3
    242a:	0806      	bt      	0x2436	// 2436 <std_clk_calib+0x112>
    242c:	3300      	movi      	r3, 0
    242e:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2432:	1278      	lrw      	r3, 0x5b8d80	// 2590 <std_clk_calib+0x26c>
    2434:	0799      	br      	0x2366	// 2366 <std_clk_calib+0x42>
    2436:	3b44      	cmpnei      	r3, 4
    2438:	0809      	bt      	0x244a	// 244a <std_clk_calib+0x126>
    243a:	3300      	movi      	r3, 0
    243c:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2440:	1275      	lrw      	r3, 0x54c720	// 2594 <std_clk_calib+0x270>
    2442:	b863      	st.w      	r3, (r14, 0xc)
    2444:	3380      	movi      	r3, 128
    2446:	4369      	lsli      	r3, r3, 9
    2448:	0792      	br      	0x236c	// 236c <std_clk_calib+0x48>
    244a:	3b45      	cmpnei      	r3, 5
    244c:	0806      	bt      	0x2458	// 2458 <std_clk_calib+0x134>
    244e:	3300      	movi      	r3, 0
    2450:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2454:	1271      	lrw      	r3, 0x3ffed0	// 2598 <std_clk_calib+0x274>
    2456:	07f6      	br      	0x2442	// 2442 <std_clk_calib+0x11e>
    2458:	3b46      	cmpnei      	r3, 6
    245a:	0806      	bt      	0x2466	// 2466 <std_clk_calib+0x142>
    245c:	3300      	movi      	r3, 0
    245e:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2462:	126f      	lrw      	r3, 0x1fff68	// 259c <std_clk_calib+0x278>
    2464:	07ef      	br      	0x2442	// 2442 <std_clk_calib+0x11e>
    2466:	3b47      	cmpnei      	r3, 7
    2468:	0b83      	bt      	0x236e	// 236e <std_clk_calib+0x4a>
    246a:	3300      	movi      	r3, 0
    246c:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2470:	126c      	lrw      	r3, 0x1ffb8	// 25a0 <std_clk_calib+0x27c>
    2472:	07e8      	br      	0x2442	// 2442 <std_clk_calib+0x11e>
    2474:	9560      	ld.w      	r3, (r5, 0x0)
    2476:	3101      	movi      	r1, 1
    2478:	9440      	ld.w      	r2, (r4, 0x0)
    247a:	b321      	st.w      	r1, (r3, 0x4)
    247c:	b220      	st.w      	r1, (r2, 0x0)
    247e:	3100      	movi      	r1, 0
    2480:	b327      	st.w      	r1, (r3, 0x1c)
    2482:	3004      	movi      	r0, 4
    2484:	b225      	st.w      	r1, (r2, 0x14)
    2486:	932e      	ld.w      	r1, (r3, 0x38)
    2488:	6840      	and      	r1, r0
    248a:	3940      	cmpnei      	r1, 0
    248c:	0ffd      	bf      	0x2486	// 2486 <std_clk_calib+0x162>
    248e:	9225      	ld.w      	r1, (r2, 0x14)
    2490:	b82a      	st.w      	r1, (r14, 0x28)
    2492:	3100      	movi      	r1, 0
    2494:	b310      	st.w      	r0, (r3, 0x40)
    2496:	b327      	st.w      	r1, (r3, 0x1c)
    2498:	3004      	movi      	r0, 4
    249a:	b225      	st.w      	r1, (r2, 0x14)
    249c:	932e      	ld.w      	r1, (r3, 0x38)
    249e:	6840      	and      	r1, r0
    24a0:	3940      	cmpnei      	r1, 0
    24a2:	0ffd      	bf      	0x249c	// 249c <std_clk_calib+0x178>
    24a4:	9225      	ld.w      	r1, (r2, 0x14)
    24a6:	b82b      	st.w      	r1, (r14, 0x2c)
    24a8:	3100      	movi      	r1, 0
    24aa:	b310      	st.w      	r0, (r3, 0x40)
    24ac:	b327      	st.w      	r1, (r3, 0x1c)
    24ae:	3004      	movi      	r0, 4
    24b0:	b225      	st.w      	r1, (r2, 0x14)
    24b2:	932e      	ld.w      	r1, (r3, 0x38)
    24b4:	6840      	and      	r1, r0
    24b6:	3940      	cmpnei      	r1, 0
    24b8:	0ffd      	bf      	0x24b2	// 24b2 <std_clk_calib+0x18e>
    24ba:	9225      	ld.w      	r1, (r2, 0x14)
    24bc:	b82c      	st.w      	r1, (r14, 0x30)
    24be:	b310      	st.w      	r0, (r3, 0x40)
    24c0:	982b      	ld.w      	r1, (r14, 0x2c)
    24c2:	980c      	ld.w      	r0, (r14, 0x30)
    24c4:	6040      	addu      	r1, r0
    24c6:	b829      	st.w      	r1, (r14, 0x24)
    24c8:	9829      	ld.w      	r1, (r14, 0x24)
    24ca:	4921      	lsri      	r1, r1, 1
    24cc:	b829      	st.w      	r1, (r14, 0x24)
    24ce:	3100      	movi      	r1, 0
    24d0:	b321      	st.w      	r1, (r3, 0x4)
    24d2:	b220      	st.w      	r1, (r2, 0x0)
    24d4:	b327      	st.w      	r1, (r3, 0x1c)
    24d6:	b225      	st.w      	r1, (r2, 0x14)
    24d8:	d86e0009 	ld.b      	r3, (r14, 0x9)
    24dc:	3b42      	cmpnei      	r3, 2
    24de:	9849      	ld.w      	r2, (r14, 0x24)
    24e0:	082c      	bt      	0x2538	// 2538 <std_clk_calib+0x214>
    24e2:	1171      	lrw      	r3, 0x7ff	// 25a4 <std_clk_calib+0x280>
    24e4:	648c      	cmphs      	r3, r2
    24e6:	0c03      	bf      	0x24ec	// 24ec <std_clk_calib+0x1c8>
    24e8:	3300      	movi      	r3, 0
    24ea:	040f      	br      	0x2508	// 2508 <std_clk_calib+0x1e4>
    24ec:	9849      	ld.w      	r2, (r14, 0x24)
    24ee:	9866      	ld.w      	r3, (r14, 0x18)
    24f0:	648c      	cmphs      	r3, r2
    24f2:	080e      	bt      	0x250e	// 250e <std_clk_calib+0x1ea>
    24f4:	9868      	ld.w      	r3, (r14, 0x20)
    24f6:	9847      	ld.w      	r2, (r14, 0x1c)
    24f8:	60ca      	subu      	r3, r2
    24fa:	b868      	st.w      	r3, (r14, 0x20)
    24fc:	32fe      	movi      	r2, 254
    24fe:	9868      	ld.w      	r3, (r14, 0x20)
    2500:	4248      	lsli      	r2, r2, 8
    2502:	68c8      	and      	r3, r2
    2504:	3b40      	cmpnei      	r3, 0
    2506:	0812      	bt      	0x252a	// 252a <std_clk_calib+0x206>
    2508:	dc6e000a 	st.b      	r3, (r14, 0xa)
    250c:	0720      	br      	0x234c	// 234c <std_clk_calib+0x28>
    250e:	9849      	ld.w      	r2, (r14, 0x24)
    2510:	9865      	ld.w      	r3, (r14, 0x14)
    2512:	64c8      	cmphs      	r2, r3
    2514:	0829      	bt      	0x2566	// 2566 <std_clk_calib+0x242>
    2516:	9868      	ld.w      	r3, (r14, 0x20)
    2518:	9847      	ld.w      	r2, (r14, 0x1c)
    251a:	60c8      	addu      	r3, r2
    251c:	b868      	st.w      	r3, (r14, 0x20)
    251e:	33fe      	movi      	r3, 254
    2520:	9848      	ld.w      	r2, (r14, 0x20)
    2522:	4368      	lsli      	r3, r3, 8
    2524:	688c      	and      	r2, r3
    2526:	64ca      	cmpne      	r2, r3
    2528:	0fe0      	bf      	0x24e8	// 24e8 <std_clk_calib+0x1c4>
    252a:	9660      	ld.w      	r3, (r6, 0x0)
    252c:	9848      	ld.w      	r2, (r14, 0x20)
    252e:	b354      	st.w      	r2, (r3, 0x50)
    2530:	3001      	movi      	r0, 1
    2532:	e3fff329 	bsr      	0xb84	// b84 <delay_nms>
    2536:	0759      	br      	0x23e8	// 23e8 <std_clk_calib+0xc4>
    2538:	9866      	ld.w      	r3, (r14, 0x18)
    253a:	648c      	cmphs      	r3, r2
    253c:	0809      	bt      	0x254e	// 254e <std_clk_calib+0x22a>
    253e:	9868      	ld.w      	r3, (r14, 0x20)
    2540:	9847      	ld.w      	r2, (r14, 0x1c)
    2542:	60ca      	subu      	r3, r2
    2544:	b868      	st.w      	r3, (r14, 0x20)
    2546:	32ff      	movi      	r2, 255
    2548:	9868      	ld.w      	r3, (r14, 0x20)
    254a:	4250      	lsli      	r2, r2, 16
    254c:	07db      	br      	0x2502	// 2502 <std_clk_calib+0x1de>
    254e:	9849      	ld.w      	r2, (r14, 0x24)
    2550:	9865      	ld.w      	r3, (r14, 0x14)
    2552:	64c8      	cmphs      	r2, r3
    2554:	0809      	bt      	0x2566	// 2566 <std_clk_calib+0x242>
    2556:	9868      	ld.w      	r3, (r14, 0x20)
    2558:	9847      	ld.w      	r2, (r14, 0x1c)
    255a:	60c8      	addu      	r3, r2
    255c:	b868      	st.w      	r3, (r14, 0x20)
    255e:	33ff      	movi      	r3, 255
    2560:	9848      	ld.w      	r2, (r14, 0x20)
    2562:	4370      	lsli      	r3, r3, 16
    2564:	07e0      	br      	0x2524	// 2524 <std_clk_calib+0x200>
    2566:	3300      	movi      	r3, 0
    2568:	dc6e000a 	st.b      	r3, (r14, 0xa)
    256c:	07e2      	br      	0x2530	// 2530 <std_clk_calib+0x20c>
    256e:	0000      	bkpt
    2570:	2000005c 	.long	0x2000005c
    2574:	2000000c 	.long	0x2000000c
    2578:	02dc6c00 	.long	0x02dc6c00
    257c:	0000ffff 	.long	0x0000ffff
    2580:	20000014 	.long	0x20000014
    2584:	00030010 	.long	0x00030010
    2588:	016e3600 	.long	0x016e3600
    258c:	00b71b00 	.long	0x00b71b00
    2590:	005b8d80 	.long	0x005b8d80
    2594:	0054c720 	.long	0x0054c720
    2598:	003ffed0 	.long	0x003ffed0
    259c:	001fff68 	.long	0x001fff68
    25a0:	0001ffb8 	.long	0x0001ffb8
    25a4:	000007ff 	.long	0x000007ff
