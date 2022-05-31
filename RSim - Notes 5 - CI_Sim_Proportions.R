# Try with n = 50, 100, 200, 500
# Runs slowly if reps are increased much over 1000

n <- 500
reps <- 1000

# Create vectors to store values
thetavals <- seq(.01,.99,.01)
thetahat <- rep(NA, reps); lower <- rep(NA, reps); upper <- rep(NA, reps)
thetaadj <- rep(NA, reps); loweradj <- rep(NA, reps); upperadj <- rep(NA, reps)
lowercp <- rep(NA, reps); uppercp <- rep(NA, reps)
cover <- rep(NA, length(thetavals)); coveradj <- cover; covercp <- cover

# Simulate *reps* random samples and creates three types of intervals for each
for (i in 1:length(thetavals)) {

  theta <- thetavals[i]
  x <- rbinom(reps, n, theta)

  for(j in 1:reps) {
    nu1 <- 2*(n-x[j]+1)
    nu2 <- 2*x[j]
    nu3 <- 2*(x[j]+1)
    nu4 <- 2*(n-x[j])
    F12 <- qf(.975, nu1, nu2)
    F34 <- qf(.975, nu3, nu4)
    thetahat[j] <- x[j] / n
    lower[j] <- thetahat[j] - 1.96 * sqrt((thetahat[j] * (1 - thetahat[j])) / n)
    upper[j] <- thetahat[j] + 1.96 * sqrt((thetahat[j] * (1 - thetahat[j])) / n)
    
    thetaadj[j] <- (x[j] + 2) / (n + 4)
    loweradj[j] <- thetaadj[j] - 1.96 * sqrt((thetaadj[j] * (1 - thetaadj[j])) / n)
    upperadj[j] <- thetaadj[j] + 1.96 * sqrt((thetaadj[j] * (1 - thetaadj[j])) / n)

    lowercp[j] <- 1 / (1 + ((n-x[j]+1)/x[j])*F12)
    uppercp[j] <- ((x[j]+1)/(n-x[j]))*F34 / ( (1 + (((x[j]+1)/(n-x[j]))*F34)))
  }
  cover[i] <- mean((lower < theta) & (upper > theta))
  coveradj[i] <- mean((loweradj < theta) & (upperadj > theta))
  covercp[i] <- mean((lowercp < theta) & (uppercp > theta))
}


# Plots smoothed versions of coverage for three methods

plot(loess.smooth(thetavals,cover, degree = 2), type="l", ylim=c(.8,1), 
     col = "#56B4E9", lwd = 2, ylab = "Simulation coverage", xlab = "True theta",
     main = paste("Coverage of", reps, "CIs for samples of size", n))
lines(loess.smooth(thetavals,coveradj, degree = 2), type = "l", col = "#009E73",
      lwd = 2)
lines(loess.smooth(thetavals,covercp, degree = 2), type = "l", col = "#D55E00",
      lwd = 2)
abline(h = .95, lty = 2, lwd = 2)
legend("bottomleft", legend = c("Standard", "Rule of 2/2", "Clopper-Pearson"), 
       col = c("#56B4E9", "#009E73", "#D55E00"), lty = 1, lwd = 2)