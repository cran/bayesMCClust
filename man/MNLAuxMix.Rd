\name{MNLAuxMix}
\alias{MNLAuxMix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Bayesian Multinomial Logit Regression Using Auxiliary Mixture Sampling
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

This function provides Bayesian multinomial logit regression using auxiliary mixture sampling. See 
Fruehwirth-Schnatter and Fruehwirth (2010). That is an MCMC sampler that is also used for the mixtures-of-experts 
extension of Dirichlet Multinomial (\code{\link{dmClustExtended}}) and Markov chain clustering 
(\code{\link{mcClustExtended}}). It requires four mandatory arguments: \code{Data}, \code{Prior}, \code{Initial} and 
\code{Mcmc}; each representing a list of (mandatory) arguments: \code{Data} contains data information, \code{Prior} 
contains prior information, \code{Initial} contains information about starting conditions (initial values) and 
\code{Mcmc} contains the setup for the MCMC sampler.    

}
\usage{
MNLAuxMix( 
    Data = list( storeDir = "try01", 
                 X = stop("X (matrix of covariates) must be specified")), 
    Prior = list( H = 4, betaPrior = "informative", 
                  betaPriorMean = 0, betaPriorVar = 1), 
    Initial = list( S.i.start = rep(1:H, N), Beta.start = NULL), 
    Mcmc = list( M = 50, M0 = 20, mOut = 5, mSave = 10, seed = 12345))
}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{Data   }{ a list consisting of: \code{storeDir, X}. See \bold{Details}. }
  
  \item{Prior  }{ a list consisting of: \code{H, betaPrior, betaPriorMean, betaPriorVar}. See \bold{Details}. }
  
  \item{Initial}{ a list consisting of: \code{S.i.start, Beta.start}. See \bold{Details}. }
  
  \item{Mcmc   }{ a list consisting of: \code{M, M0, mOut, mSave, seed}. See \bold{Details}. }    

}

\details{
%%  ~~ If necessary, more details than the description above ~~

Note that the values of the arguments indicated here have nothing to do with default values! For a call of these 
functions this lists-of-arguments structure requires a complete specification of all arguments!  

The following arguments which are lists have to be completely provided (note that there are no such things as 
default values within lists!): 

  \code{Data} contains:
  
\describe{ 

    \item{\code{  storeDir}}{A character indicating the name of the directory (will be created if not already existing) where the results are to be stored.}     
        
    \item{\code{  X}}{The matrix of covariates (with \eqn{N} rows) including the unit vector for the intercept to be included in the multinomial logit model.}

}


  \code{Prior} contains (see also Section \bold{Prior Data}):
  
\describe{  

  \item{\code{  H }}{ An integer \eqn{\geq 1}{>= 1} indicating the number of response categories. }  

  \item{\code{  betaPrior }}{A character. If "uninformative" (improper) prior parameters are used for the regression coefficients (i.e. betaPriorVar = \eqn{\infty}). 
                           Otherwise mean and variance of the normal prior distribution for the regression coefficients have to be specified. }
  
  \item{\code{  betaPriorMean, betaPriorVar }}{ Numerical values specifying the parameters of the normal prior distribution for the regression coefficients, only if \code{betaPrior!="uninformative"}. }

}


  \code{Initial} contains:   
  
\describe{  

  \item{\code{  S.i.start }}{A vector of length \eqn{N} giving initial response categories.}
  
  \item{\code{  Beta.start  }}{A matrix of dimension \code{ncol(X)} x \code{H} giving start values for the regression coefficients including the zero vector in the first column 
                                representing the baseline response category. }

}


  \code{Mcmc} contains: 

\describe{   
  \item{\code{  M}}{An integer indicating the overall number of iterations.}
  \item{\code{  M0}}{An integer indicating the number of the first iteration \emph{after} the burn-in phase.}
  \item{\code{  mOut}}{An integer indicating that after each \code{mOut}-th iteration a report line is written to the output window/screen.}
  \item{\code{  mSave}}{An integer indicating that after each \code{mSave}-th iteration an intermediate storage of the workspace is carried out.}
  \item{\code{  seed}}{An integer indicating a random seed.}
}

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...

A list containing (/the output file contains): 

  \item{workspaceFile }{ A character indicating the name of and the path (based on the currend working directory) to the output file, wherein all the
        results are saved. 
        The name of the output file starts with \dQuote{\code{mnLogit_newAux_}} respectively followed by the number of groups \code{H}, the 
        number of iterations \code{M} and the particular point in time when the function was called, with format: \code{yyyymmdd_hhmmss}. 
        E.g. \code{mnLogit_newAux_H4_M10000_20110218_045254.RData}.        
        }
  \item{Data }{ The argument \code{Data}.}
  \item{Prior }{ The argument \code{Prior}.}
  \item{Initial }{ The argument \code{Initial}. }
  \item{Mcmc }{ The argument \code{Mcmc}.}                  
  \item{Beta.m }{ A 3-dimensional array of dimension \eqn{\code{ncol(X)} \times H \times M}{ncol(X) x H x M} containing the draws for the regression coefficients 
                  \eqn{\beta_h} in each \eqn{m}-th iteration step.}
  \item{bk0 }{ The prior parameters for the mean vectors of the normal (prior) distributions of the regression coefficients. }
  \item{Bk0inv }{ The prior parameters for the inverse variance-covariance matrices of the normal (prior) distributions of the regression coefficients. }
  \item{fileName }{ A character value indicating the name of the output file (see also \code{workspaceFile}).}
  \item{N }{ An integer indicating \eqn{N}, the number of individuals/units/objects. }
  \item{totalTime }{ A numeric value indicating the total time (in secs) used for the function call.}
  \item{bkN }{ The posterior parameters (in the last iteration step) for the mean vectors of the normal (posterior) distributions from which the regression coefficients were drawn. }
  \item{BkN }{ The posterior parameters (in the last iteration step) for the variance-covariance matrices of the normal (posterior) distributions from which the regression coefficients were drawn. }
  \item{logLike }{ A vector containing the values of the log-likelihood calculated in each iteration step.  }

}

