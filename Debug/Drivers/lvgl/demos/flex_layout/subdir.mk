################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_ctrl_pad.c \
../Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_flex_loader.c \
../Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_main.c \
../Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view.c \
../Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_child_node.c \
../Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_ctrl_pad.c 

OBJS += \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_ctrl_pad.o \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_flex_loader.o \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_main.o \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view.o \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_child_node.o \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_ctrl_pad.o 

C_DEPS += \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_ctrl_pad.d \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_flex_loader.d \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_main.d \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view.d \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_child_node.d \
./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_ctrl_pad.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/demos/flex_layout/%.o Drivers/lvgl/demos/flex_layout/%.su: ../Drivers/lvgl/demos/flex_layout/%.c Drivers/lvgl/demos/flex_layout/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-demos-2f-flex_layout

clean-Drivers-2f-lvgl-2f-demos-2f-flex_layout:
	-$(RM) ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_ctrl_pad.d ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_ctrl_pad.o ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_ctrl_pad.su ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_flex_loader.d ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_flex_loader.o ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_flex_loader.su ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_main.d ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_main.o ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_main.su ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view.d ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view.o ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view.su ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_child_node.d ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_child_node.o ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_child_node.su ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_ctrl_pad.d ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_ctrl_pad.o ./Drivers/lvgl/demos/flex_layout/lv_demo_flex_layout_view_ctrl_pad.su

.PHONY: clean-Drivers-2f-lvgl-2f-demos-2f-flex_layout

