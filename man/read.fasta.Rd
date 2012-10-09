\name{read.fasta}
\alias{read.fasta}

\title{
Read in sequences in FASTA format
}
\description{
Read in sequences in FASTA format
}
\usage{
read.fasta(file, header = FALSE, sep = "", quote = "\"", dec = ".", fill
= FALSE, alphabet = aabet)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{file}{
       the name of the file which the data are to be read from.
          Each row of the table appears as one line of the file.  If it
          does not contain an _absolute_ path, the file name is
          _relative_ to the current working directory, \code{getwd()}.
          Tilde-expansion is performed where supported.  As from R
          2.10.0 this can be a compressed file (see \code{file}).

          Alternatively, \code{file} can be a readable text-mode
          \code{connection} (which will be opened for reading if necessary,
          and if so \code{close}d (and hence destroyed) at the end of the
          function call).  (If \code{stdin()} is used, the prompts for lines
          may be somewhat confusing.  Terminate input with a blank line
          or an EOF signal, \code{Ctrl-D} on Unix and \code{Ctrl-Z} on Windows.
          Any pushback on \code{stdin()} will be cleared before return.)

          \code{file} can also be a complete URL.
	}
	\item{header}{
	  a logical value indicating whether the file contains the
          names of the variables as its first line.  If missing, the
          value is determined from the file format: \code{header} is set to
          \code{TRUE} if and only if the first row contains one fewer field
          than the number of columns.
	  
	}
	\item{sep}{
	  the field separator character.  Values on each line of the
          file are separated by this character.  If \code{sep = ""} (the
          default for \code{read.table}) the separator is \code{white space},
          that is one or more spaces, tabs, newlines or carriage
          returns.
	}
	\item{quote}{
	  the set of quoting characters. To disable quoting altogether,
          use \code{quote = ""}.  See \code{\link{scan}} for the behavior on quotes
          embedded in quotes.  Quoting is only considered for columns
          read as character, which is all of them unless \code{colClasses}
          is specified.
	}
	\item{dec}{
	  the character used in the file for decimal points.
	}
	\item{fill}{
	  logical. If \code{TRUE} then in case the rows have unequal length,
	  blank fields are implicitly added.  
	}
	\item{alphabet}{
	  The alphabet to use for the sequences. The default alphabet contains
	  the canonical 20 amino acids, as well as B, Z, X, and \code{-}, where X is
	  an unspecified residue and \code{-} is a gap. 
	}
      }
    
\details{
  See the details for \code{\link{read.table}} for more information about
  reading the file itself. Information about the FASTA form may be found
  elsewhere, but basically each sequence starts with a definition/name
  deliminated by a '<' character. For example:
  \cr
  ----------------------\cr
  >Sequence 1, from mouse\cr
  FTRP\cr
  >Sequence 2b, from humans\cr
  FPYT\cr
  >Unkown origin\cr
  FPRW\cr
  -----------------------\cr
  Each sequence should be the same length, thus
  \code{-} should be use to pad the sequences, as seen in the example. Use an alignment
  algorithm, such as Clustal, to align your sequences before reading. The
  ClustalW2 algorithm is available from the European Bioinformatics
  Institutes's website. 
}

\value{
An object of class \code{\linkS4class{Sequences}}. This is a small
  extension of the matrix class, and as expected, each row of the matrix
  corresponds to a single sequence. The sequences are always represented
  as integers. The rownames of the matrix are the original string/character
  representations of the sequences.
}

\author{
Andrew White
}

\seealso{
\code{\linkS4class{Sequences}}, \code{\link{read.sequences}}
}

\keyword{IO}
\keyword{file}
