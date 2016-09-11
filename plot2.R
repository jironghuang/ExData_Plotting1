setwd("C:/Users/Huang Jirong/Desktop/Exp data analysis")
dat = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

dat_sub = subset(dat, dat$Date == "1/2/2007"| dat$Date == "2/2/2007")
dat_sub$date_time = strptime(paste(dat_sub$Date, dat_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

dat_sub$Global_active_power = as.numeric(dat_sub$Global_active_power)

png("plot2.png", width=480, height=480)
plot(dat_sub$date_time, dat_sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
