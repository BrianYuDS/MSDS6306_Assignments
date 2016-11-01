#######################################################################################
#  This file is MergeData.R with the following purpose
#      . Merge GDPclean and Educationalclean data sets
#######################################################################################

## Merging data sets GDPclean & Educationalclean by country code
MergedData <- merge(GDPdata, Educationalclean, all = TRUE, by=c("COUNTRYCODE"))
