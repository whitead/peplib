\name{classify}
\alias{classify}

\title{
classify
}
\description{
  A generic classification of data with a model
}
\usage{
classify(model, ...)
}

\arguments{
  \item{model}{
    The model to use for classification.
  }
  \item{...}{
    Additional parameters specific to each class.
    }

}
\details{
  See individual class documentation for implementation information.
}
\value{
An array with integers representing the classes. A positive number
  indicates a class. A negative number indicates no class.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Andrew White
}

\seealso{
\code{\linkS4class{MotifModelSet}}
}

\keyword{ regression }
\keyword{ models } 
