################################################################################
# INSTRUCTIONS: 
# 
# Create a new R script file that contains your answers.
#
# Add a comment at the top of your file with your name - e.g.   # Joe Smith.
#
# Add a comment line ( e.g.  # Question 1a ) before each answer to show
# the number of the question.
#
# The answers to your questions should all be valid R code.
# The entire script file with your answers should run without any errors and
# should not depend on any variables existing that are not defined in your code.
# You can check this by doing the following:
#
#   - Remove all your variables by either (a) pressing the broom button 
#     in the "Environment" tab that appears in the upper-left-hand corner
#     of RStudio or (b) run the command "rm(list=ls())" (without the "quotes")
#
#   - Select the ENTIRE R script file by pressing ctrl-a (Windows) or cmd-a (Mac)
#     then press ctrl-ENTER (Windows) or cmd-ENTER (Mac). This will run the 
#     entire R script. Your code should give correct results without any errors.
#
################################################################################

################################################################################
# IMPORTANT NOTE: 
#
# I recommend that you run the following line of code before your start working
# to remove all of your R variables. This code is "commented out".
# To make it work, you must remove the "#" that appears at the beginning of the line. 
# I purposely "commented out" this line of code so that you don't mistakenly
# remove all of your variables when you are not intending to.
#
#     rm(list=ls())     # remove the first "#" to get this to work.
################################################################################



################################################################################
# QUESTION 1a
################################################################################
#
# Pineapples cost 4 dollars and 30 cents each.
# Create a variable that stores the price of a single pineapple.
# Use the "=" sign in your statement. 
# (don't think too much ... this is easy)
#
################################################################################

################
################
# ANSWER
################
################

pineapple = 4.3   # or any variable name = 4.3 or 4.30 (4.3 and 4.30 are the same thing)


################################################################################
# QUESTION 1b
################################################################################
#
# R has 3 different ways to assign a value to a variable. 
# Rewrite the command from the previous question to use a left pointing arrow
# instead of the = sign.
#
################################################################################

################
################
# ANSWER
################
################

pineapple <- 4.3   # = and <- work the exact same way (there is no practical difference at all)


################################################################################
# QUESTION 1c
################################################################################
#
# Rewrite the command from the previous question to use a right pointing arrow.
#
################################################################################

################
################
# ANSWER
################
################

4.3 -> pineapple  #  with -> the variable name goes on the right hand side and the value on the left hand side

################################################################################
# QUESTION 1d
################################################################################
#
# Refer to the previous parts of this question.
# Write an R command that calculates the maximum number of whole pineapples that you
# can buy if you have $60.00 to spend.
#
# Use the variable, pineapple, that you created above as part of your answer.
#
################################################################################

################
################
# ANSWER
################
################

60 %/% pineapple       # this is the whole number of times that 4.3 goes into 60




################################################################################
# QUESTION 1e
################################################################################
#
# Refer to the previous parts of this question.
# Write a command that calculates the amount of money you will have left after
# buying the pineapples.
#
################################################################################

################
################
# ANSWER
################
################

# Either of these will work

# First answer
60 %% pineapple       # this is the fractional part of 4.3 that is left over after dividing 60 by 4.3


# Second answer - this works without parentheses due to the order of operations
60 - 60 %/% pineapple * pineapple

# The parentheses are not necessary but might make the 2nd answer easier to understand:
60 - ( ( 60 %/% pineapple )   *   pineapple )  # i.e. 60 minus the number of pineapples bought times the price of a pineapple




################################################################################
# QUESTION 2 Step 1
################################################################################
#
# USE THE FOLLOWING INFORMATION TO ANSWER THIS QUESTION:
#
#    Joe puts some money in a bank account and leaves it there untouched for
#    an entire year. The bank pays 2% interest per year (compounded annually).
#    In other words, after 1 year the balance in the account will be the 2% more
#    than the original balance in the account.
#
# Step 1: Write a command to create a variable named "balance" that contains
#         the amount of money that Joe initially put into the account
#         (make up any amount you like), i.e. just create a variable named 
#         "balance" that contains some numeric value.
#
################################################################################

