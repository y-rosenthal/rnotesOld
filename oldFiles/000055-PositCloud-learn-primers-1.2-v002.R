# This file contains OPTIONAL material.
# You do NOT have to use this file at all. 
# Keep reading for more info about what this file contains.


#######################################################
#######################################################
##
## Using https://posit.cloud
## 
#######################################################
#######################################################

# https://posit.cloud hosts an online version of the RStudio program.
# You can get started simply with the "free" plan. 
# It should be pretty easy to figure out how to do that 
# by navigating to https://posit.cloud

# When you login to posit.cloud you should create a "New RStudio Project".
# You can then use that project for all of your R work.

# posit.cloud also has several tutorials (i.e. "primers").
# You can get to these by clicking the "primers" button.
# The first primer is called "The Basics".
# "The Basics" primer is divided into "Visualization Basics"
# and "Programming Basics".
# This class will focus on programming, not visualization.

# The code below is adapted from the "Programming Basics"
# section of "The Basics" primer on posit.cloud.
# Feel free to use the code below to practice what 
# you learned by going through this material.


##------------------------------------------------------.
## Note that instead of using Posit.cloud you could 
## also/instead install R and RStudio on your computer.
##------------------------------------------------------.
## How to install R and RStudio
## See this for an interactive tutorial:
## https://learnr-examples.shinyapps.io/ex-setup-r/#section-install-r
## The basic info is below

# STEP 1
#
# Install R from here
# cloud.r-project.org

# STEP 2 - You MUST do STEP 1 first
# Install RStudio from here
# www.rstudio.com

# The instructions in the interactive tutorial describe how to \
# install "packages".
# We will not be installing packages yet.


#######################################################
#######################################################
##
## The info below contains code related to this tutorial
## https://posit.cloud/learn/primers/1.2
##
#######################################################
#######################################################



#########################################
# Functions
#########################################

# https://posit.cloud/learn/primers/1.2

factorial(4)   # returns 24

# see the underlying code of the function
factorial

# see the "help" page for the function
?factorial

#-----------------------------------------.
# QUESTION
# Find the square root of 962 by using the
# sqrt function.
#-----------------------------------------.

#-----------------------------------------.
# QUESTION
#
# Show the code that sqrt() runs.
#-----------------------------------------.

#-----------------------------------------.
# QUESTION
#
# Show the code that lm() runs.
#-----------------------------------------.

#-----------------------------------------.
# QUESTION
#
# What is lm used for?
#-----------------------------------------.




########################################
# Arguments (also known as Parameters)
########################################

Sys.Date()  # CAPITAL "S" and CAPITAL "D"
# The above function has no "arguments" - just parentheses after the function name

paste("Hello", "World", "!", sep=" ")
# The above function has more than one "argument" 


log(100, 10)    
# Returns:
#   2

log(10, 100)
# Returns
#   0.5

args(log)
# Returns: 
#   function (x, base = exp(1)) 
#   NULL
#
# In the output above the = sign after base means
# that base is optional. exp(1) is R's way of writing
# the special number "e" in math.

log(100)   # x is 100, base is exp(1)
log(x = 100, base = exp(1))   # same result
log(base = exp(1), x = 100)   # same result


log(x=100, base=10)   # you can specify argument names
# Returns:
#   2




# QUESTION (from prof rosenthal):
#   Explore the round function.
#
#     How many arguments does it take?
#
#     What are their names?
#
#     Show three different ways of writing code to round the value x to the 
#     nearest tenth (i.e. 6.37 would be 6.4 but 6.32 would be 6.3)
#
#     What is the shortest way to write code that rounds the value x to the
#     nearest whole number?  (i.e. 4.9342 would be 5)
#

# QUESTION (from prof rosenthal)
#     What's wrong with the following code? It was intended to generate
#     five random numbers that are each between 10 and 20.
#     Fix the code so that works correctly.
runif(5, largest=20, smallest=10 )


# QUESTION (from prof rosenthal):
#   What are the arguments of the runif function?
#
#   Which arguments are optional?
#
#   Use runif to generate 100 random values that are between 100 and 105



# QUESTION (from the website):
#   What are the arguments of the rnorm function?
#
#   Which arguments are optional?
#
#   Use rnrom() to generate 100 random normal values with a mean of 100 and
#   a standard deviation of 15.



####################################################################
# 
# Objects
#
####################################################################

num <- log(4)
num

square <- 9
sqrt(square) # 3
square       # 9

square <- 10 
square       # 10
sqrt(square) # 3.162278


# You can choose almost any name you like for an object, as long as the name
# does not begin with a number or a special character like +, -, *, /, ^, !, @, or &.



# QUESTION
#
# Save the results of rnorm(100, mean = 100, sd = 15) to an object named data. 
# Then, on a new line, call the hist() function on data to plot a histogram of 
# the random values.


#------------------------------------------------.
# Built In Data Sets
#------------------------------------------------.

iris        # this is a dataset that is included in R

