\name{swTFreeze}

\alias{swTFreeze}

\title{Seawater freezing temperature}

\description{Compute freezing temperature of seawater.}

\usage{swTFreeze(salinity, pressure=0,
    longitude=300, latitude=30, saturation_fraction=1,
    eos=getOption("oceEOS", default="gsw"))}

\arguments{
  \item{salinity}{either salinity [PSU] or a \code{ctd} object from which
  salinity will be inferred.}
  \item{pressure}{seawater pressure [dbar]}
  \item{longitude}{longitude of observation (only used if \code{eos="gsw"}; see
      \sQuote{Details}).}
  \item{latitude}{latitude of observation (only used if \code{eos="gsw"}; see
      \sQuote{Details}).}
  \item{saturation_fraction}{saturation fraction of dissolved air in seawater
      (used only if \code{eos="gsw"}).}
  \item{eos}{equation of state, either \code{"unesco"} [1,2] or \code{"gsw"}
      [3,4].}

}

\details{In the first form, the argument is a \code{ctd} object, from which the
    salinity and pressure values are extracted and used to for the calculation.
}

\value{Temperature [\eqn{^\circ}{deg}C]}

\examples{
swTFreeze(salinity=40, pressure=500, eos="unesco") # -2.588567 degC
}

\references{
    [1] Fofonoff, P. and R. C. Millard Jr, 1983. Algorithms for computation of
    fundamental properties of seawater. \emph{Unesco Technical Papers in Marine
        Science}, \bold{44}, 53 pp

    [2] Gill, A.E., 1982. \emph{Atmosphere-ocean Dynamics}, Academic Press, New
    York, 662 pp.

    [3] IOC, SCOR, and IAPSO (2010). The international thermodynamic equation
    of seawater-2010: Calculation and use of thermodynamic properties.
    Technical Report 56, Intergovernmental Oceanographic Commission, Manuals
    and Guide.

    [4] McDougall, T.J. and P.M. Barker, 2011: Getting started with TEOS-10 and
    the Gibbs Seawater (GSW) Oceanographic Toolbox, 28pp., SCOR/IAPSO WG127,
    ISBN 978-0-646-55621-5.

}


\author{Dan Kelley}

\keyword{misc}
