\name{defaultBaseMatrix}
\alias{defaultBaseMatrix}
\docType{data}
\title{
defaultBaseMatrix
}
\description{
This dataset is a matrix of decsriptors for each amino acid. It is used
for creating the desrciptors of peptide sequences.
}
\usage{data(defaultBaseMatrix)}
\format{
  A data frame with 24 observations on the following 53 variables.
  \describe{
    \item{\code{naAromAtom}}{Number of aromatic atoms}
    \item{\code{nAromBond}}{Number of aromatic bonds}
    \item{\code{MW}}{molecular weight}
    \item{\code{nRotB}}{number of rotatable bonds}
    \item{\code{apol}}{polarizability}
    \item{\code{bpol}}{the sum of the absolute value of the difference between atomic polarizabilities of all bonded atoms in the molecule (including implicit hydrogens).}
    \item{\code{PPSA.1}}{combination of surface area and partial charge}
    \item{\code{PPSA.2}}{a combination of surface area and partial charge}
    \item{\code{PPSA.3}}{a combination of surface area and partial charge}
    \item{\code{PNSA.1}}{a combination of surface area and partial charge}
    \item{\code{PNSA.2}}{a combination of surface area and partial charge}
    \item{\code{PNSA.3}}{a combination of surface area and partial charge}
    \item{\code{DPSA.1}}{a combination of surface area and partial charge}
    \item{\code{DPSA.2}}{a combination of surface area and partial charge}
    \item{\code{DPSA.3}}{a combination of surface area and partial charge}
    \item{\code{FPSA.1}}{a combination of surface area and partial charge}
    \item{\code{FPSA.2}}{a combination of surface area and partial charge}
    \item{\code{FPSA.3}}{a combination of surface area and partial charge}
    \item{\code{FNSA.1}}{a combination of surface area and partial charge}
    \item{\code{FNSA.2}}{a combination of surface area and partial charge}
    \item{\code{FNSA.3}}{a combination of surface area and partial charge}
    \item{\code{WPSA.1}}{a combination of surface area and partial charge}
    \item{\code{WPSA.2}}{a combination of surface area and partial charge}
    \item{\code{WPSA.3}}{a combination of surface area and partial charge}
    \item{\code{WNSA.1}}{a combination of surface area and partial charge}
    \item{\code{WNSA.2}}{a combination of surface area and partial charge}
    \item{\code{WNSA.3}}{a combination of surface area and partial charge}
    \item{\code{RPCG}}{a combination of surface area and partial charge}
    \item{\code{RNCG}}{a combination of surface area and partial charge}
    \item{\code{RPCS}}{a combination of surface area and partial charge}
    \item{\code{RNCS}}{a combination of surface area and partial charge}
    \item{\code{THSA}}{a combination of surface area and partial charge}
    \item{\code{TPSA}}{a combination of surface area and partial charge}
    \item{\code{RHSA}}{a combination of surface area and partial charge}
    \item{\code{RPSA}}{a combination of surface area and partial charge}
    \item{\code{nHBDon}}{number of hydrogen bond donors}
    \item{\code{nHBAcc}}{number of hydrogen bond acceptors}
    \item{\code{TopoPSA}}{Topological polar surface area based on fragment contributions}
    \item{\code{XLogP}}{An estimate of the \code{logP} partition coefficient}
    \item{\code{fragC}}{a numeric vector}
    \item{\code{count.AcidicGroups}}{number of acidic groups}
    \item{\code{count.BasicGroups}}{number of basic groups}
    \item{\code{ALogP}}{atom additive logP and molar refractivity values as described by Ghose and Crippen}
    \item{\code{ALogp2}}{atom additive logP and molar refractivity values as described by Ghose and Crippen}
    \item{\code{AMR}}{atom additive logP and molar refractivity values as described by Ghose and Crippen}
    \item{\code{WPATH}}{Wiener path number and Wiener polarity number}
    \item{\code{WPOL}}{Wiener path number and Wiener polarity number}
    \item{\code{PetitjeanNumber}}{Petitjean Number}
    \item{\code{helix}}{how helical the amino acid is.}
    \item{\code{pdbhelix}}{how helical a amino acid is using data derived
      from the protein databank}
    \item{\code{CaSD}}{The solvation density near the C-alpha carbon on
      the amino acid}
    \item{\code{nHBDon.1}}{}
    \item{\code{nHBAcc.1}}{}
  }
}
\details{
See \code{\linkS4class{Descriptors-class}} for details. The descriptors
were calculated using CDK.
}
\seealso{
\code{\linkS4class{Descriptors-class}}
 }

\keyword{datasets}
