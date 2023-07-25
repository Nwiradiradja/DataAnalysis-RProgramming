
install.packages("dplyr")

setwd("C:/Users/Nate/Desktop/DataAnalysis_Business_R/Department Store Project")
getwd()

####LOAD THE DPLYR PACKAGE

require(dplyr)

##LET'S LOAD THE DATASET

store <-read.csv("MY DEPARTMENTAL STORE .csv")
#VIEW THE DATASET

View(store)

#GLIMPSE THE DATASET

glimpse(store)

####filter()

store1 <- filter(store, PRODUCT_TYPE == "snacks")

###GET THE INFORMATION OF THE PRODUCT WHERE TO PRODUCT_TYPE IS 'beauty products'

View(store1)

### GET THE INFORMATION OF THE PRODUCT WHERE IT BELONGS TO COMPANY S&M

store1 <- filter(store, COMPANY %in% c("S", "M") )
View(store1)



#### slice() 

store2 <- store%>% slice(1:10)

### GET THE DETAILS OF FIRST 10 ROWS

View(store2)

### GET THE DETAILS OF FIRST 6 ROWS

store2<-store %>% slice_head(n = 6)
View(store2)

#### arrange()

store1 <- arrange(store, QUANTITY_DEMANDED)

###ARRANGE THE DATASET IN ASCENDING ORDER OF QUANTITTY DEMANDED

View(store1)

### ARRANGE THE DATASET IN DESCENDING ORDER OF SELLING PRICE

store1 <- arrange(store, desc(SELLING_PRICE) )
View(store1)
