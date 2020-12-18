library(dplyr)
library(ggplot2)
library(tidyverse)

NEI <- readRDS("F:/Descargas/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("F:/Descargas/exdata_data_NEI_data/Source_Classification_Code.rds")

NEI_SCC <- merge(NEI, SCC, key= SCC)

Baltimore <- subset(NEI_SCC, fips=="24510", c(Emissions, year, Data.Category))


# Promedio por año 
promedio_ano_baltimore <- with(Baltimore, tapply(Emissions, year, mean))

# Promedio por tipo
promedio_tipo_baltimore <- with(Baltimore, tapply(Emissions, Data.Category, mean))


SCC.year09 <- unique(subset(Baltimore, year==1999, na.rm = TRUE))
SCC.year08 <- subset(Baltimore, year==2008)

# categorias <- table(SCC.year09$Data.Category)

categorias <- table(Baltimore$Data.Category)


# Hallar el valor promedio de emisiones por categoria de datos 
valor_promedio01 <- with(SCC.year09, tapply(Emissions, Data.Category, mean))
valor_promedio08 <- with(SCC.year08, tapply(Emissions, Data.Category, mean))


marco_01 <- data.frame(emisones = names(valor_promedio01), promedio = valor_promedio01)
marco_02 <- data.frame(emisones = names(valor_promedio08), promedio = valor_promedio08)


rango <- range(marco_01$promedio, marco_08$promedio, na.rm = TRUE)

ggp <- ggplot(marco_01, aes(emisones, promedio)) +
  geom_point(data = marco_01, col = "red") +
  geom_smooth(se = FALSE) +
  labs(title = "Emissions by type 1999 to 2008") +
  geom_point(data = marco_02, col = "blue") +
  annotate("text", label = "Red: 1999", x = 2, y = 15, size = 8, colour = "red") +
  annotate("text", label = "Blue: 2008", x = 3, y = 30, size = 8, colour = "blue")
ggp
dev.copy(png, file = "~/Curso 4 Exploratory Data Analysis/Proyecto-Exploratory-Data-Analysis/plot3.png", width = 880, height = 580) ## Copy my plot to a PNG file
dev.off()
