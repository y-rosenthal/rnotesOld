rm(list=ls())
#############################################################################
# This is version 2 of the ticTacToe code
# 
# If you'd like to compare this with version 1 of the file you can use
# the website diffchecker.com to compare the two files.
#
#
# We made the following changes:
#   - removed function move_x and move_o and replaced it with a single
#     move function that takes the letter as an argument.
#   
#   - added several new functions to allow for playing an interactive game
#     see the comments above each function for a summary of what
#     the changes are from version 1 of this file. 
#############################################################################

#----------------------------------------------------------------------------
# Create a new "ticTacToe" game
#
# NO CHANGES FROM VERSION 1
#----------------------------------------------------------------------------
newTicTacToe = function(){
  mat = matrix(rep(".",9), nrow=3, ncol=3)
  attr(mat,"class") = "ticTacToe"   # create a new class
  mat
}

#------------------------------------------------------------------------------
# function to register a move
#
# CHANGES FROM VERSION 1:  combined move_x and move_o functions into this single
# move function. This function takes an argument, letter, that is expected
# to be either "x" or "o".
#------------------------------------------------------------------------------
move = function(ttt, letter, row, col){
  
  if (letter != "x" & letter != "o"){
    stop ("The letter must be an 'x' or an 'o'")
  }
  
  if (ttt[row,col] != ".") {
    stop("That row,col already contains a letter")
  }
  
  ttt[row,col] = letter
  return(ttt)
}


#------------------------------------------------------------------------------
# print method for the ticTacToe class. 
# This will automatically be called anytime an object (i.e. variable)
# of class "ticTacToe" is displayed to the screen.
#
# NO CHANGES FROM VERSION 1
#------------------------------------------------------------------------------
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

#------------------------------------------------------------------------------
# summary method for the ticTacToe class.
#
# NO CHANGES FROM VERSION 1
#------------------------------------------------------------------------------
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


#------------------------------------------------------------------------------
# gameOver( TTT_GAME ) - returns TRUE if the game is over and FALSE if it isn't
#
# NEW FUNCTION:  this is a new function that didn't exist in version 1
#------------------------------------------------------------------------------
gameOver = function(tttGame){
  smry = summary(tttGame)
  
  # summary returns a character vector - that's why the "TRUE"
  # is in "quotes" and that's why we need to use as.numeric in 
  # the following code.
  
  if(smry["o_wins"] == "TRUE" |        
     smry["x_wins"] == "TRUE" |
     as.numeric(smry["numberOfO"]) + as.numeric(smry["numberOfX"]) == 9
     ) { 
    
    return (TRUE)      # This is an "early" return. The function is now over. 
                       # The function ends before it gets to the last line.
                       # You MUST use return here since this is an "early" return
  }
  
  FALSE        # You don't need the else.
               #
               # You also don't have to use return here since the function is
               # finished and it's "obvious" that the function will return the
               # value of the last command. 
}


#------------------------------------------------------------------------------
# Make an automatic move for the computer
#
# NEW FUNCTION:  this is a new function that didn't exist in version 1
#------------------------------------------------------------------------------
automaticMove = function(ttt, letter){

  # determine which locations are free
  #
  # Note the next two lines could also be accomplished with the following
  # one line. However, we did not learn the "which" function yet so
  # instead I did it a longer way. 
  #
  #      freeLocations = which(ttt == ".")    # see ?which
  
  allLocations = 1:9
  freeLocations = allLocations [ ttt == "." ]
  
  # NOTE   : sample(c(2,5,9), 1) picks one random number out of c(2,5,9)
  # HOWEVER: sample(    5   , 1) picks one random number out of c(1,2,3,4,5)
  # 
  # therefore, we have to do different things if there is more than one 
  # number in freeLocations or if there is only one number in freeLocations

  if (length(freeLocations) > 1)    pickedLocation = sample(freeLocations, 1)
  else                              pickedLocation = freeLocations
  
  # assign the letter to the picked location
  ttt[ pickedLocation ] = letter
  
  # return the new ttt board
  ttt
}


