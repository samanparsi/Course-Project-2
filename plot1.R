library("ggplot2")
library("dplyr")
pm0<-readRDS("summarySCC_PM25.rds")
totalEmissions<-pm0%>%
    group_by(year)%>%
    summarise(totalEmissions=sum(Emissions,na.rm=TRUE))

head(totalEmissions)

with(totalEmissions,
     plot(x=year,y=totalEmissions,ylab = "Total Annual Emissions [Tons]", 
          xlab = "Year",
          main = "Total Annual Emissions in the US by Year",
          cex = 1,
          pch = 1,
          col = "red",
          lwd = 2)
     
     )
delta<-totalEmissions[totalEmissions$year==2008,2]-
    totalEmissions[totalEmissions$year==1999,2]
delta
print("Total emissions from PM2.5 have decreased in the US from 
      1999 to 2008 by 3868761 tons")
