\name{Descriptors-class}
\Rdversion{1.1}
\docType{class}
\alias{Descriptors}
\alias{descriptors}
\alias{Descriptors-class}
\alias{plot,Descriptors-method}

\title{Class "Descriptors"}
\description{
The descriptors class is an extension to the \code{data.frame} class and
contains, in addition to the descriptors, information about any response
data and p-values which describe the difference between the sequences
vs. the space of possible sequences. The class should be created by a call to \code{descriptors} (see
arguments and details below) or \code{\link{simpleDescriptors}}.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{descriptors(seqs, response=numeric(0), base.frame=NA, do.var=TRUE, alags=c(1,2,3), do.mean=TRUE, do.counts=TRUE, do.position=TRUE, alphabet=seqs@alphabet, include.statistics=TRUE, accuracy=0.01)}
}
\section{Arguments}{
\describe{
  \item{seqs}{A \code{\linkS4class{Sequences} object}}
  \item{response}{An optional array containing responses for each
    sequence. \code{nrow(seqs)} should be equal to \code{length(response)}.}
  \item{base.frame}{A \code{data.frame} containing descriptors
    calculated on each amino acid. See details.}
  \item{do.var}{Calculate the additional descriptors which are the
    variance of single residue descriptors along the sequence}
  \item{do.mean}{Calculate the mean of the single residue descriptors along the
    sequence}
  \item{do.counts}{Provide descriptors of various counts, like the
    number of each residue type}
  \item{do.position}{Provide position specific descriptors}
  \item{alphabet}{The alphabet to use for calculating counts.}
  \item{include.statistics}{If \code{TRUE}, the function will calculate
    the p-values of the descriptors. See details.}
  \item{accuracy}{The accuracy of the computed statistics on the
    descriptors}
  }
}
\section{Details}{

  The descriptor calculation methods used here are not as sophisticated
  as those provided in some of the more complete QSAR packages. Instead,
  it relies on making various permutations of descriptors calculated on
  single amino acids. There are two reasons for this. First, it is easy
  to calculate descriptors quickly, without relying on another
  program. Second, it is easier to treat calculating the distribution of
  the descriptors of the sequence space. The ability to calculate the
  descriptors across the sequence space also depends on the number of
  descriptors and the chain length of the sequence. The advantage of
  knowing descriptors on the whole sequence space is that it is easy to
  determine if a descriptor on the sequences is significant. For
  example, if the number of hydrogen bond donors is three standard
  deviations above the mean number of hydrogen bond donors over all
  sequence space, then that is a significant descriptor. This is
  expressed as a p-value, which is calculated from a
  \code{\link{wilcox.test}}. That is a non-parametric version of the
  Student's t-test.

  The calculations are based on the given \code{base.frame}
  parameter. Given that matrix, which contains the descriptors
  calculated on all the individual amino acids, it is possible to
  calculate many sequence level descriptors. If the means are being
  calculated (\code{do.mean=true}), then the mean of the descriptors for
  each sequence is calculated. This doubles the number of
  descriptors. The same is true of the \code{do.var}, which uses
  variance along the sequence. The autocorrelation function can also be
  calculated along the chain, again increasing the number of resulting
  descriptors. This may be interesting for describing alternating
  patterns. The position specific descriptors are simply the individual
  descriptors at a certain position. For example, number of hydrogen
  bond donors at position 2.

  One often is more interested in understanding what is common amongst
the active sequences. This may be done by comparing a descriptor on the
active sequences to the inactive sequences. Since inactive sequences are
rarely collected in peptide libraries, we may approximate the inactive
sequences as all sequences. \bold{ This assumption only holds if there
is a low number of active sequences relative to the size of the sequence
diversity}. This is often the case but must be observed during the
experiment. With this assumption, p-values may be calculated for each
descriptor. These p-values do not assume normality and are a measure of
the overlap between the active sequences and inactive sequences. They
are calculated using a Wilcox t-test. A low p-value is considered
significant and such a desciptor may be considerd to be related to
activity. \bold{ Remember that a descriptor may be important in
connection to a motif}. Thus it is important to do both descriptors and
motif discovery.  \code{include.staistics} will calculate the p-values
for each of the descriptors. This is only practical for smaller lengths;
less than 10.

  If \code{base.frame} is \code{NA}, then the default will be used,
  \code{\link{defaultBaseMatrix}}. See the documentation on that dataset
  for more information.
  
  }
\section{Slots}{
  \describe{
    \item{\code{.Data}:}{Object of class \code{"list"} The descriptors
      as a \code{data.frame}. Each row is the desciptor set for a single
    sequence}
    \item{\code{response}:}{Object of class \code{"numeric"} An optional
    numeric array containing responses for the sequences.}
    \item{\code{names}:}{Object of class \code{"character"} The
      descriptor names (inherited from \code{data.frame}).}
    \item{\code{row.names}:}{Object of class \code{"data.frameRowLabels"}}
    \item{\code{.S3Class}:}{Object of class \code{"character"} }
    \item{\code{pvalues}:}{Object of class \code{"numeric"} An optional
      array containing estimated p-values for each descriptor. The
      p-value represents how different the descriptor set is as compared
      to a set of random peptides of the same length WITHOUT GAPS.}
  }
}
\section{Extends}{
Class \code{"\linkS4class{data.frame}"}, directly.
Class \code{"\linkS4class{list}"}, by class "data.frame", distance 2.
Class \code{"\linkS4class{oldClass}"}, by class "data.frame", distance 2.
Class \code{"\linkS4class{vector}"}, by class "data.frame", distance 3.
}

\author{
Andrew White
}


\seealso{
\code{\linkS4class{Sequences}}, \code{\link{defaultBaseMatrix}},
\code{\link{wilcox.test}}
}
\examples{

#calculate some descriptors
data(SHP2Sequences)

#turn off most of the descriptors so it goes fast
SHP2desc <- descriptors(SHP2Sequences, do.var=FALSE,
alags=c(), do.mean=TRUE, do.counts=FALSE,
do.position=FALSE, include.statistics=FALSE)


#plot them
plot(SHP2desc)


#get some descriptors and response sets
data(AMPSequences)
data(AMPSequences.response)

AMPdesc <- descriptors(AMPSequences, response=AMPSequences.response[,1], do.var=FALSE,
alags=c(), do.mean=TRUE, do.counts=FALSE,
do.position=FALSE, include.statistics=FALSE)

#plot with descriptors
plot(AMPdesc)


}
\keyword{classes}
\keyword{datagen}