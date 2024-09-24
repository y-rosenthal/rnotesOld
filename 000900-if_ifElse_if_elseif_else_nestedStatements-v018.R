rm(list=ls())


##############################################################################
#
# sample( SOME_VECTOR , SOME_NUMBER ) 
#
#    randomly select the specified number of values from the vector
##############################################################################

sample(c(10,20,30,40,50,60,70,80,90,100), 5)   # randomly select 5 values
sample(c(10,20,30,40,50,60,70,80,90,100), 5)   # randomly select 5 values
sample(c(10,20,30,40,50,60,70,80,90,100), 5)   # randomly select 5 values

sample(c("pizza", "burgers", "chicken", "soup"), 1)  # randomly select a meal
sample(c("pizza", "burgers", "chicken", "soup"), 1)  # randomly select a meal
sample(c("pizza", "burgers", "chicken", "soup"), 1)  # randomly select a meal
sample(c("pizza", "burgers", "chicken", "soup"), 1)  # randomly select a meal
sample(c("pizza", "burgers", "chicken", "soup"), 1)  # randomly select a meal

# replace = true
#
# If you specify replace=TRUE then the same value could be picked more than once
# in the same sample

sample(c(10,20,30,40,50,60,70,80,90,100), 5, replace=TRUE)   # randomly select 5 values
sample(c(10,20,30,40,50,60,70,80,90,100), 5, replace=TRUE)   # randomly select 5 values
sample(c(10,20,30,40,50,60,70,80,90,100), 5, replace=TRUE)   # randomly select 5 values
sample(c(10,20,30,40,50,60,70,80,90,100), 5, replace=TRUE)   # randomly select 5 values
sample(c(10,20,30,40,50,60,70,80,90,100), 5, replace=TRUE)   # randomly select 5 values

#--------------------------------------------
# BE CAREFUL: 
#
#     sample(100, SOME_NUMBER) 
#        randomly selects values from 1:100
#--------------------------------------------

# If there is a single positive number as the first argument sample 
# actually chooses from the sequence starting at 1

sample(100, 1)   # a single random number from 1:100
sample(100, 1)   # a single random number from 1:100
sample(100, 1)   # a single random number from 1:100

sample(100, 3)   # 3 random number from 1:100


# This does the obvious thing ...
sample("burgers", 1)    # burgers (of course - there is only one choice)
sample("burgers", 1)    # burgers (of course - there is only one choice)
sample("burgers", 1)    # burgers (of course - there is only one choice)

# If you sample without specifying a size R will return all of the values
# in a random order

sample(c(10,20,30,40,50,60,70,80,90,100))

# same as 
sample(c(10,20,30,40,50,60,70,80,90,100), 10)


#------------------------------------------------------------------------------
# set.seed( SOME_NUMBER )
#
# Each different number you specify as the "seed" will cause a different
# sequence of random choices to be chosen.
#------------------------------------------------------------------------------

# set the seed to a specific number (ie. 1) and then choose some random values.
set.seed(1)
sample(c(10,20,30,40,50,60,70,80,90,100), 2, replace=TRUE)   # randomly select 2 values
sample(c(10,20,30,40,50,60,70,80,90,100), 2, replace=TRUE)   # randomly select 2 values
sample(c(10,20,30,40,50,60,70,80,90,100), 2, replace=TRUE)   # randomly select 2 values



# set the seed to a different specific number (ie. 2) to get different random values
set.seed(2)
sample(c(10,20,30,40,50,60,70,80,90,100), 2, replace=TRUE)   # randomly select 2 values
sample(c(10,20,30,40,50,60,70,80,90,100), 2, replace=TRUE)   # randomly select 2 values
sample(c(10,20,30,40,50,60,70,80,90,100), 2, replace=TRUE)   # randomly select 2 values


# If we set the seed back to 1 again, we will get the same random values
# that we got the first time we set the seed to 1.
set.seed(1)
sample(c(10,20,30,40,50,60,70,80,90,100), 2, replace=TRUE)   # randomly select 5 values
sample(c(10,20,30,40,50,60,70,80,90,100), 2, replace=TRUE)   # randomly select 5 values
sample(c(10,20,30,40,50,60,70,80,90,100), 2, replace=TRUE)   # randomly select 5 values

# another example

