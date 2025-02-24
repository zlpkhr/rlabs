require(stats)

for (i in 1:10) {
  x <- round(runif(1))
  print(x)
}

proba <- as.vector(1:1000)
sum <- 0

for (i in 1:1000) {
  x <- round(runif(1))
  sum <- sum + x
  proba[i] <- sum / i
}

png("1.png", width=1920, height=1080)

plot(1:1000, proba[1:1000], "l", xlim=c(1,1000), ylim=c(0,1),
     main="Relative Frequency of Heads",
     xlab="Number of Tosses",
     ylab="Relative Frequency")
segments(0, 0.5, 1000, 0.5, col="red")

dev.off()