## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(rnpn)

## ----eval=FALSE---------------------------------------------------------------
#  LilacLeafPoints2013<-npn_download_site_phenometrics(
#    request_source = 'Your Name Here',
#    years = c('2013'),
#    num_days_quality_filter = '30',
#    species_ids = '35',
#    phenophase_ids = '373'
#  )
#  

## ----eval=FALSE---------------------------------------------------------------
#  plot(
#    mean_first_yes_doy~latitude,
#    data=LilacLeafPoints2013,
#    ylab=c("Day of Year"),
#    xlab=c("Latitude"),
#    cex=2,
#    cex.axis=1.5,
#    cex.lab=1.5,
#    pch=21,
#    xlim=c(30,55),
#    ylim=c(0,200)
#  )

## ----echo=FALSE, out.width = "50%", fig.pos="h"-------------------------------
knitr::include_graphics("figures/site-phenometrics.png")

