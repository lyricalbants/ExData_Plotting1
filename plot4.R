dat <- read.table("./household_power_consumption.txt",
                  sep=";", quote="", na.strings="?", nrows=2879, skip=66637)
names(dat) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

date <- as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
library(dplyr)
dat$Date <- date
dat <- select(dat, -Time)
dev.cur()
par(mfrow=c(2,2), mar=c(2.5,2,0.5,1), oma=c(0,0,2,0), mgp=c(1.2,0.4,0))
plot(dat$Date, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex.axis=0.6, cex.lab=0.8)
plot(dat$Date, dat$Voltage, type="l", xlab="Datetime", ylab="Voltage", cex.axis=0.6, cex.lab=0.8)

plot(dat$Date, dat$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", cex.axis=0.6, cex.lab=0.8)
points(dat$Date, dat$Sub_metering_2, type="l", col="red")
points(dat$Date, dat$Sub_metering_3, type="l", col="blue")
legend("topright", cex= 0.5, bty="n", lwd=1, pch=32, col=c("black", "blue", "red"), legend= c("Sub_metering_1",
                                                                                              "Sub_metering_2", 
                                                                                              "Sub_metering_3"))
plot(dat$Date, dat$Global_reactive_power, xlab="Datetime", ylab="Global_reactive_power", type="l", cex.axis=0.6, cex.lab=0.8)
dev.copy(png, file="plot4.png", width=480,height=480)
dev.off()
