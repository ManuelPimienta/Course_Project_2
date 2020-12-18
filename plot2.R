# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#  Librerrias a cargar
library(dplyr)
library(ggplot2)


#  Leer los datos
#NEI <- readRDS("~/Data/exdata_data_NEI_data/summarySCC_PM25.rds")
NEI <- readRDS("F:/Descargas/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("F:/Descargas/exdata_data_NEI_data/Source_Classification_Code.rds")


#Union de los marcos de datos NEI y SCC
NEI_SCC <- merge(NEI, SCC, key= SCC)

# Subset Baltimore 
Baltimore <- subset(NEI_SCC, fips=="24510", c(Emissions, year, fips))


# Promedio emisiones por años para Baltimore
promedio_ano_Baltimore <- with(Baltimore, tapply(Emissions, year, mean))


marco_anos_Baltimore <- data.frame(Year = names(promedio_ano_Baltimore), Promedio = promedio_ano_Baltimore)


with(marco_anos_Baltimore, barplot(Promedio, names= Year, col = Year, xlab="Year", ylab="Emissions Mean", main = "Total Emissions Mean Baltimore City, Maryland"))
dev.copy(png, file = "~/Curso 4 Exploratory Data Analysis/Proyecto-Exploratory-Data-Analysis/plot2.png", width = 880, height = 580) ## Copy my plot to a PNG file
dev.off()
