# The following list contains the data for a chain of hardware stores
# From October 2021.
#
# The data for each store in the chain is stored in a separate list within
# the list of stores. 
#
# The first two items in the list are the year and month for the data.
# The other items in the list are lists of information for each store in 
# the chain. For simplicity, the data below only shows two stores. However, 
# there could be many stores in the chain, each with siimilarly structured data.
#
# Each store is allowed to set their own prices and salePrices. 
# Each store is also allowed to carry a somewhat different selection of 
# products than the other stores.
#
# For each store, the
# product, price, salePrice, amountSold and amountInInvetory 
# entries in the list are parallel vectors.
# 
# Answer the questions below by referring to this data. You should 
# write the code so that it will continue to work even if the actual 
# values in the data change. 

stores = list(
  year=2021,
  month=10,
  
  list(
    address="123 main street",
    storeId="1000",
    manager="joe",
    product =          c("hammer", "screwdriver", "hand saw", "nails","wrench" ),
    price=             c(10.99,    8.00,          15.00,      1.99,   5.00),
    salePrice=         c(8.99,     NA,            NA,         NA,     4.50),
    amountSold=        c(100,      200,           50,         500,    75),
    amountInInventory= c(20,       15,            0,          30,     5)
  ),

  list(
    address="99 hickory place",
    storeId="1111",
    manager="sue",
    product =          c("hammer","screwdriver", "screws", "nails","wrench" ),
    price=             c(11.99,    8.00,          3.50,    2.99,   4.99),
    salePrice=         c(NA,       7.00,          NA,      2.50,   4.50),
    amountSold=        c(80,       195,           200,     400,    80),
    amountInInventory= c(20,       15,            40,      15,     0)
  )
  
  # If there were other stores in the chain the data for the other
  # stores would appear as separate lists here.
   
)

# NOTE - the following command may help you to understand the data better
str(stores)

#----------------------------------------------------------------------------------
# QUESTION 1
# 
# Write a command to show the year and month of the data in the format
# month/year. For example if the year is 2021 and the month is 11
# then your command should show "11/2021". Remember that your command should
# continue to work even if the value of the year or month in the data changes.
#
# Use the $dollar-sign-notation for this answer.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 2
# 
# Same as the previous question but DO NOT use the $dollar-sign-notation
# for accessing the list.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 3
# 
# Part A
# Write a single command that returns a vector that contains
# the addresses of the first and second stores.
# The answer should look as follows: 
#   [1] "123 main street"  "99 hickory place"
#
# Part B
# Do this again, but this time use a different notation to access the list.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 4
# 
# Write a command to display the number of different products
# that is carried by the first store.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 5
#
# Remember, the list, stores, is guaranteed to only contain 
# the year, month and a separate list for each store in the chain.
#
# Remember that the he data in the main list for the chain store may be modified
# with additional stores by simply adding a new list for each new store.
#
# Write a command that calculates the number of stores in the chain.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 6
#
# Write a command to retrieve a list that contains 
# the year, month and just the data for the 2nd store.
# Store this new list in a variable called store2.
#
# Remember that the data above only contains two stores, but the command you write
# should work even if there were more stores (e.g. 100 stores) in the data.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 7
#
# The first store in the data actually went out of business in 9/2021
# However, it was mistakenly left in the data for 10/2021.
# Write a command to create a variable named updatedStores that contains
# all of the data from the stores list but without the data for the first store.
#
# Remember that the data above only contains two stores, but the command you write
# should work even if there were more stores (e.g. 100 stores) in the data.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 8
#
# The stores are allowed to carry different product lines.
# Write a command that shows those products that are carried by the 
# second store that are not carried by the first store.
# 
# PART A - write this answer using the %in% operator
# PART B - write this answer without using the %in% operator
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 9
#
# The products that are on sale have a number for the sale price.
# The products that are NOT on sale have NA for the sale price.
# Write a command to return a VECTOR of the names of the products
# that are on sale in the first store.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 10
#
# See the previous question.
#
# For this question create a variable named saleItems that
# is equal to a named list that contains
#    - a vector of product names that are on sale in the first store
#    - a vector of the regular prices of those itmes
#    - a vector of the sale prices of those items
#
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# QUESTION 11
#
# The list, stores, contains names for the year and month entries,
# but does not contain names for the two stores. 
# 
# PART A
#
# Copy the data for stores into a variable named storesWithNames
# i.e. storesWithNames = stores
# Then modify storesWithNames so that
#  - the list of data for the 1st store has a name, store1, in the main list and
#  - the list of data for the 2nd store has a name, store2, in the main list
#
#
# PART B
# Now use the storesWithNames variable to display the product names 
# in the 1st store, i.e. store1, whose prices are $10 or more.
# Use the new names that you just created in PART A as part of your answer.
#----------------------------------------------------------------------------------

############################################################################
############################################################################
# THE FOLLOWING QUESTIONS WERE ADDED AFTER THE MIDTERM
############################################################################
############################################################################

# TOPIC: character vectors, recycling rule between arguments of a single function
#----------------------------------------------------------------------------------
# QUESTION 
#
# charvec is a character vector.
# Write a command that repeats each value in charvec by as many characters 
# that are in that value. See the examples below.
#
# EXAMPLE:
#
#    > charvec = c("a", "bc", "def")
#    > YOUR CODE GOES HERE
#    [1] "a"   "bc"  "bc"  "def" "def" "def"
#----------------------------------------------------------------------------------

# ANSWER
rep(chars, nchar(chars))
