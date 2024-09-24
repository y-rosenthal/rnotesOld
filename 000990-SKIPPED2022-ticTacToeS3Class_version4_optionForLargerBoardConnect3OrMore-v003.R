rm(list=ls())
#############################################################################
# This is version 4 of the ticTacToe code.
# 
# If you'd like to compare this with earlier versions of the code you can use
# the website diffchecker.com to compare two files.
#
#
# CHANGES FROM VERSION 3 TO VERSION 4: 
#   - The game was changed to allow for a larger board. Instead of just a 3x3
#     tic tac toe board, users can now choose any number of rows any number
#     of columns (e.g. a 20x30 board). The user also chooses how many x's 
#     or o's in a row are needed to win.
#
#   - This version uses a list to store everything about a game. 
#     (In the previous versions a matrix was used.)
#     In this version, the list has two entries
#       o $mat         - this entry in the list contains that matrix
#       o $amountToWin - a single number that is the number of x's or o's in a 
#                        row that are needed to win
#
#     Since this version stores the information in a list, the class attribute
#     is NOT set on the matrix (which is now just one item in the list). Rather
#     the class attribute is set on the list.
#
#     The name of the class is still "ticTacToe" even though the game is not a
#     typical game of "tic tac toe". I didn't change the name of the class in
#     order to avoid needing to change the names of the print and summary methods.
#
#     All of the various functions that work with the matrix needed to be updated
#     to get the matrix from inside the list. For example, see the comment
#     that appears at the beginning of the print.ticTacToe function.
#
#   - Since the board is allowed to be different sizes, the code for the 
#     print.ticTacToe needed to be changed to draw the board to different
#     sizes. This code uses "nested while loops" to accomplish that. 
#     Because the board can be very large, we also redisigned the way the board 
#     looks. For example a board of 4 rows and 5 columns now gets displayed
#     as shown below (see the code and comments below for print.ticTacToe)
#
#                                 COLUMN NUMBERS
# 
#                                 1 2 3 4 5 
#                              1  . . . . . 
#                ROW NUMBERS   2  . . x . . 
#                              3  . . . . . 
#                              4  . o . . . 
#
#   - A new function, isWinner = function(ttt, letter),
#     was created to check the board to see if someone won (see the comments
#     in the function below). This function also needed to check every spot
#     on the board and uses "nested while loops" to do so.
#
#   - There were other changes to the existing code 
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

# CHANGES FROM VERSION 3:
#
#   Return a list instead of a matrix. The list contains two entries:
#       o $mat     - contains the matrix
#       o $amountToWin - is the number of x's or o's in a row needed to win.
#
#   The class attribute is attached to the list instead of to the matrix.
#----------------------------------------------------------------------------
newTicTacToe = function(numrows, numcols, amountToWin){
  mat = matrix(rep(".",numrows * numcols), nrow=numrows, ncol=numcols)
  
  game = list(mat=mat, amountToWin=amountToWin)
  
  attr(game,"class") = "ticTacToe"   # create a new class
  
  game
}

#------------------------------------------------------------------------------
# function to register a move
#
# CHANGES FROM VERSION 1:  combined move_x and move_o functions into this single
# move function. This function takes an argument, letter, that is expected
# to be either "x" or "o".
#
# CHANGES FROM VERSION 2:  NONE
#
# CHANGES FROM VERSION 3:  
#   In this version the ttt object is a list that contains a matrix.
#   In the previous version, the ttt object WAS the actual matrix.
#   Therefore in this version, code that refers to the matrix needed
#   to be changed from "ttt" to "ttt$mat"
#------------------------------------------------------------------------------
move = function(ttt, letter, row, col){
  
  if (letter != "x" & letter != "o"){
    stop ("The letter must be an 'x' or an 'o'")
  }
  
  if (ttt$mat[row,col] != ".") {
    stop("That row,col already contains a letter")
  }
  
  ttt$mat[row,col] = letter
  
  # We are returning the ENTIRE list (not just the matrix). 
  # Therefore the code below is return(ttt) [ and NOT return(ttt$mat) ]
  return(ttt)
}


