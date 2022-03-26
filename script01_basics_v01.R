# R works like a calculator
1 + 1
5 * 5

# R is object-oriented; create objects, manipulate them, have them interact with one another
# object can be numeric vectors...
vec01 <- 1:5
vec02 <- 6:10
# ... or character vectors
vec03 <- c("a","b","c","d","e")

# We can manipulate objects with functions
# some functions have few, simple inputs...
length(vec01)
mean(vec01)
# ... some require more inputs
rnorm(n = 100, mean = 0, sd = 1)

# We can use functions to create new objects
# Dataframes are two dimensional objects
dframe01 <- data.frame(vec01, vec02, vec03)
dframe01

# Here are some basic functions for exploring data in a dataframe
# How many rows? Columns?
nrow(dframe01)
ncol(dframe01)
dim(dframe01)

# We can grab individual columns from a dataframe
dframe01$vec01

# We can subset rows and/or columns using indexing brackets
# grab the value in the first row and second column
dframe01[1,2]
# grab the first row
dframe01[1,]
# grab the first two rows
dframe01[1:2,]
# grab the first column
dframe01[,1]

# grab the rows for which vec01 values are greater than 3
dframe01[dframe01$vec01 > 3,]
# Note that what you've done above is nest a boolean vector within the indexing brackets
dframe01$vec01 > 3
