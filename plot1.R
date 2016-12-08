plot1<- function(){
  hist(df$Global_active_power,col="red",main="Global Active Power")
  dev.copy(png,file="plot1.png")
  dev.off()
  cat("Plot1.png created in ",getwd())
}