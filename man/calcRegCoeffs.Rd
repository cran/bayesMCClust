\name{calcRegCoeffs}
\alias{calcRegCoeffs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~

Calculates Posterior Expectations, Standard Deviations and (Optionally) HPD Intervals for the MNL Regression 
Coefficients

}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Calculates posterior expectations, standard deviations and (optional) highest probability density (HPD) intervals 
for the multinomial logit (MNL) regression coefficients (using \code{\link[boa]{boa.hpd}} from package \pkg{boa}) 
and also offers some other analyses like plotting paths and autocorrelation functions (ACFs) for the corresponding 
MCMC draws.    

}
\usage{
calcRegCoeffs(outList, hBase = 1, thin = 1, M0 = outList$Mcmc$M0, 
              grLabels = paste("Group", 1:outList$Prior$H), 
              printHPD = TRUE, plotPaths = TRUE, plotACFs = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{mcClustExtended}}, 
\code{\link{dmClustExtended}} or \code{\link{MNLAuxMix}}.
}
  \item{hBase}{
%%     ~~Describe \code{hBase} here~~
specifies the cluster/group which should serve as \emph{baseline} cluster/group.
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
  \item{printHPD}{
%%     ~~Describe \code{printHPD} here~~
If \code{TRUE} (default) a LaTeX-style table containing the highest probability density (HPD) intervals for each 
MNL regression coefficient is calculated (using \code{\link[boa]{boa.hpd}} from package \pkg{boa}) and also printed.
}
  \item{plotPaths}{
%%     ~~Describe \code{plotPaths} here~~
If \code{TRUE} (default) the paths of the MCMC draws of the MNL regression coefficients are drawn for each 
cluster/group (without thinning).
}
  \item{plotACFs}{
%%     ~~Describe \code{plotACFs} here~~
If \code{TRUE} (default) the autocorrelation function (ACF) for the MCMC draws of the regression coefficients are 
drawn for each cluster/group (with thinning and  burn-in discarded).
}
}
%\details{
%%%  ~~ If necessary, more details than the description above ~~
%ADD DETAILS!?
%}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
A list containing:
\item{[[h]], h=1,..,H }{A matrix containing posterior expectation (\code{"Post Exp"}), standard deviation (\code{"Post Sd"}) and 
                        HPD interval (\code{"HPD Lower B", "HPD Upper B"}) for the MNL regression coefficients in 
                        cluster/group \eqn{h} except for the baseline cluster/group.} 
\item{regCoeffsAll }{A matrix containing posterior expectation (\code{"Post Exp"}) and (in parenthesis) standard deviation 
                     (\code{"Post Sd"}) for the MNL regression coefficients for all clusters/groups.}
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
\code{\link[boa]{boa.hpd}}, \code{\link[stats]{acf}}, \code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}, 
\code{\link{MNLAuxMix}}
}
\examples{
# please run the examples in mcClustExtended, dmClustExtended and 
# MNLAuxMix
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
\keyword{ regression }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