#------------------------------------------------------------------------------
# print method for the ticTacToe class. 
# This will automatically be called anytime an object (i.e. variable)
# of class "ticTacToe" is displayed to the screen.
#
# CHANGES FROM VERSION 1:  NONE
# CHANGES FROM VERSION 2:  NONE
#
# CHANGES FROM VERSION 3:  There were MANY of changes to this function.
#     The board is now allowed to be larger than a 3x3 board. 
#     The game can be played on different size boards each time the game is run.
#     Since the board is allowed to be different sizes, the code for the 
#     print.ticTacToe needed to be changed to draw the board to different
#     sizes. This code uses "nested while loops" to accomplish that. 
#     Because the board can be very large, we also redesigned the way the board 
#     looks. For example a board of 4 rows and 5 columns now gets displayed
#     as shown below (see the code and comments below for more info)
#
#                                 COLUMN NUMBERS
# 
#                                 1 2 3 4 5 
#                              1  . . . . . 
#                ROW NUMBERS   2  . . x . . 
#                              3  . . . . . 
#                              4  . o . . . 
#
#------------------------------------------------------------------------------
print.ticTacToe = function(ttt){
  
  # In this latest version of the code, the ttt object is actually a list.
  # The list contains two items:
  #
  #     $mat           - is a matrix
  #     $amountToWin   - is the number of x's or o's to get in a row to win
  #
  # Therefore, in order to access the matrix in this version 
  # we need to use ttt$mat instead of just ttt as in the past versions.
  numCols = ncol(ttt$mat)
  numRows = nrow(ttt$mat)
  
  # This code is complicated by the fact that each horizontal line on the
  # screen must be displayed in its entirety before anything from a lower
  # horizontal line is displayed. This is just the way that cat works.
  
  columnHeading = "COLUMN NUMBERS"
  rowHeading = "ROW NUMBERS  "
  
  #--------------------------------------------------------------------------
  # This long section of code just displays the 1st three lines of output that
  # contain the column headings - for example:
  #
  #       COLUMN NUMBERS
  #
  #                          1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 etc ...
  #        1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 etc ...
  #
  # This code is complicated by a few things - see the comments below.
  #--------------------------------------------------------------------------
  
  # Calculate how many spaces to display before the column heading lines
  # and before each row of data.
  #
  # The nchar function returns the number of letters/symbols in a character value.
  # e.g. nchar("hello") is 5.
  # 
  # Before the column headings add an extra 4 spaces to account for the row 
  # numbers (that will be on each row of data) and the spaces that follow them.
  spacesBeforeColHeadings = paste0( rep(" ", nchar(rowHeading) + 4 ) , collapse="")
  spacesBeforeDataRows    = paste0( rep(" ", nchar(rowHeading) ) , collapse="")
  
  # Display the line that contains words "COLUMN NUMBERS"
  cat(spacesBeforeColHeadings, columnHeading, "\n\n", sep="")

  # Display the column numbers. If there are 9 or fewer columns then they
  # should be displayed as 
  #
  #    COLUMN NUMBERS
  #
  #    1 2 3 4 5 6 7 8 9
  #
  # If there are 10 or more columns the numbers should be displayed as 
  # shown below. 
  #
  #                  COLUMN NUMBERS
  #
  #                      1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 etc ...
  #    1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 etc ...
  #
  # This version of the program only allows a maximum of 99 columns.
  # This can be changed if necessary but for now this is fine.
  
  if(numCols < 10) {
    # display just one digit for the column number
    
    cat(spacesBeforeColHeadings)
    col = 1
    while(col <= numCols){
      cat(col, " ", sep="")
      col = col + 1
    }
    cat("\n")
    
  }
  else if (numCols < 100){

    # For 10 or more column numbers we will display each column number on
    # two different lines. For example:
    #                      1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 etc ...
    #    1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 etc ...

    # 1st line for the column numbers
    # show a space for the first 9 cols and 1st digit of each succeeding col number 
    cat(spacesBeforeColHeadings)
    cat("                  ") # 18 spaces (for first 9 columns, see "picture" above)
    col = 10                  # for 10,11,12,etc show the 2nd digit of the col#
    while(col <= numCols){
      cat(col %/% 10, " ", sep="") #  "1" for 10,11,12, etc, "2" for 20,21,22,etc
      col = col + 1
    }
    cat("\n")
    
    # 2nd line for the column numbers, ie.  1 2 3 4 5 6 7 8 9 0 1 2 3   etc ...
    cat(spacesBeforeColHeadings)
    col = 1
    while(col <= numCols){
      cat(col %% 10, " ", sep="")  
      col = col + 1
    }
    cat("\n")
    
  } else{
    stop("ERROR: numCols is ", numCols, "  numCols must be <= 99" )
  }
  
  #-------------------------------
  # Display the rows of data
  #-------------------------------
  
  row = 1
  while(row <= numRows){
    if(row == floor(numRows / 2)){
      cat(rowHeading)   # display "ROW NUMBERS  " on the middle row
      
    } else {
      cat(spacesBeforeDataRows)
      
    }
    
    # Display the row number.
    # Add a space before row numbers that are just one digit.
    if(row < 10)
      cat(" ")
    cat(row)
    cat("  ")
    
    # Display the data for the game. Include "|" symbols to separate the values.
    col = 1
    while(col <= numCols - 1){
      #cat(ttt[row,col],"|", sep="")
      cat(ttt$mat[row,col]," ", sep="")
      col = col + 1
    }
    
    cat(ttt$mat[row,numCols], "\n")
    
    ## for all rows except for the last row display a horizontal line of dashes
    ## below the data for that row
    
    # if(row < numRows) {
    #   # display spaces 
    #   cat(spacesBeforeDataRows, "  ",)  
    #   
    #   # an extra 2 spaces to account for the width of the row numbers
    #   cat("  ")
    #   
    #   # display the dashes
    #   numDashes = numCols * 2 - 1
    #   cat( rep("-", numDashes)  ,  "\n"   ,   sep="" )
    # }
    
    row = row+1
  }
}

