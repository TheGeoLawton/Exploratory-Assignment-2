NEI <- readRDS("summarySCC_PM25.rds") #Read in RDS
library(ggplot2)
library(dplyr)
NEI <- NEI[NEI$fips== "24510",]
q1 <- group_by(NEI,year,type) %>% summarise(Emissions = sum(Emissions)) #Group by type and year

g <- ggplot(q1, aes(year, Emissions)) #basic aesthetics
gprime <- g + geom_path(aes(color = type)) #add the path geome (lines() equivalent)

dev.print(device = png, filename = "plot3.PNG", width= 600, height = 400)
