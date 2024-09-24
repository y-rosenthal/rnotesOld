#####################################################################
# OVERVIEW
#
#   Understanding how to call a function in it's simplest form is just
#   the first step in learning how to use R. A more typical use of R involves using
#   different functions and concepts together in combination in a single command.
#   These questions generally require you to combine multiple function calls
#   or concepts into a single command. As a reminder - so far we learned about
#   the following R functions and concepts. 
#
#   In class we learned the basic ideas of how to use these features of R. 
#   However, in "real life" you will need to combine these techniques to solve
#   more complex problems. The questions below require
#   you to use these various techniques together to solve larger, more complex
#   problems. 
#
#     ls, rm, sqrt, abs, max, min, ceiling, floor, trunc, sum, mean, c, length  
#
#     rep    - including the arguments: x, times, length.out, each
#              We also mentioned the rep_len and rep.int functions
#              but those are technically not adding any functionality
#              above what rep provides. rep_len and rep.int are purely
#              a shorthand and a speed improvement over using rep directly.
#              See the help pages for ?rep
#
#     seq   - including the arguments: from, to, by, length.out  
#              NOTE - we didn't cover the along.with argument but you could read
#              the documentation if you want to use this.
#
#     round - including the arguments: x and digits
#
#     pi    - this is actually technically just a variable, not a function
#
#     help    ?   ??  - use these!!
#
#     operators            =   <-   ->    +  -  *  /  ^  %%  %/%  :
#
#     colon operator - shortcut for seq function - e.g 3:5 produces c(3,4,5)  5:3 produces c(5,4,3)
#
#     assignment operators - 3 types, i.e.  =   <-   ->
#
#     vector arithmetic
#
#     order of operations including the order of operations for
#     : %% and %/%  - see this page  https://stat.ethz.ch/R-manual/R-devel/library/base/html/Syntax.html
#
#
#
# INSTRUCTIONS
#
#   Each answer to the questions below consists of ONE LINE of code.
#   Type your answer where the question says "YOUR ANSWER GOES HERE".
#   There are several examples shown. The same answer should work unchanged
#   for all of the examples.
#   If you don't understand what a question is asking for, study the examples.
#   Hopefully the examples should help to clarify things.
#   There could be different valid answers for the same question.
#
#   See the sample questions below.
#
#   Grading - each "part" of each question is worth the same amount of points. 
#             There are a total of 11 "parts" (8 questions, but some have
#             multiple parts). Therefore each part is 100/11 points = 9.09 points 
#
#
#
#
# SAMPLE QUESTION 1 (the answer with an explanation is in the next SECTION)
#
# x contains a number. Write a command that rounds x to the number of decimal
# places represented by the whole number portion of x.
# For example if x=3.8417821 then the rounded value should be 3.842 (since the 
# whole number portion of x is 3, round it to 3 decimal places.)
#
#   EXAMPLE 1
#     > x = 3.8417821          
#     > YOUR ANSWER GOES HERE  # type your code here to get this to work
#     [1] 3.842
#
#   EXAMPLE 2
#     > x = 4.2138765          
#     > YOUR ANSWER GOES HERE  # SAME CODE as you typed above
#     [1] 4.2149
#
#
# SAMPLE QUESTION 2 (the answer with an explanation is in the next SECTION)
#
# Same as previous question but this time return the same number of copies
# of the answer as the number of decimal places that your rounded x to.
# For example if x=3.8417821 then the rounded value should be 3.842 (see
# above). However, this time, you should return three copies of 3.842 to 
# get the final answer of 3.482 3.482 3.482
#
#   EXAMPLE 1
#     > x = 3.8417821          
#     > YOUR ANSWER GOES HERE  # type your code here to get this to work
#     [1] 3.842  3.842  3.842
#
#   EXAMPLE 2
#     > x = 4.2138765          
#     > YOUR ANSWER GOES HERE  # SAME CODE as you typed above
#     [1] 4.2149 4.2149 4.2149 4.2149
#####################################################################


