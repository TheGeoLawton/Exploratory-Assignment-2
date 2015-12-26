#use the Base R Graphics system to show whether total Baltimore PM2.5 emissions have gone down since 1999

NEI <- readRDS("summarySCC_PM25.rds")
library(dplyr)
NEI <- NEI[NEI$fips=="24510",]
q1 <- group_by(NEI,year) %>% summarise(Total = sum(Emissions)) 
plot(q1,main = "Total Baltimore City Pollution", xlab = "Year", ylab = "Total Emissions")
lines(q1) #connect dots
beg <- NEI[NEI$year == min(NEI$year),] #subset for beginning pm2.5 value
end <- NEI[NEI$year == max(NEI$year),] #subset for ending pm2.5 value
#points(cbind(sum(beg$Emissions),unique(NEI$year)),col="red")
lines(cbind(unique(NEI$year),sum(beg$Emissions)),col="red") #Draw line and text for beg value
text(x= max(NEI$year), y = sum(.95*beg$Emissions), paste(min(NEI$year),"emissions:", format(sum(beg$Emissions), digits=5, big.mark = "," , big.interval = 3)), pos = 2, cex = .60, col = "red")
lines(cbind(unique(NEI$year),sum(end$Emissions)),col="green") #Draw line and text for end value
text(x= max(NEI$year), y = sum(1.05*end$Emissions), paste(max(NEI$year),"emissions:", format(sum(end$Emissions), digits=5, big.mark = "," , big.interval = 3)), pos = 2, cex = .60, col = "green")
dev.print(png,filename = "plot2.png", width = 600, height = 400)
