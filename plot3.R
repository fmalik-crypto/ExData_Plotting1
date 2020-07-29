#this file contains the code to generate plot2.png using data set "Electric power consumption"

# read the dataset "Electric power consumption"
mydata <- read.table('data.txt', sep=';', header=TRUE)

# subset the dataset by converting the Date from char to date format and then filtering on Feb 01 and 02, 2007 data
mydata %>% mutate(Date = strptime(Date, %d%m%Y) %>% filter(Date == as.Date("02/01/2007", %d%m%Y) | Date == as.Date("02/02/2007", %d%m%Y))

# create plot in png file                                
png(filename='plot3.png', width=480, height=480, units='px')

# plot the filtered Global_active_power 
plot(mydata$Time, mydata$Sub_metering_1, type="l", ylab="Energy sub metering")

# close the file
dev.off()