#####################################################################
# ANSWERS TO SAMPLE QUESTIONS
#
# The following gives a suggested way of approaching the answers to the 
# sample questions.
#
#
# SAMPLE QUESTION 1 - ANSWER
#
# 1. To round a number, you could use the round function. If you don't recall
#    how to use it, then look at R's help pages for round or look at our class
#    notes. For example, round(3.8417821, 1) is 3.8. 
#
# 2. To figure out the number of decimal places, you need to get the whole number
#    portion of x. You should recall that you can do that with the trunc function,
#    which chops off (or "truncates") the numbers after the decimal point.
#    For example, trunc(3.8417821) is 3
#
# 3. Now you can combine the round and trunc functions to get the correct 
#    number of decimal places. For example
#
#    > x = 3.8417821
#    > round(x , trunc(x))  # x will be rounded to 3 decimal places
#    [1] 3.842
#
# 4. This same code will work for the 2nd example also:
#     > x = 4.2138765          
#     > round(x , trunc(x))  # x will be rounded to 3 decimal places
#     [1] 4.2149
#
#
# SAMPLE QUESTION 2 - ANSWER
#
# 1. Start by following the steps to SAMPLE QUESTION 1
#
# 2. To get multiple copies of this number you could use 
#    the rep function. You need to get the same number of copies as the 
#    number of positions to round to. For example, the following contains
#    the final answer. Notice that there are also 3 copies of this number
#    in the vector that is returned.
#
#     > x = 3.8417821
#     > rep ( round(x,trunc(x)) , round(x,trunc(x)))   # this generates the full answer
#     [1] 3.842  3.842  3.842
# 
#    This same code will work for the 2nd example also:
#     > x = 4.2138765          
#     > round(x , trunc(x))  # x will be rounded to 3 decimal places
#     [1] 4.2149 4.2149 4.2149 4.2149
#####################################################################


#####################################################################
# REMINDER - make sure you understand this.
#
# To answer these questions, you should realize that the arguments to a function can be
# actual "literal" values (e.g. 5), variables or complete expressions. For example
# the following are all valid uses of the round function
#
#     > round(6.2618724, 1)     # arguments are both "literal" values (i.e. numbers)
#     [1] 6.3
#
#    > num = 1
#    > round(6.26187248, num)  # arguments can be variable names
#    [1] 6.3
#
#    > num = 4.26187248
#    > round(num, trunc(num))     # arguments can be function calls
#    [1] 4.2619
#
#    > num = 4.26187248
#    > round(num, trunc(num) / 2)  # arguments can be complete expressions
#    [1] 4.26
#
#    > num = 4.26187248
#    > 2 * round(num, trunc(num) / 2) + 1  # this is a complete expression involving a function call
#    [1] 9.52
#####################################################################


#####################################################################
# HOW TO SUBMIT YOUR ANSWERS
#
# Create a .R file that contains your answers.
#
# Write your name in a #comment at the top of the file e.g. #Joe Smith
#
# For each question 
#
# - use a comment to show the number of the question, e.g.  #question 1
#
# - copy the code for at least one of the examples from the question into your
#   file and replace the words "YOUR ANSWER GOES HERE" with the code for 
#   your answer. Make sure that your code works as you expect it to.
#
# - To check that your code is works as you expect, I highly recommend
#   that you do the following:
#
#     o remove all of your variables, i.e. rm(list=ls())
#
#     o press ctrl-L to clear your console
#
#     o open the R Script that contains your answers and press ctrl-a
#       to select the entire script
#
#     o press ctrl-ENTER (windows) or cmd-ENTER (Mac) to run your entire code.
#
#     o Check the results in the console to make sure that it works as expected.
#
# - Submit the .R file to the Canvas dropbox for the assignment. 
#####################################################################


#####################################################################
# WARNINGS vs ERRORS
#
# Warnings in R appear in RED text. However, even when a line of code produces a
# warning the code will still work. The following example produces a warning
# but the assignment to nums still happens as evidenced by the last line.
# 
#    > nums = c(1,2) + c(100,200,300)
#    Warning message:
#    In c(1, 2) + c(100, 200, 300) :
#      longer object length is not a multiple of shorter object length
#    > nums
#    [1] 101 202 301
#
# In general it is better to write code that does not produce any warnings.
# However, for this assignment your code MAY produce warning messages as long
# as, other than the warning, it produces the correct results.
#####################################################################

