\name{write.sequences}
\alias{write.sequences}

\title{
Write out the sequences as a sequence file
}
\description{
Write out the given sequences as a sequence file
}
\usage{
write.sequences(seqs, motifModel = NULL, file = "", append = FALSE, sep = " ", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE, qmethod = c("escape", "double"), fileEncoding = "")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{seqs}{
    \code{\linkS4class{Sequences} object containing sequences to be written
}
  \item{motifModel}{
    An optional \code{\linkS4class{MotifModel}} fit to the
    \code{\linkS4class{Sequences}}. This make it so that only the motifs
    are output!
}
  \item{file}{
    Path to file where sequences will be written
}
  \item{append}{
    logical. Only relevant if \code{file} is a character string. If \code{TRUE},
    the output is appended to the file. If \code{FALSE}, any existing file of
    the name is destroyed.
}
  \item{eol}{
    End of line character
}
\details{
  If a \code{\linkS4class{MotifModel}} is passed, then the motifs are
  extracted from the sequences and only those are output. Otherwise, the
  complete sequences are written. The format used is one sequence per line.
}
\author{
Andrew White
}

\seealso{
\code{\linkS4class{Sequences}}, \code{\linkS4class{MotifModel}}, \code{\link{write.sequences}}.
}

\keyword{ IO }
\keyword{ file }
