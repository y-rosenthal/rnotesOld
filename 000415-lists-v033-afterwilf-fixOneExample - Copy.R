# Remove all variables to start this lesson with a clean slate
rm(list = ls())

###################################################################.
#
# TERMINOLOGY:  indexing/index   vs   subsetting/subscript
#
# In class I've been referring to code that extracts specific
# values out of a vector or out of a list as "indexing" the vector
# or the list. For example, I would refer to the following code
#
#     someVector[1:3]
#
# as "indexing" the vector and I would refer to the 1:3 in the
# code above as the "index".
#
# An alternative terminology is to describe the code as 
# performing "subsetting" of the vector and to describe the 1:3
# as a "subscript". 
#
# Both indexing/index and subsetting/subscript are valid terminology
# and are alternate ways to describe the same things. Be aware
# of this if you try to search for additional information online.
#
###################################################################.

###################################################################.
#
# OTHER SOURCES OF INFORMATION
#
# Material in this file that discusses the rules
# for "indexing" (AKA "subsetting") lists and vectors can be confusing. I tried
# to make the material straightforward but there are always situations
# that will nevertheless be confusing. These are some other sources
# of information that may help.
#
#
#   ADVANCED R, 2nd Edition by Hadley Wickham (available online)
#
#   This page: https://adv-r.hadley.nz/subsetting.html
#   from the book "Advanced R" by Hadley Wickham, describes these rules
#   in detail. At this point, you may not be familiar with all of the
#   terminology that is used on this page, but this is a good reference
#   when you are trying to figure something out. 
#
#
#   OFFICIAL R-LANGUAGE DEFINITION
#   (by the R Core Team - the people who create R)
#
#   The following is a link to the section on Indexing in the
#   "Official R Language Definition":
#
#       https://stat.ethz.ch/R-manual/R-devel/doc/manual/R-lang.html#Indexing
#
#   This material is NOT easy to read but it is the "official" word on how
#   things work in R. The authors assume that you know a lot and they do
#   not "hold your hand". It may be hard to read this material but it is
#   good to know it exists. 
#
#
#   GOOGLE  :)         (yes, I know it's obvious)
#
#   There are many many webpages and websites devoted to trying to explain R.
#   Obviously, one of the first things to do when faced with a problem you don't
#   understand is to describe the problem accurately in Google and see
#   what you find. If you get an error or warning message when you run
#   your code type the error/warning message into the search. This usually 
#   works well to find a webpage that helps to clarify things.
#
#######################################################################.

#######################################################################.
#######################################################################.
##
## TOPIC :    lists
##
##   A list is a collection of ANY R "objects"         ####
##
##   So far we learned about the following R "objects".
##     - character vectors
##     - numeric vectors
##     - logical vectors
##   These R objects (as well as other types of R objects that
##   we haven't learned about yet) can all be included in a "list".
##
##   A "list" itself, is also an R "object". Therefore a list can contain other lists. ####
##   A list that is contained in another list is called a "nested list".
##
##   You can create a list with the list function. 
##   See examples below.
##
#######################################################################.
#######################################################################.

# create some vectors
students = c("bob", "charlie", "frank")
test1 = c(70,80,90)
test2 = c(75,85,88)
honors = c(TRUE, FALSE,FALSE)

# create a list (called gradebook_MathClass) that contains all the vectors.
gradebook_MathClass = list(students, test1, test2, honors)

gradebook_MathClass

#---------------------------------------------------------------------.
# mode( SOME_LIST ) is "list"      ####
#
# So far, at this point we have seen that mode(SOME_OBJECT) can return one of the 
# following values: "numeric", "logical", "character" and "list"
#---------------------------------------------------------------------.

mode(gradebook_MathClass)    # "list"


#-----------------------------------------------------------------------------.
# A LIST CONTAINS A SEPARATE COPY OF DATA FROM VARIABLES USED TO CREATE THE LIST ####
#
# If the variables that were used to create a list are removed     
# the list continues to exist (with all the data intact).
#
# In other words, the existence of a list, is NOT dependent on the underlying
# variables, (e.g. students, test1, test2, honors) that were used to create it.
#-----------------------------------------------------------------------------.

# We can remove the variables that were used to create the list ...
rm( students, test1, test2, honors)

# ... the list, still exists
gradebook_MathClass

############################################################################.
#
# You can create a list without using any other variables. 
# Just put the information directly in the list function.
# See examples below.
#
############################################################################.

# EXAMPLE - create another gradebook without using other variables

gradebook_HistoryClass = list( c("bob", "charlie", "frank"), # student names
                               c(70,80,90),                  # grades from first test
                               c(75,85,88),                  # grades from second test
                               c(TRUE, FALSE,FALSE))         # TRUE for honors students

gradebook_HistoryClass


###############################################################################.
# The data used to create a list can be generated using ANY functions 
# not just the c() function
###############################################################################.

# EXAMPLE

stuff = list ( seq(2, 10, by=2),
               c("apple", "orange", "pear"),
               rep(c(1,2,3), 2))

stuff

###########################################################################.
#
# length( SOME_LIST )  # returns the number of objects in the list   ####
#
###########################################################################.

# There are 4 objects in the gradebook_HistoryClass list, i.e. 
#
#   - the character vector of student names
#   - the numeric vector of the test1 grades
#   - the numeric vector of the test2 grades
#   - the logical vector of honors statuses

gradebook_HistoryClass


# The length function returns the number of objects in the list.

length(gradebook_HistoryClass)  # 4


###########################################################################.
# TOOLS TO HELP YOU UNDERSTAND THE STRUCTURE OF LISTS AND OTHER OBJECTS
#
# str( SOME_OBJECT)  # shows "human readable" description of the structure of the object ####
#
# The str function shows the "structure" of an R object. 
# It provides a more "human readable" description of what an object contains.
# It is usable with any R objects (i.e. vectors, lists, dataframes and other types)
# but is especially useful when trying to understand what is inside a 
# complex list. Remember the str function. It could help you a lot
# at some point.
#
#
#
# View( SOME_OBJECT )  # (It's a CAPITAL "V" in "View") displays object in another tab ####
#
# The "View" function opens up the object in another tab in RStudio. The
# "View" tab for that object displays the contents of the object in a 
# way that is easy to see and navigate through the data in the object.
# This is especially helpful for objects that contain a lot of data.
#
#
#
# THE ">" ARROW BUTTON NEXT TO LISTS IN THE ENVIRONMENT TAB
#
# Next to lists that appear in the Environment tab in RStudio, there is a 
# small button that looks like a right pointing arrow ">". If you press
# on it, you will see the full contents of the list. This is similar
# to the output you get with the View(SOME_OBJECT) command but is 
# easier to use for small to medium sized lists. The View command may be
# easier to use for very large lists.
#
###########################################################################.

str(gradebook_HistoryClass)   # The output is shown below

# List of 4
#  $ : chr [1:3] "bob" "charlie" "frank"
#  $ : num [1:3] 70 80 90
#  $ : num [1:3] 75 85 88
#  $ : logi [1:3] TRUE FALSE FALSE




# *** READ THIS BEFORE YOU RUN THE NEXT LINE OF CODE!!! ***

# The following command will open a new "tab" in RStudio that 
# shows the contents of the gradebook_HistoryClass variable. This seems
# unnecessary for such a small set of data but the View tab can be very 
# helpful for large collections of data. To get back to reading this file
# you can close the View tab or alternatively find the tab for this
# file and click on the tab.


# Uncooment the following line to run it. I commented it so that 
# it shouldn't be run by mistake and confuse you when the new tab opens.

#View(gradebook_HistoryClass)  # A new "tab" opens in RStudio that 



# Try pressing the ">" arrow button that appears in the Environment 
# tab, next to the word "gradebook_HistoryClass" and
# you will see the full contents of the list.



