## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, warning=F, message=F----------------------------------------------
library(grwat)
data(spas) # example Spas-Zagorye data is included with grwat package
head(spas) # separate
sep = gr_separate(spas, params = gr_get_params(reg = 'center'))

## -----------------------------------------------------------------------------
# summarize
vars = gr_summarize(sep)

head(vars)

## -----------------------------------------------------------------------------
gr_help_vars()

## -----------------------------------------------------------------------------
# test all variables
tests = gr_test_vars(vars)

# view Pettitt test for Qygr
tests$ptt$Qygr

# view Fisher test for Q30s
tests$ft$Q30s

# test only Qygr and Q30s using 1978 as fixed year and excluding 1988-1991 yrs
gr_test_vars(vars, Qygr, year = 1979, exclude = 1988:1991)

## -----------------------------------------------------------------------------
gr_kable_tests(tests)

## -----------------------------------------------------------------------------
# plot one selected variable
gr_plot_vars(vars, Qygr) 

# plot one selected variable
gr_plot_vars(vars, Dspstart) 

# plot two variables sequentially
gr_plot_vars(vars, D10w1, Wsprngr)

# plot four variables in matrix layout
gr_plot_vars(vars, Qspmax, Qygr, D10w1, Wsprngr,
             layout = matrix(1:4, nrow = 2, byrow = TRUE)) 

## -----------------------------------------------------------------------------
# add tests calculated on the fly (only plotted variables are tested)
gr_plot_vars(vars, Qspmax, Qygr, D10w1, Wsprngr,
             layout = matrix(1:4, nrow = 2, byrow = TRUE),
             tests = TRUE) 

# calculate tests beforehand
tests = gr_test_vars(vars)
gr_plot_vars(vars, D10w1, Wsprngr, Nthw, Qrnmax,
             layout = matrix(1:4, nrow = 2, byrow = TRUE),
             tests = tests) 

## -----------------------------------------------------------------------------
# plot periods with fixed change year
gr_plot_periods(vars, Qygr, year = 1979)

# plot periods with change year from Pettitt test
gr_plot_periods(vars, Qygr, tests = TRUE)

# calculate test beforehand
gr_plot_periods(vars, Qspmax, tests = tests)

# use matrix layout to plot multiple variables
gr_plot_periods(vars, Qygr, Qspmax, D10w1, Wsprngr,
                layout = matrix(1:4, nrow = 2),
                tests = tests)

## -----------------------------------------------------------------------------
# plot minimum runoff month for two periods divided by Pettitt test
gr_plot_minmonth(vars, tests = gr_test_vars(vars))

# plot minimum runoff month for two periods divided by fixed year
gr_plot_minmonth(vars, year = 1979)

## -----------------------------------------------------------------------------
# plot change year from Pettitt test
gr_plot_tests(tests, type = 'year')

