# Comment on sorting
# see previous file

"apple" < "ball"    #TRUE
"ball"  < "apple"    #FALSE

FALSE < TRUE       #TRUE
TRUE < FALSE        #FALSE



###########################################################
###########################################################
##
## Logical operators:     !   &   |
##
###########################################################
###########################################################

#------------------------------------------------
# The ! operator
#
# The ! operator (pronounced as "not")
# changes TRUE to FALSE
# changes FALSE to TRUE
#
# "Truth Table" - a "truth table" shows how a
#                 logical operator works.
#
#      x      !x
#    -----  -----
#    TRUE   FALSE
#    FALSE  TRUE
#------------------------------------------------


!TRUE    # FALSE

!FALSE   # TRUE

! c(TRUE,FALSE,TRUE,TRUE)   # FALSE TRUE FALSE FALSE

# Example

tests = c(NA, 80, NA, 90, 88)   
is.na(tests)   # TRUE FALSE TRUE FALSE FALSE
!is.na(tests)  # FALSE TRUE FALSE TRUE TRUE

#-------------------------------------------------------------------
# QUESTION - tests and students are parallel vectors.
# The test grades are recorded in the same order as the student names.
# i.e. abe did not take the test so he is recorded as NA
#      bob got an 80
# etc.
# Answer the questions below.
#--------------------------------------------------------------------

tests = c(NA, 80, NA, 90, 88)   
students = c("abe", "bob", "carla", "dana", "ed")

# QUESTION - Write a command to
# show the names of the students who did NOT take the test
# (i.e. the grade is NA for those students)
students [ is.na(tests) ]

# QUESTION - Write a command to
# show the names of the students who did take the test
# (i.e. the grade is NOT NA for those students)
students [ !is.na(tests) ]

#-------------------------------------------------------------------
# QUESTION
#
# mathClass contains the names of the students in a math class.
# committee is the names of the students on the yearbook committee.
#
# Answer the questions below.
#--------------------------------------------------------------------

# Another example
mathClass = c("abe", "bob", "carla", "dana", "ed", "fran", "george", "hillary")
committee = c("bob","zoe","abe","victor")

# QUESTION - write a command to show the names of the students in
# the math class who are on the yearbook committee. Use the %in% operator.

mathClass[ mathClass %in% committee ]   # one answer

committee[ committee %in% mathClass ]   # another (just as valid) answer


# QUESTION - write a command to show the names of the students in
# the math class who are NOT on the yearbook committee. Use the %in% operator.


mathClass[ ! mathClass %in% committee ]     # answer


#--------------------------------------------------------
# The & operator
#
# & operator (pronounced "and") is used to combine two different conditions.
# Result is TRUE only when both x and y are TRUE
# otherwise result is FALSE.
#
#  TRUTH TABLE:
#
#                       (result)
#        x       y       x&y
#      -----   -----    -----
#      TRUE    TRUE     TRUE
#      TRUE    FALSE    FALSE
#      FALSE   TRUE     FALSE
#      FALSE   FALSE    FALSE
#--------------------------------------------------------


TRUE & TRUE   # TRUE

TRUE & FALSE  # FALSE

FALSE & TRUE  # FALSE

FALSE & FALSE  # FALSE


#-----------------------------------------------------------
# & works in a "vectorized" way (as you'd expect from an R operator)
# i.e. the 1st values of the left and right hand vectors are operated on then 
#      the 2nd values from the left and right hand vectors are operated on, etc.
#      etc.
#-----------------------------------------------------------

c(TRUE,FALSE,TRUE,FALSE) & c(FALSE,FALSE,TRUE,TRUE)

# original :   c(TRUE,FALSE,TRUE,FALSE) & c(FALSE,FALSE,TRUE,TRUE)
# vector operation: c(TRUE&FALSE , FALSE&FALSE , TRUE&TRUE , FALSE&TRUE)
# final answer:       FALSE        FALSE         TRUE        FALSE

#-----------------------------------------------------------
# recycling rule
#
# as with all vectorized operations the recycling rule is used 
# when one of the two vectors is shorter than the other.
#-----------------------------------------------------------

