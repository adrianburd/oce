\name{xyzToEnuAdv}

\alias{xyzToEnuAdv}

\title{Convert XYZ to ENU coordinates}

\description{Convert ADP or ADV velocity components from a xyz-based coordinate
    system to an enu-based coordinate system.}

\usage{xyzToEnuAdv(x, declination=0,
            cabled=FALSE, horizontalCase, sensorOrientation,
            debug=getOption("oceDebug"))}

\arguments{
  \item{x}{an object of class \code{adv}.}
  \item{declination}{magnetic declination to be added to the heading, to
    get ENU with N as "true" north.}

  \item{cabled}{boolean value indicating whether the sensor head is connected
      to the pressure case with a cable.  If \code{cabled=FALSE}, then
      \code{horizontalCase} is ignored.  See \dQuote{Details}.}

  \item{horizontalCase}{optional boolean value indicating whether the sensor
      case is oriented horizontally.  Ignored unless \code{cabled} is
      \code{TRUE}. See \dQuote{Details}.}

  \item{sensorOrientation}{optional string indicating the direction in which
      the sensor points.  The value, which must be \code{"upward"} or
      \code{"downward"}, over-rides the value of \code{x@metadata$orientation},
      which will have been set by \code{\link{read.adv}}, \emph{provided} that
      the data file contained the full header.  See \dQuote{Details}.}

  \item{debug}{a flag that, if non-zero, turns on debugging.  Higher values
      yield more extensive debugging.}

}

\details{The coordinate transformation is done using the heading, pitch,
  and roll information contained within \code{x}.  The algorithm is
  similar to that used for Teledyne/RDI ADCP units, taking into account
  the different definitions of heading, pitch, and roll as they are defined for
  the velocimeters.

  Generally, the transformation must be done on a time-by-time basis,
  which is a slow operation.  However, this function checks whether the
  vectors for heading, pitch and roll, are all of unit length, and in that
  case, the calculation is altered, resulting in shorter executation times.
  Note that the angles are held in (\code{data$timeSlow},
  \code{data$headingSlow}, ...) for Nortek instruments and (\code{data$time},
  \code{data$heading}, ...) for Sontek instruments.

  Since the documentation provided by instrument manufacturers
  can be vague on the coordinate transformations, the method used here 
  had to be developed indirectly.  (This is in contrast to the RDI ADCP
  instruments, for which there are clear instructions.)
  documents that manufacturers provide.  If results seem incorrect (e.g. if
  currents go east instead of west), users should examine the code in detail
  for the case at hand.  The first step is to set \code{debug} to 1, so that
  the processing will print a trail of processing steps.  The next step should
  be to consult the table below, to see if it matches the understanding (or
  empirical tests) of the user.  It should not be difficult to tailor the code,
  if needed.

  The code handles every case individually, based on the table given below.
  The table comes from Clark Richards, a former PhD student at Dalhousie
  University [2], who developed it based on instrument documentation,
  discussion on user groups, and analysis of measurements acquired with Nortek
  and Sontek velocimeters in the SLEIWEX experiment [3].

  The column labelled ``Cabled'' indicates whether the sensor and the pressure
  case are connected with a flexible cable, and the column labelled ``H.case''
  indicates whether the pressure case is oriented horizontally.  These two
  properties are not discoverable in the headers of the data files, and so they
  must be supplied with the arguments \code{cabled} and \code{horizontalCase}.
  The source code refers to the information in this table by case numbers.
  (Cases 5 and 6 are not handled.)  Angles are abbreviated as follows:: heading
  ``H,'' pitch ``P,'' and roll ``R''.  Entries X, Y and Z refer to instrument
  coordinates of the same names.  Entries S, F and M refer to so-called ship
  coordinates starboard, forward, and mast; it is these that are used together
  with a rotation matrix to get velocity components in the east, north, and
  upward directions.

\tabular{rrrrrrrrrrrr}{
\strong{Case} \tab \strong{Mfr.} \tab \strong{Instr.} \tab \strong{Cabled} \tab \strong{H. case} \tab \strong{Orient.} \tab \strong{H}  \tab \strong{P} \tab \strong{R} \tab \strong{S} \tab \strong{F} \tab \strong{M}\cr 
1 \tab Nortek \tab vector \tab    no \tab      - \tab     up  \tab H-90 \tab  R \tab -P \tab  X \tab -Y \tab -Z\cr
2 \tab Nortek \tab vector \tab    no \tab      - \tab   down  \tab H-90 \tab  R \tab -P \tab  X \tab  Y \tab  Z\cr
3 \tab Nortek \tab vector \tab   yes \tab    yes \tab     up  \tab H-90 \tab  R \tab -P \tab  X \tab  Y \tab  Z\cr
4 \tab Nortek \tab vector \tab   yes \tab    yes \tab   down  \tab H-90 \tab  R \tab  P \tab  X \tab -Y \tab -Z\cr
5 \tab Nortek \tab vector \tab   yes \tab     no \tab     up  \tab  -   \tab  - \tab  - \tab  - \tab  - \tab  -\cr
6 \tab Nortek \tab vector \tab   yes \tab     no \tab   down  \tab  -   \tab  - \tab  - \tab  - \tab  - \tab  -\cr
7 \tab Sontek \tab   adv  \tab    -  \tab      - \tab     up  \tab H-90 \tab  R \tab -P \tab  X \tab -Y \tab -Z\cr
8 \tab Sontek \tab   adv  \tab    -  \tab      - \tab   down  \tab H-90 \tab  R \tab -P \tab  X \tab  Y \tab  Z\cr
}
}

\seealso{See \code{\link{read.adv}} for notes on functions relating to
  \code{adv} objects.}

\author{Dan Kelley, in collaboration with Clark Richards}

\references{
    \enumerate{
\item \url{http://www.nortek-as.com/lib/forum-attachments/coordinate-transformation}
\item Clark Richards, 2012, PhD Dalhousie University Department of Oceanography.
\item The SLEIWEX experiment (\url{http://myweb.dal.ca/kelley/SLEIWEX/index.php}).
    }
}


\keyword{misc}
