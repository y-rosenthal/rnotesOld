##################################################################
##################################################################
## INSTRUCTIONS
## 
## Answer the questions below by writing R commands.
## There are hints after many of the questions. You can follow those
## hints. However, there are many different ways to write code to 
## accomplish something. Feel free to experiment with different ways
## to accomplish the same thing.
##
## - In general, each question should be completed using a SINGLE
##   command (unless specified otherwise).
##
## - If a question asks you to create a variable - do 
##   that in one command.
##
## - If another part of the same question then asks you to use that
##   variable - do that in another command. 
##
## - In general each question is independent of other questions.
##   However, a multi-part question (e.g. (a), (b), etc) may refer to the
##   earlier steps
##
## - For the purpose of grading all steps in each multi-step question
##   i.e. (a), (b), etc. counts as a full question
##   (i.e. each part of every question is worth the same amount of points).
##################################################################
##################################################################

# Question 1. 
#
# (a) Create a variable named "nums" that contains numbers starting with 100.
#     Each successive number should be 7 less than the previous number. Follow
#     this pattern through the negative numbers. Do not go past -100.
#     Remember to store the vector in the variable named "nums".
#     (i.e. nums should contain the vector
#          100 93 86 79 ... 9 2 -5 -12 ... -82  -89 -96 )
#
#     Hints
#       - use the seq function with the from, to and by arguments
#
#    (b) Create a vector starting with the pattern 1 2 3 etc ...
#        The vector should be as long as the nums vector from
#        part (a). 
#
#        Hints:
#           - use the seq function or the colon operator (your choice)
#           - use the length function as part of your answer
#           - use the length function to check the length of nums from 
#             part (a) to make sure that your answer is correct
#    
#    (c) Do part (b) again, but this time generate the numbers
#        2 4 6 etc ... The vector should be as long as the nums 
#        vector from part (a).
#        The answer should display the numbers: 2 4 6 ... 56 58
#
#        Hints: 
#          - use the seq function with the from, by and length.out arguments
#
#    (d) Subtract the vector in part (c) from the "nums" vector you created
#        in part (a). Since the answer to part (a) should contain 
#           100 93 86 ... -89 -96
#        and the answer to part (c) should contain the values
#           2   4  6  ...  56  58
#        the answer for this question should display the values
#           98  89 80 ... -145 -154
#
#    (e) Do part (c) again, but this time do NOT use the length
#        function. Instead use the along.with
#        argument to the seq function. We did NOT cover along.with
#        in class, but you should get used to learning how to 
#        learn about R functions. See the documentation for the seq
#        function or search online for more information.


# Question 2.
#    Create a vector with the pattern 5 10 15 ... 50 repeated
#    four times (i.e. 5 10 15 ... 50 5 ... 50 5 ... 50 5 ... 50)
#    Hints:
#      - create the vector 5 10 15 ... 50 using the seq function
#        by specifying the from, to and by arguments
#
#      - modify your answer by using the rep function to repeat that
#        vector four times

# Question 3.
#
# Create a vector that contains 3 copies of each of the even numbers
# from 2 through 100. Store this in a variable named trippleEvens. 
# i.e. trippleEvens should contain the values
#         2 2 2 4 4 4 6 6 6 ... 98 98 98 100 100 100
#
# Hints:
#   - create a vector of just the even numbers (i.e. 2 4 6 ... 100)
#     by using the seq function with arguments, from, to, by
#
#   - extend your code by using the rep function with the "each" argument


# Question 4.
#        Repeat the values 3 6 9 ... 60 as many times as 
#        a necessary until you reach a vector of length 150
#        (i.e. 3 6 9 ... 60 3 6 9 ... 60 3 ... etc until a total length of 150)
#        Store the result in the variable named "tens".
#
#        Hints: 
#          - use the seq function to create the vector 3 6 9 ... 60 
#          - expand your answer by using the rep function with the length.out
#            argument
#          - Make sure that the vector has 150 values by using the length
#            function to calculate the number of values
#            that are contained in the vector from part (a) 

# Question 5.
#
#    (a) Display the powers of 10 from 10^9 down to 10^1.
#
#        Hints: 
#          - Use vector arithmetic. Raise 10 to the power of
#            a vector that contains the numbers 1 2 3 ... 9
#            You can create the vector 1 2 3 ... 9 with the 
#            colon operator.
#
#    (b) Display the square roots of the powers of 
#        ten starting from the square root of 10^9 down to the 
#        square root of 10. 
#
#        Hints: 
#          - create the vector 9 8 7 ... 1 using the colon operator
#          - raise 10 to the power of that vector
#          - pass the whole expression to the sqrt function


