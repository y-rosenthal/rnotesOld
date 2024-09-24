######################################################################.
# SUMMARY OF TOPICS INCLUDED IN THIS FILE (it's possible I missed some)
#
# - DEFINITION: object 
#     a structure or single item of data that R knows about
#
# - mode function: 
#     Returns the underlying structure of R objects.
#     The modes that we've learned about are:
#     "numeric"  "logical"  "character"  "list"
#     See also the class function (covered in a later file)
#
# - is.XXXX functions, eg. is.numeric, is.character, is.logical
#     Note that there are many other is.XXXX that work with other 
#     R data types. These include functions such as
#     is.list, is.matrix, is.data.frame, etc etc etc
#
#


#####################################################################.
# DEFINITION - OBJECT
# 
# An OBJECT is a value or a collection of values that R treats as a single unit. ####
#              e.g. something that can be assigned to a variable.
#  
# EXAMPLES 
#   - 1:3 is an object
# 
#   - c("apple", "pear") is an object
#
#   - even a function is an object, such as the following or any other function.
#
#        function(x,y) {
#          a = x + y
#          b = a * 2
#          return (a + b)
#        }
#
#   - Anything that can be assigned to a variable is an OBJECT even when it is
#     not actually assigned to a variable. For example, the following line of
#     code references two different objects.
#
#          > c(1,2,3) + seq(from=100,to=300,by=100)
#          [1] 101 202 303
# 
#     Both c(1,2,3) and seq(from=100,to=300,by=100) are objects. Each of them
#     could have been assigned to different variables. The result of the entire
#     line, i.e. c(101,202,303) is yet another object. It too could have been assigned
#     to a variable.
#####################################################################.


#####################################################################.
# TOPIC :    mode( SOME_OBJECT )
#
#   mode( SOME_OBJECT) returns the "type" of info contained in the object ####
#   e.g. "numeric" or "character" or "logical"
#
#   A single vector may only hold one "mode" of information ####
#   e.g. "numeric" or "character" or "logical"
#####################################################################.

# A single vector may only hold one "mode" of information
# (character, numeric, logical)

mode(c(100,200,300))   # numeric

mode(c(TRUE, FALSE))   #logical

mode(c("apple","pear"))  # character

# You can use mode with any expression, not just with variables
nums = c(100,200,300)
mode(nums)                          # "numeric"
mode(rep(seq(10,14,by=2),each=3))   # "numeric"
mode(rep(c("apple","orange"),each=3))   # "character"


#...........................................................
# Question - what will the following command return???
#
#     > mode(mode(c(100,200,300)))
#...........................................................

# ANSWER
# 
# The following command returns "character". 
# See the comments below for explanation.

mode(mode(c(100,200,300)))   # answer is "character"  (surprised? see below)

# original command:                           mode(mode(c(100,200,300)))
# mode(c(100,200,300)) becomes "numeric":     mode("numeric")
# The word "numeric" is a "character" value:  "character" 


#-----------------------------------------------------------------------------.
# THIS COMMENT IS NOT REQUIRED FOR OUR CLASS.
# YOU MAY SKIP THIS.
# BUT I RECOMMEND THAT YOU READ IT IF YOU PLAN TO USE R MORE IN THE FUTURE.
#-----------------------------------------------------------------------------.
#
# typeof (SOME_OBJECT)
#
# NOTE: We will NOT be covering the typeof function in this class,
# (you are NOT resposible for it). However, if you are interested in R,
# it is good to know about the typeof function.  
#
# typeof(SOME_OBJECT) is VERY SIMILAR to the mode(SOME_OBJECT).
# In most cases, typeof and mode return the same values. However, in some 
# cases, the return values are different. The reason why is explained below.
# Most introductory R tutorials/books/etc teach about the "mode" function
# and not about the "typeof" function. Therefore we will focus on "mode" 
# and NOT on "typeof". However, many sources of "best practices" for R
# suggest that you use "typeof" instead of "mode". Therefore if you continue
# to use "R" it may be beneficial (but not required) to look more 
# deeply into the similarity and differences between the "mode" and "typeof"
# functions. See the following pages for similarities and differences:
#
#    https://renenyffenegger.ch/notes/development/languages/R/functions/mode
#    https://renenyffenegger.ch/notes/development/languages/R/functions/typeof
#
#
# WHY ARE THERE TWO DIFFERENT FUNCTIONS?
#
# R was originally created as an "open source" version of another language called "S".
# However, R has been modified many times over the years and has diverged
# somewhat from "S". "S" is still used but it nowhere as popular as "R" is.
# The mode function was designed to work the same in "R" as in "S".
# However, "R" and "S" do have differences. The "typeof" function is 
# very similar to the "mode" function, except that "typeof" can sometimes
# return different values than "mode" since "typeof" is based on the way
# "R" works. 
#-----------------------------------------------------------------------------.


