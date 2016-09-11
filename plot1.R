setwd("C:/Users/Huang Jirong/Desktop/Exp data analysis")
dat = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

names(dat)
summary(dat)

# Date               Time           Global_active_power Global_reactive_power   Voltage          Global_intensity   Sub_metering_1    
# Length:2075259     Length:2075259     Length:2075259      Length:2075259        Length:2075259     Length:2075259     Length:2075259    
# Class :character   Class :character   Class :character    Class :character      Class :character   Class :character   Class :character  
# Mode  :character   Mode  :character   Mode  :character    Mode  :character      Mode  :character   Mode  :character   Mode  :character  

table(dat$Date)

dat_sub = subset(dat, dat$Date == "1/2/2007"| dat$Date == "2/2/2007")

png("plot1.png", width=480, height=480)
hist(as.numeric(dat_sub$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
