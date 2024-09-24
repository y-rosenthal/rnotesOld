rm(list = ls())   # start from scratch

##############################################################################.
#
#      lapply ( SOME_LIST , SOME_FUNCTION )     ####
#
#
# The lapply function is used to "apply" a function to every entry in a list.
#
# The function is run as many times as there are entries in the list.
# 
# lapply returns a list that contains the return values from each of the
# times the function was called. 
#
# The "l" in "lapply" stands for "list", i.e. the return value of the 
# "lapply" function is a list. There are other similar functions
# such as sapply, mapply and apply that have slightly different ways 
# of working. For now we will just focus on "lapply". Later in the course
# we will learn about "sapply" and perhaps "mapply" and "apply".
#
# (see the examples below)
#
##############################################################################.

# create a list
gradebook = list(grades=c(80,85,72,95,100,89,65,84), 
                 students=c("joe","sue","bob","al","frank","mike","anne","clara"),
                 honors=c(FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE))
gradebook

#-----------------------------------------------------------------------.
# Some built-in functions 
# 
# We'll use the following functions to help explain the lapply and sapply functions
#
#   length(SOME_VECTOR_OR_LIST) returns the number of items in the vector or the list
#   range(SOME_VECTOR) - returns c( min(SOME_VECTOR) , max(SOME_VECTOR))
#   summary(SOME_OBJECT) - returns a summary of what is in SOME_OBJECT
#-----------------------------------------------------------------------.


# length returns the number of items in a vector (or in a list)
length( gradebook$grades )     # 8
length( gradebook$students )   # 8
length( gradebook$honors )     # 8

# range returns min and max of the vector
range( gradebook$grades)     # 65   100
range( gradebook$students)   # "al" "sue"
range( gradebook$honors)     #   0   1


# summary returns a short summary of data.
# different results for different types of data.

summary( gradebook$grades )    # see output below

#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 65.00   78.00   84.50   83.75   90.50  100.00 

summary( gradebook$students )   # see output below

# Length     Class      Mode 
#      8 character character 

summary( gradebook$honors )    # see output below

#    Mode   FALSE    TRUE 
# logical       5       3 

#-----------------------------------------------------------------------.
# lapply ( SOME_LIST , SOME_FUNCTION )
# 
# The lapply function takes two arguments:
#   X   - a list
#   FUN - the name of a function.
#
# lapply returns a new list that contains a many entries as there 
# were in the list X. Each entry in the new list contains the results
# of "applying" the function X to an entry of the original list, X.
#
#    EXAMPLE:
#      > lst = list( c(10,20,30),           # length of this is 3
#                    c("apple", "orange"))  # length of this is 2
#
#      > lapply(X=lst, FUN=length) # list of 3 and 2
#      [[1]]
#      [1] 3
#      
#      [[2]]
#      [1] 2
#-----------------------------------------------------------------------.


#........................................
# EXAMPLE 1 - lapply(gradebook, length)
#........................................

# Use the lapply function to automatically apply the length function to 
# each of the items in the gradebook list.
# This returns a new list that contains all of the results.

lapply(gradebook, length)   # see results below

# $grades
# [1] 8
#
# $students
# [1] 8
#
# $honors
# [1] 8


# lapply returns a list of the answers
mode(lapply(gradebook, length))  # "list"


#........................................
# EXAMPLE 2 - lapply(gradebook, range)
#........................................

# Show the results of the range function on each of the items in the list
range(gradebook$grades)     #  65   100
range(gradebook$students)   # "al" "sue"
range(gradebook$honors)     #   0   1

# apply range function to all items in the gradebook list

lapply(gradebook, range)   # see results below

# $grades
# [1]  65 100
# 
# $students
# [1] "al"  "sue"
# 
# $honors
# [1] 0 1



#........................................
# EXAMPLE 3 - lapply(gradebook, summary)
#........................................

# summary returns a short summary of data.
# different results for different types of data.
summary( gradebook$grades )    # see output below
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 65.00   78.00   84.50   83.75   90.50  100.00 

summary( gradebook$students )   # see output below
# Length     Class      Mode 
#      8 character character 

summary( gradebook$honors )    # see output below
#    Mode   FALSE    TRUE 
# logical       5       3 

# apply summary function to all items in the gradebook list
lapply(gradebook, summary)   # all of the above results in a single list


# apply mode function to all items in the gradebook list
lapply(gradebook, mode)   # all of the above results in a single list

#---------------------------------------------------------------------------.
# lapply also works with nested lists
# (i.e. lists that contain other lists)
#---------------------------------------------------------------------------.


rm(list = ls())

classes = list( year = 2021,
                semester = "fall",
                section1 = list ( students = c("abe","bob","charlie"),
                                  test1 = c(70,80,90),
                                  test2 = c(75,85,95)),
                section2 = list( students = c("fran", "anne", "sue", "bertha", "maxine"),
                                 test1 = c(100,90,80,70,60),
                                 test2 = c(95,85,75,65,55),
                                 test3 = c(93,83,73,63,53)) )