############################################################################.
############################################################################.
## Indexing with [single-brackets], [[double-brackets]] and $notation
##
##   We have spent a lot of time up until now learning how to "index"
##   (i.e. to select specific values from) a VECTOR. For vectors we
##   used various forms of [single-bracket] notation to select only
##   the values we wanted. 
##
##   With lists, you can also select just the values you want using 
##   the same [single-bracket-notation]. This notation is very similar to 
##   [single-bracket-notation] as used with vectors. However, for lists, we 
##   will introduce two additional notations for selecting specific values.
##   The new notations are [[double-bracket]] notation as well as $dollar-sign notation.
############################################################################.
############################################################################.




###########################################################################.
# Indexing lists with [single-brackets] follows the same rules as
# indexing vectors with [single-brackets].
#
# You can use
#   - positive position numbers - to get JUST the values in those positions
#   - negative position numbers - to get everything except the values in those positions
#   - TRUE/FALSE values - to get just the values that correspond to the TRUE's
#
# However, 
#    with VECTORS, you get back a new VECTOR that contains just the specified values. 
#
#    with LISTS,   you get back a new LIST that contains just the specified values. 
#
# See examples below.
#
###########################################################################.

gradebook_HistoryClass



# someList[c(1,3)]   # returns a new list with objects 1 and 3 from someList ####
# EXAMPLE:
gradebook_HistoryClass[c(1,3)]   # positive position numbers



# someList[-c(1,3)]  # returns a new list with all objects from someList except for 1st and 3rd objects ####
# EXAMPLE:
gradebook_HistoryClass[-c(1,3)]  # negative position numbers




# someList[c(TRUE, FALSE,...etc)]   # returns a new list with the values from someList corresponding to TRUE positions ####
# EXAMPLE:
gradebook_HistoryClass[c(TRUE, FALSE)]  # logicals - this example uses recycling rule


#------------------------------------------------.
# Each of the examples above return a LIST
# We can prove this with the mode function
#------------------------------------------------.

mode( gradebook_HistoryClass[c(1,3)]  )         # list
mode( gradebook_HistoryClass[-c(1,3)] )         # list
mode( gradebook_HistoryClass[c(TRUE, FALSE)]  ) # list

#------------------------------------------------.
# You can assign the results to a new variable.
#------------------------------------------------.


names_and_test2 = gradebook_HistoryClass[c(1,3)]

names_and_test2

mode( names_and_test2)


###############################################################################.
###############################################################################.
## 
## INTRODUCING [[double-bracket]] NOTATION FOR INDEXING VECTORS AND LISTS ####
##
## A new notation that we have not seen yet for indexing both vectors and lists
## is to use [[double-brackets]] to contain the index information instead
## of [single-brackets]. For example
##
##    nums[3]     # [single-bracket] notation
##    nums[[3]]   # [[double-bracket]] notation
##
## [[double-brackets]] have a slightly different meaning from [single-brackets].
## [[double-brackets]] also work a little differently with vectors and with lists.
##
###############################################################################.
###############################################################################.


#############################################################################.
#
# USING [single-brackets] and [[double-brackets]] WITH VECTORS      ####
#
# Some introductory comments:
#
#     We will start by first understanding what [[double-brackets]] mean when
#     used with vectors. However, practically speaking, [[dobuble-brackets]] 
#     are used with LISTS very often but are HARDLY EVER USED WITH VECTORS.
#     You'll soon understand why. Nevertheless, it helps if you understand
#     how [[double-brackets]] work with vectors. In addition, I think it makes
#     learning the concepts of how to use [[double-brackets]] with lists easier
#     if we first learn about how to use [[double-brackets]] with vectors.
#
# If you keep the following idea in mind, a lot of the rules become 
# easier to remember:
#
#   - [single-brackets] are intended to allow you to identify MULTIPLE objects. ####
#   - [[double-brackets]] are intended to allow you to identify A SINGLE object. ####
#
#
# The following summarize what [[double-brackets]] may and may not contain:
#
#   - [[double-brackets]] aren't designed to use negative position numbers    ####
#
#   - [[double-brackets]] aren't designed to use logical values (TRUE/FALSE)  ####
#
#   - with VECTORS [[double-brackets] may ONLY contain a SINGLE positive position number  ####
#
#   - with LISTS [[double-brackets] may contain SEVERAL positive position numbers  ####
#     (This is known as "recursive indexing" - a topic which is covered below.)
#
#   - for named vectors and lists, [[double-brackets]] may contain a single "name" ####
#     (We'll cover named lists and vectors at the end of this file)
#############################################################################.

# Setup some data for the examples

nums = c(100,200,300,400)

#-----------------------------------------------------------------------------.
# USING [SINGLE-BRACKETS] and [[DOUBLE-BRACKETS]] WITH VECTORS (continued ...)
#
# If the [[double-brackets]] contains a SINGLE POSITIVE NUMBER you get the 
# exact same result as if you had used [single-brackets].
# EXAMPLE:
#   someVector[[1]] is the same as someVector[1]                                 ####
#
# You may NOT use more than ONE POSITIVE NUMBER between the [[double-brackets]]. ####
#
#-----------------------------------------------------------------------------.

nums[3]     # 300  - [single-brackets] - you know this already

nums[[3]]   # 300  - [[double-brackets]] - same results 


nums[c(1,3)]    # 100 300 - [single-brackets] allows more than one number

nums[[c(1,3)]]  #  ERROR - [[double-brackets]] does NOT allow more than one number



#-----------------------------------------------------------------------------.
# Don't use negative numbers in [[double-brackets]]    ####
#
# Don't use logical values in [[double-brackets]]      ####
#-----------------------------------------------------------------------------.

nums                                  # 100 200 300 400 
nums[[-1]]                            # ERROR
nums[[c(-1,-2.-3)]]                   # ERROR
nums[[c(TRUE, FALSE, FALSE, FALSE)]]  # ERROR


# There is ONE exception:
#
# Why do you think this happens? - see the next question.

nums[[TRUE]]   # 100  

#-----------------------------------------------------------------------------.
# USING [[DOUBLE-BRACKETS]] WITH VECTORS (continued ...)
#
# QUESTION:
#
# Why do the following commands produce different results?
# Explain each one. Think about it ...
#
#   > nums = c(100,200,300,400)
#
#   > nums[TRUE]
#   [1] 100 200 300 400
#
#   > nums[[TRUE]]
#   [1] 100
#
#   > nums[[FALSE]]    
#   ERROR 
#-----------------------------------------------------------------------------.

# setup some data
nums = c(100,200,300,400)

# EXPLAIN WHY YOU GET THE RESULTS YOU DO FOR EACH OF THESE COMMANDS

nums[TRUE]     # 100 200 300 400

nums[[TRUE]]   # 100

nums[[FALSE]]  # ERROR 


#############.
# ANSWER
#############.
nums[TRUE]    # recycling rule = nums[c(TRUE,TRUE,TRUE,TRUE)]
nums[[TRUE]]  # 100 - TRUE gets implicitly converted to 1
nums[[FALSE]] # ERROR - FALSE gets implicitly converted to 0



#############################################################################.
# USING [[double-brackets]] WITH LISTS - eg. someList[[ vectorOfPositiveNumbers ]] ####
#
# The rules for using [[double-brackets]] to index into a LIST are a little
# different from the rules of using double-brackets with vectors. See below
# for details.
#############################################################################.

#----------------------------------------------------------------------.
# USING [[double-brackets]] WITH LISTS (continued ...)
#
# Using [[double-brackets]] to index into a LIST is similar to using 
# double-brackets to index into a vector in the following way:
#
#   As with [single-brackets] the [[double-brackets]]
#   only work with POSITIVE NUMBERS. 
# 
#     - You can't use negative numbers in the [[double-brackets]]
#
#     - You can't use logical values in the [[double-brackets]]
#
# HOWEVER - when using [[double-brackets]] with a list you CAN specify
# more than one POSITIVE number in the [[double-brackets]]. However, 
# using more than one number in the [[double-brackets]] works very
# differently with LISTS than with vectors. We'll discuss this 
# difference soon.
#
#----------------------------------------------------------------------.

# setup a list to work with

gradebook = list( c("bob", "charlie", "frank"), # student names
                  c(70,80,90),                  # grades from first test
                  c(75,85,88),                  # grades from second test
                  c(TRUE, FALSE,FALSE))         # TRUE for honors students

