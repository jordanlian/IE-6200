# install and load prob package
install.packages("prob")
library(prob)

# Set working directory
setwd("C:/Users/Jordan Lian/OneDrive - Northeastern University/Fall 2020/IE 6200/Lab 2 - IE 6200 - Sec 09 - Jordan Lian")

# Task 1 - Roll a die 3 times
R3 <- rolldie(times = 3, nsides = 6, makespace = TRUE) 

# a. getting the same numbers on all three rolls of a die
a <- subset(R3, X1 == X2 & X2 == X3) 
a
Prob(a) 

# b. sum of all 3 rolls is greater than 6
b <- subset(R3, X1 + X2 + X3 > 6)
Prob(b) 

# c. getting number 2 on the first and second roll of the die
c <- subset(R3, X1 == 2 & X2 == 2)
c
Prob(c) 

# Task 2 -Toss a coin 3 times
T3 = tosscoin(times = 3, makespace = TRUE)
T3

# a. get a head on the first toss
a <- subset(T3, toss1 == "H")
a
Prob(a)

# b. get tails on the last toss
b <- subset(T3, toss3 == "T")
b
Prob(b)

# c. getting all heads
c <- subset(T3, toss1 == "H" & toss1 == toss2 & toss2 == toss3)
c
Prob(c)

# d. get at least 1 tail
d <- subset(T3, toss1 == "T" | toss2 == "T" | toss3 == "T")
d
Prob(d)

# Task 3 - 2 balls from a urn with 3 colored balls
balls <- c("red", "green", "blue")

task3 = urnsamples(balls, size = 2, replace = TRUE, ordered = TRUE)
task3

# a. all balls are of the same color
same_color = subset(task3, X1 == X2)
same_color

# b. at least 1 red colored ball
red_color = subset(task3, X1 == "red" | X2 == "red")
red_color

# Task 4 - drawing cards
draw_cards = cards(jokers = FALSE, makespace = TRUE)
draw_cards

# a. card belongs to the suit of diamonds
a <- subset(draw_cards, suit == "Diamond")
a
Prob(a)

# b. card belongs to the suit of hearts and has a rank K
b <- subset(draw_cards, suit == "Heart" & rank == "K")
b
Prob(b)

# c. card is either an Ace, King, Queen, or Jack
c <- subset(draw_cards, rank == "J" | rank == "Q" | rank == "K" | rank == "A")
c
Prob(c)

# d. card is Ace given it belongs to a suit of clubs
d1 <- subset(draw_cards, suit == "Club")
d1
d2 <- subset(d1, rank == "A")
d2
Prob(d2, given = d1)