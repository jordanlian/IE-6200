# load the library
library(tidyverse)

#install.packages("TeachingDemos")

library(TeachingDemos)


# load the data
census <- read.csv('census.csv', header = TRUE, sep = ',')
str(census)


################## 1- Z-test ##################
## 1-1: one sample Z-test

##Question: Is the population age and the sample age equal?

# Step 1: Create a z-test function manually.

##> This function has two input arguments (sample, pop)
##> The output of this function is the calculated Z_calc and P_value)

# Create the function: one sample z test
z.test <- function(sample, pop){
  sample_mean = mean(sample) 
  pop_mean = mean(pop)
  n = length(sample) 
  var = var(pop)
  z = (sample_mean - pop_mean) / sqrt((var/(n))) 
  df<-data.frame("Z_calc"=z,"P_value"=pnorm(z))
  return(df)
}


#Step 2: Create samples

#to return the same data each time we sample it, we need to set the seed to a numerical value
set.seed(100) 

#sample data
censusSample <- sample_n(census, 1000)

###mean(censusSample$age)


sample     = censusSample$age
population = census$age


# Step 3: Run the test 
z.test(sample, population)

##> What is the conclusion of the test?
##As P_value > 0.05 we fail to reject the null hypothesis

##### ------------------------- #####

## 1-2: two sample Z-test
##Question: Is the age of two random samples generated from the census data equal or not?

##> This function has two input arguments (sample, pop)
##> The output of this function is the calculated Z_calc and P_value)

# Step 1: Create a two sample z-test function manually.

z_test2 = function(a, b, var_a, var_b){
  n.a = length(a)
  n.b = length(b)
  z = (mean(a) - mean(b)) / (sqrt((var_a)/n.a + (var_b)/n.b))
  df<-data.frame("Zcal"=z,"P_value"=pnorm(z))
  return(df)
}

#Step 2: Create two samples

#to return the same data each time we sample it, we need to set the seed to a numerical value
set.seed(100)

cen_1 <- census[1:16000,] #select all columns and rows from 1 to 16000  
cen_2 <- census[16001:32561,] #select all columns and rows from 16001 to 32561
cen_1_sample <- sample_n(cen_1, 1000) #sample 1000 rows from the first population
cen_2_sample <- sample_n(cen_2, 1000) #sample 1000 rows from the second population

sample1<-cen_1_sample$age
sample2<-cen_2_sample$age
var_1<-var(cen_1_sample$age)
var_2<-var(cen_2_sample$age)

# Step 3: Run the test

z_test2(sample1,sample2,var_1,var_2)

##> What is the conclusion of the test?
##As P_value > 0.05 we fail to reject the null hypothesis



################## 2- t-test ##################

# Question: Compare if the mean age of people holding a Masters degree is equivalent to 
#           the mean of population age.


##mean age of population== mean age of people holding masters degree

#Step-1 : Filter the masters data 

censusMasters <- census %>% 
  dplyr::filter(education == ' Masters' )

sample   = censusMasters$age
pop_mean = mean(census$age)

#Step - 2 : performing the t test

t.test(x=sample , mu =pop_mean )


##> What is the conclusion of the test?
##As P_value < 0.05 we reject the null hypothesis

##### ------------------------- #####

## 2-2: Two sample t-test

##Question: Is the mean age of two random samples generated from the census data equal or not?

# performing two sample t test

#Step 1: Create two samples

#to return the same data each time we sample it, we need to set the seed to a numerical value
set.seed(100)

cen_1 <- census[1:16000,] #select all columns and rows from 1 to 16000  
cen_2 <- census[16001:32561,] #select all columns and rows from 16001 to 32561
cen_1_sample <- sample_n(cen_1, 1000) #sample 1000 rows from the first population
cen_2_sample <- sample_n(cen_2, 1000) #sample 1000 rows from the second population

sample1<-cen_1_sample$age
sample2<-cen_2_sample$age


#Step - 2 : performing the t test

t.test(x=sample1,y=sample2)

##> What is the conclusion of the test?
##As P_value > 0.05 we fail to reject the null hypothesis





################## 3- Proportion tests ##################
## 3-1: one sample proportion
## Question 5:#Based on 2004 census data, 48% of the total population status was married. 
#              Do we have different percentage of married people in 1994?

##proportion of people married in 1994 ==48% 


# Step 0: Check the unique values in marital-status 
unique(census$marital_status)

# Step 1: filter the data based on all different type of Married
census_married <-census %>% filter( marital_status %in% c(" Married-civ-spouse"," Married-AF-spouse",
                                                         " Married-spouse-absent") )
head(census_married)

# Step 2: define (x), a vector of counts of successes
Num_of_Married = nrow(census_married)
Num_of_Married

# Step 3: Total Sample size (n)
Sample_Size = length(census$marital_status)
Sample_Size

# Step 4: Run the one-sample proportion test
prop.test(x= Num_of_Married, n=Sample_Size, p=0.48, correct = TRUE, conf.level = 0.95,
          alternative = "two.sided")

# correct: a logical indicating whether Yates' continuity correction should be applied where possible


##> What is the conclusion of the test?
##As P_value < 0.05 we reject the null hypothesis

##### ------------------------- #####

## 3-2: Two sample proportion
##Question 6: Comparing the proportion of income of people with Masters degree and Bachelors degree

# Proportion income for masters degree people == income for bachelors degree people

# Step 1-a: Determine the number of people with Masters degree
n1 <-length(which(census$education == " Masters"))
n1

# Step 1-b: Filter and calculate the number of rows based on degree and income  
x1 <- census %>% filter(education==" Masters" & income==" >50K") %>% nrow()
x1

# Step 1-c: Determine the number of people with Bachelors degree
n2 <-length(which(census$education == " Bachelors"))
n2

# Step 1-d: Filter and calculate the number of rows based on degree and income  
x2 <- census %>% filter(education==" Bachelors" & income==" >50K")%>% nrow()
x2


# step 2: Execute the test
prop.test(x=c(x1, x2),n=c(n1,n2))


##> What is the conclusion of the test?
##As P_value < 0.05 we reject the null hypothesis



       
################## 4- Variance tests ##################

## 4-1: One-Sample Variance test - Chi-Square test

##Question 7: Is the variance of hours per week greater than 40 or not
##step-1 : Get the required data

data=census$hours_per_week

# step 2: Execute the test

sigma.test(x=data,sigma = 40)

##> What is the conclusion of the test?
##As P_value < 0.05 we reject the null hypothesis


##### ------------------------- #####
# 4-2: Ratio of Variances test (two-sample test)- F-test

## Question 8: Check whether the ratio of variance of number of hours per week worked by a
##              government and non-government employee are equal?


###number of worked by a government employee == number of hours worked by a non-government employee

unique(census$workclass)

#Step-1-a : Filtering the government employees

census_gov<-census %>% filter(workclass %in% c(" State-gov"," Federal-gov"," Local-gov" ))
gov_work<-census_gov$hours_per_week

#Step-1-b : Filtering the non-government employees 
census_private<-census %>% filter( ! workclass %in% c(" State-gov"," Federal-gov"," Local-gov" ))
priv_work<-census_private$hours_per_week

# step 2: Execute the test

var.test(x=gov_work,y=priv_work)

##> What is the conclusion of the test?
##As P_value < 0.05 we reject the null hypothesis



