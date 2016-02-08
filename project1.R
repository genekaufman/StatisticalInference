lambda <- 0.2
n <- 40
num_sims <- 1000
set.seed(42)

exp_dist <- matrix(rexp(n * num_sims,lambda),num_sims)
exp_means <- apply(exp_dist, MARGIN=1,FUN=mean)
exp_sd <- apply(exp_dist, MARGIN=1,FUN=sd)
exp_var <- apply(exp_dist, MARGIN=1,FUN=var)
#hist(exp_means)

theory_mean <- 1/lambda
theory_sd <- 1/lambda
theory_var <- theory_sd ^ 2
theory_sd_sample  <- theory_sd / sqrt(n)
theory_var_sample  <- theory_sd_sample^2

avg_sample_mean <- mean(exp_means)
avg_sample_sd <- mean(exp_sd)
avg_sample_var <- mean(exp_var)
sd_exp_dist <- sd(exp_dist)
sd_exp_means <- sd(exp_means)
var_exp_dist <- mean(var(exp_dist))
var_exp_means <- var(exp_means)

#hist(var_exp_dist)
#hist(exp_sd)

message("sample mean vs theoretical mean")
message("theoretical mean: ",theory_mean)
message("sample mean: ",avg_sample_mean)


#library(ggplot2)
#library(reshape2)
# mExpDist <- melt(exp_dist)
# g<-ggplot(mExpDist,aes(x=value)) +
#   geom_histogram(aes(y= ..density..
#                      ), binwidth = 1,
#                  color="black") +
#   geom_density(size=2)
# #g <- g + facet_grid(. ~ variable)
# print(g)
# message("43")
# mExpMeans <- melt(exp_means)
# g2<-ggplot(mExpMeans,aes(x=value)) +
#   geom_histogram(aes(y= ..density..
#   ), binwidth = 1,
#   color="black") +
#   geom_density(size=2)
# #g <- g + facet_grid(. ~ variable)
# print(g2)

# mExpDist <- melt(exp_dist)
# g3<-ggplot(data.frame(exp_dist),aes(x=value)) +
#   geom_histogram(aes(y= ..density..
#   ), binwidth = 1,
#   color="black") +
#   geom_density(size=2)
# #g <- g + facet_grid(. ~ variable)
# print(g3)

message("sample variance vs theoretical variance")
message("theoretical variance: ",theory_var)
message("sample variance: ",avg_sample_var)
message("Distribution variance: ",var_exp_dist)

message("Show that the distribution is approximately normal. CLT shows that the distribution of the means of samples will become normal")
#hist(exp_dist)
#hist(exp_means)
#message("69")
#remove(exp_dist)
#remove(var_exp_dist)
#
numBreaks <- 100
# plot the averages as density probabilities
hist(exp_means
     ,probability=TRUE
     ,breaks = numBreaks
     ,xlab="Means"
     ,main="Exponential Distribution:\nSimulated Sample Means vs Theoretical Means"
     )

# add density plot of simulated sample means
lines(density(exp_means),lty=1)

# restructure theoretical mean to create a density plot on
# the same scale as the simulated sample means
xfit <- seq(min(exp_means), max(exp_means)
            , length=numBreaks
            )
yfit <- dnorm(xfit, mean=theory_mean, sd=(theory_sd/sqrt(n)))
lines(xfit, yfit
      , lty=2
      )

# add a vertical line at the theoretical mean
abline(v=theory_mean, lwd=3)

# add legend
legend('topright'
       , c("Simulated Samples", "Theoretical")
       , lty=c(1,2)
       , cex=0.6
       , bty="n"
       )

theory_sd <- 1/lambda
theory_var <- theory_sd ^ 2
theory_sd_samp <- theory_sd / sqrt(n)
theory_var_samp <- theory_sd_samp ^ 2
avg_sample_var <- mean(exp_var)
avg_sample_var_means <- var(exp_means)

######################### VAR ###########
#theory_sd <- 1/lambda
numBreaks <- 100
# plot the averages as density probabilities
hist(exp_var
     ,probability=TRUE
     ,breaks = numBreaks
     ,xlab="Variance"
     ,main="Exponential Distribution:\nSimulated Sample Variance vs Theoretical Variance"
)

# add density plot of simulated sample variances
lines(density(exp_var),lty=1)

# restructure theoretical variance to create a density plot on
# the same scale as the simulated sample variance
xfit <- seq(min(exp_var), max(exp_var)
            , length=numBreaks
)
yfit <- dnorm(xfit, mean=theory_var, sd=(theory_sd/sqrt(n)))
lines(xfit, yfit
      , lty=2
)

# add a vertical line at the theoretical var
abline(v=theory_var, lwd=3)

# add legend
legend('topright'
       , c("Theoretical","Simulated Samples")
       , lty=c(2,1)
       , cex=0.6
       , bty="n"
)
