\name{MotifModel-class}
\Rdversion{1.1}
\docType{class}
\alias{MotifModel-class}
\alias{MotifModel}
\alias{motifModel}
\alias{plot,MotifModel-method}
\alias{BIC,MotifModel-method}
\alias{predict,MotifModel-method}
\alias{print,MotifModel-method}
\alias{residuals,MotifModel-method}
\alias{motifString,MotifModel-method}
\alias{plotFits,MotifModel-method}
\alias{plotPositions,MotifModel-method}
\alias{logLik,MotifModel-method}
\alias{logLik,OOPS-method}
\alias{logLik,ZOOPS-method}
\alias{logLik,SSOOPS-method}
\alias{plotStartingPosition,MotifModel-method}
\alias{plotStartingPosition}
\alias{plotFits}
\alias{plotPositions}
\alias{motifString}

\title{Class "MotifModel"}
\description{
This is a simple implementation of the MEME motif finding algorithm. The
MEME algorithm uses an Expectation-Maximization search for motifs on
sequences (\code{\linkS4class{Sequences}}). It requires a choice of the
motif length. For multiple motifs see \code{\link{MotifModelSet}}
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{motifModel(seqs,
  type="fixed", width=4)}
}

\section{Arguments}{

  \describe{

    \item{\code{seqs}}{ A \code{\linkS4class{Sequences}} object which
      contains the sequences to be fit}
    \item{\code{type}}{Can be \code{"fixed"}, \code{"variable"}, or
      \code{"optional"}. \code{"fixed"} means there is a single motif at
      the same position in all sequences. \code{"variable"} means there
      is a single motif at a different position in each
      sequence. \code{"optional"} means there is a single motif or no
      motif at each sequence in a variable position.}
      
    \item{\code{width}}{The number of residues in the motif, the width
      of the motif.}
    
    }
  }

\section{Slots}{
  \describe{
    \item{\code{mmodel}:}{Object of class \code{"matrix"} The motif,
  represented as a matrix. Each element in the matrix is the likelihood
  of that residue being in the position. The rows are the residue type
  and the columns are the position in the motif.   }
    \item{\code{bmodel}:}{Object of class \code{"numeric"} The
  background model is the model which generates the non-motif
  residues. The data is the probability of each residue type.}
    \item{\code{width}:}{Object of class \code{"integer"} The width is
  the number of residues in the motif }
    \item{\code{seqs}:}{Object of class \code{"Sequences"} The sequence
  to which the motifs are being fit. }
    \item{\code{np}:}{Object of class \code{"integer"} The number of
  parameters in the model, used for calculating the BIC }
  }
}
\section{Methods}{
  \describe{
    \item{plot}{\code{signature(x,...)}: Plots varying descriptive graphs
      of the motif model. The first thing plotted is the likelihood of the
      motif starting in each possible position. This is marginal over all
      sequences. Next, the likelihood of each residue is plotted in a series
      of plots representing each position in the motif. Last, the likelihood
      of each sequence from the motif model is plotted.}
    \item{predict}{\code{predict(object,newSequences=object@seqs)}:
      Calculates the likelihood for each sequence being generated from the
      motif model. This is useful for checking for outliers or ensuring the
      motif model fits the data. Passing new sequences in allows
      classification of new sequences. }
    
    \item{print}{\code{print(object)}: Prints information about the
      motif model, including the motif string. The motif string is
      simply all residues with greater than 15\% probability in
      decreasing order with a max of 4 (since \code{15*5 > 100}). So,
      [R][GF][GFRD] indicates that only R has a greater than 15\%
      probability in position 1. In position 2, only G and F do, with G
      having a higher probability than F.  In position 3, G, F, R and D
      all have over 15\% probability of occuring. }
    
    \item{residuals}{\code{residuals(model, seqs=model@seqs,
	classes=rep(0,nrow(seqs)), threshold = 0)}: This method classifies
      \code{seqs} and calculates the number of false positives, false
      negatives, and a measure of accuracy between 0 and
      1. \code{classes} should be the true classes for each sequence, where
      a negative number means it is not in the model and a positive number
      or 0 means it is in the model. The default is all in the model. The
      log-likelihood for each sequence according to the model is calculated
      and if it is greater than the \code{threshold}, the sequence is classified as
      in the model. These predictions are tested against the true
      \code{classes} passed to the method. The default value for
      \code{classes} is all sequences belong in the model. The
      log-likelihood for each sequence according to the model is calculated
      and if it is greater than the \code{threshold}, the sequence is classified as
      in the model. These predictions are tested against the true
      \code{classes} passed to the method.}
    \item{BIC}{\code{BIC(object)}: Calculates the Bayesian Information Content of the motif
      model. See \code{\link{BIC}} for more information.}
    \item{logLik}{\code{logLik(model)}: This method calculates the
      (expected) log-likelihood of the motif model.}
    \item{motifString}{\code{motifString(model)}: The motif string is
      simply all residues with greater than 15\% probability in
      decreasing order with a max of 4 (since \code{15*5 > 100}). So,
      [R][GF][GFRD] indicates that only R has a greater than 15\%
      probability in position 1. In position 2, only G and F do, with G
      having a higher probability than F.  In position 3, G, F, R and D
      all have over 15\% probability of occuring.}
    \item{plotFits}{\code{plotFits(model)}: A barplot of the
	log of the ratio of the likelihood of each sequence in the model
	relative to the background distribution. A positive value
	indicates a good fit to the motif and a negative value means
	the sequence fits the background (randomly occurring sequence)
	better.}
   \item{plotPositions}{\code{plotPositions(model)}: A grid of plots
     showing the motif probability distribution at each motif position.
     The three most likely amino acids/residues at each position are
     annotated on the plots.}
   \item{plotStartingPosition}{\code{plotStartingPosition(model)}:  A
     barplot showing the likelihood of the motif starting at each
     position. So that 0.3 in the first position means there is a 30\% likelihood
     of the motif starting in the first position}
 }
}

\references{
Bailey, T. L. Ph.D. thesis, University of California at San Diego, 1995.
}
\author{
Andrew White
}

\seealso{
  \code{\linkS4class{Sequences}}
}
\examples{
\dontrun{
#get sequence data
data(TULASequences)


#Create a fixed and optional type model
TULAFixed <- motifModel(TULASequences)
print(TULAFixed)
plotPositions(TULAFixed)

TULAOpt <- motifModel(TULASequences, type="optional")
print(TULAOpt)
plotPositions(TULAOpt)


#Something more interesting, cluster the data, fit two motif models, and
# then calculate the residuals

clusters <- aclust(dist(TULASequences), 2)

TULA.M1 <- motifModel(TULASequences[clusters[[1]],], type="fixed")
TULA.M2 <- motifModel(TULASequences[clusters[[2]],], type="fixed")

#Goodness of fit for model 1 and then using model 1 on the sequences in
# model 2, which is obviously a bad fit

#get threshold by including all sequences, no matter how bad the fit is.

threshold <- min(predict(TULA.M1))
print(threshold)

print(residuals(TULA.M1), threshold=threshold)
print(residuals(TULA.M1, seqs=TULA.M2@seqs, threshold=threshold))
}
}

\keyword{classes}
\keyword{regression}
