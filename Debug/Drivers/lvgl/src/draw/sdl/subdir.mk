################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_arc.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_bg.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_composite.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_img.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_label.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_layer.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_line.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_mask.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_polygon.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_rect.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.c \
../Drivers/lvgl/src/draw/sdl/lv_draw_sdl_utils.c 

OBJS += \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_arc.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_bg.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_composite.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_img.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_label.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_layer.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_line.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_mask.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_polygon.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_rect.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.o \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_utils.o 

C_DEPS += \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_arc.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_bg.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_composite.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_img.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_label.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_layer.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_line.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_mask.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_polygon.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_rect.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.d \
./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/draw/sdl/%.o Drivers/lvgl/src/draw/sdl/%.su Drivers/lvgl/src/draw/sdl/%.cyclo: ../Drivers/lvgl/src/draw/sdl/%.c Drivers/lvgl/src/draw/sdl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl/src" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl/touchpad" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/HAL_Driver/Inc" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities/STM32746G-Discovery" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/BNO055_driver-master" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-sdl

clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-sdl:
	-$(RM) ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_arc.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_arc.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_arc.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_arc.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_bg.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_bg.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_bg.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_bg.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_composite.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_composite.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_composite.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_composite.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_img.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_img.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_img.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_img.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_label.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_label.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_label.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_label.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_layer.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_layer.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_layer.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_layer.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_line.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_line.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_line.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_line.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_mask.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_mask.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_mask.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_mask.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_polygon.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_polygon.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_polygon.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_polygon.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_rect.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_rect.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_rect.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_rect.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.su ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_utils.cyclo ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_utils.d ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_utils.o ./Drivers/lvgl/src/draw/sdl/lv_draw_sdl_utils.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-sdl

