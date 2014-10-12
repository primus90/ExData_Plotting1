setwd("C:/Data Science Course/Exploratory Data Analysis/exdata-data-household_power_consumption")
library(data.table)
d <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings="?",stringsAsFactors = FALSE)
y <- paste(d$Date,d$Time)
d$DT <- y
d$DT <- strptime(d$DT,"%d/%m/%Y %H:%M:%S")
d$Date <- as.Date(as.character(d$Date),format = "%d/%m/%Y")
j <- d[d$Date >= "2007-02-01" & d$Date <= "2007-02-02",]

par(mfrow = c(2, 2))
##plot 1,1
plot(j$DT,j$Global_active_power,pch=27,type="o",ylab="Global Active Power",xlab="")

##plot 1,2
plot(j$DT,j$Voltage,pch=27,type="o",ylab="Voltage",xlab="datetime")

##plot 2,1
with(j,plot(j$DT,j$Sub_metering_1+j$Sub_metering_2+j$Sub_metering_3,type="n",ylab="Energy sub metering",xlab=""))
points(j$DT,j$Sub_metering_1,pch=27,type="o")
points(j$DT,j$Sub_metering_2,pch=27,type="o",col="red")
points(j$DT,j$Sub_metering_3,pch=27,type="o",col="blue")
legend("topright", pch = c(NA,NA,NA), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lwd=1)

##plot 2,2
plot(j$DT,j$Global_reactive_power,pch=27,type="o",ylab="Global_reactive_power",xlab="datetime")

dev.print(device=png, width=480, height=480, "plot4.png")

dev.off()