################
################
# ANSWER
################
################

balance = 200    # balance starts at $200  (or use any other number)



################################################################################
# QUESTION 2 step 2
################################################################################
#
# Write another command that CHANGES the value of "balance" to be the
# amount of money that is in the account after 1 year. This command
# should work NO MATTER WHAT VALUE WAS ORIGINALLY PLACED INTO "balance". 
# Check your answer by displaying the value of "balance" after you run
# this command. 
#
# To make sure your command works correctly, go back to the command you
# wrote for step1 and change the value to another number. Then re-run
# the commands from step1 and from step2 (don't change your answer for step2).
# The answer for step2 should still be correct.
#
# If you wrote the command correctly, then you should be able to copy
# that command several times. Each time you run that command it will add another 
# 2% to the value in the "balance" variable. Try it to make sure that it works
# correctly.
#
################################################################################

################
################
# ANSWER
################
################

balance = balance * 1.02    # this will change balance from 200 to 200 * 1.02, i.e. 204

# If we repeat the above line 2 more times, you will change the balance in the account
# to the balance after 3 years

balance = balance * 1.02    # balance is changed to 204 * 1.02, i.e. 208.08

balance = balance * 1.02    # balance is changed to 208.08 * 1.02, i.e. 212.2416

balance   # 212 2416, i.e. the balance in the account after 3 years






################################################################################
# QUESTION 3 - INTRODUCTION
################################################################################
#
# A cashier needs to return change to a customer using the smallest number of
# bills and coins. Change is given in a combination of $20, $10, $5, $1 bills, 
# quarters, dimes, nickles and pennies. For example, suppose the customer must 
# pay $47.06 and hands the cashier a $100 bill. The cashier would then have to
# return $52.94 to the customer. The smallest number of bills and coins that
# adds up to $52.94 is shown below:
#
#    Total change of $52.94 can be broken down as follows:
#
#    2 twenty dollar bills   (i.e. $40.00)
#    1 ten    dollar bill    (i.e. $10.00)
#    0 five   dollar bills   (i.e. $ 0.00)
#    2 one    dollar bills   (i.e. $ 2.00)
#    3 quarters              (i.e. $ 0.75)
#    1 dime                  (i.e. $ 0.10)
#    1 nickle                (i.e. $ 0.05)
#    4 pennies               (i.e. $ 0.04)
#
# (Technically, the cashier could have given the customer 52 one dollar bills
# and 94 pennies, but that would not be the smallest number of bills
# and coins possible.) 
#
# The goal of this question is to start with a variable named, totalChange,
# that contains the amount of change that needs to be returned to a customer.
# You then must write several lines code that create variables named
# twenties, tens, fives, ones, quarters, dimes, nickles and pennies 
# which contain the numbers of each denomination that must be returned to 
# the customer. For example
#
#      > totalChange = 52.94
#      
#      > # YOUR CODE GOES HERE
#      > # YOUR CODE GOES HERE
#      > # YOUR CODE GOES HERE
#      > # YOUR CODE GOES HERE
#      > # etc ... you could have many lines of code
#      > #
#      > # AT THE END OF YOUR CODE THE VALUES OF THE VARIABLES
#      > # twenties, tens, fives, etc SHOULD BE SET TO THE AMOUNT OF
#      > # twenties, tens, fives, etc THAT THE CASHIER MUST RETURN 
#      > # TO THE CUSTOMER. WHEN YOU RUN THE COMMAND SHOWN BELOW
#      > # YOU SHOULD SEE THE CORRECT RESULTS.
#
#      > c( twenties , tens , fives , ones , quarters , dimes , nickles , pennies)
#      [1] 2  1  0  2  3  1  1  4
#
# If you feel ambitious, you can try to answer this problem right now and
# then skip 
#
# Below, I broke up this question into small steps to help you figure out 
# the answer. However, if you feel ambitious, you can try to answer
# the entire question right now and then skip to QUESTION 4 if your answer works.
#
# IMPORTANT NOTE: 
#
#   As you work on this question, you may find some calculations are not
#   "exact" but may be "really really close" to what you'd expect. For
#   example if you find that one of the numbers that you calculate turns 
#   out to be 3.99999999999977 instead of exactly 4 don't worry about it (for now). 
#   This is due to the way R (and other programming languages) work with numbers.
#   There are ways to avoid this issue that you will learn about later. 
#   For now, you can just ignore this issue.
#
################################################################################