#-----------------------------------------------------------------------------
# CHANGES FROM VERSION 3:  This is a new function that was introduced in 
#                          this version of the game.
#
# Check to see if "letter" won the game.
# Return TRUE if letter won.
# Otherwise, return FALSE.
#-----------------------------------------------------------------------------
isWinner = function(ttt, letter){
  amountToWin = ttt$amountToWin
  mat = ttt$mat
  
  # Start by assuming that the letter did NOT win.
  win = FALSE  
  
  # In the loops below 
  # we will analyze each position on the board to see if possibly the letter
  # won and if we find such a position we will set win to TRUE
  
  row = 1
  while(row <= nrow(mat)){
    col = 1
    while(col <= ncol(mat)){
      
      # check this location and next amountToWin positions to the right
      if (col <= ncol(mat) - amountToWin + 1 &&
          all(   mat[row , col:(col+amountToWin-1) ] == letter     )) {
        win = TRUE
        break # found winner so stop the loop - we don't have to look any further
      }
      
      # check this location and next amountToWin positions to the going down
      if (row <= nrow(mat) - amountToWin + 1 &&
               all(   mat[row:(row+amountToWin-1) , col ] == letter     )) {
        win = TRUE
        break # found winner so stop the loop - we don't have to look any further
      }
      
      # check this location and diagonal down and to the right
      if (col <= ncol(mat) - amountToWin + 1 &&
          row <= nrow(mat) - amountToWin + 1
      ) {
        r = row
        c = col
        windiagonal = TRUE # assume we will win on a diagonal
        while( r <= row+amountToWin-1 &&
               c <= col+amountToWin-1) {
          if(mat[r,c] != letter){
            windiagonal = FALSE
            break # stop this while loop since we found one value that didn't match
          }
          r = r+1
          c = c+1
        }
        if (windiagonal){
          win = TRUE
          break # found winner so stop the loop - we don't have to look any further
        }
      } # end of else if
      
      # check this location and diagonal up and to the right
      if (col <= ncol(mat) - amountToWin + 1 &&
          row >= amountToWin
      ) {
        r = row
        c = col
        windiagonal = TRUE # assume we will win on a diagonal
        while( r >= row - amountToWin + 1 &&
               c <= col+amountToWin-1) {
          if(mat[r,c] != letter){
            windiagonal = FALSE
            break # stop this while loop since we found one value that didn't match
          }
          r = r-1
          c = c+1
        }
        if (windiagonal){
          win = TRUE
          break # found winner so stop the loop - we don't have to look any further
        }
        
      } # end of else if
      
      col = col + 1
    } # end of inner while loop
    
    row = row + 1
    
    if(win == TRUE) break    # stop the outer while loop if we found a win
    
  } # end of outer while loop
  
  return(win)
}
#------------------------------------------------------------------------------
# summary method for the ticTacToe class.
#
# CHANGES FROM VERSION 1: none
# CHANGES FROM VERSION 2: none
# CHANGES FROM VERSION 3: This version calls the isWinner function (see above)
#                         to determine if a particular letter won the game.
#------------------------------------------------------------------------------
summary.ticTacToe = function(ttt){
  results = character()   # create results as an empty character vector
  
  results["numberOfO"] = sum(ttt$mat=="o")
  
  results["numberOfX"] = sum(ttt$mat=="x")
  
  results["o_wins"] = isWinner(ttt, "o")

  results["x_wins"] = isWinner(ttt, "x") 

  results
}