?iris       # get more info about the dataset

iris <- 1   # create an object - this "hides" the data set

iris

rm(iris)    # remove the object 

iris        # now you can see the dataset


######################################################
# Vectors
######################################################

runif(1)    # one number

runif(10)   # ten numbers

c(89, 75, 92)  # a vector of 3 specific numbers

c(test1=82, test2=93, homework=85 )  # a vector with "names"

nums <- c(3,2,5)

sum(nums)        # 10

mean(nums)       # 3.333

factorial(nums)  # 6 2 120 - one answer for each value in nums - this is a "vectorized" function




# QUESTION
# Create a vector that contains the integers from one to ten.



#------------------------------------------------.
# Using the colon operator (e.g.  3:7)
#------------------------------------------------.
#
# If your vector contains a sequence of contiguous integers, you can create 
# it with the : shortcut. Run 1:10 . What do you get? 
# What do you suppose 1:20 would return?


someNumbers <- c(1, 2, 4, 8, 16)

# QUESTION
# You can extract any element of a vector by placing a pair of brackets behind
# the vector. Inside the brackets place the number of the element that you’d
# like to extract. For example, someNumbers[3] would return the third element of 
# the vector named someNumbers
#
# Write code to extract the fourth element of someNumbers


#------------------------------------------------.
# Extracting specific values by using [square brackets]
#------------------------------------------------.

# You can also use [] to extract multiple elements of a vector.
# Place the vector c(1,2,5) between the brackets below. What does R return?

vec <- c(1, 2, 4, 8, 16)
vec[]




#------------------------------------------------.
# Extracting specific values by using argument names
#------------------------------------------------.

# If the elements of your vector have names, you can extract them by name. 
# To do so place a name or vector of names in the brackets behind a vector. 
# Surround each name with quotation marks, e.g. vec2[c("alpha", "beta")].

# Extract the element named gamma from the vector below.
vec2 <- c(alpha = 1, beta = 2, gamma = 3)



#------------------------------------------------.
# Vector Recycling
#------------------------------------------------.

# Predict what the code below will return. Then look at the result.

c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) + c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)


# Predict what the code below will return. Then look at the result.
1 + c(10, 20, 30, 40)









######################################################
# Types
######################################################

nums <- c(1,4,6)    # numeric values
sum(nums)           # you can do math

fruit <- c("apple", "banana", "carrot")    # "character" values (also known as "strings")
nchar(fruit)                               # see the number of characters in each value

typeof(fruit)         # character

typeof(nums)          # double

typeof(c(1,2,3.14))   # double

typeof(c(1,2,3))      # also double

typeof(c(1L, 2L, 3L)) # integer

typeof(c(TRUE, FALSE, FALSE))  # logical

# Other types that are beyond the scope of this course
# are: complex and raw

# mode is similar to typeof (but not exactly the same)

mode(fruit)         # character

mode(nums)          # numeric

mode(c(1,2,3.14))   # numeric

mode(c(1,2,3))      # numeric

mode(c(1L, 2L, 3L)) # numeric

mode(c(TRUE, FALSE, FALSE))  # logical

#------------------------------------------
# Only ONE type to a vector
#------------------------------------------

# Vectors may only contain a single type. 
# Otherwise values are "coerced" to a single type.
c(1, TRUE, "hello")
typeof( c(1, TRUE, "hello") )   # character



#-----------------------------------------------------
# Floating point arithmetic and roundoff errors
#-----------------------------------------------------

# Why does R contain both integer and double data types? 

# You may have heard of the term "binary numbers". Without going into too 
# much detail now, this has to do with the way computers work internally.
# Internally, computers store numbers in a different way than most people 
# are used to. Instead of storing the number 5, internally, the number 5
# is actually stored as 00000101. There are reasons for this but for now, 
# just realize that computers store numbers internally differently than 
# people do. When the computer displays the number that is stored internally
# as 00000101 it displays it as 5. This whole system gets a little complicated.
# For example, numbers with decimal points are stored using a different 
# technique than integers are.

# Computers must use a finite amount of memory to store decimal numbers (which
# can sometimes require infinite precision). As a result, some decimals can only
# be saved as very precise approximations. From time to time you’ll notice side
# effects of this imprecision, like below.

#   Compute the square root of two,square the answer (e.g. multiply the square 
#   root of two by the square root of two), and then subtract two from the result. 
#   What answer do you expect? What answer do you get?

sqrt(2) * sqrt(2) - 2  # you'd expect 0 but you get: 4.440892e-16
  
# If you use data that has a typeof integer (e.g. 2L) you will not be able to 
# work with decimal points but you will not get these roundoff errors.
# However, if you want to use decimal points then you will have to realize
# that occasionally you may get some roundoff error. We may discuss in a future
# class why this happens and what you can do to avoid it from happening.



# QUESTION
# 
# Create a vector of integers from one to five. 
# Can you imagine why you might want to use integers instead of numbers/doubles?
#
# Create a vector of integers from one to five hundred. 

