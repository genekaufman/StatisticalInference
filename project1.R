lambda <- 0.2
n <- 40
num_sims <- 1000
set.seed(42)

exp_dist <- matrix(rexp(n * num_sims,lambda),num_sims)
exp_means <- apply(exp_dist, MARGIN=1,FUN=mean)
hist(exp_means)

theoretical_exp_mean <- 1/lambda
theoretical_exp_sd <- 1/lambda
var_exp_means <- var(exp_means)
sd_exp_means <- sd(exp_means)