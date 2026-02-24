# =========================
# 1) Cargar datos
# =========================
df <- read.csv("data/datos.csv")

# =========================
# 2) Filtrar homicidios dolosos
# =========================
homi <- subset(df, codigo_delito_snic_nombre == "Homicidios dolosos")

# =========================
# 3) Sumar víctimas por año
# =========================
homi_anual <- aggregate(
  cantidad_victimas ~ anio,
  data = homi,
  sum,
  na.rm = TRUE
)

# Ordenar por año (por las dudas)
homi_anual <- homi_anual[order(homi_anual$anio), ]

# =========================
# 4) Resumen simple
# =========================
max_row <- homi_anual[which.max(homi_anual$cantidad_victimas), ]
min_row <- homi_anual[which.min(homi_anual$cantidad_victimas), ]

resumen <- data.frame(
  indicador = c("Año con MÁS víctimas", "Año con MENOS víctimas"),
  anio = c(max_row$anio, min_row$anio),
  cantidad_victimas = c(max_row$cantidad_victimas, min_row$cantidad_victimas)
)

# Guardar resumen en un txt
writeLines(
  c(
    "Resumen: Homicidios dolosos (víctimas por año)",
    paste0("Año con MÁS víctimas: ", max_row$anio, " (", max_row$cantidad_victimas, ")"),
    paste0("Año con MENOS víctimas: ", min_row$anio, " (", min_row$cantidad_victimas, ")")
  ),
  "resumen.txt"
)

# =========================
# 5) Gráfico (línea + puntos) y guardar PNG
# =========================
png("grafico.png", width = 1000, height = 600)

plot(
  homi_anual$anio,
  homi_anual$cantidad_victimas,
  type = "o",                 # o = linea + puntos
  xlab = "Año",
  ylab = "Cantidad de víctimas",
  main = "Homicidios dolosos por año en Argentina"
)

dev.off()

# Mostrar mensaje final
print("Listo: se generaron grafico.png y resumen.txt")
# =========================
# Comparación hombres vs mujeres
# =========================

homi_sexo <- aggregate(
  cbind(cantidad_victimas_masc, cantidad_victimas_fem) ~ anio,
  data = homi,
  sum,
  na.rm = TRUE
)

png("grafico_sexo.png", width = 1000, height = 600)

plot(
  homi_sexo$anio,
  homi_sexo$cantidad_victimas_masc,
  type = "l",
  lty = 1,
  xlab = "Año",
  ylab = "Cantidad de víctimas",
  main = "Homicidios dolosos por sexo"
)

lines(
  homi_sexo$anio,
  homi_sexo$cantidad_victimas_fem,
  lty = 2
)

legend("topright",
       legend = c("Masculino", "Femenino"),
       lty = c(1,2))

dev.off()