set.seed(1567)   # the seed can be any number
sample(1:100, 1)
sample(1:100, 1)
sample(1:100, 1)
sample(1:100, 1)

set.seed(1567)   # set the seed again to the same number to get the same results
sample(1:100, 1)
sample(1:100, 1)
sample(1:100, 1)
sample(1:100, 1)

###############################################################################
# result = readline( A_PROMPT )
#
# The readline function displays a prompt to the user. Then it takes whatever
# info the user types and returns it as a character value.
###############################################################################

x = readline("Please enter a number: ")
x   # This is a character value of whatever was entered by the user

# to use it as a number you must convert it using as.numeric
as.numeric(x) * 2   

pickRandomNumbers = function(){
 howMany = readline("How many random numbers should we pick? ")
 howMany = as.numeric(howMany)

 largest = readline("What should be the largest possible number? ")
 largest = as.numeric(largest)
 
 sample(largest, howMany)
}

randomNumbers = pickRandomNumbers()
randomNumbers

randomNumbers = pickRandomNumbers()
randomNumbers
#######################################################
#
# all(SOME_LOGICAL_VECTOR)
#
#    returns TRUE if ALL of the logical values are TRUE
#    returns FALSE otherwise
#
#
# any(SOME_LOGICAL_VECTOR)
#
#    returns TRUE if ANY of the logical values are TRUE
#    returns FALSE otherwise
#######################################################

all(c(TRUE,TRUE,TRUE,TRUE))  # TRUE
all(c(TRUE,TRUE,FALSE,TRUE))  # FALSE

any(c(FALSE,TRUE,FALSE,FALSE,FALSE))  # TRUE
any(c(FALSE,FALSE,FALSE,FALSE,FALSE))  # FALSE

x = c(10, 5,  300)
y = c(5,  20, 145)
all(x>y) # FALSE

x = c(10, 5000,  300)
y = c(5,  20,    145)
all(x>y) # TRUE

x = c(1,  2,  3)
y = c(100,200,300)
any(x > y) # FALSE

x = c(1,  999,  3)
y = c(100,200,300)
any(x > y) # TRUE

############################################################################
# stop("SOME ERROR MESSAGE")
#
# The stop function stops the execution of a function and displays
# an error message. 
############################################################################

addSquareRoots = function(num1, num2){
  return (sqrt(num1) + sqrt(num2) )
}

addSquareRoots(49, 4)

addSquareRoots(-49,-2)
# when you run the following code you will NOT see the sum of the 
# square roots because the call to stop, ends the execution of the function before 
# it finishes. It also displays an "error message" in red on the screen.
#
# Yes, I know that this makes the function useless ... see below ...
addSquareRoots = function(num1, num2){
  stop("I don't like you so I'm stopping this function :)")
  sqrt(num1) + sqrt(num2)
}

addSquareRoots(49, 4)


# You obviously do NOT want stop to run every time you call the function.
# You only want to stop the function with an error under certain conditions.
# For example, you cannot take the square root of a negative number.
# Therefore if num1 or num2 are negative numbers it makes snense to stop
# with an error message. Otherwise, it does not.
#
# R's if statement allows you to run a {block} of code only if a specific
# condition is TRUE. 
#
# In the code below the stop will only happen if either num1 is less
# than zero or num2 is less than zero

addSquareRoots = function(num1, num2){
  if ( any ( num1 < 0 , num2 < 0) )  {
    stop("you specified a negative number. num1 and num2 may not be negative")
  }
  
  sqrt(num1) + sqrt(num2)
}

addSquareRoots = function(num1, num2){
  if ( num1 < 0  |  num2 < 0  )  {
    stop("you specified a negative number. num1 and num2 may not be negative")
  }
  
  sqrt(num1) + sqrt(num2)
}

addSquareRoots(-49, 4)   # stop with an ERROR 
addSquareRoots(49, -4)   # stop with an ERROR
addSquareRoots(49, 4)    # This time it works

addSquareRoots("apple","orange")


# Modify addSquareRoots to also check for non-numeric arguments
addSquareRoots = function(num1, num2){
 
 # check for non-numeric arguments
 if ( is.numeric(num1) == FALSE | is.numeric(num2) == FALSE){
  stop("You specified a non numeric value. num1 and num2 must be numeric values.")
 }
 
 # check for negative numbers
 if ( num1 < 0  |  num2 < 0  )  {
  stop("you specified a negative number. num1 and num2 may not be negative")
 }
 
 sqrt(num1) + sqrt(num2)
}


