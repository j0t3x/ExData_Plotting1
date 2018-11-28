
if( !("hpc.zip" %in% dir()) ){
  download.file(
    "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip", 
    destfile="hpc.zip"
  )
  # unzip the file
  unzip("hpc.zip")
}


