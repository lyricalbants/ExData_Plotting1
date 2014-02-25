library(readtext)
dat <- read.table("./household_power_consumption.txt",
                  sep=";", quote="", na.strings="?", nrows=2879, skip=66637)
names(dat) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

date <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
library(dplyr)
dat$Date <- date
dat <- select(dat, -Time)
dev.cur()
with(dat, plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", width=480,height=480)
dev.off()