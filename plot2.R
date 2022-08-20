
library("ggplot2")
library("dplyr")
pm0<-readRDS("summarySCC_PM25.rds")
pm1<-subset(pm0,fips=="24510")
totalEmissions<-pm1%>%
    group_by(year)%>%
    summarise(totalEmissions=sum(Emissions,na.rm=TRUE))

head(totalEmissions)

with(totalEmissions,
     plot(x=year,y=totalEmissions,ylab = "Total Annual Emissions [Tons]", 
          xlab = "Year",
          main = "Total Annual Emissions in the  Baltimore City by Year",
          cex = 1,
          pch = 1,
          col = "red",
          lwd = 2)
     
)
print("It's obvius that overall Emissions in Baltimore has been reduced")