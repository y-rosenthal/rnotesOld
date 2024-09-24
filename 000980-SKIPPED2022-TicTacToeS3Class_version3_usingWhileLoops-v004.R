rm(list=ls())
#############################################################################
# This is version 3 of the ticTacToe code.
# 
# If you'd like to compare this with earlier versions of the code you can use
# the website diffchecker.com to compare two files.
#
# CHANGES FROM VERSION 2 TO VERSION 3: 
#   - In version 2 when the user was asked questions (e.g. what letter
#     they wished to be or which row,col they wanted to move into)
#     the game would stop with an error if the user didn't answer correctly.
# 
#     In this version of the game, the while loop is used to keep asking
#     the user to re-enter their choice if they replied incorrectly.
#
#   - Modify the playGame function so that the 9 moves of the game are
#     done via a while loop. This makes the code shorter and 
#     easier to understand. It will also allow us to easily modify
#     the game to use a larger board to allow for playing
#     connect-4 or another version of a similar game.
#
# CHANGES FROM VERSION 1 TO VERSION 2:
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
# CHANGES FROM VERSION 1:  NONE
# CHANGES FROM VERSION 2:  NONE
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
#
# CHANGES FROM VERSION 2:  NONE
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
# CHANGES FROM VERSION 1:  NONE
# CHANGES FROM VERSION 2:  NONE
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
# NO CHANGES FROM VERSION 2
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
# CHANGES FROM VERSION 1 : this is a new function that didn't exist in version 1
#
# CHANGES FROM VERSION 2:  NONE
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
# CHANGES FROM VERSION 1 : this is a new function that didn't exist in version 1
#
# CHANGES FROM VERSION 2:  NONE
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
# CHANGES FROM VERSION 1 : this is a new function that didn't exist in version 1
#
# CHANGES FROM VERSION 2: If the user doesn't answer correctly, use a while
#    loop to keep asking the user for correct info. In version 2 we didn't keep
#    asking the user for a valid answer. Rather, we stopped with an error the
#    first time the user gave us a wrong answer.
#                             
#------------------------------------------------------------------------------

# NOTE ABOUT THE CODE IN THE FOLLOWING FUNCTION:
# (you can skip this note if you like)
#
# If the user types in a word instead of a number, 
# the as.numeric below may cause a "warnings" to be displayed when the game
# is finished if the user entered words instead of numbers. For example
# the following is the end of a game being played.
# The user incorrectly typed "apple" and "orange" for the row and column
# numbers. Notice the warnings at the very end.
#
#      ...  GAME IS BEING PLAYED UNTIL JUST BEFORE THE LAST MOVE
#
#        YOUR MOVE ( you are x )
#        what row? apple            # This causes the as.numeric to return NA
#        what column? orange        # This causes the as.numeric to return NA
#      
#        That is NOT a valid answer.
#        row and column must each be 1 or 2 or 3YOUR MOVE ( you are x )
#        what row? 2
#        what column? 1
#             |     |    
#          x  |  o  |  o 
#             |     |    
#        --------------------
#             |     |    
#          x  |  .  |  . 
#             |     |    
#        --------------------
#             |     |    
#          x  |  .  |  . 
#             |     |    
#        *** GAME OVER ***
#        numberOfO numberOfX    o_wins    x_wins 
#              "2"       "3"   "FALSE"    "TRUE" 
#
#        Warning messages:
#        1: In makeUserMove(game, userLetter) : NAs introduced by coercion
#        2: In makeUserMove(game, userLetter) : NAs introduced by coercion  
#
# I'm not concerned about these warnings since the purpose of this 
# example is to teach basic coding skills of using if's and while loops.
# Writing this code to use as.numeric is the shortest and easiest way 
# I could think of to get this code to work. There are more complex approaches 
# that would avoid the warnings. However, that would make the code more
# complicated and I didn't want to distract from the primary goal of 
# focusing on how if's and while loops work. The logic below could
# be modified to use strsplit and other code to check that all characters
# entered are actually numeric digits. (We have not covered strsplit in class.
# You can see the documentation - ?strsplit. We will use strsplit
# in the data management course).

makeUserMove = function(ttt, usersLetter){

  validMove = FALSE   # we do NOT have a valid move yet.
  
  # keep looping until we get valid answers
  
  while( !validMove ) {    # This is the same as "while(validMove == FALSE) {"

    cat("YOUR MOVE ( you are", usersLetter, ")\n")
    
    rownum = readline("what row? ") 
    colnum = readline("what column? ")
    rownum = trunc( as.numeric(rownum) )
    colnum = trunc( as.numeric(colnum) )
    
    # Only one of the following blocks of code will execute.
    
    if( is.na(rownum) | is.na(colnum) | 
        rownum < 1 | rownum > 3 |
        colnum < 1 | colnum > 3){
      
      cat("\nThat is NOT a valid answer.\n",
          "row and column must each be 1 or 2 or 3\n\n")

    } 
    
    # we didn't do the first if, so the rownum and colnum
    # must 1,2 or 3
    else if (ttt[rownum, colnum] != "."){
      
      
      cat("\nThat row,col already contains a letter.\n\n")
          
    } else {
      
      # we got here so the move must be a valid move
      validMove = TRUE    
      
    }  # end of the else
    
  }  # end of the while loop

  # We are after the while loop so we must have valid
  # numbers in rownum and colnum.
  
  # Now, make the move.
  ttt = move(ttt, usersLetter, rownum, colnum)
  
  # return the new ticTacToe
  ttt
}

#------------------------------------------------------------------------------
# play an interactive game - user against the computer
#
# CHANGES FROM VERSION 1 : this is a new function that didn't exist in version 1
#
# CHANGES FROM VERSION 2:
#   - Ask the user to choose a letter. 
#     If the user doesn't answer correctly, use a while loop to keep asking the
#     user for correct info. In version 2 we didn't keep
#     asking the user for a valid answer. Rather, we stopped with an error the
#     first time the user gave us a wrong answer.
#
#   - Rewrite the code to make the 9 moves of the game to use a while loop.
#     This makes the code shorter and also allows us to eventually
#     convert this game into a "connect-4" or "connect-n" game (which we'll
#     do in the next version) instead of just "tic tac toe".
#                             
#------------------------------------------------------------------------------

playGame = function(){
  game = newTicTacToe()

  userLetter = "no letter chosen yet"

  # Keep looping until the user specifed an "x" or an "o" for their letter.
  while (userLetter != "x" & userLetter !="o"){
    # ask the user if they want to be x or o 
    userLetter = readline("Would you like to be 'x' or 'o'? (x goes first) ")
 
    # If they chose an invalid letter then stop with an error.
    if (userLetter != "x" & userLetter != "o"){
      cat("\nyou must choose 'x' or 'o'\n\n")
    }
  }
  
  # assign the other letter for the computer
  if (userLetter == "x") {
    computerLetter = "o"
    
  } else {
    computerLetter = "x"
    
  }

  # If the computer is "x" then make a move for the computer  
  if (computerLetter == "x") {
    game = automaticMove(game, computerLetter)
    print(game)    # you must call print (or cat) from inside a function to print
  }
  
  while (!gameOver(game)){

    # user's move
    game = makeUserMove(game, userLetter)
    
    # computer's move
    if (!gameOver(game)){
      game = automaticMove(game, computerLetter)
    }
    
    print(game)
    
  }

  # We made all the possible moves
  cat("*** GAME OVER ***\n")

  return (summary(game))
}



# Play an interactive game
playGame()

