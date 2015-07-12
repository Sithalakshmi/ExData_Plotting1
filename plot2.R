#Reading and loading data
setwd("C:/Coursera_usr/Datascience_assg/ExpDataAnlys_Assg1/exdata-data-household_power_consumption")
power_data <- read.delim("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#Converting to date format
power_data$Date <- as.Date(power_data$Date,format="%d/%m/%Y")
#Subsetting data for specified dates
subset_power <- subset(power_data,subset=(Date>='2007-02-01'& Date<= '2007-02-02'))
#Creating a new column with concatenation of Date and Time
Power_Datetime <- paste(subset_power$Date,subset_power$Time)
subset_power$Datetime <- as.POSIXct(Power_Datetime)

#Constructing plot#2
plot(subset_power$Global_active_power~subset_power$Datetime,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Saving to PNG file
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()