#######################################################################
#######################################################################
# ANSWER
#
#    The following is the answer to the entire question #3. 
#    Don't worry if you don't understand this all at once.
#    The answers are also explained line by line in the "steps" below.
#    The answer requires ALL of the following code. 
#    The comments are there to help you understand the answer. 
#
#######################################################################
#######################################################################

# Set the amount of change that the cashier must return. 
# You can change this to any value you like and the rest of the code
# should still work correctly.

totalChange = 52.94   

# chop off (i.e. "truncate") the decimal points to get the total number of whole dollars

wholeDollars = trunc(totalChange)

# Figure out the total amount in pennies.
# This will help us when we 
# need to figure out the numbers of quarters, dimes, nickles and pennies
# that the cashier needs to return.
# (you only need one of the following lines of code)

cents = totalChange %% 1  * 100                # one way
#cents = (totalChange - wholeDollars)  *  100  # another way

# calculate the number of twenties

twenties = wholeDollars %/% 20    

# adjust the remaining number of whole dollars that need to be returned 
# (you only need one of the following lines of code)

wholeDollars = wholeDollars %% 20                # one way
#wholeDollars = wholeDollars - twenties * 20     # another way 
#wholeDollars = wholeDollars - (twenties * 20)   # yet another way 

# calculate the numbers for the other denominations.

tens = wholeDollars %/% 10
wholeDollars = wholeDollars %% 10    # or alternatively:   wholeDollars = wholeDollars - tens * 10

fives = wholeDollars %/% 5
wholeDollars = wholeDollars %% 5  # or alternatively:   wholeDollars = wholeDollars - fives * 5

ones = wholeDollars   # or alternatively:   ones = wholeDollars %/% 1
wholeDollars = 0      # or alternatively:   wholeDollars = wholeDollars %% 1

quarters = cents %/% 25
cents = cents %% 25

dimes = cents %/% 10
cents = cents %% 10

nickles = cents %/% 5
cents = cents %% 5

pennies = cents      # all that's left in cents at this point is the number of pennies
cents = 0

# Display the results
totalChange
twenties
tens
fives
ones
quarters
dimes
nickles
pennies

# the following variables should be zero
wholeDollars
cents



################################################################################
# QUESTION 3 - step 1a
################################################################################
#
# Create a variable named "totalChange" that contains the amount of money
# that must be returned to the customer. (make up any amount that you like)
# For example, referring to the example above, you can set totalChange to $52.94
# or you can choose any other number that you like.
#
# After completing this assignment, you can check that your solution is correct by just
# changing this value. Then re-run all of your code and see if you get the correct result for the new value.
#
################################################################################

################
################
# ANSWER
################
################

totalChange = 52.94    # you can change this to any number and rerun all the code for Question 3.




################################################################################
# QUESTION 3 Step 1b
################################################################################
#
# Write a command to create a variable named wholeDollars that contains
# the number of whole dollars that need to be returned. Using the example above,
# if the totalChange variable contains 52.94 then after you run the code for 
# this step, the variable, wholeDollars should contain the number 52.
#
################################################################################

################
################
# ANSWER
################
################

wholeDollars = trunc(totalChange)

