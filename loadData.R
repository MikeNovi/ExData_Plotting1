# Common code for loading and inital processing of the data from the "Individual household electric power 
# consumption Data Set"

loadData <- function() {
  # Download the data, if necessary
  downloadData("household_power_consumption.txt")
  
  # Open the file and read in the data
  pwrData <- read.csv("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors=FALSE)
  
  # Remove data outside of 01/02/2007 and 02/02/2007
  pwrData <- subset(pwrData, Date %in% c("2/2/2007", "1/2/2007"))
  
  # Convert the date column to date and time to time
  pwrData$DateTime <- strptime(paste(pwrData$Date, pwrData$Time), "%d/%m/%Y %H:%M:%S")
  pwrData$Date <- as.Date(as.character(pwrData$Date), "%d/%m/%Y")
  
  pwrData
}

downloadData <- function(filename) {
  if (!file.exists(filename)) {
    tempfile <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", tempfile, method="curl")
    unzip(tempfile, filename)
    unlink(tempfile)
  }
}