gradebook

# The following are ERRORS!

gradebook[[-1]]    # ERROR - no negative values in the [[double-brackets]]


#----------------------------------------------------------------------------.
# someList[1]   vs   someList[[1]]                                  ####
#
# referencing AN INDIVIDUAL ITEM in a list with [single-brackets]
#    vs 
# referencing AN INDIVIDUAL ITEM in a list with [[double-brackets]]
#----------------------------------------------------------------------------.

# setup a list to work with:
gradebook = list( c("bob", "charlie", "frank"), # student names
                  c(70,80,90),                  # grades from first test
                  c(75,85,88),                  # grades from second test
                  c(TRUE, FALSE,FALSE))         # TRUE for honors students

gradebook


#............................................................................
# QUESTION
#
# Take a minute to CAREFULLY NOTICE the difference between the following 
# two commands. 
# 
# What is the difference??? 
#
#      > gradebook[1]
#      [[1]]
#      [1] "bob"     "charlie" "frank"  
#
#
#      > gradebook[[1]]
#      [1] "bob" "charlie" "frank"
#
#............................................................................

gradebook[1]  # return value is shown below

# > gradebook[1]
# [[1]]
# [1] "bob"     "charlie" "frank"  


gradebook[[1]]  # return value is shown below

# > gradebook[[1]]
# [1] "bob" "charlie" "frank"



#............................................................................
# ANSWER TO QUESTION
#
#    gradebook[1]    # returns a LIST of that contains ONE VECTOR
#
#    gradebook[[1]]  # returns ONE VECTOR
#............................................................................

mode( gradebook [1])   # list
mode( gradebook [[1]]) # character


# Similarly for other positions ....

gradebook[[2]]      # 70 80 90

mode( gradebook [2])   # list
mode( gradebook [[2]]) # numeric



#---------------------------------------------------------------------.
# USING [single-brackets] 
# TO INDEX INTO A LIST
# USING MORE THAN ONE POSITIVE NUMBER
#
# produces results similar to using more than one positive number in single brackets
# with VECTORS.
#
# When indexing into a VECTOR you get back just the specified values in a new VECTOR.
#
# When indexing into a LIST  you get back just the specified values in a new LIST.
#---------------------------------------------------------------------.

gradebook[ c(1,2) ]   # a list of 2 items, i.e. the names and the test1 grades
mode(gradebook[c(1,2)])  # list

#---------------------------------------------------------------------.
# WITH LISTS YOU CAN USE THE [[double-brackets]] with more than
# one position number - it applies the position numbers to the items
# you get back one at a time.
#---------------------------------------------------------------------.

gradebook[[c(1,2)]]   # "charlie" - From the 1st item in the list get the 2nd item


gradebook[[c(3,3)]]   #

gradebook[[c(3,2)]]   #





gradebook[[3]]      # 75 85 95

gradebook[[4]]      # TRUE FALSE FALSE


#--------------------------------------------.
# length( SOME_LIST )
#    returns the number of objects in the list
#
#     vs
# 
# length( SOME_LIST[[1]] )
#    returns the number of items in the first object in the list
#
#    vs
#
# length( SOME_LIST[1] )
#    DONT DO THIS - IT ALWAYS RETURNS 1  - WHY?
#------------------------------------------------

gradebook

length(gradebook)       # 4 - i.e. four objects in the list 

gradebook[[1]]      # "bob" "charlie" "frank"
length(gradebook[[1]])  # 3 - i.e. three student names in the first object of the list


gradebook[1]            
length(gradebook[1])    # 1 
length(gradebook[2])    # 1 
#etc

#################################################.
# REPLACING OBJECTS IN A LIST
# REMOVING OBJECTS FROM A LIST
# ADDING NEW OBJECTS TO A LIST   (TODO - show examples)
# WORKING WITH OBJECTS IN A LIST
#################################################.

#------------------------------------------------.
# REPLACING ITEMS IN A LIST
#
# SOME_LIST [[1]] = some new value
# SOME_LIST[1] = some new value
#
# You can use the [[double-bracket-notation]] or single bracket notation
# to replace individual values in a list.
#
# 
# SOME_LIST[ c(1,2) ] = c("new", "values") 
#
# You can use [single-bracket-notation] to replace multiple values in a list
#
#
# 
# SOME_LIST[[c(1,2)]] = "someNewValue"
# In the 1st entry of the list, replace the 2nd entry with "someNewValue"
#
#
# TODO - explain this better
# SOME_LIST[[c(1,2)]]  - error if the 1st item in the list doesn't contain at least 2 items
#------------------------------------------------.



gradebook = list( c("bob", "charlie", "frank"), # student names
                  c(70,80,90),                  # grades from first test
                  c(75,85,88),                  # grades from second test
                  c(TRUE, FALSE,FALSE))         # TRUE for honors students

gradebook

gradebook[[1]] = c("red", "orange", "yellow", "green", "blue", "indigo", "violet")

gradebook

gradebook[[c(1,2)]] = "RAINBOW_STUFF"   # "recursive indexing"  (changes orange to RAINBOW_STUFF)

gradebook

gradebook[c(1,2,3)] = c("apple", "orange", "pear")  # replaces 1st item in list with apple, 2nd with orange, etc

gradebook

gradebook[1] = c("anotherNewValue")

gradebook[c(1,2)] = c("these","are","a","bunch","of","new","values")  # "these" goes into 1st value, "are" goes into the 2nd value - WARNING you have extra values on the right



# You can replace the values with anything you want:

gradebook[[1]] = seq(1, 199, by=10)

gradebook

gradebook[[2]] = c("apple", "pear", "comquat", "plum", "pinapple", "grapes")

gradebook 


#---------------------------------------------------------------.
# Removing objects from a list.
#
# NULL is a "special value" that can be understood as "nothing".
# To remove an item from a list, you can assign NULL to that value.
#
# We'll discuss this in more depth below. For now, let's just see an example:
#---------------------------------------------------------------.

# let's recreate all of the data
rm(list= ls())

gradebook = list(c("bob", "charlie", "frank"), 
                 c(70,80,90), 
                 c(75,85,88), 
                 c(TRUE, FALSE,FALSE))

gradebook

gradebook[[3]] = NULL   # remove the third item from the gradebook

gradebook               # the 3rd value is removed



gradebook[2] = NULL    # removes the 2nd item from the list
gradebook






gradebook = list(c("bob", "charlie", "frank"), 
                 c(70,80,90), 
                 c(75,85,88), 
                 c(TRUE, FALSE,FALSE))

gradebook


gradebook[c(1,3)] =NULL
gradebook


nums = c(100,200,300,400)
nums
nums[3] = NULL

gradebook = list(c("bob", "charlie", "frank"), 
                 c(70,80,90), 
                 c(75,85,88), 
                 c(TRUE, FALSE,FALSE))

gradebook


gradebook[[c(1,3)]] =NULL
gradebook


nums = c(100,200,300,400)

nums[c(1,1,1,4,4,4,2,1,3)]


gradebook = list(c("bob", "charlie", "frank"), 
                 c(70,80,90), 
                 c(75,85,88), 
                 c(TRUE, FALSE,FALSE))

gradebook
gradebook[c(1,1,1,4,4,4,2,1,3)]
gradebook[[c(1,1,1,4,4,4,2,1,3)]]   # ERROR - too many index values

# QUESTION 

# 
gradebook

# Get a vector that contains both the test1 and test2 grades for the 3rd student
c( gradebook[[c(2,3)]] , gradebook[[c(3,3)]] )

gradebook[[c(1:2,3)]]
gradebook[[c(1,2,3)]]

# ADDING DATA TO A LIST

gradebook = list(c("bob", "charlie", "frank"), 
                 c(70,80,90), 
                 c(75,85,88), 
                 c(TRUE, FALSE,FALSE))

gradebook

gradebook[[5]] = c("senior", "senior", "junior")

gradebook


# TODO THIS DOESN'T WORK - I HAVE TO FIGURE OUT WHY
gradebook[16] = c(118, 112, 120, 100)
gradebook

