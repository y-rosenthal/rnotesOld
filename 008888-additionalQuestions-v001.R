
# Replace numbers in originals with the corresponding values in replacements
replaceNums = function( originals, replacements){
  
}

# > replaceNums ( c(10,1,3,100,92,4,99), c(-1,-2,-3,-4))
# [1] 10 -1 -3 100 92 -4
#
# > replaceNums ( c(10,1,3,100,92,4,99), c(777,333,555,999))
# [1] 10 777 555 100 92 999



# Write a function:
#    reoragnizeValues = function( num, vec )
#
# ARGUMENTS
#    num is a positive number
#    vec is a vector whose length is a multiple of num
#
# The function should return a vector that contains the values from vec
# reorganized as follows:
#   first: every n'th value starting from the first value in vec
#   then: every n'th value starting from the second value in vec
#   then: every n'th value starting from the third value in vec
#   etc. until you've accounted for every value in vec.
#
# This can be summarized as 
#     vec[ c(1+0*num, 1+1*num, 1+2*num, 1+3*num, ... etc,
#            2+0*num, 2+1*num, 2+2*num, 2+3*num, ... etc,
#            3+0*num, 3+1*num, 3+2*num, 3+3*num, ... etc,
#            4+0*num, 4+1*num, 4+2*num, 4+3*num, ... etc,
#            etc.
#         )]
#
# EXAMPLES:
#   
#   > reorganizeValues(num=2, vec=c(10,20,30,40,50,60))
#   10 30 50 20 40 60
#
#   > reorganizeValues(num=3, vec=c(10,20,30,40,50,60))
#   10 40 20 50 30 60 90 120
#
#   > reorganizeValues(num=3, vec=c(10,20,30,40,50,60,70,80,90,100,110,120))
#   10 40 70 100 20 50 80 110 30 60 90 120
#
#   > reorganizeValues(num=4, vec=c(10,20,30,40,50,60,70,80,90,100,110,120))
#   10 50 90 20 60 100 30 70 110 40 80 120 
#
# HINTS: 
#   You can solve this with a nested loop. 
#
#   Alternatively, you can use a single loop in combination with the 
#   seq function. For example, do the following in a loop until you've
#   gotten every item
#
#   - use seq to generate a sequence of position numbers to get every nth
#     item starting from the 1st item in vec
#
#   - then use seq to generate a sequence of position numbers to 
#     get every nth item starting from the 2nd item in vec
#
#   - then use seq to generate a sequence of position numbers to 
#     get every nth item starting from the 3rd item in vec
#
#   - etc ...