#------------------------------------------------------------------------------
# gameOver( TTT_GAME ) - returns TRUE if the game is over and FALSE if it isn't
#
# CHANGES FROM VERSION 1 : this is a new function that didn't exist in version 1
#
# CHANGES FROM VERSION 2:  NONE
#
# CHANGES FROM VERSION 3:  
#   In this version the tttGame object is a list that contains a matrix.
#   In the previous version, the tttGame object WAS the actual matrix.
#   Therefore in this version, code that refers to the matrix needed
#   to be changed from "tttGame" to "tttGame$mat"
#------------------------------------------------------------------------------
gameOver = function(tttGame){
  smry = summary(tttGame)
  
  # summary returns a character vector - that's why the "TRUE"
  # is in "quotes" and that's why we need to use as.numeric in 
  # the following code.
  
  if(smry["o_wins"] == "TRUE" |        
     smry["x_wins"] == "TRUE" |
     as.numeric(smry["numberOfO"]) + as.numeric(smry["numberOfX"]) ==
                nrow(tttGame$mat) *  ncol(tttGame$mat)
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
#
# CHANGES FROM VERSION 3:  
#   In this version the ttt object is a list that contains a matrix.
#   In the previous version, the ttt object WAS the actual matrix.
#   Therefore in this version, code that refers to the matrix needed
#   to be changed from "ttt" to "ttt$mat"
#------------------------------------------------------------------------------
automaticMove = function(ttt, letter){

  # determine which locations are free
  #
  # Note the next two lines could also be accomplished with the following
  # one line. However, we did not learn the "which" function yet so
  # instead I did it a longer way. 
  #
  #      freeLocations = which(ttt == ".")    # see ?which
  
  allLocations = 1:(nrow(ttt$mat) *  ncol(ttt$mat))
  freeLocations = allLocations [ ttt$mat == "." ]
  
  # NOTE   : sample(c(2,5,9), 1) picks one random number out of c(2,5,9)
  # HOWEVER: sample(    5   , 1) picks one random number out of c(1,2,3,4,5)
  # 
  # therefore, we have to do different things if there is more than one 
  # number in freeLocations or if there is only one number in freeLocations

  if (length(freeLocations) > 1)    pickedLocation = sample(freeLocations, 1)
  else                              pickedLocation = freeLocations
  
  # assign the letter to the picked location
  ttt$mat[ pickedLocation ] = letter
  
  # return the new ttt board
  ttt
}

#---------------------------------------------------------------------------
# Return TRUE if text is all digits.
# otherwise return FALSE.
#
# ARGUMENTS:
#    Text is expected to be a single text value.
#
# EXAMPLES:
#    > allDigits("123")
#    [1] TRUE
#
#    > allDigits("a123")
#    [1] FALSE
#
# CHANGES FROM VERSION 3:  NEW FUNCTION
#   This is a new function that was introduced in this version of the game.
#   This function checks to see if a character value contains only digits.
#
#   In previous versions, instead of using this function, we accomplished
#   the same thing by using as.numeric(text).
#   If the text had non-digits the result would have been NA. 
#   This approach worked but would result in "Warning" messages that would
#   be displayed after the game was finished. This function
#   avoids those warning messages. The warning messages became more of an 
#   issue in this version since in this version the games last longer
#   (since the board is bigger and you need more x's and o's to win).
#   Therefore users may have more typos and thus could result in many
#   warning messages. It was about time to fix this.
#---------------------------------------------------------------------------
allDigits = function( text ){
  if( length(text) != 1)
    stop("text must contain a single value")
  
  # strsplit returns a list of character vectors. 
  #
  # For example:
  #    > strsplit(c("abc","def"),"")
  #    [[1]]
  #    [1] "a" "b" "c"
  # 
  #    [[2]]
  #    [1] "d" "e" "f"
  #
  # Here we split the single character value that is contained in  the text
  # argument into it's individual symbols.

  symbols = strsplit(text, split="")[[1]]  
  
  if ( all ( symbols %in% c("0","1","2","3","4","5","6","7","8","9")))
    return(TRUE)
  else
    return(FALSE)
}

#---------------------------------------------------------------------------
# Ask the user for a number and return the number. If the user enters anything
# else (e.g. a word), then keep asking the user to re-enter the information
# until the user gets it right.
# 
# ARGUMENTS:
#   prompt1    - The prompt to display to the user.
#
#   prompt2    - The prompt to be displayed if the user enters the wrong info.
#                For example, if the user enters a word, or a number that is below
#                lowest or above highest, this prompt will be displayed and 
#                the user will be able to enter a different value.
#
#   lowest     - The lowest number to accept from the user
#
#   highest    - The highest value to accept from the user
#---------------------------------------------------------------------------
getANumber = function(prompt1, prompt2, lowest, highest){

  charNum = readline(prompt1)

  # NOTE:  || is VERY similar to |
  # See this for more explanation: 
  # https://stackoverflow.com/questions/16027840/whats-the-differences-between-and-and-in-r

  while( !allDigits(charNum) ||
      as.numeric(charNum) < lowest ||
      as.numeric(charNum) > highest) {
    charNum = readline(prompt2)
  }

  return(as.numeric(charNum))
  
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
# CHANGES FROM VERSION 3:  
#   - In this version the ttt object is a list that contains a matrix.
#     In the previous version, the ttt object WAS the actual matrix.
#     Therefore in this version, code that refers to the matrix needed
#     to be changed from "ttt" to "ttt$mat"
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

  # Keep asking the user for their move until they get it right and
  # enter a valid move. We start by setting validMove to FALSE and will
  # set it to TRUE inside the loop when the users finally enter a valid move.
  validMove = FALSE 
  while( !validMove ) {    # This is the same as "while(validMove == FALSE) {"

    cat("\nYOUR MOVE ( you are", usersLetter, "). To win, you must get", 
        ttt$amountToWin, "in a row.\n")
    
    rownum = readline("what row? ") 
    colnum = readline("what column? ")
    
    # Convert the character values to numeric values.
    #
    # Note that this code will
    # work but it will generate warnings if the user enters a "word". We can 
    # change this if we like to use the new function, getANumber, to avoid 
    # this issue. We can change code this later if we like.
    rownum = trunc( as.numeric(rownum) )
    colnum = trunc( as.numeric(colnum) )
    
    if( is.na(rownum) | is.na(colnum) | 
        rownum < 1 | rownum > nrow(ttt$mat) |
        colnum < 1 | colnum > ncol(ttt$mat)){
      
      cat("\nThat is NOT a valid answer.\n",
          "row must each be a whole number between 1 and ", nrow(ttt$mat), "\n",
          "column must each be a whole number between 1 and ", ncol(ttt$mat), "\n",
          sep=""
          )

    } else if (ttt$mat[rownum, colnum] != ".") {
      cat("\nThat row,col already contains a letter.\n\n")
          
    } else {
      # we got here so the move must be a valid move
      validMove = TRUE    
      
    }  # end of the else
    
  }  # end of the while loop

  # We are after the while loop so we must have valid #rs in rownum and colnum.
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
# CHANGES FROM VERSION 3:
#   - Ask the user for the size of the board (how many rows, how many columns)
#
#   - Ask the user for how many x's or o's need to be in a row to win.
#
#   - The board is now displayed even before the user makes a first move.
#     In the previous versions, if the user was "x" (and hence went first)
#     the board wouldn't be displayed until after the user makes their first 
#     move. In this version of the game, the board is always displayed 
#     before the user makes their first move.
#------------------------------------------------------------------------------

playGame = function(){
  cat("What size should the board be?\n")
  boardSize_rows = getANumber("How many rows? ",
             "Enter a whole number between 3 and 99: ",
             3, 99)
  
  boardSize_columns = getANumber("How many columns? ",
             "Enter a whole number between 3 and 99: ",
             3, 99)
  
  if (min(boardSize_rows, boardSize_columns) == 3){
    amountToWin = 3
    
  } else {
    amountToWin = getANumber(
                          prompt1 = "How many must a player get in a row to win? ",
                          prompt2 = paste(
                              "Enter a whole number between 3 and ",
                              min(boardSize_rows, boardSize_columns), ": ",
                              sep="") ,
                          lowest = 3, 
                          highest = min(boardSize_rows, boardSize_columns))
  }
  
  game = newTicTacToe(boardSize_rows, boardSize_columns, amountToWin)

  userLetter = "no letter chosen yet"

  # Keep looping until the user specifies an "x" or an "o" for their letter.
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

  # If the computer is "x" then make the 1st move for the computer  
  if (computerLetter == "x") {
    game = automaticMove(game, computerLetter)
  }

  # Display the board
  print(game)
  
  while (!gameOver(game)){

    # user's move
    game = makeUserMove(game, userLetter)
    
    # computer's move
    if (!gameOver(game)){
      game = automaticMove(game, computerLetter)
    }
    
    print(game)
    
  }

  cat("*** GAME OVER ***\n")

  return (summary(game))
}



# Play an interactive game
playGame()