gradebook[[6]] = c(118, 112, 120, 100)
gradebook

# QUESTION
# ADD "mike" to the vector of student names in the 1st object of the list

gradebook[[c(1,4)]] = "mike"
gradebook

# Do it another way. This time add "frank"

gradebook[[1]] = c( gradebook[[1]] , "frank" )
gradebook

# Do it another way. This time add "abie"

gradebook[[1]][6] = "abie"
gradebook

# add "simcha" and "shalom" 
gradebook [[1]][c(7,8)] = c("simcha","shalom")
gradebook

# add "gabriel"
gradebook[[1]][ length(gradebook[[1]])+1  ] = "gabriel"
gradebook

# The follwoing doesn't work (TODO - explain in notes)
gradebook[1][10] = "Jonah"
gradebook
#---------------------------------------------------------------.
# WORKING WITH OBJECTS IN A LIST
#
#
#---------------------------------------------------------------.

# let's recreate all of the data
rm(list= ls())

gradebook = list(c("bob", "charlie", "frank"), 
                 c(70,80,90), 
                 c(75,85,88), 
                 c(TRUE, FALSE,FALSE))


# You can use [[double-brackets]] to access objects in a list 
#
# In the following command, 
#
# Step 1: gradebook[[1]] directly accesses the item at the 1st position in the list.
# 
# Step 2: gradebook[[1]][2] = "zeke"
#         directly sets the value at the 2nd position in the first item in the list to "zeke".
#
# Notice that in step 2, the [[1]] uses double brackets because this
#                        is directly accessing a value from the list
#                        but the [2] uses [single-brackets] because this
#                        is accessing a value in a vector.
# 
# The following is the actual vector that is in the first position in the list.
#
#                 > gradebook[[1]]
#                 [1] "bob" "charlie" "frank"
#
# You can now use that vector as you would use any other vector. For example
# the following gets the 2nd value from this vector:
#
#                 > gradebook[[1]][2]
#                 [1] "charlie"

gradebook[[1]][2]    # "charlie"    - same as gradebook[[c(1,2)]]

gradebook[[1]][2] = "zeke"  # set 2nd students name to "zeke"

gradebook  # "zeke" is now the 2nd student


###########################################################################
# 2022 - BEREN - UP TO HERE - AFTER CLASS 16
#
###########################################################################

###########################################################################
# 2022 - WILF - UP TO HERE - AFTER CLASS 16
#
# NOTE - we had started to discuss Named Lists in the class before the 
# midterm. I had since rewritten the notes and the material on 
# named lists in the new notes are below. I plan to start here next 
# class and quickly review named lists before continuing with other material.
###########################################################################

#-----------------------------------------------------------------------------.
# NAMED LISTS
#
# The entries in a list can have names associated with them.
# We'll see that this makes working with lists much easier.
#-----------------------------------------------------------------------------.

#........................................................................
#
# first way to add names to a list - use the names function
#........................................................................

# let's recreate all of the data
rm(list= ls())

gradebook = list(c("bob", "charlie", "frank"), 
                 c(70,80,90), 
                 c(75,85,88), 
                 c(TRUE, FALSE,FALSE))

gradebook # no names

str(gradebook)  # no names

# Uncooment the following line to run it. I commented it so that 
# it shouldn't be run by mistake and confuse you when the new tab opens.

#View(gradebook)  # open a new tab to View (capital "V") the contents of the gradebook

names(gradebook)  # NULL   i.e. no names

# now let's add the names
names(gradebook) = c("studs", "exam1", "exam2", "honorsStudent")



# The gradebook now displays with $dollar-signs before the names of the 
# individual pieces of information. 

gradebook  # now there are names

str(gradebook)   # you see the names here too

#........................................................................
# $DOLLAR-SIGN-NOTATION
#
# For "named lists" in addition to [[double-bracket-notation]] (as described above)
# you can ALSO use $dollar-sign-notion (see examples below)
#........................................................................

# REMEMBER THE DIFFERENCE BETWEEN THE FOLLOWING TWO COMMANDS

gradebook[1]      # A LIST   - a list of just the vector of student names
gradebook[[1]]    # A VECTOR -               the vector of student names

mode(gradebook[1]) # list

gradebook[c(1,2)]     # A LIST - of the 1st and 2nd elements in the gradebook

gradebook[[c(1,2)]]   # A SINGLE ITEM - "charlie" - i.e from the 1st item in gradebook, take the 2nd item
mode(gradebook[[c(1,2)]])  # "character"

# ONCE WE ADDED THE NAMES ...

gradebook[[1]]    # still works

gradebook$studs   # same exact thing



mode( gradebook$studs )  # character
mode( gradebook[[1]] )   # character (same thing)
mode( gradebook[1] )     # list




gradebook[[1]][2] = "avraham"    # still works to rename the 2nd student
gradebook

gradebook$studs[2] = "avi"   # but $dollar-sign-notation also works and is easier to read
gradebook

# a third way - change the name from "avi" to "abie"
gradebook[[c(1,2)]] = "abie"
gradebook

#........................................................................
#
# another way to assign names - give the names directly in the call to the list(...) function
#
#........................................................................

# Remove all variables and start over again. 
# This isn't "necessary" but could make the concepts clearer for some students.
rm(list= ls())  

# This is the data that will go into the list.
# We can remove these variables once the list is created.
students = c("bob", "charlie", "frank")
test1 = c(70,80,90)
test2 = c(75,85,88)
honors = c(TRUE, FALSE,FALSE)

# create the list and assign names all in one command.
#
# For example, the code, "studs=students", in the command below means that 
# "studs" will be the name in the list for the data that is inserted into
# the list from the students vector. (We could also call the name in 
# the list "students" instead of "studs". We'll see how to do that in the next example.)

gradebook = list(studs=students, exam1=test1, exam2=test2, honorsStudent=honors)

gradebook   

# REMEMBER - the list does NOT depend on the original variables.
# we can remove the original variables and the list is still there.
rm(students, test1, test2, honors)   
gradebook

#...........................................................................
# REVIEW - comparison of the 2 ways to add names to a list:
#
#     The first time we created the list we did the following
#
#        > gradebook = list(students, test1, test2, honors)
#        > names(gradebook) = c("studs", "exam1", "exam2", "honorsStudent")
#
#     an easier way is to do it all in one command like this:
#
#        > gradebook = list(studs=students, exam1=test1, exam2=test2, honorsStudent=honors)
#...........................................................................


#...........................................................................
# USING THE SAME NAME AS THE VARIABLES ...
#
# Using the same name as the variable also works but it could look a little
# confusing when you first see it. In the following command students=students,
# looks confusing but it isn't so difficult. 
#
#   > gradebook = list(students=students, test1=test1, test2=test2, honors=honors)
#
# The word, students, on the left hand side of the = sign is the name of the
# data in the list.
# 
# The word, students, on the right hand side of the = sign is the variable students
# that you are getting the data from.
#
# (See the code below ...)
#...........................................................................

# start over ... remove all variables
# (not necessary but it makes things clearer for some people if we just start over)
rm (list = ls())

students = c("bob", "charlie", "frank","david")
test1 = c(60,70,80,90)
test2 = c(65,75,85,95)
honors = c(TRUE, FALSE,FALSE)

gradebook = list(students=students, test1=test1, test2=test2, honors=honors)
gradebook



#--------------------------------------------------------------------------.
# names( SOME_LIST ) = NEW_NAMES
#
# The names function simply returns the names of the objects in the list as a vector.
# You can use this vector to display the names. 
# You can also use this to change the names. 
#
# See the examples below. 
#--------------------------------------------------------------------------.

gradebook = list(students=c("bob", "charlie", "frank"), 
                 test1=c(70,80,90), 
                 test2=c(75,85,88), 
                 honors=c(TRUE, FALSE,FALSE))

gradebook

names(gradebook)   # "students"  "test1"  "test2"  "honors"

names(gradebook)[c(2,3)] = c("exam1", "exam2")   # change tests to exams

names(gradebook)   # "students"  "exam1"  "exam2"  "honors"

gradebook   # notice the test1 and test2 were changed to exam1 and exam2



