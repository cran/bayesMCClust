\name{bayesMCClust-package}
\alias{bayesMCClust-package}
\alias{bayesMCClust}
\docType{package}
\title{
Mixtures-of-Experts Markov Chain Clustering and Dirichlet Multinomial Clustering
}
\description{
%% ~~ A concise (1-5 lines) description of the package ~~  

This package provides various Markov Chain Monte Carlo (MCMC) samplers for model-based clustering of discrete-valued 
time series obtained by observing a categorical variable with several states (in a Bayesian approach). These methods 
are based on finite mixtures of first-order time-homogeneous Markov chain (models) with unknown transition matrices. 
In the Markov chain clustering approach the individual transition probabilities are fixed to a group-specific 
transition matrix. In the second approach called Dirichlet multinomial clustering it is assumed that within each 
group unobserved heterogeneity is still existent and is captured by allowing the individual transition matrices to 
deviate from the group means by describing this variation for each row through a Dirichlet distribution with unknown 
hyperparameters. Further, in order to analyze group membership, we provide also an extension to these approaches by 
formulating a probabilistic model for the latent group indicators within the Bayesian classification rule using a 
multinomial logit model. In other words, unobserved group membership is modeled as a multinomial logit model which 
allows for dependence on individual-specific and other characteristics. Additionally, functions to process the 
results are provided.  

}
\details{
\tabular{ll}{
Package: \tab bayesMCClust\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2012-01-26\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
%% ~~ An overview of how to use the package, including the most important functions ~~

The main functions are \code{\link{mcClust}} for Markov Chain Clustering and \code{\link{dmClust}} for Dirichlet 
Multinomial Clustering as well as \code{\link{mcClustExtended}} and \code{\link{dmClustExtended}} which also include 
the mixtures-of-experts extension. These functions use a special structure of the data (see \code{Njk.i} in the 
\bold{Examples} therein and/or e.g. \code{\link{MCCExampleData}} and \code{\link{MCCExtExampleData}}). Therefore 
\code{\link{dataListToNjki}} and \code{\link{dataFrameToNjki}} are provided to help preparing the data (see examples 
therein). Additionally, a function \code{\link{MNLAuxMix}} is provided for multinomial logit regression using the 
auxiliary mixture approach (see \bold{References}). Note that also prior information may be incorporated as these 
methods are \dQuote{Bayesian} approaches. Thus, to estimate the parameters such as transition probabilities, 
regression coefficients or mixing proportions, MCMC algorithms are used. For more details about the models and 
estimation procedures see \bold{References}. The results are returned in lists and also saved to output files. To 
process the results some more functions are provided to analyse and visualise the results; so for example the 
(group-specific) transition probabilities can be visualised with \code{\link{plotTransProbs}}. Finally, also some 
well-known model selection criteria can be calculated with \code{\link{calcMSCrit}}. 

} 
\note{ 
%%  ~~further notes~~ 

Note, that in contrast to the literature (see \bold{References}), the numbering (labelling) of the states of the 
categorical outcome variable (time series) in this package is sometimes \eqn{0,\ldots,K}{0,...,K} (instead of 
\eqn{1,\ldots,K}{1,...,K}), however, there are \eqn{K+1} categories (states)!    

}
\author{
Christoph Pamminger <christoph.pamminger@gmail.com>

Maintainer: Christoph Pamminger <christoph.pamminger@gmail.com>
%% ~~ The author and/or maintainer of the package ~~
}
\references{
%% ~~ Literature or other references for background information ~~

Sylvia Fruehwirth-Schnatter, Christoph Pamminger, Andrea Weber and Rudolf Winter-Ebmer, (2011), 
"Labor market entry and earnings dynamics: Bayesian inference using 
mixtures-of-experts Markov chain clustering". 
\emph{Journal of Applied Econometrics}. DOI: 10.1002/jae.1249 
\url{http://onlinelibrary.wiley.com/doi/10.1002/jae.1249/abstract}

Christoph Pamminger and Sylvia Fruehwirth-Schnatter, (2010), 
"Model-based Clustering of Categorical Time Series". 
\emph{Bayesian Analysis}, Vol. 5, No. 2, pp. 345-368. DOI: 10.1214/10-BA606  
\url{http://ba.stat.cmu.edu/journal/2010/vol05/issue02/pamminger.pdf}

Sylvia Fruehwirth-Schnatter and Rudolf Fruehwirth, (2010), 
"Data augmentation and MCMC for binary and multinomial logit models". 
In T. Kneib and G. Tutz (eds): \emph{Statistical Modelling and Regression Structures: Festschrift in Honour of Ludwig Fahrmeir}. 
Physica Verlag, Heidelberg, pp. 111-132. DOI: 10.1007/978-3-7908-2413-1_7
\url{http://www.springerlink.com/content/t4h810017645wh68/}. 
See also: IFAS Research Paper Series 2010-48 (\url{http://www.jku.at/ifas/content/e108280/e108491/e108471/e109880/ifas_rp48.pdf}).

}
%% ~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation ~~
%% ~~ directory ~~
\keyword{ package }
\keyword{ cluster }
\keyword{ ts }
\keyword{ regression }
\seealso{
%% ~~ Optional links to other man pages, e.g. ~~
%%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
\code{\link{mcClust}}, \code{\link{dmClust}}, \code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}, \code{\link{MNLAuxMix}}, 
\code{\link{calcAllocations}} 
}
\examples{ 
# please run the examples in mcClust, dmClust, mcClustExtended, 
# dmClustExtended, MNLAuxMix
}
