### DATA VISUALIZATION

### COLUMN PLOT

install.packages("ggplot2")

## LET'S LOAD THE PACKAGES

require(dplyr)
require(ggplot2)

###LOAD THE DATASET

store <-read.csv("FINAL DEPARTMENTAL STORE.csv")

#PLOT FOR AVERAGE_QUANTITY & PRODUCT_TYPE

store%>%group_by(PRODUCT_TYPE)%>%
  summarise(AVERAGE=mean(QUANTITY_DEMANDED))%>%
  ggplot(aes(x=PRODUCT_TYPE, y=AVERAGE))+geom_col(width = 0.6, fill="light blue"
                                                  )+theme(text=element_text(
                                                    size = 9
                                                  ))

#PLOT FOR AVERAGE_NET_PROFIT & PRODUCT_TYPE
store %>% group_by(PRODUCT_TYPE) %>% 
  
  summarise(AVERAGE_NET_PROFIT=mean(NET_PROFIT)) %>%
  ggplot(aes(x=PRODUCT_TYPE, y=AVERAGE_NET_PROFIT))+geom_col(width=0.6, fill="light blue")+ theme(text= element_text(size=9))


##### SCATTER PLOT

## PLOT FOR NET_PROFIT & COMPANY 

store %>% 
  ggplot(aes(x=COMPANY, y=NET_PROFIT, color=PRODUCT_CATEGORY))+geom_point()

## PLOT FOR PROFIT  & QUANTITY_DEMANDED WHERE PRODUCT_TYPE == "beauty products"

store %>% filter(PRODUCT_TYPE == "beauty products") %>%
  ggplot(aes(x=QUANTITY_DEMANDED, y=PROFIT, color=PRODUCT_CATEGORY))+geom_point()


