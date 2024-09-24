rm(list=ls())

#########################
#########################
##
## While loop
##
#########################
#########################

# A while loop allows the same code to be repeated many times.
# This is best explained with an example.
#
# The following function calculates the factorial of a number.
# (search online for the definition of a factorial - this is one of
# many resources: https://www.mathsisfun.com/numbers/factorial.html)
#
# EXAMPLES:
#     factorial(4) is 4*3*2*1
#     factorial(6) is 6*4*3*2*1
#     factorial (1)  is 1
#     factorial (0)  is 1
#     factorial of negative numbers are undefined

factorial <- function(num){
  if (num <0 | !is.numeric(num) | trunc(num) != num | length(num) != 1) {
    stop("num must be a single positive whole number")
  }
  
  answer = 1
  
  # A while loop looks similar to an if, except that a while loop 
  # starts with the word "while" and an if starts with the word "if".
  #
  # - Similar to an "if", a "while" has a logical condition in parentheses
  #   followed by some code in {curly braces}. (The code in the {curly braces}
  #   is called the "body" of the while loop.)
  #  
  # - Similar to an "if", the condition must evaluate to TRUE or FALSE.
  #
  # - Similar to an "if" - when the condition for the while is TRUE - the code
  #   in the {curly braces} is executed and when the condition is FALSE, 
  #   the code in the {curly braces} is NOT executed.
  #
  # - What makes a while different from an if is the following: 
  #
  #     o for an "if" when the code in the {curly braces} finishes, the
  #       execution of the code continues with the first line after the 
  #       body of the "if"
  #
  #     o for an "while" when the code in the {curly braces} finishes, the
  #       entire "while" is repeated - i.e. the condition is checked and 
  #       if it is still TRUE - the body of the while is done again. 
  #       This keeps happening as long as the condition is TRUE (i.e. "while"
  #       the condition is TRUE). If/when the condition eventually becomes 
  #       FALSE, the execution of the code continues with the first line
  #       after the body of the "while".
  #       body of the "if"
  #   
  
  # After the 
  # When the codition evaluates to TRUE, the code in the 
  # 
  # in that if the condition is true
  # then the code in the body runs. If the condition is false the entire
  # code inside the {curly braces} does not run and the function continues
  # with the first line of code after the {curly braces}
  
  # For every while loop you must keep in mind the following
  # 1. The condition must depend on SOME variable
  # 2. The code inside the {curly braces} is known as the "body" of the loop.
  # 3. The code in the body must eventually cause the condition to become false.
  #    The most common way to do that is for the body to change
  #    the value of a variable in the condition in some way.
  
  while(num > 1) {
    answer <- answer * num
    num <- num - 1
  }
  
  return(answer)
}

factorial(-1)
factorial(0)
factorial(1)
factorial(3)   # 6, ie. 3 * 2 * 1
factorial(5)   # 120 i.e. 5*4*3*2*1
factorial(10)  # 3628800 - i.e. 10*9*8*7*6*5*4*3*2*1
factorial(100) # 9.332622e+157   -  this is a VERY VERY large number


debugonce(factorial)
factorial(5)

debugonce(factorial)
factorial(1)


factorial(c(1,2,3,4))
#----------------------------------------------------------------
# The factorial function above only works with a single number.
# You can get the factorials of many numbers by using lapply
# to get a list of the answers for several numbers
#----------------------------------------------------------------
lapply(c(1,3,5,10), factorial)  # find the factorials of 1,2,3 and 4

sapply(c(1,3,5,10), factorial)  # find the factorials of 1,2,3 and 4

#---------------------------------------------------------------------
# sapply
#---------------------------------------------------------------------
# The sapply function is similar to the lapply function.
# 
# sapply dffers from lapply in the following way:
# 
# - If every "answer" is a single vector of length 1, then sapply will return 
#   all of the answers in a single vector instead of returning a list of answers.
#
# - If every "answer" is a vector that has more than one value but all answers
#   are the same length (e.g. all answers have 2 values) then sapply returns
#   a matrix. Each column in the matrix will contain one of the answers.
#
# - If different "answers" are of different lengths or different classes
#   of data, then sapply returns a list of answers. In this case, sapply
#   and lapply return the same value.
#
# The "s" in "sapply" stands for "simplify". In other words, sapply 
# may return a vector or a matrix, instead of a list. Vectors and matrices
# often look like "simpler" data structures than lists, hence the name "sapply".
#
# The "l" in "lapply" stands for "list". This is because the result
# of calling lapply is ALWAY a list of answers.
#---------------------------------------------------------------------

#..................................................................
# These values and functions will be used below to demonstrate the 
# differences between the lapply and sapply functions.
#..................................................................

# return a vector of 3 numbers
f = function(num){
  if(length(num) > 1 | !is.numeric(num)){
    stop("num is expected to be a single number")
  }
  c(num, num+100, num+1000)
}
f(1)
f(3)
f(c(1,3))

# return different length vectors for different numbers
g  = function(num){
  if(length(num) > 1 | !is.numeric(num)){
    stop("num is expected to be a single number")
  }
  rep(num, num)  
}
g(2)
g(3)
g(9)

# These are some numbers we will use with the following examples
nums = c(1,3,5,10)

# factorial always returns a single number so sapply returns a vector.
lapply(nums, factorial)  # list of answers
sapply(nums, factorial)  # vector of answers

# Function f always returns 3 numbers so sapply returns a matrix of 3 rows.
# There will be as many columns in the matrix as there are numbers in nums.
lapply(nums, f)   # a list
sapply(nums, f)   # a matrix

# Function g returns different length vectors for different numbers
# so sapply returns a list, just as lapply does.
lapply(nums, g)   # a list
sapply(nums, g)   # also a list




#########################################################################
#
# *** IMPORTANT ***
#
# Writing code with loops can be tricky, especially if you're new at it.
# Watch out for potential coding errors ... be CAREFUL!!!
#########################################################################

#....................................................................
# Infinite loops
#....................................................................
# IMPORTANT ... When writing code with while loops it is possible to 
# introduce errors in which the loop will "never end". 
# This is called an "infinite loop". If your code enters an "infinite loop",
# RStudio will become unresponsive. If you don't know what to do it can be
# very frustrating!!  When this happens, either: 
#
#   - a little red "stop sign" button usually appears above the console
#     window pane in RStudio. Pressing the "stop sign" will stop the function
#     from running and let you once again use RStudio normally.
#
#   - If you don't see the stop sign, try pressing the ESC key. This can 
#     happen if you while loop is running with a call to readline() or a
#     similar function inside the loop. 
#
# In the following code, I purposely introduced an "infinite loop". You 
# will not be able to move on until you press the "stop sign" button that
# is above the console window pane in RStudio.
#....................................................................

