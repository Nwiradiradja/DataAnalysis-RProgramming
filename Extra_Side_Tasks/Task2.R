####LOAD THE PACKAGES

require(dplyr)
require(ggplot2)

##LET'S LOAD THE DATASET
store <- read.csv("FINAL DEPARTMENTAL STORE.csv")

### DATA VISUALIZATION

# BUILD A LINE PLOT FOR AVERAGE_PROFIT & COMPANY

store %>% group_by(COMPANY) %>% 
  summarise(AVERAGE_PROFIT=mean(PROFIT)) %>%
  ggplot(aes(x=COMPANY, y=AVERAGE_PROFIT, group=1))+geom_line(color="GREEN")

#2.  BUILD A COXCOMB CHART  FOR EACH OF THE TYPE’S  QUANTITY DEMANDED WHERE THE PRODUCT_TYPE IS "Organic food".

store1 <-  filter(store, PRODUCT_TYPE=="Organic food")%>%
  group_by(PRODUCT_CATEGORY)%>%
  summarise(QUANTITY_DEMANDED=sum(QUANTITY_DEMANDED))

store2 <- store1 %>% 
  arrange(desc(PRODUCT_CATEGORY)) %>%mutate(percentage=round(QUANTITY_DEMANDED*100/sum(QUANTITY_DEMANDED))) %>% mutate(y_pos = cumsum(percentage)-0.5*percentage)

store2 %>% ggplot(aes(PRODUCT_CATEGORY,QUANTITY_DEMANDED, fill=PRODUCT_CATEGORY)) + 
  geom_bar(stat="identity") + 
  coord_polar("x", start=0,direction = -1)+
  xlab("DIFFERENT PRODUCTS") +
  ylab("QUANTITY")


