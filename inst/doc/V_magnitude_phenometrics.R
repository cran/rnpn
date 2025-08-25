## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(rnpn)

## ----eval=FALSE---------------------------------------------------------------
# npn_download_magnitude_phenometrics(
#   request_source = 'Your Name Here',
#   years = '2018',
#   period_frequency = "7",
#   species_ids = '245',
#   phenophase_ids = '292',
#   download_path = 'MPM_BCC_ActInd_2018.csv'
# )

## ----eval=FALSE---------------------------------------------------------------
# BCC_AI<-read.csv(
#   'MPM_BCC_ActInd_2018.csv',
#   header = TRUE,
#   na=-9999,
#   stringsAsFactors = FALSE
# )
# 
# plot(
#   BCC_AI$proportion_yes_record~as.Date(BCC_AI$start_date,"%Y-%m-%d"),
#   ylab=c("Proportion Yes Records"),
#   xlab=c("Date"),
#   cex=2,
#   cex.axis=1.5,
#   cex.lab=1.5,
#   pch=21,
#   xlim=as.Date(c("2018-01-01", "2018-08-01")),
#   ylim=c(0,1)
# )

## ----echo=FALSE, out.width = "50%", fig.pos="h"-------------------------------
knitr::include_graphics("figures/magnitude-phenometrics.png")



