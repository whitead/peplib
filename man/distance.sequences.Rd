\name{distance.sequences}
\alias{distance.sequences}
\title{
Compute sequence distances with non-standard parameters
}
\description{
  A customizable version of the \code{dist} method of
  \code{\linkS4class{Sequences}} that computes a distance matrix for sequences.
}
\usage{
  distance.sequences(seqs, method="substitution", params=default.MetricParams)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{seqs}{ A \code{\linkS4class{Sequences}} object which contains
    the amino acids sequences to be analyzed.
  }
  \item{method}{ The distance method to be used. Can be "substitution" or
    "hamming". "euclidean" is a synonym for "substitution".
  }
  \item{params}{Optional \code{\linkS4class{MetricParams}} object to
    define the substitution values.
    }
}
\details{

  See \code{\linkS4class{Sequences}} for a more information about
  sequences. This method calculates the sequence-sequences distance
  matrix. Use \code{method="substitution"} to use a substitution matrix
  for weighting sequence mutations and use \code{method="hamming"} to
  use equal weighting of all mutations. Also accepts
  \code{params=aMetricParams} for using a substitution matrix other than
  the default. Each substitution is given a weight of 1 using the
  hamming method or the score from the corresponding substitution matrix
  when using the substitution method. The distance matrix is converted
  to a dissimilarity distance by making all elements negative and adding
  the maximum score/weight.

  To create your own params, use:
  \code{myparams <- new("MetricParams", smatrix=bs85, gapOpen=-1,
    gapExtension=-0.2)}

  where \code{bs85} is a ~22 x ~22 substitution matrix with row names of
  the 20 amino acids, followed by any special amino acids ("B", "Z", etc),
  an unknown amino acid designation ("X") and the gap character: "-". It
  is critical that the gap character is last. See
  \code{\linkS4class{MetricParams}} for more information.
}

\value{
 \code{dist.sequences} returns an object of class
 \code{dist} from the \code{stats} package.

 See the documentation of \code{\link{dist}} for more details about the
 \code{dist} object.
 
}
\author{
Andrew White
}


\seealso{
\code{\linkS4class{Sequences}}, \code{\linkS4class{MetricParams}}, \code{\link{dist}}
}

