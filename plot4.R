source("plot2.R")
source("plot3.R")

plot4 <- function(outputPNG=FALSE, pwrData=NULL) {
  if (is.null(pwrData)) {
    pwrData <- loadData()
  }
  
  if (outputPNG) {
    png("plot4.png", width=480, height=480)
  }
  
  par(mfrow = c(2,2), mar=c(4,4,4,2), cex.axis=0.9, cex.lab = 0.9)
  plot2(pwrData=pwrData, yLabel="Global Active Power");
  
  numV <- pwrData[pwrData$Voltage != '?',]
  plot(numV$DateTime, as.numeric(numV$Voltage), type="l", xlab="datetime", ylab="Voltage")
  
  plot3(pwrData=pwrData, legend=FALSE);
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n", cex=0.8)
 
  numGRP <- pwrData[pwrData$Global_reactive_power != '?',]
  plot(numGRP$DateTime, as.numeric(numGRP$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power") 
  
  if (outputPNG) {
    dev.off()
  }
  
  par(mfrow = c(1,1))
}