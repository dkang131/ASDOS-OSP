# Generate some random data
set.seed(123)
data <- rnorm(100)

# Calculate kernel density estimate
density_est <- density(data)

# Plot the density estimate
plot(density_est, main = "Kernel Density Estimation")

# Create the empirical distribution function
edf <- ecdf(data)

# Plot the empirical distribution function
plot(edf, main = "Empirical Distribution Function", xlab = "Value", ylab = "Probability")

# Add a legend
legend("bottomright", legend = "Empirical Distribution Function", col = "black", lty = 1)
