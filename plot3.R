plot3<- function(){
  plot(df$SetTime,df$Sub_metering_1,type="n",ylab="Energy Sub Metering",xlab= "")
  points(df$SetTime,df$Sub_metering_1,type="l")
  points(df$SetTime,df$Sub_metering_2,type="l",col="red")
  points(df$SetTime,df$Sub_metering_3,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty="solid")
  dev.copy(png,file="plot3.png",width=720,height=480)
  dev.off()
  cat("Plot3.png created in ",getwd())
}