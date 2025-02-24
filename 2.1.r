max <- 6
nb_events <- max
proba <- as.vector(1:max)

for (i in 1:max) {
  proba[i] <- 1 / nb_events
}

require(ggplot2)

png("2.1.png", width=1920, height=1080)
qplot(factor(1:max), proba[1:max],
xlab = "Value obtained by one die",
ylab = "Probability") + geom_bar(stat="identity")
dev.off() 