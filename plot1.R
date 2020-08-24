# Generate plot #1 from coursera assignment
# 
Plot1 <- function() {

# Load data from working directory
# 

fileNm <- "household_power_consumption.txt"
y <- fread(fileNm)

#subset textual date data
z <- y[grep('^1/2/2007|^2/2/2007',y$Date),]

# Open png output device
# 
png(file = "plot1.png")

#draw histogram as assigned
#
hist(as.numeric(z$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
}