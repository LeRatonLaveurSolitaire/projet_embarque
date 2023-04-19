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


#include "stdio.h"
#include "rtc.h"
#include "lvgl/lvgl.h"
#include "hal_stm_lvgl/tft/tft.h"
#include "hal_stm_lvgl/touchpad/touchpad.h"
#include "bno055.h"
#include "math.h"
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
  osThreadDef(accelerometre, accelerometre_I2C, osPriorityHigh, 0, 1536);
  accelerometreHandle = osThreadCreate(osThread(accelerometre), NULL);

  /* definition and creation of NEMA */
  osThreadDef(NEMA, NEMA_UART, osPriorityNormal, 0, 128);
  NEMAHandle = osThreadCreate(osThread(NEMA), NULL);

  /* definition and creation of resetSpeed */
  osThreadDef(resetSpeed, reset_speed, osPriorityNormal, 0, 128);
  resetSpeedHandle = osThreadCreate(osThread(resetSpeed), NULL);

  /* definition and creation of resetOrientatio */
  osThreadDef(resetOrientatio, reset_orientation, osPriorityNormal, 0, 128);
  resetOrientatioHandle = osThreadCreate(osThread(resetOrientatio), NULL);

  /* definition and creation of LVGL_Timer */
  osThreadDef(LVGL_Timer, LVGLTimer, osPriorityNormal, 0, 1024);
  LVGL_TimerHandle = osThreadCreate(osThread(LVGL_Timer), NULL);

  /* definition and creation of LVGL_Tick */
  osThreadDef(LVGL_Tick, LVGLTick, osPriorityHigh, 0, 1024);
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
	  vTaskDelay(10);
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

	// import des variables

	extern int16_t acc_X;
	extern int16_t acc_Y;
	extern int16_t acc_Z;
	extern int16_t mag_X;
	extern int16_t mag_Y;
	extern int16_t mag_Z;
	extern int16_t gyro_X;
	extern int16_t gyro_Y;
	extern int16_t gyro_Z;
	extern int8_t temp;
	extern uint16_t speed;
	extern uint16_t alt;

	// import des objet LVGL
	extern lv_obj_t *info_title;
	extern lv_obj_t *temp_title;
	extern lv_obj_t *alt_roller;
	extern lv_obj_t *alt_label;
	extern lv_obj_t *speed_roller;
	extern lv_obj_t *speed_label;
	extern lv_obj_t *compass_roller;
	extern lv_obj_t *date_title;
	extern lv_obj_t *time_title;
	extern lv_obj_t *canvas;
	extern lv_draw_line_dsc_t ligne_horizon;
	extern lv_draw_line_dsc_t central_line;
	extern lv_point_t points_horizon[2];
	extern lv_point_t points_offset[2];
	extern lv_point_t points_ligne[2];

	static int speed_X =0 ;
	static int speed_Y =0 ;
	static int speed_Z =0 ;
	static char text[100];
	static char text2[10];
	static uint16_t periode = 250;
	static int8_t alpha = 0;
	static int8_t theta = 0;
	static uint16_t angle_mag = 0;
	extern I2C_HandleTypeDef hi2c1;
	uint8_t donnees_Rx_i2c[8];
	const uint8_t registre = BNO055_EULER_H_LSB_ADDR;
	extern RTC_TimeTypeDef sTime;
	extern RTC_DateTypeDef sDate;
	for(;;)
	{

		//récupération des données du capteur
/*
		bno055_read_accel_x(&acc_X);
		bno055_read_accel_y(&acc_Y);
		bno055_read_accel_z(&acc_Z);
		bno055_read_mag_x(&mag_X);
		bno055_read_mag_x(&mag_Y);
		bno055_read_mag_x(&mag_Z);
		bno055_read_gyro_x(&gyro_X);
		bno055_read_gyro_y(&gyro_Y);
		bno055_read_gyro_z(&gyro_Z);
		bno055_read_temp_data(&temp);
*/

		//donnees du gyro

		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)0x28<<1 ,(uint8_t*) &registre, 1, 100);
		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Receive(&hi2c1, (uint16_t)0x28<<1 , donnees_Rx_i2c, 6, 100);
		gyro_X = (uint16_t)(donnees_Rx_i2c[1]<<8) + donnees_Rx_i2c[0];
		gyro_Y = (uint16_t)(donnees_Rx_i2c[3]<<8) + donnees_Rx_i2c[2];
		gyro_Z = (uint16_t)(donnees_Rx_i2c[5]<<8) + donnees_Rx_i2c[4];

		gyro_X = gyro_X/16;
		gyro_Y = gyro_Y/16;
		gyro_Z = gyro_Z/16;
		//donnees du mag
