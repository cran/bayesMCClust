\name{mcClustering}
\alias{mcClustering}
\alias{mcClust}
\alias{mcClustExtended}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Markov Chain Clustering With And Without Mixtures-of-Experts Extension
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

This function provides Markov chain clustering with or without multinomial logit model (mixtures-of-experts) 
extension (see \bold{References}). That is an MCMC sampler for the mixtures-of-experts extension of Markov chain 
clustering. It requires four mandatory arguments: \code{Data}, \code{Prior}, \code{Initial} and \code{Mcmc}; each 
representing a list of (mandatory) arguments: \code{Data} contains data information, \code{Prior} contains prior 
information, \code{Initial} contains information about starting conditions (initial values) and \code{Mcmc} contains 
the setup for the MCMC sampler.   

}
\usage{

mcClust( 
    Data = list( 
        dataFile = stop(
 "'dataFile' (=> Njk.i) must be specified: either 'filename' (path) or data"), 
        storeDir = "try01", priorFile = NULL), 
    Prior = list( H = 4, e0 = 4, c = 1, cOff = 1, usePriorFile = FALSE, 
        xiPooled = FALSE, N0 = 5), 
    Initial = list( xi.start.ind = 3, pers = 0.7, S.i.start = NULL), 
    Mcmc = list( M = 50, M0 = 20, mOut = 5, mSave = 10, seed = 12345))


mcClustExtended( 
    Data = list( 
        dataFile = stop(
 "'dataFile' (=> Njk.i) must be specified: either 'filename' (path) or data"), 
        storeDir = "try01", priorFile = NULL, 
        X = stop("X (matrix of covariates) must be specified")), 
    Prior = list( H = 4, c = 1, cOff = 1, usePriorFile = FALSE, 
        xiPooled = FALSE, N0 = 5, betaPrior = "informative", 
        betaPriorMean = 0, betaPriorVar = 1), 
    Initial = list( xi.start.ind = 3, pers = 0.7, 
        S.i.start = rep(1:H, N), Beta.start = NULL), 
    Mcmc = list( M = 50, M0 = 20, mOut = 5, mSave = 10, 
                 seed = 12345))

}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{Data   }{ a list consisting of: \code{dataFile, storeDir, priorFile, X}. See \bold{Details}. }
  
  \item{Prior  }{ a list consisting of: \code{H, e0, c, cOff, usePriorFile, xiPooled, N0, betaPrior, betaPriorMean, 
                  betaPriorVar}. See \bold{Details}. }
  
  \item{Initial}{ a list consisting of: \code{xi.start.ind, pers, S.i.start, Beta.start}. See \bold{Details}. }
  
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

    \item{\code{  dataFile}}{A 3-dim array having the transition counts/frequencies structure (like \code{Njk.i} 
                  in the example data sets) already loaded into the current environment/workspace. Or a character with the name of or the path 
                  to an .RData-\emph{file} which contains such a data set, in which case it must have the name 
                  \dQuote{\code{Njk.i}}. 
                  
                  It is required that this data have to be a 3-dimensional array of dimension \eqn{(K+1) \times (K+1) \times N}{(K+1) x (K+1) x N} containing the transition counts/frequencies, 
                  where \eqn{K+1} is the number of categories \eqn{k=0,\ldots,K}{k=0,...,K} and \eqn{N} the number of objects/units/individuals. 
                  The number of transitions (equal to time series length minus one) may be individual.}         
                           
    \item{\code{  storeDir}}{A character indicating the name of the directory (will be created if not already existing) where the results are to be stored.}     
        
    \item{\code{  priorFile}}{If not \code{NULL} the prior data (must have same format as \code{mccXiPrior} in \code{\link{LMEntryPaperData}} -- at least the \eqn{H}-th entry in the list 
                 has to be provided) or a character with the name of or the path to a file containing such data, which in this case must be named \dQuote{\code{mcc}}.      
                 The prior data contain prior information (in terms of probabilities) about transition probabilities 
                 (possibly from another estimation procedure). For further information see Section \bold{Prior Data} and \code{mccXiPrior} in \code{\link{LMEntryPaperData}}. }   
                 
    \item{\code{  X}}{The matrix of covariates (with \eqn{N} rows) including the unit vector for the intercept to be included in the multinomial logit model extension.}
        
}                


  \code{Prior} contains (see also Section \bold{Prior Data}):   
  
