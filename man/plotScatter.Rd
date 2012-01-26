\name{plotScatter}
\alias{plotScatter}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Produces Scatter Plots of MCMC Draws
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Produces three scatter plots of MCMC draws of selected transition probabilities over all clusters/groups.
}
\usage{
plotScatter(outList, thin = 1, xi11 = c(1, 1), xi12 = c(2, 2), 
            xi21 = c(2, 2), xi22 = c(3, 3), 
            xi31 = c(1, 1), xi32 = c(3, 3))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outList}{
%%     ~~Describe \code{outList} here~~
specifies a list containing the outcome (return value) of an MCMC run of \code{\link{mcClust}}, \code{\link{dmClust}}, 
\code{\link{mcClustExtended}} or \code{\link{dmClustExtended}}.
}
  \item{thin}{
%%     ~~Describe \code{thin} here~~
An integer specifying the thinning parameter (default is 1).
}
  \item{xi11}{
%%     ~~Describe \code{xi11} here~~
A vector with 2 (valid) integers specifying \eqn{j} and \eqn{k} of \eqn{\xi_{\cdot,j,k}}{\xi_{.,j,k}}, the transition probability to use on the x-axis of the first plot.
}
  \item{xi12}{
%%     ~~Describe \code{xi12} here~~
A vector with 2 (valid) integers specifying \eqn{j} and \eqn{k} of \eqn{\xi_{\cdot,j,k}}{\xi_{.,j,k}}, the transition probability to use on the y-axis of the first plot.
}
  \item{xi21}{
%%     ~~Describe \code{xi21} here~~
A vector with 2 (valid) integers specifying \eqn{j} and \eqn{k} of \eqn{\xi_{\cdot,j,k}}{\xi_{.,j,k}}, the transition probability to use on the x-axis of the second plot.
}
  \item{xi22}{
%%     ~~Describe \code{xi22} here~~
A vector with 2 (valid) integers specifying \eqn{j} and \eqn{k} of \eqn{\xi_{\cdot,j,k}}{\xi_{.,j,k}}, the transition probability to use on the y-axis of the second plot.
}
  \item{xi31}{
%%     ~~Describe \code{xi31} here~~
A vector with 2 (valid) integers specifying \eqn{j} and \eqn{k} of \eqn{\xi_{\cdot,j,k}}{\xi_{.,j,k}}, the transition probability to use on the x-axis of the third plot.
}
  \item{xi32}{
%%     ~~Describe \code{xi32} here~~
A vector with 2 (valid) integers specifying \eqn{j} and \eqn{k} of \eqn{\xi_{\cdot,j,k}}{\xi_{.,j,k}}, the transition probability to use on the y-axis of the third plot.
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

No value returned.

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
\code{\link{mcClust}}, \code{\link{dmClust}}, \code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}
}
\examples{
# please run the examples in mcClust, dmClust, mcClustExtended 
# and/or dmClustExtended
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
