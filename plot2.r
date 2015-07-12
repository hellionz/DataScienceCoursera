powerdf <- read.table(file = "household_power_consumption.txt", ##loads txt file into data frame
                      header = TRUE, sep =";", na.strings = "?") ##loads "?" as NA

subsetdf <- powerdf[66638:69517,] ##subsets the data for the relevant days
cleandf <- na.omit(subsetdf) ##Omits all NA data

onecol <- paste(cleandf$Date, cleandf$Time, sep =" ") ##combines date and time into one character string
onecol <- strptime(onecol, format="%d/%m/%Y %H:%M:%S", tz ="") ##changes them to POSIXlt
cleandf$DateTime <- onecol ##addends string to data frame

png(file = "plot2.png", bg = "transparent") ##starts PNG device, creates empty png named plot4.png
plot(x=cleandf$DateTime, y=cleandf$Global_active_power, type="l", main="", sub="", xlab="", ylab="Global Active Power (kilowatts)") ##plot 2
dev.off()##closes device