\describe{  

  \item{\code{  H }}{ An integer \eqn{\geq 1}{>= 1} indicating the number of clusters/groups. }  
  
  \item{\code{  e0}}{ A numerical value determining the value of the prior parameter of the Dirichlet-prior for the group sizes 
                 \eqn{\eta_h} (\code{e0} \eqn{=\alpha_1=\ldots=\alpha_H}, thus equal for all \eqn{h}). }  
                 
  \item{\code{  c,cOff}}{ are necessary to calculate the prior parameter matrix for \eqn{\xi} (equal for all groups): \code{diag(c) + cOff}. Only used when \code{usePriorFile=FALSE} -- see below.}
  
  \item{\code{  usePriorFile}}{ If \code{usePriorFile=TRUE}, prior information for the transition probabilities as provided by \code{priorFile} are used as prior parameters for the 
                    estimation process. In this case there are two further options depending on the value of \code{xiPooled}:
                    If \code{xiPooled=TRUE}, equal apriori transition probabilities are used for all groups (using 
                    \code{ceiling(Prior$N0*mcc[[1]]$xi)}) and if \code{xiPooled=FALSE} group-specific apriori transition probabilities are used 
                    (using \code{ceiling(Prior$N0*mcc[[H]]$xi)}). 
                    
                    If \code{usePriorFile=FALSE}, a priori transition probabilities are determined depending on \code{c} and \code{cOff}. In this case the
                    diagonal elements are set to \code{c + cOff} and the off-diagonal elements to \code{cOff}, equal for all groups.   }
                    
  \item{\code{  xiPooled}}{ Only used if \code{usePriorFile=TRUE} (see above): if \code{xiPooled=TRUE} equal apriori transition probabilities are used for all groups 
                   (using \code{ceiling(Prior$N0*mcc[[1]]$xi)}) and if \code{xiPooled=FALSE} group-specific apriori transition probabilities are used 
                   (using \cr \code{ceiling(Prior$N0*mcc[[H]]$xi)}). }
                   
  \item{\code{  N0}}{A numerical value determining a parameter for use in calculating the prior parameter matrix for \eqn{\xi} (see \code{usePriorFile}).}
  
  \item{\code{  betaPrior }}{A character. If "uninformative" (improper) prior parameters are used for the regression coefficients (i.e. betaPriorVar = \eqn{\infty}). 
                           Otherwise mean and variance of the normal prior distribution for the regression coefficients have to be specified. }
  
  \item{\code{  betaPriorMean, betaPriorVar }}{ Numerical values specifying the parameters of the normal prior distribution for the regression coefficients, only if \code{betaPrior!="uninformative"}. }
  
}


  \code{Initial} contains:   

