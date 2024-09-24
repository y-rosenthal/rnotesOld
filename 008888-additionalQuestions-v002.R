
# Replace numbers in originals with the corresponding values in replacements
replaceNums = function( originals, replacements){
  
}

# > replaceNums ( c(10,1,3,100,92,4,99), c(-1,-2,-3,-4))
# [1] 10 -1 -3 100 92 -4
#
# > replaceNums ( c(10,1,3,100,92,4,99), c(777,333,555,999))
# [1] 10 777 555 100 92 999



# Write a function:
#    reorganizeValues = function( num, vec )
#
# ARGUMENTS
#    num is a positive number
#    vec is a vector whose length is a multiple of num
#
# The function should return a vector that contains the values from vec
# reorganized as follows:
#   - every n'th value from vec starting from the 1st
#   - then every n'th value from vec starting from the 2nd
#   - then every n'th value from vec starting from the 3rd
#   etc.
#
# EXAMPLES:
#   > reorganizeValues(num=2, vec=c("abe", "bob", "carl", "dave", "ed", "fran"))
#   "abe" "carl" "ed" "bob" "dave" "fran"
#
#   > reorganizeValues(num=3, vec=c("abe", "bob", "carl", "dave", "ed", "fran"))
#   "abe" "dave" "bob" "ed" "carl" "fran"
#
#   > reorganizeValues(num=3, vec=c(10,20,30,40,50,60))
#   10 40 20 50 30 60
#
#   > reorganizeValues(num=3, vec=c(10,20,30,40,50,60,70,80,90,100,110,120))
#   10 40 70 100 20 50 80 110 30 60 90 120
#
#   > reorganizeValues(num=4, vec=c(10,20,30,40,50,60,70,80,90,100,110,120))
#   10 50 90 20 60 100 30 70 110 40 80 120 
#
# HINTS: 
#   You can solve this with
#   (a) a nested loop or
#   (b) a single loop in combination with the seq function



# Write a function: productIncludesDigits = function(low, high)
#
# The function should display all of the numbers, n and n+1, 
# between low and high such that the digits in the product n*(n+1)
# contains at least one copy of each digit that appears in n and in n+1.
# For example:
#      10 * 11 is 110 satisfies the conditions because together 10 and 11
#      contain only 0's and 1's and 110 contains at least one 0 and one 1
#
# The following are the first 5 such products:
#
#    10 11 product:  110      #   110 contains a 0 and a 1
#    11 12 product:  132      #   132 contains a 1 and a 2
#    40 41 product:  1640     #  1640 contains a 0, 1 and 4
#    90 91 product:  8190     #  8190 contains a 0, 1 and 9
#    100 101 product:  10100  # 10100 contains a 0 and a 1
#
# At the end of the output display how many such products there are.
#
# EXAMPLE:
> productIncludesDigits(1,5)
There were a total of 0 such products.
> productIncludesDigits(1,10)
10 11 product:  110 
There were a total of 1 such products.
> productIncludesDigits(1,100)
10 11 product:  110 
11 12 product:  132 
40 41 product:  1640 
90 91 product:  8190 
100 101 product:  10100 
There were a total of 5 such products.



# Find 2 numbers in a row such that the digits in the product include
# all of the digits in the two numbers.
#
# The following are the first 5 such products:
#
#    10 11 product:  110      #   110 contains a 0 and a 1
#    11 12 product:  132      #   132 contains a 1 and a 2
#    40 41 product:  1640     #  1640 contains a 0, 1 and 4
#    90 91 product:  8190     #  8190 contains a 0, 1 and 9
#    100 101 product:  10100  # 10100 contains a 0 and a 1




productIncludesDigits = function(low, high){
  num1 = low
  howMany=0
  while(num1 <= high){
    num2 = num1 + 1
    p = num1 * num2 
    
    digitsNum1 = strsplit(as.character(num1), "")[[1]]
    digitsNum2 = strsplit(as.character(num2), "")[[1]]
    digitsP = strsplit(as.character(p), "")[[1]]

    if( all(digitsNum1%in%digitsP) & all(digitsNum2 %in% digitsP)){
      cat(num1, num2, "product: ", p, "\n")
      howMany = howMany + 1
    }
    num1 = num1 + 1
  }
  
  cat("There were a total of",howMany,"such products.")
}

#debugonce()
productIncludesDigits(1,5)
productIncludesDigits(1,10)
productIncludesDigits(1,100)





# mat is a matrix that has 4 or more rows and 4 or more columns.
# Write a command that creates a list. Each entry in the list should
# be one of the 2x2 corners of the matrix. The names of the entries
# in the list should be as shown below in the examples.
#
# EXAMPLE
# > mat
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    6   11   16   21
# [2,]    2    7   12   17   22
# [3,]    3    8   13   18   23
# [4,]    4    9   14   19   24
# [5,]    5   10   15   20   25
#
# > YOUR COMMAND GOES HERE
# > lst
# $upperLeft
#      [,1] [,2]
# [1,]    1    6
# [2,]    2    7
# 
# $upperRight
#      [,1] [,2]
# [1,]   16   21
# [2,]   17   22
# 
# $lowerLeft
#      [,1] [,2]
# [1,]    4    9
# [2,]    5   10
# 
# $lowerRight
#      [,1] [,2]
# [1,]   19   24
# [2,]   20   25

# ANSWER
# Example 1
mat = matrix(1:25, nrow=5, ncol=5)
mat
lst = list( upperLeft = mat[1:2, 1:2],
            upperRight = mat[1:2, (ncol(mat)-1):ncol(mat)],
            lowerLeft = mat[(nrow(mat)-1):nrow(mat), 1:2],
            lowerRight = mat[(nrow(mat)-1):nrow(mat),(ncol(mat)-1):ncol(mat)])
lst
