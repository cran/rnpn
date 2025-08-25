## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----eval=FALSE---------------------------------------------------------------
# library(RColorBrewer)
# library(rnpn)
# library(sf)
# library(terra)

## ----eval=FALSE---------------------------------------------------------------
# npn_download_site_phenometrics(
#   request_source = 'Your Name Here',
#   years = '2013',
#   num_days_quality_filter = '30',
#   species_ids = '35',
#   phenophase_ids = '373',
#   download_path = 'cl_lilac_data_2013_SIxLeaf.csv',
#   six_leaf_layer = TRUE,
#   six_sub_model = 'lilac'
# )

## ----eval=FALSE---------------------------------------------------------------
# LilacLeaf2018 <- npn_download_geospatial(
#   'si-x:lilac_leaf_ncep_historic',
#   '2018-01-01',
# )
# 
# 
# LilacLeaf2018Obs <- npn_download_individual_phenometrics(
#   request_source = 'Your Name Here',
#   years = '2018',
#   species_ids = '35',
#   phenophase_ids = '373'
# )

## ----eval=FALSE---------------------------------------------------------------
# # coords <- LilacLeaf2018Obs[ , c("longitude", "latitude")]
# # data <- as.data.frame(LilacLeaf2018Obs$first_yes_doy)
# 
# crs <- st_crs("+proj=utm +zone=18 +datum=WGS84 +units=m +no_defs
#                  +ellps=WGS84 +towgs84=0,0,0")
# 
# LL_sf <- st_as_sf(
#   LilacLeaf2018Obs,
#   coords = c("longitude", "latitude"),
#   crs = crs
# )
# 

## ----eval=FALSE---------------------------------------------------------------
# my.palette <- brewer.pal(n = 9, name = "OrRd")
# 
# plot(
#   LilacLeaf2018,
#   col = my.palette,
#   main = "2018 Observed and Predicted Lilac Leaf Out"
# )
# 
# plot(
#   LL_sf,
#   main = "Lilac Obs",
#   pch = 21,
#   bg = my.palette,
#   col = 'black',
#   xlim = c(-125.0208, -66.47917),
#   ylim = c(24.0625, 49.9375),
#   add = TRUE
# )
# 
# legend(
#   "bottomright",
#   legend = c("Cloned Lilac Leaf Out Observations"),
#   pch = 21,
#   bg = 'white',
#   col = 'black',
#   bty = "n",
#   cex = 0.8
# )
# 

## ----echo=FALSE, out.width = "50%", fig.pos="h"-------------------------------
knitr::include_graphics("figures/7-plot.png")

