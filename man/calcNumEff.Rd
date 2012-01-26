\name{calcNumEff}
\alias{calcNumEff}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Calculates Inefficiency Factors of the MCMC Draws Obtained for the Cluster-Specific Parameters
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Calculates the inefficiency factors of the MCMC draws using \code{\link[bayesm]{numEff}} from the R package \pkg{bayesm} 
(see \bold{References}).

}
\usage{
calcNumEff(outList, thin = 1, printXi = TRUE, printE = TRUE, 
           printBeta = TRUE, 
           grLabels = paste("Group", 1:outList$Prior$H))
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
  \item{printXi}{
%%     ~~Describe \code{printXi} here~~
If \code{TRUE} (default) a LaTeX-style table containing the inefficiency factors of the cluster-specific transition 
matrices is generated and also printed.
}
  \item{printE}{
%%     ~~Describe \code{printE} here~~
If \code{TRUE} (default) a LaTeX-style table containing the inefficiency factors of the cluster-specific parameter 
matrices is generated and also printed.
}
  \item{printBeta}{
%%     ~~Describe \code{printBeta} here~~
If \code{TRUE} (default) a LaTeX-style table containing the inefficiency factors of the MNL regression coefficients is 
generated and also printed.
}
  \item{grLabels}{
%%     ~~Describe \code{grLabels} here~~
A character vector giving user-specified names for the clusters/groups.
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
A list containing tables of inefficiency factors:
\item{numEffXi[h]m }{Inefficiency factors of the MCMC draws obtained for each row \eqn{j=1,\ldots,K+1}{j=1,...,K+1} of the cluster-specific 
    transition matrices \eqn{\boldsymbol{\xi}_{h,j\cdot}}{\xi_{h,j.}} for each cluster/group.}
\item{numEffEhm }{Inefficiency factors of the MCMC draws obtained for each row \eqn{j=1,...,K+1}{j=1,\ldots,K+1} of the cluster-specific 
    parameter matrices (only for DMC[Ext]) \eqn{\mathbf{e}_{h,j\cdot}}{e_{h,j.}} for each cluster/group.}
\item{numEffBeta }{Inefficiency factors of the MCMC draws obtained for the MNL regression coefficients for each cluster.}
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

Peter E. Rossi, Greg M. Allenby and Rob McCulloch, (2005), 
\emph{Bayesian Statistics and Marketing}, Chichester: Wiley. 
\url{http://www.perossi.org/home/bsm-1}

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
\code{\link[bayesm]{numEff}}, \code{\link{mcClust}}, \code{\link{dmClust}}, \code{\link{mcClustExtended}}, 
\code{\link{dmClustExtended}}, \code{\link{MNLAuxMix}}
}
\examples{
# please run the examples in mcClust, dmClust, mcClustExtended, 
# dmClustExtended
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