###############################################################################.
#
# The "is dot" functions (e.g. is.numeric, is.character, etc) return TRUE or FALSE ####
#
# is.numeric(SOME_OBJECT)   #TRUE if mode(SOME_OBJECT) is numeric FALSE otherwise  
# is.logical(SOME_OBJECT)   #TRUE if mode(SOME_OBJECT) is logical FALSE otherwise
# is.character(SOME_OBJECT) #TRUE if mode(SOME_OBJECT) is character FALSE otherwise
#
###############################################################################.

nums = c(100,200,300)
tf = c(TRUE,FALSE,TRUE,TRUE)
fruit = c("apple", "orange")

mode(nums)   # "numeric"
mode(tf)     # "logical"
mode(fruit)  # "character"

is.numeric(nums)   # TRUE
is.numeric(tf)     # FALSE
is.numeric(fruit)  # FALSE

is.logical(nums)   # FALSE
is.logical(tf)     # TRUE
is.logical(fruit)  # FALSE

is.character(nums)  # FALSE
is.character(tf)    # FALSE
is.character(fruit) # TRUE


###############################################################################.
# BE CAREFUL ... Sometimes even if something "looks like" a numeric
# or a logical vector ... it might actually be a character vector!!!
###############################################################################.

mode(c("100","200","300"))   # character

mode(c("TRUE","FALSE"))   # character



#############################################################################.
#
# ERROR!
# You can't do math with character vectors even if the values "look like" numbers. ####
#
##############################################################################.

# You cannot do math with character vectors, even if the values "look like" numbers.
charNums = c("100", "200")    
charNums * 3   # error - you cannot do math with character vectors
sum(charNums)  # error - you cannot do math with character vectors


#######################################################################.
#
# WARNING!!!
#
# You cannot use character vectors to index into other vectors   ####
# even if the index values "look like" logical values
#
# See examples below.
#######################################################################.

# EXAMPLE 

nums = c(100,200,300,400)  

# You cannot "index" the vector with character values - DON'T DO THIS

nums [ "apple" ]  # NA
nums[ c("apple", "pear", "comquat", "peach")]   # NA NA NA NA 

# Same result even if the character values "look like" numbers or like logical values!!!

nums[c("1","3")]                       # NA NA
nums[c("-2","-4")]                # NA NA NA
nums[c("TRUE","FALSE","TRUE","FALSE")] # NA NA NA NA

# (we will see below that there is a way to "convert" a character vector
# into a numeric or logical vector)



#######################################################################.
# REMINDER - so far we learned about 3 different ways to index a vector 
#    o positive position numbers
#    o negative position numbers 
#    o a logical vector
# 
# See examples below.
#######################################################################.

# EXAMPLES
nums = c(100,200,300,400)

nums[c(1,3)]                   # 100 300 - values from positions 1 and 3
nums[c(-2,-4)]                 # 100 300 - all values EXCEPT those in positions 2 and 4
nums[c(TRUE,FALSE,TRUE,FALSE)] # 100 300 - all values that correspond to the TRUE's in the index





########################################################################.
# BEREN - UP TO HERE - AFTER CLASS 13
#
# MIDTERM TOPICS UP TO HERE
########################################################################.



########################################################################.
# WILF - UP TO HERE - AFTER CLASS 13
#
# MIDTERM TOPICS UP TO HERE
########################################################################.




################################################################.
################################################################.
##
##  TOPIC :  implicit conversions
##
################################################################.
################################################################.


##########################################################################.
# WHAT IS AN IMPLICIT CONVERSION ?  ####
#
# An "implicit" conversion from one mode to another mode is a conversion 
# that happens "automatically".
#
# Implicit conversions can happen for different reasons.
# For example
#
#   - If you try to mix values with different modes (e.g. numeric, logical,
#     character) into a single vector, then R implicitly converts
#     all the values to a single mode (these details are covered below)
#
#   - If you try to do math with logical values, then R implicitly converts 
#       TRUE's to 1's and 
#       FALSE's to 0's
#
#   - If you try to use numbers with the operators ! & | 
#     R will implicitly convert 
#       0's to FALSE's and 
#       all other numbers to TRUE's.
#
# IF R DOES IT AUTOMATICLY WHY SHOULD I CARE ABOUT IMPLICIT CONVERSIONS? ####
#
#   Sometimes, you may intentionally want implicit conversions to happen. 
#   For example, 
#
#     - to get the total number of TRUE's in a logical vector you can 
#       use the sum() function. 
#
#     - To get the percent of TRUEs in a logical vector you can 
#       use the mean() function. See examples below.
#
#     - other similar examples exist of doing "math" with TRUEs and FALSEs
#
#   It is also very important to understand how R performs implicit conversions
#   since understanding these rules will help you figure out errors in your
#   code. For example, sometimes, you may have an error in your code and R may
#   display a value you never expected. At times like these it is very helpful 
#   to understand the rules R uses to do implicit conversions to 
#   help you figure out what you did wrong.
#
# There are different situations in R where implicit conversions happen. 
# These are described below.
##########################################################################.



##########################################################################.
# ALL VALUES IN THE SAME VECTOR ARE IMPLICITLY CONVERTED TO THE SAME MODE ####
#
# A vector may only contain a single mode of data
# (e.g. numeric, logical or character). 
# 
# Different values placed in the same vector are all implicitly converted
# to the same mode. The rule is: 
#
#   logical values BECOME numeric AND THEN numeric values BECOME character
#
# You can remember this with the following diagram:
#
#   logical ----> numeric ------> character                              ####
#
# See examples below.
##########################################################################.



#---------------------------------------------------.
# If you mix logical and numeric in the same vector:   ####
#
#   TRUE becomes 1 and 
#   FALSE becomes 0
#---------------------------------------------------.

c(TRUE, 100)                      # 1  100

c(FALSE, TRUE, -22, TRUE, FALSE)  # 0   1 -22   1   0

#------------------------------------------------------.
# If you mix logical and character in the same vector           ####
# the logicals are implicitly converted to character:
#
#   TRUE becomes "TRUE" and
#   FALSE becomes "FALSE"
#---------------------------------------------------.

c(TRUE, "apple")  # same as    c("TRUE", "apple")


#---------------------------------------------------.
# If you mix numeric and character values in the same vector               ####
# the numbers are implicitly converted to character.
#---------------------------------------------------.

c(123, "apple")  # "123"   "apple"   (notice the "quotes" around "123")


 
#------------------------------------------------------------.
# If you mix all three types, logical, numeric and character in the same vector ####
# everything becomes character.
#------------------------------------------------------------.

c(100, TRUE, "apple")  # "100"   "TRUE"  "apple"  (notice the "quotes")



##############################################################################.
# If you try to do math with logicals               ####
#
#     TRUE becomes 1
#     FALSE becomes 0
##############################################################################.

3 + TRUE   # 4

FALSE * c(100,200,300)   # 0  0  0

TRUE + FALSE  # 1

FALSE + TRUE + TRUE  # 2

FALSE / TRUE    # 0

sum(c(FALSE, TRUE, TRUE, FALSE))  # 2

mean (c(FALSE, TRUE, TRUE, FALSE))  # 0.5 - ie. same as mean(c(0,1,1,0)) 


#.......................................................................
# QUESTION (example of purposely making use of R's implicit conversion
#            of logical to numeric)
#
# The passing grade on a test is 65 (and higher). Given the grades vector below,
# use the sum function to determine the number of students who passed.
#
#    > grades = c(90,60,80,85,53)
#.......................................................................

grades = c(90,60,80,85,53)

#     ANSWER
#
#     In the code below, the >= operator results in logical values (i.e. TRUE/FALSE values).
#     Since the sum function expects numbers, the logical values are 
#     "implicitly" (i.e. automatically) converted into numbers.
#     TRUE's are converted to 1's and FALSE's to 0's. See below for a step
#     by step analysis of how R processes the code.

sum ( grades >= 65 )  # 3

# original :           sum ( grades >= 65 )
# >=       :           sum(c(TRUE,FALSE,TRUE,TRUE,FALSE))
# implicit conversion: sum(c(1,0,1,1,0))
# final answer:        3

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# NOTE: 
#
# A student asked during class if we could get the same answer 
# WIHTOUT using the sum function.
# 
# You could by using the following code:     length( grades [ grades >= 65 ] ) 
# 
# Even though this alternative answer is not wrong, using the sum function
# as shown in the original answer above is shorter, is very commonly used in R,
# and looks more professional to many R coders.
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .



#.......................................................................
# QUESTION (another example of purposely making use of R's implicit conversion
#            of logical to numeric)
#
# Passing on a test is 65 and up. Given the grades vector below,
# use the mean function to determine the percent of the class who passed.
#
#    > grades = c(90,60,80,85,53)
#.......................................................................

grades = c(90,60,80,85,53)

#     ANSWER (see below for step by step explanation)

mean ( grades >= 65 )  # 0.6

# original           : mean ( grades >= 65 ) 
# >=                 : mean(c(TRUE,FALSE,TRUE,TRUE,FALSE))
# implicit conversion: mean(c(1,0,1,1,0))
# final answer       : 0.6




############################################################################.
#
# IMPLICIT CONVERSION OF NUMBERS USED WITH   !   &  |                ####
#
# The operators !  &  | are defined to be used with logical values.
# When numbers are used with ! & | operators:
#
#     0 becomes FALSE
#
#     all other numbers become TRUE
#
############################################################################.

0 & TRUE     # FALSE - 0 is converted to FALSE

FALSE | 99   # TRUE - 99 is converted to TRUE

c(999,0,-100,1,0) & c(TRUE,TRUE,TRUE,TRUE,TRUE)  # TRUE FALSE TRUE TRUE FALSE

# original:                            c(999,0,-100,1,0) & c(TRUE,TRUE,TRUE,TRUE,TRUE)
# implicitly convert nums to logicals: c(TRUE,FALSE,TRUE,TRUE,FALSE) & c(TRUE,TRUE,TRUE,TRUE,TRUE)
#                                   :  c(TRUE&TRUE,FALSE&TRUE,TRUE&TRUE,TRUE&TRUE,FALSE&TRUE)
#                                          TRUE      FALSE      TRUE      TRUE       FALSE



############################################################################.
#
# ERROR!!! - DON'T USE "CHARACTER" VALUES WITH   !   &  |           ####
#
# The operators !  &  | are defined to be used with logical values.
# If you try to use these operators with ANY character values, 
# (even "TRUE" and "FALSE" - with "quotes") you will get an ERROR.
#
############################################################################.

# The following all produce ERRORS!

"TRUE" & FALSE   # ERROR - "TRUE" is a character value 

!"FALSE"         # ERROR - "FALSE" is a character value





################################################################.
################################################################.
##
##  TOPIC :  EXPLICIT CONVERSIONS
##
################################################################.
################################################################.

##############################################################################.
#
# The "as dot" functions are used to "explicit conversions"      ####
#
#    as.numeric( SOME_VECTOR )   - converts SOME_VECTOR to numeric
#    as.logical( SOME_VECTOR )   - converts SOME_VECTOR to logical
#    as.character( SOME_VECTOR ) - converts SOME_VECTOR to character
#
# See examples below.
#
##############################################################################.

###############################################################################.
#
# as.numeric ( LOGICAL_VECTOR )                  ####
#
#     converts TRUE to 1 and FALSE to 0
#
#
# as.numeric ( CHARACTER_VECTOR )                ####
#
#   values that "look like" numbers - e.g. "100" are converted to numbers, e.g. 100
#   values that don't "look like numbers" e.g. "apple" are converted to NA
#
##############################################################################.


# Convert TRUE to 1 and FALSE to 0

as.numeric(c(TRUE, FALSE, TRUE, TRUE))   # 1 0 1 1


# Convert character values that look like numbers to numbers
# all other character values become NA

as.numeric( c("100", "apple", "-22.123"))     # 100 NA  -22.123


charNums = c("100", "200", "300")
charNums
mode(charNums) # character
charNums + 1   # ERROR - can't do math with "character" values

nums = as.numeric(charNums)   # explicit conversion from character to numeric
nums
mode(nums)   # numeric
nums + 1     # 101 201 301 

as.numeric(charNums) + 1  # ALSO GOOD!!  same as c(100,200,300) + 1



#-----------------------------------------------------------------------------.
# Question 
# 
# The two lines of code below produce the results shown. 
# Explain why the 2nd line produces all NA values.
#
#  > as.numeric(c(TRUE,FALSE,TRUE))    
#  [1] 1 0 1
#
#  > as.numeric(c(TRUE,FALSE,"TRUE"))    
#  [1] NA NA NA
#-----------------------------------------------------------------------------.


##############################################################################.
#
# as.logical ( NUMERIC_VECTOR )                ####
#
#     converts 0 to FALSE
#     converts all other numbers to TRUE
#
#
# as.logical ( CHARACTER_VECTOR )               ####
#
#     "TRUE",  "true"  and "T" become TRUE
#     "FALSE", "false" and "F" become FALSE
#     Everything else becomes NA
#
##############################################################################.

# 0 becomes FALSE,  all other numbers become TRUE
as.logical(  c(100 , 0 , -999 , 0 , 25.2345)   )   # TRUE FALSE TRUE FALSE TRUE

# "TRUE",  "true"  and "T" become TRUE
# "FALSE", "false" and "F" become FALSE
# Everything else becomes NA

as.logical(c( "TRUE", "F", "FALSE", "f", "apple") )   # TRUE FALSE FALSE NA NA


#-----------------------------------------------------------------.
# QUESTION: Explain why the following produces what it does.
#
#   > as.logical( c(1, 0, "3"))
#   [1] NA  NA  NA
#-----------------------------------------------------------------.

# ANSWER

as.logical( c(1, 0, "3"))   # NA NA NA

# original: as.logical( c(1, 0, "3"))
#
# step1 - implicitly convert mix of character and numeric to character:
#           as.logical (  c( "1", "0", "3" ) )
#
# step2 - explicitly convert the character vector to logicals:
#           NA   NA     NA 


#-----------------------------------------------------------------.
# QUESTION: Explain why the following produces what it does.
#
#   > as.logical (  c( "true", 1, 0, "FALSE", "F") )  
#   [1] TRUE  NA  NA  FALSE
#-----------------------------------------------------------------.

# ANSWER:

as.logical (  c( "true", 1, 0, "FALSE", "F") )  

# original: as.logical (   c( "true", 1, 0, "FALSE", "F") ) 
#
# step1 - implicitly convert mix of character and numeric to character:
#           as.logical (  c( "true", "1", "0", "FALSE", "F") )
#
# step2 - explicitly convert the character vector to logicals:
#           TRUE   NA   NA    FALSE    FALSE




##############################################################################.
#
# as.character (ANY_VECTOR) - explicitly convert values to character     ####
#
##############################################################################.

# explicitly convert numeric to character
as.character(c(100,200,300))   # "100"  "200"  "300"


# explicitly convert logical to character
as.character(c(TRUE, FALSE, TRUE, TRUE, FALSE))   # "TRUE" "FALSE" "TRUE" "TRUE" "FALSE"

#######################################################################.
# BEREN - UP TO HERE - AFTER CLASS 14  
# (class was 30 min shorter than usual due to unexpected situation)
#######################################################################.
