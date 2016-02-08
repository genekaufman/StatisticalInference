
exp_var <- apply(exp_dist, MARGIN=1,FUN=var)

######################### VAR ###########
#theory_sd <- 1/lambda
numBreaks <- 50
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
yfit <- dnorm(xfit, mean=theory_var_samp, sd=theory_sd_samp)
lines(xfit, yfit
      , lty=2
)

yfit <- dnorm(xfit, mean=theory_var, sd=(theory_sd/sqrt(n)))
lines(xfit, yfit
      , lty=3
)

# add a vertical line at the theoretical var
abline(v=theory_var_samp, lwd=3)

# add legend
legend('topright'
       , c("2","Theoretical","Simulated Samples")
       , lty=c(3,2,1)
       , cex=0.6
       , bty="n"
)