debugonce(addSquareRoots)
addSquareRoots(49,"orange")

debugonce(addSquareRoots)
addSquareRoots(-49,-4)

debugonce(addSquareRoots)
addSquareRoots(49, 4)

addSquareRoots(-2,"orange")

addSquareRoots("apple",4)

debugonce(addSquareRoots)
addSquareRoots(-49,-4)


#---------------------------------------------------------
# When a function is stopped no value is returned
#---------------------------------------------------------

answer = addSquareRoots(49, -4)   # stop with an ERROR
answer   # ERROR - answer has no value

answer = addSquareRoots(49, 4)    # This time it works
answer   # 9

answer = addSquareRoots(-1 , -1)   # stop with an ERROR
answer   # 9 - it never changed since the previous line ended with an error



# In general, I recommend (and require for homeworks) that you check all
# of the arguments being passed into your functions to make sure that the
# values make sense for what the function is supposed to do. 
# For example, if an argument is supposed to be numeric, you should stop
# the function with an error if it is not numeric. (see more examples below)

#############################################################################
# 2021 - BEREN - UP TO HERE - AFTER CLASS 22
#
# We skipped the section above on the "all" and "any" functions.
# We will probably go back to that next class.
# 
# We also skipped the subsection above entitled
# "When a function is stopped no value is returned"
# I'll try to remember to mention that next class.
#############################################################################

#################################################
#################################################
##
## Various forms of if statement
##
#################################################
#################################################

#-----------------------------------------------------------------
# if by itself - (no else, no else if)
#-----------------------------------------------------------------
rm(list=ls())   # start from scratch

commentsAboutNumber = function( num ){
  if (num > 1000) {
    cat("Wow! that's a big number.\n")
    cat ("I LOVE big nubmers.\n")
    cat("Big numbers are BEAUTIFUL.\n")
  }
  
  cat("Thanks for your number :)\n")
}


commentsAboutNumber(10)
commentsAboutNumber(99999)


# MAKE SURE YOU DON'T FORGET THE {curly braces}
commentsAboutNumber = function( num ){

  # THIS IS WRONG!!!!  
  # THIS WILL NOT DO WHAT YOU THINK!!!
  if (num > 1000) 
    cat("Wow! that's a big number.\n")
    cat ("I LOVE big nubmers.\n")
    cat("Big numbers are BEAUTIFUL.\n")
  
  
  cat("Thanks for your number :)\n")
}

commentsAboutNumber(10)
commentsAboutNumber(99999)


#-----------------------------------------------------------------
# The curly braces are not "actually" required if there is only 
# one command - but I recommend you use them anyway, until you 
# get more comfortable with the language.
#-----------------------------------------------------------------
commentsAboutNumber = function( num ){
  
  if (num > 1000) 
    cat("Wow! that's a big number.\n")
  
  cat("Thanks for your number :)\n")
}

commentsAboutNumber(10)
commentsAboutNumber(99999)


#..................................................................
# Function should return the price of a salad based on the size
#
#    small  (4 choices) : 9
#    medium (5 choices) : 12
#    large  (6 choices) : 14
#    xlarge (7 choices) : 15
#    any other size - stop with a meaningful error
#..................................................................

priceOfSalad = function(size) {
  
  # check at the beginning for one of the correct sizes
  if ( ! size %in% c("small", "medium", "large", "xlarge")) {
    stop("size must be one of : small , medium, large, xlarge")
  }
  
  if (size == "small") {
    price = 9
  }
  
  if (size == "medium"){
    price = 12
  } 
  
  if (size == "large") {
    price = 14
  } 
  
  if (size == "xlarge") {                          # an else DOES NOT HAVE a condition
    price = 15
  }
  
  price   # return the total price   
}

priceOfSalad("medium")
priceOfSalad("small")
priceOfSalad("gargantuan")   # ERROR none of the prices were assigned

# use the debugger to see how R steps through the code

debugonce(priceOfSalad)
priceOfSalad("medium")

debugonce(priceOfSalad)
priceOfSalad("small")

debugonce(priceOfSalad)
priceOfSalad("gargantuan")

debugonce(priceOfSalad)
priceOfSalad("large")