#---------------
# QUESTION 1
#---------------
# Assume that x is a variable that contains a positive integer (i.e. a whole number).
# Write a command that produces x number of copies of the value stored in x. For example
#
# EXAMPLE 1
#   > x = 3
#   > YOUR ANSWER GOES HERE
#   [1] 3 3 3
#
# EXAMPLE 2
#   > x = 5
#   > YOUR ANSWER GOES HERE
#   [1] 5 5 5 5 5




#---------------
# QUESTION 2
#---------------
# x contains a positive number that is 2 or more.
# Write a command that creates a vector that contains
# x number of copies of the value stored in x followed by
# x+1 number of copies of x+1.
# 
# EXAMPLE 1 
#   > x = 2      # set x to 2
#   > YOUR ANSWER GOES HERE    # generate two 2's and three 3's
#   [1] 2 2 3 3 3
#
# EXAMPLE 2
#   > x=5        # set x to 5
#   > YOUR ANSWER GOES HERE    # generate five 5's six 6's  ( same command )
#   [1] 5 5 5 5 5 6 6 6 6 6 6




#---------------
# QUESTION 3
#---------------
# x contains a number (or a vector of several numbers).
# Write a command that rounds down the value(s) of x to the nearest 10.
# NOTE - The round function does NOT do this. Instead, try to approach the 
# problem a different way by using a combination of math and other functions
# that we learned about.
#
# EXAMPLE 1
#   > x <- 32
#   > YOUR ANSWER GOES HERE
#   [1] 30
#
# EXAMPLE 2
#   > x <- -5188.25       # this one is negative
#   > YOUR ANSWER GOES HERE
#   [1] -5190
# 
# EXAMPLE 3
#   > x <- 2.4
#   > YOUR ANSWER GOES HERE
#   [1] 0
# 
# EXAMPLE 4
#   > x <- c(32, 198.2, 2.4, -198.2)
#   > YOUR ANSWER GOES HERE
#   [1]  30  190  0  -200
#
# HINT - Remember that any number divided by 10 moves the decimal point
#        to the left. For example 123/10 is 12.3
#
#        Remember, multiplying an number by 10 moves the decimal point to 
#        the right. For example, 123.0 * 10 is 1230






#---------------
# QUESTION 4
#---------------
# x is a variable that contains a positive number, the code below shows how to
# use the seq function to produce the first x multiples of 5.
# Write a different command that does NOT use the seq function but that 
# accomplishes the same result. 
# 
# SOLUTION THAT USES THE seq FUNCTION
#
#   > x = 3                       # set x to 3
#   > seq(from=5, to=5*x, by=5)   # show first 3 multiples of 5 (type x instead of 3)
#   [1] 5 10 15
#
#   > x = 6                       # set x to 6
#   > seq(from=5, to=5*x, by=5)   # show first 6 multiples of 5 (same command as above)
#   [1] 5 10 15 20 25 30
#
# NOW DO IT A DIFFERENT WAY ...
#
#   EXAMPLE 1
#     > x = 3
#     > YOUR ANSWER GOES HERE
#     [1] 5 10 15
#
#   EXAMPLE 2
#     > x = 6                
#     > YOUR ANSWER GOES HERE
#     [1] 5 10 15 20 25 30
#






#---------------
# QUESTION 5 (a)
#---------------
# x contains a positive number.
# Write a command that produces the values
# 1*2, 2*3, 3*4, etc .. up until x*x+1
# Do this using the seq function
#
# EXAMPLE 1 
#   > x = 3   # show the three values: 1*2  2*3  3*4
#   > YOUR ANSWER GOES HERE
#   [1] 2  6  12
# 
# EXAMPLE 2
#   > x = 5   # show the five values: 1*2  2*3  3*4  4*5  5*6
#   > YOUR ANSWER GOES HERE
#   [1] 2  6  12  20  30







#---------------
# QUESTION 5 (b)
#---------------
# Same question as above, but do it in a different way WITHOUT using the seq function








#---------------
# QUESTION 6
#---------------
# Assume that x is an integer that is 2 or more.
# Write a command that generates the sequence of numbers
# 1 -2 3 -4 5 -6 etc ... x (or -x)
# The numbers should alternate between positive and negative numbers.
# The final value should be the positive or negative value of x.
# NOTE: It is OK if warnings are generated as long as you get the right output.
#
# HINT: Remember, if you multiply a number by 1 you just get back the same 
#       number but if you multiply a number by -1 you get back the negative
#       version of the number.








#---------------
# QUESTION 7
#---------------
# BACKGROUND INFO
#
#   The following is an example of an "infinite series".
#   It can theoretically go on forever ...
#
#      6/4^1   6/4^2   6/4^3   6/4^4 + ...
#
#   The "sum" of this infinite series is :
#
#      6/4^1 + 6/4^2 + 6/4^3 + 6/4^4 + ...
#
#         which is equal to
#
#      6/4 + 6/16 + 6/64 + 6/256 + ...
#
#         which is equal to 
#
#      1.5 + .375 + .09375 + .0234375 + ...
#
#   We cannot add up all of the values in the sum since there are an infinite
#   number of values in the sum. However, we can add up the first several
#   values up to a certain point. These are called "partial sums".
#
#   The first "partial sum" of this infinite series is :                1.5
#   The 2nd partial sum is: 1.5 + .375                                = 1.875
#   The 3rd partial sum is: 1.5 + .375 + .09375                       = 1.96875
#   The 4th partial sum is: 1.5 + .375 + .09375 + .0234375            = 1.9921875 
#   etc ...
#
#   As more and more values are added to the partial sum, the sum gets closer and closer
#   the number 2. We say that the sum "converges" to 2. 
#
# QUESTION
#   x is a positive integer. Write a command to calculate the
#   partial sum of the first x values of the infinite series shown above.
#
# EXAMPLE 1 
#   > x = 2  # automatically add the first 2 values, i.e. 1.5  +  .375
#   > YOUR ANSWER GOES HERE
#   [1] 1.875
# 
# EXAMPLE 2
#   > x = 3  # automatically add the first 3 values, i.e. 1.5  +  .375  +  .09375
#   > YOUR ANSWER GOES HERE
#   [1] 1.96875
#
# EXAMPLE 3
#   > x = 9  # automatically add the first 9 values in the series
#   > YOUR ANSWER GOES HERE
#   [1] 1.999992
#
# NOTE - by default if the sum gets "really close" to 2, then R will display
# the result as 2, even though the actual sum is a bit less than 2. For example
# if x is 11 then by default R will display the sum of the first 11 positions
# in the infinite sum as 2 even though the sum is actually a bit less than 2. 
# The reason for this is by default, R displays only up to 7 digits after 
# a decimal point. However, this can be changed with R's "options" command
# (type ?options to get help on this command).
#
# For example 1/7 is a non-terminating decimal, ie. 
# 1/7 is mathematically equal to 1.142857142857142857142857142857...etc
# The 142857 after the decimal point just keeps repeating infinitely.
# However, by default if you type 1/7 in R you will see 0.1428571 since 
# R will by default display only 7 digits after the decimal point. However, if 
# you type options(digits=20) and then
# type 1/7 you should see the following: 0.14285714285714285
# You can revert back to the original number of digits by typing
# options(digits=7). 
#
# Similarly for our problem if you type options(digits=20) and then run
# your command for x=11, you should see 1.9999995231628418







#---------------
# QUESTION 8 (a) 
#---------------
# x is an integer that contains 2 or more.
# Generate x number of values in the sequence
#
#    2 4 6 8 ... 
#
# EXAMPLE 1
#    > x=4
#    > YOUR ANSWER GOES HERE
#    [1] 2 4 6 8
#
# EXAMPLE 2
#    > x=6
#    > YOUR ANSWER GOES HERE
#    [1] 2 4 6 8 10 12
#
# HINT - use the seq function. Make sure that you use the different
#        arguments to the seq function in the best possible way
#        to solve this problem.






