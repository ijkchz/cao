library(tidyverse)
library(readxl)
library(lubridate)
library(nycflights13)

# Q1 ----------------------------------------------------------------------
dat=as.tibble(mtcars)
dat$cyl=as.factor(dat$cyl)
ggplot(dat,aes(group=cyl,x=cyl,y=mpg))+geom_boxplot()

cut(dat$gear,c(1,3,6),labels = c('A','B'))

ggplot(dat,aes(x=cyl,fill=factor(am)))+geom_bar(position = 'fill')

dat %>% mutate(u=mean(mpg)) %>% 
ggplot(aes(x=cyl,y=u))+geom_bar(stat = "identity")+
  facet_wrap(~am,ncol = 2)


# Q2 ----------------------------------------------------------------------
scores <- tibble(
  person = rep(c("A","B","C"),each = 2),
  time = rep(c("pre","post"),3),
  class1 = c(74,78,90,95,80,77),
  class2 = c(79,81,88,93,85,90)
)

scores1 <- scores %>% pivot_longer(cols=c(class1,class2),names_to = "class",values_to = "score" )
scores1 %>% pivot_wider(names_from = time,values_from = score)