########################################
########################################
# NOTE TO MYSELF (PROF ROSENTHAL) - REMOVE THE NEXT TWO SECTIONS - THEY ARE REPEATED FROM EARLIER MATERIAL
########################################
########################################

#--------------------------------------------------------------.
# TWO WAYS OF DOING THE SAME THING:
#    [[double-brackets-notation]] and $dollar-sign-notation
#
# [[double-brackets]] notation is just a different way of writing
# $dollar-sign-notation. The result is EXACTLY THE SAME.
#--------------------------------------------------------------.

gradebook = list(students=c("bob", "charlie", "frank"), 
                 test1=c(70,80,90), 
                 test2=c(75,85,88), 
                 honors=c(TRUE, FALSE,FALSE))

gradebook

gradebook[[2]]    # access the 2nd value of gradebook

gradebook$test1   # same EXACT thing

#--------------------------------------------------------------------------------------.
# [[double bracket]] notation only works with positive number subscripts.
#
# [[double bracket]] notation does NOT work with negative number subscripts.
#
# If you try to use a logical subscript, the TRUEs and FALSEs will be implicitly converted to 1's and 0's
#--------------------------------------------------------------------------------------.

gradebook[[1]]      # "bob" "charlie" "frank" "david"

gradebook[[-1]]     # ERROR - invalid negative subscript

gradebook[[TRUE]]   # same as gradebook[[1]] - TRUE is implicitly converted to 1

gradebook[[FALSE]]   # ERROR - same as gradebook[[0]]



#..............................................................
# QUESTION -
#
# (a) write code to add 2 points to the third student's
#     grade on test1. Do this using $dollar-sign notation.
#
# (b) Do the same thing again but this 
#     time use [[double-bracket]] notation
#
# (c) Do the same thing again with "recursive-indexing"
#..............................................................

# ANSWERS
# (a) write code to add 2 points to the third student's
#     grade on test1. Do this using $dollar-sign notation.

gradebook$test1[3] = gradebook$test1[3] + 2 

gradebook


# (b) Do the same thing again but this
#     time use [[double-bracket]] notation

gradebook[[2]][3] = gradebook[[2]][3] + 2

gradebook

# (c)

gradebook[[c(2,3)]] = gradebook[[c(2,3)]] + 2
gradebook


#----------------------------------------.
# is.list
# mode
#----------------------------------------.

is.list(gradebook)           # TRUE
is.list(gradebook[[1]])      # FALSE
is.list(gradebook$students)  # FALSE

mode(gradebook)              # "list"
mode(gradebook[[1]])         # "character"
mode(gradebook$students)     # "character"

gradebook[[1]][2]       # "charlie"
mode(gradebook[[1]][2]) # "character"

#######################################################.
#
# A list can contain other lists as well as vectors.
#
#######################################################.

rm(list = ls())

section1 = list ( students = c("abe","bob","charlie"),
                test1 = c(70,80,90),
                test2 = c(75,85,95))

section2 = list( students = c("fran", "anne", "sue", "bertha", "maxine"),
               test1 = c(100,90,80,70,60),
               test2 = c(95,85,75,65,55),
               test3 = c(93,83,73,63,53))

classes = list( year = 2021,
                 semester = "fall",
                 section1 = section1,
                 section2 = section2 )

# we don't need the original variables anymore
rm( section1, section2 )


classes            # data for all of my sections

classes$section2   # just get the section2 data

$section2  # ERROR

section2   # ERROR - variable section2 doesn't exist

# 
mode( classes)  # list (obviously)
mode( classes$section2 )  # list
mode( classes$section2$test3 )   # numeric

# display the average grade for section 2 on test 3
mean ( classes$section2$test3 )

#..................................................
# remember - you don't need extra variables. 
#            the following works too.
#..................................................

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

classes

classes$section2

mean( classes$section2$test3 )

mean( classes[[4]][[4]] )   # same thing


# QUESTION - Display the grade for the last student in section 2 on test3

# ANSWER - with $ notation
classes$section2$test3[   length(classes$section2$test3)       ]

# NOTE - you CAN use "nested indexing" to get the grade using the code
# below, but the code to get the "last" test3 grade is harder to read.
# ANSWER - using nested indexing 

classes[[ c(4,    4,           5                 ) ]]  # get the 5th test3 grade
classes[[ c(4,    4,   length(classes[[c(4,4)]]) ) ]]  # get the last test3 grade

#####################################################################################.
# 2022 - WILF - UP TO HERE - AFTER CLASS 14
#
# NOTE - I rearranged the material in this file after class 14 so this
# "UP TO HERE" note may seem out of place.
#####################################################################################.

#------------------------------------------------------------------------------.
# QUESTION 
# write code to display anne's grade on test2
# anne is in section2
# do NOT assume that anne is the 2nd person, i.e. 
# write the code so that no matter how many people are in the class
# and no matter the order of those people in the data, you will get anne's grade
#------------------------------------------------------------------------------.

# ANSWER

classes$section2$test2[ classes$section2$students == "anne" ]


#------------------------------------------------------------------------------.
# QUESTION - write code to find the name of the person in 
# section 1 who scored highest on test2
# AGAIN - do not assume that the data is any particular order
#------------------------------------------------------------------------------.

# ANSWER 

classes$section1$students[  classes$section1$test2 == max ( classes$section1$test2 )     ]



#--------------------------------------------------------------------------.
# REVIEW OF WAYS TO ACCESS DATA IN A LIST
#
#   SOME_LIST[[ A_SINGLE_POSITIVE_NUMBER ]]
#
#   SOME_LIST[[ VECTOR_OF_POSITIVE_NUMBERS ]]   # i.e. recursive indexing
#
#   SOME_LIST[ SOME_VECTOR_INDEX ]     # a list
#
#   SOME_LIST$SOME_ENTRY_NAME      # same as double bracket notation
#
#--------------------------------------------------------------------------.
#
# With [[double-bracket]] notation you always get back ONE object.
#
#   SOME_LIST [[ A_SINGLE_POSITIVE_NUMBER ]]
#       returns the object in the list at the specified position
#
#       Example:
#         > stuff = list ( c("apple", "orange", "pear") , c("table", "chair") )
#
#         > stuff[[1]]
#         [1]  "apple"  "orange"  "pear"
#
#         > stuff[[2]]
#         [1] "table"  "chair"
#
#
#   SOME_LIST [[ A_VECTOR_OF_POSITIVE_NUMBERS ]]
#       If the subscript in the [[double brackets]] contains more than one
#       positive number then the values in the subscript are applied one after the other
#       until you wind up with a single object. This is known as "recursive indexing".
#       For example:
# 
#       Example:
#         > stuff = list ( c("apple", "orange", "pear") , c("table", "chair") )
#
#         > stuff[[1]]
#         [1]  "apple"  "orange"  "pear"
#
#         > # get the 1st object from the list then the 2nd item from that vector
#
#         > stuff[[c(1,2)]]    
#         [1] "orange"
#
#       Unfortunately, most R programmers are not familiar with using subscripts that 
#       are vectors with more than one number. This feature is not documented well.
#       It's hard to find a good explanation of this in the official R documentation.
#
#       Therefore I don't recommend that you use this in your code a lot
#       as many other R programmers will not understand what you are doing.
#       However, it does work. 
#
#
#   SOME_LIST[ SOME_VECTOR_INDEX ]   
#          
#       You can use [single-bracket] notation to get back a NEW LIST
#       of values from the original list.
#
#       With [single-bracket] notation, you can use any of methods that
#       we learned about for indexing vectors, i.e. 
#         - positive position numbers
#         - negative position numbers
#         - logical values
#       to get as many values back as you want. 
#
#       All the values are put into a NEW LIST.
#
#
#
#---------------------------------------------------------------.


