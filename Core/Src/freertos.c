/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * File Name          : freertos.c
  * Description        : Code for freertos applications
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

#include "stm32746g_discovery_ts.h"
#include "stdio.h"
#include "rtc.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */

/* USER CODE END Variables */
osThreadId defaultTaskHandle;
osThreadId accelerometreHandle;
osThreadId NEMAHandle;
osThreadId resetSpeedHandle;
osThreadId resetOrientatioHandle;
osThreadId LVGL_TimerHandle;
osThreadId LVGL_TickHandle;
osMessageQId Queue_UARTHandle;
osMutexId Mutex_LCDHandle;
osSemaphoreId LCD_usedHandle;

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */

/* USER CODE END FunctionPrototypes */

void StartDefaultTask(void const * argument);
void accelerometre_I2C(void const * argument);
void NEMA_UART(void const * argument);
void reset_speed(void const * argument);
void reset_orientation(void const * argument);
void LVGLTimer(void const * argument);
void LVGLTick(void const * argument);

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/* GetIdleTaskMemory prototype (linked to static allocation support) */
void vApplicationGetIdleTaskMemory( StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize );

/* USER CODE BEGIN GET_IDLE_TASK_MEMORY */
static StaticTask_t xIdleTaskTCBBuffer;
static StackType_t xIdleStack[configMINIMAL_STACK_SIZE];

void vApplicationGetIdleTaskMemory( StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize )
{
  *ppxIdleTaskTCBBuffer = &xIdleTaskTCBBuffer;
  *ppxIdleTaskStackBuffer = &xIdleStack[0];
  *pulIdleTaskStackSize = configMINIMAL_STACK_SIZE;
  /* place for user code */
}
/* USER CODE END GET_IDLE_TASK_MEMORY */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
  /* USER CODE BEGIN Init */

  /* USER CODE END Init */
  /* Create the mutex(es) */
  /* definition and creation of Mutex_LCD */
  osMutexDef(Mutex_LCD);
  Mutex_LCDHandle = osMutexCreate(osMutex(Mutex_LCD));

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* Create the semaphores(s) */
  /* definition and creation of LCD_used */
  osSemaphoreDef(LCD_used);
  LCD_usedHandle = osSemaphoreCreate(osSemaphore(LCD_used), 1);

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* Create the queue(s) */
  /* definition and creation of Queue_UART */
  osMessageQDef(Queue_UART, 50, uint8_t);
  Queue_UARTHandle = osMessageCreate(osMessageQ(Queue_UART), NULL);

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  /* USER CODE END RTOS_QUEUES */

  /* Create the thread(s) */
  /* definition and creation of defaultTask */
  osThreadDef(defaultTask, StartDefaultTask, osPriorityNormal, 0, 128);
  defaultTaskHandle = osThreadCreate(osThread(defaultTask), NULL);

  /* definition and creation of accelerometre */
  osThreadDef(accelerometre, accelerometre_I2C, osPriorityIdle, 0, 1024);
  accelerometreHandle = osThreadCreate(osThread(accelerometre), NULL);

  /* definition and creation of NEMA */
  osThreadDef(NEMA, NEMA_UART, osPriorityNormal, 0, 1024);
  NEMAHandle = osThreadCreate(osThread(NEMA), NULL);

  /* definition and creation of resetSpeed */
  osThreadDef(resetSpeed, reset_speed, osPriorityIdle, 0, 128);
  resetSpeedHandle = osThreadCreate(osThread(resetSpeed), NULL);

  /* definition and creation of resetOrientatio */
  osThreadDef(resetOrientatio, reset_orientation, osPriorityIdle, 0, 128);
  resetOrientatioHandle = osThreadCreate(osThread(resetOrientatio), NULL);

  /* definition and creation of LVGL_Timer */
  osThreadDef(LVGL_Timer, LVGLTimer, osPriorityIdle, 0, 128);
  LVGL_TimerHandle = osThreadCreate(osThread(LVGL_Timer), NULL);

  /* definition and creation of LVGL_Tick */
  osThreadDef(LVGL_Tick, LVGLTick, osPriorityIdle, 0, 128);
  LVGL_TickHandle = osThreadCreate(osThread(LVGL_Tick), NULL);

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
  /* USER CODE END RTOS_THREADS */

}

/* USER CODE BEGIN Header_StartDefaultTask */
/**
  * @brief  Function implementing the defaultTask thread.
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void const * argument)
{
  /* USER CODE BEGIN StartDefaultTask */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END StartDefaultTask */
}

/* USER CODE BEGIN Header_accelerometre_I2C */
/**
* @brief Function implementing the accelerometre thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_accelerometre_I2C */
void accelerometre_I2C(void const * argument)
{
  /* USER CODE BEGIN accelerometre_I2C */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END accelerometre_I2C */
}

/* USER CODE BEGIN Header_NEMA_UART */
/**
* @brief Function implementing the NEMA thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_NEMA_UART */
void NEMA_UART(void const * argument)
{
  /* USER CODE BEGIN NEMA_UART */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END NEMA_UART */
}

/* USER CODE BEGIN Header_reset_speed */
/**
* @brief Function implementing the resetSpeed thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_reset_speed */
void reset_speed(void const * argument)
{
  /* USER CODE BEGIN reset_speed */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END reset_speed */
}

/* USER CODE BEGIN Header_reset_orientation */
/**
* @brief Function implementing the resetOrientatio thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_reset_orientation */
void reset_orientation(void const * argument)
{
  /* USER CODE BEGIN reset_orientation */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END reset_orientation */
}

/* USER CODE BEGIN Header_LVGLTimer */
/**
* @brief Function implementing the LVGL_Timer thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_LVGLTimer */
void LVGLTimer(void const * argument)
{
  /* USER CODE BEGIN LVGLTimer */
  /* Infinite loop */
  for(;;)
  {
	lv_timer_handler();
	osDelay(20);
  }
  /* USER CODE END LVGLTimer */
}

/* USER CODE BEGIN Header_LVGLTick */
/**
* @brief Function implementing the LVGL_Tick thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_LVGLTick */
void LVGLTick(void const * argument)
{
  /* USER CODE BEGIN LVGLTick */
  /* Infinite loop */
  for(;;)
  {
	lv_tick_inc(10);
	osDelay(10);
  }
  /* USER CODE END LVGLTick */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */

/* USER CODE END Application */

