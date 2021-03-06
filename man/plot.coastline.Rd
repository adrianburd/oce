\name{plot.coastline}

\alias{plot.coastline}
\alias{plot,coastline,missing-method}
\alias{plot,coastline-method}

\title{Plot a coastline}

\description{Plot a coastline}

\usage{\S4method{plot}{coastline}(x,
     xlab="", ylab="", showHemi=TRUE,
     asp,
     clongitude, clatitude, span,
     lonlabel=NULL, latlabel=NULL, sides=NULL,
     projection=NULL, parameters=NULL, orientation=NULL,
     expand=1,
     mgp=getOption("oceMgp"), 
     mar=c(mgp[1]+1,mgp[1]+1,1,1),
     bg,
     fill='lightgray',
     axes=TRUE, cex.axis=par('cex.axis'),
     add=FALSE, inset=FALSE,
     geographical=0,
     debug=getOption("oceDebug"),
     \dots)}

\arguments{
  \item{x}{A \code{coastline} object, as read by
    \code{\link{read.coastline}} or created by
    \code{\link{as.coastline}}, or a list containing items named
    \code{longitude} and \code{latitude}.} 
  \item{xlab}{label for x axis}
  \item{ylab}{label for y axis}
  \item{showHemi}{logical indicating whether to show the hemisphere in axis
      tick labels.}
  \item{asp}{Aspect ratio for plot.  The default is for \code{plot.coastline}
      to set the aspect ratio to give natural latitude-longitude scaling
      somewhere near the centre latitude on the plot. Often, it makes sense to
      set \code{asp} yourself, e.g. to get correct shapes at 45N, use
      \code{asp=1/cos(45*pi/180)}.  Note that the land mass is not symmetric
      about the equator, so to get good world views you should set \code{asp=1}
      or set \code{ylim} to be symmetric about zero. Any given value of
      \code{asp} is ignored, if \code{clongitude} and \code{clatitude} are
      given.}
  \item{clongitude,clatitude}{optional center latitude of map, in decimal
      degrees.  If both \code{clongitude} and \code{clatitude} are provided,
      then any provided value of \code{asp} is ignored, and instead the plot
      aspect ratio is computed based on the center latitude.  If
      \code{clongitude} and \code{clatitude} are provided, then \code{span}
      must also be provided.}
  \item{span}{optional suggested span of plot, in kilometers.  The suggestion
      is an upper limit on the scale; depending on the aspect ratio of the
      plotting device, the radius may be smaller than \code{span}.  A value for
      \code{span} must be supplied, if \code{clongitude} and \code{clatitude}
      are supplied.}
  \item{lonlabel,latlabel,sides}{optional vectors of longitude and latitude to
      label on the indicated sides of plot, passed to
      \code{\link{plot.coastline}}.  Using these arguments permits reasonably
      simple customization.  If they are are not provided, reasonable defaults
      will be used.}

  \item{projection}{optional map projection to use (see \code{\link{mapPlot}}).
      If set to \code{FALSE} then no projection is used, and the data are
      plotted in a cartesion frame, with aspect ratio set to reduce distortion
      near the middle of the plot.  This option is useful if the coastline
      produces spurious horizontal lines owing to islands crossing the plot
      edges (a problem that plagues map projections).  If \code{projection} is
      not set, a Mercator projection is used for latitudes below about 70
      degrees, as if \code{projection="+proj=merc"} had been supplied, or a
      Stereopoloar one is used as if \code{projection="+proj=stere"}.
      Otherwise, \code{projection} must be a character string identifying a
      projection accepted by \code{\link{mapPlot}}.}

  \item{parameters}{optional parameters to map projection, if a
      \code{mapproj}-style \code{projection} is specified (see
      \code{\link{mapPlot}}.}

  \item{orientation}{optional orientation of map projection, if a
      \code{mapproj}-style \code{projection} is specified  (see
      \code{\link{mapPlot}}.}

  \item{expand}{numerical factor for the expansion of plot limits,
    showing area outside the plot, e.g. if showing a ship track as a
    coastline, and then an actual coastline to show the ocean boundary.
    The value of \code{expand} is ignored if either \code{xlim} or
    \code{ylim} is given.}
  \item{mgp}{3-element numerical vector to use for \code{par(mgp)}, and
    also for \code{par(mar)}, computed from this.  The default is
    tighter than the R default, in order to use more space for the
    data and less for the axes.}
  \item{mar}{value to be used with \code{\link{par}("mar")}.}
  \item{bg}{optional colour to be used for the background of the map.
    This comes in handy for drawing insets (see \dQuote{details}).}
  \item{fill}{colour to be used to fill land regions.  This is ignored
    unless the coastline object is fillable (e.g. for a "shapefile" read
    by \code{\link{read.coastline}}).  Set to \code{NULL} to turn off
    filling.} 
  \item{axes}{boolean, set to \code{TRUE} to plot axes.}
  \item{cex.axis}{value for axis font size factor.}
  \item{add}{boolean, set to \code{TRUE} to draw the coastline on an existing
      plot.  Note that this retains the aspect ratio of that existing plot, so
      it is important to set that correctly, e.g. with \code{asp=1/cos(lat * pi
          / 180)}, where \code{clat} is the central latitude of the plot.}
  \item{inset}{set to \code{TRUE} for use within \code{\link{plotInset}}.  The
      effect is to prevent the present function from adjusting margins, which
      is necessary because margin adjustment is the basis for the method
      used by \code{\link{plotInset}}.}
  \item{geographical}{flag indicating the style of axes.  If
      \code{geographical=0}, the axes are conventional, with decimal degrees as
      the unit, and negative signs indicating the southern and western
      hemispheres.  If \code{geographical=1}, the signs are dropped, with axis
      values being in decreasing order within the southern and western
      hemispheres.  If \code{geographical=2}, the signs are dropped and the
      axes are labelled with degrees, minutes and seconds, as appropriate.}
  \item{debug}{set to \code{TRUE} to get debugging information during
    processing.}
  \item{\dots}{optional arguments passed to plotting functions.  For
    example, set \code{yaxp=c(-90,90,4)} for a plot extending from pole
    to pole.}
}

\details{This function plots a coastline.  An attempt is made to fill
  the space of the plot, and this is done by limiting either the
  longitude range or the latitude range, as appropriate, by modifying
  the eastern or northern limit, as appropriate.

  To get an inset map inside another map, draw the first map, do
  \code{par(new=TRUE)}, and then call \code{plot.coastline} with a value
  of \code{mar} that moves the inset plot to a desired location on the
  existing plot, and with \code{bg="white"}.}

\value{None.}

\seealso{The documentation for \code{\link{coastline-class}} explains the
    structure of coastline objects, and also outlines the other functions
    dealing with them.}

\examples{
\dontrun{
library(oce)
data(coastlineWorld)
plot(coastlineWorld)
plot(coastlineWorld, clongitude=-63.6, clatitude=44.6, span=1000)

## Canada in Lambert projection
plot(coastlineWorld, clongitude=-90, clatitude=60, span=3000,
     fill=NULL, grid=10,
     projection='lambert', parameters=c(lat0=50,lat1=70),
     orientation=c(90,-90,0))
}
}

\author{Dan Kelley}

\keyword{hplot}
