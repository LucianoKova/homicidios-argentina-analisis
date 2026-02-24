![R](https://img.shields.io/badge/R-4.5.2-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
# Análisis de Homicidios en Argentina (SNIC) — R

## Descripción
Este repositorio contiene un análisis descriptivo de los registros del **Sistema Nacional de Información Criminal (SNIC)**, enfocado en **homicidios dolosos**. El flujo de trabajo carga un archivo CSV, filtra el delito de interés, agrega la información por año y genera salidas reproducibles (gráficos y un resumen).

## Objetivos
- Cargar y explorar el dataset en formato CSV.
- Filtrar el delito **“Homicidios dolosos”**.
- Calcular la cantidad anual de víctimas.
- Generar visualizaciones y un resumen textual automatizado.

## Metodología

1. Carga del dataset en formato CSV.
2. Filtrado del delito "Homicidios dolosos".
3. Agregación de víctimas por año.
4. Generación de visualizaciones.
5. Exportación de resultados reproducibles.

El análisis se realizó utilizando exclusivamente R base.

## Requisitos
- R (probado en R 4.5.2 en Windows).
- No se requieren paquetes adicionales (se utiliza R base).

## Estructura del proyecto
- `data/`: datos de entrada (CSV).
- `script.R`: script principal (carga, procesamiento y generación de salidas).
- `grafico.png`: evolución anual de víctimas (salida).
- `grafico_sexo.png`: comparación anual por sexo (salida, si se generó).
- `resumen.txt`: resumen automatizado (salida).

## Ejecución
1. Asegurarse de que el archivo CSV se encuentre en `data/datos.csv`.
2. Ejecutar el script desde R, ubicado en la raíz del proyecto:

```r
source("script.R")
## Conclusiones

El análisis permite observar la evolución anual de víctimas de homicidios dolosos y su distribución por sexo.  
Los resultados evidencian diferencias significativas entre víctimas masculinas y femeninas, lo que abre la puerta a futuros análisis más profundos (tendencias, tasas por población, análisis regional, etc.).

Este proyecto demuestra el uso de R para:
- Manipulación de datos
- Agregación estadística
- Visualización
- Generación de resultados reproducibles