\section{Reporting Progress (Log Protocol) }{

The log protocol keeps record of the progress of the estimation procedure and is shown on the screen. At first the 
name of the workspace file is documented. Then for each \code{mOut}-th iteration step (at least for \eqn{m=1, 
\ldots, 5, 10, 20, 50, 100, 200, 500}) information about the elapsed time and the expected time to the end is 
reported. Finally the total time is shown.     

For example:

\preformatted{workspaceFile:  MNLAuxMix-Example-Outfiles\mnLogit_newAux_H2_M100_20111129_083023.RData   (within current working directory!) 
m = 1 ; duration of iter proc so far:  0.25 sec. 
m = 2 ; duration of iter proc so far: 0.33 sec.,  exp time to end: 0.54  min. 
m = 3 ; duration of iter proc so far: 0.44 sec.,  exp time to end: 0.36  min. 
m = 4 ; duration of iter proc so far: 0.52 sec.,  exp time to end: 0.28  min. 
m = 5 ; duration of iter proc so far: 0.6 sec.,  exp time to end: 0.24  min. 
m = 10 ; duration of iter proc so far: 1.04 sec.,  exp time to end: 0.18  min. 
m = 20 ; duration of iter proc so far: 1.93 sec.,  exp time to end: 0.14  min. 
m = 30 ; duration of iter proc so far: 2.8 sec.,  exp time to end: 0.11  min. 
m = 40 ; duration of iter proc so far: 3.79 sec.,  exp time to end: 0.1  min. 
m = 50 ; duration of iter proc so far: 4.79 sec.,  exp time to end: 0.08  min. 
m = 60 ; duration of iter proc so far: 5.89 sec.,  exp time to end: 0.07  min. 
m = 70 ; duration of iter proc so far: 6.8 sec.,  exp time to end: 0.05  min. 
m = 80 ; duration of iter proc so far: 7.68 sec.,  exp time to end: 0.03  min. 
m = 90 ; duration of iter proc so far: 8.63 sec.,  exp time to end: 0.02  min. 
m = 100 ; duration of iter proc so far: 9.52 sec.,  exp time to end: 0  min. 
Total time: 0 hours 0 min }

}

