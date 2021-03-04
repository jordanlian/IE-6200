# Task 1: Working Directory
setwd("C:/Users/Jordan Lian/OneDrive - Northeastern University/Fall 2020/IE 6200/Lab 0 - IE 6200 - Sec 09 - Jordan Lian")
getwd()

# Task 2: Variables and their Class
x <- 1
y <- "1"
class(x)
class(y)

# Task 3: Numerical Vectors
vect <- c(9, 8, 7, 6 , 4)
vect[3] # indexing method 1
vect[c(3)] # indexing method 2

# Task 4: Matrices
A <- matrix(
  c(1, 2, 3, 4), # the data elements
  nrow = 2, # number of rows
  ncol = 2, # number of columns
  byrow = TRUE # fill up by row
)
A # display

# new row D
D <- matrix(
  c(5, 6),
  nrow = 1,
  ncol = 2,
  byrow = TRUE)

# add new row D to matrix A
B <- rbind(A, D)
B 

# new column E
E <- matrix(
  c(7, 8, 9),
  nrow = 3,
  ncol = 1,
  byrow = TRUE
)

# add new column E to matrix B
C <- cbind(B, E)
C

# Task 5: Dataframes
head(iris, 5)
tail(iris, 5)

