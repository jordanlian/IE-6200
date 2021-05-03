# load the library
library(tidyverse)

# set working directory
setwd("C:/Users/Jordan Lian/OneDrive - Northeastern University/Fall 2020/IE 6200/Lab 7")

# load the data
census <- read.csv('census.csv', header = TRUE, sep = ',')
str(census)

# create samples
censusSample <- sample_n(census, 1000)

# one sample z test
z.test <- function(sample, pop){
  sample_mean = mean(sample) 
  pop_mean = mean(pop)
  n = length(sample) 
  var = var(pop)
  z = (sample_mean - pop_mean) / (sqrt(var/(n))) 
  return(z)
}
z.test

# performing the z test
z.test(censusSample$age, census$age)

# performing the t test
#mean age of people holding a Masters degree is equivalent to the mean population age
censusMasters <- census %>% 
  dplyr::filter(education == ' Masters' )

t.test(censusMasters$age, mu = mean(census$age))

# two sample z test
z_test2 = function(a, b, var_a, var_b){
  n.a = length(a)
  n.b = length(b)
  z = (mean(a) - mean(b)) / (sqrt((var_a)/n.a + (var_b)/n.b))
  return(z)
}

# create more samples
cen_1 <- census[1:16000,] #select all columns and rows from 1 to 16000  
cen_2 <- census[16001:32561,] #select all columns and rows from 16001 to 32561
cen_1_sample <- sample_n(cen_1, 1000) #sample 1000 rows from the first population
cen_2_sample <- sample_n(cen_2, 1000) #sample 1000 rows from the second population

#u1 =u2
# u1 != u2
# performing two sample z 

z_test2(cen_1_sample$age,cen_2_sample$age,var(cen_1_sample$age),var(cen_2_sample$age))

# performing two sample t test
t.test(cen_1_sample$age,cen_2_sample$age)

# performing chi-squared test
chisq.test(census$education, census$occupation)