c(TRUE, FALSE) & c(FALSE, TRUE, TRUE, TRUE)     # FALSE FALSE TRUE FALSE

# original :        c(TRUE, FALSE) & c(FALSE, TRUE, TRUE, TRUE)
# recycling:        c(TRUE, FALSE, TRUE, FALSE) & c(FALSE, TRUE, TRUE, TRUE)
# vector operation: c(TRUE&FALSE , FALSE&TRUE , TRUE&TRUE , FALSE&TRUE)
# final answer:       FALSE        FALSE         TRUE        FALSE




# You can have many different logical vectors &'ed together 

c(TRUE, TRUE) & c(FALSE, TRUE) & c(TRUE, FALSE)   # FALSE FALSE

# original: c(TRUE, TRUE) & c(FALSE, TRUE) & c(TRUE, FALSE)
# first &:  c(TRUE&FALSE , TRUE&TRUE)      & c(TRUE, FALSE)
#           c(FALSE      , TRUE)           & c(TRUE, FALSE)
# 2nd &:              c(FALSE & TRUE , TRUE & FALSE)
# Final answer:             FALSE         FALSE


#-----------------------------------------------------------
# QUESTION - nums is a vector that contains some numbers. Write a SINGLE COMMAND
#            that displays only those numbers from nums that are divisible by 
#            BOTH 3 and 5.
#-----------------------------------------------------------

nums = c(5, 6, 7, 15, 13, 20)   # some numbers
nums

# Let's think about how to do each condition separately

nums [nums %% 3 == 0] # 6 15 - numbers that are divisible by 3

nums [nums %% 5 == 0] # 5 15 20 - numbers that are divisible by 5


# When we combine the conditions with & we get the correct result

nums [nums %% 3 == 0  &  nums %% 5 == 0] # 15 - numbers that are divisible by BOTH 3 and 5

#-------------------------------------------
# WILF - UP TO HERE - AFTER CLASS #10
#-------------------------------------------


#-----------------------------------------------------
# QUESTION - test1, test2 and students
# are parallel vectors.
# Answer the questions below.
#-----------------------------------------------------

test1   =  c(90,    88,   87,     84,    92)
test2   =  c(70,    80,   90,     94,    100)
students = c("abe","bob","carla","dana","ed")

#.........................................................................
# QUESTION - Write a command to show the names of the students who got an 
# 85 or above on both tests.
#.........................................................................

 
# ANSWER
students [  test1 >= 85  &  test2 >= 85       ]   # CORRECT ANSWER

# original:    students [  test1 >= 85  &  test2 >= 85       ]
#              students [  c(TRUE,TRUE,TRUE,FALSE,TRUE)  &  c(FALSE,FALSE,TRUE,TRUE,TRUE)       ]
#     &:       students [  c(TRUE&FALSE,TRUE&FALSE,TRUE&TRUE,FALSE&TRUE,TRUE&TRUE) 
#              students [  c(FALSE,       FALSE,     TRUE,     FALSE     ,TRUE) ]
#               "carla"  "ed"

#,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
# NOTE:   When you use numbers in the context of logical operators (i.e. ! & |)
#
# zero becomes FALSE
# anything else become TRUE
#,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

as.logical(0)  #FALSE

as.logical(99)  #TRUE

as.logical(-99.27)  #TRUE

as.logical(1)  #TRUE


0 & 1  # same as   FALSE & TRUE

976.123 & 0  # same as TRUE & FALSE

-27.98 & 15   # same as TRUE & TRUE

#,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
# WARNING
#
# You must have an expression that results in a LOGICAL vector on both
# sides of the &. In the code below, test1 is NOT a logical vector but it
# appears on the left side of the &. This is WRONG.
#
#       # WRONG!
#       # students [ test1 & test2 >= 85 ]    # WRONG WRONG WRONG !!! DONT DO THIS !!!
#
# The right hand side of the & is OK - it is test2>=85 which is a logical vector.
# The correct way to write this code is as was done above:
# 
#       students [  test1 >= 85  &  test2 >= 85       ]   # CORRECT ANSWER
#,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,


