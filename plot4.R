# Code to generate third plot of Exploratory data analysis

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
png(filename = 'plot4.png', width = 640, height = 640)

par(mfrow = c(2,2), cex = 1.0, cex.main = 1.10)

# Plot 1
plot(data[, 2], data[, 3], type = 'l', main = '', ylab = 'Global Active Power',
     xlab = '')

# Plot 2
plot(data[, 2], data[, 5], type = 'l', main = '', ylab = 'Voltage',
     xlab = 'datetime')

# Plot 3
plot(data[, 2], data[, 7], type = 'l', main = '', ylab = 'Energy sub metering', xlab = '')

lines(data[, 2], data[, 8], type = 'l', main = '', ylab = 'Energy sub metering', xlab = '',
      col = 'red')

lines(data[, 2], data[, 9], type = 'l', main = '', ylab = 'Energy sub metering', xlab = '',
      col = 'blue')

legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), pch = '__', xjust = 1, box.lty = 0)

# Plot 4
plot(data[, 2], data[, 4], type = 'l', main = '', ylab = 'Global_reactive_power',
     xlab = 'datetime')

dev.off()