/*
		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)0x28<<1, (uint8_t *)BNO055_MAG_DATA_Z_LSB_ADDR, 1, 100);
		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Receive(&hi2c1, (uint16_t)0x28<<1, donnees_Rx_i2c, 2, 100);
		mag_Z = (uint16_t)(donnees_Rx_i2c[1]<<8) + donnees_Rx_i2c[0];

		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)0x28<<1, (uint8_t *)BNO055_MAG_DATA_Y_LSB_ADDR, 1, 100);
		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Receive(&hi2c1, (uint16_t)0x28<<1, donnees_Rx_i2c, 2, 100);
		mag_Y = (uint16_t)(donnees_Rx_i2c[1]<<8) + donnees_Rx_i2c[0];

		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)0x28<<1,(uint8_t *) BNO055_MAG_DATA_X_LSB_ADDR, 1, 100);
		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Receive(&hi2c1, (uint16_t)0x28<<1, donnees_Rx_i2c, 2, 100);
		mag_X = (uint16_t)(donnees_Rx_i2c[1]<<8) + donnees_Rx_i2c[0];


		//donnees de l'accelero

		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)0x28<<1, (uint8_t *)BNO055_ACCEL_DATA_Z_LSB_ADDR, 1, 100);
		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Receive(&hi2c1, (uint16_t)0x28<<1, donnees_Rx_i2c, 2, 100);
		acc_Z = (uint16_t)(donnees_Rx_i2c[1]<<8) + donnees_Rx_i2c[0];

		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)0x28<<1, (uint8_t *)BNO055_ACCEL_DATA_Y_LSB_ADDR, 1, 100);
		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Receive(&hi2c1, (uint16_t)0x28<<1, donnees_Rx_i2c, 2, 100);
		acc_Y = (uint16_t)(donnees_Rx_i2c[1]<<8) + donnees_Rx_i2c[0];

		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)0x28<<1, (uint8_t *)BNO055_ACCEL_DATA_X_LSB_ADDR, 1, 100);
		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Receive(&hi2c1, (uint16_t)0x28<<1, donnees_Rx_i2c, 2, 100);
		acc_X = (uint16_t)(donnees_Rx_i2c[1]<<8) + donnees_Rx_i2c[0];

		//donnees de temperature

		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)0x28<<1, (uint8_t *)BNO055_TEMP_ADDR, 1, 100);
		while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
		HAL_I2C_Master_Receive(&hi2c1, (uint16_t)0x28<<1, donnees_Rx_i2c, 2, 100);
		temp = (uint16_t)(donnees_Rx_i2c[1]<<8) + donnees_Rx_i2c[0];
*/
		//traitement des données

		speed_X += acc_X * periode / 1000 ;
		speed_Y += acc_Y * periode / 1000 ;
		speed_Z += acc_Z * periode / 1000 ;

		speed = pow((speed_X * speed_X + speed_Y * speed_Y + speed_Z * speed_Z ), 0.5);
		alt += speed_Z * periode / 1000 ;
		alpha = gyro_Z;
		theta = -gyro_Y;
		//angle_mag +=1;
		// calcul de l'horizon
		points_horizon[0].x = (lv_coord_t)  points_offset[0].x + 500 - 500 * cos( theta * 3.141593 / 180 );
		points_horizon[0].y = (lv_coord_t)  points_offset[0].y + alpha/2 + 500 * sin( theta * 3.141592 / 180 ) + theta;
		points_horizon[1].x = (lv_coord_t)  points_offset[1].x - 500 + 500 * cos( theta * 3.141593 / 180 );
		points_horizon[1].y = (lv_coord_t)  points_offset[1].y + alpha/2 - 500 * sin( theta * 3.141592 / 180) + theta;

		//affichage des données
		lv_canvas_fill_bg(canvas, lv_color_hex(0x578EEB), LV_OPA_100);
		lv_canvas_draw_line(canvas, points_horizon, 2,&ligne_horizon);
		lv_canvas_draw_line(canvas, points_ligne, 2,&central_line);

		sprintf(text, "accX : %d\naccY : %d\naccZ : %d\ngX : %d\ngY : %d\ngZ : %d",acc_X,acc_Y,acc_Z,gyro_X,gyro_Y,gyro_Z);
		lv_label_set_text(info_title, text);

		sprintf(text2, "%d °C",temp);
		lv_label_set_text(temp_title, text2);

		sprintf(text2, "%d m",alt);
		lv_label_set_text(alt_label, text2);
		lv_roller_set_selected(alt_roller, (uint8_t)(100 - alt / 100) , LV_ANIM_ON);

		sprintf(text2, "%d m/s",(uint8_t) speed);
		lv_label_set_text(speed_label, text2);
		lv_roller_set_selected(speed_roller, (uint8_t) speed , LV_ANIM_ON);

		lv_roller_set_selected(compass_roller, (uint8_t) ((((angle_mag + 23)/45))%8)  , LV_ANIM_ON);

		HAL_RTC_GetTime(&hrtc, &sTime, RTC_FORMAT_BIN);
		sprintf(text, "%02u:%02u:%02u",sTime.Hours,sTime.Minutes,sTime.Seconds);
		lv_label_set_text(time_title, text);

		HAL_RTC_GetDate(&hrtc, &sDate, RTC_FORMAT_BIN);
		sprintf(text, "%02u/%02u/20%02u",sDate.Date,sDate.Month,sDate.Year);
		lv_label_set_text(date_title, text);

		vTaskDelay(periode);
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
  extern lv_obj_t *coords_title;
  static char text[50] = "N48°42'46''\nE2°9'53''";
  for(;;)
  {

	  lv_label_set_text(coords_title, text);
	  vTaskDelay(100);
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
	  vTaskDelay(10);
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
	 vTaskDelay(10);
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
	static int periode = 50;
  for(;;)
  {
	lv_task_handler();
	lv_tick_inc(periode);
	vTaskDelay(periode);
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
	vTaskDelay(50);
  }
  /* USER CODE END LVGLTick */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */

/* USER CODE END Application */

