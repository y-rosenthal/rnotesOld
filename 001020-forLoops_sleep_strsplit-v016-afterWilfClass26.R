rm (list=ls())

################################################################
################################################################
##
## Intro to for loop. 
##
## The for loop is similar to the while loop in that it causes a 
## body of code to be repeated more than once. However, the for
## loop is DIFFERENT from the while loop in how it accomplishes 
## the repetition.
##
## It's probably easiest to understand how the for loop works
## if you examine the example code that appears below. However,
## the following is an attempt to explain in words how the for 
## loop works. I recommend that you look at the examples below
## and then come back and read this more detailed explanation.
##
## ------------------------------------------------------------
##
## Code of a for loops is arranged in the following format.
##
##    for ( SOME_VARIABLE in  SOME_VECTOR__OR__SOME_LIST  ){
##
##       # statements that
##
##       # may refer to 
##
##       # the variable
##
##    }
##
## NOTES:
##
## 1. SOME_VARIABLE is the name of a variable. This variable is created just for
##   the purpose of the for loop. You cannot refer to this variable outside
##   of the code for the for loop. (If the same name is used for a variable
##   outside of the for loop it is a different variable).
##
## 2. SOME_VECTOR__OR__SOME_LIST is a vector or a list.
##   This could be a variable name that was created before the
##   for loop started or it could be the result a function that creates
##   a vector or a list.
##
## 3. The code executes in the following way:
##
##    step 1. The first value in the vector (or list) is assigned to the variable.
##
##    step 2. The body of the loop (i.e. code between {curly braces}) is executed.
##            [The code in the body may refer to the variable but it doesn't have to.]
##
##    step 3. After the {body} finishes executing once, the next value from the
##            vector (or list) is assigned to the variable.
##
##    step 4. The body of the for loop is then executed again. 
##            However, this time the value of the variable is the 2nd value
##            from the vector (or list).
##
##    step 5. The for loop keeps replacing the value of the variable with the 
##            next value from the vector (or list) and then doing the code in 
##            the {body} until it runs out of values from the vector (or list).
##
##    step 6. After all values from the vector (or list) have been processed,
##            the loop is finished and execution continues with the line after
##            the end of the body of the loop - i.e. the line after the "}"
##
################################################################
################################################################

# This file goes through several examples of using a for loop and a while loop.
# Be sure to see the notes at the bottom of this file for some important
# concepts and a discussion of when a for loop is an option and when
# you must use a while loop.

#-----------------------------
# Example of a for loop
#
# Everything you need to know about a for loop is in the first line of the 
# loop (i.e. the line that starts with the word "for").
# In the following example, the first line says:    for(num in 10:1).
#
# In this example, num is the variable and 10:1 is the vector, i.e. c(10,9,8,7,6,5,4,3,2,1)
# 
#   The 1st value from the vector (i.e. 10) is assigned to the variable, num
#   Then the body of the loop is executed. 
# 
#   The 2nd value from the vector (i.e. 9) is assigned to the variable, num
#   Then the body of the loop is executed. 
# 
#   The 3rd value from the vector (i.e. 8) is assigned to the variable, num
#   Then the body of the loop is executed. 
#
#   etc ...
#
#   After all the values from the vector have been processed, the loop is finished.
#-----------------------------

countdown <- function (){
  for (num in 10:1){  # each time through the loop another value from 10:1 is assigned to num
    cat(num," ")      # display num followed by a space
    Sys.sleep(0.25)   # sleep for 0.25 seconds
  }
  
  cat("blastoff!")    # after the loop has finished, display "blastoff!"
}

debugonce(countdown)
countdown()
#----------------------------------------------------------------------
# A for loop can always be rewritten as a while loop.
# The following rewrites the above example to use a while loop.
#----------------------------------------------------------------------

countdownWithWhile <- function (){
  num = 10          # setup the variables to be used in the condition of the while
  
  while(num >= 1){  # condition that's TRUE when loop should run and FALSE when loop should end
    cat(num, " ")
    Sys.sleep(0.25)

    num <- num - 1  # change some variable that is part of the condition
  }                 # END OF WHILE - code below will only happen after while finishes
  
  cat("blastoff!")  
}

countdownWithWhile()

#----------------------------------------------------------------------
# A for can use ANY vector or list
#
# Other examples of vectors
# - character and logical vectors
# - numeric vectors that don't count by ones
#----------------------------------------------------------------------

