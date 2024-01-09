/*
  ******************************************************************************
  * @file    apt32f102_iostring.c
  * @author  APT AE Team
  * @version V1.00
  * @date    2020/05/21
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
/******************************************************************************
* Include Files
******************************************************************************/
#include "apt32f102.h"
#include "apt32f102_uart.h"
#include "stdarg.h"
#include "stddef.h"
#include "stdio.h"
/******************************************************************************
* Main code
******************************************************************************/
void __putchar__ (char s) 
{
//	UARTTxByte(UART0,s);		
	UARTTxByte(UART1,s);
}

char *myitoa(int value, int* string, int radix)
{

		int tmp[33];
		int* tp = tmp;
		int i;
		unsigned v;
		int sign;
		int* sp;
		
		if (radix > 36 || radix <= 1)
		{
			return 0;
		}
		
		sign = (radix == 10 && value < 0);
		if (sign)
		v = -value;
		else
		v = (unsigned)value;
		while (v || tp == tmp)
		{
			i = v % radix;
			v = v / radix;
			if (i < 10) {
			*tp++ = i+'0';
			
			} else {
			*tp++ = i + 'a' - 10;
			
			}
					
		}
		
		sp = string;
		
		if (sign)
		*sp++ = '-';
		while (tp > tmp)
		*sp++ = *--tp;
		*sp = 0;
		return string;
}


void my_printf(const char *fmt, ...)
{

//    const char *s;
	const int *s;
    int d;
    //char ch, *pbuf, buf[16];
	char ch, *pbuf;
	int buf[16];
    va_list ap;
    va_start(ap, fmt);
    while (*fmt) {
        if (*fmt != '%') {
              __putchar__(*fmt++);
            continue;
        }
        switch (*++fmt) {
            case 's':
                s = va_arg(ap, const char *);
                for ( ; *s; s++) {
                 __putchar__(*s);
                }
                break;
            case 'd':
                d = va_arg(ap, int);
                myitoa(d, buf, 10);
                for (s = buf; *s; s++) {
                 __putchar__(*s);
                }
                break;
                
            case 'x':
            case 'X':
                d = va_arg(ap, int);
                myitoa(d, buf, 16);
                for (s = buf; *s; s++) {
                 __putchar__(*s);
                }
                break;                
            // Add other specifiers here...
            case 'c':
            case 'C':
            	ch = (unsigned char)va_arg(ap, int);
        	    pbuf = &ch;
            	__putchar__(*pbuf);
                break;
            default:  
                __putchar__(*fmt);
                break;
        }
        fmt++;
    }
    va_end(ap);
}

