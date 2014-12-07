# Code to generate second plot of Exploratory data analysis

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
png(filename = 'plot2.png', width = 640, height = 640)

plot(data[, 2], data[, 3], type = 'l', main = '', ylab = 'Global Active Power (kilowatts)',
     xlab = '', cex.lab = 1.20, cex.axis = 1.20, cex.sub = 1.20)

dev.off()