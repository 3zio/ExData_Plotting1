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
png(filename = 'plot3.png', width = 640, height = 640)

par(cex = 1.20)

plot(data[, 2], data[, 7], type = 'l', main = '', ylab = 'Energy sub metering',
     xlab = '')

lines(data[, 2], data[, 8], type = 'l', main = '', ylab = 'Energy sub metering',
      xlab = '', col = 'red')

lines(data[, 2], data[, 9], type = 'l', main = '', ylab = 'Energy sub metering',
      xlab = '', col = 'blue')

legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), pch = '____', xjust = 1)

dev.off()