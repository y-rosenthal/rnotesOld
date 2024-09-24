rm (list = ls()) 

############################################################################.
############################################################################.
# NOTE
# 
# This file contains very little new material. 
# This file discusses the attr() and attributes()
# functions and how these functions work with named vectors and lists.
#
# This file also covers general info about named vectors
# and named lists. However, that was already covered in the 
# previous file, 000415-lists-v30.R. 
#
# Therefore we will just cover the new material. If you want to 
# review the rules of named vectors and named lists you can 
# read the rest of the file on your own.
############################################################################.
############################################################################.



######################################################################.
# attr()   and   attributes() functions
######################################################################.

#-----------------------------------------------------------------------------.
# attr( SOME_OBJECT , "someAttribute" )  =   SOME_VALUE
#
#      This will set the value of the "someAttribute" on SOME_OBJECT to SOME_VALUE
#
#
# attr( SOME_OBJECT , "someAttribute" )
# 
#      This retrieves the value of the attribute.
#
#
# Any data in R can have associated "attributes" added onto it. 
# The attributes are additional information that is attached to the main information.
# This is done with the attr function.
#-----------------------------------------------------------------------------.

# Set up some data.

grades <- c(70,80,90,100)    # some grades

# Set the value of the "campus" attribute on the grades variable to "beren"
attr(grades, "campus") <- "beren"   


# Set the value of the "semester" attribute on the grades variable to "beren"
attr(grades, "semester") <- "fall 2020"  # attach the "semester" attribute to the grades

# The grades vector now displays the actual grades as well as the values of
# the attributes

grades
# [1]  70  80  90 100
# attr(,"campus")
# [1] "beren"
# attr(,"semester")
# [1] "fall 2020"

# grades is still a regular numeric vector.
# It just has additional attributes attached to it.

mean(grades)   # 85

mode(grades)   # "numeric"

str(grades)
# num [1:4] 70 80 90 100
# - attr(*, "campus")= chr "beren"
# - attr(*, "semester")= chr "fall 2020"


#-------------------------------------------------------------
# attr can be used to set or get a single attribute
#-------------------------------------------------------------

attr(grades, "campus")     # "beren"     - display the campus
attr(grades, "semester")   # "fall 2020" - display the semester

attr(grades, "campus") <- "wilf"     # change the campus

attr(grades, "campus")     # "wilf"  - display the new value of the campus attribute


# show the new data

grades              
# [1]  70  80  90 100
# attr(,"campus")
# [1] "wilf"
# attr(,"semester")
# [1] "fall 2020"

str(grades)
# num [1:4] 70 80 90 100
# - attr(*, "campus")= chr "wilf"
# - attr(*, "semester")= chr "fall 2020"



#----------------------------------------------------------------------------.
# attributes( SOME_OBJECT ) 
#
#   returns a LIST of just the attributes of the object.
#----------------------------------------------------------------------------.

# The attributes function returns a LIST of the attributes on an object
# without the actual data - i.e. without the actual grades

attributes(grades)

# $campus
# [1] "beren"
# 
# $semester
# [1] "fall 2020"





############################################################################.
# R uses attributes to add new features to R. The following are all
# implemented by adding different attributes onto either a vector or a list.
#
#  - named vectors
#
#    A named vector is a vector that has a names attribute. 
#    The value of the names attribute
#    is a character vector of the same length as the original vector.
#    You can use the names as one more way to retrieve the values from the vector.
#
#  - named lists
#
#    A named list is very similar to a named vector.
#
#  - matrices (singular is matrix)
#
#    A matrix is a vector with a "dim" attribute.
#    The value of the "dim" attribute is a numeric vector with exactly 2 values.
#    The first value is the  number of rows in the matrix.
#    The 2nd value is the number of columns in the matrix.
#    The #rows * # of columns must be equal to the length of the underlying vector.
#
#   - factors
#     a numeric vector with different attributes.
#     We'll cover this later.
#     attributes: class = "factor"
#                 levels = # the "level names" of the factor
#
#   - data.frames
#     A list of equal length vectors.
#     attributes: class = "data.frame"
############################################################################.

#-------------------------------------------------------------------
# named vectors
#
# o names() function for applying names to vectors
# o accessing contents of a vector using position names
#-------------------------------------------------------------------

# EXAMPLE
avgAgeOfVoters <- c(25, 42, 32)
names(avgAgeOfVoters) <- c("democrat", "republican", "independent")

avgAgeOfVoters

# democrat  republican independent 
#       25          42          32 


# ANOTHER EXAMPLE
salaries <- c(100,50,70,85)
salaries

# add names to the vector
names(salaries) <- c("joe", "sue", "bob", "anne")

salaries
# joe  sue  bob anne 
# 100   50   70   85 

sum(salaries)  # 305 - still works like a numeric vector

#---------------------------------------------------------------------.
# named vectors are just regular vectors that have a "names" attribute
#---------------------------------------------------------------------.

