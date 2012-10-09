\name{blosum62}
\alias{blosum62}
\docType{data}
\title{
BLOSUM 62 substitution matrix
}
\description{
  The BLOSUM 62 substitution matrix which may be used for calculating
  distances. This is the default
}
\usage{data(blosum62)}
\format{
  A matrix where element i,j represents how often homologous proteins have
  element i substituted with element j. Thus, it is a measure of
  similarity. Positive numbers indicate easy substitution, while
  negative numbers indicate difficult substitution.

}
\source{
Henikoff, S.; Henikoff, J.G. (1992). "Amino Acid Substitution Matrices from Protein Blocks". PNAS 89 (22): 10915-10919. doi:10.1073/pnas.89.22.10915
}

\examples{
data(blosum62)
##Change the normal distance parameters
default.MetricParams <-  new("MetricParams", smatrix=blosum62, gapOpen=-10, gapExtension=-0.2)
##Now calls to dist on sequences will use blosum 62 instead
}
\keyword{datasets}
