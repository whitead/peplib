\name{aclust}
\alias{aclust}

\title{
aclust
}
\description{
Clusters a matrix of peptide sequences using kmeans or agglomerative clustering
}
\usage{
aclust(sDistMatrix, clusterNumber, verbose = T, type = "kmeans", knstart
= 3)
}

\arguments{
  \item{sDistMatrix}{
    \code{sDistMatrix} is a distance matrix resulting from a call to
  \code{dist(seqs)}, where \code{seqs} is a
  \code{\linkS4class{Sequences}} object. You may also just pass the
  sequences and a call to \code{dist} will be done automatically.
}
  \item{clusterNumber}{
    The number of clusters to create.
}
  \item{verbose}{
    Controls how much logging information is printed.
}
  \item{type}{
    There are two \code{type} options: \code{"kmeans"} and
    \code{"agglomerative"}. \code{"kmeans"} causes \code{aclust} to call
    the normal \code{\link{kmeans}} method available in
  R. \code{"agglomerative"} uses a hierarchical clustering technique on
  the distance matrix.
  }
  \item{knstart}{
    The number of times to execute the \code{"kmeans"} algorithm to
  ensure a global minimum is reached.
  }
}
\details{
During each round, the agglomerative clustering technique combines the points or sets of
points which have the smallest distance to one another. The distance
measure is the smallest pairwise distance between two sets of points.
}
\value{
\code{aclust} returns a list where each element represents a
cluster. Each element in the list is an array of integers, where each integer is the
index of sequence (the row of the input sequence matrix).
}
\author{
Andrew White
}
\note{
The "kmeans" is much much faster.
}

\seealso{
\code{\linkS4class{Sequences}}, \code{\link{kmeans}}
}
\examples{

#load some example data
data(TULASequences)

##Cluster
clusters <- aclust(dist(TULASequences), 3, knstart=1)
print(length(clusters[1]))
print(length(clusters[2]))
print(length(clusters[3]))

}

\keyword{ datagen }
\keyword{ models }
