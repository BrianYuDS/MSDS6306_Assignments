# BYu_Homework4
Brian Yu  
October 26, 2016  
# Introduction
For Homework 4, we were asked to write a boostrap code to illustrate the central limit theorem
utilizing a normal distribution with two different sample sizes and an exponential distribution
with two different sample sizes. Let's begin by defining the key concepts in this assignment: The Central Limit Theorem and Bootstrapping.

What is the central limit theorem? From "http://www.math.uah.edu/stat/sample/CLT.html", The central limit theorem states that the distribution of the sum (or average) of a large number of independent, identically distributed variables will be approximately normal, regardless of the underlying distribution. The importance of the central limit theorem is hard to overstate; indeed it is the reason that many statistical procedures work.

What is bootstrapping? From "https://en.wikipedia.org/wiki/Bootstrapping_(statistics)", bootstrapping can refer to any test or metric that relies on random sampling with replacement. Bootstrapping allows assigning measures of accuracy (defined in terms of bias, variance, confidence intervals, prediction error or some other such measure) to sample estimates. This technique allows estimation of the sampling distribution of almost any statistic using random sampling methods. Generally, it falls in the broader class of resampling methods.

For this assignment, I've taken sample sizes of 10 and 100 from both normal and exponential distributions. Furthermore, I conducted the bootstrap sampling through a bootstrap for loop to produce bootstrap mean values. The code is below with detailed comments per each step of the code. 

# Main R Code

```r
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
```

### Output of Summary Statistics
From the summary statisitcs, you can see the original samples have wider spreads and variance compared to the bootstrapped data, indicated from the larger  IQRs. For bootstrapping, the original data is treated as the population, thus the bootstrapping is taking 1000 replications from this population and calculating the mean of the samples, which is expected to be near the original data mean. This is validated by looking at the outputted means from the summary statistic, which are approximately equal. 

* For sample size 10: Random normal and Bootstrap normal summary statistics, respectively

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -4.1940 -2.6330 -1.6980 -0.6032  0.4757  7.0980
```

```
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
## -3.223000 -1.401000 -0.747400 -0.642600 -0.009426  2.777000
```

* For sample size 100: Random normal and Bootstrap normal summary statistics, respectively

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -10.0600  -3.4590  -1.0620  -0.3907   2.5440  12.8100
```

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -2.03600 -0.69220 -0.38140 -0.38500 -0.07973  1.08500
```

* For sample size 10: Random exponential and Bootstrap exponential summary statistics, respectively

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 0.07411 0.20980 0.54120 1.21900 2.02900 4.40600
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.3216  0.9064  1.1700  1.2120  1.4930  2.8000
```

* For sample size 100: Random exponential and Bootstrap exponential summary statistics, respectively

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## 0.005189 0.309700 0.742900 1.039000 1.460000 4.882000
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.7349  0.9708  1.0320  1.0370  1.0980  1.4240
```


### Outputs of Normal Distribution Histograms
![](BYu_Homework4_BootStrapR_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

### Outputs of Exponential Distribution Histograms
![](BYu_Homework4_BootStrapR_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

# Conclusion
From the histogram outputs, you can clearly notice that the bootstrapped data is more normally distributed than the original data. This is evidentlly more noticeable for the exponential distribution samples. In additiona from the histogram output, the bootstrapped data has a smaller variance and standard deviation compared to the original data. In closing, you can see The Central Limit Theorem in action from utilization of bootstrapping on randomized sample sizes of 10 and 100 for both normal and exponetial distribution data. 




```
## R version 3.3.1 (2016-06-21)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 8.1 x64 (build 9600)
## 
## locale:
## [1] LC_COLLATE=English_United States.1252 
## [2] LC_CTYPE=English_United States.1252   
## [3] LC_MONETARY=English_United States.1252
## [4] LC_NUMERIC=C                          
## [5] LC_TIME=English_United States.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## loaded via a namespace (and not attached):
##  [1] magrittr_1.5    formatR_1.4     tools_3.3.1     htmltools_0.3.5
##  [5] yaml_2.1.13     Rcpp_0.12.7     stringi_1.1.1   rmarkdown_1.0  
##  [9] knitr_1.14      stringr_1.1.0   digest_0.6.10   evaluate_0.9
```
