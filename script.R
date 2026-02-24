# Cargar datos
df <- read.csv("data/datos.csv")

# Filtrar homicidios dolosos
homi <- subset(df, codigo_delito_snic_nombre == "Homicidios dolosos")

# Sumar víctimas por año
homi_anual <- aggregate(cantidad_victimas ~ anio,
                        data = homi,
                        sum,
                        na.rm = TRUE)

# Crear gráfico y guardarlo
png("grafico.png", width = 1000, height = 600)

plot(homi_anual$anio,
     homi_anual$cantidad_victimas,
     type = "l",
     xlab = "Año",
     ylab = "Cantidad de víctimas",
     main = "Homicidios dolosos por año en Argentina")

dev.off()