## Define two random normal distributions with two different samples sizes
norm10  <- rnorm(10, mean = 0, sd = 5)  # Small sample size
norm100 <- rnorm(100, mean = 0, sd = 5) # Larger sample size

## Define two random exponential distributions with two different sample sizes
exp10   <- rexp(10)  # small sample size
exp100  <- rexp(100) # large sample size

## Define nsim which is the number of simulation runs
nsim <- 1000

## Initializating and defining bootstrap vectors that are going to hold all 
## the 1000 means for each random generation. Vector are numiric with length nsim
bootnorm10mean  <- numeric(nsim)
bootnorm100mean <- numeric(nsim)
bootexp10mean   <- numeric(nsim)
bootexp100mean  <- numeric(nsim)

## This is the bootstrapping for loop that generates 1000 bootstrap means.
## For bootnorm1, this loop is going to generate a new sample of size 10 from the
## random normal generation and get the mean of that random normal sample size of 10
## and place it in the vector bootnorm1. This concept is repeated for the other 
## distributions and sample sizes.
for (i in 1:nsim) {
  bootnorm10  <- sample(norm10, size = length(norm10), replace = TRUE)
  bootnorm100 <- sample(norm100, size = length(norm100), replace = TRUE)
  bootexp10   <- sample(exp10, size = length(exp10), replace = TRUE)
  bootexp100  <- sample(exp100, size = length(exp100), replace = TRUE)
  
  bootnorm10mean[i] <- mean(bootnorm10)
  bootnorm100mean[i]<- mean(bootnorm100)
  bootexp10mean[i]  <- mean(bootexp10)
  bootexp100mean[i] <- mean(bootexp100)
}

## For sample size 10: Random normal vs Bootstrap normal summary statistics
summary(norm10)
summary(bootnorm10mean)

## For sample size 100: Random normal vs Bootstrap normal summary statistics
summary(norm100)
summary(bootnorm100mean)

## For sample size 10: Random exponential vs Bootstrap exponential summary statistics
summary(exp10)
summary(bootexp10mean)

## For sample size 100: Random exponential vs Bootstrap exponential summary statistics
summary(exp100)
summary(bootexp100mean)

## Histogram outputs for random normal distribution & Bootstrapped normal for samples 10 & 100
hist(norm10, main = "Random Normal Sample Size 10")
hist(bootnorm10mean, main = "Bootstrap Normal Sample Size 10")
hist(norm100, main = "Random Normal Sample Size 100")
hist(bootnorm100mean, main = "Bootstrap Normal Sample Size 100")


## Histogram outputs for random exponential distribution & Bootstrapped exponential for samples 10 & 100
hist(exp10, main = "Random Exponential Sample Size 10")
hist(bootexp10mean, main = "Bootstrap Exponential Sample Size 10")
hist(exp100, main = "Random Exponential Sample Size 100")
hist(bootexp100mean, main = "Bootstrap Exponential Sample Size 100")
