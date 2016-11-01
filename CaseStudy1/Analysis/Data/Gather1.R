#######################################################################################
#  This file is gather.R for the following purposes
#      . Download GDP data.
#      . Clean and tidy GDP data set
########################################################################################

## Loading package(s)
library(repmis)
library(dplyr)
library(ggplot2)
library(RCurl)
library(data.table)

## Downloading GDP data
gdpsite <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(gdpsite, destfile = "./getdata%2Fdata%2FGDP.csv")
## Missing blanks for column headers
## Row 234 - 240 contain comments that I deem unnecessary for analysis
## In addition, Row 236 and beyong contains NA thus skip 4 and nrows = 232
GDPdata <- data.table(read.csv("getdata%2Fdata%2FGDP.csv", skip = 4, nrows = 232, stringsAsFactors = F))

## Clean and tidy up GDP data frame
## Exclude rows with comments from raw data frame and rows with blanks and NAs
GDPdata <- GDPdata[X!=""]

## Tidy columns to include columns of interest
GDPdata <- GDPdata[, list(X, X.1, X.3, X.4)]

## Add column names
names(GDPdata) <- c("CountryCode", "ranking", "Long.Name", "GDP.Value") 
str(GDPdata)

## Convert GDP.Value to numeric
GDPdata$GDP.Value <- as.numeric(gsub(",","", GDPdata$GDP.Value))
str(GDPdata)

## Change all the variable names to upper case
names(GDPdata) <- toupper(names(GDPdata))
str(GDPdata)

## Count number of missing values for RANKING variable
GDPdata$RANKING <- as.numeric(GDPdata$RANKING)
missingRanking <- sum(is.na(GDPdata$RANKING))
missingRanking

