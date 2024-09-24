###################
# MATRIX QUESTIONS
###################

# QUESTION:
#
# Write a function, f, that takes a numeric matrix, m, and returns a vector.
# The function should return a new matrix that multiplies the even values
# by two and multiplies the odd values by 3
#
# The function should stop with an error if m is not a numeric matrix
#
# EXAMPLES:
#    
#    > x = matrix(1:9, nrow=3, ncol=3)
#    
#    > x
#    [,1] [,2] [,3]
#    [1,]    1    4    7
#    [2,]    2    5    8
#    [3,]    3    6    9
#    
#    > f(x)
#    [,1] [,2] [,3]
#    [1,]    3    8   21
#    [2,]    4   15   16
#    [3,]    9   12   27


# Answer
f <- function( m ){
  if ( !is.matrix(m) ||  ! is.numeric(m) ) {
    stop("m must be a numeric matrix")
  }
  
  m[ m %% 2 == 0] = m[ m%%2 == 0 ] * 2
  m[ m %% 2 == 1] = m[ m%%2 == 1 ] * 3

  return(m)
}

# Testing 
x = matrix(1:9, nrow=3, ncol=3)
x
f(x)


# QUESTION:
#
# Write a function, f, that takes a matrix, m, as an argument.
# The function should return a vector that contains the
# corner values from the matrix. 
#
# If the matrix contains only one row or one column
# make sure to only return two values (not four).
#
# If the matrix contains only one value
# then the vector should only contain that one value.

f <- function(m) {
  
  # Only one of the following blocks of code will happen. 
  # The first condition to be true causes that block of
  # code to run. If none of the conditions are TRUE then
  # the block for the else will run.
  if (nrow(m) > 1 & ncol(m) > 1){
    
    # matrix is multiple columns and multiple rows
    return ( c(m[1,1]       , 
               m[1,ncol(m)] , 
               m[nrow(m),1] , 
               m[nrow(m),ncol(m)]) )
  } else if (ncol(m) > 1){
    
    # one row (but more than one column)
    return ( c(m[1,1] , m[1,ncol(m)]))
    
  } else if (nrow(m)>1) {  
    
    # one column (but more than one row)
    return ( c(m[1,1],m[nrow(m),1]))
    
  } else {  # do not put a (condition) for an "else" section
    
    # only one value (i.e. a 1x1 matrix)
    return ( m[1,1] )
    
  }
}

# TESTING
x = matrix(1:12, nrow=3, ncol=4)
x
f (x)

x = matrix(1:3, nrow=1, ncol=3)
x
f (x)

x = matrix(1:3, nrow=3, ncol=1)
x
f (x)

x = matrix(100, nrow=1, ncol=1)
x
f (x)

##############################
# Random values
##############################

# QUESTION:
#
# Write a function that simulates choosing 5 cards from a standard
# deck of playing cards. The cards could have values such as
# 2c 2s 2d 2h 3c 3s 3d 3h   ...   jc js jd jh ... ac as ad ah
# for 2 of clubs, 2 of spades, 2 of diamonds, 2 of hearts, etc.

dealCards <- function( numCards ){
  deck <- c("2c", "2s", "2d", "2h",
            "3c", "3s", "3d", "3h",
            "4c", "4s", "4d", "4h",
            "5c", "5s", "5d", "5h",
            "6c", "6s", "6d", "6h",
            "7c", "7s", "7d", "7h",
            "8c", "8s", "8d", "8h",
            "9c", "9s", "9d", "9h",
            "10c", "10s", "10d", "10h",
            "jc", "js", "jd", "jh",
            "qc", "qs", "qd", "qh",
            "kc", "ks", "kd", "kh",
            "ac", "as", "ad", "ah")
  
  sample(deck, 5)
}

hand <- dealCards(5) 
hand  
dealCards(5)
dealCards(5)

########################
# loops
########################

# QUESTION
#
# Write a function, f, that asks the user to enter a number.
# If the number is a perfect square, the program should display 
# "THE NUMBER is a perfect square" (without the quotes), otherwise, display
# "THE NUMBER is NOT a perfect square". The program should continue asking
# the user for more numbers or Q to quit.

f <- function(){
  userAnswer <- readline("Enter a number or Q to quit: ")
  while (userAnswer != "Q"){
    num = as.numeric(userAnswer)
    if (sqrt(num) == trunc(sqrt(num))){
      cat(num, "is a perfect square\n")
    } else {
      cat(num, "is NOT a perfect square\n")
    }
    
    userAnswer <- readline("Enter a number or Q to quit: ")
  }
}

# TEST
f()   # This will run the function. A sample is shown below:

# f()
# Enter a number or Q to quit: 5
# 5 is NOT a perfect square
# Enter a number or Q to quit: 4
# 4 is a perfect square
# Enter a number or Q to quit: 100
# 100 is a perfect square
# Enter a number or Q to quit: 92
# 92 is NOT a perfect square
# Enter a number or Q to quit: Q



