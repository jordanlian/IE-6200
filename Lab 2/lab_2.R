
install.packages("prob") # installing the prob package
library(prob) # load the prob package



# tosscoin() function

# Find the sample space and the probabilities of tossing a coin once
tc1 <- tosscoin(times =1, makespace = TRUE) #makespace = TRUE shows the probability for each event in a sample space
tc1

# Find the sample space  of tossing a coin once
tc1 <- tosscoin(times = 1, makespace = FALSE)
tc1

# Quiz: Try finding the sample space of tossing a coin two times
tc2 <- tosscoin(times = 2, makespace = TRUE)
tc2

# Find the sample space and the probabilities of rolling a fair die once
rolldie(times = 1, nsides = 6, makespace = TRUE)

# Quiz: Can you find the sample space of rolling a die twice having four sides
rolldie(times = 2, nsides = 4, makespace = TRUE)

# Finding the sample space and probabilities for all the cards (joker excluded) present in a deck of cards
cards(jokers = FALSE, makespace = TRUE)

# Finding the sample space and probabilities for all the cards (joker included) present in a deck of cards.
cards(jokers = TRUE, makespace = TRUE)


#sampling from urns
balls <- c("red", "green", "blue")
balls

#ordered with replacement
urnsamples(balls, size = 2, replace = TRUE, ordered = TRUE)

#ordered without replacement
urnsamples(balls, size = 2, replace = FALSE, ordered = TRUE)

#unordered with replacement
urnsamples(balls, size = 2, replace = TRUE, ordered = FALSE)

#unordered without replacement
urnsamples(balls, size = 2, replace = FALSE, ordered = FALSE)


#getting the number of elements in the sample space
nsamp(n=3, k=2, replace = TRUE, ordered = TRUE)
nsamp(n=3, k=2, replace = FALSE, ordered = TRUE)
nsamp(n=3, k=2, replace = FALSE, ordered = FALSE)
nsamp(n=3, k=2, replace = TRUE, ordered = FALSE)


S <- tosscoin(2, makespace = TRUE)
S
S[1:3, ]


S <- cards(makespace = TRUE)
subset(S, suit == "Heart", rank == "K")
subset(S, suit == "Club")


# X1 is the outcome of 1st roll, X2 is the outcome of the second roll, X3 is the outcome of the third roll.
subset(rolldie(3), X1+X2+X3 > 16)



x <- 1:10
y <- 3:7
y %in% x


isin(x,y)

x <- 1:10
y <- c(3,3,7)
all(y %in% x)
isin(x,y)


isin(x, c(3,4,5), ordered = TRUE)
isin(x, c(3,5,4), ordered = TRUE)



S <- cards(makespace = TRUE)
S
Prob(S)

# A - cards belonging to suit of Hearts
A <- subset(S, suit == "Heart")
A
Prob(A)

# B- cards with rank from 7 to 9
B <- subset(S, rank %in% 7:9)
B
Prob(B)





# prob that a card belongs to the suit of hearts given its rank is from 7 to 9
Prob(A, given = B)

# prob that a card has a rank from 7 to 9 given it belongs to the suit of hearts.
Prob(B, given = A)