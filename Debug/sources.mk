################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

ELF_SRCS := 
OBJ_SRCS := 
S_SRCS := 
C_SRCS := 
S_UPPER_SRCS := 
O_SRCS := 
CYCLO_FILES := 
SIZE_OUTPUT := 
OBJDUMP_LIST := 
SU_FILES := 
EXECUTABLES := 
OBJS := 
MAP_FILES := 
S_DEPS := 
S_UPPER_DEPS := 
C_DEPS := 

# Every subdirectory with source files must be described here
SUBDIRS := \
Core/Src \
Core/Startup \
Drivers/STM32F7xx_HAL_Driver/Src \
Drivers \
Drivers/lvgl/demos/benchmark/assets \
Drivers/lvgl/demos/benchmark \
Drivers/lvgl/demos/keypad_encoder \
Drivers/lvgl/demos/music/assets \
Drivers/lvgl/demos/music \
Drivers/lvgl/demos/stress \
Drivers/lvgl/demos/widgets/assets \
Drivers/lvgl/demos/widgets \
Drivers/lvgl/env_support/rt-thread \
Drivers/lvgl/env_support/rt-thread/squareline \
Drivers/lvgl/examples/anim \
Drivers/lvgl/examples/assets \
Drivers/lvgl/examples/assets/emoji \
Drivers/lvgl/examples/event \
Drivers/lvgl/examples/get_started \
Drivers/lvgl/examples/layouts/flex \
Drivers/lvgl/examples/layouts/grid \
Drivers/lvgl/examples/libs/bmp \
Drivers/lvgl/examples/libs/ffmpeg \
Drivers/lvgl/examples/libs/freetype \
Drivers/lvgl/examples/libs/gif \
Drivers/lvgl/examples/libs/png \
Drivers/lvgl/examples/libs/qrcode \
Drivers/lvgl/examples/libs/rlottie \
Drivers/lvgl/examples/libs/sjpg \
Drivers/lvgl/examples/others/fragment \
Drivers/lvgl/examples/others/gridnav \
Drivers/lvgl/examples/others/ime \
Drivers/lvgl/examples/others/imgfont \
Drivers/lvgl/examples/others/monkey \
Drivers/lvgl/examples/others/msg \
Drivers/lvgl/examples/others/snapshot \
Drivers/lvgl/examples/porting \
Drivers/lvgl/examples/scroll \
Drivers/lvgl/examples/styles \
Drivers/lvgl/examples/widgets/animimg \
Drivers/lvgl/examples/widgets/arc \
Drivers/lvgl/examples/widgets/bar \
Drivers/lvgl/examples/widgets/btn \
Drivers/lvgl/examples/widgets/btnmatrix \
Drivers/lvgl/examples/widgets/calendar \
Drivers/lvgl/examples/widgets/canvas \
Drivers/lvgl/examples/widgets/chart \
Drivers/lvgl/examples/widgets/checkbox \
Drivers/lvgl/examples/widgets/colorwheel \
Drivers/lvgl/examples/widgets/dropdown \
Drivers/lvgl/examples/widgets/img \
Drivers/lvgl/examples/widgets/imgbtn \
Drivers/lvgl/examples/widgets/keyboard \
Drivers/lvgl/examples/widgets/label \
Drivers/lvgl/examples/widgets/led \
Drivers/lvgl/examples/widgets/line \
Drivers/lvgl/examples/widgets/list \
Drivers/lvgl/examples/widgets/menu \
Drivers/lvgl/examples/widgets/meter \
Drivers/lvgl/examples/widgets/msgbox \
Drivers/lvgl/examples/widgets/obj \
Drivers/lvgl/examples/widgets/roller \
Drivers/lvgl/examples/widgets/slider \
Drivers/lvgl/examples/widgets/span \
Drivers/lvgl/examples/widgets/spinbox \
Drivers/lvgl/examples/widgets/spinner \
Drivers/lvgl/examples/widgets/switch \
Drivers/lvgl/examples/widgets/table \
Drivers/lvgl/examples/widgets/tabview \
Drivers/lvgl/examples/widgets/textarea \
Drivers/lvgl/examples/widgets/tileview \
Drivers/lvgl/examples/widgets/win \
Drivers/lvgl/src/core \
Drivers/lvgl/src/draw/arm2d \
Drivers/lvgl/src/draw \
Drivers/lvgl/src/draw/nxp/pxp \
Drivers/lvgl/src/draw/nxp/vglite \
Drivers/lvgl/src/draw/sdl \
Drivers/lvgl/src/draw/stm32_dma2d \
Drivers/lvgl/src/draw/sw \
Drivers/lvgl/src/draw/swm341_dma2d \
Drivers/lvgl/src/extra/layouts/flex \
Drivers/lvgl/src/extra/layouts/grid \
Drivers/lvgl/src/extra/libs/bmp \
Drivers/lvgl/src/extra/libs/ffmpeg \
Drivers/lvgl/src/extra/libs/freetype \
Drivers/lvgl/src/extra/libs/fsdrv \
Drivers/lvgl/src/extra/libs/gif \
Drivers/lvgl/src/extra/libs/png \
Drivers/lvgl/src/extra/libs/qrcode \
Drivers/lvgl/src/extra/libs/rlottie \
Drivers/lvgl/src/extra/libs/sjpg \
Drivers/lvgl/src/extra \
Drivers/lvgl/src/extra/others/fragment \
Drivers/lvgl/src/extra/others/gridnav \
Drivers/lvgl/src/extra/others/ime \
Drivers/lvgl/src/extra/others/imgfont \
Drivers/lvgl/src/extra/others/monkey \
Drivers/lvgl/src/extra/others/msg \
Drivers/lvgl/src/extra/others/snapshot \
Drivers/lvgl/src/extra/themes/basic \
Drivers/lvgl/src/extra/themes/default \
Drivers/lvgl/src/extra/themes/mono \
Drivers/lvgl/src/extra/widgets/animimg \
Drivers/lvgl/src/extra/widgets/calendar \
Drivers/lvgl/src/extra/widgets/chart \
Drivers/lvgl/src/extra/widgets/colorwheel \
Drivers/lvgl/src/extra/widgets/imgbtn \
Drivers/lvgl/src/extra/widgets/keyboard \
Drivers/lvgl/src/extra/widgets/led \
Drivers/lvgl/src/extra/widgets/list \
Drivers/lvgl/src/extra/widgets/menu \
Drivers/lvgl/src/extra/widgets/meter \
Drivers/lvgl/src/extra/widgets/msgbox \
Drivers/lvgl/src/extra/widgets/span \
Drivers/lvgl/src/extra/widgets/spinbox \
Drivers/lvgl/src/extra/widgets/spinner \
Drivers/lvgl/src/extra/widgets/tabview \
Drivers/lvgl/src/extra/widgets/tileview \
Drivers/lvgl/src/extra/widgets/win \
Drivers/lvgl/src/font \
Drivers/lvgl/src/hal \
Drivers/lvgl/src/misc \
Drivers/lvgl/src/widgets \
Drivers/lvgl/tests/makefile \
Drivers/lvgl/tests/src \
Drivers/lvgl/tests/src/test_cases \
Drivers/lvgl/tests/src/test_fonts \
Drivers/lvgl/tests/unity \
Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS \
Middlewares/Third_Party/FreeRTOS/Source \
Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 \
Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang \

