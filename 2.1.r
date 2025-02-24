max <- 6
nb_events <- max
proba <- as.vector(1:max)

for (i in 1:max) {
  proba[i] <- 1 / nb_events
}

require(ggplot2)

# One Die Plot
png("2.1.png", width=1920, height=1080)
qplot(factor(1:max), proba[1:max],
      xlab="Value obtained by one die",
      ylab="Probability") + 
  geom_bar(stat="identity")
dev.off()

# Two Dice
max_dice <- 6
score_max <- max_dice * 2
nb_events <- max_dice^2
proba <- rep.int(0, score_max)
proba <- as.vector(proba)

for (i in 1:max_dice) {
  for (j in 1:max_dice) {
    proba[i + j] <- proba[i + j] + 1 / nb_events
  }
}

png("2.1_two_dice.png", width=1920, height=1080)
qplot(factor(1:score_max), proba[1:score_max],
      xlab="Value obtained with the sum of two dice",
      ylab="Probability") + 
  geom_bar(stat="identity")
dev.off() 