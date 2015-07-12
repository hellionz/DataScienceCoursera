powerdf <- read.table(file = "household_power_consumption.txt", ##loads txt file into data frame
                      header = TRUE, sep =";", na.strings = "?") ##loads "?" as NA

subsetdf <- powerdf[66638:69517,] ##subsets the data for the relevant days
cleandf <- na.omit(subsetdf) ##Omits all NA data

onecol <- paste(cleandf$Date, cleandf$Time, sep =" ") ##combines date and time into one character string
onecol <- strptime(onecol, format="%d/%m/%Y %H:%M:%S", tz ="") ##changes them to POSIXlt
cleandf$DateTime <- onecol ##addends string to data frame

png(file = "plot1.png", bg = "transparent") ##starts PNG device, creates empty png named plot4.png
hist(x=cleandf$Global_active_power, freq=TRUE, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim= c(0, 1200)) ##plot 1
dev.off()##closes device