#.............................................................
# Be careful with parentheses and {curly braces} !
#
# If you position the cursor right after
# a (parentheses) or {curly brace} or [square-brackets], the matching
# open/close (parentheses) or {curly brace} or [square-brackets] will
# be highlighted in grey. It's hard to see at first but look for it.
# It should happen.
#
# Try editing the above function by adding and/or removing
# one or more (parentheses) or {curly braces} and then find the
# new matching open/close. This should give you practice trying to 
# find a missing or extra open or close (parentheses) or {curly brace}
# when you need to.
#.............................................................


#--------------------------------------------------------------------
# Make sure to define your variables.
# It's possible that NO if will run!
#--------------------------------------------------------------------

# If we don't stop we get a meaningless error for the function
# Always stop with a meaningful error.

priceOfSalad = function(size) {

  # I removed the check for a valid size
  
  if (size == "small") {
    price = 9
  }
  
  if (size == "medium") {
    price = 12
  } 
  
  if (size == "large") {
    price = 14
  } 
  
  if (size == "xlarge") {
    price = 15
  }
  
  price   # return the total price   
}

priceOfSalad("medium")
priceOfSalad("small")
priceOfSalad("gargantuan")   # ERROR object price not found 





#...............................................................
#
# INTRODUCING "else if" AND "else" 
#
#   if (condition1)     { ... }
#   else if(condition2) { ... }
#   else if(condition3) { ... }
#   etc ...                       # as many "else if" sections as you like
#   else { ... }                  # no condition on an "else" section!!!
#
# The code in the block for the first condition that is TRUE will run.
# NO OTHER BLOCKS OF CODE WILL RUN.
# 
#...............................................................

# In code (as below) that is structured as 
# if / else if / else if / ... etc ... / else
# EXACTLY ONE AND ONLY ONE of the blocks of code will happen.

priceOfSalad = function(size) {
  
  # EXACTLY ONE AND ONLY ONE of the following sections will execute.

  if (size == "small") {
    price = 9
    
  } else if (size == "medium") {
    price = 12
    
  } else if (size == "large") {
    price = 14
    
  } else if (size == "xlarge") {            
    price = 15
    
  } else {  # if nothing else happened, this happens. An "else" does NOT have a condition
    stop("size must be one of : small , medium, large, xlarge")
  }
  
  price   # return the total price   
}

priceOfSalad("medium")
priceOfSalad("small")
priceOfSalad("gargantuan")   # ERROR - "size must be one of : small , medium, large, xlarge"

# another version ...
# This one works but doesn't display a "nice" error message when size is not valid

priceOfSalad = function(size) {
  
  # EXACTLY ONE AND ONLY ONE of the following sections will execute.
  
  if (size == "small") {
    price = 9
    
  } else if (size == "medium") {
    price = 12
    
  } else if (size == "large") {
    price = 14
    
  } else if (size == "xlarge") {            
    price = 15
    
  } 
  
  price   # return the total price   
}

priceOfSalad("medium")
priceOfSalad("small")
priceOfSalad("gargantuan")   # ERROR - object 'price' not found

# one more version - without an else
#
# If you specify incorrect size, then 
# price is $0 and you don't get any salad
priceOfSalad = function(size) {

  # if you don't specify a correct size, the price will be this:
  price = 0
  
  # if the size were not small, medium, large or xlarge
  # we would not have gotten this far. 
  
  if (size == "small") {
    price = 9
    
  } else if (size == "medium") {
    price = 12
    
  } else if (size == "large") {
    price = 14
    
  } else if (size == "xlarge") {  
    price = 15  
  }
  
  # THERE WAS NO "else".
  #
  # If none of the conditions were TRUE then none of the "if" or "else if"
  # sections above would have been run. 
  #
  # However, since we set the price to zero before the very first "if", 
  # when none of the "if" / "else if" sections run, the price will be zero.
  
  price
}

priceOfSalad("large")        # 14
priceOfSalad("gargantuan")   # 0 ... you don't have to pay, but you don't get a salad

#--------------------------------------------------------------------------------
# The following example makes use of "else if" sections that are arranged
# in a very specific order. Remember that the FIRST condition that is TRUE
# will cause that section of code to execute and NO OTHER sections of code
# after that will execute.
#--------------------------------------------------------------------------------


