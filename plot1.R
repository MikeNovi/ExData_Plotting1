# Reads in data from the "Individual household electric power consumption Data Set" and creates a plot 
# according to the specifications provided by the assignment

source("./loadData.R");

plot1 <- function(outputPNG=FALSE, pwrData=NULL) {
  if (is.null(pwrData)) {
    pwrData <- loadData()
  }
  
  if (outputPNG) {
    png("plot1.png", width=480, height=480)
  }

  par(cex.lab = 0.9, cex.axis=0.9)
  numGAP <- pwrData$Global_active_power[which(pwrData$Global_active_power != "?")]
  hist(as.numeric(numGAP), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

  if (outputPNG) {
    dev.off()
  }
}