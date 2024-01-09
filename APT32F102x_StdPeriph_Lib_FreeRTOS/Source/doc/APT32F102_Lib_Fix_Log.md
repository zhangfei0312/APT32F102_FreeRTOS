#20180129 V1.00  初版

#20180131 V1.02：
	           1.apt32f102_i2c.h，修改I2C_Slave_CONFIG(); PA0.1定义错误
	           2.apt32f102_i2c.c，修改void I2C_Slave_Receive(void)
	           3.apt32f102_interrupt.c，修改LPTIntHandler();
	           4.syscon.h，修改“SYSCON_SCLKCR_RST      	((CSP_REGISTER_T)0xD22Dul<<16)”
	           5.syscon.C， SYSCON_RST_VALUE(void)	；
	           5.EPT.C &EPT.H 修改
	           6.syscon.h，修改  INTDET_POL_X_TypeDef枚举;
	           7.apt32f102_initial.c ，修改EPT0_Config()；
	           8.apt32f102_interrupt.c，修改EPT0IntHandler();
	           9.修改了CRC输入函数，分32/16/8bit数据输入
	           10.增加了GPT同步及触发事件函数
               11.增加了WWDT初始化函数
#20201124 V1.02：	 
	           1.修改UART_IO_Init();  PA0.15 PA0.14初始化
	           2.删除SYSCON_CONFIG()；"EVTRG function 程序屏蔽"
	           3.删除了tkey相关残留的程序
#20201124 V1.03：
				1.增加了touch key库文件
#20201202 V1.04：
				1.修改了SYSCON_General_CMD();函数，fix 使用外部晶振后调试口被占用的问题
				2.修改了BT PB0.0配置错误的问题
				3.修改了外部中断向量EXI9错误的问题
				4.修改了外部中断向量EXI4to9IntHandle，EXI10to15IntHandler
				5.修改了GPT.h中PB0.1定义错误的问题
				6.增加了IFC读ReadDataArry_U8函数，读数据时字节长度可不按4的倍数
				7.修改了spi.c中PA0.8配置错误的问题
#20200121 V1.05：
				1.修改了ADC初始化中的错误
				2.修改了apt32f102_interrupt.c中EXI15的错误
				3.修改了BT.c中BT0和BT1混淆的问题
				4.修复了使用触摸FVR参考时，调用ADC造成触摸失灵的问题
				5.增加了tkey的睡眠睡醒功能
				6.修改了1.04 .s文件中外部中断定义错误的问题
#20210601 V1.06：
				1.修改了COUNTERA IO配置错误
				2.修改了BT中IO配置错误
				3.修改了EPT PB0.5 CHAY配置错误
				4.修改了EPT 外部触发端口使能配置相反的错误
				5.增加了I2C做从机时配置i2c中断优先级为最高的配置
				6.修改了调用GPIO_DeInit后调试口被修改的问题
				7.修复了TK在FVR模式以外开启TCH3后触摸初始化卡死的问题
				8.修改了TK参数配置中，使能TK的方式，采用更直观的方式
				9.修改了TK参数配置中，EC默认电压为3V，FVR参考默认2.048V，防止客户使用3.3V工作电压时一开始TK无法工作的问题
#20210621 V1.08：
				1.解决了触摸长时间睡眠后，唤醒失败的问题（功耗增加10uA）
				2.修改了注释为英文
				3.修改了不同版本的触摸库文件方便不同应用
#20210801 V1.09：
				1.修改了syscon.c，解决了系统主频在切换时偶尔遇到的时钟卡死问题
				2.增加了IO remap功能函数
				3.修正1_09和1_09M这两个版本.a库，多键模式按键误清零的问题
				4.删除之前版本initial.c中对EVTRG function的配置，以解决因此产生的某些情况下睡眠后功耗异常的问题
#20210825 V1.10：
				1.修改了SPI做从机时，PA0.14/PA0.15配置错误的问题
				2.修改了RTC中参数的定义为volatile，解决某些意外情况下进位时小时位出现错误值的问题
				3.增加了BT中控制波形stop时输出高/低电平函数
				4.修改gpio.c中配置外部组扩展配置时PB0组IO无法配置的问题,增加了EXI16~19的中断函数
				5.syscon中加入clo输出配置函数
				6.在syscon.c中增加Set_INT_Priority();函数，可直接配置中断优先级
				7.在fwlib文件夹增加了iostring.c文件
				8.修改库文件包名称为APT32F102x_StdPeriph_Lib
#20211101 V1.11：
				1.修改了SIO做RX时，配置错误的问题
				2.增加了debug print功能
				3.增加了芯片svc文件，方便查看芯片register内容
				4.解决了TK和ADC选择不同参考源时造成的互相影响的问题，修改了ADC.c和TK库文件
				5.修改了EPT中EVTRG配置移位错误
#20211122 V1.12：
				1.修改了GPT 同步触发模式的配置定义错误
				2.增加了频率校准函数std_clk_calib();支持HFOSC IMOSC频率软件校准；
				3.lib_102ClkCalib_1_03，修改了1.02的校准库在与触摸低功耗共同使用时，会造成睡眠功耗偏大到1.2mA的问题
#20211213 V1.13：
				1.修改了在使用ADC时，因为配置ADC序列和序列个数不一致而可能引起的ADC卡死问题
				2.修改了UART初始化使能函数，解决了因配置顺序导致INT_TX_DONE中断无法进入的问题
				3.修改了IFC_MR中不同时钟频率下WAIT和SPEED默认值
				4.解除了TK使用FVR模式参考电压固定选择4.096V的限制，可选择2.048V"抗干扰能力低于4.096V"
#20220825 V1.15：
				1.修改去除部分编译中出现的警告
				2.修改触摸库函数，增加因异常情况overflow后造成的按键扫描卡住问题
				3.修改部分代码中注释的书写问题
				4.修改了uart初始化中奇偶校验错误的问题
#20230325 V1.16：
				1.增加了支持slider和wheel的触摸库文件lib_102TKey_Slider_1_00.a
				2.apt32f102_tkey_parameter.c增加了slider和wheel相关参数配置
				3.apt32f102_tkey.h增加了slider和wheel相关变量
#20230830 V1.17：
				1.增加了slider触摸库中对双滑条的支持
				2.修改了rtc.c中12点时PM的判断
				3.修改syscon.c中的默认IFC速度与最新datasheet相匹配
				4.更新频率校准库至1.04，支持使用外部32.768K进行频率校准
				5.更新了ifc.c文件，修改了32位数据读写的bug
				6.增加触摸库中对于扫描溢出后自动调节ICON的功能开关
				7.新增touch库文件中跳频模式下频段异常时的强制校准机制
				8.增加了touch库中主循环扫描低功耗唤醒支持