length(classes)   # 4  (classes contains 4 objects)

lapply(classes, length) # a list that contains 1,1,3,4, i.e. the length of each object in classes

# remember the str function is very helpful for seeing the structure of complex lists
str(classes)

#-----------------------------------------------------------------------.
# NAMED LISTS WITH lapply VS UNNAMED LISTS
#
# The return value of lapply will be a named list only if the
# original list has names.
#-----------------------------------------------------------------------.


hasNames = list( fruit=c("apple","orange","pear","plum"),
                 evens=seq(2,10,by=2),
                 odds=seq(1,30,by=2),
                 someLogicals=c(TRUE,FALSE,TRUE))
hasNames
str(hasNames)
length(hasNames)
lapply(hasNames, length)
lapply(hasNames, range)
lapply(hasNames, summary)


noNames = list( c("apple","orange","pear","plum"),
                seq(2,10,by=2),
                seq(1,30,by=2),
                c(TRUE,FALSE,TRUE))
noNames
str(noNames)
length(noNames)
lapply(noNames, length)
lapply(noNames, range)
lapply(noNames, summary)




######################################################################.
# 2022 WILF - UP TO HERE - AFTER CLASS 17
######################################################################.



############################################################.
#   using custom functions with lapply
#
# You can use any function that contains one argument 
# with lapply, even your own custom functions
############################################################.


stuff = list(grades = c(70,80,95,88,60),
             students = c("larry", "zeke","charlie","yaakov","abe"),
             age = c(17,23,20,20,21,19))

# define a function to find the 2nd largest value in a vector
secondLargest = function( vec ){
 sort(vec)[length(vec)-1]
}

# Test the function
nums = c(10,1000,900,-55,23)
secondLargest(nums)   # 900

# Example - use our function the vectors in the list, stuff
secondLargest( stuff$grades)    # 88
secondLargest( stuff$students)  # "yaakov"
secondLargest( stuff$age)       # 21

# Use our custom function with lapply to automatically apply the function
# to all entries in the list, stuff

lapply( stuff, secondLargest)    # list of the answers


###########################################.
# functions defined in one line
#
# If a function only needs one line of code
# the {curly braces} aren't required. 
###########################################.

# Another way to define the second largest function - all in one line 
# (you don't the the {curly braces})
secondLargest = function ( vec ) sort(vec)[length(vec)-1]

# Test the function
nums = c(10,1000,900,-55,23)
secondLargest(nums)


###########################################.
# functions defined in one line
#
# If a function only needs one line of code
# the {curly braces} aren't required. 
###########################################.



# create a list
gradebook = list(grades=c(80,85,72,95,100,89,65,84), 
                 students=c("joe","sue","bob","al","frank","mike","anne","clara"),
                 honors=c(FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE))
gradebook

# If you want to define a function just to use with lapply you
# can define it directly in the call to lapply


# Use the secondLargest function we defined above
lapply(gradebook, secondLargest)   # we defined gradebook above

# This also works
lapply(gradebook, function ( vec ) {
 sort(vec)[length(vec)-1]
})

# So does this
lapply(gradebook, function ( vec ) sort(vec)[length(vec)-1] )




# You can capture the output of lapply in a variable if you like
answers = lapply(gradebook, function ( vec ) sort(vec)[length(vec)-1] )

answers

answers$students

answers[[1]] 

mode(answers)   # "list"


#------------------------------------------------------------------------.
# QUESTION
#
# stuff is a list.
# Write a single line of code that returns the number of 
# numeric vectors that are contained in a single list.
#
# HINT: Use the is.numeric function, lapply and unlist
#
# EXAMPLE
#
#   > stuff = list(c(100,200,300), 
#                 c("apple", "orange", "pear"), 
#                 seq(10,100,by=5),
#                 c(TRUE, FALSE))
#
#   > YOUR CODE GOES HERE
#   [1] 2
#------------------------------------------------------------------------.

# Setup the data
stuff = list(c(100,200,300), 
             c("apple", "orange", "pear"), 
             seq(10,100,by=5),
             c(TRUE, FALSE))
stuff

# ANSWER
sum( unlist( lapply(stuff, is.numeric) )  )

# Or you can break up into multiple lines to make it easier to read.
sum( 
 unlist( 
  lapply(stuff, is.numeric) 
 )  
)



#------------------------------------------------------------------------.
# QUESTION
# 
# stuff is a list.
# Write a single line of code that creates a new variable,
# named numericStuff, that contains just a new list with 
# just the numeric vectors from stuff.
#
# EXAMPLE:
# > stuff = list( seq(10,20,length.out=4) ,   # numeric
#                 NULL,                       # NULL
#                 c("apple", "orange"),       # character
#                 rep(5, 3),                  # numeric
#                 1:4 > pi,                   # logical
#                 NULL,                       # NULL
#                 paste0(letters[1:5], 1:5),  # character
#                 2 ^ (1:5) )                 # numeric
#
# > numericStuff = YOUR CODE GOES HERE
#
# > numericStuff
# [[1]]
# [1] 10.00000 13.33333 16.66667 20.00000
# 
# [[2]]
# [1] 5 5 5
# 
# [[3]]
# [1]  2  4  8 16 32
#------------------------------------------------------------------------.

