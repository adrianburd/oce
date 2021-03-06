\name{plot.section}

\alias{plot.section}
\alias{plot,section,missing-method}
\alias{plot,section-method}

\title{Plot a CTD section}

\description{Plot a CTD section.}

\usage{\S4method{plot}{section}(x,
     which=c(1, 2, 3, 99),
     eos=getOption("oceEOS", default="gsw"),
     at=NULL,
     labels=TRUE,
     grid=FALSE,
     contourLevels=NULL,
     contourLabels=NULL,
     stationIndices,
     coastline=c("best", "coastlineWorld", "coastlineWorldMedium",
                 "coastlineWorldFine", "none"),
     xlim=NULL,
     ylim=NULL,
     map.xlim=NULL,
     map.ylim=NULL,
     clongitude, clatitude, span,
     projection=NULL, parameters=NULL, orientation=NULL,
     xtype=c("distance", "track", "longitude", "latitude"),
     ytype=c("depth", "pressure"),
     ztype=c("contour", "image", "points"),
     zbreaks=NULL, zcol=NULL,
     legend.loc="bottomright",
     adorn=NULL,
     showStations=FALSE,
     showStart=TRUE,
     showBottom=TRUE,
     mgp=getOption("oceMgp"),
     mar=c(mgp[1]+1, mgp[1]+1, mgp[2]+1, mgp[2] + 0.5),
     col=par("col"), cex=par("cex"), pch=par("pch"),
     debug=getOption("oceDebug"),
     \dots)
}

\arguments{
    \item{x}{a \code{section} object, e.g. as created by
        \code{\link{makeSection}}.}

    \item{which}{a list of desired plot types, as explained in
        \dQuote{Details}.  There may be up to four panels in total, and the
        desired plots are placed in these panels, in reading order.  If only
        one panel is plotted, \code{par} is not adjusted, which makes it easy
        to add to the plot with subsequent plotting commands.}
    \item{eos}{equation of state to be used, either \code{"unesco"} or
        \code{"gsw"}.}
    \item{at}{if \code{NULL} (the default), the x axis will indicate the
        distance of the stations from the first in the section.  (This may
        give errors in the contouring routine, if the stations are not present
        in a geographical order.)  If a list, then it indicates the values at
        which stations will be plotted.} 
    \item{labels}{either a logical, indicating whether to put labels on
        the x axis, or a vector that is a list of labels to be placed at the x
        positions indicated by \code{at}.} 
    \item{grid}{if \code{TRUE}, points are drawn at data locations.}
    \item{contourLevels}{optional contour levels}
    \item{contourLabels}{optional contour labels}
    \item{stationIndices}{optional list of the indices of stations to
        use.  Note that an index is \emph{not} a station number, e.g. to
        show the first 4 stations, use \code{station.indices=1:4}.}
    \item{coastline}{string giving the coastline to be used in a
        station map, or \code{"best"} to pick the one with highest
        resolution, or \code{"none"} to avoid drawing the coastline.}
    \item{xlim}{optional limit for x axis (only in sections, not map)}
    \item{ylim}{optional limit for y axis (only in sections, not map)}
    \item{map.xlim, map.ylim}{optional limits for station map;
        \code{map.ylim} is ignored if \code{map.xlim} is provided.}
    \item{clongitude, clatitude, span}{optional map centre position and span (km)}
    \item{projection, parameters, orientation}{parameters specifying map
        projection; see \code{\link{mapPlot}}.  If
        \code{projection="automatic"}, however, a projection is devised from
        the data, with \code{stereographic} if the mean latitude exceeds 70N
        and \code{mollweide} otherwise.}
    \item{xtype}{type of x axis, for contour plots, either
        \code{"distance"} for distance (in km) to the first point in the
        section, \code{"track"} for distance along the cruise track,
        or \code{"longitude"} or \code{"latitude"}.
        Note that if the x values are not in order, they will be put in
        order (which may make no sense) and a warning will be printed.}
    \item{ytype}{type of y axis for contour plots, either
        \code{"pressure"} for pressure (in dbar, with zero at the surface)
        or \code{"depth"} for depth (in m below the surface, calculated
        from pressure with \code{\link{swDepth}}).}

    \item{ztype}{string indicating whether to use contours, an image, or
        points.  In the first two cases, the data must be gridded, with
        identical pressures at each station.}
    
    \item{zbreaks, zcol}{breaks and colours to be used if \code{ztype="points"}
        or \code{"image"}.  If not provided, a reasonable default is chosen.
        If \code{zcol} is a function, it will be invoked with an argument equal
        to \code{1+length(zbreaks)}.  If \code{zbreaks} is not given, it
        defaults to a vector of length 200, with values spanning the data
        range.}

    \item{legend.loc}{location of legend, as supplied to \code{\link{legend}}.}

    \item{adorn}{list of expressions to be executed for the panels in
        turn, e.g. to adorn the plots.  If the number matches the number of
        panels, then the strings are applied to the appropriate panels, as
        they are drawn from top-left to bottom-right.   If only a single
        expression is provided, it is used for all panels.  (See
        \dQuote{Examples}.)}
    \item{showStations}{logical indicating whether to draw station numbers
        on maps.}
    \item{showStart}{logical indicating whether to indicate the first station
        with a different symbol than the others.}
    \item{showBottom}{logical indicating whether to draw the bottom, or a
        character string indicating the method for plotting the bottom.  The
        allowed methods are: \code{polygon}, which fills the space to the bottom,
        or \code{lines}, which draws lines from stations to the bottom, or
        \code{points}, which draws points at the bottom.}
    \item{mgp}{3-element numerical vector to use for \code{par(mgp)}, and
        also for \code{par(mar)}, computed from this.  The default is
        tighter than the R default, in order to use more space for the data
        and less for the axes.}
    \item{mar}{value to be used with \code{\link{par}("mar")}.}
    \item{col}{colour, as in \code{\link{par}("col")}.}
    \item{cex}{value to be used with \code{\link{par}("cex")}, for any use of
        \code{\link{points}}, e.g. for \code{which="data"}.}
    \item{pch}{value to be used with \code{\link{par}("pch")} (see \code{cex},
        above.)}
    \item{debug}{a flag that turns on debugging.  Set to 1 to get a
        moderate amount of debugging information, or to 2 to get more.}
    \item{\dots}{optional arguments passed to the contouring function,
        e.g. using \code{labcex=1} will increase the size of contour labels.}
}