# The following version of factorial has a bug that 
# causes an infinite loop.

badFactorial <- function(num){
 if (num <0 | !is.numeric(num) | trunc(num) != num | length(num) != 1) {
  stop("num must be a single positive whole number")
 }
 
 answer = 1
 
 # A while loop is similar to an if in that if the condition is true
 # then the code in the body runs. If the condition is false the body does not run
 # and the next line of the program after the body runs.
 
 # For every while loop you must keep in mind the following
 # 1. The condition must depend on SOME variable
 # 2. The body must eventually cause the condition to become false.
 #    The most common way to do that is for the body to change
 #    the value of a variable in the condition in some way.
 
 while(num > 1) {
  answer <- answer * num
  #   num <- num - 1       (I purposely "commented out" this line to cause an infinite loop)
 }
 
 return(answer)
}

badFactorial(0)
badFactorial(1)
badFactorial(2)

debugonce(badFactorial)

badFactorial(5)
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
# inifinite loop - press the "stop sign button" (above the console window pane)
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
badFunction = function (num){

  # This is an infinite loop  
  while (TRUE) {
    cat ('You are in an "infinite loop".\n')
    cat('Press the "stop sign" button (above the console window pane) to ',
        'stop the infinite loop\n\n')
    
    Sys.sleep(0.9)  # this causes R to "go to sleep" for 0.9 seconds
  }
}

badFunction(1)  # This will result in an "infinite loop". Press the "stop button".




###############################################################################
# NOTE - IN CLASS 23, BEREN SKIPPED THE FOLLOWING FUNCTION, anotherBadFunction
#        THAT DESCRIBES WHAT HAPPENS IF YOU HAVE A CALL TO readline() IN 
#        AN INFINITE LOOP.
#        GO BACK AND MENTION THIS IN CLASS 24
###############################################################################

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
# Another inifinite loop - there is no stop sign button.
#
# If you enter an infinite loop while the computer is waiting for the user
# to type something, you will NOT see a "stop sign button". Instead to 
# get out of the loop
# 
#   - click on the console window pane
#   - then click on the ESC key
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
anotherBadFunction = function() {
  
  # This is an infinite loop. You will NOT see a stop sign button.
  # Instead press ESC to get out of the loop.
  while(TRUE){
    x = readline("What's your name? (to stop looping, click console window, then press ESC)")    
  }
  
  
}

anotherBadFunction() # another infinite loop - click console window then press ESC key
  


# The following is the same exact code as above, without all the 
# comments. There are many different subtle errors that can pop up
# when writing while loops. Think about what would happen in each of the
# following situations ..
#
# What would happen in each of the situations listed below?
# To find out, change the code and try it.
#
# For each of the following questions, try to figure out what will happen
# before actually running the code. Then change the code and run it.
# To help you figure out what will happen, keep track of the values of all
# the variables and arguments on a piece of paper.
# Then, every time you "run a line of code in your head" keep track of any
# changes to the variables on the piece of paper.
#
# You can also use the debugger ...
#
# What would happen if ...
#    1. ... instead of "answer=1"     the programmer typed "answer=0" ?
#    2. ... instead of "while(num>1)" the programmer typed "while(num<1)" ?
#    3. ... instead of "num<-num+1"   the programmer typed "num<-num-1"
#    4. ... the programmer forgot to type the line "num<-num-1" and just left it out?
#    5. ... the programmer wrote the lines "answer<-answer*num" and "num<-num-1"
#           in the opposite order, i.e. "num<-num-1" and then "answer<-answer*num"

factorial <- function(num){
  if (num <0 | !is.numeric(num) | trunc(num) != num | length(num) != 1) {
    stop("num must be a single positive whole number")
  }
  
  answer = 1
  
  while(num > 1) {  
    answer <- answer * num
    num <- num - 1
  }
  
  return(answer)
}

factorial(4)

#debugonce(factorial)

factorial(4)  # The result SHOULD BE 24
factorial(100)

###############################################################################
# 2022 - BEREN - UP TO HERE - AFTER CLASS 23
#
# NOTE - we didn't do "anotherBadFunction" above which describes using
#        the readline function in an infinite loop.
###############################################################################

#--------------------------------------
# Another example ...
#--------------------------------------

# The following function 
# returns TRUE if num is a prime number and
# returns FALSE is num is not a prime number
#
# A prime number is a whole number (2 or more) that is 
# divisible by only 1 and itself.
#
# Technically 1 is NOT a prime number
# https://blogs.scientificamerican.com/roots-of-unity/why-isnt-1-a-prime-number/
 

is.prime <- function( num ) {

  if (num < 2){
    return(FALSE)
  }
  
  # MAKE SURE TO:  setup the variables that you need for the loop
  divisor <- 2  
  
  # if at any point you find that num is divided
  # evenly by some divisor, return FALSE
  
  while ( divisor < num ) {     #  MAKE SURE TO: use an appropriate condition
   
    if (num %% divisor == 0){   # BODY OF THE LOOP: ie. what the code should accomplish
      return(FALSE)             # BODY OF THE LOOP: ie. what the code should accomplish
    }                           # BODY OF THE LOOP: ie. what the code should accomplish
   
    divisor <- divisor + 1      # MAKE SURE TO: change something so eventually the condition becomes FALSE
  }
  
  return(TRUE)
}

debugonce(is.prime)
is.prime(7) # TRUE

is.prime(35) # FALSE
is.prime(37) # TRUE
is.prime(77) # FALSE

########################################################################.
# 2022 - WILF - UP TO HERE - AFTER CLASS 22
########################################################################.

#------------------------------------------.
# Use lapply to get multiple results
#------------------------------------------.

# check the first 20 numbers
lapply(1:20, is.prime) 

# check just the odd numbers
lapply(seq(1,19,by=2), is.prime)  # harder to read ... 2nd answer is for 3 not 2

# add names
x = lapply(seq(1,19,by=2), is.prime)
names(x) = seq(1,19,by=2)
x      # names must start with a letter. If they don't you can include the name in `backticks`
x$`9`  # FALSE
x$`17` # TRUE


#------------------------------------------.
# Use sapply to get multiple results
#------------------------------------------.

sapply(1:20, is.prime)     # result is below

# FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE




sapply(seq(1,19,by=2), is.prime)  # # check just the odd numbers

#  [1] FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE



# add names
x = sapply(seq(1,19,by=2), is.prime)
names(x) = seq(1,19,by=2)

