# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(dplyr)
library(ggplot2)
library(tidyverse)

NEI <- readRDS("F:/Descargas/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("F:/Descargas/exdata_data_NEI_data/Source_Classification_Code.rds")

NEI_SCC <- merge(NEI, SCC, key= SCC)


Baltimore_Veicle <- subset(NEI_SCC, fips=="24510", c(Emissions, year, SCC.Level.Three))

# Filtro para vehiculos en Baltimore
vehicle <- Baltimore_Veicle %>%
  filter(grepl("Vehicles", SCC.Level.Three))


# Promedio emisiones por años para Baltimore
mean_vehicle_ano_Baltimore <- with(vehicle, tapply(Emissions, year, mean))

# Marco de datos 
marco_vehicle_Baltimore <- data.frame(Year = names(mean_vehicle_ano_Baltimore), Promedio = mean_vehicle_ano_Baltimore)

with(marco_vehicle_Baltimore, barplot(Promedio, names= Year, col = Year, xlab="Year", ylab="Emissions Mean", main = "Emissions Motor Vehicle Sources Baltimore"))
dev.copy(png, file = "~/Curso 4 Exploratory Data Analysis/Proyecto-Exploratory-Data-Analysis/plot5.png", width = 880, height = 580) ## Copy my plot to a PNG file
dev.off()
