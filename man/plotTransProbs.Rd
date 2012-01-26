\name{plotTransProbs}
\alias{plotTransProbs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Produces Balloon Plots and LaTeX-Style Tables of the Transition Matrices
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Produces balloon plots and LaTeX-style tables of the transition matrices and cluster-specific contingency tables 
(transition frequency matrices).  

}
\usage{
plotTransProbs(outList, estTransProb, estGroupSize, class, 
               grLabels = paste("Group", 1:outList$Prior$H), 
               plotPooled = TRUE, 
               plotContTable = TRUE, printContTable = TRUE, 
               plotContPooled = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{mcClust}}, \code{\link{dmClust}}, 
\code{\link{mcClustExtended}} or \code{\link{dmClustExtended}}.
}
  \item{estTransProb}{
%%     ~~Describe \code{estTransProb} here~~
A 3-dim array containing the posterior expectation of the average transition matrices of all clusters/groups as 
returned by \code{\link{calcTransProbs}}.           
}
  \item{estGroupSize}{
%%     ~~Describe \code{estGroupSize} here~~
A vector of dimension \eqn{H} containing the (estimated) group sizes returned by \code{\link{calcAllocations}}.
}
  \item{class}{
%%     ~~Describe \code{class} here~~
A vector of length \eqn{N} containing the group membership returned by \code{\link{calcAllocations}}.
}
  \item{grLabels}{
%%     ~~Describe \code{grLabels} here~~
A character vector giving user-specified names for the clusters/groups.
}
  \item{plotPooled}{
%%     ~~Describe \code{plotPooled} here~~
If \code{TRUE} (default) a balloon plot of the pooled transition matrix (ML estimate for all individuals) is 
produced. See \bold{Value}: \code{relNjk}. 
}
  \item{plotContTable}{
%%     ~~Describe \code{plotContTable} here~~
If \code{TRUE} (default) balloon plots of the cluster-specific contingency tables (transition frequency matrices) 
are produced. See \bold{Details} and \bold{Value}: \code{relTransFreq}.
}
  \item{printContTable}{
%%     ~~Describe \code{printContTable} here~~
If \code{TRUE} (default) a LaTeX-style table containing the absolute and relative row sums of the cluster-specific 
contingency tables (transition frequency matrices) is generated/printed (iff \code{plotContTable} is \code{TRUE}). 
See \bold{Value}: \code{contTable}.
}
  \item{plotContPooled}{
%%     ~~Describe \code{plotContPooled} here~~
If \code{TRUE} (default) a balloon plot of the pooled contingency table (transition frequency matrix) is produced 
(iff \code{plotContTable} is \code{TRUE}). See \bold{Value}: \code{relNjkMat}. 
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~

This function visualizes the posterior expectation of the group-specific transition matrices (\code{estTransProb}) 
using \dQuote{balloon plots} (function \code{\link[gplots]{balloonplot}} from package \pkg{gplots}). The circular 
areas are proportional to the size of the corresponding entry in the transition matrix. The corresponding group 
sizes (\code{estGroupSize}) are indicated in parentheses.   

Furthermore, the \dQuote{balloons} are appropriately scaled (automatically) to be comparable within and 
\emph{between} groups.

The (cluster-specific) contingency tables report for each cluster in cell \eqn{(j,k)} the probability of observing 
the categories \eqn{(j,k)} in consecutive time points/periods for an individual in this cluster. The entries to this 
table/figure sum to one (see \bold{Value}: \code{relTransFreq}).

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
A list containing:
\item{relNjk }{A matrix containing the ML estimate of the transition matrix for all individuals (pooled). That is the 
               matrix containing the total sum of all observed transitions where each row is scaled to 1.}
\item{contTable }{A matrix containing the row sums of the group-specific contingency tables (absolute transition frequencies).}
\item{relTransFreq }{A 3-dim array containing the cluster-specific contingency tables.}
\item{relNjkMat }{A matrix containing the sum of all observed transitions where the whole matrix is scaled to 1.}
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
\code{\link{calcTransProbs}}, \code{\link{calcAllocations}}, \code{\link[gplots]{balloonplot}}, \code{\link{mcClust}}, 
\code{\link{dmClust}}, \code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}
}
\examples{
# please run the examples in mcClust, dmClust, mcClustExtended, 
# dmClustExtended
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