x      # result is below

#     1     3     5     7     9    11    13    15    17    19 
# FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE


x[9]   # result is below - we only checked odd numbers so the 9th number checked is 17

#   17 
# TRUE 


x["9"] # result is below - the value whose "name" is "9"

#     9 
# FALSE 



#----------------------------------------------------
# Making the code "more efficient"
#----------------------------------------------------

# When the number gets large the while loop will need to "loop" many times.
# This can take some time even on a computer.

is.prime(181) # TRUE

is.prime(15485867)   # TRUE  (takes a few seconds to run)

is.prime(236887699)  # TRUE  (takes some time to run) - press "stop button" to cancel

is.prime(236887695)  # FALSE - very fast ... why?

#---------------------------------------------------------------------------
# Making a program more "efficient"
#---------------------------------------------------------------------------
# Do you really need to check all of the divisors from 2 through num-1 ?
#
# Obvious improvements:
#   - if a num is even you know that result is FALSE
#   - if num ends in 5 or 0 you know it is divisible by 5 so result is FALSE
#
# Non-obvious improvment:
#   - you only need to check the divisors from 2 through the sqrt(num) ... not through num
#     This speeds up the code A LOT.
#
# "Computer science" classes focus a lot on how to improve the "efficiency" of
# programs. We will NOT focus on efficiency. However, you should be familiar
# with the general issue.
#---------------------------------------------------------------------------

# With the knowledge of the above "non-obvious improvement"
# let's write a "more efficient" version of the function. 
# The following version also works but is "faster", i.e. it doesn't need to 
# check as many numbers. 
# 
# The code is the same as the previous version except for the 
# line below that says "#This line changed"

better.is.prime <- function( num ) {
  
  if (num < 2){
    return(FALSE)
  }
  
  divisor <- 2
  
  while ( divisor <= sqrt(num) ) {     # This line changed
    
    if (num %% divisor == 0){
      return(FALSE)   
    }
    divisor <- divisor + 1
  }
  
  return(TRUE)
}

better.is.prime(181) # TRUE

better.is.prime(15485867)   # TRUE  - returns right away

better.is.prime(236887699)  # TRUE  - returns right away



# The following is the same function again, this time without the comments.
#
# For each of the following questions, try to figure out what will happen
# before actually running the code. Then change the code and run it.
# To help you figure out what will happen, keep track of the values of all the variables
# and arguments on a piece of paper. Every time you "run a line of code in
# your head" keep track of any changes to the variables on the piece
# of paper. You can also use the debugger ...
#
# What would happen if ...
# 1. ... instead of "divisor <- 2"        the programmer typed "divisor <- 1" ?
# 2. ... instead of "while(divisor<num)"  the programmer typed "while(divisor>num)" ?
# 3. ... instead of "while(divisor<num)"  the programmer typed "while(divisor<=num)" ?
# 4. ... the line   "divisor<-divisor+1"  was mistakenly left out?
# 5. ... the line   "divisor<-divisor+1"  was inside the body of the if?
# 6. ... the line   "divisor<-divisor+1"  was before the if instead of after the if?
# 7. ... the line   "divisor<-divisor+1"  was before the if instead of after the if ...
#        and instead of "divisor <- 2"    the programmer typed "divisor <- 1" ?
# 8. ... the programmer forgot to type the last line "return(TRUE)".
# 9. ... instead of "while(divisor<num)"  the programmer typed "while(divisor<num/2)" ?
# 10. ... instead of "while(divisor<num)"  the programmer typed "while(divisor<sqrt(num))" ?

is.prime <- function( num ) {
  if (num < 2){
    return(FALSE)
  }

  divisor <- 2
  while ( divisor < num ) {       
    if (num %% divisor == 0){
      return(FALSE)   
    }
    divisor <- divisor + 1
  }
  return(TRUE)
}

debugonce(is.prime)
is.prime(35)
is.prime(37)


# CODE FOR Q7
q7.is.prime <- function( num ) {
 if (num < 2){
  return(FALSE)
 }
 
 divisor <- 1
 
 while ( divisor < num ) {       
  
  divisor <- divisor + 1
  
  if (num %% divisor == 0){
   return(FALSE)   
  }
 }
 return(TRUE)
}

debugonce(q7.is.prime)
q7.is.prime(5)
q7.is.prime(9)





#----------------------------------------------------
# Another way to write the same function.
#
# This version has a single return statement at the end of the function.
# Some people argue that this style is "cleaner" and
# easier to understand when reading the code.
#----------------------------------------------------

is.prime2 <- function( num ) {
  answer <- TRUE   # assume answer is TRUE unless we find out otherwise
  
  if (num < 2){
    answer <- FALSE
    
  } else {
  
    divisor <- 2
    while ( divisor < num ) {
      if (num %% divisor == 0){
        answer <- FALSE
      }
      divisor <- divisor + 1
    }
  }
  
  return(answer)
}

is.prime2(35)  # FALSE
is.prime2(37)  # TRUE


# check to make sure that both versions return the same values

all(sapply(1:100,is.prime) == sapply(1:100,is.prime2))   # TRUE



#--------------------------------------------------
# Write a function to find all divisors of a number
# (assume that num is a positive whole number)
#--------------------------------------------------

divisors <- function(num){
  if (!is.numeric(num) | trunc(num)!=num | num<1 | length(num)!=1){
    stop("num must be a single positive whole number")
  }
  
  # This is the variable we will return at the end of the function.
  answer <- 1  # 1 is a divisor of all positive whole numbers
  
  divisor <- 2              
  while(divisor <= num){
    if (num %% divisor == 0){
      answer <- c(answer, divisor)  # add another number to the answer
    }
    divisor <- divisor + 1
  }
  
  return(answer)
}

debugonce(divisors)
divisors(12)
divisors(15)
divisors(36)
divisors(100)
divisors(101)  # this is prime, only divisors are 1 and 101
divisors(15485863)  # This will take a few seconds.
divisors(67867979)  # This will take a few seconds.
divisors(67867970)  # This will take a few seconds.

#-------------------------------------
# a more efficient version
#-------------------------------------

divisors.faster <- function(num){
  if (!is.numeric(num) | trunc(num)!=num | num<1 | length(num)!=1){
    stop("num must be a single positive whole number")
  }
  
  answer <- c(1,num)                    # changed this line
  
  divisor <- 2
  while(divisor <= sqrt(num)){          # changed this line (why?)
    if (num %% divisor == 0){
      answer <- c(answer, divisor)
      answer <- c(answer, num/divisor)  # added this line  (why?)
    }
    divisor <- divisor + 1
  }
  
  answer <- sort(unique(answer))        # added this line  (why?)
  return(answer)
}

