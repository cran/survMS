## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(survMS)

## ----sim_cox_model------------------------------------------------------------
res_paramW = get_param_weib(med = 1062, mu = 1134)#compute_param_weibull(a_list = a_list, med = 2280, moy = 2325, var = 1619996)
listCoxSim_n500_p1000 <- modelSim(model = "cox", matDistr = "unif", matParam = c(-1,1), n = 500, p = 1000, pnonull = 20, betaDistr = 1,
                                  hazDistr = "weibull", hazParams = c(res_paramW$a, res_paramW$lambda), seed = 1, d = 0)
hist(listCoxSim_n500_p1000)

## ----sim_aft_model------------------------------------------------------------
listAFTSim_n500_p1000 <- modelSim(model = "AFT", matDistr = "unif", matParam = c(-1,1), n = 500, p = 100, pnonull = 100, 
                                  betaDistr = 1, hazDistr = "log-normal", hazParams = c(0.25, 0), Phi = 0, seed = 1, d = 0)
hist(listAFTSim_n500_p1000)

## ----sim_aft_mod_model--------------------------------------------------------
# res_paramLN = get_param_ln(var = 600000, mu = 1134)#compute_param_weibull(a_list = a_list, med = 2280, moy = 2325, var = 1619996)
listAFTsSim_n500_p1000 <- modelSim(model = "AFTshift", matDistr = "unif", matParam = c(-1,1), n = 500, 
                                   p = 100, pnonull = 100, betaDistr = "unif", hazDistr = "log-normal", 
                                   hazParams = c(0.2, 7.8), seed = 1, d = 0)
hist(listAFTsSim_n500_p1000)

## ----sim_ah_model-------------------------------------------------------------
res_paramLN = get_param_ln(var = 600000, mu = 1134)#compute_param_weibull(a_list = a_list, med = 2280, moy = 2325, var = 1619996)
listAHSim_n500_p1000 <- modelSim(model = "AH", matDistr = "unif", matParam = c(-1,1), n = 500, p = 100, 
                                 pnonull = 100, betaDistr = 1, hazDistr = "log-normal", 
                                 hazParams = c(1, 0), seed = 1, d = 0)
hist(listAHSim_n500_p1000)

