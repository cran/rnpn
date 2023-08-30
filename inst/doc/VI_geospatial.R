## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(rnpn)
library(raster)

## ----eval=FALSE---------------------------------------------------------------
#  layers <- npn_get_layer_details()

## ----eval=FALSE---------------------------------------------------------------
#  npn_get_agdd_point_data(
#   'gdd:agdd_50f',
#   '38',
#   '-90',
#   '2019-02-25'
#  )

## ----eval=FALSE---------------------------------------------------------------
#  npn_get_point_data(
#   'si-x:lilac_bloom_ncep',
#   '30',
#   '-90',
#   '2019-02-25'
#  )

## ----eval=FALSE---------------------------------------------------------------
#  custom_agdd_raster <- npn_get_custom_agdd_raster(
#   method = 'double-sine',
#   climate_data_source = 'NCEP',
#   temp_unit = 'fahrenheit',
#   start_date = '2019-01-01',
#   end_date = '2019-05-10',
#   base_temp = 20,
#   upper_threshold = 90
#  )

## ----eval=FALSE---------------------------------------------------------------
#  npn_download_geospatial(
#   'gdd:30yr_avg_agdd_50f',
#   95
#  )

## ----eval=FALSE---------------------------------------------------------------
#  npn_download_geospatial(
#   'gdd:agdd',
#   '2018-05-05',
#   output_path='20180505-agdd-value.tiff'
#  )

## ----eval=FALSE---------------------------------------------------------------
#  npn_download_geospatial(
#   "si-x:average_bloom_prism",
#   "1995-01-01"
#  )

## -----------------------------------------------------------------------------
AGDDJun2019<-npn_download_geospatial(
 "gdd:agdd_50f", 
 "2019-06-25"
)

## -----------------------------------------------------------------------------
plot(
 AGDDJun2019, 
 main = "AGDD base 50 on June 25th, 2019"
)

## ----eval=FALSE---------------------------------------------------------------
#  average_30yr <- npn_download_geospatial(
#   "gdd:30yr_avg_agdd",
#   45
#  )

## ----eval=FALSE---------------------------------------------------------------
#  npn_download_geospatial(
#   "si-x:arnoldred_bloom_prism",
#   "1987-01-01"
#  )
#  
#  average_model <- npn_download_geospatial(
#   "si-x:average_bloom_prism",
#   "1987-01-01"
#  )
#  

## ----warning = FALSE, message=FALSE-------------------------------------------
BESTSIxData1905 <- npn_download_geospatial(
 'si-x:average_bloom_best', 
 '1905-01-01'
)
NAvalue(BESTSIxData1905) <- -9999

## -----------------------------------------------------------------------------
plot(
 BESTSIxData1905, 
 main = "Spring Index, 1905"
)


## -----------------------------------------------------------------------------
daily_max_20190505 <- npn_download_geospatial(
 'climate:tmax', 
 '2019-05-05'
)

plot(
 daily_max_20190505, 
 main = "Daily Temperature Max (C), May 5th, 2019"
)

## ----eval=FALSE---------------------------------------------------------------
#  median_greenup <- npn_download_geospatial(
#   'inca:midgup_median_nad83_02deg',
#   ''
#  )
#  
#  plot(
#   median_greenup,
#   main = "MODIS Median Mid-Greenup, 2001 - 2017"
#  )

