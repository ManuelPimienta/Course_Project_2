# Librerrias a cargar
library(dplyr)
library(ggplot2)

# Read data 
NEI <- readRDS("F:/Descargas/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("F:/Descargas/exdata_data_NEI_data/Source_Classification_Code.rds")
 
# Join the data frames
NEI_SCC <- merge(NEI, SCC, key= SCC)

# Filter the years and find the average emissions for each year
# Find the average value of emissions by data category 
promedio_ano <- with(NEI_SCC, tapply(Emissions, year, mean))

# Create the data frame for graphing
marco_anos <- data.frame(Emisiones = names(promedio_ano), Promedio = promedio_ano)

# Creating the chart
with(marco_anos, barplot(Promedio, names= Emisiones, col = Emisiones, xlab="Year", ylab="Emissions Mean", main = "Total Emissions Mean 1999 to 2008"))

# Save to image file
dev.copy(png, file = "~/Curso 4 Exploratory Data Analysis/Proyecto-Exploratory-Data-Analysis/plot1.png", width = 880, height = 580) ## Copy my plot to a PNG file
dev.off()
