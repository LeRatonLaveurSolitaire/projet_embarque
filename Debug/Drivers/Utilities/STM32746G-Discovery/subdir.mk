################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery.c \
../Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_audio.c \
../Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_camera.c \
../Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_eeprom.c \
../Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_qspi.c \
../Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sd.c \
../Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sdram.c \
../Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_ts.c 

OBJS += \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery.o \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_audio.o \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_camera.o \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_eeprom.o \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_qspi.o \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sd.o \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sdram.o \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_ts.o 

C_DEPS += \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery.d \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_audio.d \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_camera.d \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_eeprom.d \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_qspi.d \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sd.d \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sdram.d \
./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_ts.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Utilities/STM32746G-Discovery/%.o Drivers/Utilities/STM32746G-Discovery/%.su Drivers/Utilities/STM32746G-Discovery/%.cyclo: ../Drivers/Utilities/STM32746G-Discovery/%.c Drivers/Utilities/STM32746G-Discovery/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/lvgl/src" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/hal_stm_lvgl/touchpad" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/HAL_Driver/Inc" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities/STM32746G-Discovery" -I"C:/Users/thoma/STM32CubeIDE/workspace_1.10.1/Primary Flight Display/Drivers/Utilities" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-Utilities-2f-STM32746G-2d-Discovery

clean-Drivers-2f-Utilities-2f-STM32746G-2d-Discovery:
	-$(RM) ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery.cyclo ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery.d ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery.o ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery.su ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_audio.cyclo ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_audio.d ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_audio.o ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_audio.su ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_camera.cyclo ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_camera.d ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_camera.o ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_camera.su ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_eeprom.cyclo ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_eeprom.d ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_eeprom.o ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_eeprom.su ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_qspi.cyclo ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_qspi.d ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_qspi.o ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_qspi.su ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sd.cyclo ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sd.d ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sd.o ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sd.su ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sdram.cyclo ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sdram.d ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sdram.o ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_sdram.su ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_ts.cyclo ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_ts.d ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_ts.o ./Drivers/Utilities/STM32746G-Discovery/stm32746g_discovery_ts.su

.PHONY: clean-Drivers-2f-Utilities-2f-STM32746G-2d-Discovery

