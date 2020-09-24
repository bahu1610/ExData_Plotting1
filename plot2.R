#Making the second plot:


#loading the necessary packages:

library(dplyr)
library(plyr)




#Reading the text file and subs setting accordingly:

data<- read.table("household_power_consumption.txt", header = TRUE, 
                  stringsAsFactors = FALSE, sep = ";", dec = ".")


household<- data[data$Date %in% c ("1/2/2007", "2/2/2007"),]



#Removing question marks if any:

Glb<- as.numeric(household$Global_active_power)



#Finding dates and converting them into date class of Posix

paste1<- paste(household$Date, household$Time, sep=" ")
days <- strptime(paste1, "%d/%m/%Y %H:%M:%S") 



#Plotting:

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(days,Glb, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="" )
dev.off()
