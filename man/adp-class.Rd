\name{adp-class}

\docType{class}

\alias{adp-class}
\alias{[[,adp-method}
\alias{[[<-,adp-method}
\alias{show,adp-method}

\title{Class to store acoustic Doppler profiler data}

\description{Class to store acoustic Doppler profiler data, holding the three
    slots used in all objects in Oce.  
    
    The \code{processingLog} is in standard form and needs little comment.  The
    rest of this section discusses the \code{metadata} and \code{data} slots,
    and the notation used assumes an object of class \code{adp} that is named
    ``\code{adp}.''  

    The \code{metadata} slot contains various items relating to the dataset,
    including source file name, sampling rate, velocity resolution, velocity
    maximum value, and so on.  Some of these are particular to particular
    instrument types, and prudent researchers will take a moment to examine the
    whole contents of the metdata, either in summary form (with
    \code{str(adp[["metadata"]])}) or in detail (with
    \code{adp[["metadata"]]}).  Perhaps the most useful general properties are
    \code{adp[["bin1Distance"]]} (the distance, in metres, from the sensor to
    the bottom of the first bin), \code{adp[["cellSize"]]} (the cell height, in
    metres, in the vertical direction, \emph{not} along the beam), and
    \code{adp[["beamAngle"]]} (the angle, in degrees, between beams and an
    imaginary centre line that bisects all beam pairs).  

    The diagram provided below indicates the coordinate-axis and beam-numbering
    conventions for three- and four-beam ADP devices, viewed as though the
    reader were looking towards the beams being emitted from the tranducers.
   
    \if{html}{\figure{adp_beams.png}{options: width=400px alt="Figure:
            adp_beams.png"}}
    
    The bin geometry of a four-beam profiler is illustrated below, for
    \code{adp[["beamAngle"]]} equal to 20 degrees, \code{adp[["bin1Distance"]]}
    equal to 2m, and \code{adp[["cellSize"]]} equal to 1m.   In the diagram,
    the viewer is in the plane containing two beams that are not shown, so the
    two visible beams are separated by 40 degrees.  Circles indicate the centres
    of the range-gated bins within the beams.  The lines enclosing those
    circles indicate the coverage of beams that spread plus and minus 2.5
    degrees from their centreline.
    
    \if{html}{\figure{adpgeometry2.png}{options: width=400px alt="Figure:
            adpgeometry2.png"}}

    Note that \code{adp[["oceCoordinate"]]} stores the present coordinate
    system of the object, and it has possible values \code{"beam"},
    \code{"xyz"} or \code{"enu"}.  (This should not be confused with
    \code{adp[["originalCoordinate"]]}, which stores the coordinate system used
    in the original data file.) 

    In contrast to the \code{metadata} slot, which holds many items that are
    instrument-specific, the \code{data} slot enforces a single pattern on all
    instrument types.  To begin with, \code{adp[["v"]]} is a three-dimensional
    numeric matrix of velocities in m/s.  In this matrix, the first index
    indicates time, the second bin number, and the third beam number.  The
    meanings of the beams depends on whether the object is in beam coordinates,
    frame coordinates, or earth coordinates.  
    
    Corresponding to the velocity matrix are two matrices of type raw, and
    identical dimension, accessed by \code{adp[["a"]]} and \code{adp[["q"]]},
    holding measures of signal strength and data quality quality, respectively.
    (The exact meanings of these depend on the particular type of instrument,
    and it is assumed that users will be familiar enough with instruments to
    know both the meanings and their practical consequences in terms of
    data-quality assessment, etc.)

    In addition to the matrices, there are time-based vectors.  The vector
    \code{adp[["time"]]} (of length equal to the first index of
    \code{adp[["v"]]}, etc.) holds POSIXt times of observation.  Depending on
    type of instrument and its configuration, there may also be corresponding
    vectors for sound speed (\code{adp[["soundSpeed"]]}), pressure
    (\code{adp[["pressure"]]}), temperature (\code{adp[["temperature"]]}),
    heading (\code{adp[["heading"]]}) pitch (\code{adp[["pitch"]]}), and roll
    (\code{adp[["roll"]]}), depending on the setup of the instrument.

    The precise meanings of the data items depend on the instrument
    type.  All instruments have \code{v} (for velocity), \code{q} (for a
    measure of data quality) and \code{a} (for a measure of backscatter
    amplitude, also called echo intensity).  Devices from Teledyne-RDI
    profilers have an additional item \code{g} (for percent-good).
    
    For RDI profilers, there are four three-dimensional arrays holding beamwise
    data.  In these, the first index indicates time, the second bin number, and
    the third beam number (or coordinate number, for data in \code{xyz},
    \code{enu} or \code{other} coordiante systems).  In the list below, the
    quoted phrases are quantities as defined in Figure 9 of reference 1.
    \itemize{
        \item \code{v} is ``velocity'' in m/s, inferred from two-byte signed
        integer values (multiplied by the scale factor that is stored in
        \code{velocityScale} in the metadata).

        \item \code{q} is ``correlation magnitude'' a one-byte quantity stored
        as type \code{raw} in the object. The values may range from 0 to 255.

        \item \code{a} is ``backscatter amplitude``, also known as
        ``echo intensity'' a one-byte quantity stored as type \code{raw}
        in the object.  The values may range from 0 to 255.

        \item \code{g} is ``percent good'' a one-byte quantity stored as
        \code{raw} in the object.  The values may range from 0 to 100.
    
    }
    
    Finally, there is a vector \code{adp[["distance"]]} that indicates the bin
    distances from the sensor, meaasured in metres along an imaginary centre
    line bisecting beam pairs.  The length of this vector equals
    \code{dim(adp[["v"]])[2]}.

}

\section{Methods}{

    \subsection{Extracting values}{Matrix data may be accessed as illustrated
        above, e.g.  or an adp object named \code{adv}, the data are provided
        by \code{adp[["v"]]}, \code{adp[["a"]]}, and \code{adp[["q"]]}.  As a
        convenience, the last two of these can be accessed as numeric (as
        opposed to raw) values by e.g.  \code{adp[["a", "numeric"]]}.  The
        vectors are accessed in a similar way, e.g. \code{adp[["heading"]]}, etc.
        Quantities in the \code{metadata} slot are also available by name, e.g.
        \code{adp[["velocityResolution"]]}, etc.}

    \subsection{Assigning values}{This follows the standard form, e.g. to
        increase all velocity data by 1 cm/s, use \code{adp[["v"]] <- 0.01 +
            adp[["v"]]}.}

    \subsection{Overview of contents}{The \code{show} method (e.g.
        \code{show(d)}) displays information about an ADP object named
        \code{d}.}
}


\section{Dealing with suspect data}{There are many possibilities for confusion
    with \code{adp} devices, owing partly to the flexibility that manufacturers
    provide in the setup.  Prudent users will undertake many tests before
    trusting the details of the data.  Are mean currents in the expected
    direction, and of the expected magnitude, based on other observations or
    physical constraints?  Is the phasing of currents as expected?  If the
    signals are suspect, could an incorrect scale account for it?  Could the
    transformation matrix be incorrect?  Might the data have exceeded the
    maximum value, and then ``wrapped around'' to smaller values?  Time spent
    on building confidence in data quality is seldom time wasted.}

\references{1. Teledyne-RDI, 2007. \emph{WorkHorse commands and output data
        format.} P/N 957-6156-00 (November 2007).  }

\seealso{A file containing ADP data is usually recognized by Oce, and so
    \code{\link{read.oce}} will usually read the data.  If not, one may use the
    general ADP function \code{\link{read.adp}} or specialized variants
    \code{\link{read.adp.rdi}}, \code{\link{read.adp.nortek}} or
    \code{\link{read.adp.sontek}} or
    \code{\link{read.adp.sontek.serial}}.

    ADP data may be plotted with \code{\link{plot.adp}} function, which is a
    generic function so it may be called simply as \code{plot}.

    Statistical summaries of ADP data are provided by the generic function
    \code{summary}, while briefer overviews are provided with \code{show}.

    Conversion from beam to xyz coordinates may be done with
    \code{\link{beamToXyzAdp}}, and from xyz to enu (east north up) may be done
    with \code{\link{xyzToEnuAdp}}.  \code{\link{toEnuAdp}} may be used to
    transfer either beam or xyz to enu.  Enu may be converted to other
    coordinates (e.g. aligned with a coastline) with
    \code{\link{enuToOtherAdp}}.
}

    
\author{Dan Kelley}
\keyword{classes}
\keyword{oce}

