# R packages

# installing the packages (only need to do this once if packages are not installed)
install.packages('tidyverse') # install the tidyverse package
install.packages('e1071') # install the e1071 package

# loading the packages
library(tidyverse) # load the tidyverse package
library(e1071) # load the e1071 package

setwd("C:/Users/Jordan Lian/OneDrive - Northeastern University/Fall 2020/IE 6200/Lab 3")

# import the health dataset
health_df <- read.table('Health_Dataset.csv', # file to be imported
                        header = TRUE, # the dataset has header columns
                        sep = ',') # the field separator character. Values on each line
# of the file are separated by this character

str(health_df) #structure of the dataset

# descriptive statistics
head(health_df)

# example 1: find the average age of people who have suffered from a stroke.

stroke_df <- health_df[health_df$Stroke == TRUE,]
head(stroke_df)


stroke_df$Age
mean_stroke_age <- mean(stroke_df$Age)
mean_stroke_age

# we can do the entire operation in a single line as well
mean_stroke_age2 <- mean(health_df[health_df$Stroke == TRUE, ]$Age)
mean_stroke_age2

# median
median_age <- median(health_df$Age)
median_age

# Minimum and Maximum
min_age <- min(health_df$Age)
min_age

max_age <- max(health_df$Age)
max_age

# Measures of Variablility
### Range
range_age <- range(health_df$Age)
range_age



### Quantiles
quantile(health_df$Age)

# To get the point till which the first 10% of data lies, we can do the following
quantile(health_df$Age, prob = 0.10)
?quantile()

### Variance
var_age <- var(health_df$Age)
var_age


### Standard Deviation
sd_stroke_age <- sd(health_df[health_df$Stroke == TRUE, ]$Age)
sd_stroke_age


### Coefficient of Variation 
cv_stroke_age <- (sd_stroke_age/mean_stroke_age)*100
cv_stroke_age

## Measures of Symmetry

### Skewness
skewness_age <- skewness(health_df$Age)
skewness_age

### Kurtosis
kurtosis_age <- kurtosis(health_df$Age)
kurtosis_age

## Summary
summary(health_df)

# Visual Analysis

## Histogram
 ggplot(data = health_df) + 
  geom_histogram(mapping = aes(x = BMI),bins = 10) +
  xlab('Age') +
   ylab('frequency')
  
skewness(health_df$BMI)
kurtosis(health_df$BMI)
ggplot(data = health_df) + 
  geom_histogram(mapping = aes(x = Age),bins = 10,
                 color = 'Black', fill = 'White') +
  xlab('BMI (kg/m2)')

## Scatter plot
ggplot(data = health_df) + 
  geom_point(mapping = aes(x = Age, y = Avg_Glucose_Level, color = Hypertension)) +
  geom_vline(xintercept = 40) +
  geom_hline(yintercept = 150)

## Stem and Leaf Plot
stem(health_df$Age)

## Boxplot
boxplot <- ggplot(data = health_df) + 
  geom_boxplot(mapping = aes(x = Stroke, y = Age))

boxplot