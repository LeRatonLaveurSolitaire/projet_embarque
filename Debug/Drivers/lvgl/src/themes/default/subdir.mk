################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/themes/default/lv_theme_default.c 

OBJS += \
./Drivers/lvgl/src/themes/default/lv_theme_default.o 

C_DEPS += \
./Drivers/lvgl/src/themes/default/lv_theme_default.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/themes/default/%.o Drivers/lvgl/src/themes/default/%.su: ../Drivers/lvgl/src/themes/default/%.c Drivers/lvgl/src/themes/default/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-themes-2f-default

clean-Drivers-2f-lvgl-2f-src-2f-themes-2f-default:
	-$(RM) ./Drivers/lvgl/src/themes/default/lv_theme_default.d ./Drivers/lvgl/src/themes/default/lv_theme_default.o ./Drivers/lvgl/src/themes/default/lv_theme_default.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-themes-2f-default

