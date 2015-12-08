\name{gen.Network}
\alias{gen.Network}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Simulate random networks for a population of subjects
}
\description{
Implementations of two methods through which to simulation multiple related networks. The first simulates
networks from a three-class population described in Danaher et al. (2014).
The second simulates networks according to method proposed in Monti et al. (2015).
For further details see the package vignette.
}
\usage{
gen.Network(method = "cohort", p,
    Nobs, Nsub, sparsity,
    REsize, REprob, REnoise)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{method}{
Network simulation method. One of either "Danaher" for the three-class method of Danaher et al. (2014) or "cohort" for the cohort
method described in Monti et al. (2015)
}
  \item{p}{
Number of nodes in network (i.e., this will be dimensionality of the resulting precision matrices)
}
  \item{Nobs}{
Number of observations per subject (assumed constant across subjects). If this is missing then only the precision matrices will be returned (i.e., random data is not simulated)
}
  \item{Nsub}{
Number of subjects for which to simulate networks. Note that this is set to 3 if method="Danaher"
}
  \item{sparsity}{
Sparsity level of precision matrices 
}
  \item{REsize}{
Number of random effects edges to add to each subject (only for method="cohort")
}
  \item{REprob}{
Probability with which a random edge added to each subject (only for method="cohort")
}
  \item{REnoise}{
Variability of random edges (only for method="cohort")
}
}
\details{
See package vignette for further details.
Alternatively see Danaher et al. (2014) or Monti et al. (2015)
}
\value{
\item{Networks}{List containing simulated netowrks where ith entry is the ith random network for the ith subject}
\item{Data}{List where ith entry is simulated data for ith subject}
\item{PopNet}{Population precision matrix (only if method="cohort")}
\item{RanNet}{Sparse support for random edges (only if method="cohort")}
}
\references{
Danaher, P., Wang, P. , and Witten, D. "The joint graphical lasso for inverse covariance estimation across multiple classes." Journal of the Royal Statistical Society: Series B (Statistical Methodology) 76.2 (2014): 373-397.

Monti, R., Anagnostopolus, C., Montana, G. "Inferring brain connectivity networks from functional MRI data via mixed neighbourhood selection", arXiv, 2015
}
\author{
Ricardo Pio Monti
}
\seealso{
\code{\link{MNS}}, \code{\link{cv.MNS}}, \code{\link{plot.MNS}}  
}
\examples{
# generate data according to cohort model of Monti et al. (2015)
set.seed(1)
Dat = gen.Network(p = 10, Nsub = 5, 
 sparsity = .2, REsize=10, REprob=.5, 
 REnoise = 1, Nobs=20)

\dontrun{
# plot simulated networks:
plot(Net, view="pop")
}
}
