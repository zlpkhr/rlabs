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

variance <- 0
for (i in 1:score_max) {
  variance <- variance + (expec - i)^2 * proba[i]
}
print(variance)

st_deviation <- sqrt(variance)
print(st_deviation)

expec_square <- 0
for (i in 1:score_max) {
  expec_square <- expec_square + proba[i] * i^2
}
variance_bis <- expec_square - (expec^2)
print(variance_bis)

u_variance <- variance * (nb_events / (nb_events - 1)) 