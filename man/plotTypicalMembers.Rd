\name{plotTypicalMembers}
\alias{plotTypicalMembers}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Plots Time Series of 'Typical' Group Members
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Plots time series of the most 'typical' group members showing the highest classification probabilities.
}
\usage{
plotTypicalMembers(outList, myObsList, classProbs, noTypMemb = 7, 
                   moreTypMemb = c(10, 25, 50, 100, 200, 500, 1000), 
                   grLabels = paste("Group", 1:outList$Prior$H))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{mcClust}}, \code{\link{dmClust}}, 
\code{\link{mcClustExtended}} or \code{\link{dmClustExtended}}.
}
  \item{myObsList}{
%%     ~~Describe \code{myObsList} here~~
A list containing \eqn{N} numeric vectors (of integers with possibly variable lengths) corresponding to the individual time 
series.
}
  \item{classProbs}{
%%     ~~Describe \code{classProbs} here~~
A matrix with dimension \eqn{N \times H}{N x H} containing the individual posterior classification probabilities 
returned by \code{\link{calcAllocations}}.
}
  \item{noTypMemb}{
%%     ~~Describe \code{noTypMemb} here~~
An integer indicating the number of most typical group members to be drawn from each cluster/group.
}
  \item{moreTypMemb}{
%%     ~~Describe \code{moreTypMemb} here~~
A vector with length \code{noTypMemb} containing the positions (ranks) in the individual posterior classification 
probability ranking of further (typical) group members.
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

A list containing:
 \item{typicalMemb }{The index numbers of the individuals being the first \code{noTypMemb} most typical group members 
                     according to their positions (ranks) in the individual posterior classification probability ranking. }
\item{typicalMemb2 }{The index numbers of the individuals being the  \code{moreTypMemb}-th most typical group members.  
                     according to their positions (ranks) in the individual posterior classification probability ranking. }

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
# please run the examples in mcClust, dmClust, mcClustExtended 
# and/or dmClustExtended
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