debugonce(divisors.faster)
divisors.faster(36)

divisors.faster(12)
divisors.faster(10)
divisors.faster(97)
divisors.faster(100)
divisors.faster(15485863)  # much faster now!!!
divisors.faster(15485864)  # much faster now!!!

divisors.faster(67867979)  # much faster now!!!
divisors.faster(67867970)  # much faster now!!!

# check to see that both functions are equivalent

all ( divisors.faster(15485864) == divisors(15485864) )  # TRUE if all nums are the same

###############################################################################
# The next two "QUESTIONS" (i.e. to write the "mysum" and "blastoff" functions)
# do not present any new concepts. They are just additional examples. 
###############################################################################


#----------------------------------------------------------
# QUESTION
# Write a function that simulates the sum function
#
#    mysum = function( nums )
#
# nums is expected to be a numeric vector
# mysum should return the sum of all the numbers in nums
# DO NOT USE THE SUM FUNCTION
#----------------------------------------------------------

mysum = function( nums ){
 
 # SETUP VARIABLES THAT YOU NEED FOR THE LOOP
 index = 1
 sumSoFar = 0
 
 while ( index <= length(nums)  ){    # COME UP WITH AN APPROPRIATE CONDITION
  
  # BODY CODE TO ACCOMPLISH YOUR GOAL
  sumSoFar = sumSoFar + nums[index]
  
  # SOMEWHERE BETWEEN THE {CURLY BRACES} CHANGE SOMETHING SO THE CONDITION EVENTUALLY BECOMES FALSE
  index = index + 1
 }
 
 sumSoFar
}

mysum(c(5,3,10,20))
;
























mysum = function( nums ){

  theSum = nums[1]
  position = 2
  
  while(position <= length(nums)){
    theSum = theSum + nums[position]
    position = position + 1
  }
    
  theSum  # return the answer
}

mysum(c(10,20,5)) # 35

mysum(10) # 10

# Note that the following returns NA, which makes sense because a sum
# is not applicable (i.e. Not Available) if there are no numbers specified.
mysum( numeric(0) ) 

# You should use the debugger to understand why we get NA. 
#
# debugonce(mysum)
mysum( numeric(0) ) 

#-------------------------------------------------------------------
# The following is a SLIGHTLY different version of the function.
# In this version we returned a sum of 0 when the numeric vector
# is an empty vector. This is also a reasonable answer. 
#-------------------------------------------------------------------

mysum = function( nums ){
  
  theSum = 0                             # this line changed
  position = 1                           # this line changed   
  
  while(position <= length(nums)){
    theSum = theSum + nums[position]
    position = position + 1
  }
  
  theSum  # return the answer
}

mysum(c(10,20,5))    # 35

mysum(character(0))  # 0

#---------------------------------------------------------
# QUESTION
#
# Write a function
#
#    countdown = function(from)
#
# that counts down as shown below. There should be 1 second
# pause between each line of output HINT: use Sys.sleep(1)
# 
# > countdown(5)
# T minus 5 seconds
# T minus 4 seconds
# T minus 3 seconds
# T minus 2 seconds
# T minus 1 second
# BLASTOFF!!!
#
# > countdown(3)
# T minus 3 seconds
# T minus 2 seconds
# T minus 1 second
# BLASTOFF!!!
#
# > countdown(0)
# BLASTOFF!!!
#-----------------------------------------------------------

countdown = function(from) {

 # SETUP THE VARIABLES YOU NEED
 
 while( from > 0){    # CONDITION
  
  # BODY OF WHAT YOU WANT TO DO 
  
  if (from == 1) {
   cat("T minus", from, "second\n")
  } else {
   cat("T minus", from, "seconds\n")
  }
  
  Sys.sleep(1)
  
  # MAKE SURE THAT SOMETHING CHANGES SO THE CONDITION EVENTUALLY BECOMES FALSE
  from = from - 1
  
 }
 
 cat("BLASTOFF!!!\n")
}

countdown(5)

countdown(3)






























countdown = function(from){
  
  while(from > 0){
    
    if(from == 1){
      cat("T minus", from, "second\n")
    } else {
      cat("T minus", from, "seconds\n")
    }
    
    Sys.sleep(1)
    from = from - 1
    
  }
  
  cat("BLASTOFF!!!")
  
}

countdown(5)
countdown(3)
countdown(0)




####################################################################
####################################################################
##
## Generating random numbers
##
##   - runif                       : returns a random number
##   - set.seed(SOME_WHOLE_NUMBER) : resets the random number generator
##   - sample
##
####################################################################
####################################################################

# There are several different functions that are built into R for
# generating "random numbers". These are useful for "simulations"
# e.g. to generate random 
?runif
?set.seed
?sample

#--------------------------------------------------------------
#
# runif  
#
# runif stands for "Random number from a UNIForm distribution
#
#--------------------------------------------------------------

runif(1)   # one random number between 0 and 1  (not including 0.0 or 1.0)
runif(1)   # another random number between 0 and 1  (not including 0.0 or 1.0)
runif(3)   # three random numbers between 0 and 1
runif(3, min=0, max=100)   # three random numbers between 0 and 100
runif(3, min=500, max=505)   # three random numbers between 500 and 505
trunc(runif(25, min=1, max=11))   # 25 random whole numbers between 1 and 10
trunc(runif(25, min=1, max=11))   # another 25 random whole numbers between 1 and 10

#-----------------------------
# set.seed(SOME_WHOLE_NUMBER)
#-----------------------------
set.seed(1)
trunc(runif(3, min=1, max=10))   # 5 random whole numbers between 1 and 9
trunc(runif(3, min=1, max=10))   # another 5 random whole numbers between 1 and 9
trunc(runif(3, min=1, max=10))   # another 5 random whole numbers between 1 and 9

set.seed(1)
trunc(runif(3, min=1, max=10))   # start again with same numbers

set.seed(1)
trunc(runif(3, min=1, max=10))   # start again with same numbers
trunc(runif(3, min=1, max=10))   # continue in with the same numbers as when seed was 1
trunc(runif(3, min=1, max=10))   # continue in with the same numbers as when seed was 1

set.seed(99)  # different seed starts again with different numbers
trunc(runif(3, min=1, max=10))   #
trunc(runif(3, min=1, max=10))   #

set.seed(99)  # start again with same seed
trunc(runif(3, min=1, max=10))   #
trunc(runif(3, min=1, max=10))   #

