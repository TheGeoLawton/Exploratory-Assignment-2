#NEI <- readRDS("summarySCC_PM25.rds")
#library(dplyr)
q1 <- group_by(NEI,year) %>% summarise(Total = sum(Emissions))
plot(q1,main = "Total US Pollution", xlab = "Year", ylab = "Total Emissions")
lines(q1)
beg <- NEI[NEI$year == min(NEI$year),]
#points(cbind(sum(beg$Emissions),unique(NEI$year)),col="red")
lines(cbind(unique(NEI$year),sum(beg$Emissions)),col="red")
dev.print(png,filename = "plot1.png", width = 600, height = 400)