# CORRECT ANSWER (already shown above)
students[ test1 >= 85 & test2 >= 85 ]

# WRONG ANSWER _ DONT DO THIS !!!
students [ test1 & test2 >= 85 ]    # WRONG WRONG WRONG !!! DONT DO THIS !!!

#   original;           students [  test1 & test2 >= 85 ]    # WRONG WRONG WRONG !!! DONT DO THIS !!!
#   replace values:     students [   c(90,    88,   87,     84,    92) & c(70,    80,   90,     94,    100) >= c(85,85,85,85,85)]    # WRONG WRONG WRONG !!! DONT DO THIS !!!
#  >=                   students [   c(90,    88,   87,     84,    92) & c(70>=85,80>=85, 90>=85, 94>=85,100>=85)]  
#                       students [   c(90,    88,   87,     84,    92) & c(FALSE,FALSE,TRUE,TRUE,TRUE)]  
# convert #rs to logicals: students [   c(TRUE,TRUE,TRUE,TRUE,TRUE) & c(FALSE,FALSE,TRUE,TRUE,TRUE)]  
#                          students [   c(FALSE,FALSE,TRUE,TRUE,TRUE) ] 
#                          "carla" "dana" "ed"



#-----------------------------------------------------
# QUESTION - test1, test2 and students
# are parallel vectors.
#-----------------------------------------------------

test1   =  c(90,    88,   87,     84,    92)
test2   =  c(70,    80,   90,     94,    100)
students = c("abe","bob","carla","dana","ed")


# QUESTION - Write a command to show the names of the students
# who got in the 80's on test1.

students [ test1 >= 80 & test1 < 90 ]

# QUESTION - Write a command to show the names of the students
# who got in the 80's on test2.

students [ test2 >= 80 & test2 < 90 ]

# QUESTION - Write a command to show the names of the students
# who got in the 80's on both test1 and on test2.

students [ (test1 >= 80 & test1 < 90) & (test2 >= 80 & test2 < 90)]

students [ test1 >= 80 & test1 < 90 & test2 >= 80 & test2 < 90]

students [ test1 >= 80 & (test1 < 90 & test2 >= 80) & test2 < 90]

#--------------------------------------------------------	
# The | operator	
# 	
# |  operator (pronounced "or") is used to combine two different conditions.	
# The symbol is a vertical line or bar (often drawn with a small break in the line)	
# It is found on every standard computer keyboard - just look for it.	
# On my keyboard it is below the backspace, on the same key as the backslash character.	
#	
# The symbol is often referred to as a "pipe character" by technologists.	
# (The reason it is called a "pipe" by technologists originated with the	
#  Unix operating system but it beyond the scope of what we are discussing now	
#  and I don't want to confuse you more than necessary :) ...	
# 	
# Result is TRUE when either x or y are TRUE or when both are TRUE. 	
# Otherwise, the result is FALSE (i.e. the result is only FALSE when both x and y are FALSE)	
#	
#  TRUTH TABLE:	
#	
#                     (result) 	
#        x       y       x|y 	
#      -----   -----    -----
#      TRUE    TRUE     TRUE	
#      TRUE    FALSE    TRUE	
#      FALSE   TRUE     TRUE	
#      FALSE   FALSE    FALSE	
#--------------------------------------------------------

TRUE | TRUE   # TRUE	

TRUE | FALSE  # TRUE	

FALSE | TRUE  # TRUE	

FALSE | FALSE # FALSE

# An example with the recycling rule	

c(TRUE, FALSE) | c(FALSE, FALSE, FALSE, TRUE)	

# original:     c(TRUE, FALSE) | c(FALSE, FALSE, FALSE, TRUE)	
# recycling:    c(TRUE, FALSE, TRUE, FALSE) | c(FALSE, FALSE, FALSE, TRUE)	
#               c(TRUE|FALSE, FALSE|FALSE, TRUE|FALSE, FALSE|TRUE)	
# final result:     TRUE         FALSE       TRUE        TRUE	



# This also works with multiple vectors (same as above with addition of a 3rd vector)	

c(TRUE, FALSE) | c(FALSE, FALSE, FALSE, TRUE) | c(FALSE, TRUE, FALSE, FALSE)	

# original:     c(TRUE, FALSE) | c(FALSE, FALSE, FALSE, TRUE) | c(FALSE, TRUE, FALSE, FALSE)	
# recycling:    c(TRUE, FALSE, TRUE, FALSE) | c(FALSE, FALSE, FALSE, TRUE) | c(FALSE, TRUE, FALSE, FALSE)	
# 1st |:        c(TRUE|FALSE, FALSE|FALSE, TRUE|FALSE, FALSE|TRUE) | c(FALSE, TRUE, FALSE, FALSE)	
#               c(   TRUE,       FALSE,      TRUE,        TRUE)    | c(FALSE, TRUE, FALSE, FALSE)	
# 2nd |:        c(TRUE|FALSE, FALSE|TRUE,  TRUE|FALSE,  TRUE|FALSE)	
# final result:     TRUE         TRUE        TRUE          TRUE




#-----------------------------------------------------
# QUESTION - test1, test2 and students
# are parallel vectors.
#-----------------------------------------------------

test1   =  c(90,    88,   87,     84,    92)
test2   =  c(70,    80,   90,     94,    100)
students = c("abe","bob","carla","dana","ed")


# QUESTION - Write a command to show the names of the students
# who did NOT get in the 80's on test1.

students [ test1 < 80    |    test1 >= 90  ]


# THE FOLLOWING IS WRONG
students [ test1 < 80    &    test1 >= 90  ] # WRONG!!! This should be | not & 

# Even when you get the wrong answer, it is important to be able to 
# work through exactly WHY you got the wrong answer. 

#original:           students [ test1 < 80    &    test1 >= 90  ]
#
# replace numbers:   students [ c(90,88,87,84,92) < c(80,80,80,80,80)    &    c(90,88,87,84,92) >= c(90,90,90,90,90)  ]
#
# replace numbers:   students [ c(90<80,88<80,87<80,84<80,92<80)  &    c(90>=90,88>=90,87>=90,84>=90,92>=90) ]
#
# replace numbers:   students [ c(FALSE,FALSE,FALSE,FALSE,FALSE)  &    c(TRUE,FALSE,FALSE,FALSE,TRUE) ]
#
# &               :   students [ c(FALSE,FALSE,FALSE,FALSE,FALSE) ]
#
# ANSWER - no students :  character(0)




# QUESTION - Write a command to show the names of the students
# who did NOT get in the 80's on test2.

students [ test2 < 80    |    test2 >= 90  ]

# QUESTION - Write a command to show the names of the students
# who did NOT get in the 80's - neither on test1 nor on test2.

students [ (test1 < 80 | test1 >= 90) &  (test2 < 80 | test2 >= 90) ]

# EXPLANATION:
# You can think of the above answer as the following: 

TRUE_IF_DIDNT_GET_80s_ON_TEST1 = test1 < 80 | test1 >= 90
TRUE_IF_DIDNT_GET_80s_ON_TEST1

TRUE_IF_DIDNT_GET_80s_ON_TEST2 = test2 < 80 | test2 >= 90
TRUE_IF_DIDNT_GET_80s_ON_TEST2

TRUE_IF_DIDNT_GET_80s_ON_EITHER_TEST = TRUE_IF_DIDNT_GET_80s_ON_TEST1   &   TRUE_IF_DIDNT_GET_80s_ON_TEST2
TRUE_IF_DIDNT_GET_80s_ON_EITHER_TEST

students

students [ TRUE_IF_DIDNT_GET_80s_ON_EITHER_TEST ]




# THE following are WRONG becasue & happens before | based on the order of operations
students [ test1 < 80 | test1 >= 90 &  test2 < 80 | test2 >= 90 ]
students [ test1 < 80 | (test1 >= 90 &  test2 < 80) | test2 >= 90 ]



#---------------------------------------------------------------------	
# ORDER OF OPERATIONS	
# 	
# As always, expressions in (parentheses) are done first. Otherwise, 	
# the order of operations between ! & | operators is 	
#	
#    first   !    (NOT) 	
#    then    &    (AND)	
#    finally |    (OR)	
#	
# As with all order of operations issues, (parentheses) can change what is done first.
#---------------------------------------------------------------------	