set.seed(1)   # back to first sequence of numbers  
trunc(runif(3, min=1, max=10))   # start again with same numbers
trunc(runif(3, min=1, max=10))   # continue in with the same numbers as when seed was 1

#-----------------------------------------------------------------------------
# sample  
# 
# NOTE: This is review. We already covered the sample function in an earlier class.
#-----------------------------------------------------------------------------
?sample

sample(c(10,20,30,40,50,60,70,80,90,100), 3)  # sample 3 items from the set

sample(c(10,20,30,40,50,60,70,80,90,100), 7)  # sample 7 items from the set

sample(c(10,20,30,40,50,60,70,80,90,100), 10)  # sample 10 items from the set

sample(c(10,20,30,40,50,60,70,80,90,100))  # sample 10 items from the set

# with replacement
sample(c(10,20,30,40,50,60,70,80,90,100), 7, replace=TRUE)  # allow same item more than once
sample(c(10,20,30,40,50,60,70,80,90,100), 25, replace=TRUE)  # allow same item more than once
sample(c(10,20,30,40,50,60,70,80,90,100), 25, replace=FALSE)  # ERROR
sample(c(10,20,30,40,50,60,70,80,90,100), 25)  # ERROR

sample(1:10)               # sample all items without replacement
sample(1:10, replace=TRUE) # sample 10 times with replacement

# set probabilities on specific values
sample(c(1,2,3), 25, replace=TRUE, prob=c(.7,.2,.1)) # 70% prob 1, 20% prob 2, 10% prob 3
sample(c(1,2,3), 25, replace=TRUE, prob=c(.7,.2,.1)) # 70% prob 1, 20% prob 2, 10% prob 3

# set.seed works for sample too
set.seed(9876)
sample(c(1,2,3), 25, replace=TRUE, prob=c(.7,.2,.1)) # 70% prob 1, 20% prob 2, 10% prob 3
sample(c(1,2,3), 25, replace=TRUE, prob=c(.7,.2,.1)) # 70% prob 1, 20% prob 2, 10% prob 3

set.seed(9876)
sample(c(1,2,3), 25, replace=TRUE, prob=c(.7,.2,.1)) # 70% prob 1, 20% prob 2, 10% prob 3
sample(c(1,2,3), 25, replace=TRUE, prob=c(.7,.2,.1)) # 70% prob 1, 20% prob 2, 10% prob 3


#-------------------------------------------------------------------------
# Write a guessing game function
#-------------------------------------------------------------------------
# Function should
# 1. pick a random number between 1 and 100
# 2. allow the user to guess the number
# 3. keep looping until the user guesses correctly
# 4. return the number of times it took the user to guess correctly
#-------------------------------------------------------------------------
# NOTE: The following line of code that appears in the function is important
#       but easy to forget to include. This line of code converts the guess
#       from character to numeric. Without this line you would wind up with a
#       very hard to catch bug.
#
#                    guess <- as.numeric(guess) 
#
# Remember that readline always returns a character value.
# Without the code shown above, guess would be character and num would be numeric.
# This would have caused the following problem:
#
#    1. The code "if(guess < num)", which appears in the code below will
#       be comparing a character value with a numeric value.
#
#    2. Remember that character values sort and compare differently than
#       numeric values. For the purpose of this dicussions, remember
#       that "29" and "3" are both character values, while
#       29 and 3 (without the quotes) are numeric values.
#
#         29 < 3 is obviously FALSE, however ..
#
#         "29" < "3" is TRUE!!!
#
#       This is because character values have different rules for 
#       comparison than numeric values do. (Remember - because the first
#       character, in "29" i.e. the "2" is less than the first charcter
#       in "3", i.e. "3", "29" is less than "3".
#
#    3. Because the code "guess < num" compares a character value (i.e. guess)
#       and a numeric value (i.e. guess) the rules of "implicit conversions"
#       determines that both values will be implicitly converted
#       to character values. That means that if guess was "29" and num was 3
#       "29" < 3  would be implicitly converted to "29" < "3" which would
#       be TRUE! That would cause the block of code following
#       if(guess < num) be executed and the user would be told
#       "higher, guess again:" instead of the correct answer of
#       "lower, guess again".
#
#    4. By converting the guess to numeric, the code if(guess < num) will 
#       now correctly compare two numeric values and will correctly 
#       figure out that 29 < 3 is FALSE and will correctly tell the user
#       "lower, guess again".
#-------------------------------------------------------------------------

guessingGame <- function(low=1, high=100){
  
  if (!is.numeric(low) | length(low) != 1 | trunc(low) != low |
      !is.numeric(high) | length(high) != 1 | trunc(high) != high ) {
    stop("min and max must each be single whole numbers")
  }
  
  if (low >= high){
    stop("low must be less than high")
  }
  
  num <- sample(low:high, 1)
  
  numGuesses <- 1
  guess <- readline("guess: ")
  guess <- as.numeric(guess) # IMPORTANT LINE - see the NOTE in comments above
  
  while(guess != num) {
    if (guess < num){
      guess <- readline("higher, guess again: ")
    } else if (guess > num) {
      guess <- readline("lower, guess again: ")
    }
    
    guess <- as.numeric(guess) # IMPORTANT LINE - see comment above for more info
    numGuesses <- numGuesses + 1
  } 

  return(numGuesses)  
}

guessingGame()   
guessingGame()
guessingGame()

#-------------------------------------
# Another example - Fibonacci sequence
#-------------------------------------

# The numbers 0 1 1 2 3 5 8 13 21 34 55 89 144 ...
# are the first few number in the infinite sequence
# of "Fibonacci numbers". The first two numbers are 0 and 1
# Every other number in the sequence is the sum of the
# two numbers that precede it. 
#
# Write a function fib(n)  that returns the first
# n numbers from the fibonacci sequence. 
#
# n is expected to be a single non-negative whole number.
# The function should stop with an appropriate 
# error message if it is not.
#
# EXAMPLE:
#    > fib(1)
#    0
#
#    > fib(4)
#    0 1 1 2
#
#    > fib(8)
#    0 1 1 2 3 5 8 13

fib <- function(n){
  
  if (!is.numeric(n) | length(n) != 1 | n <= 0){
    stop("n must be a single whole non-negative number")
  }
  
  if (n == 1){
    return(0)
  } else if (n == 2) {
    return(c(0,1))
  }
  
  # set up the variables for the condition in the while
  # (n already has a value since it is an argument to the function)
  answer <- c(0,1)    
  
  while(length(answer) < n){   # a condition that will eventually become FALSE
    
    twoPrevious <- answer[length(answer)-1]
    onePrevious <- answer[length(answer)]
    
    # change a variable that's in the condition
    answer<-c(answer,onePrevious+twoPrevious) 
    
  }
  
  return(answer)
}

