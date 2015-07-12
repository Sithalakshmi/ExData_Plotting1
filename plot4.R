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

#Constructing plot#4
par(mfcol=c(2,2))
with(subset_power,{
  plot(Global_active_power~Datetime,type="l",xlab="",ylab="Global Active Power")
  plot(Sub_metering_1~Datetime,type="l",col='Black',xlab="",ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7,lty=1,bty="n",col=c("Black","Red","Blue"))
  plot(Voltage~Datetime,type="l",xlab="datetime",ylab="Voltage")
  plot(Global_reactive_power~Datetime,type="l",xlab="datetime",ylab="Global_reactive_power")
})

#Saving to PNG file
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()