# Question 6.
#    (a) Create a vector that contains 30 numbers, starting with 1 and 
#        ending with 5. The numbers should be evenly spaced.
#
#        Hints:
#          - use the seq function with the from, to and length.out arguments
#
#    (b) Do the same as (a) but round the values to the nearest hundredth
#        place (i.e. 2nd number after decimal point)
#
#        Hints:
#          - use the round function with the digits argument


# Question 7.
#    Create a vector that contains the 1st, 2nd, 3rd and 4th powers 
#    of the numbers from 1 through 10 - there should be 40 values in all.
#    (i.e.  2^1  2^2 2^3 2^4 3^1 3^2 3^3 3^4 4^1 ... 10^1 10^2 10^3 10^4 
#     which should be displayed as:
#           2    4   8   16  3   9   27  81  4   ... 10   100  1000 10000)
#
#    Hints:
#      - There should be 40 numbers in all. We will use vector arithmetic ...
#      - Therefore create 2 different vectors ... each will have 40 values.
#      - The first vector should contain the numbers
#           1 1 1 1 2 2 2 2 3 3 3 3 ... 10 10 10 10
#      - The 2nd vector should contain the powers 1 2 3 4 1 2 3 4 etc.
#      - Raise the first vector to the power of the 2nd vector using the ^ operator.



# Question 8.
#
# Write code that displays the 4th value from the vector nums.
# (nums could contain anything)


# Question 10.
#
# Write code that displays the 4th and 6th values from the vector nums.
# (nums could contain anything)

# Question 11.
#
# Write code that displays 3 copies of the 2nd value from the vector nums.
# (nums could contain anything)
# For example if nums contains 10 20 30 40
# Then your code should display 20 20 20
#
# Hints:
#   - pass the 2nd value of nums to the rep function


# Question 11.
#
# Write code that displays the 3rd through the 30th values from the vector nums.
# (nums could contain anything)
#
# Hints:
#   - create a vector that contains the numbers 3 4 5 ... 30
#   - display the values in those positions from nums by 
#     placing the code that creates the vector 3 4 5 ... 30
#     between [brackets] next to the name "nums"


# Question 12.
#
# Display the values that are in the even positions of nums. 
# nums may contain anything. For example if nums contains
# the values 10 20 30 40 50 60 70 80
# then your code should display 20 40 60 80.
#
# Hints:
#   - use the seq function to create a vector of even numbers.
#     2 4 6 ... The vector should have as many numbers in it
#     as 1/2 the length of nums. For example, if nums contains
#     10 20 30 40 50 60 70 80 then the vector of even numbers
#     should contain 2 4 6 8
#
#   - use the vector of even numbers between the [brackets]
#     used to retrive specific positions from the nums
#     vector


# Question 13.
#
# Display all values from the vector nums EXCEPT for the
# 2nd and 5th values. nums can contain any values.
# For example if nums contains 10 20 30 40 50 60
# then your code should display the numbers 10 30 40 60
# Hints: 
#   - use a negative indexes between the [brackets], i.e. -2


# Question 14. 
#
# Display all values from the vector nums EXCEPT for the
# 3rd, 6th, 9th, etc values.
#
# For example if nums contains 10 20 30 40 50 60 70 80 90 100
# then your code should display 1st, 2nd, 4th, 5th, 7th, 8th and 10th values
# i.e. the numbers 10 20 40 50 70 80 100
#
# Hints:
#   - write code to create a vector that contains the numbers 3 6 9 ... etc
#     The last number of this vector should not be larger than 
#     the number of values in nums.
#
#   - negate those values to get -3 -6 -9 ... etc
#
#   - use that vector between the [brackets] next to nums to get
#     all values from nums except the numbers in the specified positions.

# Question 15. 
#
# Create a vector named "rainbow" that contains the names of colors of the 
# rainbow - i.e. red orange yellow green blue indigo violet.


# Question 16.
#
# Create a vector that contains the following two sentences. 
# Store the vector in a variable named sentences. 
# When you are done, the command :  length(sentences) 
# should return the number 2.
#
#    Sue said "Hi" to Joe.
#    What's up with you?


# Question 17.
#
# Create a vector with the powers of 3 from 1 to 10. 
# This should get you ten numbers:
#    3 9 27 81 243 729 2187 6561 19683 59049
#
# Then create a vector with the products 30*1 30*2 ... 30*10
# This should get you ten numbers:
#    30 60 90 120 150 180 210 240 270 300
#
# Compare the first list of numbers to the second list of 
# numbers with the greater than sign. This should get the
# following logical vector 
# FALSE FALSE FALSE FALSE TRUE TRUE TRUE TRUE TRUE TRUE
# (i.e. 4 FALSE values followed by 6 TRUE values)
#
# Explain in your own words why the result is
#    FALSE FALSE FALSE FALSE TRUE TRUE TRUE TRUE TRUE TRUE