library(datasets)
data(ToothGrowth)

str(ToothGrowth)

hist(as.integer(ToothGrowth$supp))
hist(ToothGrowth$len)
hist(ToothGrowth$dose)
summ<-summary(ToothGrowth)
print(summ)
