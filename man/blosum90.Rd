\name{blosum90}
\alias{blosum90}
\docType{data}
\title{
BLOSUM 90 substitution matrix
}
\description{
  The BLOSUM 90 substitution matrix which may be used for calculating
  distances. This is for a less diverse library than BLOSUM 62
}
\usage{data(blosum90)}
\format{
  A data frame with 24 observations on the following 24 variables.
}
\source{
Henikoff, S.; Henikoff, J.G. (1992). "Amino Acid Substitution Matrices from Protein Blocks". PNAS 89 (22): 10915-10919. doi:10.1073/pnas.89.22.10915
}

\examples{
data(blosum90)
##Change the normal distance parameters
default.MetricParams@smatrix <- matrix(blosum90)
##Now calls to dist on sequences will use blosum 90 instead
}
\keyword{datasets}
