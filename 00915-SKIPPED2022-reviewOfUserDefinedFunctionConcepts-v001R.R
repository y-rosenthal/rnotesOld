########################################################################
# Review of
#
# - assigning values to variables
#
# - "local variables and arguments" vs global variables 
# 
# - how function calls work
#
# - how functions return values
#
# - using cat in a function vs returning a value from a function
########################################################################


#-----------------------------------------------------------------------------
# Results are NOT displayed when they are assigned to a variable - REMEMBER THIS! 
#-----------------------------------------------------------------------------

3 + 2     # This DOES display the result, ie. 5

num = 3+2   # This does NOT display the result. The result is in the answer variable

num 



#-----------------------------------------------------------------------------
# "function definition"  vs  "function call"
#-----------------------------------------------------------------------------
# A function "definition" is the code that tells R what to do when the function
# is "called" (i.e. used)
#
# A function "call" is a specific use of a function. For example:
# The following are all function calls to some built in functions:
#
#    > # a single "function call" to the function sum
#    > sum(1,2,3)                
#
#    > # two different "calls" to function sum   
#    > sum(1,2,3) * sum(4,5,6)  
#
#-----------------------------------------------------------------------------

# The following is the "definition" of a "user defined function".
# Nothing actually "happens" until the function is 'called' (see below)

addAndMultiply = function(x,y,z){
  answer = x+y
  answer = answer * z
  return(answer)   # you actually don't need the "return" - the last line is automatically returned
}

# Call the function
addAndMultiply(1,2,3)

# Call the function (using different arguments)
addAndMultiply(4,5,6)

# The following contains two different calls to the same function
addAndMultiply(1,2,3) / addAndMultiply(4,5,6)


#---------------------------------------------------------------------------
# If you type the name of a function without the (parentheses), R will
# display the code for the function definition
#---------------------------------------------------------------------------

# Display the code for the function definition
addAndMultiply

# Call the function with specific argument values.
addAndMultiply(1,2,3)

# REMEMBER - if you assign the value to a variable you will NOT see the result

num = addAndMultiply(4,5,6) 

# REMEMBER - you don't see any result on the screen until you display the value
# of the variable
num



#---------------------------------------------------------------------------
# More terminology 
#
# global variables    vs     local variables
#---------------------------------------------------------------------------

#...............................................................
# WHAT IS A LOCAL VARIABLE?
#...............................................................
# A variable that is assigned a value inside of a user defined 
# function definition is known as a "local variable".
#
# Local variables can be accessed only inside the function in which they 
# are "created". A local variable is "created" when it is given a value
#...............................................................

rm(list = ls())   # start from scratch

myfunction = function() {
  myvalue = 99          # myvalue is a LOCAL variable
  return(myvalue + 1)
}

myfunction()   # This returns 100

# myvalue is a local variable. It cannot be used 
# outside of the function in which it is defined.

myvalue   # ERROR


#...............................................................
# WHAT IS A GLOBAL VARIABLE?
#...............................................................
# A variable that is assigned a value outside of any user defined 
# function definition is known as a "GLOBAL variable".
#
# GLOBAL variables can be accessed anywhere - both inside 
# function definitions and outside of function definitions
#...............................................................

rm(list = ls())   # start from scratch

x = 1             # x is a global variable

addOne = function(){
  y = 1           # y is a local variable
  x = x + 1       
  y = y + 1       
  return(c(x, y))  # return the new x and the new y
}

addOne()
x   # 2  The global variable, x, was changed inside of the function

y   # ERROR - y was a local variable, you cannot refer to it here

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
# NOTE:
# It doesn't matter in what order you define the function and the variables.
# The following produces the exact same results as above.
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 

rm(list = ls())   # start from scratch

addOne = function(){
  y = 1           # y is a local variable
  x = x + 1       
  y = y + 1       
  return(c(x, y))  # return the new x and the new y
}

x = 1             # x is a global variable
addOne()
x   # 2  The global variable, x, was changed inside of the function
y   # ERROR - y was a local variable, you cannot refer to it here


#...............................................................
# A local variable with the same name as a global variable
# "hides" the global while the function is being executed.
#...............................................................
rm(list = ls())   # start from scratch

num = 1             # num is a global variable

addOne = function(){
  num = 100     # this is a "different" num. This num is a local variable
  num = num +1  # add one to the local variable, num. The global variable num is "hidden".
  return(num)   # returning 101
}

addOne()

# We are no longer in the function definition so the following num
# once again refers to the global variable, num, and displays 1.
num   # 1


# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
# NOTE:
# It doesn't matter in what order you define the function and the variables.
# The following produces the exact same results as above.
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 

rm(list = ls())   # start from scratch

addOne = function(){
  num = 100     # this is a "different" num. This num is a local variable
  num = num +1  # add one to the local variable, num. The global variable num is "hidden".
  return(num)   # returning 101
}

num = 1             # num is a global variable
addOne()
num   # 1


