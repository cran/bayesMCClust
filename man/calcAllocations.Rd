\name{calcAllocations}
\alias{calcAllocations}
\alias{calcAllocationsMCC}
\alias{calcAllocationsMCCExt}
\alias{calcAllocationsDMC}
\alias{calcAllocationsDMCExt}
\alias{calcAllocationsMNL}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Computes Group Sizes, Group Membership and Individual Posterior Classification Probabilities
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Computes (estimates) group sizes, group membership and individual posterior classification probabilities based on 
the outcome of a specificed MCMC run of either \code{\link{mcClust}}, \code{\link{mcClustExtended}}, 
\code{\link{dmClust}} or \code{\link{dmClustExtended}} as well as \code{\link{MNLAuxMix}}. 

}
\usage{
calcAllocationsMCC(outList, thin = 1, maxi = 50, 
                   M0 = outList$Mcmc$M0, plotPathsForEta = TRUE)
calcAllocationsMCCExt(outList, thin = 1, maxi = 50, 
                   M0 = outList$Mcmc$M0)
calcAllocationsDMC(outList, thin = 1, maxi = 50, 
                   M0 = outList$Mcmc$M0, plotPathsForEta = TRUE)
calcAllocationsDMCExt(outList, thin = 1, maxi = 50, 
                   M0 = outList$Mcmc$M0)
calcAllocationsMNL(outList, thin = 1, maxi = 50, 
                   M0 = outList$Mcmc$M0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{mcClust}}, \code{\link{dmClust}}, 
\code{\link{mcClustExtended}}, \code{\link{dmClustExtended}} or \code{\link{MNLAuxMix}}.
}
  \item{thin}{
%%     ~~Describe \code{thin} here~~
An integer specifying the thinning parameter (default is 1).
}
  \item{maxi}{
%%     ~~Describe \code{maxi} here~~
specifies the number of draws to be actually taken (after thinning) from the MCMC draws beginning from the end of the 
chain (default is 50), except for mixing proportions/weights \eqn{\eta} where all \code{thin}-th draws beginning at 
\code{M0} are used.
}
  \item{M0}{
%%     ~~Describe \code{M0} here~~
specifies the number of the first MCMC draw after burn-in (default is \cr 
\code{outList$Mcmc$M0}).
}
  \item{plotPathsForEta}{
%%     ~~Describe \code{plotPathsForEta} here~~
If \code{TRUE} (default) paths of the MCMC draws of the mixing proportions/weights \eqn{\eta} (corresponding to 
group sizes) are drawn. 
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~

The last \code{maxi} MCMC draws of each \code{thin}-th draw are taken for calculations, except for mixing 
proportions \eqn{\eta} (which are part of MCC and DMC \emph{without} MNL extension) where \emph{all} \code{thin}-th 
draws beginning at \code{M0} are used. 

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
    
%%  return( invisible( allocList <- list(estGroupSize=estGroupSize, class=class, classProbs=cp2) ) )

A list containing:
\item{estGroupSize }{A vector of dimension \eqn{H} containing the posterior mean of group sizes. For MCC and DMC 
    \emph{without} MNL extension \code{estGroupSize} contains the mixing proportions/weights \eqn{\hat{\eta}}. In these cases 
    each \code{thin}-th MCMC draw beginning at \code{M0} (after burn-in) is used for calculation. For MCC and DMC 
    \emph{with} MNL extension and \code{MNLAuxMix} the group sizes are calculated based on the individual posterior 
    classification probabilities which are calculated using the last \code{maxi} draws of each \code{thin}-th MCMC draw.}
\item{class }{A vector of length \eqn{N} containing the group membership, which is determined for each individual 
    according to the \emph{maximum} individual posterior classification probability.}
\item{classProbs }{A matrix with dimension \eqn{N \times H}{N x H} containing the individual posterior classification 
    probabilities which are calculated using the last \code{maxi} draws of each \code{thin}-th MCMC draw.}

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

The last \code{maxi} MCMC draws of each \code{thin}-th draw are taken for calculations, except for mixing 
proportions \eqn{\eta} (which are part of MCC and DMC \emph{without} MNL extension) where all \code{thin}-th draws 
beginning at \code{M0} are used. 

Note, that in contrast to the literature (see \bold{References}), the numbering (labelling) of the states of the 
categorical outcome variable (time series) in this package is sometimes \eqn{0,\ldots,K}{0,...,K} (instead of 
\eqn{1,\ldots,K}{1,...,K}), however, there are \eqn{K+1} categories (states)!    

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{mcClust}}, \code{\link{dmClust}}, \code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}, 
\code{\link{MNLAuxMix}}
}
\examples{
# please run the examples in mcClust, dmClust, mcClustExtended, 
# dmClustExtended, MNLAuxMix
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ classif }
%%\keyword{ ~kwd3 }% __ONLY ONE__ keyword per line
