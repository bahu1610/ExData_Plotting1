#loading the necessary packages:
library(dplyr)
library(plyr)


#Reading the text file and subsetting accordingly:
data<- read.table("household_power_consumption.txt", header = TRUE, 
                  stringsAsFactors = FALSE, sep = ";", dec = ".")
 

household<- data[data$Date %in% c ("1/2/2007", "2/2/2007"),]

#Removing question marks if any:
Glb<- as.numeric(household$Global_active_power)


#Making the first plot:

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(Glb,  main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency" )

dev.off()






