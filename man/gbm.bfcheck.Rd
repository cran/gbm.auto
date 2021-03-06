% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gbm.bfcheck.R
\name{gbm.bfcheck}
\alias{gbm.bfcheck}
\title{Calculates minimum Bag Fraction size for gbm.auto}
\usage{
gbm.bfcheck(samples, resvar, ZI = "CHECK", grv = NULL)
}
\arguments{
\item{samples}{Samples dataset, same as gbm.auto.}

\item{resvar}{Response variable column in samples.}

\item{ZI}{Are samples zero-inflated? TRUE/FALSE/"CHECK".}

\item{grv}{Dummy param for package testing for CRAN, ignore.}
}
\value{
Prints minimum Bag Fraction size for gbm.auto.
}
\description{
Provides minimum bag fractions for gbm.auto, preventing failure
due to bf & samples rows limit. Simon Dedman, 2016, simondedman@gmail.com,
GitHub.com/SimonDedman/gbm.auto
}
\examples{
data(samples)
gbm.bfcheck(samples = samples, resvar = "Cuckoo")
}
\author{
Simon Dedman, \email{simondedman@gmail.com}
}
