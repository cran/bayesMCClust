\name{calcSegmentationPower}
\alias{calcSegmentationPower}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Calculates the 'Segmentation Power' of the Specified Classification
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Calculates the 'segmentation power' and optionally the 'sharpness' of the specified classification. The 
'segmentation power' corresponds to the \emph{maximum} individual posterior classification probability. The closer 
the \emph{maximum} individual posterior classification probability is to 1, the higher is the segmentation power for 
individual \eqn{i}. Note that one minus these numbers corresponds to the \emph{misclassification risk} in each 
group; hence the closer to one, the smaller is the misclassification risk.  

The 'sharpness' on the other hand considers the difference between highest (maximum) and second highest individual 
posterior classification probabilities, which gives some hints about the 'sharpness' of the classification. 

}
\usage{
calcSegmentationPower(outList, classProbs, class, 
            printXtable = TRUE, calcSharp = TRUE, 
            printSharpXtable = TRUE, 
            grLabels = paste("Group", 1:outList$Prior$H))
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
  \item{printXtable}{
%%     ~~Describe \code{printXtable} here~~
If \code{TRUE} (default) a LaTeX-style table of the segmentation power is generated/printed.
}
  \item{calcSharp}{
%%     ~~Describe \code{calcSharp} here~~
If \code{TRUE} (default) also the 'sharpness' is calculated.
}
  \item{printSharpXtable}{
%%     ~~Describe \code{printSharpXtable} here~~
If \code{TRUE} (default) the 'sharpness' is also printed (provided that \code{calcSharp=TRUE}).
}
  \item{grLabels}{
%%     ~~Describe \code{grLabels} here~~
A character vector giving user-specified names for the clusters/groups.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~

Reported are summary statistics including the quartiles and the median of the distributions of the segmentation 
power and the 'sharpness' for all individuals within a certain cluster/group as well as for all individuals. 

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
A list containing:
\item{segPowTab }{A matrix containing the segmentation power: reported are summary statistics of the distribution 
                  of the maximum individual posterior classification probabilities for 
                  all individuals within a certain cluster as well as for all individuals.}
\item{sharpTab }{A matrix containing the 'sharpness': reported are summary statistics of the difference between 
                 highest and second highest individual posterior classification probabilities within groups and 
                 overall.}
\item{maxProbs }{A vector containing the \emph{maximum} individual posterior classification probabilities.}
\item{sharp }{A vector containing the differences of the individual maximum and the second highest posterior 
              classification probabilities.}
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
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
