# Geometric Distribution Examples G(p)

# Example: Rolling a die until getting a '1'
p <- 1/6  # probability of success (getting a '1')

# Calculate probabilities for first 10 trials
x <- 1:10
prob_x <- dgeom(x-1, p)  # x-1 because dgeom counts failures before success

# Print probabilities for first few trials
for(i in 1:10) {
    print(paste("P(X =", i, ") =", round(prob_x[i], 4)))
}

# Expected value E(X) = 1/p
expected_value <- 1/p
print(paste("Expected number of trials:", round(expected_value, 2)))

# Variance V(X) = (1-p)/p^2
variance <- (1-p)/p^2
print(paste("Variance:", round(variance, 2)))
print(paste("Standard deviation:", round(sqrt(variance), 2)))

# Create PNG plot of probability mass function
png("geometric_distribution.png", width=800, height=600)

# Plot probability mass function
plot(x, prob_x, type="h", 
     lwd=2,
     col="blue",
     main="Geometric Distribution P(X = x)\nProbability of First Success on Trial x",
     xlab="Number of trials (x)",
     ylab="Probability",
     ylim=c(0, max(prob_x)*1.1))
points(x, prob_x, pch=19, col="red")

# Add cumulative probabilities
cum_prob <- pgeom(x-1, p)
lines(x, cum_prob, col="green", lwd=2)

# Add legend
legend("right", 
       legend=c("Probability mass function", "Cumulative probability"),
       col=c("blue", "green"),
       lwd=c(2,2))

# Add grid
grid()

dev.off()

# Calculate some interesting probabilities
# P(X ≤ 5) - Probability of success within first 5 trials
prob_within_5 <- pgeom(4, p)  # 4 because we count failures before success
print(paste("Probability of success within first 5 trials:", round(prob_within_5, 4)))

# P(X > 10) - Probability of needing more than 10 trials
prob_more_than_10 <- 1 - pgeom(9, p)
print(paste("Probability of needing more than 10 trials:", round(prob_more_than_10, 4)))

# Generate random samples from geometric distribution
n_samples <- 1000
samples <- rgeom(n_samples, p) + 1  # +1 to count the success trial

# Create PNG plot of simulation
png("geometric_simulation.png", width=800, height=600)

# Plot histogram of samples
hist(samples, 
     breaks=30,
     col="lightblue",
     main="Simulation of 1000 Series of Die Rolls\nNumber of Rolls Until First '1'",
     xlab="Number of trials needed",
     ylab="Frequency")

# Add vertical line for expected value
abline(v=expected_value, col="red", lwd=2)
legend("topright", 
       legend="Expected value",
       col="red",
       lwd=2)

dev.off()

# Print simulation results
print(paste("Mean of simulation:", round(mean(samples), 2)))
print(paste("Variance of simulation:", round(var(samples), 2))) 