ToothGrowth<-read.csv("toothgrowth.data.csv")
# set dose as a factor
ToothGrowth$dose<-as.factor(ToothGrowth$dose)
summary(ToothGrowth)
t.test(len~supp, data=ToothGrowth)