################################################################################
# QUESTION 3 step 1c
################################################################################
#
# Similar to the previous step, write a command to create a variable named cents
# that contains the number of cents that need to be returned. Using the example
# above, if the totalChange variable contains 52.94 then after you run the code
# for this step, the variable, cents should contain the number 94 (not 0.94, rather 94).
#
################################################################################

################
################
# ANSWER
################
################

# one way - the parentheses ARE necessary due to order of operations
cents = (totalChange - wholeDollars)  *  100


# another way
cents = totalChange %% 1  * 100   # remainder of deviding totalChange by 1 multiplied by 100


################################################################################
# QUESTION 3 step 2
################################################################################
#
# The remainder of the steps below manipulate the values in
# wholeDollars and cents to arrive at the numbers of
# twenties, tens, fives, single dollars, quarters, dimes nickels and pennies
# that should be returned to the customer.
#
# Write a command that creates a variable named "twenties" that calculates the
# total number of twenty dollar bills that should be given to the customer. Your
# command should work unchanged no matter what value was originally in the
# "totalChange" variable. For example:
#
#   - If totalChange was originally set to 52.94, then after this command runs,
#     "twenties" should contain the number 2.
#
#   - If totalChange was originally set to 60.00, then after this command runs,
#     "twenties" should contain the number 3.
#
#   - If totalChange was originally set to 15.25, then after this command runs,
#     "twenties" should contain the number 0 (zero).
#
#   HINT: Think about the different operators we learned about. Write an
#         assignment statement that uses the variable, wholeDollars
#         in a mathematical expression to arrive at the correct value to be assigned
#         to the variable, "twenties". 
#
################################################################################

################
################
# ANSWER
################
################

twenties = wholeDollars %/% 20    # i.e. the number of times that 20 completely goes into wholeDollars




################################################################################
# QUESTION 3 step 3
################################################################################
#
# After the cashier hands the customer the twenty dollar bills, the total
# change that still needs to be returned will be reduced. Write a command that
# changes the value of the "wholeDollars" variable so that it
# reflects the total number of whole dollars that still needs to be returned
# after the twenties have already been given to the customer. For example, 
#
#   - If "wholeDollars" (in step1) was originally set to 52, then after the code in 
#     this step runs, wholeDollars should be 12
#
#   - If "wholeDollars" (in step1) was originally set to 60, then after this command runs,
#     wholeDollars should be 0 (zero)
#
#   - If "wholeDollars" (in step1) was originally set to 15, then after the code in 
#     this step runs, wholeDollars should still be 15
#
################################################################################

################
################
# ANSWER
################
################


# ONLY RUN ONE OF THE FOLLOWING POSSIBLE ANSWERS - IF YOU RUN MORE THAN 
# ONE THEN YOU WILL GET THE WRONG ANSWER.
# FOR THIS REASON I #COMMENTED OUT THE 2nd AND 3rd ANSWERS. FEEL FREE
# TO UNCOMMENT THEM TO SEE HOW THEY WORK.

# one way
wholeDollars = wholeDollars %% 20     # get the remainder after dividing wholeDollars by 20

# another way (you don't need parentheses due to the order of operations)
#wholeDollars = wholeDollars - twenties * 20     

# another way - using parentheses might make the above line easier to understand
#wholeDollars = wholeDollars - (twenties * 20)


