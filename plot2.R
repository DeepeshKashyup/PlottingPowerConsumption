plot2<- function(){
#code to download and transform data 
	if(!file.exists("exdata-Fdata-Fhousehold_power_consumption.zip")){
	  temp<-tempfile()
	  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
	  f <- unzip(temp)
	  unlink(temp)
	}

	rawdf <-read.table(f,header=TRUE,sep=";",na.strings = "?")
	mydf <-rawdf[rawdf$Date %in% c("1/2/2007","2/2/2007"),]
	SetTime <-strptime(paste(mydf$Date, mydf$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
	df<- cbind(SetTime,mydf)

  plot(df$SetTime,df$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
  dev.copy(png,file="plot2.png")
  dev.off()
  cat("Plot2.png created in ",getwd())
}