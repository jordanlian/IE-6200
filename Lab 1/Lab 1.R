# 3.Working Directory

#get the current working for the R session (make comments using '#' sign)
getwd()

# update the working directory
#setwd('path for the working directory')  (remove the # sign and input the path for the updated working directory)

# 4.Data Types

# character data type



x <- as.character(3.14)
x
class(x)
is.character(x)

# numeric data type
x <- 10.5 # assign a decimal value
x
class(x)
typeof(x)

# integer as a numeric data type
k <- 1
k
class(k)
typeof(k)


# creating an integer
y <- as.integer(1)
y
class(y)

# coerece a numeric value into an integer
as.integer(3.14)    #When changing a decimal number to integer r always rounds the number to the lowest integer

# logical
x <- 1
y <- 2
x
y

z <- x > y
z
class(z)

# 5.Operators

# arithmetic operators
x <- 5
y <- 16

x
y

x + y 
x - y 
x * y 
y / x 
y %/% x #quotient
y %% x #remainder
y ^ x 


# relational operators(used for comparing values)
x <- 5
y <- 16

x
y


x < y
x > y
x <= 5
y >= 20
y == 16
y == 15
x != 5
x != 10


# logical operators(AND,OR,NOT)

x <- c(TRUE,FALSE,0,6)
y <- c(FALSE,TRUE,FALSE,TRUE)


!x # NOT x
x|y # x OR y
x||y # x OR y (compare only the first element)
x&y # x AND y
x&&y # x AND y (Compare only the first element)

# 6.Data Structures

# vectors

# numeric vector
c(10, 5, 3, 6, 21)
vec<-c(1,2,3,4)
class(vec)

# character vector
vec2<-c("aa", "bb", "cc", "dd", "ee") 
class(vec2)


# combine vectors
n <- c(2, 3, 5)
s <- c("aa", "bb", "cc", "dd", "ee")
length(s)
combined_vec <- c(n, s) # combine n and s
combined_vec
class(combined_vec)
length(combined_vec)






# vector arithmetic
a <- c(1, 3, 5, 7) 
b <- c(1, 2, 4, 8)


a[a<5]

5 * a 

a + b 

u <- c(10, 20, 30) 
v <- c(1, 2, 3, 4, 5, 6, 7, 8,9) 
u + v

# vector indexing    (starts from 1 not 0)
s
s[3] 
s[-3]
s[10]
s[c(2, 3)] 
s[2:5]

# matrices
A <- matrix(
  c(2, 4, 3, 1, 5, 7), # the data elements 
  nrow=2,              # number of rows 
  ncol=3              # number of columns 
  )        # fill matrix by rows 

A


A2 <- matrix(
  c(2, 4, 3, 1, 5, 7), # the data elements 
  nrow=2,              # number of rows 
  ncol=3,              # number of columns 
  byrow = FALSE)        # fill matrix by rows 

A2




# matrix indexing
A[2, 3] 
A[2, ]
A[ ,c(1,3)]

# transpose
B <- t(A)

B

# rbind
D <- matrix( 
  c(6, 2), 
  nrow=1, 
  ncol=2) # D has two columns

D

rbind(B, D)

#cbind
E<-matrix(c(10,12),nrow = 2,ncol = 1)

E
cbind(A2,E)


# lists
n <- c(2, 3, 5)
s <- c("aa", "bb", "cc", "dd", "ee")
A <- matrix(
  c(2, 4, 3, 1, 5, 7),
  nrow=2,              
  ncol=3,            
  byrow = TRUE)        
x <- list(n, s, A)   # x contains n, s and matrix A

x

class(x)

# list indexing
x[2] 
x[c(2, 3)]
x[[2]]
x[[2]][4]
x

x[[2]][1] <- "bb"
x[[2]]

# data frames  #first name #age
n <- c(2, 3, 5) 
s <- c("aa", "bb", "cc")
df <- data.frame(n, s)

df

# mtcars data frame

data()#list of data frames available in r
tail(mtcars)


str(mtcars)  #structure
c(nrow(mtcars), ncol(mtcars))
mtcars$mpg

head(mtcars)
summary(mtcars)

