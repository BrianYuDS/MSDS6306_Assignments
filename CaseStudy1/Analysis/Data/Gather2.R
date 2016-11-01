#######################################################################################
#  This file is gather.R for the following purposes
#      . Download Educational data.
#      . Clean and tidy Education data set
########################################################################################

## Downloading Educational Data
site <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(site, destfile = "./getdata%2Fdata%2FEDSTATS_Country.csv")
Educationaldata <- read.csv("getdata%2Fdata%2FEDSTATS_Country.csv")
str(Educationaldata)

## Clean and tidy up Educational data set
## Create new data table Educationalclean from data frame Educationaldata
Educationalclean <- data.table(Educationaldata)

## Change all variable names to upper case
names(Educationalclean) <- toupper(names(Educationalclean))

## Change COUNTRYCODE & LONG.NAME from factor to character
Educationalclean$COUNTRYCODE <- as.character(Educationalclean$COUNTRYCODE)
Educationalclean$LONG.NAME<- as.character(Educationalclean$LONG.NAME)

## Checking structure of data set
str(Educationalclean)

