/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
#include "main.h"
#include "cmsis_os.h"
#include "dma2d.h"
#include "i2c.h"
//#include "ltdc.h"
#include "rtc.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"
#include "fmc.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

#include "stm32f7xx.h"
#include "lvgl/lvgl.h"
#include "hal_stm_lvgl/tft/tft.h"
//#include "hal_stm_lvgl/touchpad/touchpad.h"
#include "bno055.h"




//#include "background.h"
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

/* USER CODE BEGIN PV */

RTC_TimeTypeDef sTime;
RTC_DateTypeDef sDate;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
void MX_FREERTOS_Init(void);
/* USER CODE BEGIN PFP */


/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

//partie capteur
int16_t acc_X;
int16_t acc_Y;
int16_t acc_Z;
int16_t mag_X;
int16_t mag_Y;
int16_t mag_Z;
int16_t gyro_X;
int16_t gyro_Y;
int16_t gyro_Z;
int8_t temp;
uint16_t speed;
uint16_t alt;

int8_t sensor_I2C_write(uint8_t, uint8_t,uint8_t *,uint8_t);
int8_t sensor_I2C_read(uint8_t, uint8_t,uint8_t *,uint8_t);

struct bno055_t sensor;
void bno055_init2();
//configuration de l'initialisation du capteur

#define BP_ENFONCE 0
#define BP_RELACHE 1
#define ADRESSE_BNO 0x28 //adresse 7 bits du BNO055
#define ADRES_SRF10 0x70
#define PAGE_SWAP	0x07
#define ACC_CONF	0x08
#define GYR_CONF_0	0x0A
#define GYR_CONF_1	0x0B
#define MAG_CONF	0x09
#define TEMP_SOURCE	0x40
#define UNIT_SEL	0x3B
#define PWR_MODE	0x3E
#define HEADING		0x1A
#define MODE_REG	0x3D
#define FUSION_MODE	0x0C

#define BUTEE_DROITE 1700
#define BUTEE_GAUCHE 1200
#define FREQ_TIMER_4 170000000


//partie affichage LVGL

#define CANVAS_WIDTH 200
#define CANVAS_HEIGHT 200
#define HORIZON_LINE_LENGTH 500
#define CENTRAL_LINE_LENGTH 30
#define CENTRAL_LINE_WIDTH 2
#define OFFSET_HORIZON_X_0 CANVAS_WIDTH / 2 - HORIZON_LINE_LENGTH
#define OFFSET_HORIZON_Y_0 CANVAS_HEIGHT
#define OFFSET_HORIZON_X_1 CANVAS_WIDTH / 2 + HORIZON_LINE_LENGTH
#define OFFSET_HORIZON_Y_1 CANVAS_HEIGHT



// Declaration des widgets

lv_obj_t *info_title;
lv_obj_t *temp_title;
lv_obj_t *alt_roller;
lv_obj_t *alt_label;
lv_obj_t *speed_roller;
lv_obj_t *speed_label;
lv_obj_t *compass_roller;
lv_obj_t *date_title;
lv_obj_t *time_title;
lv_obj_t *coords_title;
lv_obj_t *canvas;
lv_draw_line_dsc_t ligne_horizon;
lv_draw_line_dsc_t central_line;
lv_point_t points_horizon[2];
lv_point_t points_offset[2];
lv_point_t points_ligne[2];
uint8_t canvas_buffer[LV_CANVAS_BUF_SIZE_TRUE_COLOR(CANVAS_WIDTH, CANVAS_HEIGHT)];


