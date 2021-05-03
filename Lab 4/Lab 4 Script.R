# required packages
library(tidyverse)
library(reshape2)

setwd("C:/Users/Jordan Lian/OneDrive - Northeastern University/Fall 2020/IE 6200/Lab 4")

# importing the dataset
bikes_df <- read.csv('bluebikes.csv', header = TRUE, sep = ',')
head(bikes_df, 2) # structure of the dataset

# pmf and cdf

# the number of bikes that are picked up from a particular station during a particular hour

# station name = Christian Science Plaza - Massachusetts Ave at Westland Ave station (CSP)
# hour = 8

# selecting start station, month, date and hour

req_col <- select(bikes_df, start.station.name, month, date, hour)
head(req_col, 5)


# filtering only the required rows
req_row <- dplyr::filter(req_col, start.station.name == 'CSP' & hour == 8)
head(req_row, 5)

# grouping values by date and hour
daily <- group_by(req_row, month, date, hour)

# creating a new column name count for the number of bikes
daily <- summarise(daily, count = n())
head(daily)

# group by and summarise to get the number of days same number of bikes were picked up
days <- group_by(daily, count)
days <- summarise(days, num_days = n())
head(days)

# calculate pmf
pickup_pmf <- round(days$num_days/sum(days$num_days),3)
pickup_pmf

# calculate cdf
pickup_cdf <- round(cumsum(pickup_pmf),3)
pickup_cdf

csp_freq <- cbind(days, pickup_pmf = pickup_pmf, pickup_cdf = pickup_cdf)
csp_freq

# doing everything above in a single step
csp_freq <- bikes_df %>%
  select(start.station.name, month, date, hour) %>%
  dplyr::filter(start.station.name == 'CSP' & hour == 8) %>%
  group_by(month, date, hour) %>%
  summarise(count = n()) %>%
  group_by(count) %>%
  summarise(num_days = n()) %>%
  mutate(pickup_pmf = num_days/sum(num_days)) %>%
  mutate(pickup_cdf = cumsum(pickup_pmf))

csp_freq

ggplot(csp_freq, aes(count, pickup_pmf)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_bw() +
  labs( y = 'Pickup Probability') +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous("csp_pickup", labels = as.character(csp_freq$count),
                     breaks = csp_freq$count)

# expected value
weighted.mean(csp_freq$count, csp_freq$pickup_pmf)

# joint probability

# Back Bay station
bb_freq <- bikes_df %>%
  select(end.station.name, month, date, hour) %>%
  dplyr::filter(end.station.name == 'Back Bay' & hour == 8) %>%
  group_by(month, date, hour) %>%
  summarise(count = n()) %>%
  group_by(count) %>%
  summarise(num_days = n()) %>%
  mutate(dropoff_pmf = num_days/sum(num_days)) %>%
  mutate(dropoff_cdf = cumsum(dropoff_pmf))

bb_freq

# frequency table

joint_freq <- outer(csp_freq$num_days[6:15], bb_freq$num_days[6:15], FUN = "+")
rownames(joint_freq) <- csp_freq$count[6:15]
colnames(joint_freq) <- bb_freq$count[6:15]

joint_freq

# probabilities
joint_prob <- round(joint_freq/sum(joint_freq),3)
joint_prob

# restructuring the data
joint_df <- melt(joint_freq)
colnames(joint_df) <- c('csp_pickup', 'bb_dropoff', 'frequency')
head(joint_df, 10)

# creating a plot
ggplot(data = joint_df,aes(x=csp_pickup, y=bb_dropoff)) +
  geom_point(aes(size = frequency, color = frequency)) +
  labs(x = 'CSP Pickup', y = 'BB Dropoff') +
  scale_x_continuous("csp_pickup", labels = as.character(joint_df$csp_pickup),
                     breaks = joint_df$csp_pickup) +
  scale_y_continuous("bb_dropoff", labels = as.character(joint_df$bb_dropoff),
                     breaks = joint_df$bb_dropoff)


# correlation coefficient
# data frame for the Christian Science Plaza stations
csp_8 <- bikes_df %>%
  select(start.station.name, month, date, hour) %>%
  dplyr::filter(start.station.name == 'CSP') %>%
  group_by(month, date) %>%
  summarise(count = n())

csp_8

# data frame for the Back Bay station
bb_8 <- bikes_df %>%
  select(end.station.name, month, date, hour) %>%
  dplyr::filter(end.station.name == 'Back Bay') %>%
  group_by(month, date) %>%
  summarise(count = n())

bb_8

# calculating the coefficient
cor(csp_8$count, bb_8$count)
