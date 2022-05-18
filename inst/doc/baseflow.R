## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, warning=F, message=F----------------------------------------------
library(grwat)
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)

## -----------------------------------------------------------------------------
Qbase = gr_baseflow(spas$Q, method = 'lynehollick', a = 0.925, passes = 3)
head(Qbase)

## -----------------------------------------------------------------------------
# Calculate baseflow using Jakeman approach
hdata = spas %>% 
  mutate(Qbase = gr_baseflow(Q, method = 'jakeman'))

# Visualize for 2020 year
ggplot(hdata) +
  geom_area(aes(Date, Q), fill = 'steelblue', color = 'black') +
  geom_area(aes(Date, Qbase), fill = 'orangered', color = 'black') +
  scale_x_date(limits = c(ymd(19800101), ymd(19801231)))

## -----------------------------------------------------------------------------
hdata = spas %>%
  mutate(lynehollick = gr_baseflow(Q, method = 'lynehollick', a = 0.9),
         boughton = gr_baseflow(Q, method = 'boughton', k = 0.9),
         jakeman = gr_baseflow(Q, method = 'jakeman', k = 0.9),
         maxwell = gr_baseflow(Q, method = 'maxwell', k = 0.9)) %>% 
  pivot_longer(lynehollick:maxwell, names_to = 'Method', values_to = 'Qbase')

ggplot(hdata) +
  geom_area(aes(Date, Q), fill = 'steelblue', color = 'black') +
  geom_area(aes(Date, Qbase), fill = 'orangered', color = 'black') +
  scale_x_date(limits = c(ymd(19810101), ymd(19811231))) +
  facet_wrap(~Method)

## -----------------------------------------------------------------------------
p = gr_get_params('center')
p$filter = 'kudelin'

hdata = spas %>% 
  mutate(lynehollick = gr_baseflow(Q, method = 'lynehollick', 
                                   a = 0.925, passes = 3),
         kudelin = gr_separate(spas, p)$Qbase) %>% 
  pivot_longer(lynehollick:kudelin, names_to = 'Method', values_to = 'Qbase')

# Visualize for 1980 year
ggplot(hdata) +
  geom_area(aes(Date, Q), fill = 'steelblue', color = 'black') +
  geom_area(aes(Date, Qbase), fill = 'orangered', color = 'black') +
  scale_x_date(limits = c(ymd(19800101), ymd(19801231))) +
  facet_wrap(~Method)