fib(0)
fib(1)
fib(4)
fib(8)
fib(20)

lapply(1:10, fib)






rm(list=ls())  # start over ...

# The following code was already created above. This is the exact same 
# code. It is copied here for reference, since the next function,
# primesUpTo, calls this code.

is.prime <- function( num ) {
  if (num < 2){
    return(FALSE)
  }
  divisor <- 2
  
  while ( divisor <= sqrt(num) ) {
    if (num %% divisor == 0){
      return(FALSE)   
    }
    divisor <- divisor + 1
  }
  return(TRUE)
}

#-----------------------------------------
# Get all primes up to a certain number
#-----------------------------------------

# Things to think about in the next function.
# 
# 1. What would happen if the line: numToCheck = numToCheck + 1
#    were placed inside of the block of code for the if?

# All primes up to n
primesUpTo = function( maxNum ){
  primes = numeric(0)
  
  # Set up the variables that are used in the condition 
  # maxNum already has a value since it is an argument to the function
  numToCheck = 2
  
  while (numToCheck <= maxNum){  # a condition that will eventually become FALSE
    
    if(is.prime(numToCheck)){
      primes = c(primes, numToCheck)
    }
    
    # change a variable that is in the condition in a way that will eventually
    # make the condition become FALSE
    numToCheck = numToCheck + 1
  }
  
  primes
}

debugonce(primesUpTo)
primesUpTo(10)
primesUpTo(100)
primesUpTo(1000)


#---------------------------------
# Get first n primes
#---------------------------------
# Things to think about in the following function.
# 
# 1. What would happen if the line: numberToCheck = numberToCheck + 1
#    was not typed at all?

firstNPrimes = function( numPrimes ){
  
  # This is the variable that will be returned.
  # It is also a variable that is used in the condition.
  # We MUST give it a value for both of these reasons.
  primes = numeric(0)
  
  # Setup any other values that the while loop will need.
  numberToCheck = 2
  
  while(length(primes)<numPrimes){ # condition that will evenutually become FALSE
    
    if (is.prime(numberToCheck)){
      primes = c(primes, numberToCheck)
    }
    
    # change a variable that is used the the condition in a way that 
    # eventually the condition will become FALSE
    numberToCheck = numberToCheck + 1
  }

  primes
}

firstNPrimes(100)
firstNPrimes(1000)
firstNPrimes(2000)

primes3000 = firstNPrimes(3000)
length(primes3000)   # 3000
tail(primes3000, 10)

#---------------------------------------------------------------------
# How many flights are needed before you get back to the city you 
# started?
#---------------------------------------------------------------------

# Given the following data:

# The vector cities has names and values that are the same set of cities
# just arranged in a different order. Interpret the names of the vector 
# positions as the cities where an airline has flights. The management of 
# the company schedules the flights based on the data in the vector.
# (see below for more info)

cities = c("new york", "london", "tokyo", "l.a.", "tel aviv", "brussels", "moscow")
names(cities) = sort(cities)
cities

# The airline has a complex scheduling system for each of their planes.
# Each plane flies from city to city to city based on the data shown above.
# Eventually a plane will return to its original city.
#
# For example, a plane that 
#    starts in Brussels will fly to New York
#    From New york, that same plane will fly to Tel Aviv.
#    From Tel Aviv, that same plane will fly back to Brussels
# for a total of 3 flights before it returns to where it started.
#
# Similarly, a plane that 
#    starts in L.A. office will fly to London.
#    From London, that same plane will fly to Tokyo.
#    From Tokyo, that same plane will fly to Moscow.
#    From Moscow that same plane will fly back to L.A.
# for a total of 4 flights before it returns to where it started.
#
# Write a function
#      flightsBeforeReturning = function(staringCity, schedulingVector)
#
# that figures out how many flights it will take for a plane that 
# starts in startingCity will have to fly before it returns to the same
# startingCity based on the data in the schedulingVector.

flightsBeforeReturning = function(startingCity, schedulingVector){
  
  currentCity = startingCity
  numberOfFlights = 0
  
  while( schedulingVector[ currentCity ] != startingCity ){
    currentCity = schedulingVector[ currentCity ]
    numberOfFlights = numberOfFlights + 1
  }
  
  if (schedulingVector[startingCity] != startingCity)
    numberOfFlights = numberOfFlights + 1
  
  numberOfFlights
}

cities
flightsBeforeReturning("brussels", cities)  # 3
flightsBeforeReturning("l.a.", cities)      # 4
flightsBeforeReturning("london", cities)    # 4
flightsBeforeReturning("moscow", cities)    # 4
flightsBeforeReturning("new york", cities)  # 3
flightsBeforeReturning("tel aviv", cities)  # 3
flightsBeforeReturning("tokyo", cities)     # 4


# Similar function to above, but this time return the actual sequence of
# cities that are visited
itinerary = function(startingCity, schedulingVector){
  
  currentCity = startingCity
  visitedCities = startingCity
  
  while( schedulingVector[ currentCity ] != startingCity ){
    
    visitedCities = c(visitedCities, schedulingVector[currentCity])

    currentCity = schedulingVector[ currentCity ]
  }

  # Add the last leg of the itinerary but only if we flew SOMEWHERE first
  if (schedulingVector[startingCity] != startingCity){
    visitedCities = c(visitedCities, startingCity)
  }
  
  names(visitedCities) = NULL   # remove the names
  
  visitedCities
}

cities

itinerary("brussels", cities)  # "brussels" "new york" "tel aviv" "brussels"

itinerary("l.a.", cities)      # "l.a."   "london" "tokyo"  "moscow" "l.a."  

itinerary("london", cities)    # "london" "tokyo"  "moscow" "l.a."   "london"

itinerary("moscow", cities)    # "moscow" "l.a."   "london" "tokyo"  "moscow"

itinerary("new york", cities)  # "new york" "tel aviv" "brussels" "new york"

itinerary("tel aviv", cities)  # "tel aviv" "brussels" "new york" "tel aviv"

itinerary("tokyo", cities)     # "tokyo"  "moscow" "l.a."   "london" "tokyo" 

#####################################################################
#####################################################################
##
## NESTED LOOPS 
##
## A "nested loop" is a loop inside of another loop (similar
## to "nested ifs")
##
## We often refer to the "outer loop" and the "inner loop".
##
#####################################################################
#####################################################################

