set.seed(1234)

hist(runif(1000))
mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
hist(mns)


parent 	<- runif(1000, 0, 10)
means 	<- NULL
for (i in 1 : 1000) means = c(means, mean(runif(40, 0, 10)))

message(mean(parent))
message(mean(means) )
message(sd(parent))
message(sd(means))