# ANSWER

stuff = list( seq(10,20,length.out=4) ,   # numeric
              NULL,                       # NULL
              c("apple", "orange"),       # character
              rep(5, 3),                  # numeric
              1:4 > pi,                   # logical
              NULL,                       # NULL
              paste0(letters[1:5], 1:5),  # character
              2 ^ (1:5))                  # numeric

stuff

numericStuff = stuff [        # ANSWER
 unlist ( 
  lapply(stuff, is.numeric) 
 ) 
] 

numericStuff

#------------------------------------------------------------------------.
# QUESTION
# 
# (see previous question)
# Same idea as previous question, but this time create a vector
# called someStuff that contains just the logical and numeric vectors
# from stuff. 
#
# HINT: one way to do this is to create a custom function that
#       takes a single argument. The custom function should
#       return TRUE if the argument contains a numeric or a logical vector
#       and FALSE otherwise.
#
# EXAMPLE:
# > stuff = list( seq(10,20,length.out=4) ,   # numeric
#                 NULL,                       # NULL
#                 c("apple", "orange"),       # character
#                 rep(5, 3),                  # numeric
#                 1:4 > pi,                   # logical
#                 NULL,                       # NULL
#                 paste0(letters[1:5], 1:5),  # character
#                 2 ^ (1:5) )                 # numeric
#
# > someStuff = YOUR CODE GOES HERE
#
# > someStuff
# [[1]]
# [1] 10.00000 13.33333 16.66667 20.00000
# 
# [[2]]
# [1] 5 5 5
# 
# [[3]]
# [1]  2  4  8 16 32
#------------------------------------------------------------------------.

# ANSWER

# setup some data
stuff = list( seq(10,20,length.out=4) ,   # numeric
              NULL,                       # NULL
              c("apple", "orange"),       # character
              rep(5, 3),                  # numeric
              1:4 > pi,                   # logical
              NULL,                       # NULL
              paste0(letters[1:5], 1:5),  # character
              2 ^ (1:5))                  # numeric

stuff


# STEP 1
# Create a function that returns TRUE if the arguemnt is either logical or numeric
isLogicalOrNumeric = function( something ){
 is.logical(something) | is.numeric(something)
}

# STEP 2 - use the function with lapply
tfList = lapply(stuff, isLogicalOrNumeric)   # list of TRUE/FALSE values
tfList 

# STEP 3 - unlist the results to get a vector
tfVector = unlist ( tfList )  # vector of TRUE/FALSE values
tvVector

# STEP 4 - use the logical vector to get just the logical and numeric entries in the list
someStuff = stuff[tfVector]

# ALL STEPS TOGETHER IN ONE COMMAND 
# You can create an "anonymous" function directly in the call to lapply.
someStuff = stuff [       
 unlist ( 
      lapply(stuff,  function (something) is.logical(something)|is.numeric(something) 
  )
 ) 
] 

someStuff

###
### END OF FILE
### INFORMATION BELOW IS NOT FINISHED
### 


#------------------------------------------------------------------------.
# QUESTION
# 
# Write a function called modeCount. The function
# takes a single argument, lst, which is a list.
# The function returns a named vector that contains
# the number of entries in the lst that of each of the 
# following modes: character, logical, numeric, list, NULL.
#
# EXAMPLE:
# > stuff = list( seq(10,20,length.out=4) ,   # numeric
#                 NULL,                       # NULL
#                 c("apple", "orange"),       # character
#                 rep(5, 3),                  # numeric
#                 1:4 > pi,                   # logical
#                 NULL,                       # NULL
#                 paste0(letters[1:5], 1:5),  # character
#                 2 ^ 1:5)                    # numeric
#
# > YOUR CODE GOES HERE

#------------------------------------------------------------------------.


stuff = list( seq(10,20,length.out=4) ,      # numeric
              NULL,                       # NULL
              c("apple", "orange"),       # character
              rep(5, 3),                  # numeric
              1:4 > pi,                   # logical
              NULL,                       # NULL
              paste0(letters[1:5], 1:5),  # character
              2 ^ 1:5)                    # numeric

sum ( unlist ( lapply(stuff, is.numeric) ) )

# > stuff
# [[1]]
# [1] 10.00000 13.33333 16.66667 20.00000
# 
# [[2]]
# NULL
# 
# [[3]]
# [1] "apple"  "orange"
# 
# [[4]]
# [1] 5 5 5
# 
# [[5]]
# [1] FALSE FALSE FALSE  TRUE
# 
# [[6]]
# NULL
# 
# [[7]]
# [1] "a1" "b2" "c3" "d4" "e5"
# 
# [[8]]
# [1] 2 3 4 5