# Examples:	
TRUE | FALSE & FALSE     # TRUE   because & is done before |	
(TRUE | FALSE) & FALSE   # FALSE  same code but with parentheses	

FALSE | TRUE & FALSE     # FALSE 	
(FALSE | TRUE) & FALSE   # FALSE - parentheses don't change the result here 	

TRUE | TRUE & FALSE      # TRUE   because & is done before |	
(TRUE | TRUE) & FALSE    # FALSE  same code but with parentheses	

TRUE | !FALSE & FALSE    # TRUE   first ! then & then |	
(TRUE | !FALSE) & FALSE  # FALSE  same code but with parentheses	

#---------------------------------------------------------------------	
# Sometimes you have to take into account what is done first	
# a larger context. The following should be easy enough to remember.	
# 	
#      1st - parentheses	
#      2nd - all math	
#      3rd - all relational operators (i.e. > < >= <= == !=)	
#      4th - !	
#      5th - &	
#      6th - |	
#      7th - assignment to a variable	
# 	
# You can also refer back to the complete official documentation for	
# the complete list of R operator precedence by typing	
#	
#    ?Syntax #  (capital "S")	
#	
# or refer to this url (search for "r official documentation order of operations")	
#	
#    https://stat.ethz.ch/R-manual/R-devel/library/base/html/Syntax.html	
#	
# This list is summarized below for the operators that we have learned so far.	
# 	
#      ^              	exponentiation (right to left)	
#      - +	            unary minus and plus (as in -2 and in +2)	
#      :	              sequence operator	
#      %%    %/%    %in%   (and operators surrounded by %percents%)	
#      * /	            multiply, divide	
#      + -	            add, subtract	
#      < > <= >= == !=	ordering and comparison	
#      !              	negation	
#      & 	              and	
#      |   	            or	
#      ->               rightwards assignment	
#      <-               assignment (right to left)	
#      =	              assignment (right to left)	
# 	
#---------------------------------------------------------------------

#-----------------------------------------------------
# QUESTION - 
# The following are parallel vectors. They contain information about
# the opening and closing prices of some stocks yesterday.
#
# Answer the following questions by writing a command that calculates
# the specified information.
#-----------------------------------------------------

company= c("JP Chase", "citigrp","pfizer", "moderna","google","microsoft","facebook","j&j",     "goldman sachs", "oracle" )
sector = c("fin",      "fin",    "pharma", "pharma", "tech", "tech",      "tech",    "pharma",  "fin",           "tech")
hq     = c("ny",        "ny",     "ny",    "ma",     "ca",    "wa",       "ca",      "nj",      "ny",            "tx" )
ticker = c("jpm",      "c",      "pfe",    "mrna",   "goog",  "msft",     "fb",      "jnj",     "gs",            "orcl")
ceo =    c("dimon",    "fraser", "bourla",  "bancel","pichai","nadella",  "zuckerberg","gorsky","solomon",      "catz")
open =   c(171.00,     101,       93.04,    345.20,   2300,    308.61,     326,       164.06,    414.41,         98.42)
close =  c(160,        99,       120.00,    365.20,   2405,    350,        300,       140,       465.50,         104)


# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# QUESTION
# (a) Show the names of all "tech" companies that are NOT headquartered
#     in California (i.e. "ca")
#
# (b) Show their tickers   (another command)
#
# (c) Show their headquarters (hq)    (another command)
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

# ANSWER - (a) Show the names of all "tech" companies that are NOT headquartered
#              in California (i.e. "ca")

company [   sector == "tech" & hq != "ca"]

# ANSWER - (b) Show their tickers   (another command)
ticker [   sector == "tech" & hq != "ca"]

# ANSWER - (c) Show their headquarters (hq)    (another command)
hq [   sector == "tech" & hq != "ca"]



##############################################################################
# BEREN - UP TO HERE - AFTER CLASS 12
##############################################################################

##############################################################################
# WILF - UP TO HERE - AFTER CLASS 12
##############################################################################

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# QUESTION
#
# (a) Show the names of the companies in alphabetical order that are
#     headquartered in either NY or CA
#
# (b) Show their headquarters (hq)    (another command)
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

# ANSWER - (a) Show the names of the companies in alphabetical order that are
#              headquartered in either NY or CA

# These are the companies

company[        hq == "ca"  |  hq == "ny"     ]


# Use sort to put them in alphabetical order
sort ( company[        hq == "ca"  |  hq == "ny"     ] )



# ANSWER - (b) Show their headquarters (hq)    (another command)
#
# NOTE - the headquarters are shown in the original order of the companies,
# not in the sorted order of the companies - see the answer to part (a).
# Using what we've learned so far there is no simple way to put
# the headquarters in the sorted order of the companies.
# We will soon learn about dataframes which does allow for sorting one variable
# based upon the values in a different variable.

company[        hq == "ca"  |  hq == "ny"     ]


# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# QUESTION
# (a) Show the names of the tech companies whose stock increased in value
# (b) Show their open values  (another command)
# (c) Show their close values   (another command) 
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

# (a) Show the names of the tech companies whose stock increased in value

company[ close > open ]

# (b) Show their open values  (another command)

open[ close > open ]

close[ close > open ]


# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# QUESTION
# (a) Show the names of the tech companies whose stock increased in value by 10% or more
# (b) Show their open values  (another command)
# (c) Show their close values   (another command) 
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

# (a) Show the names of the tech companies whose stock increased in value by 10% or more

company[ close > open * 1.1  ]
open[ close > open * 1.1  ]
close[ close > open * 1.1  ]


company[ (close - open) / open >= .1  ]
open[ (close - open) / open >= .1  ]
close[ (close - open) / open >= .1  ]

# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# QUESTION
# (a) Show the names of the tech and pharma companies whose stock increased in value by 10% or more
#
# (b) Show their sectors   (another command)
#
# (c) Show their open values  (another command)
#
# (d) Show their close values   (another command) 
#
# (e) Show the percent increases of the tech and pharma companies whose stock increased in value by 10% or more
#     HINT: calculate a new vector that calculates the percent increases of all 
#     the stocks. Then use that new vector to get just the percent increases for
#     the companies we want. You can do this all in one command or in different
#     commands.
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

# ANSWER - (a) Show the names of the tech and pharma companies whose stock increased in value by 10% or more

# CORRECT
company[  close > open * 1.1  & ( sector == "tech"  | sector == "pharma" ) ]

# WRONG - you must have (parentheses) as above because of the order of operations - i.e. & happens before |
company[  close > open * 1.1  &  sector == "tech"  | sector == "pharma"  ]



# ANSWER - (b) Show their sectors   (another command)
sector[  close > open * 1.1  & ( sector == "tech"  | sector == "pharma" ) ]

# ANSWER - (c) Show their open values  (another command)

# ANSWER - (d) Show their close values   (another command) 

# ANSWER - (e) Show the percent increases of the tech and pharma companies whose stock increased in value by 10% or more
#     HINT: calculate a new vector that calculates the percent increases of all 
#     the stocks. Then use that new vector to get just the percent increases for
#     the companies we want. You can do this all in one command or in different
#     commands.


# One way - in two commands

pctIncrease = (close - open) / open

pctIncrease[  close > open * 1.1  & ( sector == "tech"  | sector == "pharma" ) ]


# Another way - all in one command

((close - open) / open) [  close > open * 1.1  & ( sector == "tech"  | sector == "pharma" ) ]



# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# QUESTION
# (a) Show the tickers of "fin" and "tech" companies whose stock opened or closed over $100
# (b) Show their sectors   (another command)
# (c) Show their open values  (another command)
# (d) Show their close values   (another command) 
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

# (a) Show the tickers of "fin" and "tech" companies whose stock opened or closed over $100

ticker [  ( open > 100 | close > 100 )  &  ( sector == "fin" | sector =="tech" ) ]



sector [  ( open > 100 | close > 100 )  &  ( sector == "fin" | sector =="tech" ) ]
