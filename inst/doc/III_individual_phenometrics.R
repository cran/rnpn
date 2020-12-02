## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(rnpn)

## ----eval=FALSE---------------------------------------------------------------
#  npn_download_individual_phenometrics(
#    request_source='Your Name Here',
#    years=c(2013,2014,2015,2016),
#    species_id=c(210),
#    download_path="saguaro_data_2013_2016.csv"
#  )

## ----eval=FALSE---------------------------------------------------------------
#  npn_download_individual_phenometrics(
#    request_source = 'Your Name Here',
#    years = c('2015'),
#    species_ids = c(97, 98, 99, 430),
#    phenophase_ids = c(498),
#    climate_data = TRUE,
#    download_path = 'Betula_data_2015.csv'
#  )

## ----eval=FALSE---------------------------------------------------------------
#  BetulaLeaf <- read.csv(
#    "Betula_data_2015.csv",
#    header = TRUE,
#    na=-9999,
#    stringsAsFactors = FALSE
#  )
#  
#  plot(
#    first_yes_doy~tmax_summer,
#    data=BetulaLeaf,
#    ylab=c("Day of Year"),
#    xlab=c("Tmax Summer"),
#    cex=2,
#    cex.axis=1.5,
#    cex.lab=1.5,
#    pch=21
#  )

## ---- echo=FALSE, out.width = "50%", fig.pos="h"------------------------------
knitr::include_graphics("figures/individual-phenometrics.png")

