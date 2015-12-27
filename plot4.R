codes <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
SCC <- distinct(select(codes,SCC,SCC.Level.Three))
codes <- SCC[SCC$SCC.Level.Three %in% c("Anthracite Coal", "Bituminous/Subbituminous Coal"),]
remove(SCC) #Think of the memory!

NEI <- readRDS("summarySCC_PM25.rds")
NEI2 <- NEI[NEI$SCC %in% codes$SCC,]

p1 <- group_by(NEI2, year) %>% summarise(Emissions = sum(Emissions))

g <- ggplot(p1,aes(year, Emissions))
gprime <- g + geom_line() + ggtitle("Coal-Related Emissions in the US")

print(gprime)
dev.print(png, height = 400, width = 600, filename = "plot4.png")