rm(list=ls())   # start over

example = function( maxOuter, maxInner){
  outer = 1
  while(outer <= maxOuter){
    cat("OUTER LOOP (before inner loop): outer=", outer, "\n\n")
    
    inner = 1
    while(inner <= maxInner){
      cat("   INNER LOOP: outer=",outer,"inner=",inner,"\n")
      inner = inner + 1
    }
    
    cat("\nOUTER LOOP (after inner loop): outer=", outer,"\n\n")
    outer = outer + 1
    
  }
}

debugonce(example)
example(2,3)
example(3,4)





###############################################################################
# 
# More practical examples of nested loops 
#
###############################################################################

#-----------------------------------------------------------------------------
# The 2nd function below is the original version of the function, primesUpTo,
# that we wrote which did NOT use nested loops. That version of the
# primesUpTo function calls the is.prime function. We therefore copied the code
# for is.prime below so that you can see both functions in one place.
# Again, we saw both of these functions above. They are being copied here
# just for comparison to the next version of primesUpTo which will 
# use nested loops and will NOT call is.prime.
#-----------------------------------------------------------------------------

rm(list=ls())  # start over ...

is.prime <- function( num ) {
 if (num < 2){
  return(FALSE)
 }
 divisor <- 2
 
 while ( divisor <= sqrt(num) ) {
  if (num %% divisor == 0){
   return(FALSE)   
  }
  divisor <- divisor + 1
 }
 return(TRUE)
}

primesUpTo = function( maxNum ){
 primes = numeric(0)
 numToCheck = 2
 
 while (numToCheck <= maxNum){
  if(is.prime(numToCheck)){
   primes = c(primes, numToCheck)
  }
  
  numToCheck = numToCheck + 1
 }
 primes
}

primesUpTo(10)
primesUpTo(100)
primesUpTo(1000)

#-----------------------------------------------------------------------------
# The function, primesUpTo_nestedLoops, returns the exact same values 
# as the primesUpTo function above. However, this version of the function
# does NOT call is.prime. Rather, this version calculates whether a number
# is prime directly in the same function by using a nested loop.
#-----------------------------------------------------------------------------

rm(list=ls())

# VERSION WITH "nested loops"
primesUpTo_nestedLoops = function( maxNum ){
 primes = numeric(0)
 numToCheck = 2
 
 while (numToCheck <= maxNum){
  
  # Use an inner loop to figure out if numToCheck is in fact prime
  # and if it is add numToCheck to the vector primes
  isPrime = TRUE
  divisor = 2
  while(divisor < numToCheck){
   if( numToCheck %% divisor == 0){
    isPrime = FALSE
   }
   
   divisor = divisor+1
  }
  
  # Add the numToCheck to the primes if it in fact is prime
  if(isPrime) {
   primes = c(primes, numToCheck)
  }    
  
  numToCheck = numToCheck + 1
 }
 
 primes
}

primesUpTo_nestedLoops(10)
primesUpTo_nestedLoops(100)
primesUpTo_nestedLoops(1000)



#-----------------------------------------------------------------------
# QUESTION:
# Rewrite the function firstNPrimes that we wrote above. The new version
# should use nested loops instead of calling the is.prime function.
#-----------------------------------------------------------------------

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# For your reference, below are the original versions of the is.prime function
# and the firstNPimes function that calls the is.prime function and does NOT
# use nested loops.
#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

rm(list=ls())    # start over

is.prime <- function( num ) {
 if (num < 2){
  return(FALSE)
 }
 divisor <- 2
 while ( divisor <= sqrt(num) ) {
  if (num %% divisor == 0){
   return(FALSE)   
  }
  divisor <- divisor + 1
 }
 return(TRUE)
}

firstNPrimes = function( numPrimes ){
 primes = numeric(0)
 numberToCheck = 2
 while ( length(primes) < numPrimes  ){
  if (is.prime(numberToCheck)){
   primes = c(primes, numberToCheck)
  }
  numberToCheck = numberToCheck + 1
 }
 primes
}

firstNPrimes(100)
firstNPrimes(1000)
firstNPrimes(2000)

rm(list=ls())

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# VERSION WITH "nested loops" - please fill in the rest
#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

firstNPrimes = function( numPrimes ){
 # TODO - fill this in
}

firstNPrimes(100)
firstNPrimes(1000)
firstNPrimes(2000)


#---------------------------------------------------------------------------
# The t function takes a matrix and returns a copy of the matrix with the
# rows and columns swapped, i.e. mat[i,j] becomes returnValue[j,i].
# See the example below.
#---------------------------------------------------------------------------
mat = matrix(seq(10,120,10), nrow=3, ncol=4)
mat     # 3 rows, 4 columns
t(mat)  # 4 rows, 3 columns (the rows became cols and the cols became rows)


#---------------------------------------------------------------------------
# QUESTION
#
# Write the function myt that does the same thing as the t function.
# Do NOT call the t function in your code.
# HINT - use a nested loop
#---------------------------------------------------------------------------


myt=function( m ){
 returnValue = matrix(1 ,nrow=ncol(m) ,ncol=nrow(m))
 
 row = 1
 while(row <= nrow(m)) {
  
  col = 1
  while(col <= ncol(m)) {
   
   returnValue[ col , row ]   =   m[ row ,  col ]     
   col = col + 1
  }
  
  row = row + 1
 }
 returnValue
}

mat = matrix(seq(10,120,10), nrow=3, ncol=4)
mat
myt(mat)



#---------------------------------------------------------------------------
# QUESTION
#
# Rewrite the function myt to use a single loop (not a nested loop).
#
# HINTS
#
# - Use a single loop. 
#
#   The loop should keep updating a variable, eg. inRow, that contains
#   the number of a row from the input matrix. For example 
#
#     If the input matrix has 3 rows then the loop should go around 3 times. 
#     The 1st time through the loop, the variable inRowNumber, should contain 1,
#     The 2nd time through the loop, the variable inRowNumber, should contain 2,
#     The 3rd time through the loop, the variable inRowNumber, should contain 3
#
# - Inside the loop use matrix notation to assign the values from
#   a row in the input matrix to the corresponding column
#   in the output matrix
#
#---------------------------------------------------------------------------


myt=function( m ){
 returnValue = matrix(1 ,nrow=ncol(m) ,ncol=nrow(m))
 
 inRow = 1
 while(inRow <= nrow(m)) {
  
  returnValue[ , inRow] = m[inRow , ]
  inRow = inRow + 1
  
 }
 returnValue
}

mat = matrix(seq(10,120,10), nrow=3, ncol=4)
mat
myt(mat)



