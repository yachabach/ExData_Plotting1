# Generate plot #2 from coursera assignment
# 
Plot2 <- function() {
        
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
png(file = "plot2.png")

#Build the datetime variable for plotting
#
#

a <- z[,datetime:=as.POSIXct(paste(z$Date,z$Time),format = "%d/%m/%Y %H:%M:%S")]
a

#draw graph as assigned
#
with(a,plot(Global_active_power~datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
}