################################################################################
# QUESTION 3 step 4
################################################################################
#
# At this point you should have four variables. Assuming the amount of change
# owed was $52.94, the variables at this point should contain the following values:
#
#   - the variable "totalChange"  was set in step 1 (e.g. 52.94).
#     It contains the total amount of change owed to the customer. This value 
#     was set in step 1 and will never change throughout any of the other code.
#
#   - the variable "twenties" was set in step 2 to the number of twenties
#     to return to the customer (e.g. 2). The value of this variable will not change
#     throughout the rest of the code. Keep in mind that 2 twenties is actually
#     equal to forty dollars.
#
#   - the variable "wholeDollars" was set in step 1 to be the number of whole
#     dollars owed - e.g. 52. In step 3, This value was changed to the number
#     of dollars still owed after the customer already received the 2 twenties.
#     Since the customer was originally owed 52 whole dollars, the number of whole
#     dollars still owed after returning the two twenties is 12.
#
#   - the variable "cents" was set in step 1 to be the number of cents 
#     that the customer is owed (e.g. 94 , not 0.94). This variable will 
#     be used in some of the steps below.
#
#   In this and remaining steps, you will be creating variables
#   tens, fives, ones, quarters, dimes, nickles and pennies
#   that contain the number of each denomination that needs to be returned to
#   the customer. 
#
#   In this step, write R commands to do the following (these commands are
#   will be very similar to the commands that you wrote in "Step 3" above):
#
#   - write a command that creates a variable, named "tens", that 
#     contains the total number of ten dollar bills that should be returned to 
#     the customer. This command should refer to the current value of the 
#     wholeDollars variable.
#
#   - write another command that updates the value in "wholeDollars" to reflect
#     the amount of wholeDollars that still needs to be returned to the customer
#     after the cashier gives the customer the twenties and the tens.
#
#   If totalChange was originally set to 52.94 then at this point your variables
#   should contain the following values
#
#           totalChange:  52.94
#           twenties:     2
#           tens:         1
#           wholeDollars: 2
#           cents:        94
#
################################################################################



################
################
# ANSWER
################
################

tens = wholeDollars %/% 10
wholeDollars = wholeDollars %% 10    # or equivalently:   wholeDollars = wholeDollars - tens * 10




################################################################################
# QUESTION 3 step 5
################################################################################
#
# Hopefully, you're getting the idea ... In this step, follow a similar pattern
# to create the variables "fives" and "ones".
# fives should contain the number of five dollar bills to be returned to the customer and
# ones should contain the number of single dollar bills to be returned to the customer 
#
# After this step is complete, if the customer was suppsed to get back $52.94, the following
# variables should have the following values:
#
#           totalChange:  52.94
#           twenties:     2
#           tens:         1
#           fives:        0
#           ones:         2
#           wholeDollars: 0     # since at this point, 2 twenties, 1 ten and 2 ones accounts for all the whole dollars
#           cents:        94
#
################################################################################

################
################
# ANSWER
################
################

fives = wholeDollars %/% 5
wholeDollars = wholeDollars %% 5    # or equivalently:   wholeDollars = wholeDollars - fives * 5

# At this point, whole dollars should contain the number of ones ... so the following will work

ones = wholeDollars
wholeDollars = 0

# Alternatively, you could do the following but it is more complicated than the above 2 lines
#ones = wholeDollars %/% 1
#wholeDollars = wholeDollars %% 1    


 
################################################################################
# QUESTION 3 step 6
################################################################################
#
# In this step you will assign values to the variables "quarters", "dimes",
# "nickles" and "pennies" to represent the number of quarters, dimes, nickles
# and pennies that need to be returned to the customer.
# At each step in the process you will:
# (a) set the value of one of the variables quarters, dimes, nickles, pennies
# (b) then update the value of cents
#
# For example after (a) setting the variable, "quarters", and (b) updating the "cents" variable
# you should have the following values:
#
#           totalChange:  52.94
#           twenties:     2
#           tens:         1
#           fives:        0
#           ones:         2
#           wholeDollars: 0     # since at this point, 2 twenties, 1 ten and 2 ones accounts for all the whole dollars
#           quarters:     3     # which is equal to seventy five cents
#           cents:        19    # this is the number of cents that still needs to be returned, i.e. 94 - 75
# 
# Then after setting the variable "dimes" and updating the "cents" variable
# you should have the following values:
#
#           totalChange:  52.94
#           twenties:     2
#           tens:         1
#           fives:        0
#           ones:         2
#           wholeDollars: 0
#           quarters:     3
#           dimes:        1    # which is equal to ten cents
#           cents:        9    # this is the number of cents that still needs to be returned, i.e. 94 - 75 -  10 = 9
# 
# You should keep going in this way until you set the nickles and pennies variables.
# At the end of this step, you should have the following values:
#
#           totalChange:  52.94
#           twenties:     2
#           tens:         1
#           fives:        0
#           ones:         2
#           wholeDollars: 0
#           quarters:     3
#           dimes:        1
#           nickles:      1
#           pennies:      4
#           cents:        0    # since all cents are now accounted for by 3 quarters, 1 dimes, 1 nickles and 4 pennies
#
################################################################################