# Admission to amusement park based on age
#
#    65 and up :  30
#    13 - 64:     40
#    4 - 13:      25
#    0 - 3:       0 (ie. free)


admissionPrice = function(age){
  
  # EXACTLY ONE OF THE PRICES WILL BE ASSIGNED
  if (age >= 65)
    price = 30
  
  else if (age >= 13)
    price = 40
  
  else if (age >= 4) 
    price = 25
  
  else            # DO NOT USE ANY CONDITION WITH A FINAL ELSE 
    price = 0
  
  price
}

admissionPrice(70)
admissionPrice(23)
admissionPrice(2)

# WHY DOES THE FOLLOWING RETURN 30 ??? 
admissionPrice("apple")

# USE THE DEBUGGER TO FIGURE IT OUT
debugonce(admissionPrice)
admissionPrice("apple")


# ANOTHER ATTEMPT AT THE SAME PROBLEM:
# THIS WILL NOT WORK CORRECTLY !!!

admissionPrice = function(age){
  
  if (age >= 65) {
    price = 30
  }
 
  if (age >= 13) {
    price = 40
  }

  if (age >= 4) {
    price = 25
  }

  # THIS WILL ALWAYS HAPPEN - FOR ANY AGE !!!
  if (age >= 0) {
    price = 0
  }

  price
}

admissionPrice(70)   # 0
admissionPrice(25)   # 0

# You can reverse the order of the if's but that is NOT recommended
# since you are causing R to do extra work. You are also causing someone
# who is reading your program to think through extra logic. This
# is NOT a good approach. Best approach is to use "else if" in 
# a situation where only one section of code needs to run.

# 2nd ATTEMPT TO USE SEPARATE IFs.
#
# This WILL work correctly but IS NOT RECOMMENDED.
#
# *** REMEMBER - THE BEST APPROACH IF YOU HAVE ONLY ONE BLOCK OF CODE ***
# *** THAT NEEDS TO EXECUTE IS TO USE "else if" SECTIONS.             ***

admissionPrice = function(age){
  
  price = 0
  
  if (age >= 4)    
    price = 25     # this WILL happen if the age is 70
  
  if (age >= 13)
    price = 40     # this will ALSO happen if the age is 70
  
  if (age >= 65)   
    price = 30     # this will ALSO happen if the age is 70
  
  price #the final price for age==70 will be 30, but price was set unnecessarily 3 different times
}

# This works but use the debugger to see why it is not ideal.
# You are making R do extra work.

admissionPrice(70) # 30: correct result but not ideal approach. price is set 3 different times
admissionPrice(23) # 40: correct result but not ideal approach. price is set 3 different times
admissionPrice(2) # 40: correct result but not ideal approach. price is set 3 different times



# 3rd ATTEMPT TO USE SEPARATE IFs.
#
# This WILL work correctly but IS ALSO NOT RECOMMENDED.
#
#
# *** REMEMBER - THE BEST APPROACH IF YOU HAVE ONLY ONE BLOCK OF CODE ***
# *** THAT NEEDS TO EXECUTE IS TO USE "else if" SECTIONS.             ***


admissionPrice = function(age){
  
  price = 0
  
  if (age >= 4 & age < 13)    # code is overly complex and error prone
    price = 25
  
  if (age >= 13 & age < 65)   # code is overly complex and error prone 
    price = 40
  
  if (age >= 65)   
    price = 30
  
  price
}

admissionPrice(70)
admissionPrice(23)
admissionPrice(2)


#------------------------------------------
# CAREFUL !!! 
#------------------------------------------

# 4th ATTEMPT TO USE SEPARATE IFs.
#
# This does NOT work correctly!!!
# Don't do this.
#
# *** REMEMBER - THE BEST APPROACH IF YOU HAVE ONLY ONE BLOCK OF CODE ***
# *** THAT NEEDS TO EXECUTE IS TO USE "else if" SECTIONS.             ***


admissionPrice = function(age){
  
  price = 0
  
  if (age >= 4 & age < 13){    # this is NOT connected with the next if
    price = 25
  }
  
  if (age >= 13 & age < 65){   # this IS connected to the following else
    price = 40
    
  } else {        # THIS LOGIC IS WRONG - this will happen for 5-year-olds
    price = 30
    
  }
  
  price  # correct for adults and seniors    WRONG for children and infants
}

