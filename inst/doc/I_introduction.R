## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  npn_download_[NAME OF DATA TYPE] (
#    request_source = [NULL]
#    year =  [NULL]
#    species_ID = [NULL]
#  )

## ----eval=FALSE---------------------------------------------------------------
#  species <- npn_species()

## ----eval=FALSE---------------------------------------------------------------
#  species[species$common_name=="red maple",]

## ----eval=FALSE---------------------------------------------------------------
#  npn_stations_with_spp (3)