################
################
# ANSWER
################
################

quarters = cents %/% 25
cents = cents %% 25

dimes = cents %/% 10
cents = cents %% 10

nickles = cents %/% 5
cents = cents %% 5

pennies = cents      # all that's left in cents at this point is the number of pennies
cents = 0


################################################################################
# QUESTION 3 step 7
################################################################################
#
# Step 7: Write separate commands to display the values of each variable you crated to the screen.
#
#         As a check to make sure that your code is correct, go back to the first line
#         in your code (from step 1) and change the value you assigned to "totalChange"
#         to a different number. WITHOUT CHANGING ANY OTHER LINES OF CODE, the values
#         assigned to "twenties", "tens", etc should still be correct. Run all of
#         your code (from step1 through step6) by highlighting all the lines in the Script
#         window and pressing ctrl-ENTER (windows) or cmd-ENTER (mac).
#
################################################################################

################
################
# ANSWER
################
################

# Just write the names of the variables in order to display their values.
#
# NOTE: as we mentioned in class - due to "round off error" and the way that
# R does math, you may find some numbers are not whole numbers. For
# example if you run this code starting with totalChange=52.94, you will find
# that the number of pennies is 3.99999999999977 instead of exactly 4. 
# 
# For now, this is ok for our purposes. We will explain in class why
# this happens.

totalChange
twenties
tens
fives
ones
quarters
dimes
nickles
pennies

# the following variables should be zero
wholeDollars
cents








################################################################################
# QUESTION 4
################################################################################
#
# To calculate the square root of a number in R you use the sqrt "function". 
# Examples:
#    > sqrt(25)        # square-root of 25 (ignore the [1] in the answer below)
#    [1] 5
#
#    > sqrt(40)        # square-root of 40
#    [1] 6.324555
#
#    > sqrt(8 + 2 * 4) # you can calculate the square root of a mathematical expression
#    [1] 4
#
#    > sqrt( 21 - sqrt(36) * 2) # you can use a function inside of another function
#    [1] 3
#
#    > 50 - sqrt(20 + 5) * 2    # you can use sqrt inside of a larger expression
#    [1] 40
#
# Note that in math, the squreroot of a negative number is not defined. In R, if you
# try to calculate the square root of a negative number, the result is the special
# value NaN (which stands for "Not A Number"). For example:
#
#    > sqrt(-5)
#    [1] NaN
#
# Set the variable named "answer" to calculate the mathematical expression that
# is shown in the picture located at
#
#              http://yrosenthal.com/quadratic-plus.png
#
# The code you write should include all of the numbers and operators that are in
# the picture.  After you run your code, the value of answer should be 6. 
# Make sure that you pay careful attention to the order of operations
# and use parentheses where necessary.
# set the "answer" variable to that number. 
#
################################################################################



################
################
# ANSWER
################
################

#------------------------------------------------------------------------------.
# NOTE ABOUT THE ANSWER:
#        In the answer below, the parentheses in -(-8) are not strictly needed
#        since -(-8) and --8 will both result in 8.
#        These parentheses were typed in the answer since they were in 
#        the original picture that you looked at online. 
#
# HOWEVER - EVERY OTHER PARENTHESES IN THE ANSWER BELOW ARE 100% REQUIRED!!!
#           Prove it to yourself by taking out some of the parentheses.
#           Read the notes below for more details.
#------------------------------------------------------------------------------.

