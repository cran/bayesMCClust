\name{calcVariationDMC}
\alias{calcVariationDMC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~

Analyses How Much Unobserved Heterogeneity Is Present in the Various Clusters by Computing the Within-Group 
Variability of the Cluster-Specific Transition Parameters of DMC  

}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Calculates the posterior expectation of the variance of the individual transition probabilities as well as posterior 
expectation and standard deviation of the row-specific unobserved heterogeneity measure in each group to analyse how 
much \emph{unobserved heterogeneity} is present in the various clusters (see Pamminger and Fruehwirth-Schnatter 
(2010) in \bold{References}).  

}
\usage{
calcVariationDMC(outList, thin = 1, maxi = 50, M0 = outList$Mcmc$M0, 
                 grLabels = paste("Group", 1:outList$Prior$H), 
                 printVarE = FALSE, printUnobsHet = FALSE, 
                 printUnobsHetSd = FALSE, printUnobsHetAll = FALSE, 
                 printAllTogether = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{dmClust}} or 
\code{\link{dmClustExtended}}.
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
  \item{grLabels}{
%%     ~~Describe \code{grLabels} here~~
A character vector giving user-specified names for the clusters/groups.
}
  \item{printVarE}{
%%     ~~Describe \code{printVarE} here~~
If \code{TRUE} a LaTeX-style table of the posterior expectation of the variance of the individual transition probabilities 
(in percent) in each cluster/group is generated/printed.
}
  \item{printUnobsHet}{
%%     ~~Describe \code{printUnobsHet} here~~
If \code{TRUE} a LaTeX-style table of the posterior expectation of the row-specific unobserved heterogeneity measure in each 
group multiplied by 100 is generated/printed.
}
  \item{printUnobsHetSd}{
%%     ~~Describe \code{printUnobsHetSd} here~~
If \code{TRUE} a LaTeX-style table of the posterior standard deviation of the row-specific unobserved heterogeneity measure 
in each group multiplied by 100 is generated/printed.
}
  \item{printUnobsHetAll}{
%%     ~~Describe \code{printUnobsHetAll} here~~
If \code{TRUE} a LaTeX-style table of the posterior expectation and, in parenthesis, posterior standard deviation of the 
row-specific unobserved heterogeneity measure in each group multiplied by 100 is generated/printed.
}
  \item{printAllTogether}{
%%     ~~Describe \code{printAllTogether} here~~
If \code{TRUE} (default) a LaTeX-style table of the posterior expectation of the variance of the individual transition probabilities 
(in percent) in each cluster/group as well as the posterior expectation and, in parenthesis, posterior standard deviation of the 
row-specific unobserved heterogeneity measure in each group multiplied by 100 is generated/printed. 
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~

The last \code{maxi} MCMC draws of each \code{thin}-th draw are taken for calculations.

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
A list containing:
    \item{var_e }{A 3-dim array containing the posterior expectation of the variance of the individual transition probabilities in each group.}
    \item{het }{A matrix containing the posterior expectation of the row-specific unobserved heterogeneity measure in each group.}
    \item{hetsd }{A matrix containing the posterior standard deviation of the row-specific unobserved heterogeneity measure in each group.}
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
\code{\link{dmClust}}, \code{\link{dmClustExtended}}
}
\examples{
# please run the examples in dmClust, dmClustExtended
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
