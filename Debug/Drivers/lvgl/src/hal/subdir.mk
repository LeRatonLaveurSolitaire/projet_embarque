################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/hal/lv_hal_disp.c \
../Drivers/lvgl/src/hal/lv_hal_indev.c \
../Drivers/lvgl/src/hal/lv_hal_tick.c 

OBJS += \
./Drivers/lvgl/src/hal/lv_hal_disp.o \
./Drivers/lvgl/src/hal/lv_hal_indev.o \
./Drivers/lvgl/src/hal/lv_hal_tick.o 

C_DEPS += \
./Drivers/lvgl/src/hal/lv_hal_disp.d \
./Drivers/lvgl/src/hal/lv_hal_indev.d \
./Drivers/lvgl/src/hal/lv_hal_tick.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/hal/%.o Drivers/lvgl/src/hal/%.su Drivers/lvgl/src/hal/%.cyclo: ../Drivers/lvgl/src/hal/%.c Drivers/lvgl/src/hal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl/src" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl/touchpad" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/HAL_Driver/Inc" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities/STM32746G-Discovery" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/BNO055_driver-master" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-hal

clean-Drivers-2f-lvgl-2f-src-2f-hal:
	-$(RM) ./Drivers/lvgl/src/hal/lv_hal_disp.cyclo ./Drivers/lvgl/src/hal/lv_hal_disp.d ./Drivers/lvgl/src/hal/lv_hal_disp.o ./Drivers/lvgl/src/hal/lv_hal_disp.su ./Drivers/lvgl/src/hal/lv_hal_indev.cyclo ./Drivers/lvgl/src/hal/lv_hal_indev.d ./Drivers/lvgl/src/hal/lv_hal_indev.o ./Drivers/lvgl/src/hal/lv_hal_indev.su ./Drivers/lvgl/src/hal/lv_hal_tick.cyclo ./Drivers/lvgl/src/hal/lv_hal_tick.d ./Drivers/lvgl/src/hal/lv_hal_tick.o ./Drivers/lvgl/src/hal/lv_hal_tick.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-hal

