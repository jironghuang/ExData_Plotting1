setwd("C:/Users/Huang Jirong/Desktop/Exp data analysis")
dat = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

dat_sub = subset(dat, dat$Date == "1/2/2007"| dat$Date == "2/2/2007")
dat_sub$date_time = strptime(paste(dat_sub$Date, dat_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

dat_sub$Global_active_power = as.numeric(dat_sub$Global_active_power)
dat_sub$Global_reactive_power = as.numeric(dat_sub$Global_reactive_power)
dat_sub$Voltage = as.numeric(dat_sub$Voltage)
dat_sub$Sub_metering_1 = as.numeric(dat_sub$Sub_metering_1) 
dat_sub$Sub_metering_2 = as.numeric(dat_sub$Sub_metering_2)
dat_sub$Sub_metering_3 = as.numeric(dat_sub$Sub_metering_3)

#Setting the template for 2 time 2 graphs
png("plot4.png", width=480, height=480); par(mfrow = c(2, 2)) 

#1st plot
plot(dat_sub$date_time, dat_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#2nd plot
plot(dat_sub$date_time, dat_sub$Voltage, type="l", xlab="datetime", ylab="Voltage")

#3rd plot
plot(dat_sub$date_time, dat_sub$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(dat_sub$date_time, dat_sub$Sub_metering_2, type="l", col="red"); lines(dat_sub$date_time, dat_sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#4th plot
plot(dat_sub$date_time, dat_sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
