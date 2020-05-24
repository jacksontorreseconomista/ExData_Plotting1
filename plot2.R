#Reading Data 

datafile <- '/Volumes/NOSKAJ/Dropbox/07 PESQUISAS/R/COURSES/COUSERA/Data Science Specialization/Exploratory Data Analysis/project 1/household_power_consumption.txt'
powerdata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetingdata
powerdata_sb <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))


#manipulating data
 
powerdata_sb <- 
  transform(powerdata_sb, 
            Date = as.Date(Date, format="%d/%m/%Y"),
            Global_active_power = as.numeric(Global_active_power),
            Global_reactive_power = as.numeric(Global_reactive_power),
            Global_intensity = as.numeric(Global_intensity),
            Voltage = as.numeric(Voltage),
            Sub_metering_1 = as.numeric(Sub_metering_1),
            Sub_metering_2 = as.numeric(Sub_metering_2),
            Sub_metering_3 = as.numeric(Sub_metering_3))
datetime <- paste(powerdata_sb$Date, powerdata_sb$Time)
powerdata_sb$Datetime <- as.POSIXct(datetime)

str(powerdata_sb)

#Plot 2

with(powerdata_sb, {
  plot(Global_active_power ~ Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