\describe{

  \item{\code{  xi.start.ind }}{ An integer taking a value out of 1, 2, 3 or 4 to determine how to define the start values for \eqn{\xi}: 
                       If \code{xi.start.ind = 1}: the uniform distribution is used, meaning that all elements are equal to \eqn{1/(K+1)} in all groups. 
                       If \code{xi.start.ind = 2}: the empirical distribution/transition matrix (classical ML estimate of the transition matrix) is used (equal for all groups).
                       If \code{xi.start.ind = 3}: a \sQuote{persistence} distribution is used, meaning that the diagonal elements are equal to \code{pers} whereas all
                                                   off-diagonal elements are equal to (1-\code{pers})/K (equal for all groups). 
                       If \code{xi.start.ind = 4}: entry in prior file \code{mcc[[H]]$xi} is used directly for initial values.}
  \item{\code{  pers }}{ Only used if \code{xi.start.ind = 3}: A numerical value (between 0 and 1) which indicates the persistence probabilities 
                 (equal for all diagonal elements). Note, that \eqn{1/(K+1)} corresponds to the uniform distribution in each row. }
  \item{\code{  S.i.start }}{A vector of length \eqn{N} giving an initial allocation (mandatory for \code{mcClustExtended}).}
  \item{\code{  Beta.start  }}{A matrix of dimension \code{ncol(X)} x \code{H} giving start values for the regression coefficients including the zero vector in the first column 
                                representing the baseline group. }
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
        The name of the output file starts with \dQuote{\code{MCC_}} or \dQuote{\code{MCC_Logit_newAux_}} respectively followed by the number of groups \code{H}, the 
        number of iterations \code{M} and the particular point in time when the function was called, with format: \code{yyyymmdd_hhmmss}. 
        E.g. \code{MCC_H4_M10000_20110218_045254.RData} or \cr
        \code{MCC_Logit_newAux_H4_M10000_20111121_165723.RData}.        
        }
  \item{Data }{ The argument \code{Data}.}
  \item{Prior }{ The argument \code{Prior}.}
  \item{Initial }{ The argument \code{Initial}. }
  \item{Mcmc }{ The argument \code{Mcmc}.}
  \item{Beta.m }{ A 3-dimensional array of dimension \eqn{\code{ncol(X)} \times H \times M}{ncol(X) x H x M} containing the draws for the regression coefficients 
                  \eqn{\beta_h} in each \eqn{m}-th iteration step.}
  \item{bk0 }{ The prior parameters for the mean vectors of the normal (prior) distributions of the regression coefficients. }
  \item{Bk0inv }{ The prior parameters for the inverse variance-covariance matrices of the normal (prior) distributions of the regression coefficients. }
  \item{c0 }{ A 3-dimensional array with dimension \eqn{(K+1) \times (K+1) \times H}{(K+1) x (K+1) x H} that contains the finally used a priori parameter values 
                     for \eqn{\boldsymbol{\xi}_h}{\xi_h}.}
  \item{estTransProb }{ A 3-dimensional array with dimension \eqn{(K+1) \times (K+1) \times H}{(K+1) x (K+1) x H} that contains the ergodic average of \eqn{\boldsymbol{\xi}_h}{\xi_h} for all groups
                               (using draws from \code{M0} to \code{M} without thinning parameter).}
  \item{fileName }{ A character value indicating the name of the output file (see also \code{workspaceFile}).}
  \item{freq }{ matrix-matching (pattern recognition): a numerical vector containing the frequencies of different (!) transition matrices. (in ascending order)}
  \item{indizes }{ matrix-matching (pattern recognition): a numerical vector containing the indices of different (!) transition matrices. }
  \item{K }{ An integer indicating the number of categories minus one (!). See \bold{Note}.}
  \item{mcc }{ The prior data (see Section \bold{Prior Data}) provided with \code{priorFile}, \code{NULL} otherwise.}
  \item{N }{ An integer indicating \eqn{N}, the number of individuals/units/objects. }
  \item{Njk.i }{ The data (see \bold{Details}) provided with \code{dataFile}.}
  \item{Njk.i.ind }{ matrix-matching (pattern recognition): the resulting \code{Njk.i} after matrix-matching.}
  \item{R }{ matrix-matching (pattern recognition): number of different (!) transition matrices. }
  \item{S.i.counts }{ A \eqn{N \times H}{N x H}-matrix containing the frequencies how often individual \eqn{i} was allocated to a certain group during the 
                      iterations from \code{M0+1} to code{M}. }
  \item{totalTime }{ A numeric value indicating the total time (in secs) used for the function call.}
  \item{xi.hat }{ A matrix with dimension \eqn{(K+1) \times (K+1)}{(K+1) x (K+1)} containing the empirical transition probabilities (overall relative transition freqs).}
  \item{xi.m }{ A 4-dimensional array of dimension \eqn{M \times (K+1) \times (K+1) \times H}{M x (K+1) x (K+1) x H} containing the draws for \eqn{\boldsymbol{\xi}_h}{\xi_h} 
                in each \eqn{m}-th iteration step.}
  \item{xi.start }{ A matrix of dimension \eqn{(K+1) \times (K+1)}{(K+1) x (K+1)} that contains the starting values for \eqn{\boldsymbol{\xi}_h}{\xi_h} (only if \code{xi.start.ind = 3}).}
  \item{xi.start.ind }{ An integer indicating the used method to calculate/determine the starting values for \eqn{\boldsymbol{\xi}_h}{\xi_h}. }
  \item{bkN }{ The posterior parameters (in the last iteration step) for the mean vectors of the normal (posterior) distributions from which the regression coefficients were drawn. }
  \item{BkN }{ The posterior parameters (in the last iteration step) for the variance-covariance matrices of the normal (posterior) distributions from which the regression coefficients were drawn. }
  \item{logLike }{ A vector containing the values of the log-likelihood calculated in each iteration step.  }
  \item{logBetaPrior }{ A vector containing the values of the prior distribution for the regression coefficients calculated in each iteration step. }
  \item{logXiPrior }{ A vector containing the values of the prior distribution for the transition matrices calculated in each iteration step.}
  \item{logPostDens }{ A vector containing the values of the posterior density calculated in each iteration step.}
  \item{mMax }{ An integer giving the position (number of iteration) of the maximum value in the posterior density \code{logPostDens}. }
  \item{logClassLike }{ A vector containing the values of the log classification likelihood calculated in each iteration step.}
  \item{entropy }{ A vector containing the values of the entropy calculated in each iteration step. }
  \item{eta.start }{ Either a numeric value equal to 1/H or if \code{xi.start.ind = 4} the corresponding data (vector) from the prior file. }
  \item{estGroupSize }{ A numerical vector containing the ergodic average of \eqn{\eta_h} for all groups 
                               (using draws from \code{M0+1} to code{M} without thinning parameter). }
  \item{eta.m }{ A matrix of dimension \eqn{H \times M}{H x M} containing the draws for \eqn{\eta_h} in each \eqn{m}-th iteration step. }
  \item{logEtaPrior }{ A vector containing the values of the prior distribution for the mixing proportions (group sizes) calculated in each iteration step. }

}

