#NEI <- readRDS("summarySCC_PM25.rds")
library(dplyr)
q1 <- group_by(NEI,year) %>% summarise(Total = sum(Emissions))
plot(q1,main = "Total US Pollution", xlab = "Year", ylab = "Total Emissions")
lines(q1)
beg <- NEI[NEI$year == min(NEI$year),]
end <- NEI[NEI$year == max(NEI$year),]
#points(cbind(sum(beg$Emissions),unique(NEI$year)),col="red")
lines(cbind(unique(NEI$year),sum(beg$Emissions)),col="red")
text(x= max(NEI$year), y = sum(.95*beg$Emissions), paste(min(NEI$year),"emissions:", format(sum(beg$Emissions), digits=5, big.mark = "," , big.interval = 3)), pos = 2, cex = .60, col = "red")
lines(cbind(unique(NEI$year),sum(end$Emissions)),col="green")
text(x= max(NEI$year), y = sum(1.05*end$Emissions), paste(max(NEI$year),"emissions:", format(sum(end$Emissions), digits=5, big.mark = "," , big.interval = 3)), pos = 2, cex = .60, col = "green")
dev.print(png,filename = "plot1.png", width = 600, height = 400)
