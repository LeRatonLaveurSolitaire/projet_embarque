# Projet embarqué : Horizon artificiel

## Introduction

Le but de ce projet fût de créer un horizon artificiel comme ceux que l'on trouve dans les avions à l'aide d'une carte STM32F746G-DISCO. Pour se faire, la bibliotèque LittleVGL (LVGL) à été utilisé conjointement avec le système d'exploitation FreeRTOS. Le capteur bno055 à été utilisé fin de récupérer les données gyroscopique, magnétométrique et d'accélération.

## Données affichés à l'écran

 Au centre de l'écran se trouve l'horizon se déplacant en fonction des données du capteur. Une ligne verte indique le centre, le bleu représente le ciel et le marron le sol.
 A droite se trouve un roller indiquant l'altitude, au dessus une boussole indiquant le point cardinal vers lequel on se dirige (N, NE, E, SE, S, SW, W, NW) et à gauche se trouve un autre roller indiquant la vitesse en m/s actuelle de l'avion.
 Les données de vitesse et d'altitude se basent sur une intégrtion et intégration double des données d'accélération ce qui n'est pas le plus précis et pourrais être amélioré à l'aide d'un capteur GPS.
 En haut à gauche se trouve une zone de texte actuellement fixe mais prévue pour afficher les coordonnées GPS. En haut gauche se trouve une zone de texte indiquant la date, l'heure et la température du capteur. D'autres données peuvent être afficher au milieu à gauche.
 
## Les taches
 
### LVGLTimer

Cette tache n'a pour but que de faire tourner l'affichage par LVGL avec La fonction  `lv_timer_handler()`.

### LVGLTick

Cette tache n'a pour but que d'indiqué combien de temps s'est écoulé depuis son dernier appel à LVGL à l'aide de la fonction `lv_tick_handler()`.

### accelerometre_I2C

Cette tache va dans un premier temps lire les 9 axes + température du capteur puis traiter les donnees afin de positionner les données de LVGL au bon endroit avec les bons paramètres.

### NMEA_UART

TACHE NON IMPLEMENTE

Cette tache à pour but de traiter les données NMEA récupérer du buffer UART relié au GPS puis de mettre à jour les objets LVGL correspondant avec les bonnes valeurs.

### Reset vitesse

Cette tache permet de remettre à 0 la vitesse et l'altitude lorsque l'on presse le bouton 1

### Reset Horizon

Cette tache permet de remettre à 0 l'horizon lorsque l'on appuie sur le bouton 2

## Conclusion sur le projet

LVGL est une biblioteque très lourde qui occupe beaucoup de place en mémoire. Ce problème à causé de nombreux crash / hard_fault et ne m'a pas permis d'implémenter le NMEA via UART. L'utilisation de l'API du captur bno055 n'a jamais marché, il a fallut réutiliser du code écrit à la main (le .h de l'api est quand même pratique pour rapidement avoir les registres)

# Tutoriel pour mettre en oeuvre LVGL sur STM32F746G-DISCO avec FreeRTOS

Ce tutoriel est fait le 19/04/2023, il ne sera possiblement plus valide dans le futur.
Actuellement, LVGL utilise la librairie contenue dans HAL_DRIVER qui est identique à STM32F7xx_HAL_Driver utiliser par FreeRTOS.
Dans tous les cas, reportez vous à la documentation officiel : https://docs.lvgl.io/master/index.html

## Configuration de FreeRTOS & des periphériques

Dans un premier temps, il faut utiliser MX_CUBE afin de configurer comme désirer tous les périphériques et FreeRTOS (Ne pas oublier les deux routines de LVGL)puis générer le code et ne plus y toucher (MX_CUBE utilise STM32F7xx_HAL_Driver qui vient causer des problèmes avec HAL_DRIVER).

## importer LVGL et les bibliotèques associées

Dans le dossier Drivers, importer toutes les biblioteques nécéssaire à votre projet ( au minimum LVGL, hal_stm_lvgl, HAL_DRIVER et Utilities dans le cas de LVGL)
Ajouter ensuite le dossier Driver et les sous dossier au path jusqu'à ne plus avoir d'erreur. (clique droit sur le dossier puis `add/remove include path...`
la biblioteque hal_stm_lvgl s'occuper de tout l'affichage et du tactile, il n'y a plus besoin de BSP, de LTDC ou de stm32746g_discovery_ts/lcd.
Cette dernière biblioteque s'occupe également d'initialiser le buffer utiliser par LVGL dans la suite.

Supprimer STM32F7xx_HAL_Driver et déplacer STM32746G-Discovery dans Utilities.

Configurer LVGL à l'aide du fichier lv_conf.h et le placer à coté du dossier LVGL

## Lancer LVGL dans le projet

Importer LVGL et les hal_stm_lvgl nécessaires, les initialiser dans le `main()` à l'aide de `lv_init();` pour LVGL, `SCB_EnableICache();`, `SCB_EnableDCache();`, `tft_init();` pour l'écran LCD (car utilisation du DMA) , `touchpad_init();` pour le tactile.

## Ajout des taches de LVGL

Configurer les deux taches de LVGL lancant `lv_task_handler();` et `lv_tick_inc(periode);`.

C'est bon, vous êtes prêt à utiliser LVGL, il ne vous reste plus qu'à déclarer vos objets et à les modifier en fonction de vos besoins. LVGL et le HAL se charge de l'affichage et du tactile. En cas de problème, RTFM !

