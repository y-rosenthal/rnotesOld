# Practice Questions - TOPIC: loops

```{r}
### QUESTION 4

# Write a function named, rollDice that simiulates the rolling of one or more dice. 
# The function should take a single argument, numberOfDice that indicates the number of dice being thrown. 
# numberOfDice is expected to be a positive whole number. If it is not then the function should stop and display an error message.
# The function should return a vector of random whole numbers. The value of each number should be randomly chosen to be  1,2,3,4,5 or 6.  There should be as many numbers in the vector as indicate by the argument numberOfDice.
#
# For example:
#   > rollDice(1)
# [1] 3
# 
# > rollDice(1)
# [1] 6
# 
# > rollDice(2)
# [1] 2 4
# 
# > rollDice(2)
# [1] 6 1
# 
# > rollDice(5)
# [1] 6 3 3 4 6
# 
# > rollDice(5)
# [1] 4 4 2 6 5
# 
#
# PART A 
#
#   Use the sample function to write rollDice.
#
#
# PART B
#
#   Instead of the sample function, use the runif function (see ?runif).
#   Set the min and max arguments of runif to 1 and 7 respectively. 
#   Then use the trunc function to remove the decimal points from the
#   values that runif returns. Using this approach it will be 
#   impossible for the code to result in anything other than
#   1,2,3,4,5 or 6. runif will NOT generate a 7 since
#   the documentation for runif says the following:
#   
#       runif will not generate either of the extreme values unless 
#       max = min or max-min is small compared to min, and in particular 
#       not for the default arguments.
# 
#   Therefore once you truncate the result that you get from runif you
#   will be left with numbers that are either 1,2,3,4,5 or 6.
#
#
# PART C (THINKING DEEPER)
#
#   If you follow the hints above, for part B, the resulting rollDice function, 
#   is not 100% "fair". Note that according to the documentation mentioned above 
#   if you specify min as 1 and max as 7, then runif will never generate 7.0000 
#   or 1.00000. Therefore, technically, the result of your rollDice function 
#   would be very slightly less likely to generate 1s than other numbers.  
#   Think about how you could theoretically fix this - One way is that you could set 
#   min to 0 (zero) and max to 7 and then truncate the result with trunc. 
#   If you get a zero, you keep repeating this process until you got a 
#   number that wasn't 0. 



############.
# ANSWER
############.

rollDice <- function(numDice){
  trunc(runif(numDice, min=1, max=7))
}

rollDice(1)
rollDice(1)
rollDice(2)
rollDice(2)
rollDice(5)
rollDice(5)






### QUESTION 5

# Write a function named keepRollingUntilSnakeEyes. 
# The function should not take ANY parameters. 
# The function should keep calling rollDice(2) inside of a loop to 
# simulate multiple rolls of two dice. 
# The loop should stop when the roll is two ones (i.e. "snake eyes"). 
# The function should display the values each roll as shown below. 
# The function should return the total number of rolls that were made. 
# See the examples below. 
# Note that in the first two examples below, the last value displayed is the 
# value that is "returned".  
# In the third example below, the return value is captured in a variable 
# and is displayed in a separate command.  (also see the next question). 
# 
# HINTS: 
#   a.  Use the cat function to display the messages.
#   b.  Use a variable to keep track of how many rolls took place
#   c.  keep looping until you get a 1 and a 1
# 
# EXAMPLES: 
# 
#   > keepRollingUntilSnakeEyes() # return value appears after all the messages
#   roll #1 was: 2 and 1
#   roll #2 was: 3 and 5
#   roll #3 was: 6 and 5
#   roll #4 was: 4 and 1
#   roll #5 was: 5 and 5
#   roll #6 was: 6 and 1
#   roll #7 was: 2 and 3
#   roll #8 was: 6 and 3
#   roll #9 was: 5 and 4
#   roll #10 was: 6 and 3
#   roll #11 was: 6 and 3
#   roll #12 was: 4 and 5
#   roll #13 was: 4 and 1
#   roll #14 was: 4 and 2
#   roll #15 was: 1 and 1
#   [1] 15
#   
#   > keepRollingUntilSnakeEyes()  # return value appears after all messages
#   roll #1 was: 1 and 1
#   [1] 1
#   
#   > numRolls <- keepRollingUntilSnakeEyes() # return value captured in numRolls
#   roll #1 was: 2 and 1
#   roll #2 was: 4 and 3
#   roll #3 was: 3 and 6
#   roll #4 was: 3 and 6
#   roll #5 was: 4 and 3
#   roll #6 was: 6 and 4
#   roll #7 was: 6 and 2
#   roll #8 was: 3 and 2
#   roll #9 was: 4 and 1
#   roll #10 was: 1 and 1
#   
#   > numRolls  # This is the value that was returned from the function
#   [1] 10


############.
# ANSWER
############.

keepRollingUntilSnakeEyes <- function(){
  
  roll <- rollDice(2)
  rollnum <- 1
  cat("roll #", rollnum, " was: ", roll[1], " and ", roll[2], "\n", sep="")
  
  while (roll[1] != 1 || roll[2] != 1){
    roll <- rollDice(2)
    rollnum <- rollnum + 1
    cat("roll #", rollnum, " was: ", roll[1], " and ", roll[2], "\n", sep="")
  }
  
  rollnum  
}

numRolls <- keepRollingUntilSnakeEyes()
numRolls




### QUESTION 6

keepRollingUntilSnakeEyes <- function(showOutput = FALSE){
  
  roll <- rollDice(2)
  rollnum <- 1
  if(showOutput){
    cat("roll #", rollnum, " was: ", roll[1], " and ", roll[2], "\n", sep="")
  }
  
  while (roll[1] != 1 || roll[2] != 1){
    roll <- rollDice(2)
    rollnum <- rollnum + 1
    if(showOutput){
      cat("roll #", rollnum, " was: ", roll[1], " and ", roll[2], "\n", sep="")
    }
  }
  
  rollnum
}


keepRollingUntilSnakeEyes()        # this will not show output
keepRollingUntilSnakeEyes(showOutput = FALSE)  # nor will this
keepRollingUntilSnakeEyes(FALSE)               # nor will this
keepRollingUntilSnakeEyes(TRUE)    # this WILL show output
keepRollingUntilSnakeEyes(showOutput = TRUE) # this WILL show output



### QUESTION 7

playManyTimes <- function(n) {
  answer <- numeric()
  for(num in 1:n){
    answer <- c(answer, keepRollingUntilSnakeEyes())
  }
  answer
}

playManyTimes(3)
playManyTimes(10)
results <- playManyTimes(10000)
h <- hist(results)
h
sum(h$counts)



### QUESTION 8

playCraps <- function(showOutput = FALSE){
  rollNumber <- 1
  point <- sum(rollDice(2))
  if(showOutput) cat("roll #", rollNumber, ": ", point, "\n", sep="")
  
  if(point == 7 || point == 12){
    if(showOutput)  cat("WIN\n\n")
    
    return(TRUE)
  } else if (point %in% c(2,3,12)){
    if(showOutput)  cat("LOSE\n\n")
    return(FALSE)
  } else {
    
    while(TRUE) {
      roll <- sum(rollDice(2))
      rollNumber <- rollNumber + 1
      if(showOutput) cat("roll #", rollNumber, ": ", roll, "\n", sep="")
      
      
      if(roll == 7){
        if(showOutput)  cat("LOSE\n\n")
        return(FALSE)
      } else if ( roll == point) {
        if(showOutput)  cat("WIN\n\n")
        return(TRUE)
      }
    }    
  }
}

playCraps(TRUE)
playCraps(TRUE)
playCraps(TRUE)
playCraps(TRUE)
playCraps()


### QUESTION 9

playCrapsManyTimes <- function(n) {
  answer <- logical()
  for (num in 1:n){
    answer <- c(answer, playCraps(FALSE))
  }
  answer
}
results <- playCrapsManyTimes(100000)
mean(results)
```
