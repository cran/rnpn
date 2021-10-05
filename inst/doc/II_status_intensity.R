## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(rnpn)

## ----eval=FALSE---------------------------------------------------------------
#  npn_download_status_data(
#    request_source = 'Your Name Here',
#    years = c('2018'),
#    states = c("NY","PA","VT","MA"),
#    functional_types = 'Bird'
#  )

## ----eval=FALSE---------------------------------------------------------------
#  npn_download_status_data(
#    request_source = 'Your Name Here',
#    years = c('2018'),
#    functional_types = 'Bird',
#    additional_fields = 'Site_Name',
#    download_path ='Bird_data_2018_SiteName.csv'
#  )

