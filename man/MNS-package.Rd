\name{MNS-package}
\alias{MNS-package}
\alias{MNS-package}
\docType{package}
\title{
Mixed Neighbourhood Selection package
}
\description{
An R package for estimating multiple, related grapical models using the Mixed Neighbourhood Selection algorithm.
This package also includes two algorithm through which to simulate multiple, related graphical models which
demonstrate some of the properties reported through empirical studies of functional connectivity networks.
}
\details{
\tabular{ll}{
Package: \tab MNS\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-10-14\cr
License: \tab GPL-2\cr
}
%~~ An overview of how to use the package, including the most important ~~
%~~ functions ~~
}
\author{
Ricardo Pio Monti
}
\references{
Monti, R., Anagnostopolus, C., Montana, G. "Inferring brain connectivity networks from functional MRI data via mixed neighbourhood selection", arXiv, 2015
}
\keyword{ package }
\seealso{
\code{\link{MNS}}, \code{\link{cv.MNS}}, \code{\link{plot.MNS}}, \code{\link{gen.Network}}
}
\examples{
set.seed(1)
N=4
Net = gen.Network(method = "cohort", p = 10, 
                       Nsub = N, sparsity = .2, 
                       REsize = 20, REprob = .5,
                       REnoise = 1, Nobs = 10)
\dontrun{
# plot simulated networks:
plot(Net, view="pop")

# run MNS algorithm:
mns = MNS(dat = Net$Data, lambda_pop = .1, lambda_random = .1, parallel = TRUE)

# plot results from MNS algorithm:
plot(mns) # plot population network
plot(mns, view="var") # plot variance network
plot(mns, view="sub") # plot subject networks (note red edges here are variable edges!)
}
}
