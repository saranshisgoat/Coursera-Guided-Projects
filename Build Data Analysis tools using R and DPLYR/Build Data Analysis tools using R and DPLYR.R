library(dplyr)
library(ggplot2)
#Our Data
mpg
head(mpg)
str(mpg)
dim(mpg)
names
#Filter
hist(mpg$cty)
filter(mpg, cty > 25)
filter(mpg, cty > 25 & model == "civic")
#Select
select(mpg, manufacturer)
names(mpg)
select(mpg, c(7,8))
#Pipe
mpg%>%
  filter(cty > 25)%>%
  select(c(7,8))

names(mpg)
#What model of cars get the worst gas mileage 
#(under 15mpg)
mpg%>%
  select(2,8)%>%
  filter(cty <15)

mpg%>%
  filter(cty < 15)%>%
  select(2)
#Group By
names(mpg)
select(mpg,7)

mpg%>%
  group_by(drv)%>%
#Summarise
  summarise(n = n(),avgcity = mean(cty , na.rm = T))
#Mutate
mpg%>%
  group_by(drv)%>%
  summarise(n = n(),avgcity = mean(cty , na.rm = T))%>%
  mutate(test = n * avgcity)
names(mpg)
mpg%>%
  mutate(conversion - displ * .16)%>%
#Arrange  
  arrange(cty)