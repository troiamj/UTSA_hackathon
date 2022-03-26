########################################################################################################
# load libraries
library(codep) # contains the ecological data we'll be exploring

# load the ecological data; composed of three matrices
data(Doubs)

# have a look at each matrix
Doubs.fish # counts of 27 species collected at 30 sites
Doubs.env  # 9 in-stream environmental variables measured at 30 sites
Doubs.geo  # 4 geographic variables measured at 30 sites

# for simplicity let's convert the count data to presence-absence data
Doubs.fish.PA <- ifelse(Doubs.fish > 0, 1, 0)
# Unsure about how a function works?
?ifelse

# The site by species matrix is a fundamental dataset in ecology
# See accompanying PowerPoint slide #2

########################################################################################################
# There are fundamental questions in ecology

# 1) Which species are common and which are rare?
vec_incidence <- apply(Doubs.fish.PA, 2, sum)
vec_incidence
hist(vec_incidence) # visualize with a histogram
vec_incidence[order(vec_incidence)]

# 2) How many species occur in one place versus another?
vec_richness <- apply(Doubs.fish.PA, 1, sum)
vec_richness
summary(vec_richness)

# 3) How does the environment affect species richness?
# visualize a few bivariate relationships
plot(Doubs.geo[,4], vec_richness)  # elevation
plot(Doubs.env[,2], vec_richness)  # discharge
plot(Doubs.env[,3], vec_richness)  # pH

# quantify the relationships using correlation analysis
cor(Doubs.geo[,4], vec_richness)  # elevation
cor(Doubs.env[,2], vec_richness)  # discharge
cor(Doubs.env[,3], vec_richness)  # pH

########################################################################################################
# There are *many* other ways to quantify biodiversity patterns
# See accompanying PowerPoint slide #3
# See open-source book: Numerical Ecology with R
# https://link.springer.com/content/pdf/10.1007%2F978-1-4419-7976-6.pdf
