# Generate plot #2 from coursera assignment
# 
Plot4 <- function() {
        
#load dependencies
#
library(data.table)

# Load data from working directory
# 

fileNm <- "household_power_consumption.txt"
hd <- fread(fileNm, nrows = 1)
y <- fread(fileNm, skip = 64800, nrows = 5000, header = TRUE)
colnames(y) = colnames(hd)

#subset textual date data
z <- y[grep('^1/2/2007|^2/2/2007',y$Date),]

# Open png output device
# 
png(file = "plot4.png")

#Build the datetime variable for plotting
#
#

a <- z[,datetime:=as.POSIXct(paste(z$Date,z$Time),format = "%d/%m/%Y %H:%M:%S")]

# Set the drawing space and margins
# 
par(mfrow = c(2,2), oma = c(2,2,2,2), mar = c(4,4,2,2))

#draw graphs as assigned
#
with(a,plot(Global_active_power~datetime, type = "l", ylab = "Global Active Power", xlab = ""))
with(a,plot(Voltage~datetime, type = "l", ylab = "Voltage", xlab = "datetime"))
with(a,plot(Sub_metering_1~datetime, type = "l", ylab = "Energy sub metering", xlab = "", col = "black"))
with(a,lines(Sub_metering_2~datetime, col = "red"))
with(a,lines(Sub_metering_3~datetime, col = "blue"))
legend("topright",legend = colnames(a[,7:9]), col = c("black", "red", "blue"), lwd = 2, bty = "n")
with(a,plot(Global_reactive_power~datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()
}