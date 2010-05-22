\name{oce.debug}

\alias{oce.debug}

\title{Print a debugging message}

\description{Print a debugging message}

\usage{oce.debug(debug=0, \dots)}

\arguments{
  \item{debug}{an integer, less than or equal to zero for no message,
    and greater than zero for increasing levels of debugging.  Values
    greater than 4 are treated like 4.}
  \item{\dots}{items to be supplied to \code{\link{cat}}, which does the
    printing.  Almost always, this should include a trailing newline.}
}

\examples{
foo <- function(debug)
{
   oce.debug(debug, "in function foo\n")
}
debug <- 1
oce.debug(debug, "in main")
foo(debug=debug-1)
}

\details{Indentation is used, with 8 spaces for \code{debug}=4 or
  higher, 6 for \code{debug}=3, 4 for \code{debug}=2, and 2 for
  \code{debug}=1.  Normally, functions decrease the \code{debug} level
  by 1 when they call other functions, so the effect is a nesting, with
  more space for deeper function level.}

\author{Dan Kelley}

\keyword{misc}