#-----------------------------------
# Count by two's - with a for loop
#-----------------------------------
countByTwos_for = function(){
  vec = seq(2,10, by=2)
  for ( num in vec){
    cat("I like number", num, "\n")
  }
}

countByTwos_for()


# TURN THIS CODE INTO CODE THAT USES A WHILE

countByTwos_for = function(){
 vec = seq(2,10, by=2)
 position = 1
 #for ( num in vec){
 while( position <= length(vec) ){
  num = vec[position]
  cat("I like number", num, "\n")
  
  position = position + 1
 }
}

countByTwos_for()


# rewriting the same example with a while loop

countByTwos_while = function(){
  num = 2
  while ( num <= 10){
    cat("I like number", num, "\n")
    num = num + 2
  }
}

countByTwos_while()

##################################################################.
# QUESTION
##################################################################.
# 
# Write a function that takes a matrix, m, as an argument. 
# The function should return a new matrix that
# 
#    multiplies the 1st row by 10
#    multiplies the 2nd row by 100
#    multiplies the 3rd row by 1000
#    etc ... for all rows of the matrix
#
# (a) - Write the function using a for loop
# (b) - Write the function using a while loop
#
##################################################################.

# ANSWER - here is some data to start you off. The code should work 
# will all possible matrices. Here are some to start you off in 
# testing your work. 
m = matrix(seq(10, 180, 10) , nrow=3, ncol=6)
m

set.seed(100)  # you can pick any seed 
m = matrix(trunc(runif(min=1, max=5, 15)), nrow=5, ncol=3)
m

# First try - we are displaying the different values of the multiplier
multRows = function( m ) {
 
 multiplier = 10
 
 while( multiplier <= 10 ^  nrow(m)   ){
  
    cat("multiplier is currently", multiplier, "\n") 
    
    multiplier = multiplier * 10 
  }
 
}

m = matrix(seq(10, 180, 10) , nrow=3, ncol=6)
m

multRows(m)


# second try

multRows = function( m ) {
 
 multiplier = 10
 row = 1
 
 while( multiplier <= 10 ^  nrow(m)   ){
  
  cat("multiplier is currently", multiplier, "\n") 
  
  m[ row , ] = m[row , ] * multiplier
  
  row = row + 1
  multiplier = multiplier * 10 
 }
 
 return ( m )
}

m = matrix(seq(10, 180, 10) , nrow=3, ncol=6)
m

multRows(m)

x = multRows(m)

x # messages from cat are NOT included



# WRite the answer with a for loop

multRows_for = function( m ){
 
 multiplier = 10
 for( row in 1:nrow(m) ){
  
  m[ row , ] = m[row, ] * multiplier
  
  multiplier = multiplier * 10
 }

 return (m)
}

m = matrix(seq(10, 180, 10) , nrow=3, ncol=6)
m

debugonce(multRows_for)
multRows_for(m)




##################################################################.
# QUESTION
##################################################################.
# 
# Write a function that takes a matrix, m, as an argument. 
# The function should return a new matrix that
# 
#    multiplies the value in position 1,1 by 1+1 = 2
#    multiplies the value in position 1,2 by 1+2 = 3
#    multiplies the value in position 1,3 by 1+3 = 4
#    ... and similarly for the rest of the values in row 1
#
#    multiplies the value in position 2,1 by 2+1 = 3
#    multiplies the value in position 2,2 by 2+2 = 4
#    multiplies the value in position 2,3 by 2+3 = 5
#    ... and similarly for the rest of the values in row 2
#
#    etc ... for all rows in the matrix
#
# Use nested loops for your answer
#
# (a) - Write the function using nested for loops
# (b) - Write the function using nested while loops
# (c) - Write the function using nested loops, one should be a for loop
#       and one a while loop (your choice which is which)
#
##################################################################.

# ANSWER - here is some data to start you off. The code should work 
# will all possible matrices. Here are some to start you off in 
# testing your work. 
m = matrix(seq(10, 180, 10) , nrow=3, ncol=6)
m

set.seed(100)  # you can pick any seed 
m = matrix(trunc(runif(min=1, max=5, 15)), nrow=5, ncol=3)
m


multValues = function ( m ){
 row = 1 
 while(row <= nrow(m) ) {
  
  col = 1
  while(col <= ncol(m)) {
    multiplier = row + col
    m[row, col] = m[row, col] * multiplier

    col = col + 1   
  }
  
  row = row + 1  
 }

 return(m)
}

smallMatrix = matrix(1, nrow=3, ncol=3)
#debugonce(multValues)
multValues(smallMatrix)

