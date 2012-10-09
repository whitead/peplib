\name{Sequences-class}
\alias{Sequences}
\Rdversion{1.1}
\docType{class}
\alias{Sequences-class}
\alias{dist,Sequences-method}
%%\alias{FiveTwoCV,Sequences-method}
\alias{plot,Sequences-method}
\alias{rbind,Sequences-method}
\alias{[,Sequences-method}

\title{Class "Sequences"}
\description{
This is a small extension of a matrix representation of the
sequences. The sequences are represented as integers, where each integer
  corresponds to a character type from the alphabet. For example, if the
  sequence is ADC, and the alphabet is \code{['A', 'B', 'C', 'D']}, the
  sequence will be \code{[1,4,3]}. The matrix itself has each sequence
  as a row, and the alphabet slot contains the key that shows how the
  integers correspond to the characters in the sequence. 
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("Sequences", data,
  nrow, ncol, byrow, dimnames, ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{.Data}:}{Object of class \code{"matrix"} The sequences,
      where each row is a sequence and the sequence is a series of integers}
    \item{\code{alphabet}:}{Object of class \code{"character"} The
      character representation of each integer }
    \item{\code{nseqs}:}{The number of unique sequences in the class.}
    }
}

\section{Extends}{
  Class \code{"\linkS4class{matrix}"}, from data part.
  Class \code{"\linkS4class{array}"}, by class "matrix", distance 2.
  Class \code{"\linkS4class{structure}"}, by class "matrix", distance 3.
  Class \code{"\linkS4class{vector}"}, by class "matrix", distance 4, with explicit coerce.
}
\section{Methods}{
  \describe{
    \item{dist}{\code{dist(seqs, method="substitution",
	params=default.MetricParams,...)}} dist calculates the
      sequence-sequences distance matrix. Use
      \code{method="substitution"} to use a substitution matrix for weighting
      sequence mutations and use \code{method="hamming"} to use equal weighting
    of all mutations. Also accepts \code{params=aMetricParams} for using a
    substitution matrix other than the default. Each substitution is
    given a weight of 1 using the hamming method or the score from the
    corresponding substitution matrix when using the substitution
    method. The distance matrix is converted to a dissimilarity distance
    by making all elements negative and adding the maximum score/weight
    
%%    \item{FiveTwoCV}{\code{FiveTwoCV(seqs, classes, motifNumber=1,
%%    motifModelType="fixed"}: This method is used for motif modelling on
%%    the sequences. It clusters the sequences, fits motifs to the
%%    clusters, and then tests their predictive power using 5x2
%%    cross-validation. This method combines many of the steps described
%%    elsewhere (see \code{\linkS4class{MotifModelSet}}). As a result, it
%%    returns a list of metrics for how well the motifs fit. This method
%%    can be used, for example, in determining the number of motifs.}
    \item{plot}{\code{plot(seqs, clusterNumber=4,
	params=default.MetricParams,
	distanceMatrix=dist.Sequences(seqs,
	params=params), 
	clusters=aclust(dmat, clusterNumber))}: 
        This method plots a summary plot of the sequences. Each point
	represents a sequence and the points plotted on a projection
	onto their two principal components as found
        from the distance matrix. Additionally, they are colored and
        placed into clusters using the given cluster number and the
        \code{kmeans} algorithm found in the \code{stats} package. This
        method provides a quick way of estimating the number of clusters in
       the sequences and looking for any simple patterns in the data. It
       also can be used to test different substitution matrices to see
       which best segregates data. For example, a BLOSUM90 substitution
       matrix may work well for very similar sequences, whereas a BLOSUM50
       substitution matrix will work better for very different
    sequences. The distance matrix may be specified and the clusters as well.}
    \item{rbind}{\code{rbind(seq1, seq2)}: This method just overwrites
    the traditional rbind method by passing the alphabet along. Note
    that most matrix methods editing methods do not return a Sequence
    class by default, except this rbind method. }
	 }
}

\author{
Andrew White
}


\section{Warning}{
  The gap character is always assumed to be the last character in the
  sequence slot. Do not change this convention, since the distance
  method relies on this. Not all data.frame manipulations methods have
  been overridden. Thus, you may get a data.frame back instead of a
  Sequences object. Only \code{rbind} and array access has been overridden.
  }

\seealso{
 \code{\link{read.sequences}}, which allows you to create Sequence objects from
 a file, \code{\link{descriptors}}, which creates a
 \code{\linkS4class{Descriptors}} object for a Sequences object. 
}

\examples{
##load example data and plot it
data(TULASequences)
\dontrun{plot(TULASequences)}

## Access all sequences which have a 4 in position 1
print(TULASequences[TULASequences[,1] == 4,])

## Access all sequences which have an tyrosine residue in position 1 and
## cluster

TULASequences.subset <- TULASequences[TULASequences[,1] == which(TULASequences@alphabet == 'Y'),]
plot(TULASequences.subset)

##Calculate distance matrix on this subset and use agglomerative
##  clustering to plotit
\dontrun{
TULA.dmatrix <- dist(TULASequences.subset)
TULA.hclusters <- hclust(TULA.dmatrix)
plot(TULA.hclusters)}

}
\keyword{classes}
