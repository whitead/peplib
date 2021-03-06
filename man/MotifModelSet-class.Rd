\name{MotifModelSet-class}
\Rdversion{1.1}
\docType{class}
\alias{MotifModelSet-class}
\alias{motifModelSet}
\alias{MotifModelSet}
\alias{BIC,MotifModelSet-method}
\alias{classify,MotifModelSet-method}
\alias{residuals,MotifModelSet-method}
\alias{logLik,MotifModelSet-method}
\alias{plot,MotifModelSet-method}
\alias{predict,MotifModelSet-method}

\title{Class "MotifModelSet"}
\description{
A set of \code{\linkS4class{MotifModel}}s
}

\section{Objects from the Class}{
Objects can be created by calls of the form \code{motifModelSet(seqs, motifNumber=NA, type="fixed", width=4, verbose=TRUE, clusterType="kmeans", maxGuess=10)}.
}
\section{Slots}{
  \describe{
    \item{\code{motifs}:}{Object of class \code{"list"} containing a
      list of \code{\linkS4class{MotifModel}}s}
  }
}
\section{Arguments}{
  \describe{
  \item{seqs}{
    An object of class \code{\linkS4class{Sequences}}, which contains
    the sequences to be fit.}
  \item{motifNumber}{
    The number of clusters to be found in the clustering algorithm and
    thus the number of motif models to be fit. If \code{NA} is given,
    the number of clusters is inferred from the BIC. This method can
    take a significant amount of time with a large number of sequences.
  }
  \item{type}{
    This is the type of motif model to fit. See
    \code{\linkS4class{MotifModel}} for more information. Can be of
    \code{"fixed"}, \code{"variable"}, or
    \code{"optional"}. \code{"fixed"} means the motif is in the same
    position for each sequence in the cluster. This is typically the
    best, since the clustering algorithm relies on the sequences already
    being aligned. A \code{"variable"} type motif model  allows the
    motif to be in a different position for each
    sequence. \code{"optional"} allows the motif to be unexpressed in
    sequences or start at a variable position.
    }
    \item{width}{
      The number of residue positions in the motifs. Non-motif residues are fit
    to a multinomial background model. If varying widths are desired,
    each individual \code{\linkS4class{MotifModel}} can be built and
    then assembled into a \code{MotifModelSet} by calling
    \code{new("MotifModelSet", motifs=mlist)}, where mlist is a list of the
    motif models.
    }
    \item{clusterType}{
      Can be \code{"kmeans"} or \code{"agglomerative"}. See
      \code{\link{aclust}} for more information.
  }
  \item{maxGuess}{
    If the \code{motifNuber = NA}, then this is the bound on the maximum
    number of motifs to attempt to fit.
    }
  }
}
\section{Details}{
    This is a convenience class providing methods for a few common tasks that are
    necessary for analyzing multiple motifs on sequences. The function that
    creates these objects clusters the sequences according
    to a substitution type metric, see \code{\linkS4class{Sequences}},
    and then fits motif models to each of the clusters. The resulting
    motif models can be used to discover the most likely motifs in the
    sequences and to classify new sequences into the motifs. Since there
    is clustering used to separate the various motifs, this approach is
    somewhat ad-hoc. There is an expectation-maximization done on motif
    position, but not on which motif each sequence belongs to. Due to
    the ad-hoc nature of dividing sequences into motifs, the ability to
    find the motif number relies on an elbow plot, which should be
    viewed by the user.

    This method uses the same motif model for each cluster, but this is
    not required. More sophisticated modeling may be done by building a
    \code{\linkS4class{MotifModel}} for each cluster and then combining
    them by calling \code{new("MotifModelSet", motifs=mlist)}, where
    mlist is a list of the motif models.

    Typically, the number of motifs should be set by hand either through
    using the \code{plot} function on the sequences or examining the elbow
    plots that come from this function, \code{motifModelSet}. It is
    important to note, as
    mentioned in the \code{\linkS4class{Sequences}} examples, the clustering
    algorithm is sensitive to the substitution matrix used in the metric
    parameters.
  }
\section{Methods}{
  \describe{
    \item{BIC}{\code{BIC(object)}: Calculates
      the BIC of a motif model list. It sums the log-likelihood of each
      motif model and uses the equation \code{-2 * logLik + k * log(n)},
      where \code{k} is the number of
      parameters and \code{n} is the number of independent observations,
      each sequence in this case.}
    
    \item{classify}{\code{classify(motifSet, newSequences, threshold =
	0)}:  The function calculates the likelihood of each sequence
    in each model using a call to the predict method of \code{\linkS4class{MotifModel}}.
    The sequences are classified into the most likely motif. If the
    threshold is non-zero, then if no motif is more likely than the
    threshold, the sequence is classified into the -1 class. The value
    is an array with integers representing the classes. A positive number
    indicates the sequence belongs to a motif. The positive number itself
    corresponds to the index of the motif from the passed motifList. A negative
    number indicates no class, as determined from the threshold.}
  
    \item{residuals}{\code{residuals(model, seqs=model@seqs,
	classes=rep(0,nrow(seqs)), threshold = 0)}: This method
	classifies \code{seqs} and calculates the number of false
	positives, false negatives, and a measure of accuracy between 0
	and 1. \code{classes} should be the true classes for each
	sequence, where a negative number means it is not in the model,
	a positive number means it belongs to a specific motif, or 0
	means it is simply in any motif. The default value for
	\code{classes} is all sequences belong in the model. The
	log-likelihood for each sequence according to the motif is
	calculated and if any is greater than the \code{threshold}, the
	sequence is classified as in the model. The sequence is also
	classified into a particular motif if it is above the
	threshold. These predictions are tested against the true
	\code{classes} passed to the method. }

    \item{plot}{\code{plot(model,...)}: This method provides a scatter
    plot which shows the clustering of the sequences and the motif strings of each model
    as the legend.}

    \item{logLik}{\code{logLik(model)}: This method calculates the
      (expected) log-likelihood of each of the motif models and sums
      them together.}
  }
}
\author{
Andrew White
}

\seealso{
\code{\linkS4class{MotifModel}}, \code{\linkS4class{Sequences}}
}
\examples{
data(TULASequences)

TULAMList <- motifModelSet(TULASequences, width=6, motifNumber=4,
type="fixed")
plot(TULAMList)
plot(TULAMList@motifs[[1]])
print(TULAMList@motifs[[1]])


small.mlist <- motifModelSet(TULASequences, motifNumber=2,
type="fixed")
ll <- logLik(small.mlist)
print(ll)

large.mlist <- motifModelSet(TULASequences, motifNumber=5,
type="optional")
ll <- logLik(large.mlist)
print(ll)

#split the dataset
training.size <- nrow(TULASequences) * 2 / 3
training.indices <- sample(nrow(TULASequences), training.size)
testing.indices <- setdiff(1:nrow(TULASequences), training.indices)

training <- new("Sequences", TULASequences[training.indices,],
alphabet=TULASequences@alphabet)

testing <- new("Sequences", TULASequences[testing.indices,],
alphabet=TULASequences@alphabet)

#Now we have two sets of sequences

training.mlist <- motifModelSet(training, width=6,
motifNumber=3)

classes <- classify(training.mlist, testing)
#Now we have the classes on the unseen data


}
\keyword{classes}
