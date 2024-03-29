% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read.R
\name{gr_read_rean}
\alias{gr_read_rean}
\title{Read reanalysis data}
\usage{
gr_read_rean(file_prec, file_temp)
}
\arguments{
\item{file_prec}{Character string path to precipitation NetCDF file.}

\item{file_temp}{Character string path to temperature NetCDF file.}
}
\value{
\code{list} containing time series, precipitation series, temperature series
and spatial points (sf)
}
\description{
The function reads meteorological variables (temperature and precipitation) from \href{https://www.dropbox.com/sh/5xjnf620tlwfk7a/AABhTaPEDWLII8rV04dp0MWna?dl=0}{grwat reanalysis} for using with \code{\link[=gr_join_rean]{gr_join_rean()}}. Reanalysis covers the East European Plain with 0.75 degrees spatial resolution and is obtained based on CIRES-DOE (1880-1949) and ERA5 (1950-2021) data.
}
\details{
Download the reanalysis archive from \href{https://www.dropbox.com/sh/5xjnf620tlwfk7a/AABhTaPEDWLII8rV04dp0MWna?dl=0}{here}.
}
\examples{
if (require("sf") && require("ncdf4")) {
  
  library(grwat)
  
  # read reanalysis data
  \dontrun{
    rean = gr_read_rean(
      '/Volumes/Data/Spatial/Reanalysis/grwat/pre_1880-2021.nc',
      '/Volumes/Data/Spatial/Reanalysis/grwat/temp_1880-2021.nc'
    ) 
    
    str(rean)
  }
  
}
}
