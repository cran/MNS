\name{MNS}
\alias{MNS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Mixed Neighbourhood Selection
}
\description{
Estimate multiple related graphical models using the 
mixed neighbourhood selection (MNS) algorithm. 
}
\usage{
MNS(dat, lambda_pop, lambda_random, 
    parallel = FALSE, cores = NULL, 
    max_iter = 100, tol = 1e-05)
}
\arguments{
  \item{dat}{
  List where each entry corresponds to the time series observations for each subject
}
  \item{lambda_pop}{
Regularization parameter applied to fixed effects components. See details below for more information
}
  \item{lambda_random}{
Regularization parameter applied to the standard deviations of random effect effects. See details below for more information
}
  \item{parallel}{
Indicate whether model fit should be done in parallel. Default is FALSE}
  \item{cores}{
If fit in parallel, indicate how many cores should be used
}
  \item{max_iter}{
Maximum number of iterations in EM algorithm. See details below for more information
}
  \item{tol}{
Convergence tolerance in EM algorithm
}
}
\details{
The MNS algorithm is an extension of neighbourhood selection to the scenario where the objective
is to learn multiple related Gaussian graphical models. 
For further details see Monti et al. (2015).
}
\value{
\item{PresPop}{Population connectivity matrix - encodes the sparse support structure of population precision}
\item{PresRE}{Network of highly variable edges - encodes the sparse support structure of highly variable edges}
\item{PresBLUP}{Array containing predicted subject specific deviations from population connectivity.}
\item{it}{Iterations to fit MNS model (one per node)}
}
\references{
Monti, R., Anagnostopolus, C., Montana, G. "Inferring brain connectivity networks from functional MRI data via mixed neighbourhood selection", arXiv, 2015
}
\author{
Ricardo Pio monti
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{cv.MNS}}, \code{\link{plot.MNS}}
}
\examples{
set.seed(1)
N=4
Net = gen.Network(method = "cohort", p = 10, 
                       Nsub = N, sparsity = .2, 
                       REsize = 20, REprob = .5,
                       REnoise = 1, Nobs = 10)
\dontrun{
mns = MNS(dat = Net$Data, lambda_pop = .1, lambda_random = .1, parallel = TRUE)
# plot results:
plot(mns) # plot population network
plot(mns, view="var") # plot variance network
plot(mns, view="sub") # plot subject networks (note red edges here are variable edges!)

}
}
\keyword{ MNS }
