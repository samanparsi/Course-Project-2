library("ggplot2")
library("dplyr")
pm0<-readRDS("summarySCC_PM25.rds")

totalEmissions<-pm0%>%
    subset(fips == "24510") %>%
    group_by(year,type)%>%
    summarise(totEmissions=sum(Emissions,na.rm=TRUE))

plot3<-ggplot(totalEmissions,aes(year,totEmissions))
plot3<-plot3+ geom_point(color="red",size=2,alpha=1/2)+facet_grid(.~type)+xlab("year")+
        ylab("Total Emissions [Tons]") +
       ggtitle("Total Annual Emissions in Baltimore by Year")
plot3