#############################################################################.
#############################################################################.
# NOTE TO PROF. ROSENTHAL (FROM PROF ROSENTHAL :)
#
# I REMOVED SOME DUPLICATED MATERIAL FROM THIS POINT IN THE FILE. I COPIED
# THE REMOVED MATERIAL INTO THE FILE:  000415-lists_lapplySapply_etc-v027-theRemovedMaterial.R
# I ALREADY CHECKED THAT I DIDN'T REMOVE SOMETHING NEW BUT I STILL WANT TO 
# TRIPPLE CHECK THAT I DIDN'T REMOVE SOMETHING THAT I SHOULDN'T HAVE.
#############################################################################.
#############################################################################.







#---------------------------------------------------------------.
# Removing items from a list.
#
# NULL is a "special value" that can be understood as "nothing".
# To remove an item from a list, you can assign NULL to that value.
# This works whether you specify the item to remove
#   with the [[double-bracket]] notation, 
#   with the [single-bracket] notation or
#   with the $dollar-sign-notation
#
# NULL is DIFFERERNT from NA.
# ---------------------------.
# NA means there is some information being recorded but the exact
# value of that information is not available.
#
# NULL means that there is no information being recorded.
#
# Therefore if you set an item in a list to NULL, the item is
# removed from the list. However, if you set an item in a list to NA
# then the item becomes NA.
#---------------------------------------------------------------.

# let's recreate all of the data
rm(list= ls())

# gradebook = list(students, test1, test2, honors)

gradebook = list(students=c("bob", "charlie", "frank"), 
                 test1=c(70,80,90), 
                 test2=c(75,85,88), 
                 honors=c(TRUE, FALSE,FALSE))

gradebook
str(gradebook)

#gradebook = list(students=students, test1=test1, test2=test2, honors=honors)
#gradebook               # gradebook contains 4 items

gradebook[[3]] = NULL   # remove the third item from the gradebook (i.e. $test2)
gradebook               # $test2 (which was the 3rd value is removed)
str(gradebook)

gradebook$test1 = NULL  # remove the $test1 item from the gradebook
gradebook               # test1 is removed
str(gradebook)

gradebook[2] = NULL    # single brackets also works, honors is currently the 2nd item
gradebook              # honors was removed from the gradebook
str(gradebook)

gradebook[[1]] = NULL  # you can remove the last item too
gradebook              # named list()   - i.e. an empty list that has names

# add an item to the now empty list (see below for more info
# about how to add items)

gradebook[[1]] = c("apple", "cucumber", "tomato")
gradebook
str(gradebook)

gradebook[[1]] = NULL
gradebook


#---------------------------------------------------------------.
# Adding items to a list.
#---------------------------------------------------------------.

#...................................................................
# Adding to a list - option #1 - 
# assign a new value in the list using either
# [[double-bracket]] notation
# or $dollar-sign notation
#...................................................................
rm(list=ls())

students = c("bob", "charlie", "frank")

stuff = list()  # let's start with an empty list
stuff           # list()

stuff[[1]] = students     # position 1 is created
stuff

stuff$exam1 = c(71,81,91) # add another entry to the list
stuff

# You can use either notation, [[double-brackets]] or $dollar-signs
# to refer to the data you just added
stuff$exam1
stuff[[2]]   #same thing

#-------------------------------------------------------------------.
# Assigning past the end of a list fills the missing values with NULLs
#-------------------------------------------------------------------.

# If you assign to a position [[7]] when there are only 4 values in the 
# list then the values at positions [[5]] and [[6]] will be NULL (i.e. "nothing")
stuff[[7]] = c(TRUE, FALSE, FALSE)
stuff


# recall - this is similar to what happens when you add a value to a vector
# in a position that is much greater than the length of the vector

vec = c(100,200)
vec[5] = 500
vec

#-------------------------------------------------------------------.
# Assigning using [single-brackets]
# 
# (I do NOT recommend that you add items to a list with the [single-bracket] notation.
# It can be confusing as shown below.)
#-------------------------------------------------------------------.

stuff

# The following line only assigns 100 to stuff[8] and generates the following 
# warning message:

stuff[8] = c(100,200,300)    # only 100 is assigned.
#   Warning message:
#     In stuff[8] = c(100, 200, 300) :
#     number of items to replace is not a multiple of replacement length
stuff

# This is similar to what happens with vectors

vec = c(100,200,300)       
vec[1] = c(111,222,333)  # only 111 is assigned
vec   # 111 200 300 
#Warning message:
# In vec[1] = c(111, 222, 333) :
# number of items to replace is not a multiple of replacement length



# This works
stuff[c(9,10,11)] = c(111,222,333)   # this works
stuff


# so does this
vec
vec[c(1,2,3)] = c(111,222,333)  

vec  # 111 222 333


#---------------------------------------.
# is.null will check if a value is NULL
#---------------------------------------.

stuff

is.null(stuff[[1]])  # FALSE - because something is in the 1st position

is.null(stuff[[7]])  # FALSE - because something is in the 7th position

is.null(stuff[[5]])  # TRUE - because there is NOTHING (i.e. NULL) in the 5th position

is.null(stuff[5]) # FALSE - stuff[5] is a list of a single NULL value

mode(stuff[5])

mode(stuff[[5]])  # NULL

# same as 
mode(NULL)  # "NULL"

#------------------------------------------------------------------------.
# The c function works to combine two or more lists into a single list
#------------------------------------------------------------------------.

#------------------------------------------------------------------------.
# Adding to a list - option #2 - use the c() function
# 
# Use the c function to combine (i.e. concatenate) a list with other lists
# 
# see examples below
#------------------------------------------------------------------------.

rm(list=ls())
students = c("joe", "anne", "sue")
test1 = c(70,80,90)
test2 = c(75,85,95)
honors = c(FALSE, FALSE, TRUE)

list1 = list(students=students, test1=test1)
list1

list2 = list(test2=test2, honors=honors)
list2

list3 = list(year=c("senior", "sophomore", "senior"))
list3

str(list1)
str(list2)
str(list3)

# Three lists combined into a single list
allData = c(list1, list2, list3)  # a single list that combines all other list contents
allData
str(allData)
length(allData)  # 5

# One list that contains 3 lists 
listOfLists = list(list1=list1, list2=list2, list3=list3)  # a list that contains 3 lists
listOfLists
str(listOfLists)
length(listOfLists) #3

# Same thing but without the names
unnamedListOfLists = list(list1, list2, list3)  # a list that contains 3 lists
unnamedListOfLists
str(unnamedListOfLists)

#---------------------------------------------------------------.
# REMEMBER ... 
#
# The str command (stands for structure) is helpful to show the 
# structure of a complicated list.
#
# For lists with a lot of data, str will NOT show all of the data.
# Rather, str will show just enough to get an idea of how the data 
# is structured. This is similar to how the "Environment" tab doesn't
# show all of the data for long vectors, but just enough to get an idea
# of what the variable contains.
#---------------------------------------------------------------.

# See the variables that were created in the last section
# i.e.   allData,   listOfLists   and    unnamedListOfLists

str(allData)              # show the structure of the list in an easier to read format

str(listOfLists)

str(unnamedListOfLists)


#...................................................................
# Adding values to a list - option #1 - use the c() function
# 
# As mentioned above you can use the c function to combine (i.e. concatenate)
# a list with other lists. You can use this technique to add values onto
# an existing list. 
# 
# see examples below
#...................................................................
rm(list = ls())

students = c("bob", "charlie", "frank")
test1 = c(70,80,90)
test2 = c(75,85,88)
honors = c(TRUE, FALSE,FALSE)

stuff = list(students=students, test1=test1)
stuff

# stuff is already a list
# Use the c function to add another value to the end of the list
# combine the current value of stuff with a 2nd list
stuff = c(stuff, list(test2=test2, honors=honors))
stuff

# combine the current value of stuff with another list
stuff = c(stuff, list(fruit = c("apple","orange","pear")))
stuff

#...................................................................
# Adding to a list - option #2 - assign to next value after last 
# using either [] or [[]] notation
# 
# see examples below
#...................................................................

stuff = list(students=students, test1=test1)
stuff
length(stuff)

# assign new values and the new name into the next list position
stuff[[ length(stuff) + 1]] = c("apple","orange","pear")
stuff         # 4th item has the fruit but there is no name for the fruit
length(stuff)

