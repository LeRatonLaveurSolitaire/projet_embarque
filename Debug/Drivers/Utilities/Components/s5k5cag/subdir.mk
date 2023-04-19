################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/Utilities/Components/s5k5cag/s5k5cag.c 

OBJS += \
./Drivers/Utilities/Components/s5k5cag/s5k5cag.o 

C_DEPS += \
./Drivers/Utilities/Components/s5k5cag/s5k5cag.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Utilities/Components/s5k5cag/%.o Drivers/Utilities/Components/s5k5cag/%.su Drivers/Utilities/Components/s5k5cag/%.cyclo: ../Drivers/Utilities/Components/s5k5cag/%.c Drivers/Utilities/Components/s5k5cag/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl/src" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl/touchpad" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/HAL_Driver/Inc" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities/STM32746G-Discovery" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-Utilities-2f-Components-2f-s5k5cag

clean-Drivers-2f-Utilities-2f-Components-2f-s5k5cag:
	-$(RM) ./Drivers/Utilities/Components/s5k5cag/s5k5cag.cyclo ./Drivers/Utilities/Components/s5k5cag/s5k5cag.d ./Drivers/Utilities/Components/s5k5cag/s5k5cag.o ./Drivers/Utilities/Components/s5k5cag/s5k5cag.su

.PHONY: clean-Drivers-2f-Utilities-2f-Components-2f-s5k5cag

