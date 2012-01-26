\name{calcLongRunDist}
\alias{calcLongRunDist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Calculates And Plots the Long-Run Distribution Over the Categories of the Outcome Variable After Certain Periods.
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Calculates and plots the posterior expectation of the cluster-specific 'long-run' distribution over the categories 
of the outcome variable after a period of certain time units \eqn{t} in the various clusters starting at a specified 
initial state vector (corresponding to \eqn{t=0}). The calculation is based on the transition matrices for each 
cluster/group. It includes also the stationary distribution (\eqn{t=\infty}{t=Inf}).  

}
\usage{
calcLongRunDist(outList, initialStateData, class, equiDist, 
                thin = 1, maxi = 50, M0 = outList$Mcmc$M0, 
                printLongRunDist = TRUE, 
                grLabels = paste("Group", 1:outList$Prior$H) )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{mcClust}}, \code{\link{dmClust}}, 
\code{\link{mcClustExtended}} or \code{\link{dmClustExtended}}.
}
  \item{initialStateData}{
%%     ~~Describe \code{initialStateData} here~~
A vector of length \eqn{N} containing the initial states where to start from.
}
  \item{class}{
%%     ~~Describe \code{class} here~~
A vector of length \eqn{N} containing the group membership returned by \code{\link{calcAllocations}}.
}
  \item{equiDist}{
%%     ~~Describe \code{equiDist} here~~ 
A matrix of dimension \eqn{(K+1) \times H }{(K+1) x H} containing the stationary distributions (steady states) of 
the Markov chains (outcome variable) in the various clusters returned by \code{\link{calcEquiDist}}. 
} 
  \item{thin}{
%%     ~~Describe \code{thin} here~~
An integer specifying the thinning parameter (default is 1).
}
  \item{maxi}{
%%     ~~Describe \code{maxi} here~~
specifies the number of draws to be actually taken (after thinning) from the MCMC draws beginning from the end of the 
chain (default is 50).
}
  \item{M0}{
%%     ~~Describe \code{M0} here~~
specifies the number of the first MCMC draw after burn-in (default is \code{outList$Mcmc$M0}).
}
  \item{printLongRunDist}{
%%     ~~Describe \code{printLongRunDist} here~~
If \code{TRUE} (default) a LaTeX-style table containing the long-run distribution for each cluster/group is generated.
}
  \item{grLabels}{
%%     ~~Describe \code{grLabels} here~~
A character vector giving user-specified names for the clusters/groups.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~

A barplot of the long-run distributions is drawn for each cluster/group, including also the stationary distribution 
(steady state). 

The last \code{maxi} MCMC draws of each \code{thin}-th draw are taken for calculations.

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
A list containing the long-run distributions for each cluster/group.
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
\code{\link{calcAllocations}}, \code{\link{calcEquiDist}}, \code{\link{mcClust}}, \code{\link{dmClust}}, \code{\link{mcClustExtended}}, 
\code{\link{dmClustExtended}}, \code{\link[gplots]{barplot2} }
}
\examples{
# please run the examples in mcClust, dmClust, mcClustExtended, 
# dmClustExtended
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