# assign the new name
names(stuff)[length(stuff)] = "fruit"    
stuff         # all entries now have names


#...................................................................
# Adding to a list - option #3 - use the append() function
#
# Append the values in a one list onto the end of another list.
# see examples below
#...................................................................

stuff = list(students=students, test1=test1)
stuff

# combine the current value of stuff with a 2nd list
stuff = append(stuff, list(test2=test2, honors=honors))
stuff

?append



######################################################################.
# 2022 - BEREN - UP TO HERE - AFTER CLASS 17
######################################################################.

######################################################################.
# 2022 WILF - UP TO HERE - AFTER CLASS 17
#
# NOTE - we had started to cover "lapply" in class 17.
#        I moved the info about "lapply" into a separate file. 
#        For next class, we will finish off this file and then 
#        continue with the "lapply" information in the next file.
######################################################################.


##############################################################################.
##############################################################################.
## NAMED VECTORS
##
## Just like you can have named lists, you can also have vectors with names.
##
## You can use a vector of quoted "names" as an index for a vector or a list.
##############################################################################.
##############################################################################.

#-------------------------------------------------------.
# HOW TO CREATE A NAMED VECTOR - FIRST WAY
#
#   someVector = c(name1=value1, name2=value2, etc)
#
#   (No need to put "quotes" around the names)
#-------------------------------------------------------.

# create a numeric vector with names
test1 = c(joe=50, sam=60, sue=70, bob=80, anne=90)

#-------------------------------------------------------.
# The names are displayed with the vector.
#-------------------------------------------------------.
test1
# joe  sam  sue  bob anne 
#  50   60   70   80   90 

#-------------------------------------------------------.
# HOW TO CREATE A NAMED VECTOR - SECOND WAY
#
#   names(someVector) = c("name1", "name2", ... etc.)
#-------------------------------------------------------.

# Create a vector without names
calories = c(95, 102, 45)
calories 
# [1] 95 102 45

# Add names.
names(calories) = c("apple", "pear", "orange")
calories
# apple   pear orange 
#    95    102     45

#------------------------------------------------------------------------.
# A vector with names has the same mode as if it didn't have names.
# You can continue to treat numeric data as numeric, logical data as logical, etc.
#------------------------------------------------------------------------.

test1
# joe  sam  sue  bob anne 
#  50   60   70   80   90 

mode(test1)   # "numeric"

mean(test1)   # this still works
# [1] 70

test1 + 1     # this still works
# joe  sam  sue  bob anne 
#  51   61   71   81   91


#------------------------------------------------------------------------.
# You can see from the output of str that a vector has names
#------------------------------------------------------------------------.

str(test1) 
# Named num [1:5] 50 50 70 80 90
# - attr(*, "names")= chr [1:5] "joe" "sam" "suzanne" "bob" ...

#------------------------------------------------------------------------.
# You can use the names() function to access just the names of a vector or list.
# The value returned from names() is a "character" vector.
# You can change the names by using the names() function.
#------------------------------------------------------------------------.

# You can access just the names with the names function
names(test1)
# [1] "joe"  "sam"  "sue"  "bob"  "anne"


# You can change SOME of the names 
names(test1)[3] = "suzanne"

test1
# joe     sam suzanne     bob    anne 
#  50      60      70      80      90 

# ... or you can change ALL of the names 
names(test1) = c("joseph", "samuel", "suzanne", "robert", "anne")
test1
# joseph  samuel suzanne  robert    anne 
#     50      50      70      80      90 

############################################################################.
# INDEXING WITH NAMES
#
# You can use a vector of names as the index to a named vector. 
# You must use "quotes" around the names in the index.
# This also works for lists that have names.
############################################################################.

rm(list =ls())

# create a named vector
test1 = c(joe=50, sam=60, sue=70, bob=80, anne=90)
test1


# Use a vector of quoted "names" as the index

test1[c("sue", "anne")]  
# sue anne 
#  70   90



# add 5 points to just sue and anne's grades
test1[c("sue", "anne")] = test1[c("sue", "anne")] + 5

test1
# joe  sam  sue  bob anne 
#  50   60   75   80   95 

#--------------------------------------------------------------------------.
# Even though a vector or a list have names, all the other 
# indexing methods (i.e. positive numbers, negative numbers, TRUE/FALSE)
# continue to work.
#--------------------------------------------------------------------------.

test1
# joe  sam  sue  bob anne 
# 50   60   75   80   95 

test1[c(3,5)]                # use positive position numbers as the index
# sue anne 
#  75   95

test1[c(-1,-2,-4)]           # use negative position numbers as the index
# sue anne 
#  75   95

test1[c(FALSE,FALSE,TRUE,FALSE,TRUE)]   # use a logical vector as the index
# sue anne 
#  75   95

############################################################################.
#
# NAVIGATING A COMPLEX NAMED LIST WITH MULTIPLE LEVELS OF NESTING
#
############################################################################.

# create a list that has names
# This is a list with multiple levels of nesting
# (i.e. lists inside lists inside lists ... etc)

gradebook = list( year = 2022,
                  semester = "fall",
                  classes = list (
                      
                       ids1020 = list(
                        
                              section211 = list (
                               students=c("bob", "charlie", "frank"), 
                               test1=c(70,80,90), 
                               test2=c(75,85,88), 
                               honors=c(TRUE, FALSE,FALSE)
                              ),
                              
                              sectionB = list(
                               students=c("sarah", "anne", "lisa"), 
                               test1=c(71,81,91), 
                               test2=c(72,82,92), 
                               honors=c(FALSE,FALSE,TRUE)
                              )
                       ),
                       
                       ids2030 = list(
                        
                             section311 = list(
                              students=c("abe", "carl", "dave"), 
                              test1=c(73,83,93), 
                              honors=c(FALSE, FALSE,FALSE)
                             ),
                             
                             sectionC = list(
                              students=c("alice", "bracha"), 
                              test1=c(86,96), 
                              honors=c(TRUE,TRUE)
                             )
                       )
                  )
            )

# The following can be very hard to read
gradebook
 
# It may be easier to analyze this list with str or with View (capital "V")
# or by pressing the arrow ">" button next to the gradebook variable in the Environment tab.
str(gradebook)

# View(gradebook)   # this opens a new tab. Uncomment this line if you want to run it.

gradebook
str(gradebook)

#------------------------------------------------------------------------.
# REMEMBER - you can use the $dollar-sign notation to navigate the list
#------------------------------------------------------------------------.

gradebook$classes$ids2030$section311$students   # "abe" "carl" "dave"

gradebook$classes$ids2030$section311$test1   # 73 83 93

gradebook$classes$ids1020$sectionB$students   # "sarah" "anne" "lisa"

gradebook$classes$ids1020$sectionB  # an entire list
# $students
# [1] "sarah" "anne"  "lisa" 
# 
# $test1
# [1] 71 81 91
# 
# $test2
# [1] 72 82 92
# 
# $honors
# [1] FALSE FALSE  TRUE

str(gradebook$classes$ids1020$sectionB) # easier to read with str
# List of 4
# $ students: chr [1:3] "sarah" "anne" "lisa"
# $ test1   : num [1:3] 71 81 91
# $ test2   : num [1:3] 72 82 92
# $ honors  : logi [1:3] FALSE FALSE TRUE

# a list of lists
gradebook$classes$ids1020  
str(gradebook$classes$ids1020)


#---------------------------------------------------------------------------.
# someList[c("vector","of","quoted","names")]       (with [single-brackets])
# 
# You can use a vector of quoted "names" as an index for the list.
# The result is a list that contains just the specified elements. 
#---------------------------------------------------------------------------.

length(gradebook)   # 3

length(gradebook$classes) # 2

gradebook[c("year", "semester")]   

# $year
# [1] 2022
# 
# $semester
# [1] "fall"

gradebook[ c(1,2) ]  # same result