\section{Warning }{
  Note that there are no such things as \emph{default} values (see Section \bold{Arguments})!
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

Sylvia Fruehwirth-Schnatter and Rudolf Fruehwirth, (2010), 
"Data augmentation and MCMC for binary and multinomial logit models". 
In T. Kneib and G. Tutz (eds): \emph{Statistical Modelling and Regression Structures: Festschrift in Honour of Ludwig Fahrmeir}. 
Physica Verlag, Heidelberg, pp. 111-132. DOI: 10.1007/978-3-7908-2413-1_7
\url{http://www.springerlink.com/content/t4h810017645wh68/}. 
See also: IFAS Research Paper Series 2010-48 (\url{http://www.jku.at/ifas/content/e108280/e108491/e108471/e109880/ifas_rp48.pdf}).

}
\author{
Christoph Pamminger <christoph.pamminger@gmail.com>
}
\note{
%%  ~~further notes~~

Note that the required data files have to be provided in the current working directory and that the results (see 
Section \bold{Value}) are to be saved in the directory provided by \code{storeDir} within the current working 
directory. Make sure that the current working directory is set appropriately before the function is called.  

Note, that in contrast to the literature (see \bold{References}), the numbering (labelling) of the states of the 
categorical outcome variable (time series) in this package is sometimes \eqn{0,\ldots,K}{0,...,K} (instead of 
\eqn{1,\ldots,K}{1,...,K}), however, there are \eqn{K+1} categories (states)!    

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}, \code{\link{MCCExtExampleData}}, 
\code{\link{calcAllocationsMNL}}, \code{\link{calcRegCoeffs}}, \code{\link{calcSegmentationPower}}, 
\code{\link{calcEntropy}}, \code{\link{plotLikeliPaths}}, \code{\link{calcNumEff}}
}
\examples{

#rm(list=ls(all=TRUE))

# ==================================================================================
if ( FALSE ) {
# ==================================================================================

# set working directory
oldDir <- getwd()
curDir <- tempdir()
setwd(curDir)

if ( !file.exists("bayesMCClust-wd") ) dir.create("bayesMCClust-wd")
setwd("bayesMCClust-wd") 
myOutfilesDir <- "MNLAuxMix-Example-Outfiles"      

data(MCCExtExampleData)

if (!is.element("MCCExtExampleData$covariates", search())) {
    attach(MCCExtExampleData$covariates)
}

# ==================================================================================

response <- MCCExtExampleData[[ sample(5:7, 1) ]] # MCCExtExampleData$MNLresponse2gr
# MCCExtExampleData$MNLresponse3gr # MCCExtExampleData$MNLresponse4gr # 

groupNr <- max(response) # 3

# ==================================================================================
# ==================================================================================

require(nnet, quietly = TRUE)
H <- groupNr
X = cbind( intercept=1, alrateBezNew, unskilled, skilled, angStart ) 

N <- dim(X)[1]
mX <- data.frame( cbind(group=as.factor( response ), X[,-1], 
                  matrix(sample(1:H,H*N,replace=TRUE),N,H)) )

colnames(mX)[6:(6+groupNr-1)] <- c(  "as.1", "as.2", "as.3", "as.4" )[1:groupNr] 

tempMNom <- multinom(group ~ alrateBezNew+ unskilled+ skilled+ angStart, 
                     data=as.data.frame(mX)) 

toStartBeta <- t(rbind(0,coef( tempMNom )))

# ==================================================================================
system.time(
  outList <- MNLAuxMix( 
    Data = list( storeDir = myOutfilesDir, 
                 # will be created if not existing (in current working directory!)
                 X = cbind( intercept=1, alrateBezNew, unskilled, skilled, angStart ) ),                         
    Prior = list( H = groupNr, # number of alternatives 1,...,H
                  betaPrior = "informative",  
                  # 'uninformative' (improper) prior pars for beta (betaPriorVar = infty)
                  betaPriorMean = 0,
                  betaPriorVar = 1), # 'informative' prior pars for beta -> N(0,1)
    Initial = list( S.i.start = response, #  vector of multinomial outcomes / choice made
                    Beta.start = toStartBeta ),  
    Mcmc = list( M = 100, 
                 M0 = 50, 
                 mOut = 10, 
                 mSave = 50, 
                 seed = sample(1:100000, 1) # 6984684
    )
  )
)

str(outList)

#outFileName <- outList$workspaceFile
#outFileName
#results <- load(outFileName)
#results

allocList <- calcAllocationsMNL(outList, thin=1, maxi=50) 
str(allocList)

myRegCoeffs <- calcRegCoeffs(outList, hBase=2, thin=1) 
#, M0=Mcmc$M0, grLabels=paste("Group", 1:Prior$H), 
# printHPD=TRUE, plotPaths=TRUE, plotACFs=TRUE
str(myRegCoeffs)

mySegPower <- calcSegmentationPower(outList, classProbs=allocList$classProbs, 
    class=allocList$class, printXtable=TRUE, calcSharp=TRUE, printSharpXtable=TRUE ) 
    # , grLabels=paste("Group", 1:Prior$H)
str(mySegPower)

myEntropy <- calcEntropy(outList, classProbs=allocList$classProbs, 
    class=allocList$class, printXtable=TRUE ) 
    # , grLabels=paste("Group", 1:Prior$H)
myEntropy

plotLikeliPaths(outList, from=10, by=1 )

myNumEffTables <- calcNumEff( outList, thin=1, printXi=TRUE, printE=TRUE, 
    printBeta=TRUE, grLabels=paste("Group", 1:outList$Prior$H) ) 
str(myNumEffTables)

setwd(oldDir)

# ==================================================================================

if ( is.element("MCCExtExampleData$covariates", search())) { 
    detach(MCCExtExampleData$covariates)
}

# ==================================================================================
} # end if
# ==================================================================================

# ==================================================================================

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ regression }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
