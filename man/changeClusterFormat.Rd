\name{changeClusterFormat}
\alias{changeClusterFormat}

\title{
Change cluter format
}
\description{
Takes in a \code{list} of clusters and outputs a single vector with the
index from the cluster list.
}
\usage{
changeClusterFormat(clusterList)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{clusterList}{
    A list of vectors, where each vector contains numbers. There should
    be no repeats in the numbers.
}
}
\details{
  Takes in a list of clusters, for example \code{[2 3]} \code{[1 5 4]},
  and converts it to a single vector where each element is the cluster
  index. For the example above, it would produce \code{[2 1 1 2 2]}.
  
}
\value{
  A vector of cluster indices.
}

\author{
Andrew White
}

\seealso{
\code{\link{aclust}}
}