#------------------------------------------------------------------------------
# make a move for the user
#
# NEW FUNCTION:  this is a new function that didn't exist in version 1
#------------------------------------------------------------------------------
makeUserMove = function(ttt, usersLetter){

  # Ask the user for their move
  cat("YOUR MOVE ( you are", usersLetter, ")\n")
  rownum = readline("what row? ") 
  colnum = readline("what column? ")
  rownum = trunc( as.numeric(rownum) )
  colnum = trunc( as.numeric(colnum) )
  
  if( is.na(rownum) | is.na(colnum) |
      rownum < 1 | rownum > 3 |
      colnum < 1 | colnum > 3){
    stop ("row and column must each be 1 or 2 or 3")
  }

  # make the move  
  ttt = move(ttt, usersLetter, rownum, colnum)
  
  # return the new ticTacToe
  ttt
}

#------------------------------------------------------------------------------
# play an interactive game - user against the computer
#
# NEW FUNCTION:  this is a new function that didn't exist in version 1
#------------------------------------------------------------------------------
playGame = function(){
  game = newTicTacToe()

  # ask the user if they want to be x or o 
  userLetter = readline("Would you like to be 'x' or 'o'? (x goes first) ")
 
  # If they chose an invalid letter then stop with an error.
  if (userLetter != "x" & userLetter != "o"){
    stop("you must choose 'x' or 'o'")
  }
  
  # assign the other letter for the computer
  if (userLetter == "x") {
    computerLetter = "o"
    
  } else {
    computerLetter = "x"
    
  }

  #--------------------------------
  # Move #1 if computer goes first
  #--------------------------------
  # If the computer is "x" then make a move for the computer  
  if (computerLetter == "x") {
    game = automaticMove(game, computerLetter)
    print(game)    # you must call print (or cat) from inside a function to print
  }

  # user's move .............................. move 2 (or move 1 if user is x)
  game = makeUserMove(game, userLetter)
  
  # computer's move .......................... move 3 (or move 2 if user is x)
  game = automaticMove(game, computerLetter)
  print(game)           # print the board every time the computer makes a move
  
  # user's move .............................. move 4 (or move 3 if user is x)
  game = makeUserMove(game, userLetter)     
  
  # computer's move .......................... move 5 (or move 4 if user is x)
  game = automaticMove(game, computerLetter)
  print(game)           # print the board every time the computer makes a move
  
  
  #---------------------------------------------------------------------------
  # From this point on, only make a move if the game is not over yet.
  #---------------------------------------------------------------------------
  
  # user's move .............................. move 6 (or move 5 if user is x)
  if (!gameOver(game)){
    game=makeUserMove(game, userLetter)      
    if (gameOver(game)) print(game)       # if game is over, display the board
  }
  
  # computer's move .......................... move 7 (or move 6 if user is x)
  if (!gameOver(game)) {
    game=automaticMove(game, computerLetter)
    print(game)  
  }
  
  # user's move .............................. move 8 (or move 7 if user is x)
  if (!gameOver(game)){
    game=makeUserMove(game, userLetter)
    if (gameOver(game)) print(game)       # if game is over, display the board
  }
  
  # computer's move .......................... move 9 (or move 8 if user is x)
  if (!gameOver(game)) {
    game=automaticMove(game, computerLetter) 
    print(game)         # print the board every time the computer makes a move
  }
  
  # user's move
  if (!gameOver(game)) {
    # We already made 9 moves if the computer is x but if the user is x 
    # then the user can still make one last move
    game=makeUserMove(game, userLetter) 
    
    # The game is definitely over by now since enough moves were
    # made to fill up the entire board.
    print(game)
  }
  
  # We made all the possible moves
  cat("*** GAME OVER ***\n")

  
  return (summary(game))
}



# Play an interactive game
playGame()

