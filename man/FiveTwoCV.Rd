\name{FiveTwoCV}
\alias{FiveTwoCV}
\docType{data}
\title{
FiveTwoCV
}
\description{
5x2 cross-validation. Described below is the default call.
}
\usage{FiveTwoCV(data, resp, modelFxn)}
\arguments{
  \item{data}{
    The data matrix input to the modelFxn. Each row is an observation,
    each column is a dimension.
  }
  \item{resp}{
    The response, or true values, which are compared with the modelFxn
  }
  \item{modelFxn}{
    A function which takes a call of the form \code{modelFxn(forumula,
      data)} and returns a model that can predict with a call of the form
    \code{predict(model, newdata)}, the standard \code{predict} call for
    S3 objects.
   }
}
\details{
This generic is for methods which split a data 5 times into a training
and validation set followed by calculation of the cross-validated
goodness-of-fit. For example, suppose you are fitting a non-linear model
and would like to ensure it is not overfitted. Calling this default generic
function will provide an R^2 value on unobserved data, thus providing a
measure of how well the model works on prediction as opposed to
regression.
}
\value{
The default method returns an R^2 goodness-of-fit on unobserved data
averaged over 5 splits of the data.
  }
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
#generate data, where only the first dimension is meaningful

npoints <- 15

x <- data.frame(x1=seq(0,1,1. / npoints), x2=sin(seq(0,2*pi,2 * pi /npoints)),
x3=seq(0,1,1/npoints)**3, x4=cos(seq(0, 100, 100 / npoints)) )

#The response is only a function of the first dimension
y <- sapply(x$x1, function(x) {2 * x + rnorm(1, mean=0, sd=0.1)})

#use linear fitting function
modelFxn <- lm

vfit <- FiveTwoCV(x,y,modelFxn)

rfit <- modelFxn(y ~. , data=x)

print(vfit)
summary(rfit)

#Notice the difference in R^2 value. The linear model regression says it
# fits the data very well, whereas the FiveTwoCV says it does not. Let's
# check.

train <- sample(nrow(x), size=nrow(x) / 2, replace=FALSE)
val <- setdiff(1:nrow(x), train)
model <- lm(y[train] ~ ., data=x[train,])
prd <- predict(model, x[val,])


plot(x[val,1], y[val], type="p", pch=19, ylim=c(min(c(y[val],prd)),
max(c(y[val], prd))), ylab="response", xlab="Dimension 1")
lines(x[val,1], prd, lwd=1.5, col="red")
legend("bottomright", c("predicted"), lty=c(1), col=c("red"))


}
\keyword{datasets}
