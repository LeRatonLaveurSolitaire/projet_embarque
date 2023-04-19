################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/env_support/pikascript/pika_lv_point_t.c \
../Drivers/lvgl/env_support/pikascript/pika_lv_timer_t.c \
../Drivers/lvgl/env_support/pikascript/pika_lv_wegit.c \
../Drivers/lvgl/env_support/pikascript/pika_lvgl.c \
../Drivers/lvgl/env_support/pikascript/pika_lvgl_indev_t.c \
../Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_event.c \
../Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_obj.c \
../Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.c 

OBJS += \
./Drivers/lvgl/env_support/pikascript/pika_lv_point_t.o \
./Drivers/lvgl/env_support/pikascript/pika_lv_timer_t.o \
./Drivers/lvgl/env_support/pikascript/pika_lv_wegit.o \
./Drivers/lvgl/env_support/pikascript/pika_lvgl.o \
./Drivers/lvgl/env_support/pikascript/pika_lvgl_indev_t.o \
./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_event.o \
./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_obj.o \
./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.o 

C_DEPS += \
./Drivers/lvgl/env_support/pikascript/pika_lv_point_t.d \
./Drivers/lvgl/env_support/pikascript/pika_lv_timer_t.d \
./Drivers/lvgl/env_support/pikascript/pika_lv_wegit.d \
./Drivers/lvgl/env_support/pikascript/pika_lvgl.d \
./Drivers/lvgl/env_support/pikascript/pika_lvgl_indev_t.d \
./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_event.d \
./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_obj.d \
./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/env_support/pikascript/%.o Drivers/lvgl/env_support/pikascript/%.su: ../Drivers/lvgl/env_support/pikascript/%.c Drivers/lvgl/env_support/pikascript/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-env_support-2f-pikascript

clean-Drivers-2f-lvgl-2f-env_support-2f-pikascript:
	-$(RM) ./Drivers/lvgl/env_support/pikascript/pika_lv_point_t.d ./Drivers/lvgl/env_support/pikascript/pika_lv_point_t.o ./Drivers/lvgl/env_support/pikascript/pika_lv_point_t.su ./Drivers/lvgl/env_support/pikascript/pika_lv_timer_t.d ./Drivers/lvgl/env_support/pikascript/pika_lv_timer_t.o ./Drivers/lvgl/env_support/pikascript/pika_lv_timer_t.su ./Drivers/lvgl/env_support/pikascript/pika_lv_wegit.d ./Drivers/lvgl/env_support/pikascript/pika_lv_wegit.o ./Drivers/lvgl/env_support/pikascript/pika_lv_wegit.su ./Drivers/lvgl/env_support/pikascript/pika_lvgl.d ./Drivers/lvgl/env_support/pikascript/pika_lvgl.o ./Drivers/lvgl/env_support/pikascript/pika_lvgl.su ./Drivers/lvgl/env_support/pikascript/pika_lvgl_indev_t.d ./Drivers/lvgl/env_support/pikascript/pika_lvgl_indev_t.o ./Drivers/lvgl/env_support/pikascript/pika_lvgl_indev_t.su ./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_event.d ./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_event.o ./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_event.su ./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_obj.d ./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_obj.o ./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_obj.su ./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.d ./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.o ./Drivers/lvgl/env_support/pikascript/pika_lvgl_lv_style_t.su

.PHONY: clean-Drivers-2f-lvgl-2f-env_support-2f-pikascript