/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_FMC_Init();
  MX_I2C1_Init();
  MX_RTC_Init();
  MX_TIM1_Init();
  MX_TIM2_Init();
  MX_TIM3_Init();
  MX_USART1_UART_Init();
  MX_DMA2D_Init();
  /* USER CODE BEGIN 2 */

  HAL_RTC_Init(&hrtc);

  //Initialise LVGL UI library

  /* Enable I-Cache */
  SCB_EnableICache();

  /* Enable D-Cache */
  SCB_EnableDCache();

  // Start LVGL
  lv_init();

  // Start the screen library
  tft_init();

  // Do not start the touchpad library
  //touchpad_init();

  /* DECLARATION AND CONFIGURATION OF THE WIDGET */

  // Set background and text color

  lv_obj_set_style_bg_color(lv_scr_act(), lv_color_hex(0x202028), LV_PART_MAIN);
  lv_obj_set_style_text_color(lv_scr_act(), lv_color_hex(0xffffff), LV_PART_MAIN);

  // création du canvas

  canvas = lv_canvas_create(lv_scr_act());
  lv_canvas_set_buffer(canvas, canvas_buffer, CANVAS_WIDTH, CANVAS_HEIGHT, LV_IMG_CF_TRUE_COLOR);
  lv_obj_set_size(canvas, CANVAS_WIDTH, CANVAS_HEIGHT);
  lv_obj_align(canvas, LV_ALIGN_CENTER, 0, 5);
  lv_canvas_fill_bg(canvas, lv_color_hex(0x578EEB), LV_OPA_100);

  // horizon sur le canvas

  points_offset[0].x = OFFSET_HORIZON_X_0;
  points_offset[0].y = OFFSET_HORIZON_Y_0;
  points_offset[1].x = OFFSET_HORIZON_X_1;
  points_offset[1].y = OFFSET_HORIZON_Y_1;
  lv_draw_line_dsc_init(&ligne_horizon);
  points_horizon[0].x = points_offset[0].x;
  points_horizon[0].y = points_offset[0].y;
  points_horizon[1].x = points_offset[1].x;
  points_horizon[1].y = points_offset[1].y;
  ligne_horizon.color = lv_color_hex(0x826116);
  ligne_horizon.width = CANVAS_HEIGHT;
  lv_canvas_draw_line(canvas, points_horizon, 2,&ligne_horizon);

  // Ligne central sur le canvas

  lv_draw_line_dsc_init(&central_line);
  points_ligne[0].x = CANVAS_WIDTH / 2 - CENTRAL_LINE_LENGTH;
  points_ligne[0].y = CANVAS_HEIGHT / 2;
  points_ligne[1].x = CANVAS_WIDTH / 2 + CENTRAL_LINE_LENGTH;
  points_ligne[1].y = CANVAS_HEIGHT / 2;
  central_line.color = lv_color_hex(0x00FF00);
  central_line.width = CENTRAL_LINE_WIDTH;
  lv_canvas_draw_line(canvas, points_ligne, 2,&central_line);

  //create a style for selected value in roller

  static lv_style_t style_sel;
  lv_style_init(&style_sel);
  lv_style_set_text_font(&style_sel, &lv_font_montserrat_14);
  lv_style_set_bg_color(&style_sel, lv_color_hex3(0xccc));
  lv_style_set_border_width(&style_sel, 2);
  lv_style_set_border_color(&style_sel, lv_color_hex3(0x333));

  // Create the vertical roller for altitude

  alt_roller = lv_roller_create(lv_scr_act());
  lv_roller_set_options(alt_roller, "10000\n9900\n9800\n9700\n9600\n9500\n9400\n9300\n9200\n9100\n9000\n8900\n8800\n8700\n8600\n8500\n8400\n8300\n8200\n8100\n8000\n7900\n7800\n7700\n7600\n7500\n7400\n7300\n7200\n7100\n7000\n6900\n6800\n6700\n6600\n6500\n6400\n6300\n6200\n6100\n6000\n5900\n5800\n5700\n5600\n5500\n5400\n5300\n5200\n5100\n5000\n4900\n4800\n4700\n4600\n4500\n4400\n4300\n4200\n4100\n4000\n3900\n3800\n3700\n3600\n3500\n3400\n3300\n3200\n3100\n3000\n2900\n2800\n2700\n2600\n2500\n2400\n2300\n2200\n2100\n2000\n1900\n1800\n1700\n1600\n1500\n1400\n1300\n1200\n1100\n1000\n900\n800\n700\n600\n500\n400\n300\n200\n100\n0", LV_ROLLER_MODE_NORMAL);
  lv_roller_set_visible_row_count(alt_roller, 7);
  lv_roller_set_selected(alt_roller, 101, LV_ANIM_OFF);
  lv_obj_set_size(alt_roller, 40, 220);
  lv_obj_align(alt_roller, LV_ALIGN_RIGHT_MID, -90, 0);
  lv_obj_add_style(alt_roller, &style_sel, LV_PART_SELECTED);
  lv_obj_set_style_text_align(alt_roller, LV_TEXT_ALIGN_CENTER, 0);
  lv_obj_set_style_bg_color(alt_roller, lv_color_hex3(0x888), 0);

  // Create a label to display the altitude value
  alt_label = lv_label_create(lv_scr_act());
  lv_label_set_text(alt_label, "m");
  lv_obj_align(alt_label, LV_ALIGN_BOTTOM_RIGHT, -80, -10);
  //lv_obj_add_event_cb(alt_label, event_update_text,LV_EVENT_REFRESH, (void *)text_alt);

  // Create a title for altitude
  lv_obj_t *alt_title = lv_label_create(lv_scr_act());
  lv_label_set_text(alt_title, "Alt");
  lv_obj_align(alt_title, LV_ALIGN_TOP_RIGHT, -100, 10);


  // Create the vertical roller for speed
  speed_roller = lv_roller_create(lv_scr_act());
  lv_roller_set_options(speed_roller, "0\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n69\n70\n71\n72\n73\n74\n75\n76\n77\n78\n79\n80\n81\n82\n83\n84\n85\n86\n87\n88\n89\n90\n91\n92\n93\n94\n95\n96\n97\n98\n99\n100\n101\n102\n103\n104\n105\n106\n107\n108\n109\n110\n111\n112\n113\n114\n115\n116\n117\n118\n119\n120\n121\n122\n123\n124\n125\n126\n127\n128\n129\n130\n131\n132\n133\n134\n135\n136\n137\n138\n139\n140\n141\n142\n143\n144\n145\n146\n147\n148\n149\n150\n151\n152\n153\n154\n155\n156\n157\n158\n159\n160\n161\n162\n163\n164\n165\n166\n167\n168\n169\n170\n171\n172\n173\n174\n175\n176\n177\n178\n179\n180\n181\n182\n183\n184\n185\n186\n187\n188\n189\n190\n191\n192\n193\n194\n195\n196\n197\n198\n199\n200\n201\n202\n203\n204\n205\n206\n207\n208\n209\n210\n211\n212\n213\n214\n215\n216\n217\n218\n219\n220\n221\n222\n223\n224\n225\n226\n227\n228\n229\n230\n231\n232\n233\n234\n235\n236\n237\n238\n239\n240\n241\n242\n243\n244\n245\n246\n247\n248\n249\n250\n251\n252\n253\n254\n255", LV_ROLLER_MODE_NORMAL);
  lv_roller_set_visible_row_count(speed_roller, 7);
  lv_roller_set_selected(speed_roller, 0, LV_ANIM_ON);
  lv_obj_set_size(speed_roller, 40, 220);
  lv_obj_align(speed_roller, LV_ALIGN_LEFT_MID, 90, 0);
  lv_obj_add_style(speed_roller, &style_sel, LV_PART_SELECTED);
  lv_obj_set_style_text_align(speed_roller, LV_TEXT_ALIGN_CENTER, 0);
  lv_obj_set_style_bg_color(speed_roller, lv_color_hex3(0x888), 0);

  // Create a label to display the speed value
  speed_label = lv_label_create(lv_scr_act());
  lv_label_set_text(speed_label, "m/s");
  lv_obj_align(speed_label, LV_ALIGN_BOTTOM_LEFT, 90, -10);

  // Create a title for speed
  lv_obj_t *speed_title = lv_label_create(lv_scr_act());
  lv_label_set_text(speed_title, "Speed");
  lv_obj_align(speed_title, LV_ALIGN_TOP_LEFT, 88, 10);

  // Create an horizontal roller for compass
  compass_roller = lv_roller_create(lv_scr_act());
  lv_roller_set_options(compass_roller, "North\nNorth - East\nEast\nSouth - East\nSouth\nSouth - West\nWest\nNorth - West", LV_ROLLER_MODE_INFINITE);
  lv_roller_set_visible_row_count(compass_roller, 3);
  lv_obj_set_size(compass_roller, 200, 32);
  lv_obj_align(compass_roller, LV_ALIGN_TOP_MID, 0, 0);
  lv_obj_add_style(compass_roller, &style_sel, LV_PART_SELECTED);
  lv_obj_set_style_text_align(compass_roller, LV_TEXT_ALIGN_CENTER, 0);
  lv_obj_set_style_bg_color(compass_roller, lv_color_hex3(0x888), 0);

  // Create a title for date
  date_title = lv_label_create(lv_scr_act());
  lv_label_set_text(date_title, "13/04/2023");
  lv_obj_align(date_title, LV_ALIGN_TOP_LEFT, 3, 4);

  // Create a title for time
  time_title = lv_label_create(lv_scr_act());
  lv_label_set_text(time_title, "11:35");
  lv_obj_align(time_title, LV_ALIGN_TOP_LEFT, 3, 20);

  // Create a title for temperature
  temp_title = lv_label_create(lv_scr_act());
  lv_label_set_text(temp_title, "10°C");
  lv_obj_align(temp_title, LV_ALIGN_TOP_LEFT, 3, 36);

  // Create a title for info and test
  info_title = lv_label_create(lv_scr_act());
  lv_label_set_recolor(info_title, 1);
  lv_label_set_text(info_title, "#FF0000 WARNING : \n#FF0000 Speed low !");
  lv_obj_align(info_title, LV_ALIGN_LEFT_MID, 0,0);

  // Create a title for coords
  coords_title = lv_label_create(lv_scr_act());
  lv_label_set_text(coords_title, "N48°42'46,49''\nE2°9'53,20''");
  lv_obj_align(coords_title, LV_ALIGN_TOP_RIGHT, 0,3);

  // Capteur I2C

  sensor.bus_read = sensor_I2C_read;
  sensor.bus_write =  sensor_I2C_write;
  sensor.delay_msec = (void*) HAL_Delay;
  sensor.dev_addr = BNO055_I2C_ADDR1 << 1;
  bno055_init2();
  HAL_Delay(1000);
  //bno055_set_operation_mode(BNO055_OPERATION_MODE_NDOF);


  acc_X = 0;
  acc_Y = 0;
  acc_Z = 0;
  mag_X = 0;
  mag_Y = 0;
  mag_Z = 0;
  gyro_X = 0;
  gyro_Y = 0;
  gyro_Z = 0;
  speed = 0;
  temp = 0;
  alt = 0;
  /* USER CODE END 2 */

  /* Call init function for freertos objects (in freertos.c) */
  MX_FREERTOS_Init();

  /* Start scheduler */
  osKernelStart();
  /* We should never get here as control is now taken by the scheduler */
  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure LSE Drive Capability
  */
  HAL_PWR_EnableBkUpAccess();

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_LSI|RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.LSIState = RCC_LSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 25;
  RCC_OscInitStruct.PLL.PLLN = 400;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 9;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Activate the Over-Drive mode
  */
  if (HAL_PWREx_EnableOverDrive() != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_6) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */
