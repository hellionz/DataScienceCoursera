powerdf <- read.table(file = "household_power_consumption.txt", ##loads txt file into data frame
                      header = TRUE, sep =";", na.strings = "?") ##loads "?" as NA

subsetdf <- powerdf[66638:69517,] ##subsets the data for the relevant days
cleandf <- na.omit(subsetdf) ##Omits all NA data

onecol <- paste(cleandf$Date, cleandf$Time, sep =" ") ##combines date and time into one character string
onecol <- strptime(onecol, format="%d/%m/%Y %H:%M:%S", tz ="") ##changes them to POSIXlt
cleandf$DateTime <- onecol ##addends string to data frame

png(file = "plot3.png", bg = "transparent") ##starts PNG device, creates empty png named plot4.png
plot(x=cleandf$DateTime, y=cleandf$Sub_metering_1, type="l", main=" ", sub=" ", ylab="Energy sub metering", xlab=" ", col="black") ##plot 3
lines(x=cleandf$DateTime, y=cleandf$Sub_metering_2,  col="red")
lines(x=cleandf$DateTime, y=cleandf$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue")) ##end plot 3
dev.off()##closes device