admissionPrice(2)   # 30 - WRONG ANSWER - use the debugger to figure out why.
admissionPrice(5)   # 30 - WRONG ANSWER - use the debugger to figure out why.
admissionPrice(20)  # 40 - correct
admissionPrice(70)  # 30 - correct

debugonce(admissionPrice)
admissionPrice(2)   # 30 - WRONG ANSWER - use the debugger to figure out why.
















#--------------------------------------------------------------
# A slightly more complex example - same ideas
#--------------------------------------------------------------

# size and dressing options
#
#    small  (4 choices) : 9
#    medium (5 choices) : 12
#    large  (6 choices) : 14
#    xlarge (7 choices) : 15
#    any other size - stop with an error
#
#    dressing = TRUE or FALSE :  TRUE additional .50   FALSE = 0
#    any other value stop with an error

priceOfSalad = function(size, dressing) {
  
  # check at the beginning for one of the correct sizes
  if ( ! size %in% c("small", "medium", "large", "xlarge")) {
    stop("size must be one of : small , medium, large, xlarge")
  }
  
  # check at the beginning for a valid value for dressing (should be TRUE or FALSE)
  if (! is.logical(dressing) & length(dressing) == 1){
    stop ("dressing must be TRUE or FALSE")
  } 
  
  # EXACTLY ONE OF THE FOLLOWING TWO BLOCKS OF CODE HAPPENS
  
  if (dressing) { # "if(dressing)" is the same as "if(dressing == TRUE)" 
    price = 0.50
  } else {                          # an else DOES NOT HAVE a condition
    price = 0
  }

  # STARTING A NEW "if"
  #
  # EXACTLY ONE OF THE FOLLOWING BLOCKS OF CODE HAPPENS
  
  if (size == "small") {
    price = price + 9
    
  } else if (size == "medium") {
    price = price + 12
    
  } else if (size == "large") {
    price = price + 14
    
  } else {                          # an else DOES NOT HAVE a condition
    price = price + 15
  }
  
  price   # return the total price   
}

priceOfSalad("medium", FALSE)
priceOfSalad("small", TRUE)
priceOfSalad("gargantuan", FALSE)
priceOfSalad("large", "caeser")




#----------------------------------------------------------------------
# if ( SOME_LOGICAL_VECTOR ){   # open curly brace goes here  
#
#    SOME CODE                  #  This is a "block" of code
#    SOME MORE CODE
#    EVEN MORE CODE
#    ETC
#
# }                             # closing curly brace
#
# The if only "looks at" the first value in the logical vector.
#
# If the first value in the logical vector is TRUE then the 
# code in the "block of code" is done.
#
# If the first value in the logical vector is FALSE then the 
# code in the "block of code" is NOT done.
#
# In either case, the lines of code AFTER the if is done 
# whether or not the {block of code} for the if was done.
#-----------------------------------------------------------------------------


##########################################################################.
##########################################################################.
##
## 2022 - WILF - UP TO HERE - AFTER CLASS 21
##
##########################################################################.
##########################################################################.

#-----------------------------------------------------------
# The following illustrates two concepts
# 
# - Using multiple separate "if"s to build up an answer 
#
# - "Nested" if's (i.e. an if inside of another if)
#-----------------------------------------------------------

# Write a function that determines qualities of a number
# e.g. whole number, even, odd, positive, negative, zero, perfect square, etc.
#
# The following version just uses if (there is no "else" in this version)

describeNumber <- function(n) {
  
  # make sure that n is a single number and stop if it isn't
  
  if (!is.numeric(n) | length(n) != 1){
    stop ("n must be a single number")
  }
  
  # start with an empty character vector 
  answer <- character(0)   # empty answer so far
  
  # Each of the following checks to see if the number meets some condition.
  #
  # If the condition is TRUE, then a new description of the number
  # is added to the answer.
  #
  # If the condition is FALSE, then nothing happens with that if and 
  # the next if is checked.
  
  if (trunc(n) == n) {
    answer <- c(answer, "whole number")
  } 

  if (trunc(n) != n) {
    answer <- c(answer, "not a whole number")
  }

  if(n%%2 == 0){
    answer <- c(answer, "even")   
  } 
  
  if(n%%2 == 1){
    answer <- c(answer, "odd")   
  } 
  
  if (n > 0){
    answer <- c(answer, "positive")   
  } 
  
  if (n < 0) {
    answer <- c(answer, "negative")   
  } 
  
  if (n==0) {
    answer <- c(answer, "zero")
  }
  
  # If you take the sqrt of a negative number R will 
  # give you an error. 
  #
  # Make sure that we don't run the sqrt function unless
  # we know that n is not negative.
  if (n>=0){
    
    # If we got this far then we know that n is not negative so we 
    # can use the sqrt(n) function.
    #
    # An if inside of an if is known as a "nested if"
    
    if (sqrt(n) == trunc(sqrt(n))){
      
      # n is not negative and is a perfect square
      answer <- c(answer, "perfect square")
    }
    
  }
  
  
  return (answer)  
}

