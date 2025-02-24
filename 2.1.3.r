max_dice <- 6
nb_events <- max_dice^2
sum <- rep.int(0, nb_events)
sum <- as.vector(sum)
event <- 0

for (i in 1:max_dice) {
  for (j in 1:max_dice) {
    event <- event + 1
    sum[event] <- i + j
  }
}

png("2.1.3.png", width=1920, height=1080)
hist(sum, breaks=c(1:12), col="blue1")
dev.off()

mean(sum)
var(sum)
sd(sum) 