## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(rnpn)

## ----eval=FALSE---------------------------------------------------------------
#  df <- npn_download_status_data(
#    request_source = 'Your Name Here',
#    years = c(2015:2021),
#    species_ids = c(82),
#    additional_fields = c("Observed_Status_Conflict_Flag"),
#  )

## ----eval=FALSE---------------------------------------------------------------
#  library(dplyr)
#  conflict_summary <- df %>%
#    count(site_id, observed_status_conflict_flag) %>%
#    group_by(site_id) %>%
#    mutate(observed_status_conflict_flag=recode(
#      observed_status_conflict_flag,'MultiObserver-StatusConflict'='Multi', 'OneObserver-StatusConflict'='One')) %>%
#    mutate(Percent_Conflict = n / sum(n))

## ----eval=FALSE---------------------------------------------------------------
#  library(dplyr)
#  conflicts <- conflict_summary %>%
#    filter(observed_status_conflict_flag != '-9999')
#  
#  library(ggplot2)
#  p <- ggplot(conflicts,aes(observed_status_conflict_flag, Percent_Conflict)) +
#    facet_wrap(~conflicts$site_id) +
#    geom_bar(stat = "identity")
#  plot(p + labs(title = "Percent Multi and One Observer Status Conflict by Phenophase")
#       + scale_y_continuous(labels = scales::percent_format(scale = 100)))

## ---- echo=FALSE, out.width = "75%", fig.pos="h"------------------------------
knitr::include_graphics("figures/conflicts-by-site.png", dpi = NULL,
  error = getOption("knitr.graphics.error", TRUE))

## ----eval=FALSE---------------------------------------------------------------
#  df_hi_conflict_sites <- subset(conflicts, Percent_Conflict > 0.05)
#  df_low_conflict_sites <- subset(df, !site_id %in% hi_conflict_sites$site_id)

## ----eval=FALSE---------------------------------------------------------------
#  df_no_conflicts <- subset(df, observed_status_conflict_flag == "-9999")

## ----eval=FALSE---------------------------------------------------------------
#  df <- npn_download_individual_phenometrics(
#    request_source = 'Your Name Here',
#    years = c(2021),
#    species_ids = c(12)
#  )

## ----eval=FALSE---------------------------------------------------------------
#  library(dplyr)
#  df <- df %>%
#    mutate(numdays_since_prior_no = na_if(numdays_since_prior_no, "-9999"))
#  
#  hist(df$numdays_since_prior_no,
#       breaks = c(0,3,7,14,21,28,35,42,100,250),
#       main = "Histogram of Number of Days Since Prior No")
#  
#  quantile(x = df$numdays_since_prior_no,
#           probs = c(0.01, 0.05, 0.25, 0.75, 0.95, 0.99),
#           na.rm = TRUE)
#  

## ---- echo=FALSE, out.width = "75%", fig.pos="h"------------------------------
knitr::include_graphics("figures/HistogramPriorNo.png", dpi = NULL,
  error = getOption("knitr.graphics.error", TRUE))

## ----eval=FALSE---------------------------------------------------------------
#  library(dplyr)
#  df_21d_prior_no <- df %>%
#    filter(numdays_since_prior_no < 21)

## ----eval=FALSE---------------------------------------------------------------
#  df <- npn_download_individual_phenometrics(
#    request_source = 'Your Name Here',
#    years = c(2021),
#    species_ids = c(12),
#    additional_fields = c("multiple_firsty")
#  )

## ----eval=FALSE---------------------------------------------------------------
#  library(dplyr)
#  mfy_summary <- df %>%
#    count(phenophase_description, multiple_firsty) %>%
#    group_by(phenophase_description) %>%
#    mutate(Percent_MFY = n / sum(n))

## ----eval=FALSE---------------------------------------------------------------
#  library(dplyr)
#  mfy <- mfy_summary %>%
#    filter(mfy_summary$multiple_firsty == 1)
#  
#  library(ggplot2)
#  p <- ggplot(mfy,aes(multiple_firsty, Percent_MFY)) +
#    facet_wrap(~mfy$phenophase_description) +
#    geom_bar(stat = "identity")
#  plot(p + labs(title = "Frequency of Multiple First Yeses by Phenophase (Flowering Dogwood, 2021)")
#       + scale_y_continuous(labels = scales::percent_format(scale = 100)))

## ---- echo=FALSE, out.width = "75%", fig.pos="h"------------------------------
knitr::include_graphics("figures/MFY-byPhenophase.png", dpi = NULL,
  error = getOption("knitr.graphics.error", TRUE))

## ----eval=FALSE---------------------------------------------------------------
#  df_one_firsty <- df %>%
#    group_by(phenophase_description, individual_id) %>%
#    mutate(mean_firsty = mean(first_yes_doy)) %>%
#    distinct(phenophase_id, individual_id, .keep_all = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  df <- npn_download_individual_phenometrics(
#    request_source = 'Your Name Here',
#    years = c(2009:2020),
#    species_ids = c(102),
#    phenophase_ids = c(371)
#  )

## ----eval=FALSE---------------------------------------------------------------
#  plot(
#    df$first_yes_doy~df$first_yes_year,
#    ylab=c("Day of Year"), xlab=c("Year"), ylim=c(1,350),
#    cex=2,  cex.axis=1.5, cex.lab=1.5, pch=21
#  )

## ---- echo=FALSE, out.width = "75%", fig.pos="h"------------------------------
knitr::include_graphics("figures/RedOak1.png", dpi = NULL,
  error = getOption("knitr.graphics.error", TRUE))

## ----eval=FALSE---------------------------------------------------------------
#  df_8Y <- df %>%
#    group_by(df$individual_id) %>%
#    filter(n_distinct(first_yes_year) > 7)

## ----eval=FALSE---------------------------------------------------------------
#  quantiles <- as.data.frame(df_8Y %>%
#                          group_by(individual_id) %>%
#                          summarize(Q1 = quantile(first_yes_doy, .25),
#                                    Q3 = quantile(first_yes_doy, .75),
#                                    IQR <- IQR(first_yes_doy)))

## ----eval=FALSE---------------------------------------------------------------
#  df_8Y_Q = df_8Y %>%
#    right_join(quantiles, by = "individual_id")
#  
#  df_8Y_Q  <- df_8Y_Q  %>%
#    rename('IQR' = 'IQR <- IQR(first_yes_doy)')

## ----eval=FALSE---------------------------------------------------------------
#  df_8Y_clean <- subset(
#    df_8Y_Q, (df_8Y_Q$first_yes_doy > (Q1 - 1.5*df_8Y_Q$IQR) &
#                 df_8Y_Q$first_yes_doy < (Q3 + 1.5*df_8Y_Q$IQR))
#    )

## ----eval=FALSE---------------------------------------------------------------
#  plot(
#    df_8Y_clean$first_yes_doy~df_8Y_clean$first_yes_year,
#    ylab=c("Day of Year"), xlab=c("Year"), ylim=c(1,350),
#    cex=2,  cex.axis=1.5, cex.lab=1.5, pch=21
#  )

## ---- echo=FALSE, out.width = "75%", fig.pos="h"------------------------------
knitr::include_graphics("figures/RedOak3.png", dpi = NULL,
  error = getOption("knitr.graphics.error", TRUE))

