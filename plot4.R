
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999–2008? 
# Librerrias a cargar
# coal combustion - Fuel Comb - Electric Generation - Coal


library(dplyr)
library(ggplot2)

NEI <- readRDS("F:/Descargas/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("F:/Descargas/exdata_data_NEI_data/Source_Classification_Code.rds")

NEI_SCC <- merge(NEI, SCC, key= SCC)


coal_combustion <- unique(subset(NEI_SCC, NEI_SCC$EI.Sector == "Fuel Comb - Electric Generation - Coal"))

# Promedio por año de coal combustion
promedio_ano_coal_combustion <- with(coal_combustion, tapply(Emissions, year, mean))

coal_combustion$year

marco_anos_coal_combustion <- data.frame(Year = names(promedio_ano_coal_combustion), Promedio = promedio_ano_coal_combustion)

with(marco_anos_coal_combustion, barplot(Promedio , names= Year, col = Year, xlab="Year", ylab="Emissions Mean", main = "Total Emissions Mean From Coal Combustion"))
dev.copy(png, file = "~/Curso 4 Exploratory Data Analysis/Proyecto-Exploratory-Data-Analysis/plot4.png", width = 880, height = 580) ## Copy my plot to a PNG file
dev.off()