matOnes = matrix(1, nrow=3, ncol=5)
matOnes

multValues(matOnes)

anothermatrix = matrix(1:20, nrow=4, ncol=5)
anothermatrix
multValues(anothermatrix)

# ANSWER - with a for loop

multValues = function ( m ){
 row = 1 
 while(row <= nrow(m) ) {
  
  col = 1
  while(col <= ncol(m)) {
   multiplier = row + col
   m[row, col] = m[row, col] * multiplier
   
   col = col + 1   
  }
  
  row = row + 1  
 }
 
 return(m)
}

multValues_for = function( m ){
 
 for (  row in 1:nrow(m) ){
  for (col in 1:ncol(m) ){
   multiplier = row + col
   m[row, col] = m[row, col] * multiplier
  }
 }
 return (m)
}

smallMatrix = matrix(1, nrow=3, ncol=3)
smallMatrix
#debugonce(multValues)
multValues_for(smallMatrix)

matOnes = matrix(1, nrow=3, ncol=5)
matOnes
multValues_for(matOnes)

anothermatrix = matrix(1:20, nrow=4, ncol=5)
anothermatrix
multValues_for(anothermatrix)



#----------------------------------------------------
# ANOTHER EXAMPLE: display character values in a vector
#----------------------------------------------------

#.................
# With a for loop
#.................
anotherExample_for = function( foods ){

  cat("Hello. \n")
  
  for (item in foods) {
    cat(item, "is yummy.\n")
    cat("Everyone likes", item, ".\n")
    cat("I hope we have", item, "for supper!\n\n")
  }
  
  cat("bye bye.\n")
}

#debugonce(anotherExample_for)
anotherExample_for (c("pizza", "french fries", "burger", "chicken", "ice cream"))
anotherExample_for (c("cake", "lasanga", "chullent"))
anotherExample_for (character(0))

anotherExample_for( list("apple", "orange"))   # for loops also work with lists



#...................
# With a while loop
#...................

# You can convert any for loop to a while loop.
# Use the while loop to process each position in the vector (or the list).
# This is what the for loop actually does for you, but we can do it ourselves.
#
# The following shows a general way to convert ANY for loop into a while loop.
# We highlighted the lines of code in this version that are different from 
# the previous version. All other lines of code are EXACTLY the same.

anotherExample_while = function( foods ){
  
  cat("Hello. \n")
  
  position = 1                    # new line
  while(position<=length(foods)){ # new line
    
    item = foods[[position]]  # new line; [[ ]] works with both lists and vectors
    
    cat(item, "is yummy.\n")
    cat("Everyone likes", item, ".\n")
    cat("I hope we have", item, "for supper!\n\n")
    
    position = position + 1       # new line
  }
  cat("bye bye.\n")
}

# This produces the exact same results as the for loop
anotherExample_while (c("pizza", "french fries", "burger", "chicken", "ice cream"))
anotherExample_while (c("cake", "lasanga", "chullent"))
anotherExample_while (character(0))

anotherExample_while( list("apple", "orange")) # careful 

#######################.
# QUESTION
#######################.

#-----------------------------------------------------------------
# SOMETIMES you MUST use a while loop.
#-----------------------------------------------------------------
# Some problems that cannot be coded with a for loop
# but rather require that you use a WHILE loop.
#
# To use a for loop, you must be able to construct a vector that 
# contains all possible values that you will loop through.
#
# However, sometimes, you don't know what those values are or how
# many times you will need to process the loop.
#-----------------------------------------------------------------

# EXAMPLE - guessing game cannot be done with a for loop.
# The loop can go on forever if the user keeps getting the wrong answer.

# The following function is coded with a WHILE loop.
# (you cannot write this function with a for loop)

guessingGame <- function(low=1, high=10){
  num <- sample(low:high, 1)
  numGuesses <- 1
  guess <- as.numeric( readline( paste0(
             "guess a number between ", low, " and ", high, ": " )))
  while(guess != num) {
    if (guess < num){
      guess <- as.numeric( readline("higher, guess again: ") )
    } else if (guess > num) {
      guess <- as.numeric( readline("lower, guess again: ") )
    }
    numGuesses <- numGuesses + 1
  } 
  cat("You got it in", numGuesses, "guesses.")
}

guessingGame()
guessingGame()
guessingGame()

# EXAMPLE - firstNPrimes cannot be done with a for loop. I have 
# no idea how many numbers I'll have to check to find the 1000th prime
# or the millionth prime. There is no simple formula that will give
# that answer. Therefore, there is no way to know how long the vector 
# should be for the for loop.




