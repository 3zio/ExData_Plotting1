# Code to generate first plot of Exploratory data analysis

setwd('D:/coursera/datascience/Exploratory')

# Read and filter the data
data <- read.table('household_power_consumption.txt', header = T, sep = ';',
                   colClasses = 'character', strip.white = T)
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]

# Change column data types
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data[, 3:9] <- sapply(data[, 3:9], as.numeric)
data$Time <- paste(data$Date, ' ', data$Time)
data$Time <- strptime(data$Time, '%Y-%m-%d %H:%M:%S')

# Start the plot
png(filename = 'plot1.png', width = 640, height = 640)

par(mar = c(5.1, 5.1, 4.1, 1.1))

hist(data[,3], col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency', cex.lab = 1.20, cex.axis = 1.20, cex.main = 1.50, cex.sub = 1.20)

dev.off()