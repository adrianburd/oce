\name{subset.oce}

\alias{subset.oce}

\title{Subset an oce object}

\description{Subset an oce object}

\usage{\method{subset}{oce}(x, subset, indices=NULL, \dots)}

\arguments{
  \item{x}{an \code{oce} object.}
  \item{subset}{a condition to be applied to the \code{data} portion of
    \code{x} (ignored for \code{station} objects).}
  \item{indices}{list of station indices (used only for \code{section} objects).}
  \item{\dots}{ignored.}
}

\details{This is analogous to \code{\link{subset.data.frame}}.  Note
  that it only works for objects in which the \code{data} portion is a
  data frame, e.g. \code{ctd} objects.

  For objects of class \code{adp}, the \code{subset} may be in terms
  of \code{time} or \code{distance}; to combine these, use two steps
  (see \dQuote{Examples}).
}

\value{A new \code{oce} object.}

\seealso{\code{\link{subset.data.frame}}, upon which this is based.}

\examples{
library(oce)
# CTD data
data(ctd)
plot(ctd)
plot(subset(ctd, pressure>10))

# ADP example, subsetted by time and distance
data(adp)
adp.near <- subset(adp, distance < 10)
# Note that the data may be accessed directly, as below
adp.near.early <- subset(adp.near, time < mean(adp.near$data$ts$time))
plot(adp.near.early)
}

\author{Dan Kelley}

\keyword{misc}