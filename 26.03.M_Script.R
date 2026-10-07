
############################# BIENVENUE #############################

############# I SOLEMNLY SWEAR THAT I AM UP TO NO GOOD ##############

#################################
## Loading packages

library(lavaan)

#################################

n <- 1501 ## sample size

rm <- matrix(c( ## correlations reported by Long et al. (2026)
  
  1.000, 0.387, 0.393, 0.427,
  0.387, 1.000, 0.383, 0.396,
  0.393, 0.383, 1.000, 0.404,
  0.427, 0.396, 0.404, 1.000), nrow=4)

colnames(rm) <- rownames(rm) <- c("AIA","AB","PS","RU") ## names of variables

#################################
## Alternative model

altmod <- "

## Loadings

CSE =~ -1*AIA+start(-0.5)*PS+start(-0.5)*RU+start(-0.5)*AB

## (Error) variances

AIA ~~ AIA
PS ~~ PS
RU ~~ RU
AB ~~ AB

CSE ~~ CSE

"

fit.alt <- lavaan(altmod, sample.cov=rm, ## fitting model to data 
            sample.nobs=n, meanstructure=F)

summary(fit.alt, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results


########################## MISCHIEF MANAGED #########################

############################# AU REVOIR #############################

