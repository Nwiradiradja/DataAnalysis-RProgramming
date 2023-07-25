####LOAD THE DPLYR PACKAGE

require(dplyr)

##LET'S LOAD THE DATASET

store <- read.csv("FINAL DEPARTMENTAL STORE.csv")

####.summarize()

### Find the following descriptive statistics for the net profit.

## Find the AVERAGE/mean

summarise(store, AVG = mean(NET_PROFIT))

## Find the SUMMATION

summarise(store, SUM = sum(NET_PROFIT))

### Find the MINIMUM and MAXIMUM

summarise(store,
          MINIMUM = min(NET_PROFIT),
          MAXIMUM = max(NET_PROFIT))


### Find the median

summarise(store, MEDIAN = median(NET_PROFIT))


### Find the variance

summarise(store, VARIANCE = var(NET_PROFIT))


### Find the standard deviation

summarise(store, STANDARD_DEVIATION = sd(NET_PROFIT))


### Find the summary

summarise(store, SUMMARY = summary(NET_PROFIT))


### Find the quantile

summarise(store, QUANTILE = quantile(NET_PROFIT))


### Find the range

summarise(store, RANGE = range(NET_PROFIT))

##### group_by().

### Sort the data grouped by PRODUCT_TYPE

store2 <- group_by(store, PRODUCT_TYPE)

## Find the AVERAGE/mean

summarise(store2, AVG = mean(NET_PROFIT))

## Find the SUMMATION
summarise(store2, SUM = sum(NET_PROFIT))

### Find the MINIMUM and MAXIMUM
summarise(store2,
          MINIMUM = min(NET_PROFIT),
          MAXIMUM = max(NET_PROFIT))

### Find the median
summarise(store2, MEDIAN = median(NET_PROFIT))

### Find the variance
summarise(store2, VARIANCE = var(NET_PROFIT))

### Find the standard deviation
summarise(store2, STANDARD_DEVIATION = sd(NET_PROFIT))

### Find the range
summarise(store2, RANGE = range(NET_PROFIT))



