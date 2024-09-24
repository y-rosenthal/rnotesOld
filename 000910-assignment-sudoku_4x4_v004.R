#############################################################################
# ASSIGNMENT - Sudoku (part 1)
#############################################################################

# If you don't know already how to play Sudoku, please see these links
# or search for others online:
#
#   Just the basic rules for a 9x9 grid: 
#      https://www.youtube.com/watch?v=1Zzw51l74g0
#
#   A 4x4 sudoku (easier than a 9x9 sudoku)
#      https://www.youtube.com/watch?v=5EMrrpBIBJY
#
#   More info ... including using non-numbers
#      https://www.youtube.com/watch?v=kvU9_MVAiE0
#

# In this assignment you will start creating code that implements
# an S3 class for playing sudoku. There will be a few assignments that
# build on this idea. For this first assignment, you will focus on 
# just creating a simple 4x4 sudoko game board and some simple
# functions that display the board and work with the game.
# You will not yet be writing  code to actually play the game. 

# A 4x4 game of sudoku is played on a 4x4 grid of 16 values.
# This grid can be thought of as being divided into 4 smaller
# 2x2 boxes. See here for some examples:
# https://www.google.com/search?q=4x4+sudoku&oq=4x4+sudoku&aqs=chrome..69i57j0i512l5j69i60j69i61.4887j0j4&sourceid=chrome&ie=UTF-8
#
# Example: The following is a picture of an empty 2x2 sudoku grid.
# There are  a total of 16 "boxes". During a game each box could hold
# a single number.
#
#   -------------------------
#   |     :     |     :     |
#   |     :     |     :     |
#   |     :     |     :     |
#   |...........|...........|
#   |     :     |     :     |
#   |     :     |     :     |
#   |     :     |     :     |
#   -------------------------
#   |     :     |     :     |
#   |     :     |     :     |
#   |     :     |     :     |
#   |...........|...........|
#   |     :     |     :     |
#   |     :     |     :     |
#   |     :     |     :     |
#   |...........|...........|
#
# For example this shows some boxes are filled in with numbers.
# (the boxes without numbers have a period inside it. This makes
#  it easier to see where a number would go if it were there.)
#   -------------------------
#   |     :     |     :     |
#   |  2  :  1  |  .  :  .  |
#   |     :     |     :     |
#   |...........|...........|
#   |     :     |     :     |
#   |  .  :  3  |  2  :  .  |
#   |     :     |     :     |
#   -------------------------
#   |     :     |     :     |
#   |  .  :  .  |  .  :  4  |
#   |     :     |     :     |
#   |...........|...........|
#   |     :     |     :     |
#   |  1  :  .  |  .  :  .  |
#   |     :     |     :     |
#   --------------------------



#------------------------------------------------------------------
# EXAMPLE
#
# After answering all of the questions below, the following code 
# should run to create the board shown above.
#------------------------------------------------------------------
#
#   x = sudoku(4)
#
#   # If you created the sudoku function correctly
#   # the following lines should return the values shown.
#   is.matrix(x)          # TRUE
#   nrow(x) == 4          # TRUE
#   ncol(x) == 4          # TRUE
#   class(x) == "sudoku"  # TRUE
#
#   print.sudoku(x)  # this should display an empty 4x4 sudoku board
#                    # similar to what is shown above.
#
#   x   # if you did this correctly this should produce the 
#       # same results as print.sudoku(x)
#
#   # fill in the sudoku game with some numbers
#   x = sudoku_putValue(x, 2, 1, 1)  # put a 2 in row 1 col 1
#   x = sudoku_putValue(x, 1, 1, 2)  # put a 1 in row 1 col 2
#   x = sudoku_putValue(x, 3, 2, 2)  # put a 3 in row 2 col 2
#   x = sudoku_putValue(x, 2, 2, 3)  # etc ...
#   x = sudoku_putValue(x, 4, 3, 4)
#   x = sudoku_putValue(x, 1, 4, 1)
#
#   # If you did this correctly then the following lines should
#   # return the values shown in the comments
#
#   sum(x == 1)  # 2 (ie. two 1s on the board)
#   sum(x == 2)  # 2 (ie. two 2s on the board)
#   sum(x == 3)  # 1 (ie. one 3  on the board)
#   sum(x == 4)  # 1 (ie. one 4 on the board)
#
#   print.sudoku(x)   # this display the image shown above
#
#   print(x)          # if you did this correctly this should produce the 
#                     # same results as print.sudoku(x)
#
#   x                 # this does the same thing too
#
#   "print.sudoku" %in% methods(print) # TRUE
#
#
#
#   summary.sudoku(x) # this should display some summary of the board
#                     # see the description of the function below
#
#   summary(x)        # if you did it correctly this should give you the 
#                     # same results as summary.sudoku(x)
#
#   "summary.sudoku" %in% methods(summary) # TRUE
#
#------------------------------------------------------------------





# 1
#-----------------------------------------------------------------
# Question
#-----------------------------------------------------------------
# Create the following function
# 
#    sudoku = function(size)
# 
# Description
#    Creates a new R object used for holding all of the data
#    for a sudoku game.
#    
# Arguments
#    size - is expected to be a number that is the number of 
#           boxes along one side of the whole sudoku grid.
#           For example, to create a 4x4 sudoku grid 
#           size would be 4. To create a 9x9 sudoku grid, 
#           size would be 9.
#
# Return value:
#    An R matrix that has size rows and size columns whose
#    class attribute is set to "sudoku".
#-----------------------------------------------------------------





# 2
#-----------------------------------------------------------------
# Question
#-----------------------------------------------------------------
# Create the following function
# 
#    print.sudoku = function(s)
# 
# Description
#    The function displays on the screen a nice version of a 
#    sudoku grid. 
#    
# Arguments
#    s - is expected to be a value that was returned from the sudoku 
#    function. I.e. it is a matrix that has class(s) == "sudoku".
#
# Return value - none
# 
# Other comments - 
#    The function should draw a picture on the screen
#    (including the lines for the boxes) of the sudoku board.
#    You can use cat to implement this function.
#-----------------------------------------------------------------





# 3
#-----------------------------------------------------------------
# Question
#-----------------------------------------------------------------
# Create the following function
#    sudoku_putValue = function(s, value, row, column)
# 
# Description
#    The function places the specified value in the appropriate#
#    row and column on the sudoku grid.
#    sudoku grid. 
#    
# Arguments
#    s - is expected to be a value that was returned from the sudoku 
#    function. I.e. it is a matrix that has class(s) == "sudoku".
#
#    row - is a number that contains the row number to place the 
#    value in. 
#
#    value - is a number that contains the row number to place the 
#    value in. 
#
# Return value
#    A new sudoku matrix that contains the new value in the 
#    correct position.
#-----------------------------------------------------------------






# 4
#-----------------------------------------------------------------
# Question
#-----------------------------------------------------------------
# Create the following function
#    summary.sudoku = function(s)
# 
# Description
#    The function summarizes the contents of a sudoku game.
#    It should display all of the following info:
#     1. The number of empty boxes
#     2. The number of filled in boxes
#     3. The number of 1's on the board
#        The number of 2's on the board
#        The number of 3's on the board
#        The number of 4's on the board
#
# Arguments
#    s - is expected to be a value that was returned from the sudoku 
#    function. I.e. it is a matrix that has class(s) == "sudoku".
#
# Return value
#    I'll leave it up to you to come up with something appropriate
#    that describes the sudoku game. It should not just use "cat"
#    it should return an actual value that can be assigned 
#    to a variable.
#-----------------------------------------------------------------

