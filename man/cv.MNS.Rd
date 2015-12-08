\name{cv.MNS}
\alias{cv.MNS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Select regularization parameters via cross-validation
}
\description{
Select regularization parameters via K-fold cross-validation
}
\usage{
cv.MNS(dat, l1range, alpharange, 
    K = 5, parallel = FALSE, 
    cores = NULL, verbose = FALSE)
}
\arguments{
  \item{dat}{
List where each entry corresponds to the time series observations for each subject
}
  \item{l1range}{
Vector of candidate regularization parameters. See details below
}
  \item{alpharange}{
Vector of candidate weighting parameters. See details below.
}
  \item{K}{
Number of cross-validation folds
}
  \item{parallel}{
Indicate whether model fit should be done in parallel. Default is FALSE
}
  \item{cores}{
If fit in parallel, indicate how many units/cores should be used
}
  \item{verbose}{
Print progress. Only available for non-parallel implementation
}
}
\details{
Select regularization parameters via cross-validation. 
In the interest of simplicity we re-parameterize penalty as an elastic net penalty:
\deqn{
 \lambda * \alpha || \beta||_1 + \lambda * (1-\alpha) || \sigma||_1
}
Thus \eqn{\lambda} is the regularization parameter (specified by the \code{l1range} argument) 
and \eqn{\alpha} is the weighting parameter (specified by the \code{alpharange} argument).
}
\value{
\item{l1}{selected regularization parameter}
\item{alpha}{selected weighting parameter}
\item{CV}{grid of cross-validation error for each pair of regularization parameters}
}
\references{
Arlot, S., and Alain C. "A survey of cross-validation procedures for model selection." Statistics surveys 4 (2010): 40-79.

Monti, R., Anagnostopolus, C., Montana, G. "Inferring brain connectivity networks from functional MRI data via mixed neighbourhood selection", arXiv, 2015
}
\author{
Ricardo Pio Monti
}
\seealso{
\code{\link{MNS}}
}
\examples{
set.seed(1)
Dat = gen.Network(p = 10, Nsub = 5, 
 sparsity = .2, REsize=10, REprob=.5, 
 REnoise = 1, Nobs=20)
\dontrun{
CVs = cv.MNS(dat = Dat, l1range = seq(.1, .5, length.out=10),
 alpharange = seq(.2, .8, length.out = 5), 
 parallel = FALSE, verbose = TRUE)
}
}
\keyword{ cross-validation }
