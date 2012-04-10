\name{BIC}
\alias{BIC}

\title{
BIC
}
\description{
Calcualtes the Bayesian Information Content
}
\usage{
BIC(object)
}
\arguments{
  \item{obejct}{
    A statistical model, including its data 
}
}
\details{
  The BIC is calculated as \code{-2 * logLik + k * log(n)}, where \code{k} is the number of
  parameters and \code{n} is the number of independent observations. \code{logLik} is the
  log-likelihood.
 }
\value{
  The BIC
}

\author{
Andrew White
}

\seealso{
\code{\linkS4class{MotifModelSet}}
}

\keyword{ regression }
\keyword{ model }