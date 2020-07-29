#this file contains the code to generate plot2.png using data set "Electric power consumption"

# read the dataset "Electric power consumption"
# subset the dataset by converting the Date from char to date format and then filtering on Feb 01 and 02, 2007 data
mydata <- tbl_df(read.table("household_power_consumption.txt", sep=';', header=TRUE) 
                 %>% mutate(Date = strptime(Date, "%d/%m/%Y")) 
                 %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
                 %>% mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))))

# create plot in png file                                
png(filename='plot4.png', width=480, height=480, units='px')

# plot the filtered Global_active_power 
par(mfcol = c(2,2))

#plot2
plot(mydata$Time, as.numeric(mydata$Global_active_power, na.rm = TRUE), 
     type="l", xlab="", ylab="Global Active Power")

#plot3
plot(mydata$Time, as.numeric(mydata$Sub_metering_1, na.rm = TRUE), 
     type="l", xlab = "",  ylab="Energy sub metering")
lines(mydata$Time, mydata$Sub_metering_2, col="red")
lines(mydata$Time, mydata$Sub_metering_3, col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col=c('black', 'red', 'blue'), lty=c(1, 1, 1), bty="n", cex=0.7)

#plot5
plot(mydata$Time, as.numeric(mydata$Voltage, na.rm = TRUE), 
     type="l", xlab="datetime", ylab="Voltage")

#plot6
plot(mydata$Time, as.numeric(mydata$Global_reactive_power, na.rm = TRUE), 
     type="l", xlab="datetime", ylab="Global_reactive_power")

# close the file
dev.off()
