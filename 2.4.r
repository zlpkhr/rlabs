# Poisson Distribution Examples P(λ)

# Example: Cars crossing a bridge
lambda <- 12  # average number of cars per minute

# Calculate probabilities for 0 to 25 cars
x <- 0:25
prob_x <- dpois(x, lambda)

# Print probabilities for some interesting values
print("Probability mass function values:")
for(i in c(10:14)) {  # values around the mean
    print(paste("P(X =", i, ") =", round(prob_x[i+1], 4)))  # +1 because x starts at 0
}

# Expected value and variance
print(paste("Expected value (λ) =", lambda))
print(paste("Variance (λ) =", lambda))
print(paste("Standard deviation =", round(sqrt(lambda), 4)))

# Create PNG plot of probability mass function
png("poisson_distribution.png", width=800, height=600)

# Plot probability mass function
plot(x, prob_x, type="h", 
     lwd=2,
     col="blue",
     main="Poisson Distribution P(λ=12)\nProbability of X Cars per Minute",
     xlab="Number of cars (x)",
     ylab="Probability",
     ylim=c(0, max(prob_x)*1.1))
points(x, prob_x, pch=19, col="red")

# Add cumulative probabilities
cum_prob <- ppois(x, lambda)
lines(x, cum_prob, col="green", lwd=2)

# Add vertical line at mean
abline(v=lambda, col="red", lty=2)

# Add legend
legend("right", 
       legend=c("Probability mass function", "Cumulative probability", "Mean (λ)"),
       col=c("blue", "green", "red"),
       lwd=c(2,2,1),
       lty=c(1,1,2))

# Add grid
grid()

dev.off()

# Bridge crossing problem
# P(X ≥ 17) = 1 - P(X ≤ 16)

# Method 1: Using lower tail
prob_16_or_less <- ppois(16, lambda)
prob_17_or_more <- 1 - prob_16_or_less
print("\nBridge crossing problem:")
print(paste("P(X ≤ 16) =", round(prob_16_or_less, 4)))
print(paste("P(X ≥ 17) = 1 - P(X ≤ 16) =", round(prob_17_or_more, 4)))

# Method 2: Using upper tail directly
prob_17_or_more_direct <- ppois(16, lambda, lower.tail=FALSE)
print(paste("P(X ≥ 17) using upper tail =", round(prob_17_or_more_direct, 4)))

# Simulation to verify our results
n_simulations <- 10000
samples <- rpois(n_simulations, lambda)

# Create PNG plot of simulation
png("poisson_simulation.png", width=800, height=600)

# Plot histogram of samples
hist(samples, 
     breaks=seq(-0.5, max(samples)+0.5, by=1),  # center bars on integers
     col="lightblue",
     main="Simulation of 10000 Minutes\nNumber of Cars Crossing Bridge per Minute",
     xlab="Number of cars",
     ylab="Frequency",
     probability=TRUE)  # show probabilities instead of counts

# Add theoretical Poisson probabilities
points(x, prob_x, type="h", col="red", lwd=2)
points(x, prob_x, pch=19, col="red")

# Add legend
legend("topright", 
       legend=c("Simulation", "Theoretical"),
       fill=c("lightblue", "red"))

dev.off()

# Print simulation results
empirical_prob <- mean(samples >= 17)
print("\nSimulation results:")
print(paste("Simulated probability of 17 or more cars:", round(empirical_prob, 4)))
print(paste("Mean of simulation:", round(mean(samples), 4)))
print(paste("Variance of simulation:", round(var(samples), 4))) 