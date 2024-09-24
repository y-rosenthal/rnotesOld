# NA

```{r}
##########################################################.
##########################################################.
##
## NA is used for data that is "Not Available"       ####
##
##########################################################.
##########################################################.


# NA is a special value in R that represents values that are "not available" ####
# Do NOT put quotes around NA ####
# (see more info below)

# EXAMPLE: grades is a vector that contains the grades that the students in a
# class received on a test. Some students didn't take the test yet so their
# grades are recorded as NA (i.e. "not available").

grades = c(NA, 72, NA, 98, 83)

# A variable can be set to NA, i.e. a vector of 1 element that just contains
# the value, NA.

x = NA

#-----------------------------------------------------------------------------.
# Arithmetic and logical expressions that include even one NA result in NA. ====
#
# This is because if even one value in an expression is "not available",
# you simply cannot know the value of the entire expression.
#-----------------------------------------------------------------------------.

# EXAMPLES:

3 + NA      # NA

3 > NA      # NA

100 + 15 - NA * 2 > 2^4 * 7    # NA

joesSalary = 50
annesSalary = NA
annesSalary + 5            # NA
joesSalary > annesSalary   # NA

grades = c(NA, 72, NA, 98, 83)

grades < 80   # NA TRUE NA FALSE FALSE

# original command:              grades < 80
# replace variable name:         c(NA, 72, NA, 98, 83) < 80
# recycling rule:                c(NA, 72, NA, 98, 83) < c(80, 80, 80, 80, 80)
#                                c(NA<80 , 72<80 , NA<80 , 98<80 , 83<80)
# expressions with NA become NA: c( NA   , TRUE  ,  NA   , FALSE , FALSE)
# displayed on screen:           NA TRUE NA FALSE FALSE

#-----------------------------------------------------------------------------.
# A more "typical" example
#-----------------------------------------------------------------------------.

joesSalary <- 50
suesSalary <- 70
annesSalary <- NA
mikesSalary <- NA 

joesSalary >= suesSalary   # FALSE

joesSalary >= annesSalary  # NA

annesSalary == joesSalary  # NA

annesSalary != joesSalary  # NA

joesSalary + 5   # 55

annesSalary + 5  # NA

suesSalary >= 5 + max(joesSalary, annesSalary)   # NA

#-------------------------------------------------------------------------.
# As shown above, if an expression includes even one NA the value of the entire
# expression is NA. The most confusing part of this rule is the following:
#
# The value of NA == NA  is NA.   ####
#
#         Similarly:
#
# The value of NA != NA  is NA    ####
#
# To test to see if a value is NA, use the function is.na( SOME_VECTOR )  ####
#-------------------------------------------------------------------------.

# DO NOT TEST FOR NAs with == OR WITH !=

NA == NA    # NA      
NA != NA    # NA          
annesSalary = NA
annesSalary == NA    # NA
annesSalary != NA    # NA

# To test is a value is NA or not use is.na(SOME_VALUE)  ####
is.na(NA)   # TRUE
is.na(123)  # FALSE

joesSalary = 50
annesSalary = NA
is.na(joesSalary)   # FALSE
is.na(annesSalary)  # TRUE

# To test is a value is not NA or not use !is.na(SOME_VALUE)  ####
# (i.e. put an exclamation point (the "not" operator) before is.na)

!is.na(NA)   # FALSE
!is.na(123)  # TRUE

joesSalary = 50
annesSalary = NA
!is.na(joesSalary)   # TRUE
!is.na(annesSalary)  # FALSE



#-----------------------------------------------------------------.
# Check values for NA with the is.na(SOME_VECTOR) function ####
#-----------------------------------------------------------------.

annesSalary = NA     # assign NA to annesSalary
mikesSalary = 50

# DON'T DO THIS
annesSalary == NA    # NA
annesSalary != NA    # NA

# DO THIS
is.na(annesSalary)   # TRUE
is.na(mikesSalary)   # FALSE


annesSalary == mikesSalary  #NA
annesSalary != mikesSalary  #NA


#----------------------------------------------------------------.
# is.na works with vectors that contains several values ====
#----------------------------------------------------------------.

# Test for NAs with is.na( SOME_VECTOR )

is.na(c(100,NA,NA,200))       # FALSE TRUE TRUE FALSE


# Test for values that are NOT NA with !is.na( SOME_VECTOR )

!is.na(c(100,NA,NA,200))      # TRUE FALSE FALSE TRUE

#----------------------------------------------------------------------.
# is.na works with vectors of any mode. ====
#----------------------------------------------------------------------.

# The following uses a vector of logical values that includes some NAs
# (make sure you understand this)

is.na(c(TRUE, NA, NA, FALSE)) # FALSE TRUE TRUE FALSE


#----------------------------------------------------------------------.
# NEVER test for NA using == or !=
#----------------------------------------------------------------------.

# DON'T DO THIS !!!

c(100, NA, NA, 200)  == NA    # NA NA NA NA           
c(100, NA, NA, 200)  != NA    # NA NA NA NA           



#############################################################################
# 2023 - BEREN - UP TO HERE - AFTER CLASS 8 ####
#############################################################################


#---------------------------------------------------------------------.
# The length of vectors that contain NAs INCLUDE the NA values.
#---------------------------------------------------------------------.

# The length of the following vector includes the NA values

length( c ( 100, NA, NA, 200) )   # 4

# The na.rm argument in the sum and mean functions allow
# you to "remove" (i.e. ignore) the NA values for purpose
# of the sum or the mean.

nums = c(NA, 10, 5, NA, 20)

#--------------------------------------------------------------------------
# The na.rm argument in the sum and mean functions:
#
#    sum( ...  , na.rm=FALSE)
#    mean (x, trim=0, na.rm=FALSE, ...)
#
# The sum and mean functions include an argument named na.rm
# If na.rm is TRUE then the NA's are ignored for the purpose of the function call
#--------------------------------------------------------------------------



sum(nums)   # NA
sum(nums, na.rm=FALSE) # NA, same as mean(nums)
sum(nums, na.rm=TRUE) # 35
nums

mean(nums) # NA
mean(nums, na.rm=FALSE) # NA, same as mean(nums)
mean(nums, na.rm = TRUE) # 11.667

```