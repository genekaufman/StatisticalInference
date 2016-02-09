#library(datasets)
#data(ToothGrowth)
ToothGrowth<-read.csv("toothgrowth.data.csv")
# set dose as a factor
ToothGrowth$dose<-as.factor(ToothGrowth$dose)

str(ToothGrowth)

summ<-summary(ToothGrowth)
print(summ)

tbl<-table(ToothGrowth$supp, ToothGrowth$dose)
print(tbl)

#hist(ToothGrowth$len)

library(ggplot2)
#boxplot of dose x length
g<-ggplot(data=ToothGrowth,
          aes(x=dose,y=len,fill=dose)) +
  geom_boxplot()
print(g)

#boxplot of dose x length per supp
g<-ggplot(data=ToothGrowth,
       aes(x=dose,y=len,fill=supp)) +
#  geom_bar(stat="identity") +
  geom_boxplot() +
  facet_grid(.~supp)
print(g)

#boxplot of supp x length
g<-ggplot(data=ToothGrowth,
          aes(x=supp,y=len,fill=supp)) +
  #  geom_bar(stat="identity") +
  geom_boxplot()
print(g)

### EDA done
###

t.test(len~supp, data=ToothGrowth)