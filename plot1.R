setwd("C:/Data Science Course/Exploratory Data Analysis/exdata-data-household_power_consumption"libra)
library(data.table)
d <- read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings="?")
d$Date <- as.Date(as.character(d$Date),format = "%d/%m/%Y")
j <- d[d$Date >= "2007-02-01" & d$Date <= "2007-02-02",]
hist(j$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.print(device=png, width=480, height=480, "plot1.png")
dev.off()
