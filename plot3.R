#Making the third plot


#loading the necessary packages:
library(dplyr)
library(plyr)



#Reading the text file and subsetting accordingly:

data<- read.table("household_power_consumption.txt", header = TRUE, 
                  stringsAsFactors = FALSE, sep = ";", dec = ".")


household<- data[data$Date %in% c ("1/2/2007", "2/2/2007"),]

#Removing NA values

Mt1<- as.numeric(household$Sub_metering_1)
Mt2<- as.numeric(household$Sub_metering_2)
Mt3<- as.numeric(household$Sub_metering_3)


#Finding dates and converting them into date class of Posix

paste1<- paste(household$Date, household$Time, sep=" ")
days <- strptime(paste1, "%d/%m/%Y %H:%M:%S") 


#Plotting


png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(days, Mt1, ylab = "Energy Sub Metering", xlab = "", type = "l")
lines(days, Mt2, col = "red")
lines(days, Mt3, col = "blue")
legend("topright",lty = 1, lwd = 1, col = c("black", "red", "blue"), legend =
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()