answer =( -(-8) + sqrt( (-8) ^ 2  -  4 * 2 * -24)  )  /  (2 * 2)

answer   # show the answer, this will be 6 if you did it correctly

#------------------------------------------------------------------------------.
# ADDITIONAL NOTES ABOUT THE ANSWER:
#
# The tricky part of this problem is to be careful about the order of
# operations. To make this work correctly in a single line of code make 
# sure you do the following:
#
# 1. Type an asterisk, i.e. * every time you want to do a multiplication.
#    For example the picture shows 2(2) in the denominator to mean 2 times 2.
#    In R you must type the * for multiplication so you must type 2*2.
#    Similarly, in the numerator you must type 4*2*-24 instead of 4(2)(-24)
#
# 2. Use parentheses to change the default order of operations.
#    In this problem, that means that you need parentheses in the 
#    following locations that are NOT in the original picture.
#
#    (a)  parentheses around the entire numerator. If you don't have these
#         then the first -(-8) will not be included in the numerator of the division
#         because division happens before the addition.
#
#    (b) parentheses around the entire denominator, i.e. (2*2). If you don't have
#        these parentheses then the denominator will just be 2 and the multiplication
#        by 2 will happen after the division. Remember that multiplication and
#        division are done left to right, whichever comes first.
#
#    (c) Note that you must have parentheses around the (-8)^2 (which IS in the 
#        original picture) as otherwise -8^2 will do 8^2 and then apply the
#        minus sign to get -64, while what you really need is (-8)^2 which is +64
# 
#------------------------------------------------------------------------------.


################################################################################
# EXTRA QUESTION - step 1
#
#            You don't HAVE to do this question.
#            This is for fun and learning, not for credit, sorry. 
################################################################################
#
# You don't HAVE to do this question.
# This is for fun and learning, not for credit, sorry. 
#
# **********************************
# *** SOME INTRODUCTORY COMMENTS ***
# **********************************
#
# The formula that you coded above is used to figure out that if you plug
# in "6" for "x" in the following equation that will make the equation true.
#
#      2x^2 - 8x - 24 = 0 is true if you plug in 6 instead of x
#      since 2(6)^2 - 8(6) - 24   is zero
#
# However, it is also true that if "x" is replaced 
# with -2 then the equation will also be true since 2(-2)^2 - 8(-2) - 24 is zero.
#
#      2x^2 - 8x - 24 = 0 is ALSO true if you plug in -2 instead of x 
#      since 2(-2)^2 - 8(-2) - 24 is also zero
#
# Both of these answers (i.e. 6 and -2) can be found by using the "quadratic
# formula". See this page for a refresher of quadratic equations and the quadratic formula:
#
#   https://www.mathsisfun.com/algebra/quadratic-equation.html
#
# The "quadratic formula" is actually two different formulas - one that
# uses a plus sign and one that uses a minus sign. The question you answered above
# asked you to write R code that calculates only one of those values for a particular
# quadratic equation. However, the other value, could also be calculated very simply
# by replacing a "+" sign in the formula with a "-" sign. See here for the "-" version 
# of the formula: 
#
#              http://yrosenthal.com/quadratic-minus.png
#
# and see this page for a full mathematical breakdown of how to get both answers
#
#              http://yrosenthal.com/quadratic.png
#
# **************************
# *** WHAT YOU SHOULD DO ***
# **************************
#
# Modify the R code that you wrote to solve ANY quadratic equation by doing
# the following:
# 
# Step 1: Create variables "a", "b" and "c" that contain the values of 'a', 'b' and 'c'
#         for a particular quadratic equation. For example, to solve the equation above,
#         2x^2 - 8x - 24 = 0   ...  the variable "a" would be 2, "b" would be -8 and 
#         "c" would be -24
#
################################################################################