#-----------------------------------------------------------------
# With a for loop you must use a variable even when there 
# is no need for the value.
#-----------------------------------------------------------------

# The following for loop does NOT make reference to the num variable
# at all. However, it is still required to be specified in the code.

sayHello = function( numTimes ) {
  
  for (num in 1:numTimes){
    name = readline("What is your name? ")
    cat("Hello ", name, ".\n", sep="")
    cat("I'm fine.\n")
    cat("How are you doing?\n\n")
  }
  
  cat("bye bye.")
}

sayHello(3)  # say hello three times


#-------------------------------------------------------------------------
# QUESTION: Write a function:   box = function(rows, cols)
# to draw a box in the following pattern using nested for loops
#
#    > box (rows = 3 , cols = 4)
#    3333
#    2222
#    1111
#-------------------------------------------------------------------------

box = function(rows, cols){
  
  for (rowNumber in rows:1){   # count down - we're showing row numbers in reverse
    for (colNumber in 1:cols){ # we can count up or down - we're not using colNumber
      
      cat(rowNumber)
      
    }
    cat("\n")
  }
}

box(3, 4)
box(4, 10)

#-------------------------------------------------------------------------
# QUESTION - rewrite the box function from the previous question
#            to use nested while loops
#-------------------------------------------------------------------------



boxWithWhile = function( rows, cols){

  rowNum = rows
  colNum = 1      
  while (rowNum >= 1){
    
    colNum = 1
    while (colNum <= cols){
      
      cat(rowNum)
      colNum = colNum + 1
    }
    cat("\n")
   
    rowNum = rowNum - 1 
  }
}

boxWithWhile(3,4)
#-------------------------------------------------------------------------
# QUESTION - Write a function
#
#    triangle = function(size)
#
# that draws a triangle in the following pattern using nested for loops.
#
#   > triangle(3)
#   1
#   21
#   321
#-------------------------------------------------------------------------

triangle = function(size){

  for(row in 1:(size*2)){
    
    for(col in row:1){
      
      cat(col)
      
    }
    
    cat("\n")
  }
}

triangle(3)
triangle(5)
#-------------------------------------------------------------------------
# QUESTION - rewrite the triangle function from the previous question
#            to use nested while loops
#   > triangle(3)
#   1
#   21
#   321
#-------------------------------------------------------------------------

triangle = function(size){
  row = 1
  while(row <= size) {

    col = row
    while(col >= 1) {
      
      cat(col)  
      col = col - 1
    }
    
    cat("\n")
    row = row + 1 
  }
  
}

triangle(3)
#-------------------------------------------------------------------------
# QUESTION - Write a function
#
#    triangle = function(size)
#
# that draws a triangle in the following pattern using nested for loops.
#
#   > triangle(3)
#     1
#    21
#   321
#
#   > triangle(4)
#      1
#     21
#    321
#   4321
#
# HINT: you can think of this "triangle" as a "box" but where some of the 
# spots are actually spaces. It might help to view the spaces as periods
# so that you can see them. Think about how to draw each of the rows - 
# you can split up each row into (a) drawing the periods and (b) drawing the 
# numbers
#
#   > triangle(3)
#   ..1
#   .21
#   321
#
#   > triangle(4)
#   ...1
#   ..21
#   .321
#   4321
#-------------------------------------------------------------------------

triangle = function(size){
  # FILL IN THE CODE
}


############################################################################
# & vs &&
# | vs ||
#
# The single & and | are vectorized.
#
#    > c(TRUE, TRUE) & c(FALSE, TRUE)
#    FALSE TRUE
#
# The double && and || operators only return the first TRUE or FALSE
#
#    > c(TRUE, TRUE) && c(FALSE, TRUE)    # only the first result is returned
#    FALSE 
#
#
# The single & and | will process ALL values
#
# The double && and || will only process the values up until an answer
# can be figured out. We call these shortcut operators.
##########################################################################


