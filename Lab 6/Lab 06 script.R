# load the libraries
# install.packages('fitdistrplus')
library(tidyverse)
library(fitdistrplus)

setwd("C:/Users/User/Dropbox/5- IE6200/2- Course Evaluation/3- Labs/6 - Lab 6 - Distribution Fitting")

# continuous data
# load the data
ccpp <- read.csv('C:/Users/User/Desktop/ccpp.csv', header = TRUE, sep = ',')
head(ccpp) # structure of the dataset

# visualizing the data
ggplot(ccpp, aes(RH)) +
  geom_histogram(bins = 50, color = 'Black', fill = 'steelblue')

# descriptive statistics
descdist(ccpp$RH)

# get parameter estimates
# for normal
fit_n <- fitdist(ccpp$RH, "norm")
summary(fit_n)

# for uniform
fit_ln <- fitdist(ccpp$RH, "lnorm")
summary(fit_ln)

fit_exp <- fitdist(ccpp$RH, "exp")

summary(fit_exp)
# goodness-of-fit plots
par(mfrow=c(2,2))
plot.legend <- c("normal","lnorm")
denscomp(list(fit_exp), legendtext = plot.legend, xlab = 'Relative Humidity (RH)', xlegend = 'topleft')
cdfcomp (list(fit_exp), legendtext = plot.legend, xlab = 'Relative Humidity (RH)')
qqcomp  (list(fit_exp), legendtext = plot.legend, xlab = 'Relative Humidity (RH)')
ppcomp  (list(fit_exp), legendtext = plot.legend, xlab = 'Relative Humidity (RH)')

# discrete data
data <- read.csv('C:/Users/User/Desktop/patient.csv')

# visualize the data
ggplot(data, aes(x)) +
  geom_histogram(bins = 50, color = 'Black', fill = 'steelblue')

# get paramter estimates for negative binomial distribution
fit_nb <- fitdist(data$x, 'nbinom')
summary(fit_nb)

# get paramter estimates for poisson distribution
fit_p <- fitdist(data$x, 'pois')
summary(fit_p)

# goodness-of-fit tests
gofstat(list(fit_nb, fit_p))
