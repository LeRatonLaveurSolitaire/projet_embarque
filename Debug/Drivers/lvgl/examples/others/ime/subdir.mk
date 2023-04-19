################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_1.c \
../Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_2.c 

OBJS += \
./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_1.o \
./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_2.o 

C_DEPS += \
./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_1.d \
./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_2.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/others/ime/%.o Drivers/lvgl/examples/others/ime/%.su Drivers/lvgl/examples/others/ime/%.cyclo: ../Drivers/lvgl/examples/others/ime/%.c Drivers/lvgl/examples/others/ime/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl/src" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl/touchpad" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/HAL_Driver/Inc" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities/STM32746G-Discovery" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/BNO055_driver-master" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-others-2f-ime

clean-Drivers-2f-lvgl-2f-examples-2f-others-2f-ime:
	-$(RM) ./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_1.cyclo ./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_1.d ./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_1.o ./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_1.su ./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_2.cyclo ./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_2.d ./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_2.o ./Drivers/lvgl/examples/others/ime/lv_example_ime_pinyin_2.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-others-2f-ime

