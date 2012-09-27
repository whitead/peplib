\name{write.fasta}
\alias{write.fasta}

\title{
Write out the sequences as a FASTA file
}
\description{
Write out the given sequences as a FASTA file
}
\usage{
write.fasta(seqs, motifModel = NULL, file = "", eol = "\n")
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
  \item{eol}{
    End of line character
}
}
\details{
  If a \code{\linkS4class{MotifModel}} is passed, then the motifs are
  extracted from the sequences and only those are output. Otherwise, the
  complete sequences are written.
}
\author{
Andrew White
}

\seealso{
\code{\linkS4class{Sequences}}, \code{\linkS4class{MotifModel}}, \code{\link{write.sequences}}.
}

\keyword{ IO }
\keyword{ file }
