#Making fourth plots:



#loading the necessary packages:

library(dplyr)
library(plyr)



#Reading the text file and sub setting accordingly:

data<- read.table("household_power_consumption.txt", header = TRUE, 
                  stringsAsFactors = FALSE, sep = ";", dec = ".")

household<- data[data$Date %in% c ("1/2/2007", "2/2/2007"),]



#Finding dates and converting them into date class of Posix

paste1<- paste(household$Date, household$Time, sep=" ")
days <- strptime(paste1, "%d/%m/%Y %H:%M:%S") 


#Removing Na strings

Vlt<- as.numeric(household$Voltage)
Glr<- as.numeric(household$Global_reactive_power)
Glb<- as.numeric(household$Global_active_power)
Mt1<- as.numeric(household$Sub_metering_1)
Mt2<- as.numeric(household$Sub_metering_2)
Mt3<- as.numeric(household$Sub_metering_3)



#Specifying out layout

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol= c(2,2))



#1

plot(days, Glb, type = "l", ylab = "Global Active Power (kilowatts)" )


#2

plot(days, Mt1, ylab = "Energy Sub Metering", type = "l")
lines(days,Mt2, col = "red")
lines(days, Mt3, col = "blue")
legend("topright",lty = 1, lwd = 1, col = c("black", "red", "blue"), legend =
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#3
plot(days, Vlt, lwd = 0.1, type = "l", ylab = "Voltage", xlab = "datetime")



#4
plot(days,Glr, lwd = 0.1, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off() #closing the png connection