int8_t sensor_I2C_read(uint8_t dev_addr, uint8_t reg_addr,uint8_t * reg_data,uint8_t r_len){
	while(HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	HAL_I2C_Master_Transmit(&hi2c1, (uint16_t) dev_addr, &reg_addr,(uint16_t) 1,10);
	while(HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	HAL_I2C_Master_Receive(&hi2c1, (uint16_t) dev_addr, reg_data,(uint16_t) r_len+1,10);
	return 0;
}
int8_t sensor_I2C_write(uint8_t dev_addr, uint8_t reg_addr,uint8_t * reg_data,uint8_t wr_len){
	while(HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	HAL_I2C_Master_Transmit(&hi2c1, (uint16_t) dev_addr, reg_data,(uint16_t) wr_len+1,1);
	return 0;
}

void bno055_init2(){

	uint8_t donnees_Tx_i2c[8];
	uint8_t donnees_Rx_i2c[8];
	  donnees_Tx_i2c[0]=0x3F;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 1, 100);
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Receive(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Rx_i2c, 1, 100);

	  HAL_Delay(500); //delai 500 ms

	  donnees_Tx_i2c[1]=32;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  HAL_Delay(1000); //delai 1000 ms

	  // A envoyer lors du premier test
	  donnees_Tx_i2c[0]=PAGE_SWAP;
	  donnees_Tx_i2c[1]=1;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  donnees_Tx_i2c[0]=ACC_CONF;
	  donnees_Tx_i2c[1]=0x08;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  donnees_Tx_i2c[0]=GYR_CONF_0;
	  donnees_Tx_i2c[1]=0x23;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  donnees_Tx_i2c[0]=GYR_CONF_1;
	  donnees_Tx_i2c[1]=0;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  donnees_Tx_i2c[0]=MAG_CONF;
	  donnees_Tx_i2c[1]=0x1B;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  donnees_Tx_i2c[0]=PAGE_SWAP;
	  donnees_Tx_i2c[1]=0;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  donnees_Tx_i2c[0]=TEMP_SOURCE;
	  donnees_Tx_i2c[1]=0x01;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  donnees_Tx_i2c[0]=UNIT_SEL;
	  donnees_Tx_i2c[1]=0x01;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  donnees_Tx_i2c[0]=PWR_MODE;
	  donnees_Tx_i2c[1]=0x00;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);

	  donnees_Tx_i2c[0]=MODE_REG;
	  donnees_Tx_i2c[1]=FUSION_MODE;
	  while (HAL_I2C_GetState(&hi2c1) != HAL_I2C_STATE_READY);
	  HAL_I2C_Master_Transmit(&hi2c1, (uint16_t)ADRESSE_BNO<<1, donnees_Tx_i2c, 2, 100);
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
