Peptide Library Analysis Methods
=========================

This package provides a variety of methods for dealing with analysis
of peptide library data, including clustering, motif finding, and QSAR
model fitting. It is for the R programming language and is described
in a [recent paper](http://pubs.acs.org/doi/full/10.1021/ci300484q).

Installing From Source (preferred)
----------

To install the latest version from the source here, use:

    wget https://github.com/whitead/peplib/archive/master.zip
    unzip master.zip && rm master.zip
    R CMD build peplib-master
    sudo R CMD INSTALL peplib_*.tar.gz




Installing From CRAN
------------------
To install from CRAN, type the following command from 
an R session

    install.packages("peplib")


Loading Sequences
--------------------
The easiest way to load sequences is to use the `read.sequences` method.

    seq <- read.sequences("seqfile.txt")

where `seqfile.txt` looks like:

    FDDSDF
    FDSA
    GGHIT

For most of the methods, it's recommended to have the same length for all sequences.

Calculating Peptide Descriptors
----------------------------

To calculate descriptors on your sequences, use:

    seq.desc <- simpleDescriptors(seq)

That will calculate about 10 descriptors. To calculate a few hundred, type

    seq.desc <- descriptors(seq)

These descriptors are all relative to glycine. So, for example,
molecular weight is not the actual molecular weight but the difference
between a given amino acid and glycine. 

Plotting Sequences
--------------------

One nice feature of peplib is the ability to plot sequences with a
combination of a finding the substitution distance between sequences
and then projecting that distance matrix to 2 dimensions. This may be
done like so:

    plot(seq)
    
This method also clusters your sequences assuming that there are 3 clusters. That may be changed by adding one argument:

    plot(seq, 1)
    plot(seq, 5)
