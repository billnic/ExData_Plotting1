Electric <- read.table(file.choose(),
                       header=TRUE, sep=";",na.strings = "?",
                       stringsAsFactors = FALSE)
Elec<-filter(Electric,Date=="1/2/2007" | Date=="2/2/2007")
rm(Electric)
a<-strptime(paste(Elec$Date, Elec$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
Elec<-cbind(Elec,DayTime=as.POSIXct(a))
rm(a)
hist(Elec$Global_active_power,col="orangered2",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png, file = "plot1.png",width = 480, height = 480)
dev.off()
