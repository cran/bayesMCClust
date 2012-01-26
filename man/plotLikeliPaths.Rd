\name{plotLikeliPaths}
\alias{plotLikeliPaths}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~

Plots Paths of Likelihoods And (Prior) Densities

}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Plots \emph{paths} of all sorts of likelihood and (prior) densities, like the log-likelihood, log posterior density, 
log classification likelihood and the entropy all including markings for the position of the maximum value, and 
further log prior densities for \eqn{\eta}, \eqn{\beta}, \eqn{\xi} and \eqn{e} (depending on availability/model 
type).  

}
\usage{
plotLikeliPaths(outList, from = 10, by = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{mcClust}}, \code{\link{dmClust}}, 
\code{\link{mcClustExtended}}, \code{\link{dmClustExtended}} or \code{\link{MNLAuxMix}}.
}
  \item{from}{
%%     ~~Describe \code{from} here~~
specifies number of MCMC draw where to start plotting from.
}
  \item{by}{
%%     ~~Describe \code{by} here~~
specifies with which 'step size' plotting should be done.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~

All these likelihoods and (prior) densities ware already calculated (for each MCMC draw) by \code{\link{mcClust}}, \code{\link{dmClust}}, 
\code{\link{mcClustExtended}}, \code{\link{dmClustExtended}} and \code{\link{MNLAuxMix}} and saved in \code{outList}.

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...

No value returned.

}
\references{
%% ~put references to the literature/web site here ~

Sylvia Fruehwirth-Schnatter, Christoph Pamminger, Andrea Weber and Rudolf Winter-Ebmer, (2011), 
"Labor market entry and earnings dynamics: Bayesian inference using 
mixtures-of-experts Markov chain clustering". 
\emph{Journal of Applied Econometrics}. DOI: 10.1002/jae.1249 
\url{http://onlinelibrary.wiley.com/doi/10.1002/jae.1249/abstract}

Christoph Pamminger and Sylvia Fruehwirth-Schnatter, (2010), 
"Model-based Clustering of Categorical Time Series". 
\emph{Bayesian Analysis}, Vol. 5, No. 2, pp. 345-368. DOI: 10.1214/10-BA606  
\url{http://ba.stat.cmu.edu/journal/2010/vol05/issue02/pamminger.pdf}

}
\author{
%%  ~~who you are~~
Christoph Pamminger <christoph.pamminger@gmail.com>
}
\note{
%%  ~~further notes~~

Note, that in contrast to the literature (see \bold{References}), the numbering (labelling) of the states of the 
categorical outcome variable (time series) in this package is sometimes \eqn{0,\ldots,K}{0,...,K} (instead of 
\eqn{1,\ldots,K}{1,...,K}), however, there are \eqn{K+1} categories (states)!    

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{mcClust}}, \code{\link{dmClust}}, \code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}, \code{\link{MNLAuxMix}}
}
\examples{
# please run the examples in mcClust, dmClust, mcClustExtended, 
# dmClustExtended, MNLAuxMix
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
