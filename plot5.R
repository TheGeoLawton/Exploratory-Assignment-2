library(dplyr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips=="24510",]
#print(head(NEI))
NEI <- NEI[NEI$type =="ON-ROAD",]
#print(head(NEI))


p1 <- group_by(NEI, year) %>% summarise(Emissions = sum(Emissions))



g <- ggplot(p1,aes(year, Emissions))
gprime <- g + geom_line() + ggtitle("Vehicle Emissions in Baltimore")

print(gprime)
dev.print(png,filename = "plot5.png", height = 400, width = 600) 