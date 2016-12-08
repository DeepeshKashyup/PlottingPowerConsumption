plot2<- function(){
  plot(df$SetTime,df$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
  dev.copy(png,file="plot2.png")
  dev.off()
  cat("Plot2.png created in ",getwd())
}