salaries
# joe  sue  bob anne 
# 100   50   70   85 

attributes(salaries)
# $names
# [1] "joe"  "sue"  "bob"  "anne"



# names(salaries) is a shortcut for attr(salaries, "names") 

salaries
names(salaries)         # "joe" "sue" "bob" "anne"
attr(salaries, "names") # same thing - i.e. the value of the "names" attribute

attributes(salaries)    # a list of all the attributes

names(salaries)   # same as attr(salaries,"names")
# $names
# [1] "joe"  "sue"  "bob"  "anne"

mode(salaries)    # "numeric"

sum(salaries)     # 305


# you can use names of positions to access the data
# This is similar to the way you can use position numbers to access the data

# EXAMPLE : show the salaries for joe and bob

# One way:
salaries[c(1,3)]

# Another way using names:
salaries[c("joe","bob")]

salaries[c("joe", "bob", "joe", "bob")]  # you can repeat names just like ...
salaries[c(1,3,1,3)]                     # you can also repeat numbers

# salaries is still a NUMERIC vector
# it just has "names" associated with the positions
#
# it is NOT a character vector
# it is NOT a dataframe

sum(salaries)  # you can still sum the values - it is still a numeric vector
mode(salaries) # still numeric
class(salaries) # still numeric

attributes(salaries)  # it has names


# names(salaries) is a character vector
names(salaries)  # "joe" "sue" "bob" "anne"

salaries
mode(names(salaries))  # character
class(names(salaries)) # character

mode(salaries)   # numeric

names(salaries)   # get the vector of names
attr(salaries, "names")  # same thing - names(salaries) is just a shorthand


# Display just the name of the 3rd person
names(salaries)[3]    

salaries[3]  

salaries[3] + 5


# Assign NULL to any attribute you want to remove
grades

attr(grades, "students") = NULL

grades

salaries
names(salaries) = NULL

salaries


#############################################################
# BEREN - UP TO HERE - AFTER CLASS 17
#############################################################
rm(list=ls())

salaries <- c(100,50,70,85)
names(salaries) <- c("joe", "sue", "bob", "anne")
salaries


# change the name of the 3rd person to Robert
names(salaries)[3] <- "robert"
salaries
# The following is the WRONG way to do it.
#salaries[3] <- "robert"    # this changes the number not the name


# Change the name of sue to "susan" (do it in a way so that you don't have to know the numeric position that susuan is in)
salaries   # show the original vector
names(salaries)[  names(salaries) == "sue"] <- "susan"   # change susan's name
salaries   # show the change


# We can build our own named vector very simply
grades = c(70,80,90)
attr(grades, "students") = c("joe", "sam", "sue")
grades


grades2 = c(75,85,95)
attr(grades2,"names") = c("joe","sam","sue")
grades2

grades2[c("joe","sue")]


#-------------------------------------------------------------------
# names of list items 
#
# names of items in a list are also in the names attribute and
# are returned via the names function.
#-------------------------------------------------------------------
unnamedList = list(c("joe","sam","sue"),
                 c(70,80,90),
                 c(75,85,95),
                 c("fr","so","fr"))
unnamedList

attributes(unnamedList)
attr(unnamedList, "names")

# now let's create a gradebook with names 
gradebook = list(students = c("joe","sam","sue"),
                 test1 = c(70,80,90),
                 test2 = c(75,85,95),
                 year = c("fr","so","fr"))
gradebook

attributes(gradebook)

attr(gradebook, "names")

# another way to create names
names(unnamedList) = c("people", "exam1", "exam2", "yearInSchool")
unnamedList # now we actually have names

# you can use those new names
unnamedList$people


#....................................................................
# QUESTION
# Write code to show all of the attributes of the gradebook list
#....................................................................

attributes(gradebook)

gradebook$students     # only allowed since the names attribute exits


#....................................................................
# QUESTION
# Write code to show just the "names" attribute of the gradebook
#....................................................................

# ANSWER 1
attr(gradebook, "names")  # "students" "test1" "test2" "year"

# ANSWER 2
names(gradebook)  # names(gradebook) is just shorthand for   attr(gradebook,"names")


#....................................................................
# QUESTION 
# names(gradebook) is a character vector. Write code to prove that.
#....................................................................

# ANSWER
mode(names(gradebook))  # character



#....................................................................
# QUESTION
# Write code to change the name test1 to exam1
#....................................................................

# ANSWER
gradebook   # notice test1 is in the 2nd position

names(gradebook)[2] = "exam1"   # change the 2nd name in the names vector to "exam1"

gradebook


#....................................................................
# QUESTION
# Write code to change the name test2 to exam2.
# Write the code so that you do NOT have to know which position test2 is in the list.
#....................................................................

gradebook
# ANSWER
names(gradebook)[names(gradebook) == "test2"] = "exam2"
gradebook  # test2 was changed to exam2


