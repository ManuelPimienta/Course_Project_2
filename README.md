# Course_Project_2
Proyecto en R sobre gráfico de datos de partículas contaminantes

Para cada año y para cada tipo de fuente de PM, el NEI registra cuántas toneladas de PM2.5 se emitieron desde esa fuente durante el transcurso de todo el año. Los datos que utilizará para esta asignación son para 1999, 2002, 2005 y 2008.

## Criterios de revisión
Para cada pregunta

***¿La trama parece abordar la pregunta que se hace?***

***¿El código R presentado es apropiado para la construcción de la parcela presentada?***


Datos

Los datos para esta tarea están disponibles en el sitio web del curso como un solo archivo zip:

Datos para la evaluación por pares [29Mb]

El archivo zip contiene dos archivos:

PM2.5 Emissions Data (summarySCC_PM25.rds): este archivo contiene un marco de datos con todos los datos de emisiones de PM2.5 para 1999, 2002, 2005, y 2008. Para cada año, la tabla contiene el número de toneladas de PM2.5 emitidas por un tipo específico de fuente durante todo el año. Aquí están las primeras filas.

fips: un número de cinco dígitos (representado como una cadena) que indica el condado de EE. UU.

SCC: El nombre de la fuente como se indica mediante una cadena de dígitos (consulte la tabla de clasificación del código fuente)

Popullant: Una cadena que indica el contaminante.

Emissions: Cantidad de PM2.5 emitida, en toneladas

type: El tipo de fuente (puntual, no puntual, en carretera o fuera de carretera)

year: El año de las emisiones registradas

Source Classification Code Table (Source_Classification_Code.rds): Esta tabla proporciona un mapeo de las cadenas de dígitos SCC en la tabla de Emisiones al nombre real de la fuente de PM2.5. Las fuentes se clasifican de diferentes formas, desde las más generales a las más específicas, y puede optar por explorar las categorías que considere más útiles. Por ejemplo, la fuente "10100101" se conoce como "Ext Comb / Electric Gen / Antracita Carbón / Carbón pulverizado".

Asignación

El objetivo general de esta tarea es explorar la base de datos del Inventario Nacional de Emisiones y ver lo que dice sobre la contaminación por partículas finas en los Estados Unidos durante el período de diez años 1999-2008. Puede utilizar cualquier paquete de R que desee para respaldar su análisis.

Preguntas

Debe abordar las siguientes preguntas y tareas en su análisis exploratorio. Para cada pregunta / tarea, necesitará hacer un solo diagrama. A menos que se especifique, puede usar cualquier sistema de trazado en R para hacer su trazado.

1. ¿Han disminuido las emisiones totales de PM2.5 en los Estados Unidos de 1999 a 2008? Utilizando el sistema de trazado base (base plotting system), haga un diagrama que muestre la emisión total de PM2.5 de todas las fuentes para cada uno de los años 1999, 2002, 2005 y 2008.