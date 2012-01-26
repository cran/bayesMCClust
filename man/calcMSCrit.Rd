\name{calcMSCrit}
\alias{calcMSCrit}
\alias{calcMSCritMCC}
\alias{calcMSCritMCCExt}
\alias{calcMSCritDMC}
\alias{calcMSCritDMCExt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Calculates Model Selection Criteria For Several (Independent) MCMC Runs And Various Numbers \eqn{H} of Clusters
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Calculates and plots a set of model selection criteria (depending on the underlying model: e.g. BIC, adjusted BIC, 
DIC -- Deviance Information Criterion, AWE -- Approximate Weight of Evidence, CLC -- Classification Likelihood 
Criteria, ICL -- Integrated Classification Likelihood, ICL-BIC) for all estimated models produced by one and the 
same cluster method (for the sake of comparability) and for various numbers \eqn{H} of clusters/groups and several 
independent MCMC runs saved in output files located in the specified directory. Therefore several maximisation 
methods are available. For more information about the criteria see \bold{Details}, \bold{References} and references 
therein.  

}
\usage{
calcMSCritMCC(workDir, myLabel = "model choice for ...", H0 = 3, 
          whatToDoList = c("approxMCL", "approxML", "postMode"))
calcMSCritMCCExt(workDir, NN, myLabel = "model choice for ...", 
          ISdraws = 3, H0 = 3, 
          whatToDoList = c("approxMCL", "approxML", "postMode"))
calcMSCritDMC(workDir, myLabel = "model choice for ...", 
          myN0 = "N0 = ...", 
          whatToDoList = c("approxMCL", "approxML", "postMode"))
calcMSCritDMCExt(workDir, myLabel = "model choice for ...", 
          myN0 = "N0 = ...", 
          whatToDoList = c("approxMCL", "approxML", "postMode"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{workDir}{
%%     ~~Describe \code{workDir} here~~
A character giving the name (or full path) of the directory containing the output files of the estimated models 
produced by one and the same cluster method (for the sake of comparability) for which model selection criteria have 
to be calculated. 
}
  \item{NN}{
%%     ~~Describe \code{NN} here~~
Number of individuals \eqn{N} (just for argument/parameter checks).
}
  \item{myLabel}{
%%     ~~Describe \code{myLabel} here~~
Specifies (part of) labeling of the plots.
}
  \item{myN0}{
%%     ~~Describe \code{myN0} here~~
A character documenting the value of \code{Prior$N0} (has to be equal for all processed models for the sake of 
comparability!) -- just for labeling.
}
  \item{H0}{
%%     ~~Describe \code{H0} here~~
Number of 'expected' clusters/groups by user. Necessary for the calculation of the model prior \emph{adjusted BIC}. See \bold{Details}.
}
  \item{ISdraws}{
%%     ~~Describe \code{ISdraws} here~~
Number of draws for the importance sampling step to approximate the logICL.
}
  \item{whatToDoList}{
%%     ~~Describe \code{whatToDoList} here~~

A character vector containing a subset of \code{c("approxMCL", "approxML", "postMode")}. Depending on the entries in 
this list (\code{whatToDoList}) the calculation of (all) the criteria is based on the MCMC draws (iteration) 
corresponding to the maximum of the log classification likelihood (\code{"approxMCL"}), log likelihood 
(\code{"approxML"}) and/or log posterior density (\code{"postMode"}).  

}
}
\details{
%%  ~~ If necessary, more details than the description above ~~

For each maximisation method in \code{whatToDoList} all (available) model selection criteria are calculated (in an 
iterative manner). Depending on the entries in this list (\code{whatToDoList}) the calculation of (all) these 
criteria is based on the MCMC draws (iteration) corresponding to the maximum of the log classification likelihood 
(\code{"approxMCL"}), log likelihood (\code{"approxML"}) and/or (for the sake of completeness) log posterior density 
(\code{"postMode"}).  

Note, that the user has to decide which criteria are admissible.

Which criteria needs which maximisation method? The AWE and the logICL are based on the maximum of the (log) 
classification likelihood, all the others on the maximum of the (log) likelihood (see \bold{References}).  

By the way, it internally calculates the log-likelihood and related values such as \code{LK} (observed 
log-likelihood), \code{CLK} (classification or complete log-likelihood), \code{CK} (classification-type 
log-likelihood), \code{EK} (entropy term) as well as \eqn{d_h} (number of parameters) which are essential parts of the 
model selection criteria. 

We calculate the model prior \emph{adjusted BIC} using 
\eqn{adjBIC = BIC - 2 H \log(H_0) + 2 log\Gamma(H + 1) + 2 H_0}{adjBIC = BIC - 2*H*log(H0) + 2*log\Gamma(H + 1) + 2*H0}.

According to the used model type the following criteria are calculated: Bic, adjusted Bic, Aic, Awe, IclBic, Clc, 
Dic2, Dic4 and logICL (see \bold{References}). Furthermore, plots and tables of selected critera are generated (and 
plots are also saved in directory \code{workDir}).  

To document the iteration progress, some information is recorded for each output file (containing an MCMC run) -- 
depending on maximisation method -- like: a running number, maximisation method, number of cluster/groups, BIC, 
adjusted BIC, AIC, AWE, CLC, IclBic, DIC2, DIC4a, ICL and additionally adj Rand (which compares the starting with 
the final allocation).  

For each entry in \code{whatToDo} a matrix \code{MSCritTable} is produced. Each row represents a processed output 
file (containing an MCMC run) and the colums contain: 
\describe{ 
  \item{\code{H }}{number of clusters/groups}
  \item{\code{mMax }}{number/position of the MCMC draw/iteration leading to the maximum value of the (log-)posterior 
                 density or (classification) log-likelihood (depending on \code{whatToDo}) 
                 which is calculated for each MCMC draw }
  \item{\code{maxLPD }}{the maximum value of the (log-)posterior density itself, only if \code{whatToDo} includes 
                 \code{"postMode"} -- corresponding to 
                 the posterior mode }
  \item{\code{maxLL  }}{the maximum value of the log-likelihood itself, only if \code{whatToDo} includes 
                    \code{"approxML"} -- corresponding to 
                    the 'approximate maximum likelihood' }
  \item{\code{maxLCL }}{the maximum value of the classification log-likelihood itself, only if \code{whatToDo} includes 
                    \code{"approxMCL"} -- corresponding to 
                    the 'approximate maximum classification likelihood'  }
  \item{\code{BIC }}{Bayesian Information Criterion (Schwarz Criterion)}
  \item{\code{adjBIC }}{adjusted BIC -- Note: not available/implemented for DMC[Ext]! }
  \item{\code{AIC }}{Akaike Information Criterion }
  \item{\code{AWE }}{Approximate Weight of Evidence, see Banfield and Raftery (1993) }
  \item{\code{CLC }}{Classification Likelihood Criterion }
  \item{\code{IclBic }}{Integrated Classification Likelihood-BIC }
  \item{\code{DIC2 }}{Deviance Information Criterion (DIC2), see Fruehwirth-Schnatter and Pyne (2010) and Fruehwirth-Schnatter et al. (2011) -- Note: not available/implemented for DMC! }
  \item{\code{DIC4a }}{Deviance Information Criterion (DIC4a), see Fruehwirth-Schnatter and Pyne (2010) and Fruehwirth-Schnatter et al. (2011) -- Note: not available/implemented for DMC! }
  \item{\code{logICL }}{log Integrated Classification Likelihood -- Note: not available/implemented for DMC[Ext]! }
  \item{\code{adjRand }}{adjusted Rand-Index for (estimated) group membership VS starting values \code{Initial$S.i.start} 
                    (only if not \code{NULL}) }
}

For each entry in \code{whatToDo} the corresponding \code{MSCritTable} is printed together with the current working 
directory and the content of the current \code{whatToDo}. Further, plots of the model selection criteria are produced 
and saved (with type \code{eps} and \code{pdf}).  

If \emph{MCCExt} is considered also the number of importance sampling draws \code{ISdraws} (necessary for logICL) is 
printed.  

Additionally, after each iteration the workspace containing the model selection criteria and other stuff is saved to 
a .RData-file via \code{\link[base]{save.image}} within directory \code{workDir}.  

Finally, a list containing the names of the processed output files (each containing an MCMC run) is printed.

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...

A list containing:
\item{postMode }{the corresponding \code{MSCritTable} (see \bold{Details}), only if \code{whatToDo} includes \code{"postMode"} }
\item{approxML }{the corresponding \code{MSCritTable} (see \bold{Details}), only if \code{whatToDo} includes \code{"approxML"} }
\item{approxMCL }{the corresponding \code{MSCritTable} (see \bold{Details}), only if \code{whatToDo} includes \code{"approxMCL"} }
\item{ISdraws }{the number of importance sampling draws for approximating logICL (only for \emph{MCCExt}) }
\item{outFileNames }{a list (character vector) containing the names of the processed output files (each containing an MCMC run) }

}
\references{
%% ~put references to the literature/web site here ~

Jeffrey D. Banfield and Adrian E. Raftery, (1993), 
"Model-Based Gaussian and Non-Gaussian Clustering".
\emph{Biometrics}, Vol. 49, No. 3, pp. 803-821.
\url{http://www.jstor.org/stable/2532201} 

Sylvia Fruehwirth-Schnatter, Christoph Pamminger, Andrea Weber and Rudolf Winter-Ebmer, (2011), 
"Labor market entry and earnings dynamics: Bayesian inference using 
mixtures-of-experts Markov chain clustering". 
\emph{Journal of Applied Econometrics}. DOI: 10.1002/jae.1249 
\url{http://onlinelibrary.wiley.com/doi/10.1002/jae.1249/abstract}

Sylvia Fruehwirth-Schnatter and Saumyadipta Pyne, (2010), 
"Bayesian inference for finite mixtures of univariate and multivariate skew-normal and skew-t distributions". 
\emph{Biostatistics}, Vol. 11, No. 2, pp. 317-336. DOI: 10.1093/biostatistics/kxp062
\url{http://biostatistics.oxfordjournals.org/content/11/2/317.full.pdf+html}

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

Note, that the user has to decide which criteria are admissible.

Note, that in contrast to the literature (see \bold{References}), the numbering (labelling) of the states of the 
categorical outcome variable (time series) in this package is sometimes \eqn{0,\ldots,K}{0,...,K} (instead of 
\eqn{1,\ldots,K}{1,...,K}), however, there are \eqn{K+1} categories (states)!    

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link[e1071]{classAgreement}}, \code{\link[grDevices]{savePlot}},
\code{\link{mcClust}}, \code{\link{dmClust}}, \code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}
}
\examples{
# please run the examples in mcClust, dmClust, mcClustExtended, 
# dmClustExtended
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
