\name{plot.coastline}

\alias{plot.coastline}

\title{Plot a coastline}

\description{Plot a coastline.}

\usage{\method{plot}{coastline}(x,
     asp,
     mgp=getOption("oce.mgp"), 
     mar=c(mgp[1], mgp[1], 2*par("cex"), 2*par("cex")),
     bg,
     axes=TRUE,
     debug=getOption("oce.debug"),
     \dots)}

\arguments{
  \item{x}{A \code{coastline} object, e.g. as read by
    \code{\link{read.coastline}} or created by
    \code{\link{as.coastline}}.}
  \item{asp}{Aspect ratio for plot.  The default is for
    \code{plot.coastline} to set the aspect ratio to give natural
    latitude-longitude scaling somewhere near the centre latitude on the
    plot. Often, it makes sense to set \code{asp} yourself, e.g. to get
    correct shapes at 45N, use \code{asp=1/cos(45*pi/180)}. 
    Note that the land mass is not symmetric about the equator, so
    to get good world views you should set \code{asp=1} or 
    set \code{ylim} to be symmetric about zero.}
  \item{mgp}{3-element numerical vector to use for \code{par(mgp)}, and
    also for \code{par(mar)}, computed from this.  The default is
    tighter than the R default, in order to use more space for the
    data and less for the axes.}
  \item{mar}{value to be used with \code{\link{par}("mar")}.}
  \item{bg}{optional colour to be used for the background of the map.
    This comes in handy for drawing insets (see \dQuote{details}).}
  \item{axes}{boolean, set to \code{TRUE} to plot axes.}
  \item{debug}{set to \code{TRUE} to get debugging information during processing.}
  \item{\dots}{optional arguments passed to plotting functions.  For
    example, set \code{yaxp=c(-90,90,4)} for a plot extending from pole to
    pole.}
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

\seealso{\code{\link{read.coastline}} can read coastlines from data
  files, provided that they are in a certain class of formats.  A
  coastline may be summarized by \code{\link{summary.coastline}}.}

\examples{
library(oce)
data(coastline.world)
plot(coastline.world)
}

\author{Dan Kelley}

\keyword{misc}