describeNumber("apple")
describeNumber(c(10,20))
describeNumber(2.5)
describeNumber(7)
describeNumber(-7.5)
describeNumber(4)
describeNumber(0)


##########################################################################.
##########################################################################.
##
## 2022 - BEREN - UP TO HERE - AFTER CLASS 22
##
##########################################################################.
##########################################################################.

# NEW VERSION
#
# The following version uses different forms of the if
#
# - just an if
# - an if with an else
# - an if with an else if and an else
# - "nested" statements, i.e. one if or else or "else if" inside 
#   the body of another one
#
# This makes the code "faster" for R to execute and
# can make writing the code more straight forward for
# people. There is less repetition with this style.


describeNumber <- function(n) {
  # make sure that n is a single number and stop if it isn't
  if (!is.numeric(n) | length(n) != 1){
    stop ("n must be a single number")
  }
  
  answer <- character(0)   # empty answer so far

  # one of the following pieces of code will run , but never both  
  if (trunc(n) == n) {
    answer <- c(answer, "whole number")
    
    if(n%%2 == 0){
      answer <- c(answer, "even")   
    } else {
      answer <- c(answer, "odd")   
    } 
    
    
  } else {
    answer <- c(answer, "not a whole number")
  }
  
  
  # only 1 of the follwing will happen  
  if (n > 0){
    answer <- c(answer, "positive")   
  } else if (n < 0) {
    answer <- c(answer, "negative")   
  } else {
    answer <- c(answer, "zero")
  }
  
  # If you take the sqrt of a negative number R will 
  # give you an error. 
  #
  # Make sure that we don't run the sqrt function unless
  # we know that n is not negative.
  if (n>=0){
    if (sqrt(n) == trunc(sqrt(n))){
      answer <- c(answer, "perfect square")
    }
  }
  
  return (answer)  
}


describeNumber("apple")
describeNumber(c(10,20))
describeNumber(2.5)
describeNumber(7)
describeNumber(-7.5)
describeNumber(4)
describeNumber(0)




###############################################################################
# You can see exactly how R processes the code by using the debugger to follow
# which lines of code are actually run. Just keep typing "n" or press the "next"
# button  to run the "next" line of code.
###############################################################################

debugonce(describeNumber)
describeNumber(4)


#------------------------------------------------
# Summary of different forms of if statement
#------------------------------------------------

