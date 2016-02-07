library(UsingR)
data(galton)
library(ggplot2)
library(reshape2)
longGalton <- melt(galton,measure.vars=c("child","parent"))
g<-ggplot(longGalton,aes(x=value)) +
#  geom_histogram(aes(y= ..density.., fill=variable), binwidth = 1,
#                 color="black") +
  geom_density(size=2)
g <- g + facet_grid(. ~ variable)
print(g)