library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips %in% c("24510","06037"),]
#print(head(NEI))
NEI <- NEI[NEI$type == "ON-ROAD",]
#print(head(NEI))
NEI <- cbind(NEI, ifelse(NEI$fips== "06037", "Los Angeles", "Baltimore"))
names(NEI) <- c("fips", "SCC", "Pollutant", "Emissions", "type", "year", "City")
#print(head(NEI))


p1 <- group_by(NEI, year, City) %>% summarise(Emissions = sum(Emissions))



g <- ggplot(p1,aes(year, Emissions))
gprime <- g + geom_line(aes(color=City)) + ggtitle("Vehicle Emissions in Baltimore and LA")

print(gprime)
dev.print(png,filename = "plot6.png", height = 400, width = 600) 