#---------------
# QUESTION 8 (b)
#---------------
# x is an integer that contains 2 or more.
# Generate a vector that contains the first x number of values in the series
#
#    2*3*4    4*5*6    6*7*8   8*9*10 ... etc
# i.e. R should show
#    24       120      336     720    ... etc
# 
# EXAMPLE 1
#    > x=4
#    > YOUR ANSWER GOES HERE
#    [1] 24 120 336 720
#
# EXAMPLE 2
#    > x=6
#    > YOUR ANSWER GOES HERE
#    [1] 24 120 336 720 1320 2184
#
# HINT: refer to your answer to part (a). 
#       Think about how you can use the recycling rule to build on that answer.







#---------------
# QUESTION 8 (c)
#---------------
# As you may know, PI, has a never-ending non-repeating number of 
# digits after the decimal point. The first few digits of pi are 3.14159... etc.
# This webpage contains the value of pi to one million decimal places - https://www.piday.org/million/
# It is impossible to calculate the "last" digit of pi since you can always
# keep calculating more decimal places. 
# There are many different ways to mathematically calculate pi to greater and 
# greater precision. This webpage shows a few methods: https://www.wikihow.com/Calculate-Pi
#
# For this question you will approximate the value of PI by using 
# partial sums of an infinite series known as the Nilakantha Series
# If you're curious see these links:
#   - http://www.maeckes.nl/Formule%20voor%20pi%20(Nilakantha)%20GB.html
#   - https://www.youtube.com/watch?v=3U7Hfz37GqA
# This Nilakantha series consists of the values shown below 
#   Notice the "3" in the first position. 
#   Notice the pattern of values in the denominators of the 2nd and subsequent terms. 
#   Notice that the terms alternate between positive and negative.
#
#   3 + 4/(2*3*4) - 4/(4*5*6) + 4/(6*7*8) - 4/(8*9*10) + 4/(10*11*12) - ... etc
#
# Set x to the number of terms in the Nilakantha Series to add to the initial "3".
# Note, a simple way to do this problem will cause problems when x=0 or x=1.
# Therefore, you can ignore those cases.
# (We can discuss later in class why x=0 and x=1 may cause problems). 
#
#   EXAMPLE 
#     > x = 2   # Two terms added to 3, i.e.  3  +  4/2*3*4  -  4/4*5*6
#     > YOUR ANSWER GOES HERE
#     [1] 3.1333333
#
#   EXAMPLE 
#     > x = 3   # Three terms added to 3, i.e.  3 + 4/2*3*4 - 4/4*5*6 + 4/6*7*8
#     > YOUR ANSWER GOES HERE
#     [1] 3.145238
#
#   EXAMPLE 
#     > x = 4   # Four terms added to 3, i.e. 3 + 4/2*3*4 - 4/4*5*6 + 4/6*7*8 - 4/8*9*10
#     > YOUR ANSWER GOES HERE
#     [1] 3.139683
#
#   EXAMPLE 
#     > x = 50  # Fifty terms added to 3
#     > YOUR ANSWER GOES HERE
#     [1] 3.141591
#
# HINT 1: Do NOT use R's "pi" variable to do this question.
#
# HINT 2: In part (b) above, you generated the sequence 2*3*4, 4*5*6, 6*7*8, etc
#         Notice that that sequence is in the denominators of the fractions in this 
#         question.
#
# HINT 3: You already figured out how to do the alternating + and - signs
#         in one of the questions above.
#
# HINT 4: Try different things and build up your answer slowly.
#
# HINT 5: Try to figure out how to automatically generate the terms and display them.
#         Then if the terms you are generating are correct,
#         you can simply change your answer to use the sum function.
# 
#         To see what our code should eventually produce, we can "cheat" and 
#         simply type out the first few terms (without automatically generating
#         them as you need to do) : 
#
#           > c(3 , +4/(2*3*4) , -4/(4*5*6) , +4/(6*7*8) , -4/(8*9*10))
#           [1] 3.000000000  0.166666667 -0.033333333  0.011904762 -0.005555556
#       
#         summing them gives us
#           > sum(c(3, +4/(2*3*4), -4/(4*5*6), +4/(6*7*8), -4/(8*9*10)))
#           [1] 3.139683
#
#         Now, try to write an R command to automatically produce the vector shown above
#         when x is set to 4.
#
# HINT 6: Make sure that your answer works for x=2, x=3,etc (don't worry about x=1 or x=0)

