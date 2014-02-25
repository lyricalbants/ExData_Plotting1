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
par(mar=c(1,8,0,8), oma=c(1,0,0.5,0), pty="s")
with(dat, plot(Date, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"), cex.axis=0.8, cex.lab=0.8)
points(dat$Date, dat$Sub_metering_2, type="l", col="red")
points(dat$Date, dat$Sub_metering_3, type="l", col="blue")
legend("topright", cex = 0.7, lwd=0.1, pch=32, col=c("black", "blue", "red"), legend= c("Sub_metering_1",
                                                          "Sub_metering_2", 
                                                          "Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480,height=480)
dev.off()
