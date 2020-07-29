#this file contains the code to generate plot1.png using data set "Electric power consumption"

# read the dataset "Electric power consumption"
# subset the dataset by converting the Date from char to date format and then filtering on Feb 01 and 02, 2007 data
mydata <- tbl_df(read.table("household_power_consumption.txt", sep=';', header=TRUE) 
                  %>% mutate(Date = strptime(Date, "%d/%m/%Y")) 
                  %>% filter(Date == "2007-02-01" | Date == "2007-02-02"))

# create plot in png file                                
png(filename='plot1.png', width=480, height=480, units='px')

# plot the filtered Global_active_power 
hist(as.numeric(mydata$Global_active_power), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

# close the file
dev.off()
