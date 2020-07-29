#this file contains the code to generate plot4.png using data set "Electric power consumption"

# read the dataset "Electric power consumption"
mydata <- read.table('data.txt', sep=';', header=TRUE)

# subset the dataset by converting the Date from char to date format and then filtering on Feb 01 and 02, 2007 data
mydata %>% mutate(Date = strptime(Date, %d%m%Y) %>% filter(Date == as.Date("02/01/2007", %d%m%Y) | Date == as.Date("02/02/2007", %d%m%Y))

# create plot in png file                                
png(filename='plot4.png', width=480, height=480, units='px')

# plot the filtered Global_active_power 
par(mfrow = c(2,2), mar = c(2,2,1,0))

plot(mydata$Time, mydata$Global_active_power, type="l", ylab="Global Active Power")

plot(mydata$Time, mydata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(mydata$Time, mydata$Sub_metering_1, type="l", ylab="Energy sub metering")

lines(mydata$Time, mydata$Sub_metering_2, col="red")
lines(mydata$Time, mydata$Sub_metering_3, col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1, 1, 1))

plot(mydata$Time, mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# close the file
dev.off()
