setwd("C:/Data Science Course/Exploratory Data Analysis/exdata-data-household_power_consumption")
library(data.table)
d <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings="?",stringsAsFactors = FALSE)
y <- paste(d$Date,d$Time)
d$DT <- y
d$DT <- strptime(d$DT,"%d/%m/%Y %H:%M:%S")
d$Date <- as.Date(as.character(d$Date),format = "%d/%m/%Y")
j <- d[d$Date >= "2007-02-01" & d$Date <= "2007-02-02",]
with(j,plot(j$DT,j$Global_active_power,type="o",pch=27,xlab="",ylab="Global Active Power (Kilowatts"))
dev.print(device=png, width=480, height=480, "plot2.png")
dev.off()