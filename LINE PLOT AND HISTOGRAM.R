
## LET'S LOAD THE PACKAGES

require(dplyr)
require(ggplot2)

###LOAD THE DATASET

store <-read.csv("FINAL DEPARTMENTAL STORE.csv")

###### LINE PLOT

# PLOT FOR  PRICE-DEMAND RELATIONSHIP (AVERAGE_SELLING_PRICE VS QUANTITY_DEMANDED)

ggplot(store, aes(x=QUANTITY_DEMANDED, y=SELLING_PRICE))+geom_line(color="green"
                                                                   )
 
#PLOT FOR AVERAGE_NET_PROFIT & COMPANY

store %>% group_by(PRODUCT_TYPE, COMPANY) %>% 
  summarise(AVERAGE_NET_PROFIT=mean(NET_PROFIT, na.rm=TRUE)) %>%
  ggplot(aes(x=PRODUCT_TYPE, y=AVERAGE_NET_PROFIT, group=COMPANY, color=COMPANY))+
  geom_line()+ theme(text= element_text(size=9.5))

##### HISTOGRAM 

# HISTOGRAM FOR PROFIT_PERCENT OF PRODUCT_CATEGORY

store%>%
  ggplot(aes(x=PROFIT_PERCENT, fill=PRODUCT_CATEGORY))+geom_histogram(binwidth 
                                                                      = 30)

# HISTOGRAM FOR QUANTITY_DEMANDED OF PRODUCT_CATEGORY WHERE PRODUCT_TYPE IS "snacks"

store %>%
  filter(PRODUCT_TYPE == "snacks") %>%
  ggplot(aes(x=QUANTITY_DEMANDED, fill=PRODUCT_CATEGORY))+geom_histogram(
    binwidth = 30)


