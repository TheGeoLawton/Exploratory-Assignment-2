codes <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
SCC <- distinct(select(codes,SCC,SCC.Level.Two))
codes <- SCC[SCC$SCC.Level.Two %in% SCC$SCC.Level.Two[c(9,11:21)],]
remove(SCC) #Think of the memory!

#print(codes)

#NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips=="24510",]
#print(head(NEI))
NEI <- NEI[NEI$SCC %in% codes$SCC,]
#print(head(NEI))


p1 <- group_by(NEI, year) %>% summarise(Emissions = sum(Emissions))



g <- ggplot(p1,aes(year, Emissions))
gprime <- g + geom_line() + ggtitle("Vehicle Emissions in Baltimore")

#print(gprime)
dev.print(png,filename = "plot5.png", height = 400, width = 600) 