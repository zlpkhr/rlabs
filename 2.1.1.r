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

expec <- 0
for (i in 1:score_max) {
  expec <- expec + proba[i] * i
}
print(expec) 