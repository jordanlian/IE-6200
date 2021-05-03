library(tidyverse)
# Binomial
dbinom(x=2,size=10,prob=0.12) 
1-pbinom(q=1,size=10,prob=0.12)


# Multinomial
dmultinom(x=c(4,1,2),,prob=c(0.2, 0.3, 0.5))
dmultinom(x=c(0,3,4),,prob=c(0.2, 0.3, 0.5))

# Geometric
dgeom(x=4, prob=0.3)

# Hypergeometric
dhyper(x=4, m=10, n=90, k=15)
1-phyper(q=1, m=10, n=90, k=15)

# Poisson
dpois(x=5,lambda=3)
ppois(q=5,lambda=3)

# Uniform
punif(q=55,min=0,max=60) - punif(q=40,min=0,max=60)
y_unif <- runif(n=1000,min=0,max=60)
ggplot(data.frame(y_unif), aes(y_unif)) +
  geom_histogram(fill="steelblue", color = 'black') +
  theme_light() +
  ylab('Frequency') +
  xlab('X')

# Standard Normal
pnorm(q=-1.68, mean=0, sd=1)
1-pnorm(q=-1.68)
pnorm(q=0)
qnorm(p=0.025, mean=0,sd=1)

x_norm <- rnorm(n=1000,mean=0,sd=1)
ggplot(data.frame(x_norm), aes(x_norm)) +
  geom_histogram(fill="steelblue", color = 'black') +
  theme_light() +
  xlab('X') +
  ylab('Frequency')

# Normal
pnorm(q=20.08,mean=20.05,sd=0.02) - pnorm(q=20.03,mean=20.05,sd=0.02)
pnorm(q=20.06,mean=20.05,sd=0.02)
1-pnorm(q=20.07,mean=20.05,sd=0.02)



# Lognormal
plnorm(q=3,meanlog=1,sdlog=2)

# Exponential
pexp(q=7, rate=1/15.6) - pexp(q=3, rate=0.064)
pexp(q=10, rate=0.064)
qexp(p=0.5, rate=0.064)