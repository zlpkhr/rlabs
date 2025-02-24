# Binomial Distribution Examples B(n,p)

# Example: Probability of getting four heads in six tosses of a fair coin
prob_4_heads <- dbinom(x = 4, size = 6, prob = 0.5)
print(paste("Probability of getting exactly 4 heads in 6 tosses:", prob_4_heads))

# Cumulative probability P(X ≤ 4) for six coin tosses
cum_prob <- pbinom(4, 6, 0.5)
print(paste("Probability of getting 4 or fewer heads in 6 tosses:", cum_prob))

# Plot probability mass function for different n values (p = 1/2)
colors <- c("black", "blue", "red", "green")
n_max <- 20
p <- 1/2

# Set up PNG device
png("binomial_distributions.png", width=800, height=600)

# Set up the plotting window
par(mfrow=c(1,1))

# Function to create binomial distribution plot
plot_binomial <- function(n, color, pch_val) {
  fd <- function(x) { dbinom(x, n, p) }
  if(color == "black") {
    plot(cbind(0:n, sapply(0:n, fd)),
         xlim=c(0, n_max), ylim=c(0, .40),
         type="p", ylab="Probability", xlab="Number of successes",
         pch=pch_val, cex=2, col=color, cex.axis=1.2)
  } else {
    points(cbind(0:n, sapply(0:n, fd)),
           xlim=c(0, n_max), ylim=c(0, .40),
           type="p", pch=pch_val, cex=2, col=color)
  }
}

# Plot for different n values
plot_binomial(5, colors[1], 15)
plot_binomial(10, colors[2], 16)
plot_binomial(15, colors[3], 17)
plot_binomial(20, colors[4], 18)

# Add legend
legend("topright", 
       legend=c("n=5", "n=10", "n=15", "n=20"),
       col=colors,
       pch=c(15,16,17,18),
       title="Binomial Distributions\np = 1/2",
       cex=0.8)

# Close the PNG device
dev.off()

# Problem: English class quiz
# 12 questions, 5 possible answers each, probability of correct answer = 0.2

# Probability of exactly 4 correct answers
prob_4_correct <- dbinom(4, size=12, prob=0.2)
print(paste("Probability of exactly 4 correct answers:", prob_4_correct))

# Probability of 4 or fewer correct answers (method 1)
prob_4_or_less <- sum(dbinom(0:4, size=12, prob=0.2))
print(paste("Probability of 4 or fewer correct answers (sum method):", prob_4_or_less))

# Probability of 4 or fewer correct answers (method 2 using cumulative probability)
prob_4_or_less_cum <- pbinom(4, size=12, prob=0.2)
print(paste("Probability of 4 or fewer correct answers (cumulative method):", prob_4_or_less_cum))
