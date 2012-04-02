\name{ROC}
\alias{ROC}
\title{
ROC
}
\description{
This builds a receiver-operator curve from a
\code{\linkS4class{MotifModel}}.
}
\usage{
ROC(model, seqs, classes, thresholdRange = NA)
}
\arguments{
  \item{model}{
    The model is a
    \code{\linkS4class{MotifModel}}, but any model which implements
    the \code{residuals} method as described in those two class
    documentation files can be used.
}
  \item{seqs}{
    An object of class \code{\linkS4class{Sequences}}
}
  \item{classes}{
    The true classes
}
  \item{thresholdRange}{
    The range of threshhold values to explore. 
}
}
\details{

The ROC is built by changing the \code{threshold}, which changes the
ratio of false positive and false negatives. Recall, that the ROC curve
is a plot of the false positive rate vs. the true positive rate. 
  
}
\value{
Returns a \code{data.frame} with two columns, a false positive
(\code{FP}) and a false negative (\code{FN}). 
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Andrew White
}



\seealso{
\code{\linkS4class{MotifModel}}
}
\examples{

data(SHP2Sequences)


#"True" classes, just really another way of classifying them
SHP2Fixed <- motifModel(SHP2Sequences)
clusters <- aclust(SHP2Sequences, 3)
classes <- changeClusterFormat(clusters)

ROC(SHP2Fixed, SHP2Sequences, classes)

}
\keyword{ regression }

