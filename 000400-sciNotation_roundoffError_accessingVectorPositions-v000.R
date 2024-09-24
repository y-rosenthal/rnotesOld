# remove all varibles
rm (list = ls())

########################################################
########################################################
##
##  A couple of introductory comments about basic math
##
########################################################
########################################################

#--------------------------------------------
# how many zeros are there in a power of 10?
#--------------------------------------------

# 10^2 is 100
100     # 100 is the same as 10^2
10^2    # 10^2 is the same as 100

# 10^3 is 1000
1000    # 1000 is the same as 10^3
10^3    # 10^3 is the same as 1000

# etc ...
# In summary, you can figure out a power of 10, by adding the number
# of zeros after the 1 that match the exponent, e.g. 10^2 is 100 (2 zeros)
# This works similarly (but not exactly the same) for negative exponents of 10

# 10^-1 is 0.1
0.1      # 0.1 is the same as 10^-1
10^-1    # 10^-1 is the same as 0.1

# 10^-1 is 0.1
0.01     # 0.01 is the same as 10^-2
10^-2    # 10^-2 is the same as 0.01

# etc...
# The number of zeros after the decimal point is one less than the absolute value
# of the exponent of 10.

#-------------------------------------------------------
# Intro to Scientific Notation in R
#
# Multiplying numbers by powers of 10
#-------------------------------------------------------

# If you multiply a number by a POSITIVE POWER of 10 the decimal point
# will move to the RIGHT by the number of positions as expressed by the exponent.
# Example:

1.2345 * 10^0     # 10^0 is 1 so this doesn't change the first number
1.2345 * 10^1     # 10^1 is 10 so this moves the decimal to the right by 1 position
1.2345 * 10^2     # 10^2 is 100 so this moves the decimal to the right by 1 position
1.2345 * 10^6     # This moves the decimal point to the RIGHT by 10 positions

# The above calculations are examples of "Scientific notation".
# Scientific notation is used as a shorthand for writing very big numbers
# (and very small numbers - see below)


#---------------------------------------------------------------------
# R has a shorthand notation for writing these types of calculations.
# Instead of writing 1.2345*10^6, you could instead write 1.2345e6
#
# The "e" in the number stands for "exponent". The "e" is understood
# to be read as "times ten to the power of". The number after the "e"
# is the exponent for the power of 10.
# EXMAPLE - all of the following are the same exact number:
#---------------------------------------------------------------------

1234500            # this is the same

1.2345 * 10^6      # this is the same

1.2345e6           # this is the same

# By default R will display values in scientific notation if the number is
# very very big. For example:

12345000000 # by default, R will show this value in scientific notation

#-------------------------------------------------------
# Negative exponents of 10 move the decimal to the LEFT
#-------------------------------------------------------

# 0.00123 is the same as 0.123 * 10^-4

0.0123      # this is the same value as below
1.23*10^-2   # this is the same value as above

# R will display very small numbers using scientific notation also.
# The following is a very small number (there are ten zeros).
# R will display this in scientific notation

0.0000000000123   # same as 1.23e-11

1.23e-11          # we can write that directly also


#-----------------------------------------------------
# MORAL OF THE STORY - don't become alarmed
#
# Occasionally, you will see R displaying numbers in 
# scientific notation. Don't become confused. Understand
# that these are just "regular numbers" being displayed in 
# a more concise format. Any math that is done with these
# numbers is the same as if you did the same math with the 
# equivalent non-scientific-notation format.
#-----------------------------------------------------


#----------------------------------------------------------
# PRACTICE
#----------------------------------------------------------

# what are the values of the following expressions?
#
#    1e-2 + 2e-1
#
#    9.876e5
#
#    5.23e4 + 1000
#
#
# What will R display for the following numbers?
#
#    12340000000000 (ten zeros)
#
#    0.0000000000123 (ten zeros)


#############################################################
#############################################################
##
## Floating point nubmers
##
#############################################################
#############################################################

# Some fractions that we write do not have an exact representation
# as decimal numbers. For example, many people will write
# 1/3 as 0.333  
#
# However there really are an infinite number of 3's in the decimal 
# version. 0.333 is just a rough approximation. 0.3333 is closer to 1/3
# and 0.33333 (five 3's) is even closer. However, you will NEVER get
# an exact representation of 1/3 unless you write an infinite number
# of 3's after the decimal point :(
#
# Therefore 1/3  +  1/3   +  1/3 = 1
# When converted into decimals becomes, approximately 
#
#  0.333 + 0.333 + 0.333 = 0.999 (which looks wrong!)
#
# Some fractions can be converted exactly, eg.
#    1/2 is 0.5 exactly
#    1/4 is 0.25 exactly
#    1/5 is 0.2 exactly
#    1/8 is 0.125 exactly
#    1/10 is 0.1 exactly
#    1/16 is 0.0625 exactly 
#    1/25 is 0.04 exactly
#
# In general if a fraction can be reduced to an equivalent fraction whose
# denominator is a power of 2 , a power of 5 or a power of 10, then the 
# fraction can be represented by an exact terminating decimal.


#------------------------------------------------------------------
# 
# Decimal vs Binary numbers
# 
#------------------------------------------------------------------


# Humans use numbers that have 10 different digits i.e 0,1,2 .. 9
# Numbers that use all these digits are known as "base-10" numbers
#
# Computers internally use numbers that only have 1 and 0 as digits
# These numbers are known as "binary" numbers.
#
# For more info. see the powerpoint on Canvas.

# You don't have to be familar with the details of binary numbers
# for this course. HOWEVER, you should understand the following ...
#
# The nubmers that can be converted to exact decimal numbers are 
# different for binary numbers and for decimal numbers. 
# For binary nubmers (i.e. numbers that computers use internally)
# fractions that can be reduced to have a power of 2 in the denominator
# can be represented by a terminating decimal point value. 
# Other fractions cannot. 
#

#------------------------------------------------------------------
#
# Roundoff error
#
#------------------------------------------------------------------
# This issue leads to "roundoff" error very frequently when doing math
# in computer programming- similar to 1/3 + 1/3 + 1/3 ...
#
# R masks this issue by displaying what you might think a number is.
# However, the actual value for the number might be something else. 
# 
# You can use the print.default (or just print) function with the 
# digits argument to display the ACTUAL value that R stores for a number

print(0.1, digits=22)

print(0.3, digits=22)


# This issue can lead to "roundoff" errors. There are ways to deal with 
# this but it can get a little involved for this early in the course.
# for right now, just accept it. We'll revisit this issue later.





