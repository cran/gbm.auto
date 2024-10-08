% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gbm.basemap.R
\name{gbm.basemap}
\alias{gbm.basemap}
\title{Creates Basemaps for Gbm.auto mapping from your data range}
\usage{
gbm.basemap(
  bounds = NULL,
  grids = NULL,
  gridslat = NULL,
  gridslon = NULL,
  getzip = TRUE,
  zipvers = "2.3.7",
  savedir = tempdir(),
  savename = "Crop_Map",
  res = "CALC",
  extrabounds = FALSE
)
}
\arguments{
\item{bounds}{Region to crop to: c(xmin,xmax,ymin,ymax).}

\item{grids}{If bounds unspecified, name your grids database here.}

\item{gridslat}{If bounds unspecified, specify which column in grids is
latitude.}

\item{gridslon}{If bounds unspecified, specify which column in grids is
longitude.}

\item{getzip}{Download & unpack GSHHS data to WD? "TRUE" else
absolute/relative reference to GSHHS_shp folder, including that folder.}

\item{zipvers}{GSHHS version, in case it updates. Please email developer (SD)
if this is incorrect.}

\item{savedir}{Save outputs to a temporary directory (default) else change to
current directory e.g. "/home/me/folder". Do not use getwd() here.}

\item{savename}{Shapefile save-name, no shp extension, default is "Crop_Map"}

\item{res}{Resolution, 1:5 (low:high) OR c,l,i,h,f (coarse, low,
intermediate, high, full) or "CALC" to calculate based on bounds. Choose one.}

\item{extrabounds}{Grow bounds 16pct each direction to expand rectangular
datasets basemaps over the entire square area created by basemap in mapplots.}
}
\value{
basemap coastline file for gbm.map in gbm.auto. "cropshp"
SpatialPolygonsDataFrame in in local environment & user-named files in
"CroppedMap" folder. Load later with maptools function:
MyMap <- sf::st_read(dsn = "./CroppedMap/Crop_Map.shp", layer = "Crop_Map, quiet = TRUE)
}
\description{
Downloads unzips crops & saves NOAAs global coastline shapefiles to user-set
box. Use for 'shape' in gbm.map. If downloading in RStudio uncheck
"Use secure download method for HTTP" in Tools > Global Options > Packages.
Simon Dedman, 2015/6 simondedman@gmail.com GitHub.com/SimonDedman/gbm.auto
}
\details{
errors and their origins:
\enumerate{
\item Error in setwd(getzip) : cannot change working directory
If you've specified the location of the local GSHHS_shp folder, ensure you're
in the correct directory relative to it. This error means it looked for the
folder and couldn't find it.
\item subscript out of bounds: can't crop world map to your bounds.
Check lat/lon are the right way around: check gridslat and gridslon point to the correct columns
for lat and lon in grids, and those columns named (something like) lat and lon, ARE ACTUALLY the
latitudes and longitudes, and not the wrong way around.
\item If your download is timing out use options(timeout = 240).
\item Error in if (scope >= 160) res <- "c" : missing value where TRUE/FALSE needed. Check gridslat
and gridslon are indexing the correct columns in grids.
}
}
\examples{
\donttest{
# Not run: downloads and saves external data.
data(samples)
mybounds <- c(range(samples[,3]),range(samples[,2]))
gbm.basemap(bounds = mybounds, getzip = "./GSHHS_shp/",
savename = "My_Crop_Map", res = "f")
# In this example GSHHS folder already downloaded to the working directory
# hence I pointed getzip at that rather than having it download the zip again
}

}
\author{
Simon Dedman, \email{simondedman@gmail.com}
}
