\name{MetricParams-class}
\Rdversion{1.1}
\docType{class}
\alias{MetricParams-class}
\alias{MetricParams}

\title{Class "MetricParams"}
\description{
This class stores the parameters used for calcaulting sequence-sequence
distances. The parameters are all based on the use of substitution
matrices and scores, for example the blosum Matrix. Many possible matrices can be
accessed using a call to \code{data(blosumXX)} command to create new
parameter sets. These metric parameter are passed into a few other methods, see
the examples below.
}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("MetricParams",
  smatrix=blosumXX, gapOpen=-10, gapExtension=-0.2)}.
}
\section{Slots}{
  \describe{
    \item{\code{smatrix}:}{Object of class \code{"matrix"} The
      substitution matrix, where each element represent the \code{log2} of the
      probability of mutating to that residue. For example, column 3,
      row 7 is \code{log2} of the probability of mutating from 3 to
      7. However, these probabilities are not normalized correctly;
      instead substition matrices were designed to have the sum of
      theirs \code{log2}s of the probabilities be
      negative.  }
    \item{\code{gapOpen}:}{Object of class \code{"numeric"} The penalty
      score for opening a gap}
    \item{\code{gapExtension}:}{Object of class \code{"numeric"} The
      penalty score for extending an exisgting gap }
  }
}
\section{Methods}{
No methods defined with class "MetricParams" in the signature.
}
\references{
%%  ~~put references to the literature/web site here~~
}
\author{
Andrew White
}


\seealso{
\code{\linkS4class{Sequences}} the \code{dist} method.
}
\examples{
#Load the classic BLOSUM62 matrix
data(blosum62)
#Set slightly different gap open, and gap extend parameters
b62params <- new("MetricParams", smatrix=blosum62, gapOpen=-8,
gapExtension=-5)
data(SHP2Sequences)
plot(SHP2Sequences, params=b62params)

#Change the metric parameters to a more stringent substitution matrix
data(blosum90)
b90 <- new("MetricParams", smatrix=blosum90, gapOpen=-8,
gapExtension=-5)
plot(SHP2Sequences, params=b90)

}
\keyword{classes}