# 1a. if without an else
#
#      if( SOME_TRUE_FALSE_CONDITION ) {
#             LINE 1
#             LINE 2
#             ETC ...
#      }
#
#    either the code happens or it doesn't
#
# 1b. Multiple if's in a row
#
#      if( SOME_TRUE_FALSE_CONDITION ) {
#             LINE 1
#             LINE 2
#             ETC ...
#      }
#
#      if( SOME_TRUE_FALSE_CONDITION ) {
#             LINE 1
#             LINE 2
#             ETC ...
#      }
#
#      if( SOME_TRUE_FALSE_CONDITION ) {
#             LINE 1
#             LINE 2
#             ETC ...
#      }
#
#
#
# 2. if with else
#
#      if( SOME_TRUE_FALSE_CONDITION ) {
#             IF CODE LINE 1
#             IF CODE LINE 2
#             ETC ...
#      } else {
#             ELSE CODE LINE 1
#             ELSE CODE LINE 2
#             ETC ...
#      }
#
#    DEFINITELY one of the blocks of code happens
#    when the condition on the if is TRUE the if happens
#    when the condition on the if is FALSE the else happens
#    they NEVER both happen.
#
# 3. if with one else if (but no else)
#
#      if( SOME_TRUE_FALSE_CONDITION ) {
#             IF CODE LINE 1
#             IF CODE LINE 2
#             ETC ...
#      } else if (ANOTHER_TRUE_FALSE_CONDITION) {
#             ELSE IF CODE LINE 1
#             ELSE IF CODE LINE 2
#             ETC ...
#      }
#
#    Possibly the if happens
#    possibly the else if happens
#    possibly neither of them happen
#    They NEVER both happen
#
# 4. if with more than one else if
#    every if and "else if" has a condition.
#
#      if( SOME_TRUE_FALSE_CONDITION ) {
#             IF CODE LINE 1
#             IF CODE LINE 2
#             ETC ...
#      } else if (ANOTHER_TRUE_FALSE_CONDITION) {
#             ELSE IF CODE LINE 1
#             ELSE IF CODE LINE 2
#             ETC ...
#      } else if (YET_A_THIRD_TRUE_FALSE_CONTISION) {
#             ELSE IF CODE LINE 1
#             ELSE IF CODE LINE 2
#             ETC ...
#      }
#
#    The first 
#    condition that turns out to be TRUE
#    causes the code below that condition to run
#
#    BOTTOM LINE - 
#      o ONE of the if / else if  sections may run
#      o Never more than one section will run
#      o Possibly none of the sections will run
#
# 5. if with else if (possibly many else if's) and a final else
# 
#      if( SOME_TRUE_FALSE_CONDITION ) {
#             IF CODE LINE 1
#             IF CODE LINE 2
#             ETC ...
#      } else if (ANOTHER_TRUE_FALSE_CONDITION) {
#             ELSE IF CODE LINE 1
#             ELSE IF CODE LINE 2
#             ETC ...
#      } else if (YET_A_THIRD_TRUE_FALSE_CONTISION) {
#             ELSE IF CODE LINE 1
#             ELSE IF CODE LINE 2
#             ETC ...
#      } else {
#             ELSE CODE LINE 1
#             ELSE CODE LINE 2
#             ETC ...
#      }
#
#    SAME as above, but when none of the if/"else if" conditions
#    are TRUE then the final else section runs
#
# 6. nested if
#
#    an if 
#    (or if ... else ...
#     or if ... else if ... else ...
#     etc.)
#
#    inside another if
#    (or if ... else ...
#     or if ... else if ... else ...
#     etc.)


#------------------------------
# another example
#------------------------------

# Write a function to return the price of admission to an amusement park.
#
# Business rules: admission price depends on age and weekday vs weekend
# and age of the guest.

# RULES: 
# WEEKENDS
# adults 13 and up : $40
# children: 4 to 12 : $30
# children below 3 are free
#
# WEEKDAYS
# adults 13 and up : $38
# children: 4 to 12 : $22
# children below 3 are free
#
# ALL TIMES adults 65 and up get 10% off

# day is one of 'mon' 'tue' etc.
# age is a single number

admissionPrice <- function (day, age) {
  # make sure that day is valid - if not then stop with an error
  if( ! (day %in% c("sun","mon","tue","wed","thu","fri","sat"))    ){
    stop( "day must be one of sun mon tue wed thu fri sat")
  }
  
  # make sure that age is valid - if not then stop with an error
  if (!is.numeric(age) | length(age) != 1){
    stop("age must be a single number")
  }
  
  if ( day %in% c("sun","sat")) {

    # THIS IS A WEEKEND
    if(age >= 13){   # ADULT
      price = 40
    } else if (age >= 4){
      price = 30
    } else {
      price = 0
    }

  } else {
    
    # THIS IS A WEEK DAY
    if(age >= 13){   # ADULT
      price = 38
    } else if (age >= 4){
      price = 22
    } else {
      price = 0
    }
  }
  
  # THIS CODE WILL RUN ON BOTH WEEKENDS AND WEEKDAYS
  if (age >= 65) {
    price <- price * .9
  }
  
  return (price)
}


admissionPrice ("sun", 35)   # 40

admissionPrice ("tue", 35)   # 38

admissionPrice ("tue", 75)   # 34.2

admissionPrice ("sun", 5)   #

admissionPrice ("sun", 2)   #

admissionPrice ("xyz", 35)   # ERROR: day must be one of sun ...

