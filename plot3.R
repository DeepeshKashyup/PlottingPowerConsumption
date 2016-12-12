plot3<- function(){
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

  plot(df$SetTime,df$Sub_metering_1,type="n",ylab="Energy Sub Metering",xlab= "")
  points(df$SetTime,df$Sub_metering_1,type="l")
  points(df$SetTime,df$Sub_metering_2,type="l",col="red")
  points(df$SetTime,df$Sub_metering_3,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty="solid")
  dev.copy(png,file="plot3.png",width=720,height=480)
  dev.off()
  cat("Plot3.png created in ",getwd())
}