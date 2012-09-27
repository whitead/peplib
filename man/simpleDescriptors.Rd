\name{simpleDescriptors}
\alias{simpleDescriptors}

\title{
Function "simpleDescriptors"
}
\description{
This produces a \code{\linkS4class{Descriptors}} which is smaller and
more simple than those produced by a call to the normal method for
producing descriptors, \code{\link{Descriptors}}.
}
\usage{
simpleDescriptors(seqs, response = numeric(0), include.statistics = FALSE)
}
\arguments{
  \item{seqs}{
    An \code{\linkS4class{Sequences}}
}
  \item{response}{
    An optional numeric vector which contains the responses for each
    sequence in \code{seqs}.
}
  \item{include.statistics}{
    If p-values which estimate the importance of each descriptor are
    desired, set this to true.
}
}
\details{
  See the \code{descriptors} method in \code{\linkS4class{Descriptors}}
  for details.
}
\value{
  A \code{\linkS4class{Descriptors}} is returned. If the statistics were
  included, the p-values may be accessed in the pvalues slot (value@pvalues).
}

\author{
  Andrew White
}
\seealso{
  \code{\linkS4class{Descriptors}}
}
\examples{

##Finding correlation with a response
data(AMPSequences)
data(AMPSequences.response)

AMP.desc <- simpleDescriptors(AMPSequences, response=AMPSequences.response[,1])

print(cor(AMP.desc))


##Discovering which descriptors are important

data(SHP2Sequences)

SHP2.desc <- simpleDescriptors(SHP2Sequences, include.statistics=TRUE)
print(SHP2.desc@pvalues)


}

\keyword{classes}
\keyword{datagen}