#------------------------------------------------------------------------.
# RECURSIVE INDEXING WITH A VECTOR OF NAMES, eg.
# someList[[c("vector","of","quoted","names")]]       (with [[double-brackets]])
#
# We are adding this section to be complete. However, this technique
# is not used very often (see below for why).
#
# Just like you can use "recursive indexing" with
# a vector of numbers in [[double-brackets]]
# you can also use "recursive indexing" with
# a vector of names in [[double-brackets]]
#
# Remember that when using code such as someList[[c(3,2,4)]], 
# ie. [[double-brackets]] with a vector of positive numbers
# R performs "recursive indexing" (see above for more info).
#
# In a similar way, you use similar code with a vector of names instead of
# a vector of numbers, R will also do "recursive indexing", based on the names
# instead of the numbers. However, this technique is not used very often,
# because $dollar-sign notation accomplishes the same thing and is much
# easier to read and type.
#
#      someList[[c("name","anotherName","yetAThirdName","etc")]]
#
#             is the same as 
#
#      someList$name$anotherName$yetAThirdName$etc
#
#------------------------------------------------------------------------.

# You may use [["oneQuotedName"]] in double-brackets.

gradebook[["semester"]]   # [1] "fall"

gradebook$semester        # "fall" - same thing 


# If you use more than one quoted name in the [[double-brackets]]
# R does "recursive indexing" and finds the one item that you specified
# which may be inside nested named lists or nested named vectors
#
# The following returns JUST the vector of student 
# names that is in section311 in ids2030 in the classes list

gradebook[[c("classes","ids2030","section311","students")]] # "abe" "carl" "dave"

# This is the same thing ... and much easier to type

gradebook$classes$ids2030$section311$students        # same thing - "abe" "carl" "dave"

gradebook [[ c(3,2,1,1)]]  # same thing - 


gradebook [[ c(3,2,1,1,2)]]  # "carl"

#############################################################################.
#############################################################################.
##
## someVector = unlist( SOME_LIST )
##
##    Creates a vector from the contents of SOME_LIST
##
##############################################################################.
##############################################################################.

rm(list=ls())

#...........................................................................
# example 1 - a simple list - all values are put into a single vector
#...........................................................................

listOfNumerics = list( c(1,2,3),
                       c(10,20,30),
                       c(100,200,300))
listOfNumerics

nums = unlist(listOfNumerics)
nums      # [1] 1 2 3 10 20 30 100 200 300 

#-----------------------------------------------------------------------------.
# example 2
# If the list contains nested lists, you still get a single vector that
# contains all of the values from all of the lists.
#
# NOTE this can be modified by specifying 
#   unlist(SOME_VECTOR, recursive=FALSE)
#
# See the documentation for more info: ?unlist
#-----------------------------------------------------------------------------.

# create a list with multiple nested lists

listOfLists = list( c(10,20),
                    list (
                      c(30,40),
                      c(50,60),
                      list(
                       c(70,80),
                       c(90,100)
                      )
                    ),
                    list ( 200, 400 )
)

# unlist takes all values and puts them into a single vector.

unlist(listOfLists) # [1]  10  20  30  40  50  60  70  80  90 100 200 400



#...........................................................................
# example 3 - 
#   If only SOME of the items in the list have names,
#   so only some of the values in the resulting vector will have names.
#   The resulting vector positions "without" names
#   actually have "" as their name. (see code below)
#...........................................................................

# setup a list with only some names
listWithSomeNames = list( c(1,2),
                          tens=c(10,20,30),
                          c(100,200),
                          famous=round(c(pi, exp(1)), digits=2)
                      )
str(listWithSomeNames)

# convert to a vector
vec = unlist(listWithSomeNames)  # see result below
vec
# Result:
#                tens1   tens2   tens3                 famous1 famous2 
# 1.00    2.00   10.00   20.00   30.00  100.00  200.00    3.14    2.72 


# The value in the names vector for those values that "dont have names"
# is the empty string, i.e. "" (nothing - not even a space - is between the quotes)
names(vec) # ""  ""  "tens1" "tens2" "tens3"  ""  ""  "famous1" "famous2"


#...........................................................................
# example 4 - 
#   For nested list with names. The names in the vector are a combination
#   of the names from each list in the hierarchy (see example)
#...........................................................................

# Setup a nested list with names at each level.
nestedList = 
 list( 
  fin = list (
    taxes = c(10, 20),
    invest = c(30, 40)
    ),
  shop = list(
   fruit   = c("apples", "oranges"),
   amount = c(5,        4)
   )
  )

str(nestedList)

# Names in the vector combine names from different levels in the nested list
# (see result below)
unlist(nestedList)

# Result: 
# fin.taxes1   fin.taxes2  fin.invest1  fin.invest2  shop.fruit1  shop.fruit2 shop.amount1 shop.amount2 
#       "10"         "20"         "30"         "40"     "apples"    "oranges"          "5"          "4" 


#...........................................................................
# example 5 - 
#   For nested list with names, if you specify use.names=FALSE
#   the vector will NOT have names.
#...........................................................................

# using same list as previous example
str(nestedList)

unlist(nestedList)  # generates a NAMED vector

unlist(nestedList, use.names = FALSE)  # gernerates an UNnamed vector


#--------------------------------------------------------------------------.
# ADDITIONAL FEATURES OF unlist() FUNCTION
#
# The unlist function has two additional arguments that control how it works
# with nested lists and with named lists.
# See the help page ?unlist for more info.
# 
#   - The recursive argument controls exactly how unlist works when the list
#     contains nested lists. The default is recursive=TRUE. See the help
#     file for more info, ?unlist
#
#   - The use.names argument controls exactly how unlist works when the list
#     contains names. (see example 5 above).
#     The default is use.names=TRUE.  For more info see ?unlist
#
#--------------------------------------------------------------------------.



############################################################################.
# REVIEW
#
# SIMILARITIES BETWEEN VECTORS AND LISTS 
#
# - Both VECTORS and LISTS can have names
#
# - Indexing with [single-brackets]
# 
#   VECTORS and LISTS can be indexed with [single-brackets] in the same ways. 
#   With VECTORS the result is a VECTOR and  with LISTS the results is a LIST.
#
#   There are 4 ways of using [single-brackets] for indexing.
#
#     o position position numbers, eg. someVector[c(1,2)]        or someList[c(1,2)]
#     o negative position numbers, eg. someVector[c(-1,-2)]      or someList[c(-1,-2)]
#     o logicals (TRUE/FALSE),     eg. someVector[c(TRUE,FALSE)] or someList[c(TRUE,FALSE)]
#     o names, eg.  someVector[c("oneName","anotherName")] or someList[c("oneName","anotherName")]
#
# - Indexing with [[double-brackets]]
#   
#     o Retrieves exactly one value from the VECTOR or the LIST
#
#     o Only positive numbers or names can be used for the index
#
#     o If more than one positive number is used e.g. someList[[c(3,2,4)]]
#       or more than one name is used, eg. someList[c("classes","ids2030","sectionC")]
#       then recursive indexing is used. 
#       This is really the same concept for vectors, however, since a vector can
#       only contain individual values (and not lists) you cannot have more 
#       than one positive number or one name in the double brackets.
#
# - length() returns the length of both vectors and lists
#
# DIFFERENCES BETWEEN VECTORS AND LISTS
#
# - You can use $dollar-sign notation with lists but NOT with vectors
############################################################################.


###########################################################################.
# TERMINOLOGY
#
#    "atomic vector"    is just a fancy name for a "vector"
#    "recursive vector" is just a fancy name for a "list"
#
# Most books, tutorials, etc. refer to "vectors" and "lists" as distinct
# and separate types of objects - exactly as we have.
#
# However, sometimes what we have been calling "vectors" are referred to 
# as "atomic vectors" (since they contain individual "atomic" values that 
# cannot be broken down further.) Sometimes what we have been calling
# "lists" are referred to as "recursive vectors", i.e. vectors that can
# have other vectors inside of them. Most people who use R are not
# familiar with these more complicated terms. However, it is good to
# be aware of these terms in case you come across them while
# reading documentation or other advanced information about R. 
# For example: https://r4ds.had.co.nz/vectors.html
#
# Bottom line:
#    "atomic vector" is just a fancy name for a "vector"
#    "recursive vector" is just a fancy name for a "list"
###########################################################################.