# QUESTION
#
# Write a function that retrieves a matrix with just the upper
# triangular values in a matrix.

# You can use htis matrix for your work to practice.
m1 = matrix(seq(10,160,10), nrow = 4, ncol=4)

#####################################################################.
# SOME "TOY" FUNCTIONS
#
# Below are a few "toy" examples of using nested loops. Exercises
# like these help you to become more familiar with the concepts 
# of nested loops. This is similar to playing "scales" when learning 
# to play the piano - no one will play scales in real life - but
# it is important to get the hang of things when you're first
# starting out.
#####################################################################.


#---------------------------------------------------------------------
# The following are some simple functions that do NOT use nested loops.
# These are provided for comparison with the equivalent versions that use
# nested loops which we will show you below.
#---------------------------------------------------------------------

rm(list=ls())   # start over

# draw a line of x's of the specified width
# Do not use the rep function. Use the cat function and a loop.
drawLine_WithXs = function( width ) {
  
  while(width > 0){
    cat("x")
    width = width - 1
  }
}

drawLine_WithXs(4)  # xxxx
drawLine_WithXs(5)  # xxxxx


# draw a box of x's
drawBox_WithXs = function(h, w){
  while(h > 0){
    drawLine(w)
    cat("\n")
    h = h - 1
  }
}

drawBox_WithXs(3,4)  # box of 3 rows and 4 columns of x's
  

# Draw a horizontal line with calls to cat that displays the numbers as shown below
drawLine_WithNums = function(width){
  num1 = 1
  while(num1 <= width){
    cat(num1)
    num1 = num1 + 1
  }  
}

drawLine_WithNums(4)  # 1234
drawLine_WithNums(5)  # 12345



#-----------------------------------------------------------------------
# drawBox using nested loops
#-----------------------------------------------------------------------

# QUESTION:
# Write a function 
#   drawBox1 = function(height, width)
#
# height and width are expected to be whole numbers between 1 and 9.
# The function should draw a box that has dimensions height rows and width columns.
# The box should be drawn with numbers such that each number represent the 
# number of the column it is in. For example:
#
#       > drawBox1(3, 5)
#       12345
#       12345
#       12345

drawBox1 = function(height, width){

  rowNumber = 1
  while(rowNumber <= height){
    
      colNumber = 1
      while(colNumber <= width){
        cat(colNumber)
        colNumber = colNumber + 1
      }  
      
      cat("\n")

      rowNumber = rowNumber + 1      
  }
  
}

#debugonce(drawBox1)
drawBox1(3, 4)
# 1234
# 1234
# 1234

drawBox1(4,9)
#-----------------------------------------------------------------------------


# QUESTION:
# Write a function 
#   drawBox2 = function(height, width)
#
# height and width are expected to be whole numbers between 1 and 9.
# The function should draw a box that has dimensions height rows and width columns.
# The box should be drawn with numbers such that each number represent the 
# number of the row it is in. For example:
#
#       > drawBox1(3, 5)
#       11111
#       22222
#       33333

drawBox2 = function(height, width){
  
  rowNumber = 1
  while(rowNumber <= height){
    
    colNumber = 1
    while(colNumber <= width){
      cat(rowNumber)
      colNumber = colNumber + 1
    }  
    
    cat("\n")
    
    rowNumber = rowNumber + 1      
  }
  
}

drawBox2(3,4)
# 1111
# 2222
# 3333

#-----------------------------------------------------------------------------
# Write the function drawBox3 to produce the results according to the pattern
# demonstrated in the following example:
#
# EXAMPLE: 
#   > drawBox3(3,4)
#   3333
#   2222
#   1111
#-----------------------------------------------------------------------------


drawBox3 = function(height, width){
  
  rowNumber = height
  while(rowNumber > 0){
    
    colNumber = 1
    while(colNumber <= width){
      cat(rowNumber)
      colNumber = colNumber + 1
    }  
    
    cat("\n")
    
    rowNumber = rowNumber - 1      
  }
  
}

drawBox3(3,4)
# 3333
# 2222
# 1111



#-----------------------------------------------------------------------------
# Write the function drawBox4 to produce the results according to the pattern
# demonstrated in the following example:
#
# EXAMPLE: 
#   > drawBox3(3,4)
#   1234
#   1234
#   1234
#-----------------------------------------------------------------------------

drawBox4 = function(height, width){
  rowNumber = 1
  while (rowNumber <= height){
    
    colNumber = 1
    while(colNumber <= width) {
      cat( colNumber )
      colNumber = colNumber + 1
    }

    cat("\n")    
    rowNumber = rowNumber+1

  }
}

drawBox4(3,4)
# 1234
# 1234
# 1234





#-----------------------------------------------------------------------------
# Write the function drawBox4 to produce the results according to the pattern
# demonstrated in the following example:
#
# EXAMPLE: 
#   > drawBox5(3,4)
#   4321
#   4321
#   4321
#-----------------------------------------------------------------------------
drawBox5 = function(height, width){
 
  row = 1
  while(row <= height){
    
    col = width
    while( col >= 1){
      cat(col)
      
      col = col - 1      
    }
    
    cat("\n")
    row = row + 1 
  }
}


drawBox5(3,4)
# 4321
# 4321
# 4321


#-----------------------------------------------------------------------------
# Write the function drawTriangle1 to produce the results according to the pattern
# demonstrated in the following example:
#
# EXAMPLE: 
#    > drawTriangle1(3)
#    1
#    12
#    123
#
#    > drawTriangle(5)
#    1
#    12
#    123
#    1234
#    12345
#-----------------------------------------------------------------------------

drawTriangle1 = function(size){

  row = 1
  while(row <= size){
    
    col = 1
    while(col <= row){
      cat(col)
      col = col + 1      
    }
    cat("\n")
    row = row + 1    
  }
  
}

drawTriangle1(3)
drawTriangle1(9)

# 1
# 12
# 123

#-----------------------------------------------------------------------------
# Write the function drawTriangle1 to produce the results according to the pattern
# demonstrated in the following example:
#
# EXAMPLE: 
#    > drawTriangle2(3)
#    111
#    22
#    3
#-----------------------------------------------------------------------------

drawTriangle2 = function(size){

  outer = 1
  while( outer <= size ){
    
    inner = 1
    while( inner <= size - outer + 1){
      
      cat ( outer )
      
      inner = inner + 1
    }
    
    cat("\n")
    outer = outer + 1
  }
  
  
}

drawTriangle2(3)

# 111
# 22
# 3

drawTriangle2(5)

