\name{read.sequences}
\alias{read.sequences}
\title{
Read sequence file
}
\description{
This will read in a file of sequences and create a Sequences-class object.
}
\usage{
read.sequences(file, header = FALSE, sep = "",
quote = "\"", dec = ".", fill = FALSE,
comment.char = "", alphabet = aabet, remove.duplicates=FALSE,
weights=NULL)
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
\item{comment.char}{
   character: a character vector of length one containing a
          single character or an empty string.  Use \code{""} to turn off
          the interpretation of comments altogether.

}
  \item{alphabet}{
    The alphabet to use for the sequences. The default alphabet contains
  the canonical 20 amino acids, as well as B, Z, X, and \code{-}, where X is
  an unspecified residue and \code{-} is a gap.
}
\item{remove.duplicates}{
  Set to true to remove duplicate sequences.
}
\item{weights}{
  Positive weights to assign to \code{Sequences} object. Will be used in
  motif discovery and can be accessed in the \code{weights} slot of the
  \code{Sequences} object (\code{seqs@weights}).
}  
}
\details{
  See the details for \code{\link{read.table}} for more information about
  reading the file. The file format should be one sequence per line with
  no spaces between the residues. Note that your file could contain
  additional columns with experimental data, but the first column must
  contain the sequences. For example:
  
  ------------------------
  
  Sequences  Response\cr
  GFF-       1.0\cr
  RGD-       0.85\cr     
  GRFD      10.1 \cr
  -GFR       0.1 \cr
  FGRD       5.2\cr
  ------------------
  
  Each sequence should be the same length, thus
  \code{-} should be use to pad the sequences, as seen in the example. Use an alignment
  algorithm, such as Clustal, to align your sequences before reading.
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


\section{Warning}{
  As mentioned above, it is important to align your sequences before
  reading if they are of differing lengths. For example, use the online
  ClustalW2 algorithm available from the European Bioinformatics
  Institutes's website. 
  }

\seealso{
\code{\linkS4class{Sequences}}, \code{\link{read.fasta}}
}

\keyword{IO}
\keyword{file}
