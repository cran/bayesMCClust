\name{calcEntropy}
\alias{calcEntropy}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Calculates the Entropy of a Given Classification
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Calculates the entropy of a given classification based on  the outcome of a specificed MCMC run of either 
\code{\link{mcClust}}, \code{\link{mcClustExtended}}, \code{\link{dmClust}} or \code{\link{dmClustExtended}} as well 
as \code{\link{MNLAuxMix}}. 

}
\usage{
calcEntropy(outList, classProbs, class, 
            grLabels = paste("Group", 1:outList$Prior$H), 
            printXtable = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{mcClust}}, \code{\link{dmClust}}, 
\code{\link{mcClustExtended}}, \code{\link{dmClustExtended}} or \code{\link{MNLAuxMix}}.
}
  \item{classProbs}{
%%     ~~Describe \code{classProbs} here~~
A matrix with dimension \eqn{N \times H}{N x H} containing the individual posterior classification probabilities 
returned by \code{\link{calcAllocations}}.
}
  \item{class}{
%%     ~~Describe \code{class} here~~
A vector of length \eqn{N} containing the group membership returned by \code{\link{calcAllocations}}.
}
  \item{grLabels}{
%%     ~~Describe \code{grLabels} here~~
A character vector giving user-specified names for the clusters/groups.
}
  \item{printXtable}{
%%     ~~Describe \code{printXtable} here~~
If \code{TRUE} (default) a LaTeX-style table of the entropy is generated.
}
}
%\details{
%%%  ~~ If necessary, more details than the description above ~~
%TO BE ADDED?!
%}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...

A matrix of dimension \eqn{(H+1) \times 3}{(H+1) x 3}, where \eqn{H} is the number of clusters/groups, containing 
the contribution of each cluster/group to the (total) entropy -- absolute and relative to group size (number of 
group members). The calculation of the entropy is based on the individual posterior classification probabilities. 

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
\code{\link{calcAllocations}}, \code{\link{mcClust}}, \code{\link{dmClust}}, \code{\link{mcClustExtended}}, 
\code{\link{dmClustExtended}}, \code{\link{MNLAuxMix}}
}
\examples{
# please run the examples in mcClust, dmClust, mcClustExtended, 
# dmClustExtended, MNLAuxMix
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