is.prime <- function( num ) {
  
  # if( !is.numeric(num) | trunc(num) != num | num < 1 ){
  if( !is.numeric(num) || trunc(num) != num || num < 1 ){
    stop("num must be a positive whole number")
  }
  
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

is.prime("apple")

# && uses "shortcut" logic:

TRUE && ______     # I don't konw the answer until I analyze the ______

FALSE && ______    # The answer MUST BE FALSE



c(TRUE,TRUE,TRUE) | c(FALSE, TRUE, FALSE)
c(TRUE,TRUE,TRUE) & c(FALSE, TRUE, FALSE)



# The double operators only return the first value for the answer
c(TRUE,TRUE,TRUE) || c(FALSE, TRUE, FALSE)
c(TRUE,TRUE,TRUE) && c(FALSE, TRUE, FALSE)


#-------------------------------------------------------------------
#-------------------------------------------------------------------
# The following is a slight digression to discuss return values ...
#
# STUDENTS who are new to R are often confused about these ideas ...
#-------------------------------------------------------------------
#-------------------------------------------------------------------

#..................................................................
# *** TL;DR *** (i.e. the main idea) ...
# (keep reading the comments below for a more lengthy explanation): 
#..................................................................
#
#     The countdown function does NOT return the numbers
#     nor the word "blastoff!". Rather the return value of countdown() is the 
#     value of cat("blastoff!") function, which is invisible, and is NULL.

# Same code as above
countdown <- function (){
  for (num in 10:1){  # each time through the loop another value from 10:1 is assigned to num
    cat(num," ")      # display num followed by a space
    Sys.sleep(0.25)   # sleep for 0.25 seconds
  }
  
  cat("blastoff!")    # after the loop has finished, display "blastoff!"
}
countdown()  # 10 9 8 7 6 5 4 3 2 1 blastoff!

x <- countdown()
x # NULL

#..................................................................
# *** A SOMEWHAT MORE LENGTHY EXPLANATION OF THESE CONCEPTS ***
#..................................................................
# First of all, remember that if a function doesn't execute an explicit
# return statement, then the value of the final command to be executed is returned
# from the function.
#
# Therefore, in the case of the countdown function above, what is "returned" is the 
# value of cat("blastoff!") ... (but this is NOT the word "blastoff!" ... keep reading).

# The return value of cat is always NULL.
# In the next line the return value is NULL, NOT "hello".  
# The return value, NULL, is then assigned to the variable x.
# Even though the word "hello" is NOT the return value,
# nevertheless, the word hello (without quotes) is displayed because cat 
# will always display info to the screen.
x <- cat("hello")  # displays hello (without quotes) to the screen
x # NULL

# One more example ...
# Remember, the rep function repeats the VALUE of the first argument.
rep("hello", 5)   # "hello" "hello" "hello" "hello" "hello"
rep(seq(1,3), 5) # 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 

# In the following example, the return value of cat is NULL.
# However, NULL is NOT repeated 5 times, only once.
# This is due to the special nature of the value NULL (which basically
# means "nothing"). NULL is special in that even 5 NULLs are displayed
# as a single NULL - don't worry too much about the intricacies of NULL,
# but you must know that the return value of cat is NOT "hello".

rep(cat("hello"), 5) # helloNULL
rep(NULL, 5) # NULL  (only once)

# Bottom line: You can use cat to display info to the screen
# but don't expect that information to be "returned" from the function.


# SOME TAKEAWAYS:
# REMEMBER: 
#
# A few things to remember ...
#
#  1. If a function doesn't contain a return statement, then the 
#     value of the final command to be executed in the function
#     is returned.
#
#  2. Based on #1 above, the value that is returned from countdown()
#     is the value cat("blastoff!"). HOWEVER ... keep reading ...
#
#  3. It is very important to understand that the cat function 
#     does NOT "return" the information that is displayed. 
# 
#     The purpose of cat is TO DISPLAY INFORMATION TO THE SCREEN.
#     The purpose of cat is NOT to return a value.
#     Programmers use the cat function to display information,
#     NOT to generate a "value".The actual return value of cat
#     is NULL. You never really need to use this NULL value,
#     but technically, NULL is the return value. 
#
#  4. You don't actually see the word NULL on the screen when you 
#     run the countdown function since the return value of cat is 
#     an "invisible" value - we explained the concept of invisible
#     return values earlier in the semester when we first discussed
#     the cat function.)

#-------------------------------------------------------------------
#-------------------------------------------------------------------
#
# END OF THE DIGRESSION ...
# Let's get back to discussing the for loop and the while loop
#
#-------------------------------------------------------------------
#-------------------------------------------------------------------


#------------------------------------------------------------
# Write a function that takes a vector and returns a list
# with 3 vectors. 
# (a) negative numbers
# (b) nums between 0 and 100
# (c) nums larger than 100
# 
# DO NOT USE VECTOR OPERATIONS. RATHER, USE A LOOP.
#------------------------------------------------------------

splitVector <- function( vec ){
  answer <- list()  

  position <- 1
  while(  position <= length(vec) )  {
    num <- vec[position]
    
    # add num to either answer$negNums, answer$smallNums or answer$largeNums
    if (num < 0){
      answer$negNums <- c(answer$negNums, num)
    } else if ( num <=100  )  {
      answer$smallNums <- c(answer$smallNums, num)      
    } else {
      answer$largeNums <- c(answer$largeNums, num)
    }
    
    position <- position + 1
  }
  
  return(answer)
}

nums <- c(-10, 20, 1005, 32, -297)
splitVector( nums )
#-------------------------------------------------------------
# Rewrite the code to use a for loop instead of a while loop
#-------------------------------------------------------------
splitVector <- function( vec ){
  answer <- list()
  for ( num in vec   ) {
    # add num to either answer$negNums, answer$smallNums or answer$largeNums
    if (num < 0){
      answer$negNums <- c(answer$negNums, num)
    } else if ( num <=100  )  {
      answer$smallNums <- c(answer$smallNums, num)      
    } else {
      answer$largeNums <- c(answer$largeNums, num)
    }
  }
  return(answer)
}

grades <- c(-10, 20, 1005, 32, -297)
splitVector(grades)

#----------------------------------------------------
# Write isPrime(num) using a while loop
# (we did this in an earlier class)
#----------------------------------------------------

isPrime <- function(num) {
  divisor <- 2

  while ( divisor < sqrt(num) ){
    if (num %% divisor == 0){
      return(FALSE)
    }
    divisor <- divisor + 1
  }
  
  return(TRUE)
}

isPrime(35) # FALSE
isPrime(37) # TRUE

#----------------------------------------------------
# rewrite the code for isPrime to use a for loop
#----------------------------------------------------
isPrime <- function(num) {
  
  for ( divisor in 2:sqrt(num) ){
    if (num %% divisor == 0){
      return(FALSE)
    }
  }
  
  return(TRUE)
}

isPrime(35) # FALSE
isPrime(37) # TRUE




#------------------------------------------------------------
# write a function dfToVec
#
# ARGUMENTS: df is a dataframe
#
# The function should return a character vector that combines all
# the columns from df into a single vector
#------------------------------------------------------------

dfToVec <- function ( df ){
  answer <- character(0)  
  position <- 1
  while ( position <= ncol(df)  )  {
    answer <- c( answer ,   df[[position]]   )
    position <- position + 1
  }
  return(answer)
}

students <- data.frame(student=c("joe", "sue"),
                       test1= c(100,90),
                       test2 = c(85, 95),
                       honors = c(FALSE, TRUE), stringsAsFactors = FALSE)
students
dfToVec(students)

#------------------------------------------------------------
# Rewrite dfToVec to use a for loop
#------------------------------------------------------------
dfToVec <- function ( df ){
  answer <- character(0)
  for( column in df ){
    answer <- c(answer , column)
  }
  return(answer)
}

students <- data.frame(student=c("joe", "sue"),
                       test1= c(100,90),
                       test2 = c(85, 95),
                       honors = c(FALSE, TRUE), stringsAsFactors = FALSE)
students

dfToVec(students)



#------------------------------------------------------------
# Modify the code for dfToVec so that the vector 
# that is returned ONLY INCLUDES the values that
# are in character columns of the dataframe.
#------------------------------------------------------------

dfToVec <- function ( df ){
  answer <- character(0)
  
  for ( column in df ) {
    if ( is.character(column) ){
      answer <- c(answer, column)
    }
  }
  
  return ( answer )
}

students <- data.frame(student=c("joe", "sue"),
                       test1= c(100,90),
                       test2 = c(85, 95),
                       year = c("fr", "so"),
                       honors = c(FALSE, TRUE), stringsAsFactors = FALSE)
students
dfToVec(students)


#------------------------------------------------------------
# Write a function that takes a dataframe, df
# and returns a character vector.
# 
# The vector should contain
#  - all positive numbers from numeric columns
#  - all TRUE values from logical columns
#  - all character values that start with an "a" from character columns
#------------------------------------------------------------


dfToVec <- function( df ){
  
  answer <- character(0)
  
  for ( column in df ) {  # start of "outer" for loop
    
    for ( value in column) {  # start of "inner" for loop
      
      if( is.character(value) ){
        if ( value >= "a" & value < "b" ){
          answer <- c(answer, value)
        }
      } else if ( is.numeric(value)) {
        if( value > 0){
          answer <- c(answer, value)
        }
      } else if (is.logical(value) ) {
        if (value == TRUE){
          answer <- c(answer, value)
        }
        
      }  
      
    } # end of "inner" for loop
    
  } # end of "outer" for loop
  return(answer)
}

students <- data.frame(student=c("joe", "alice", "mike", "anne"),
                       test1= c(100,90,-20,-30),
                       test2 = c(-10, -40, 85, 95),
                       favFood = c("orange", "pear", "apple", "artichoke"),
                       honors = c(TRUE, FALSE, FALSE, FALSE), stringsAsFactors = FALSE)
students
dfToVec(students) # "alice" "anne" "100" "90" "85" 95" "TRUE"




#------------------------------------------------------------
# another way
#------------------------------------------------------------
#    loop through the column numbers  (outer loop)
#       loop through the row numbers    (inner loop)
#          check a particular value from a given row,column

dfToVec <- function( df ){
  
  answer <- character(0)
  
  for ( colNumber in 1:ncol(df)) {  # "outer" for loop
    
    for ( rowNumber in 1:nrow(df)) {  # "inner" for loop
      
      value = df[rowNumber, colNumber]  # get a single value
      
      if( is.character(value) ){
        if ( value >= "a" & value < "b" ){
          answer <- c(answer, value)
        }
      } else if ( is.numeric(value)) {
        if( value > 0){
          answer <- c(answer, value)
        }
      } else if (is.logical(value) ) {
        if (value == TRUE){
          answer <- c(answer, value)
        }
      }
      
    }  # end of "inner" for loop
    
  }  # end of "outer" for loop
  
  return(answer)
}


students <- data.frame(student=c("joe", "alice", "mike", "anne"),
                       test1= c(100,90,-20,-30),
                       test2 = c(-10, -40, 85, 95),
                       favFood = c("orange", "pear", "apple", "artichoke"),
                       honors = c(TRUE, FALSE, FALSE, FALSE), stringsAsFactors = FALSE)
students
dfToVec(students) # "alice" "anne" "100" "90" "85" 95" "TRUE"



#####################################################################
#####################################################################
##
## *** IMPORTANT CONCEPTS ABOUT FOR LOOPS ***
##
## DO NOT CHANGE THE VALUE OF THE FOR LOOP **VARIABLE** IN THE BODY!!!
## DO NOT CHANGE THE VALUE OF THE FOR LOOP **VECTOR**   IN THE BODY!!!
##
## - The code in the body should NEVER change the value of the 
##   for loop variable directly.
##
##   All changes to the value of the for loop variable should only
##   be done automatically by the for loop mechanism, 
##   i.e. the next value from the vector is AUTOMATICALLY assigned
##   to the for loop variable each time through the loop.
##
##   Explicitly changing the value of the for loop variable in 
##   the body of the loop is very confusing and is considered
##   VERY VERY sloppy coding by programmers everywhere.
##
## - Similarly, the code in the body should NEVER change the value of the 
##   for loop vector. The vector should have a value when the for 
##   loop starts and the value of the vector should NEVER change 
##   as the for loop is executing.
##
##   Changing the value of the vector of the for loop
##   in the body of the loop is very confusing and is considered
##   VERY VERY sloppy coding by programmers everywhere.
## 
##
##
##
##
##
## *** DIFFERENCE BETEWEN FOR LOOPS AND WHILE LOOPS ***
##
## A for loop is a convenience but NOT a necessity. 
##
## It IS TRUE that any code written with a for loop CAN be converted to use
## a while loop instead.
## 
## HOWEVER, it is NOT TRUE that any code written with a while loop can be
## converted to use a for loop.
##
## A for loop can only be used when you can anticipate how many times
## the code will loop before the loop starts. 
##
## For example, the guessing game program that we wrote in an earlier class
## cannot be written with a for loop since it is impossible to know in
## advance how many times the loop will need to "go around".
##
## isPrime CAN be written with a for loop since you know that you even
## before the for loop needs to "go around" at most sqrt(n) times.
##
## firstNprimes cannot be written with a for loop since we have no idea
## in advance how large the nth prime will be, e.g. how large is the 
## one millionth prime number??? Therefore we cannot anticipate before 
## the loop starts how many times the code needs to be repeated.
##
##############################################################
##############################################################






#--------------------------------------------------------------
# A plaindrome is a word that reads the same forwards and 
# backwards. 
# Example:   racecar is a palindrome
#            pineapple is not
#            abcdxba is NOT a palindrome
#            abcdcba is a palindrome
#
# Write a function isPalindrome(x)
# 
# ARGUMENTS
#   - x is expected to be a character vector with one item in it
#
# isPalindrome(x) should return TRUE if x is a palindrome
# and return FALSE if it isn't
#--------------------------------------------------------------

#...............
# strsplit 
#...............

# strsplit will split up each value in a 
# character vector into multiple values.
#
# IMPORTANT: The return value of strsplit is a LIST.
?strsplit

# multiple values in the original vector
people = c("Cohen,Sam","Jones,Bob","Andrews,Claire")
people
length(people) 
splitPeople <-strsplit(people,",")
splitPeople
# print the first name (i.e. the 2nd position) for "Andrews,Claire"
splitPeople[[3]][2]


# use a colon as a separator
places <- c("New York:NY:USA", "Jerusalem::IL", "LA:CA:USA", "Miami:FL:USA")
places
strsplit(places, ":")

# Note that strsplit returns a LIST even if there is only one 
# value in the character vector
fruit = c("apple,orange,pear")
fruit
length(fruit)
splitFruit <- strsplit(fruit,   ",")
splitFruit
# display just the 2nd fruit (notice the [[double-brackets]][single-brackets])
splitFruit[[1]][2]


# If the separator is the "empty string" (i.e. "") then 
# every character (e.g. letter, digit, space,!,@,#,$,%, etc)
# is split into separate character values
words = c("racecar", "pineapple", "cart")
strsplit(words,"")


# Remember that strsplit returns a list EVEN if there
# is only one character value being split. You will need to 
# keep this in mind when writing the code.
word <- "racecar"
y <- strsplit(word,"")
y
y[1]       # still a list 
y[[1]]     # the vector without the surrounding list
unlist(y)  # the vector without the surrounding list

            
# display the 2nd letter of the word
y[[1]][2]    # one way
unlist(y)[2] # another way
z <- y[[1]]  # you could use a variable
z[2]

#.........................................................
#
# Let's get back to coding the isPalindrome function ...
#
#    ... first let's do it with a while loop
#
#.........................................................

isPalindrome <- function(x) {
  if (!is.character(x) | length(x) !=1){
    stop("x must have a single character value")
  }
  
  lets <- strsplit(x, "")[[1]]   # get the individual letters in a vector
  
  left  = 1
  right = length(lets)
  
  while ( left < right) {
    if(lets[left] != lets[right]){
      return(FALSE)
    }
    left = left + 1
    right = right - 1
  }
  
  return(TRUE)
}

isPalindrome("abcdxba")  # FALSE
isPalindrome("abcdcba")  # TRUE
isPalindrome("racecar")  # TRUE
isPalindrome("amanaplanacanalpanama")  # TRUE

isPalindrome("a man a plan a canal panama")  # FALSE - because of the spaces

#.........................................................
# Rewrite the function so that it removes spaces before
# checking to see if x is a palindrome
#.........................................................
isPalindrome <- function(x) {
  if (!is.character(x) | length(x) !=1){
    stop("x must have a single character value")
  }
  
  lets <- strsplit(x, "")[[1]]
  
  lets <- lets [ lets != " " ]  # get rid of the spaces from lets
  
  left  = 1
  right = length(lets)
  
  while ( left < right) {
    if(lets[left] != lets[right]){
      return(FALSE)
    }
    left = left + 1
    right = right - 1
  }
  
  return(TRUE)
}

isPalindrome("a man a plan a canal panama")  # TRUE

#................................................
#
# Rewrite the code to use a for loop
#
#................................................

isPalindrome <- function(x) {

  if (!is.character(x) | length(x) !=1){
    stop("x must have a single character value")
  }
  
  lets <- strsplit(x, "")[[1]]   # get the individual letters in a vector
  
  # get rid of the spaces from lets
  lets <- lets [ lets != " " ]

  for ( num in 1:trunc(length(lets)/2) ){
    # note: num will start at 1, then 2, then 3, up until 1/2 the length of the word
    # exmpale: for "racecar" num will be 1 then 2 then 3 then stop
    first = num
    last = length(lets)-num+1
    if( lets[first] !=  lets[last]){
      return(FALSE)
    }
  }
  return(TRUE)  
  
}

isPalindrome("abcdxba")  # FALSE
isPalindrome("abcdcba")  # TRUE
isPalindrome("racecar")  # TRUE
isPalindrome("amanaplanacanalpanama")  # TRUE

isPalindrome("a man a plan a canal panama")  # TRUE