\details{Creates a summary plot for a CTD section, with one panel for each
    value of \code{which}.  The codes are as follows.
    \itemize{  
        \item \code{which=1} or \code{"temperature"} for temperature contours (the default)
        \item \code{which=2} or \code{"salinity"} for salinity contours
        \item \code{which=3} or \code{"sigmaTheta"} for sigma-theta contours
        \item \code{which=4} or \code{"nitrate"} for nitrate concentration contours
        \item \code{which=5} or \code{"nitrite"} for nitrite concentration contours
        \item \code{which=6} or \code{"oxygen"} for oxygen concentration  contours
        \item \code{which=7} or \code{"phosphate"} for phosphate concentration contours
        \item \code{which=8} or \code{"silicate"} for silicate concentration contours
        \item \code{which=20} or \code{"data"} for a dot for each data location
        \item \code{which=99} or \code{"map"} for a location map
    }
    The y-axis for the contours is pressure, plotted in the conventional
    reversed form, so that the water surface appears at the top of the plot.
    The x-axis is more complicated. If \code{at} is not supplied, then the
    routine calculates x as the distance between the first station in the
    section and each of the other stations. (This will produce an error if the
    stations are not ordered geographically, because the \code{\link{contour}}
    routine cannot handle non-increasing axis coordinates.) If \code{at} is
    specified, then it is taken to be the location, in arbitrary units, along
    the x-axis of labels specified by \code{labels}; the way this works is
    designed to be the same as for \code{\link{axis}}.
}

\value{None.}

\seealso{The documentation for \code{\link{section-class}} explains the
    structure of section objects, and also outlines the other functions dealing
    with them.
}

\examples{
library(oce)
data(section)
sg <- sectionGrid(section)

## AO3 section
plot(sg, which="salinity", ztype="points", pch=20, cex=1.5) 

## Gulf Stream
GS <- subset(section, 109<=stationId&stationId<=129)
GSg <- sectionGrid(GS, p=seq(0,2000,100))
plot(GSg, which=c(1,99), map.ylim=c(34,42))

par(mfrow=c(2,1))
plot(GS, which=1, ylim=c(2000, 0), ztype='points',
zbreaks=seq(0,30,2), pch=20, cex=3)
plot(GSg, which=1, ztype='image', zbreaks=seq(0,30,2))

## image, with coloured dots to show if grid smoothing was OK
plot(GSg, which=1, ztype='image')
T <- GS[['temperature']]
col <- oce.colorsJet(100)[rescale(T, rlow=1, rhigh=100)]
points(GS[['distance']],GS[['depth']],pch=20,cex=3,col='white')
points(GS[['distance']],GS[['depth']],pch=20,cex=2.5,col=col)
}

\author{Dan Kelley}

\keyword{hplot}
