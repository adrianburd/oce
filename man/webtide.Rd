% vim:spell:textwidth=100:expandtab:shiftwidth=2:softtabstop=2
\name{webtide}

\alias{webtide}

\title{Get a tidal prediction from a WebTide database}

\description{Get a tidal prediction from a WebTide database}

\usage{webtide(action=c("map", "predict"),
        longitude, latitude, node, time,
        basedir=getOption("webtide"),
        region="nwatl", plot=TRUE,
        tformat, \dots)}

\arguments{

  \item{action}{An indication of the action, either \code{action="map"} to draw a map or
    \code{actoin="predict"} to get a prediction; see \sQuote{Details}.}
  
  \item{longitude}{longitude at which prediction is required (ignored if \code{node} is given).}

  \item{latitude}{latitude at which prediction is required (ignored if \code{node} is given).}
  
  \item{node}{node to look up; only needed if \code{longitude} and \code{latitude} are not given.}

  \item{time}{times at which prediction is to be made.  If not supplied, this will be the week
    starting at the present time, incrementing by 15 minutes.}

  \item{basedir}{directory containing the \code{WebTide} application.}

  \item{region}{database region, given as a directory name in the WebTide directory.  For example,
    \code{h3o} is for Halifax Harbour, \code{nwatl} is for the northwest Atlantic, and \code{sshelf}
    is for the Scotian Shelf and Gulf of Maine.}

  \item{plot}{boolean indicating whether to plot.}
  \item{tformat}{optional argument passed to \code{\link{oce.plot.ts}}, for
      plot types that call that function.  (See \code{\link{strptime}} for the
      format used.)}
  \item{\dots}{optional arguments passed to plotting functions. A common
    example is to set \code{xlim} and \code{ylim}, to focus a map region.}
}

\details{If \code{action="map"} then a map is drawn, with a dot for the lower-left corner of each
  triangle used in the finite-element tidal simulation upon which WebTide predictions are based.  If
  \code{node} is missing, then \code{\link{locator}} is called, so that the user can indicate a spot
  of interest on the map, and this point is indicated on the map (and in the return value).  If
  \code{node} is provided, however, the point is indicated but \code{\link{locator}} is not called.
  (This second style is of use in documenting interactive work after the fact.)
  
  If \code{action="predict"} then either a node number or the longitude and latitude
  must be specified.  If \code{plot=TRUE} (the default) then a plot is drawn, but no plot is
  produced otherwise.  In either case, the (silent) return value is a list as described in the next
  section.  The times used for prediction are specified with the \code{time} argument, and if this
  is not specified then a week following the present time is used.

  Naturally, \code{webtide} will not work unless WebTide has been installed on the computer.}

\value{If \code{action="map"} and \code{plot=TRUE}, the return value is a list containing the index
  of the nearest node, along with the \code{latitude} and \code{longitude} of that node.  If
  \code{action="map"} and \code{plot=FALSE},  the return value is a list of all nodes, longitude,
  and latitudes.  
  
  If \code{action="predict"}, the return value is a list containing a vector of times (\code{time}),
  as well as vectors of the predicted \code{elevation} in metres and the predicted horizontal
  components of velocity, \code{u} and \code{v}, along with the \code{node} number, and the
  \code{basedir} and \code{region} as supplied to this function.}
  
\examples{
\dontrun{
library(oce)
prediction <- webtide("predict", lon=-69.61, lat=48.14)
}
}

\references{The WebTide software may be downloaded for free at
  \url{http://www.bio.gc.ca/science/research-recherche/ocean/webtide/index-eng.php}, along with a
  suite of databases for various geographical regions.  Note that WebTide is not an open-source
  application, as it consists mainly of compiled Java code, which precludes examination of the
  source.}

\author{Dan Kelley}

\keyword{misc}

\concept{tide}

