#############################################################################
#############################################################################
# Creating your own classes
#
# To create your own class, simply attach your own class attribute with a name
# for your class to the underlying data structure you want to use for your class.
#
# Then you can create methods, specific to your class,
# for any existing "generic functions", for example, print.YOUR_CLASS and summary.YOUR_CLASS.
#############################################################################
#############################################################################

#----------------------------------------------------------------------------
# Example - "ticTacToe" class.
#----------------------------------------------------------------------------

# function to create a new ticTacToe game
newTicTacToe = function(){
  mat = matrix(rep(".",9), nrow=3, ncol=3)
  attr(mat,"class") = "ticTacToe"   # create a new class
  mat
}

# function to register a move for x
move_x = function(ttt, row, col){
  ttt[row,col] = "x"
  return(ttt)
}

# function to register a move for o
move_o = function(ttt, row, col){
  ttt[row,col] = "o"
  return(ttt)
}

# print method for the ticTacToe class. 
# This will automatically be called anytime an object (i.e. variable)
# of class "ticTacToe" is displayed to the screen.

print.ticTacToe = function(ttt){
  cat("  "," ",     " | " ,  " " ,     " | " ,  " ",     "\n")
  cat("  ",ttt[1,1]," | " , ttt[1,2] , " | " , ttt[1,3], "\n")
  cat("  "," ",     " | " ,  " " ,     " | " ,  " ",     "\n")
  cat("--------------------\n")  
  cat("  "," ",     " | " ,  " " ,     " | " ,  " ",     "\n")
  cat("  ",ttt[2,1]," | " , ttt[2,2] , " | " , ttt[2,3], "\n")
  cat("  "," ",     " | " ,  " " ,     " | " ,  " ",     "\n")
  cat("--------------------\n")  
  cat("  "," ",     " | " ,  " " ,     " | " ,  " ",     "\n")
  cat("  ",ttt[3,1]," | " , ttt[3,2] , " | " , ttt[3,3], "\n")
  cat("  "," ",     " | " ,  " " ,     " | " ,  " ",     "\n")
}

# summary method for the ticTacToe class.

summary.ticTacToe = function(ttt){
  results = character()   # create results as an empty character vector
  
  results["numberOfO"] = sum(ttt=="o")
  
  results["numberOfX"] = sum(ttt=="x")
  
  results["o_wins"] = 
    # Check the rows
    ttt[1,1] == "o" & ttt[1,2] =="o" & ttt[1,3] == "o" | # row1 all "o's"
    ttt[2,1] == "o" & ttt[2,2] =="o" & ttt[2,3] == "o" | # row2 all "o's"
    ttt[3,1] == "o" & ttt[3,2] =="o" & ttt[3,3] == "o" | # row3 all "o's"
    
    # check the columns
    ttt[1,1] == "o" & ttt[2,1] =="o" & ttt[3,1] == "o" | # col1 all "o's"
    ttt[1,2] == "o" & ttt[2,2] =="o" & ttt[3,2] == "o" | # col2 all "o's"
    ttt[1,3] == "o" & ttt[2,3] =="o" & ttt[3,3] == "o" | # col3 all "o's"
    
    # check the diagonals
    ttt[1,1] == "o" & ttt[2,2] =="o" & ttt[3,3] == "o" | # diagonal1 all "o's"
    ttt[1,3] == "o" & ttt[2,2] =="o" & ttt[3,1] == "o"   # diagonal2 all "o's"  
  
  results["x_wins"] = 
    # Check the rows
    ttt[1,1] == "x" & ttt[1,2] =="x" & ttt[1,3] == "x" | # row1 all "o's"
    ttt[2,1] == "x" & ttt[2,2] =="x" & ttt[2,3] == "x" | # row2 all "o's"
    ttt[3,1] == "x" & ttt[3,2] =="x" & ttt[3,3] == "x" | # row3 all "o's"
    
    # check the columns
    ttt[1,1] == "x" & ttt[2,1] =="x" & ttt[3,1] == "x" | # col1 all "o's"
    ttt[1,2] == "x" & ttt[2,2] =="x" & ttt[3,2] == "x" | # col2 all "o's"
    ttt[1,3] == "x" & ttt[2,3] =="x" & ttt[3,3] == "x" | # col3 all "o's"
    
    # check the diagonals
    ttt[1,1] == "x" & ttt[2,2] =="x" & ttt[3,3] == "x" | # diagonal1 all "o's"
    ttt[1,3] == "x" & ttt[2,2] =="x" & ttt[3,1] == "x"   # diagonal2 all "o's"  
  
  
  results
}

# Using the ticTacToe class
game1 = newTicTacToe()

print(game1)
print.ticTacToe(game1)
game1  # empty tic tac taoe board - no one moved yet
class(game1)   # "ticTacToe"

unclass(game1)
attributes(game1)

game1 = move_x(game1, 1, 1) # Make the first move
game1                       # show the game board so far.

game1 = move_o(game1, 1, 3) # more moves
game1 = move_x(game1, 2, 2) # more moves
game1 = move_o(game1, 3, 3) # more moves
game1 = move_x(game1, 2, 3) # more moves

game1             # show the board so far
summary(game1)    # summary of the game so far

# Make a few more moves
game1 = move_o(game1, 3, 1) # more moves
game1 = move_x(game1, 1, 2) # more moves
game1 = move_o(game1, 3, 2) # final move of the game

game1              # show the board
summary(game1)     # o wins
