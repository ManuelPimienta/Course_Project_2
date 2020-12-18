# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

library(dplyr)
library(ggplot2)
library(tidyverse)

NEI <- readRDS("F:/Descargas/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("F:/Descargas/exdata_data_NEI_data/Source_Classification_Code.rds")

NEI_SCC <- merge(NEI, SCC, key= SCC)

Baltimore_Veicle <- subset(NEI_SCC, fips=="24510", c(Emissions, year, SCC.Level.Three))

Los_Angeles_Veicle <- subset(NEI_SCC, fips=="06037", c(Emissions, year, SCC.Level.Three))

# Filtro para vehiculos en Baltimore
vehicle_Bal <- Baltimore_Veicle %>%
  filter(grepl("Vehicles", SCC.Level.Three))

# Filtro para vehiculos en Los Angeles
vehicle_Ang <- Los_Angeles_Veicle %>%
  filter(grepl("Vehicles", SCC.Level.Three))

# Promedio emisiones por años para Baltimore

mean_vehicle_ano_Baltimore <- with(vehicle_Bal, tapply(Emissions, year, mean))

# Marco de datos para Baltimore
marco_vehicle_Baltimore <- data.frame(Year = names(mean_vehicle_ano_Baltimore), Promedio = mean_vehicle_ano_Baltimore)

# Promedio emisiones por años para Los Angeles

mean_vehicle_ano_Los_Angeles <- with(vehicle_Ang, tapply(Emissions, year, mean))

# Marco de datos para Los Angeles
marco_vehicle_Los_Angeles <- data.frame(Year = names(mean_vehicle_ano_Los_Angeles), Promedio = mean_vehicle_ano_Los_Angeles)


# Graficar
par(mfrow = c(1,2))
with(marco_vehicle_Baltimore, barplot(Promedio, names= Year, col = Year, xlab="Year", ylab="Emissions Mean", main = "Emissions Motor Vehicle Sources Baltimore"))
with(marco_vehicle_Los_Angeles, barplot(Promedio, names= Year, col = Year, xlab="Year", ylab="Emissions Mean", main = "Emissions Motor Vehicle Sources Los Angeles"))
dev.copy(png, file = "~/Curso 4 Exploratory Data Analysis/Proyecto-Exploratory-Data-Analysis/plot6.png", width = 880, height = 580) ## Copy my plot to a PNG file
dev.off()
