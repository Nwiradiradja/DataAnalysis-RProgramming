####LOAD THE PACKAGES

require(dplyr)
require(ggplot2)

store <- read.csv("FINAL DEPARTMENTAL STORE.csv")

##### PIE CHART

#PIE CHART FOR EACH HYGIENE PRODUCT'S QUANTITY DEMANDED.

#### 1 AND 2 ARE REVISION OF DATA MANIPULATIION.

#1: PREPARE REQUIRD DATA

store1 <-  filter(store, PRODUCT_TYPE=="hygiene")%>%
  group_by(PRODUCT_CATEGORY)%>%
  summarise(QUANTITY_DEMANDED=sum(QUANTITY_DEMANDED))

View(store1)

#2: CALCULATE PERCENTAGE OF EACH PRODUCT

store2 <- store1 %>% 
  arrange(desc(PRODUCT_CATEGORY)) %>%
  mutate(percentage=round(QUANTITY_DEMANDED*100/sum(QUANTITY_DEMANDED))) %>% 
  mutate(y_pos = cumsum(percentage)-0.5*percentage)

View(store2)

# 3: CREATE THE PIE CHART

store2%>%
  ggplot(aes(x="", percentage, fill=PRODUCT_CATEGORY))+
  geom_bar(width = 1, stat = "Identity", color = "white", alpha=.5)+
  coord_polar("y", start = 0)+
  geom_text(aes(y=y_pos, label = paste0(percentage, "%")), color="black")+
  scale_fill_manual(values=rainbow(7))+theme_void()

#### DONUT

# DONUT FOR THE SAME DATA

store2%>%
  ggplot(aes(x=2, percentage, fill=PRODUCT_CATEGORY))+
  geom_bar(width = 1, stat = "Identity", color = "white", alpha=.5)+
  coord_polar("y", start = 0)+
  geom_text(aes(y=y_pos, label = paste0(percentage, "%")), color="black")+
  scale_fill_manual(values=rainbow(7))+theme_void()+xlim(0.6,2.6)

#### COXCOMB CHART 

#COXCOMB CHART  FOR THE SAME DATA
store2 %>% ggplot(aes(PRODUCT_CATEGORY,QUANTITY_DEMANDED, fill=PRODUCT_CATEGORY)) + 
  
  geom_bar(stat="identity") + 
  coord_polar("x", start=0,direction =-1 )+
  xlab("DIFFERENT HYGIENE PRODUCTS") +
  ylab("QUANTITY")


