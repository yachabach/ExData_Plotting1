# Generate plot #1 from coursera assignment
# 
Plot1 <- function() {

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
png(file = "plot1.png")

#draw histogram as assigned
#
with(z,hist(as.numeric(Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
}