library("ggplot2")
library("dplyr")
NEI<-readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
vehicle.scc <- SCC[grep("[Vv]eh", SCC$Short.Name), ]

emissions.motor.baltimore <- NEI %>% 
    subset(fips == "24510" & NEI$SCC %in% vehicle.scc$SCC) %>%
    merge(y = vehicle.scc, by.x = "SCC", by.y = "SCC") %>%
    group_by(year) %>%
    summarize(Vehicle.Emissions.Type = sum(Emissions, na.rm = TRUE))


emissions.motor.baltimore.plot <- ggplot(emissions.motor.baltimore, aes(year, Vehicle.Emissions.Type)) +
    geom_point(color = "red", 
               size = 4, 
               alpha = 1/3) + 
    xlab("Year") +
    ylab("Total Emissions [Tons]") +
    ggtitle("Total Annual Vehicle Emissions in Baltimore City")

emissions.motor.baltimore.plot
emissions.motor.baltimore.2008 <- emissions.motor.baltimore[emissions.motor.baltimore$year  == 2008, 2]
emissions.motor.baltimore.1999 <- emissions.motor.baltimore[emissions.motor.baltimore$year  == 1999, 2]

delta.baltimore <- emissions.motor.baltimore.2008 - emissions.motor.baltimore.1999
print("Emissions from motor vehicles in Baltimore have decreased by 258.5445426 tons from 1999 to 2008.")