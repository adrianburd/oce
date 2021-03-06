\name{decodeTime}

\alias{decodeTime}

\title{Decode a time, similar to as.POSIXct()}

\description{Decode a time, similar to as.POSIXct()}

\usage{decodeTime(time, timeFormats, tz="UTC")}

\arguments{
  \item{time}{a character string with an indication of the time}
  \item{timeFormats}{optional vector of time formats to use, as for \code{\link{as.POSIXct}}}
  \item{tz}{time zone}
}

\details{Each format in \code{timeFormats} is used in turn as the \code{format}
    argument to \code{\link{as.POSIXct}}, and the first that produces a
    non-\code{NA} result is used.  If \code{timeFormats} is missing, the
    following formats are tried, in the stated order: \itemize{
        \item \code{"\%b \%d \%Y \%H:\%M:\%S"} (e.g. \code{"Jul 1 2013 01:02:03"})   and \code{"\%b \%d \%Y"} (e.g. \code{"Jul 1 2013"})
        \item \code{"\%B \%d \%Y \%H:\%M:\%S"} (e.g. \code{"July 1 2013 01:02:03"})  and \code{"\%B \%d \%Y"} (e.g. \code{"July 1 2013"})
        \item \code{"\%d \%b \%Y \%H:\%M:\%S"} (e.g. \code{"1 Jul 2013 01:02:03"})   and \code{"\%d \%b \%Y"} (e.g. \code{"1 Jul 2013"})
        \item \code{"\%d \%B \%Y \%H:\%M:\%S"} (e.g. \code{"1 July 2013 01:02:03"})  and \code{"\%d \%B \%Y"} (e.g. \code{"1 July 2013"})
        \item \code{"\%Y-\%m-\%d \%H:\%M:\%S"} (e.g. \code{"2013-07-01 01:02:03"})   and \code{"\%Y-\%m-\%d"} (e.g. \code{"2013-07-01"})
        \item \code{"\%Y-\%b-\%d \%H:\%M:\%S"} (e.g. \code{"2013-July-01 01:02:03"}) and \code{"\%Y-\%b-\%d"} (e.g. \code{"2013-Jul-01"})
        \item \code{"\%Y-\%B-\%d \%H:\%M:\%S"} (e.g. \code{"2013-July-01 01:02:03"}) and \code{"\%Y-\%B-\%d"} (e.g. \code{"2013-July-01"})
        \item \code{"\%d-\%b-\%Y \%H:\%M:\%S"} (e.g. \code{"01-Jul-2013 01:02:03"})  and \code{"\%d-\%b-\%Y"} (e.g. \code{"01-Jul-2013"})
        \item \code{"\%d-\%B-\%Y \%H:\%M:\%S"} (e.g. \code{"01-July-2013 01:02:03"}) and \code{"\%d-\%B-\%Y"} (e.g. \code{"01-July-2013"})
        \item \code{"\%Y/\%b/\%d \%H:\%M:\%S"} (e.g. \code{"2013/Jul/01 01:02:03"})  and \code{"\%Y/\%b/\%d"} (e.g. \code{"2013/Jul/01"})
        \item \code{"\%Y/\%B/\%d \%H:\%M:\%S"} (e.g. \code{"2013/July/01 01:02:03"}) and \code{"\%Y/\%B/\%d"} (e.g. \code{"2013/July/01"})
        \item \code{"\%Y/\%m/\%d \%H:\%M:\%S"} (e.g. \code{"2013/07/01 01:02:03"})   and \code{"\%Y/\%m/\%d"} (e.g. \code{"2013/07/01"})
    }
}

\value{A time as returned by \code{\link{as.POSIXct}}.}

\examples{
decodeTime("July 1 2013 01:02:03")
decodeTime("Jul 1 2013 01:02:03")
decodeTime("1 July 2013 01:02:03")
decodeTime("1 Jul 2013 01:02:03")
decodeTime("2013-07-01 01:02:03")
decodeTime("2013/07/01 01:02:03")
decodeTime("2013/07/01")
}

\author{Dan Kelley}

\keyword{misc}
