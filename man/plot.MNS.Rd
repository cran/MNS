\name{plot.MNS}
\alias{plot.MNS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Plotting function for MNS objects
}
\description{
  Plotting function for MNS objects. This function implements plotting for either population networks,
  high variable networks or subject-specific networks.
}
\usage{
  \method{plot}{MNS}(x, view="pop", subID=NULL, ...) 
}
\arguments{
  \item{x}{
    MNS object
  }
  \item{view}{
    Plotting view. This argument defines which networks are plotted. Three options are
    "pop": plot population network, "var": plot network of variable edges, "sub": plot subject-specific networks
  }
  \item{subID}{
    If view="sub", subID indicates which subjects networks should be plotted.
  }
  \item{...}{
    Additional arguments to pass to plot function
  }
}
\details{
  Plotting function for MNS objects. Can be used to plot simulated networks or results obtained from running 
  MNS algorithm.
  Note that if networks are simulated using the \code{"Danaher"} method then only subject-specific networks can be plotted (i.e., we require \code{view="sub"})
}
\references{
  Monti, R., Anagnostopolus, C., Montana, G. "Inferring brain connectivity networks from functional MRI data via mixed neighbourhood selection", arXiv, 2015
}
\author{
  Ricardo Pio monti
}
\seealso{
  \code{\link{MNS}}, \code{\link{gen.Network}}
}
\examples{
set.seed(1)
N=4
Net = gen.Network(method = "cohort", p = 10, 
                       Nsub = N, sparsity = .2, 
                       REsize = 20, REprob = .5,
                       REnoise = 1, Nobs = 10)
\dontrun{
# can plot simulated networks:
plot.MNS(Net, view="pop")

# can also plot results from MNS algorithm:
mns = MNS(dat = Net$Data, lambda_pop = .1, lambda_random = .1, parallel = TRUE)
plot.MNS(mns) # plot population network
plot.MNS(mns, view="var") # plot variance network
plot.MNS(mns, view="sub") # plot subject networks (note red edges here are variable edges!)
}

}
\keyword{ MNS }
