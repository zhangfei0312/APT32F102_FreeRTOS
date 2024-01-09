.PHONY: clean All Project_Title Project_Build

All: Project_Title Project_Build

Project_Title:
	@echo "----------Building project:[ apt32f102 - BuildSet ]----------"

Project_Build:
	@make -r -f apt32f102.mk -j 4 -C  D:/2021-04/APT32F102/LIB/APT32F102x_StdPeriph_Lib_V1_17_NoTK/Source 


clean:
	@echo "----------Cleaning project:[ apt32f102 - BuildSet ]----------"

