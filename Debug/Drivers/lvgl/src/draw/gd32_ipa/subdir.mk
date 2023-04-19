################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.c 

OBJS += \
./Drivers/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.o 

C_DEPS += \
./Drivers/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/draw/gd32_ipa/%.o Drivers/lvgl/src/draw/gd32_ipa/%.su: ../Drivers/lvgl/src/draw/gd32_ipa/%.c Drivers/lvgl/src/draw/gd32_ipa/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-gd32_ipa

clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-gd32_ipa:
	-$(RM) ./Drivers/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.d ./Drivers/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.o ./Drivers/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-gd32_ipa

