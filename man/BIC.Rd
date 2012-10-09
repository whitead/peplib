\name{BIC}
\alias{BIC}

\title{
Bayesian Information Content
}
\description{
Calculates the Bayesian Information Content
}
\usage{
BIC(object,...)
}

\arguments{
  \item{object}{
    A statistical model, including its data 
  }
  \item{...}{
    Additional arguments
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
