# Generate plot #2 from coursera assignment
# 
Plot3 <- function() {
        
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
png(file = "plot3.png")

#Build the datetime variable for plotting
#
#

a <- z[,datetime:=as.POSIXct(paste(z$Date,z$Time),format = "%d/%m/%Y %H:%M:%S")]
a

#draw graph as assigned
#
with(a,plot(Sub_metering_1~datetime, type = "l", ylab = "Energy sub metering", xlab = "", col = "black"))
with(a,lines(Sub_metering_2~datetime, col = "red"))
with(a,lines(Sub_metering_3~datetime, col = "blue"))
legend("topright",legend = colnames(a[,7:9]), col = c("black", "red", "blue"), lwd = 2)
dev.off()
}