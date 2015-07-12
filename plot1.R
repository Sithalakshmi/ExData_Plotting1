#Reading and loading data
setwd("C:/Coursera_usr/Datascience_assg/ExpDataAnlys_Assg1/exdata-data-household_power_consumption")
power_data <- read.delim("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#Converting to date format
power_data$Date <- as.Date(power_data$Date,format="%d/%m/%Y")
#Subsetting data for specified dates
subset_power <- subset(power_data,subset=(Date>='2007-02-01'& Date<= '2007-02-02'))

#Constructing plot#1
hist(subset_power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving to PNG file
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()