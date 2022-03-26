########################################################################################################
# Load libraries
library(raster)  # source of global climate data --> https://www.worldclim.org/
library(rgbif)   # source of global species occurrence data --> https://www.gbif.org/

########################################################################################################
# Download global climate data
bioclim <- getData(name = "worldclim", var = "bio", res = 10)

# Visualize temperature and precipitation variation across the globe
plot(bioclim[[1]]) # mean annual temperature
plot(bioclim[[12]]) # mean annual precipitation

########################################################################################################
# Download georeferenced occurrence records for species a tropical species (sun bear) and a polar species (polar bear)
occ_tropical <- as.data.frame(occ_data(scientificName = "Helarctos malayanus", limit = 1500)[[2]])[, c("decimalLongitude", "decimalLatitude")]
occ_polar <- as.data.frame(occ_data(scientificName = "Ursus maritimus", limit = 1500)[[2]])[, c("decimalLongitude", "decimalLatitude")]

# Visualize geographic distribution of species
plot(bioclim[[1]]) # Re-plot temperature map
points(occ_tropical, col = "red")  # Add occurrences --> tropical species
points(occ_polar, col = "blue")    # Add occurrences -->  polar species

########################################################################################################
# Visualize and compare climate envelops of the two species

# Extract temperature and precipitation at occurrence locations
occ_tropical.clim <- data.frame(extract(bioclim[[1]], occ_tropical),
                                extract(bioclim[[12]], occ_tropical))

occ_polar.clim <- data.frame(extract(bioclim[[1]], occ_polar),
                                extract(bioclim[[12]], occ_polar))

# Plot background climate
plot(bioclim[[1]], bioclim[[12]], col = "gray")

# Add tropical species
points(occ_tropical.clim[,1], occ_tropical.clim[,2], col = "red")
points(occ_polar.clim[,1], occ_polar.clim[,2], col = "blue")

########################################################################################################
# See website below for more detailed analyses
# http://rstudio-pubs-static.s3.amazonaws.com/415459_61fae98ff3984241bd5f7f31da425c98.html
