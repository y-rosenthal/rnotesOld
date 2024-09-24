# HOMEWORK

#------------------------------------------------------------------------------
# The following questions ask you to modify the ticTacToe game.
# The code for the ticTacToe game is posted on canvas. 
#------------------------------------------------------------------------------

# 1. Improve the tic tac toe game to make the computer smarter.
#    as described below:
#
#    In the current version of the ticTacToe game, the computer just 
#    picks a random location from the empty locations.
#
#    Modify the makeAutomaticMove function in the 
#    ticTacToe game to make the computer "smarter".
#    If the user is about to win, the computer should take that spot.
#    otherwise, the computer should pick a random spot.
#    Do not make any other changes to any other code.
#
#    Use the debugger if you need help to figure out what's going on.
#
#    Another way to start the debugger (AKA the "browser") is to put
#    a call to the "browser()" function into the code. 
#    The debugger will start whenever the "browser()" function
#    executes. You can put a call to browser() inside an if to make
#    it only start the debugger under certain conditions. 
#    Don't forget to remove all calls to browser() once you have
#    figured out the problem!


#------------------------------------------------------------------------------
# The following questions build on the sudoku class from the previous assignment.
# See the file  assignment-sudoku_4x4_v002.R  for information about that
# last assignment.
#------------------------------------------------------------------------------

# 2. Create the following function to work with the sudoku class:
#
#    getSubGrid = function( game, row, col)
#
#    ARGUMENTS: 
#       game - an object where class(game) == "sudoku" is TRUE
#       row - a number from 1 to 4
#       column - a number from 1 to 4
#
#    RETURNS:
#       The 2x2 subgrid from the game that contains the specified row and column.
#       The subgrid should be returned as a 2x2 matrix. 
#       You class argument of this matrix should be set to NULL.
#       
#    DISCUSSION:
#      Check the argument values. 
#      - if game is not a variable whose class is sudoku
#        the function should stop with an appropriate error message
#
#      - if row is not one of the numbers 1, 2, 3, 4
#        the function should stop with an appropriate error message
#
#      - if column is not one of the numbers 1, 2, 3, 4
#        the function should stop with an appropriate error message
#
#    If you did this correctly the following code should return the results
#    shown below
#
#    EXAMPLE:
#    > x = sudoku(4)    # start a new 4x4 sudoku game
#    > x = sudoku_putValue(x, 2, 1, 1)  # put a 2 in row 1 col 1
#    > x = sudoku_putValue(x, 1, 1, 2)  # put a 1 in row 1 col 2
#    > x = sudoku_putValue(x, 3, 2, 2)  # put a 3 in row 2 col 2
#    > x = sudoku_putValue(x, 2, 2, 3)  # etc ...
#    > x = sudoku_putValue(x, 1, 2, 4)
#    > x = sudoku_putValue(x, 4, 3, 4)
#    > x = sudoku_putValue(x, 1, 4, 1)
#
#    > x   # display the sudoku game so far
#
#    -------------------------
#    |     :     |     :     |
#    |  2  :  1  |  .  :  .  |
#    |     :     |     :     |
#    |...........|...........|
#    |     :     |     :     |
#    |  .  :  3  |  2  :  1  |
#    |     :     |     :     |
#    -------------------------
#    |     :     |     :     |
#    |  .  :  .  |  .  :  4  |
#    |     :     |     :     |
#    |...........|...........|
#    |     :     |     :     |
#    |  1  :  .  |  .  :  .  |
#    |     :     |     :     |
#    --------------------------
#
#    > getSubGrid(x,5,1) # ERROR
#    ERROR row and column numbers must be whole numbers from 1 to 4
#
#    > getSubGrid(x,3,"apple")
#    ERROR row and column numbers must be whole numbers from 1 to 4
#
#    > getSubGrid("apple",1,1)
#    ERROR game argument must be of class sudoku
#
#    > getSubGrid(x,1,1) #returns values from upper left 2x2 subgrid (as a matrix)
#
#         [,1] [,2]
#    [1,] "2"  "1" 
#    [2,] "."  "3" 
#
#    > getSubGrid(x,1,2) #returns same since row1,col2 is in the same subgrid
#
#         [,1] [,2]
#    [1,] "2"  "1" 
#    [2,] "."  "3" 
#
#    > getSubGrid(x,2,2) #returns same since row2,col2 is in the same subgrid
#
#         [,1] [,2]
#    [1,] "2"  "1" 
#    [2,] "."  "3" 
#
#    > getSubGrid(x,3,2) #values from lower left 2x2 subgrid (row3,col2 is in that subgrid)
#
#         [,1] [,2]
#    [1,] "."  "." 
#    [2,] "1"  "." 
#
#    > getSubGrid(x,3,3) #values from lower right 2x2 subgrid (row3,col3 is in that subgrid)
# 
#         [,1] [,2]
#    [1,] "."  "4" 
#    [2,] "."  "." 




