dat <- read.table("./household_power_consumption.txt", sep=";", quote="", na.strings="?",
                  nrows=2879, skip=66637)
names(dat) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                "Sub_metering_1","Sub_metering_2","Sub_metering_3")
dev.cur()
with(dat, hist(Global_active_power, xlab="Global Ative Power (kilowatts)",
               main="", col="red"))
dev.copy(png, file="plot1.png", width=480,height=480)
dev.off()