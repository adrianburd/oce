\name{plotTS}

\alias{plotTS}

\title{Plot temperature-salinity diagram for seawater (CTD) data}

\description{Plot temperature-salinity diagram for seawater (CTD) data.}

\usage{plotTS(x,
     rhoLevels = 6,
     grid = TRUE,
     col.grid = "lightgray",
     lty.grid = "dotted",
     rho1000 = FALSE,
     col = par("col"),
     col.rho = "darkgray",
     cex.rho = 0.9*par("cex"),
     cex = par("cex"), pch = 1,
     rotateRhoLabels = FALSE,
     connectPoints = FALSE,
     useSmoothScatter = FALSE,
     xlab,
     ylab,
     Slim,
     Tlim,
     mgp=getOption("oceMgp"),
     mar=c(mgp[1]+1,mgp[1]+1,mgp[1],mgp[1]),
     lwd.rho=par("lwd"), lty.rho=par("lty"),
     \dots)
}

\arguments{
  \item{x}{A \code{cdt} object, e.g. as read by \code{\link{read.ctd}}.}
  \item{rhoLevels}{Either a list of density levels for which to draw isopycnal
      lines, or a suggestion for the number of levels.  In the latter case,
      \code{pretty()} is used to select levels.}
  \item{grid}{a flag that can be set to \code{TRUE} to get a grid.}
  \item{col.grid}{colour for grid.}
  \item{lty.grid}{line type for grid.}
  \item{rho1000}{if TRUE, label isopycnals as e.g. 1024; if FALSE, label as e.g. 24}
  \item{col}{colour for symbols.}
  \item{col.rho}{colour for isopycnal lines.}
  \item{cex.rho}{size of isopycnal labels.}
  \item{cex}{size to be used for plot symbols (see \code{\link{par}})}
  \item{pch}{code for plotting symbol (see \code{\link{par}}).}
  \item{rotateRhoLabels}{if TRUE, labels in right-hand margin are written vertically}
  \item{connectPoints}{if TRUE, the points are connected with line segments, in sequence}
  \item{useSmoothScatter}{if TRUE, use \code{\link{smoothScatter}} to plot the points.}
  \item{xlab}{optional label for the x axis, with default "Salinity [PSU]".}
  \item{ylab}{optional label for the y axis, with default "Temperature [C]".}
  \item{Slim}{optional limits for salinity axis, otherwise inferred from data.}
  \item{Tlim}{optional limits for temperature axis, otherwise inferred from data.}
  \item{mgp}{3-element numerical vector to use for \code{par(mgp)}, and
    also for \code{par(mar)}, computed from this.  The default is
    tighter than the R default, in order to use more space for the data
    and less for the axes.}
  \item{mar}{value to be used with \code{\link{par}("mar")}.}
  \item{lwd.rho}{line width for density lines},
  \item{lty.rho}{line type for density lines},
  \item{\dots}{optional arguments passed to plotting functions.}
}

\details{Creates a temperature-salinity plot for a CTD cast, with labeled isopycnals.}

\value{None.}

\seealso{
  \code{\link{summary.ctd}} summarizes the information, while
  \code{\link{read.ctd}} scans it from a file.
}

\examples{
library(oce)
# Plot TS diagram for a mid-Atlantic station at 36N
# See demo(TS) for a section-spanning TS diagram
data(a03)
profile <- a03$data$station[[60]] # 124 stations in total
plotTS(profile)
title("Mid-Atlantic at 36N")
}

\author{Dan Kelley}

\keyword{hplot}