# 3. Create the following function to work with the sudoku class
#
#    isValidMove = function( game, value, row, column)
#
#    ARGUMENTS: 
#       game - an object where class(game) == "sudoku" is TRUE
#       value - the number to put into the specified row and column
#       row - a number from 1 to 4
#       column - a number from 1 to 4
#
#    RETURNS: "valid" if the move is valid, i.e. if placing the specified
#             value in the specified row and column will not lead to 
#             duplicate values in the row, column or subgrid.
#
#             Otherwise, the function should return a character vector
#             that contains one or more of the following reasons for 
#             the move to be invalid:
#
#                "repeated value in row"
#                "repeated value in column"
#                "repeated value in sub grid"
#
#             A move is valid if the value is not repeated more than once
#             in the same row, column or 2x2 box.
#             This function can be written in many different ways. Feel free
#             to do it any way that works, but it may 
#             help you to think about using one or more of the following
#             functions and operators to help you write the code: 
#
#                unique   sort   all    !(i.e. not)    %in%
#
#    DISCUSSION: 
#      Check the argument values. 
#      - if game is not a variable whose class is sudoku
#        the function should stop with an appropriate error message
#
#      - if value is not one of the numbers 1, 2, 3, 4
#        the function should stop with an appropriate error message
#
#      - if row is not one of the numbers 1, 2, 3, 4
#        the function should stop with an appropriate error message
#
#      - if column is not one of the numbers 1, 2, 3, 4
#        the function should stop with an appropriate error message
#
#      - if the specified row and column already contain a value
#        the function should stop with an appropriate error message
#
#     You can use the getSubGrid function that you created in the previous
#     question to help you determine what values are in the appropriate
#     sub-grid.
#
#     If you did this correctly the following code should return the results
#     shown below
#
#    EXAMPLE:
#    > x = sudoku(4)    # start a new 4x4 sudoku game
#
#    > # fill in the sudoku game with some numbers
#    > x = sudoku_putValue(x, 2, 1, 1)  # put a 2 in row 1 col 1
#    > x = sudoku_putValue(x, 1, 1, 2)  # put a 1 in row 1 col 2
#    > x = sudoku_putValue(x, 3, 2, 2)  # put a 3 in row 2 col 2
#    > x = sudoku_putValue(x, 2, 2, 3)  # etc ...
#    > x = sudoku_putValue(x, 1, 2, 4)
#    > x = sudoku_putValue(x, 4, 3, 4)
#    > x = sudoku_putValue(x, 1, 4, 1)
#
#    > x   # display the sudoku game so far
#
#    -------------------------
#    |     :     |     :     |
#    |  2  :  1  |  .  :  .  |
#    |     :     |     :     |
#    |...........|...........|
#    |     :     |     :     |
#    |  .  :  3  |  2  :  1  |
#    |     :     |     :     |
#    -------------------------
#    |     :     |     :     |
#    |  .  :  .  |  .  :  4  |
#    |     :     |     :     |
#    |...........|...........|
#    |     :     |     :     |
#    |  1  :  .  |  .  :  .  |
#    |     :     |     :     |
#    --------------------------
#
#    > isValidMove(x,4,"apple",1) # ERROR
#    ERROR row and column numbers must be whole numbers from 1 to 4
#
#    > isValidMove(x, 4, 1, 3.5)
#    ERROR row and column numbers must be whole numbers from 1 to 4
#
#    > isValidMove("apple",4,1,4)
#    ERROR game argument must be of class sudoku
#
#    > isValidMove(x,4,1,1) # ERROR
#    ERROR that location already contains a value
#
#    > isValidMove(x, 4, 4, 2)  # is placing a 4 in row4,column2 valid?
#    [1] "valid"
#
#    > isValidMove(x, 4, 3, 2)  # is placing a 4 in row3,column2 valid?
#    [1] "repeated value in row"
#
#    > isValidMove(x, 4, 4, 3)  # is placing a 4 in row4,column3 valid?
#    [1] "repeated value in sub grid"
#
#    > isValidMove(x, 2, 4, 3)  # is placing a 2 in row4,column3 valid?
#    [1] "repeated value in column"
#
#    > isValidMove(x, 1, 4, 2)  # is placing a 1 in row4,column2 valid?
#    [1] "repeated value in row" "repeated value in column"  "repeated value in subgrid"
#
#    > isValidMove(x, 1, 4, 4)  # is placing a 1 in row4,column4 valid?
#    [1] "repeated value in row" "repeated value in column"
#
#    > isValidMove(x, 4, 4, 4)  # is placing a 4 in row4,column4 valid?
#    [1] "repeated value in column"  "repeated value in subgrid"
#
#    > isValidMove(x, 4, 3, 4)  # is placing a 4 in row3,column4 valid?
#    [1] "repeated value in row"  "repeated value in subgrid"
