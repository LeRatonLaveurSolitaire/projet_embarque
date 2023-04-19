################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/widgets/chart/lv_example_chart_1.c \
../Drivers/lvgl/examples/widgets/chart/lv_example_chart_2.c \
../Drivers/lvgl/examples/widgets/chart/lv_example_chart_3.c \
../Drivers/lvgl/examples/widgets/chart/lv_example_chart_4.c \
../Drivers/lvgl/examples/widgets/chart/lv_example_chart_5.c \
../Drivers/lvgl/examples/widgets/chart/lv_example_chart_6.c \
../Drivers/lvgl/examples/widgets/chart/lv_example_chart_7.c \
../Drivers/lvgl/examples/widgets/chart/lv_example_chart_8.c \
../Drivers/lvgl/examples/widgets/chart/lv_example_chart_9.c 

OBJS += \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_1.o \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_2.o \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_3.o \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_4.o \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_5.o \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_6.o \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_7.o \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_8.o \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_9.o 

C_DEPS += \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_1.d \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_2.d \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_3.d \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_4.d \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_5.d \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_6.d \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_7.d \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_8.d \
./Drivers/lvgl/examples/widgets/chart/lv_example_chart_9.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/widgets/chart/%.o Drivers/lvgl/examples/widgets/chart/%.su Drivers/lvgl/examples/widgets/chart/%.cyclo: ../Drivers/lvgl/examples/widgets/chart/%.c Drivers/lvgl/examples/widgets/chart/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl/src" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl/touchpad" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/HAL_Driver/Inc" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities/STM32746G-Discovery" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/BNO055_driver-master" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-chart

clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-chart:
	-$(RM) ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_1.cyclo ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_1.d ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_1.o ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_1.su ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_2.cyclo ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_2.d ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_2.o ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_2.su ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_3.cyclo ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_3.d ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_3.o ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_3.su ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_4.cyclo ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_4.d ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_4.o ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_4.su ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_5.cyclo ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_5.d ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_5.o ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_5.su ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_6.cyclo ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_6.d ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_6.o ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_6.su ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_7.cyclo ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_7.d ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_7.o ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_7.su ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_8.cyclo ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_8.d ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_8.o ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_8.su ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_9.cyclo ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_9.d ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_9.o ./Drivers/lvgl/examples/widgets/chart/lv_example_chart_9.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-chart