#...............................................................
# The name of an argument is similar to a local variable in that is is 
# "local" to the function and will "hide" a global variable
# that shares the same name.
#...............................................................

rm(list = ls())   # start from scratch

num = 1   # this is a global variable

addOne = function(num){  # this num is an argument. It hides the global variable, num
  num = num +1  # add one to the argument, num
  return(num)   # returning 101
}

num = 1     # this num is a global variable
addOne(100) # (a) 100 copied to the argument, num (b) the function returns 101
num         # 1 since this is the global variable, num.


#---------------------------------------------------------------------------
# More terminology ... arguments are "passed" to a function
#
# global vs local variables
#---------------------------------------------------------------------------

num = 10   # this is a global variable.

f = function( a ){
  a = 3
  return(a)
}

# The names in the (parentheses) on the first line of a function DEFINITION
# are called "formal argument names". These are just like variables
# in that they can hold values. When



# When you call a function the values that are specified in the 
# "function call" are COPIED into the arguments.
# the value in num is copied into a
answer = f(num) 

answer   # this is the value that was "returned"

num      # num was a global variable. It didn't change


#--------------------------------------------------------------------------
# debugonce( SOME_FUNCTION_NAME ) 
#--------------------------------------------------------------------------
# When you call debugonce R knows that the next time that the function is
# called, R should start the debugger. Once that function call is finished
# R will NOT start the debugger again, unless you call debugonce again.
#
# NOTE that you DO NOT use the parentheses for the specified function when 
# calling debugonce (see the example below)
#--------------------------------------------------------------------------

# Tell R to start the debugger when we next call addAndMultiply
debugonce(addAndMultiply)      # there are NO parentheses after addAndMultiply

# We can do anything else at this point
mean(c(10,20,30,40))
?rep
sum(mean(c(10,20,30,40)), mean(c(10,20,30,40)))
# etc ...


# Eventually when you call addAndMultiply, the debugger will start ...
addAndMultiply(1,2,3)


# The next time you call addAndMultiply - the debugger does NOT start
addAndMultiply(4,5,6)

#--------------------------------------------------------------------------
# debug( SOME_FUNCTION_NAME )      
# ...
# undebug( SOME_FUNCTION_NAME )
#--------------------------------------------------------------------------
# 
# WARNING ... I do NOT recommend that you use debug/undebug unless you 
# understand how to use it. Read and understand the following info 
# before you use debug/undebug!
#
# When you call debug, you are in effect asking R to start the debugger
# EVERY TIME that the specified funciton is called ... until you 
# call undebug. This can be very confusing if you forget to call undebug.
#--------------------------------------------------------------------------

# Example:

debug (addAndMultiply)    # there are NO parentheses after addAndMultiply

# Any time in the future that you call addAndMultiply, the debugger will start

# We can do anything else at this point
mean(c(10,20,30,40))
?rep
sum(mean(c(10,20,30,40)), mean(c(10,20,30,40)))
# etc ...


# Eventually when you call addAndMultiply, the debugger will start ...
addAndMultiply(1,2,3)


# This keeps happening every time you call addAndMultiply
addAndMultiply(4,5,6)


# This keeps happening every time you call addAndMultiply
addAndMultiply(7,8,9)


# To stop the debugger from starting every time you call addAndMultiply
# you must call undebug

undebug(addAndMultiply)      # there are NO parentheses after addAndMultiply


# Now the debugger will NOT start

addAndMultiply(10,11,12)



#--------------------------------------------------------------------------
# A function will return either the value of the last line 
# (or the value that is explicitly returned with the return statement)
#--------------------------------------------------------------------------

# return double what was passed
doubleIt = function( x ){
  twoTimesX = 2*x
  twoTimesX          # last line is automatically returned
}

# same thing
doubleIt_version2 = function( x ){
  twoTimesX = 2*x
  return(twoTimesX)   # use return command to explicitly return a value
}


doubleIt(c(10,30,100))
doubleIt_version2( c(10,20,30) )   # same results
  

#--------------------------------------------------------------------------
# Before we continue, let's define some functions that will be used 
# in the examples below.
#--------------------------------------------------------------------------


# This is the same as above. I'm just repeating it here so you don't
# forget about it.
addAndMultiply = function(x,y,z){
  answer = x+y
  answer = answer * z
  return(answer)   # you actually don't need the "return" - the last line is automatically returned
}


doubleIt = function( x ){
  twoTimesX = 2*x
  twoTimesX        # return the value
}

#--------------------------------------------------------------------------
# When you run a command the following happens:
#
# 1. R figures out function calls need to be done.
#
#    EXAMPLE: In the following command there are three different 
#    function calls
#    different
# 
# 2. If your command contains two (or more) function calls
#    then R works with each function call separately, one at a time.
#
# 2. R calls a function
# ...
# undebug( SOME_FUNCTION_NAME )
#--------------------------------------------------------------------------
