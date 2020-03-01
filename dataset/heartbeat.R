data <- read.csv(file.choose())

head(data)

data <- data[1:61, ]

i <- 1
for(i in seq_len(nrow(data)))
{
  data$Time <- gsub(" AM", "", data$Time)
}

data$Time <- as.POSIXct(data$Time, format="%d/%m/%Y %H:%M:%S")

library("ggplot2")

plot <- ggplot(data = data)
plot1 <- plot + geom_line(aes(x=data$Time, y=data$Value))
plot2 <- plot1 + geom_hline(yintercept = 61.25, colour="Red", size=1.2, linetype = 3)
plot3 <- plot2 + xlab("Time Stamps") + ylab("Heart Rate Value") + ggtitle("Plot of Heart Rate during interview")
plot4 <- plot3 + theme(axis.title.x = element_text(colour = "Light Blue", size = 30),
                       axis.title.y = element_text(colour = "Light Blue", size = 30),
                       axis.text.x = element_text(size = 20),
                       axis.text.y = element_text(size = 10),
                       legend.title = element_text(size = 30),
                       legend.text = element_text(size = 20),
                       legend.justification = c(1,1),
                       plot.title = element_text(colour = "Red", size = 20, family = "Courier", hjust = 0.5))

plot4 <- plot4 + xlim(c(as.POSIXct('2017-01-10 12:00:00', format="%Y-%m-%d %H:%M:%S"),
                        (as.POSIXct('2017-01-10 13:00:00', format="%Y-%m-%d %H:%M:%S"))))

plot4

