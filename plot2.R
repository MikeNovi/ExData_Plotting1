source("loadData.R")

plot2 <- function(outputPNG=FALSE, pwrData=NULL, yLabel="Global Active Power (kilowatts)") {
  if (is.null(pwrData)) {
    pwrData <- loadData()
  }
  
  if (outputPNG) {
    png("plot2.png", width=480, height=480)
  }
  
  par(cex.lab = 0.9, cex.axis=0.9)
  numGAP <- pwrData[pwrData$Global_active_power != '?', ]
  plot(numGAP$DateTime, as.numeric(numGAP$Global_active_power), type="l", xlab="", ylab=yLabel)
  
  if (outputPNG) {
    dev.off()
  }
}