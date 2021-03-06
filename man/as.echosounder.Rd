\name{as.echosounder}
\alias{as.echosounder}
\title{Coerce data into echosounder dataset}
\description{Coerces a dataset into a echosounder dataset.}

\usage{as.echosounder(time, depth, a, src="",
               sourceLevel=220,
               receiverSensitivity=-55.4,
               transmitPower=0,
               pulseDuration=400,
               beamwidthX=6.5, beamwidthY=6.5,
               frequency=41800,
               correction=0)}
\arguments{
  \item{time}{times of pings}
  \item{depth}{depths of samples within pings}
  \item{a}{matrix of amplitudes}
  \item{src}{optional string indicating data source}

  \item{sourceLevel}{source level, in dB(uPa@1m), denoted \code{sl} in [1 p15],
      where it is in units 0.1dB(uPa@1m)}

  \item{receiverSensitivity}{receiver sensivity of the main element, in
      dB(counts/uPa), denoted \code{rs} in [1 p15], where it is in units of
      0.1dB(counts/uPa)}

  \item{transmitPower}{transmit power reduction factor, in dB, denoted
      \code{tpow} in [1 p10], where it is in units 0.1 dB.}

  \item{pulseDuration}{duration of transmited pulse in us}

  \item{beamwidthX}{x-axis -3dB one-way beamwidth in deg, denoted \code{bwx} in
      [1 p16], where the unit is 0.2 deg}

  \item{beamwidthY}{y-axis -3dB one-way beamwidth in deg, denoted \code{bwx} in
      [1 p16], where the unit is 0.2 deg}

  \item{frequency}{transducer frequency in Hz, denoted \code{fq} in [1 p16]}

  \item{correction}{user-defined calibration correction in dB, denoted
      \code{corr} in [1 p14], where the unit is 0.01dB.}

}

\details{Creates an echosounder file.  The defaults for e.g.
    \code{transmitPower} are taken from the \code{echosounder} dataset, and
    they are unlikely to make sense generally.}

\value{An object of \code{\link[base]{class}} \code{"echosounder"}; for details
    of this data type, see \code{\link{echosounder-class}}).}

\seealso{The documentation for \code{\link{echosounder-class}} explains the
    structure of \code{echosounder} objects, and also outlines the other
    functions dealing with them.}

\author{Dan Kelley}

\keyword{misc}
