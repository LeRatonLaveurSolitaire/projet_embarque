################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_fatfs.c \
../Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_posix.c \
../Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_stdio.c \
../Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_win32.c 

OBJS += \
./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_fatfs.o \
./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_posix.o \
./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_stdio.o \
./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_win32.o 

C_DEPS += \
./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_fatfs.d \
./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_posix.d \
./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_stdio.d \
./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_win32.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/extra/libs/fsdrv/%.o Drivers/lvgl/src/extra/libs/fsdrv/%.su Drivers/lvgl/src/extra/libs/fsdrv/%.cyclo: ../Drivers/lvgl/src/extra/libs/fsdrv/%.c Drivers/lvgl/src/extra/libs/fsdrv/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl/src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-extra-2f-libs-2f-fsdrv

clean-Drivers-2f-lvgl-2f-src-2f-extra-2f-libs-2f-fsdrv:
	-$(RM) ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_fatfs.cyclo ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_fatfs.d ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_fatfs.o ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_fatfs.su ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_posix.cyclo ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_posix.d ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_posix.o ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_posix.su ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_stdio.cyclo ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_stdio.d ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_stdio.o ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_stdio.su ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_win32.cyclo ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_win32.d ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_win32.o ./Drivers/lvgl/src/extra/libs/fsdrv/lv_fs_win32.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-extra-2f-libs-2f-fsdrv

