# LiveSessionUnit11Assignment
Brian Yu  
November 20, 2016  
# Overview
For Live Session Unit 11 Assignment, I was assigned to analye the ukcars dataset.The deliverable for this assignment is a link to R Markdown file on GitHub.


```r
library(fpp) #fpp package must be installed first
```

##### a) Plot the time series. Can you identify seasonal fluctuations and/or a trend?

```r
data(ukcars)
plot(ukcars)
```

![](LiveSessionUnit11Assignment_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
There seems to be a seasonality compenent to this time series

##### b) Use a classical decomposition to calculate the trend-cycle and seasonal indicies.

```r
fitd <- decompose(ukcars)
trend_indicies <- fitd$trend
seasonal_indicies <- fitd$seasonal
plot(fitd)
```

![](LiveSessionUnit11Assignment_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

##### c) Do the results support the graphical interpretation from part (a)?

```r
head(trend_indicies, 113)
```

```
##   [1]       NA       NA 332.5080 334.9944 332.7921 318.6779 301.5986
##   [8] 291.6947 274.6635 265.5052 264.2061 252.6448 245.7905 239.0134
##  [15] 224.3766 217.0750 221.7960 232.9609 240.1291 239.4626 231.0933
##  [22] 223.3884 223.0154 231.4597 245.1225 256.2929 261.9754 256.1619
##  [29] 245.8446 234.6968 229.5420 238.1435 247.5681 256.3500 257.3025
##  [36] 250.4360 248.1124 251.3525 258.4250 266.4915 275.7900 283.1886
##  [43] 288.5328 293.8990 296.0286 301.1814 312.9431 324.1068 330.7498
##  [50] 328.6170 321.1060 313.1314 309.2993 316.8399 326.3369 331.4153
##  [57] 331.0281 318.6110 308.8694 307.9160 310.4905 318.3164 325.6204
##  [64] 332.6481 340.2020 343.6298 343.6329 344.7204 348.8715 359.1964
##  [71] 374.0945 384.9445 386.9546 384.2622 383.1880 384.7174 394.2219
##  [78] 411.9488 423.1889 426.5649 427.3750 425.4824 427.7774 434.3976
##  [85] 441.9995 441.6614 436.8212 434.1655 432.2719 439.7232 450.8826
##  [92] 453.1480 442.1014 421.6896 396.9616 375.9546 368.4345 370.8056
##  [99] 380.9231 392.4871 403.2264 408.8347 404.2572 404.9570 408.7562
## [106] 411.5333 417.0311 419.0380 416.8826 413.5248 410.1048       NA
## [113]       NA
```

```r
head(seasonal_indicies, 113)
```

```
##   [1]  26.078380  20.160732 -45.118387  -1.120726  26.078380  20.160732
##   [7] -45.118387  -1.120726  26.078380  20.160732 -45.118387  -1.120726
##  [13]  26.078380  20.160732 -45.118387  -1.120726  26.078380  20.160732
##  [19] -45.118387  -1.120726  26.078380  20.160732 -45.118387  -1.120726
##  [25]  26.078380  20.160732 -45.118387  -1.120726  26.078380  20.160732
##  [31] -45.118387  -1.120726  26.078380  20.160732 -45.118387  -1.120726
##  [37]  26.078380  20.160732 -45.118387  -1.120726  26.078380  20.160732
##  [43] -45.118387  -1.120726  26.078380  20.160732 -45.118387  -1.120726
##  [49]  26.078380  20.160732 -45.118387  -1.120726  26.078380  20.160732
##  [55] -45.118387  -1.120726  26.078380  20.160732 -45.118387  -1.120726
##  [61]  26.078380  20.160732 -45.118387  -1.120726  26.078380  20.160732
##  [67] -45.118387  -1.120726  26.078380  20.160732 -45.118387  -1.120726
##  [73]  26.078380  20.160732 -45.118387  -1.120726  26.078380  20.160732
##  [79] -45.118387  -1.120726  26.078380  20.160732 -45.118387  -1.120726
##  [85]  26.078380  20.160732 -45.118387  -1.120726  26.078380  20.160732
##  [91] -45.118387  -1.120726  26.078380  20.160732 -45.118387  -1.120726
##  [97]  26.078380  20.160732 -45.118387  -1.120726  26.078380  20.160732
## [103] -45.118387  -1.120726  26.078380  20.160732 -45.118387  -1.120726
## [109]  26.078380  20.160732 -45.118387  -1.120726  26.078380
```
By decomposing the time series, a definitive seasonal fluctuation trend. From Q1 to Q2 of a year, the trend decrease. From Q3 to Q4, the trend increases.

##### d) Compute and plot the seasonally adjusted data.

```r
fit_season_adj <- seasadj(fitd)
plot(fit_season_adj)
```

![](LiveSessionUnit11Assignment_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

##### e) Change one observation to be an outlier (e.g., add 500 to one observation), and recompute the seasonally adjusted data. What is the effect of the outlier?

```r
ts <- ukcars
ts[50] = ts[50] + 500
fitd2 <- decompose(ts)
fit_season_adj2 <- seasadj(fitd2)
plot(fit_season_adj2)
```

![](LiveSessionUnit11Assignment_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

At index 50, we added 500 to the observation value, and it causes a spike in the plot at index 50.

##### f) Does it make any difference if the outlier is near the end rather than in the middle of the time series?

```r
ts2 <- ts
ts[100] = ts[100] + 500
fitd2 <- decompose(ts)
fit_season_adj3 <- seasadj(fitd2)
plot(fit_season_adj3)
```

![](LiveSessionUnit11Assignment_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

From observation of the graph, it doesn't seem to make a difference if the outlier is near the end rather than in the middle of the time series

##### g) Use STL to decompose the series.

```r
fitstl <- stl(ukcars, s.window = 5)
plot(fitstl)
```

![](LiveSessionUnit11Assignment_files/figure-html/unnamed-chunk-8-1.png)<!-- -->