\section{Prior Data }{  
    
The prior data (called \code{mcc} in the following) -- to be passed via \code{priorFile} in argument-list 
\code{Data} -- has to be a list of lists, indexed by \eqn{1,\ldots,H,H+1,\ldots}. Note that, 
depending on parameter \eqn{H} (the number of groups -- to be passed via \code{H} in argument-list \code{Prior}), 
there have to be at least \eqn{H} entries (each a list). See \code{mccXiPrior} in \code{\link{LMEntryPaperData}} for 
example. Within a call to \code{\link{dmClustering}} or \code{\link{mcClustering}}, at least \code{mcc[[H]]} has to 
be provided as a list containing \code{eta} and \code{xi}. \code{eta} is a vector of length \eqn{H} containing prior 
information about the relative group sizes of group \eqn{h=1,\ldots,H}. \code{xi} is a 3-dimensional 
array of dimension \eqn{(K+1) \times (K+1) \times H}{(K+1) x (K+1) x H}, containing prior information in terms of 
probabilities about the transition probabilities of group \eqn{h=1,\ldots,H} (see examples). 
  
}

\section{Reporting Progress (Log Protocol) }{

The log protocol keeps record of the progress of the estimation procedure and is shown on the screen. At first the 
name of the workspace file is documented. Then for each \code{mOut}-th iteration step (at least for \eqn{m=1, 
\ldots, 5, 10, 20, 50, 100, 200, 500}) information about the elapsed time and the expected time to the end is 
reported. Finally the total time is shown.     

For example:

\preformatted{workspaceFile:  tryN50000-sample02-01\MCC_Logit_newAux_H4_M10000_20111124_155650.RData   (within current working directory!) 
m = 1 ; duration of iter proc so far:  13.75 sec. 
m = 2 ; duration of iter proc so far: 21.59 sec.,  exp time to end: 3597.97  min. 
m = 3 ; duration of iter proc so far: 29.48 sec.,  exp time to end: 2456.18  min. 
m = 4 ; duration of iter proc so far: 37.36 sec.,  exp time to end: 2074.93  min. 
m = 5 ; duration of iter proc so far: 45.25 sec.,  exp time to end: 1884.66  min. 
m = 10 ; duration of iter proc so far: 84.94 sec.,  exp time to end: 1571.55  min. 
m = 20 ; duration of iter proc so far: 164.5 sec.,  exp time to end: 1440.24  min. 
m = 50 ; duration of iter proc so far: 403.08 sec.,  exp time to end: 1364.3  min. 
m = 100 ; duration of iter proc so far: 801.15 sec.,  exp time to end: 1335.38  min. 
m = 200 ; duration of iter proc so far: 1530.5 sec.,  exp time to end: 1256.32  min. 
m = 400 ; duration of iter proc so far: 3074.03 sec.,  exp time to end: 1232.82  min. 
m = 500 ; duration of iter proc so far: 3804.67 sec.,  exp time to end: 1207.35  min. 
m = 600 ; duration of iter proc so far: 4532.04 sec.,  exp time to end: 1185.47  min. 
m = 800 ; duration of iter proc so far: 6075.54 sec.,  exp time to end: 1166.06  min. 
m = 1000 ; duration of iter proc so far: 7715.48 sec.,  exp time to end: 1158.61  min. 
...}
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
%%  ~~who you are~~
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
\code{\link{dmClust}}, \code{\link{dmClustExtended}}, \code{\link{MNLAuxMix}}, 
\code{\link{LMEntryPaperData}}, \code{\link{MCCExampleData}}, 
\code{\link{MCCExtExampleData}}
}
\examples{

#rm(list=ls(all=TRUE))

# ==================================================================================
if ( TRUE ) {
# ==================================================================================

# set working directory
oldDir <- getwd()
curDir <- tempdir()
setwd(curDir)

if ( !file.exists("bayesMCClust-wd") ) dir.create("bayesMCClust-wd")
setwd("bayesMCClust-wd")
myOutfilesDir <- "mcClust-Example-Outfiles" 

# load data 
data(MCCExampleData)

# ==================================================================================

# function call 
system.time(
  outList <- mcClust(    # parameter lists (every four) must be complete!
     Data=list(dataFile=MCCExampleData$Njk.i, 
               storeDir=myOutfilesDir,
               priorFile= NULL), 
     Prior=list(H=2, # sample(2:6, 1), # 4 
                e0=4, 
                c=1,
                cOff=1,
                usePriorFile=FALSE,
                xiPooled=FALSE,
                N0=5), 
     Initial=list(xi.start.ind=3, 
                  pers=0.7), 
     Mcmc=list(M=100, 
               M0=20, 
               mOut=5, 
               mSave=50, 
               seed=sample(1:100000, 1) # 123 
     ) 
  )
)

str(outList)

#outFileName
#results <- load(outFileName)
#results
#estTransProb

allocList <- calcAllocationsMCC(outList, thin=1, maxi=50) # , plotPathsForEta=TRUE
str(allocList)

myTransProbs <- calcTransProbs(outList, estGroupSize=allocList$estGroupSize, thin=1, 
    printXtable=FALSE, printSd=FALSE, printTogether=TRUE ) 
    # , plotPaths=TRUE, grLabels=paste("Group", 1:Prior$H)
str(myTransProbs)

myTransList <- plotTransProbs(outList, estTransProb=myTransProbs$estTransProb, 
    estGroupSize=allocList$estGroupSize, class=allocList$class, plotPooled=TRUE, 
    plotContTable=TRUE, printContTable=TRUE, plotContPooled=TRUE) 
    # , grLabels=paste("Group", 1:Prior$H)
str(myTransList)

(equiDist <- calcEquiDist(outList, thin=1, maxi=50)) 
#, printEquiDist=TRUE, plotEquiDist=TRUE , grLabels=paste("Group", 1:Prior$H)

myLongRunDistList <- calcLongRunDist(outList, 
    initialStateData=MCCExampleData$initialState, 
    class=allocList$class, equiDist=equiDist, maxi=50) 
    # , printLongRunDist=TRUE, grLabels=paste("Group", 1:Prior$H)
str(myLongRunDistList)

myTypicalMembs <- plotTypicalMembers(outList, moreTypMemb=c(10,25,40,55,70,85,100), 
    myObsList=MCCExampleData$obsList, classProbs=allocList$classProbs) # noTypMemb=7
str(myTypicalMembs)

plotScatter(outList, thin=1, xi11=c(1,1), xi12=c(2,2), xi21=c(2,2), xi22=c(3,3), 
    xi31=c(1,1), xi32=c(3,3) )

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

myMSCrits <- calcMSCritMCC(workDir=myOutfilesDir, myLabel="mcClust-Example", H0=4, 
    whatToDoList=c("approxML", "approxMCL", "postMode") ) 
str(myMSCrits)

setwd(oldDir)

} # end if

# ==================================================================================
# ==================================================================================
# ==================================================================================

# ==================================================================================
if ( FALSE ) {
# ==================================================================================

rm(list=ls(all=TRUE))

# set working directory
oldDir <- getwd()
curDir <- tempdir()
setwd(curDir)

if ( !file.exists("bayesMCClust-wd") ) dir.create("bayesMCClust-wd")
setwd("bayesMCClust-wd") 
myOutfilesDir <- "mcClustExtended-Example-Outfiles"      

# load data 
data(MCCExtExampleData)
if (!is.element("MCCExtExampleData$covariates", search())) { 
    attach(MCCExtExampleData$covariates)
}

# ==================================================================================

groupNr <- 2 # sample(2:6, 1) # 3

# ==================================================================================

results <- kmeans( log( MCCExtExampleData$NjkiMat + 0.5 ) , groupNr, nstart=2)

# ==================================================================================

require(nnet, quietly = TRUE)
H <- groupNr
X = cbind( intercept=1, alrateBezNew, unskilled, skilled, angStart ) 

N <- dim(X)[1]
mX <- data.frame( cbind(group=as.factor( results$cluster ), X[,-1], 
    matrix(sample(1:H,H*N,replace=TRUE),N,H)) )

colnames(mX)[6:(6+groupNr-1)] <- 
    c( "as.1", "as.2", "as.3", "as.4", "as.5", "as.6" )[1:groupNr] 

tempMNom <- multinom(group ~ alrateBezNew+ unskilled+ skilled+ angStart, 
    data=as.data.frame(mX)) 

toStartBeta <- t(rbind(0,coef( tempMNom )))

# ==================================================================================
# function call 
outList <- mcClustExtended(      
     Data=list(dataFile=MCCExtExampleData$Njk.i, # parameter lists must be complete!!!
               storeDir=myOutfilesDir,
               priorFile= NULL,
               X = cbind( intercept=1, alrateBezNew, unskilled, skilled, angStart ) ), 
     Prior=list(H=groupNr, 
                c=1,
                cOff=1,
                usePriorFile=FALSE,
                xiPooled=FALSE,
                N0=5,
                betaPrior = "informative", # N(0,1)
                betaPriorMean = 0,
                betaPriorVar = 1),
     Initial=list(xi.start.ind=3, 
                  pers=0.7,
                  S.i.start = results$cluster,
                  Beta.start = toStartBeta ), 
     Mcmc=list(M=100, 
               M0=50, 
               mOut=10, 
               mSave=50, 
               seed=sample(1:100000, 1) # 69814651 
              ) 
     )

str(outList)

#outFileName <- outList$workspaceFile
#results <- load(outFileName)
#results
#estTransProb

allocList <- calcAllocationsMCCExt(outList, thin=1, maxi=50) 
str(allocList)

myTransProbs <- calcTransProbs(outList, estGroupSize=allocList$estGroupSize, thin=1, 
    printXtable=FALSE, printSd=FALSE, printTogether=TRUE ) 
    # plotPaths=TRUE, grLabels=paste("Group", 1:Prior$H)
str(myTransProbs)

myTransList <- plotTransProbs(outList, estTransProb=myTransProbs$estTransProb, 
    estGroupSize=allocList$estGroupSize, class=allocList$class, plotPooled=TRUE, 
    plotContTable=TRUE, printContTable=TRUE, plotContPooled=TRUE) 
    # , grLabels=paste("Group", 1:Prior$H)
str(myTransList)

(equiDist <- calcEquiDist(outList, thin=1, maxi=50)) 
# , printEquiDist=TRUE, plotEquiDist=TRUE, grLabels=paste("Group", 1:Prior$H)

myRegCoeffs <- calcRegCoeffs(outList, hBase=2, thin=1) 
#, M0=Mcmc$M0, grLabels=paste("Group", 1:Prior$H), 
# printHPD=TRUE, plotPaths=TRUE, plotACFs=TRUE
str(myRegCoeffs)

myLongRunDistList <- calcLongRunDist(outList, initialStateData=initialState, 
    class=allocList$class, equiDist=equiDist, maxi=50) 
    # , printLongRunDist=TRUE
str(myLongRunDistList)

myTypicalMembs <- plotTypicalMembers(outList, myObsList=MCCExtExampleData$obsList, 
    classProbs=allocList$classProbs) 
    # , noTypMemb=7, moreTypMemb=c(10,25,50,100,200,500,1000)
str(myTypicalMembs)

plotScatter(outList, thin=1, xi11=c(1,1), xi12=c(2,2), xi21=c(2,2), xi22=c(3,3), 
    xi31=c(1,1), xi32=c(3,3) )

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

myMSCrits <- calcMSCritMCCExt(workDir=myOutfilesDir, NN=outList$N, 
    myLabel="mcClustExtended-Example", ISdraws=100, H0=3, 
    whatToDoList=c("approxML", "approxMCL", "postMode" ) ) 
str(myMSCrits)

setwd(oldDir)

# ==================================================================================

if (is.element("MCCExtExampleData$covariates", search())) { 
    detach(MCCExtExampleData$covariates)
}

# ==================================================================================
} # end if
# ==================================================================================

# ==================================================================================
# ==================================================================================

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
\keyword{ ts }% __ONLY ONE__ keyword per line