############
############
# ANSWER
############
############

a = 2 
b = -8
c = -24




################################################################################
# EXTRA QUESTION - step 2
#
#            You don't HAVE to do this question.
#            This is for fun and learning, not for credit, sorry. 
################################################################################
#
# Rewrite the code you wrote to answer the question above and replace 2 with the 
# variable a, replace (-8) with the variable b and replace (-24) with the 
# variable c. Assign the value to the variable named "answer1".
#
################################################################################


############
############
# ANSWER
############
############

answer =( -b + sqrt( b ^ 2  -  4 * a * c)  )  /  (2 * a)

answer   # show the answer, this will be 6 if you did it correctly


#----------------------------------------------------------------------------.
# NOTE ABOUT THE ANSWER:
#
# The following produce DIFFERENT results since using R's order of operations,
# exponents come before negation (also known as "unitary minus").
# This might not be what you would have expected.
# Type ?Syntax to see the all the rules for R's order of operations.
# For example:
#
#             (-8)^2   # this is   64
#             -8^2     # this is  -64 , the parentheses ARE necessary
#
# However, in the following code, the answer is the same whether we use
# parentheses or not:
#
#              b = -8
#              b^2       # this is 64
#              (b)^2     # this is also 64 - the parentheses are NOT necessary.
#
# Therefore, in the answer, we replaced both instances
# of "(-8)" with "b" NOT with "(b)".
#
# Never use parentheses around a variable if it appears by itself. 
# They are not necessary and including them looks very bad.
#----------------------------------------------------------------------------.





################################################################################
# EXTRA QUESTION - step 3
#
#            You don't HAVE to do this question.
#            This is for fun and learning, not for credit, sorry. 
################################################################################
#
# Write another assignment statement to set the variable, "answer2" to the
# value for the 2nd answer. The formula to calculate the 2nd answer is almost
# the same as the formula to calculate the first answer. You simply
# need to change the appropriate "+" sign to a "-" sign
# (see the webpages quoted above for more info).
#
################################################################################



############
############
# ANSWER
############
############

answer2 =( -(-8) - sqrt( (-8) ^ 2  -  4 * a * c)  )  /  (2 * a)





################################################################################
# EXTRA QUESTION - step 4
#
#            You don't HAVE to do this question.
#            This is for fun and learning, not for credit, sorry. 
################################################################################
#
# Write lines of code to display the values of answer and answer2.
#
################################################################################

############
############
# ANSWER
############
############

answer
answer2




################################################################################
# EXTRA QUESTION - step 5
#
#            You don't HAVE to do this question.
#            This is for fun and learning, not for credit, sorry. 
################################################################################
#
# Highlight the code for all of the steps and press ctrl-ENTER (windows) or 
# cmd-ENTER (mac) to make sure that everything works.
# Check your code, by trying different values of a,b and c. The following
# pages contain several examples.
#
#    https://www.mathwarehouse.com/quadratic/the-quadratic-formula.php
#
#    https://www.mesacc.edu/~scotz47781/mat120/notes/quad_formula/quad_formula_practice.html
#
#    (Note that examples that contain "i" in the answer will show up as NaN in R.
#     In math, "i" stands for the squareroot of -1 which really doesn't
#     exist ... but in math is represented by the letter "i" which stands for
#     an "imaginary" number. Dealing with imaginary numbers in R is possible
#     but we will not cover it in class. If you're motivated, you can search
#     online for information for how to work with imaginary numbers in R.)
#
################################################################################

############
############
# ANSWER
############
############

a = 1      # another example of a,b,c from a quadratic
b = 5      
c = -14
answer =( -b + sqrt( b ^ 2  -  4 * a * c)  )  /  (2 * a)  # same code as above
answer2 =( -b - sqrt( b ^ 2  -  4 * a * c)  )  /  (2 * a)
answer    # 2
answer2   # -7
