\name{calcTransProbs}
\alias{calcTransProbs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Calculates the Posterior Expectation and Standard Deviations of the Average Cluster-Specific Transition Matrices
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Calculates the posterior expectation and standard deviations of the average cluster-specific transition matrices and 
also offers some other analyses like plotting paths of MCMC draws.  

}
\usage{
calcTransProbs(outList, estGroupSize, thin = 1, M0 = outList$Mcmc$M0, 
               grLabels = paste("Group", 1:outList$Prior$H), 
               printXtable = FALSE, printSd = FALSE, 
               printTogether = TRUE, plotPaths = TRUE, 
               plotPathsForE = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{mcClust}}, \code{\link{dmClust}}, 
\code{\link{mcClustExtended}} or \code{\link{dmClustExtended}}.
}
  \item{estGroupSize}{
%%     ~~Describe \code{estGroupSize} here~~
A vector of dimension \eqn{H} containing the (estimated) group sizes returned by \code{\link{calcAllocations}}.
}
  \item{thin}{
%%     ~~Describe \code{thin} here~~
An integer specifying the thinning parameter (default is 1).
}
  \item{M0}{
%%     ~~Describe \code{M0} here~~
specifies the number of the first MCMC draw after burn-in (default is \code{outList$Mcmc$M0}).
}
  \item{grLabels}{
%%     ~~Describe \code{grLabels} here~~
A character vector giving user-specified names for the clusters/groups.
}
  \item{printXtable}{
%%     ~~Describe \code{printXtable} here~~
If \code{TRUE} a LaTeX-style table containing the posterior expectation of the average cluster-specific 
transition matrices of each cluster/group is generated/printed.
}
  \item{printSd}{
%%     ~~Describe \code{printSd} here~~
If \code{TRUE} a LaTeX-style table containing the posterior standard deviations (multiplied by 
100) of the average cluster-specific 
transition matrices of each cluster/group is generated/printed.
}
  \item{printTogether}{
%%     ~~Describe \code{printTogether} here~~
If \code{TRUE} (default) a LaTeX-style table containing the posterior expectation and standard 
deviations (multiplied by 100) of the average cluster-specific 
transition matrices of each cluster/group is generated/printed.
}
  \item{plotPaths}{
%%     ~~Describe \code{plotPaths} here~~
If \code{TRUE} (default) the paths of the MCMC draws of the transition probabilities 
\eqn{{\xi}_{h,j,k}}{\xi_{h,j,k}} are drawn for each cluster/group.
}
  \item{plotPathsForE}{
%%     ~~Describe \code{plotPathsForE} here~~
If \code{TRUE} (default) the paths of the MCMC draws of the transition parameters 
\eqn{{e}_{h,j,k}}{e_{h,j,k}} are drawn for each cluster/group (only DMC[Ext]).
}
}
%\details{
%%%  ~~ If necessary, more details than the description above ~~
%ADD DETAILS
%}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
A list containing:
\item{estTransProb }{A 3-dim array containing the posterior expectation of the average transition matrices of all 
                        clusters/groups using each \code{thin}-th draw from \code{M0} to \code{M}.}
\item{estTransProbSd }{A 3-dim array containing the posterior standard deviations of the average transition matrices 
                        for each cluster/group.}
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
\code{\link{calcAllocations}}, \code{\link{mcClust}}, \code{\link{dmClust}}, \code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}
}
\examples{
# please run the examples in mcClust, dmClust, mcClustExtended, 
# dmClustExtended
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
