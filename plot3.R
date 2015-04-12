source("loadData.R")

plot3 <- function(outputPNG=FALSE, pwrData=NULL, legend=TRUE) {
  if (is.null(pwrData)) {
    pwrData <- loadData()
  }
  
  if (outputPNG) {
    png("plot3.png", width=480, height=480)
  }
  
  par(cex.lab = 0.9, cex.axis=0.9)
  num_sm1 <- pwrData[pwrData$Sub_metering_1 != "?", ]
  num_sm2 <- pwrData[pwrData$Sub_metering_2 != "?", ]
  num_sm3 <- pwrData[pwrData$Sub_metering_3 != "?", ]
  
  plot(num_sm1$DateTime, num_sm1$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  points(num_sm1$DateTime, num_sm1$Sub_metering_1, type="l")
  points(num_sm2$DateTime, num_sm2$Sub_metering_2, type="l", col="red")
  points(num_sm3$DateTime, num_sm3$Sub_metering_3, type="l", col="blue")
  
  if (legend) {
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
  }
  
  if (outputPNG) {
    dev.off()
  }
}