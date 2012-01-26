\name{dmClustering}
\alias{dmClustering}
\alias{dmClust}
\alias{dmClustExtended}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Dirichlet Multinomial Clustering With And Without Mixtures-of-Experts Extension
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

This function provides Dirichlet Multinomial Clustering with or without multinomial logit model 
(mixtures-of-experts) extension (see \bold{References}). That is an MCMC sampler for the mixtures-of-experts 
extension of Dirichlet Multinomial clustering. It requires four mandatory arguments: \code{Data}, \code{Prior}, 
\code{Initial} and \code{Mcmc}; each representing a list of (mandatory) arguments: \code{Data} contains data 
information, \code{Prior} contains prior information, \code{Initial} contains information about starting conditions 
(initial values) and \code{Mcmc} contains the setup for the MCMC sampler.    

}
\usage{
dmClust( 
    Data = list( 
        dataFile = 
            stop("'dataFile' must be specified: filename or data"), 
        storeDir = "try01", mccFile = "mcc.RData"), 
    Prior = list( H = 4, alpha0 = 4, a0 = 1, alpha = 1, N0 = 10, 
        isPriorNegBin = FALSE, mccAsPrior = FALSE, 
        xiPooled = TRUE, persPrior = 7/10), 
    Initial = list( mccUse = FALSE, pers = 1/6, S.i.start = NULL), 
    Mcmc = list( kNo = 2, M = 50, M0 = 20, mOut = 5, mSave = 10, 
        showAcc = TRUE, monitor = FALSE, seed = 12345))
                      
dmClustExtended( 
    Data = list( 
        dataFile = 
            stop("'dataFile' must be specified: filename or data"), 
        storeDir = "try01", mccFile = "mcc.RData", 
        X = stop("X (matrix of covariates) must be specified")), 
    Prior = list( H = 4, a0 = 1, alpha = 1, N0 = 10, 
        isPriorNegBin = FALSE, mccAsPrior = FALSE, 
        xiPooled = TRUE, persPrior = 7/10, 
        betaPrior = "informative", betaPriorMean = 0, 
        betaPriorVar = 1), 
    Initial = list( mccUse = FALSE, pers = 1/6, 
        S.i.start = rep(1:H, N), Beta.start = NULL), 
    Mcmc = list( kNo = 2, M = 50, M0 = 20, mOut = 5, mSave = 10, 
        showAcc = TRUE, monitor = FALSE, seed = 12345))
}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{Data   }{ a list consisting of: \code{dataFile, storeDir, mccFile, X}. See \bold{Details}. }
  
  \item{Prior  }{ a list consisting of: \code{H, alpha0, a0, alpha, N0, isPriorNegBin, mccAsPrior, 
                  xiPooled, persPrior, betaPrior, betaPriorMean, betaPriorVar}. See \bold{Details}. }
  
  \item{Initial}{ a list consisting of: \code{mccUse, pers, S.i.start, Beta.start}. See \bold{Details}. }
  
  \item{Mcmc   }{ a list consisting of: \code{kNo, M, M0, mOut, mSave, showAcc, monitor, seed}. 
                  See \bold{Details}. }    

} 

\details{
%%  ~~ If necessary, more details than the description above ~~

Note that the values of the arguments indicated here have nothing to do with \emph{default values}! For a call of these 
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
                  where \eqn{K+1} is the number of categories \eqn{k=0,\ldots,K} and \eqn{N} the number of objects/units/individuals. 
                  The number of transitions (equal to time series length minus one) may be individual.}         
                           
    \item{\code{  storeDir}}{A character indicating the name of the directory (will be created if not already existing) where the log file and the results are to be stored.}     
        
    \item{\code{  mccFile}}{If not \code{NULL} the prior data (must have same format as \code{mccXiPrior} in \code{\link{LMEntryPaperData}} -- at least the \eqn{H}-th entry in the list 
                 has to be provided) or a character with the name of or the path to a file containing such data, which in this case must be named \dQuote{\code{mcc}}.      
                 The prior data contain prior information (in terms of probabilities) about transition probabilities 
                 (possibly from another estimation procedure). For further information see Section \bold{Prior Data} and \code{mccXiPrior} in \code{\link{LMEntryPaperData}}. }   
                 
    \item{\code{  X}}{The matrix of covariates (with \eqn{N} rows) including the unit vector for the intercept to be included in the multinomial logit model extension.}
                  
}


  \code{Prior} contains (see also Section \bold{Prior Data}):
  
\describe{  

  \item{\code{  H }}{ An integer \eqn{\geq 1}{>= 1} indicating the number of clusters/groups. }  
  
  \item{\code{  alpha0}}{ A numerical value determining the value of the prior parameter of the Dirichlet-prior for the group sizes 
                          \eqn{\eta_h} (\code{alpha0} \eqn{=\alpha_1=\ldots=\alpha_H}, thus equal for all \eqn{h}). }

  \item{\code{  a0}}{ A numerical value determining a parameter of the negative multinomial prior (see references for more details).}

  \item{\code{  alpha}}{ A numerical value determining a parameter of the negative multinomial prior (see references for more details).}

  \item{\code{  N0}}{A numerical value determining a parameter of the negative multinomial prior (see references for more details).}
  
  \item{\code{  isPriorNegBin}}{If \code{TRUE}, the product of negative binomial distributions is used instead of the negative multinomial distribution (see references for more details).}  

  \item{\code{  mccAsPrior}}{ If \code{mccAsPrior=TRUE}, prior information for the transition probabilities as provided by \code{mccFile} are used as prior parameters for the 
                    estimation process. In this case there are two further options depending on the value of \code{xiPooled}:
                    If \code{xiPooled=TRUE}, equal apriori transition probabilities are used for all groups (using 
                    \code{mcc[[1]]$xi}) and if \code{xiPooled=FALSE} group-specific apriori transition probabilities are used 
                    (using \code{mcc[[H]]$xi}). 
                    
                    If \code{mccAsPrior=FALSE}, a priori transition probabilities are determined depending on \code{persPrior}. In this case the
                    diagonal elements are set to \code{persPrior} and the off-diagonal elements to (1 - \code{persPrior})/\eqn{K}, equal for all groups.   }

  \item{\code{  xiPooled}}{ Only used if \code{mccAsPrior=TRUE} (see above): if \code{xiPooled=TRUE} equal apriori transition probabilities are used for all groups 
                   (using \code{mcc[[1]]$xi}) and if \code{xiPooled=FALSE} group-specific apriori transition probabilities are used 
                   (using \cr \code{mcc[[H]]$xi}). }
                   
  \item{\code{  persPrior}}{Only used if \code{mccAsPrior=FALSE}: a numerical value (between 0 and 1) indicates the persistence probability 
                   (equal for all diagonal elements) for the a priori transition probabilities. 
                   1/(K + 1) corresponds to uniform distribution in each row. }

  \item{\code{  betaPrior }}{A character. If "uninformative" (improper) prior parameters are used for the regression coefficients (i.e. betaPriorVar = \eqn{\infty}). 
                           Otherwise mean and variance of the normal prior distribution for the regression coefficients have to be specified. }
  
  \item{\code{  betaPriorMean, betaPriorVar }}{ Numerical values specifying the parameters of the normal prior distribution for the regression coefficients, only if \code{betaPrior!="uninformative"}. }

}


  \code{Initial} contains:   
  
\describe{  

  \item{\code{  mccUse }}{ If \code{TRUE}, prior information for the group sizes and the transition probabilities as provided with \code{mccFile} 
                   are used for the estimation process as initial values. 
                   If \code{FALSE}, initial values for group sizes are set to \eqn{1/H} and for transition 
                   probabilities determined by use of \code{pers} for the diagonal elements and (1 - \code{pers})/\eqn{K} for the off-diagonal elements. }

  \item{\code{  pers }}{ Only used if \code{mccUse=FALSE}: A numerical value (between 0 and 1) which indicates the persistence probabilities 
                 (equal for all diagonal elements). Note, that \eqn{1/(K+1)} corresponds to the uniform distribution in each row. }

  \item{\code{  S.i.start }}{A vector of length \eqn{N} giving an initial allocation (mandatory for \code{dmClustExtended}).}
  \item{\code{  Beta.start  }}{A matrix of dimension \code{ncol(X)} x \code{H} giving start values for the regression coefficients including the zero vector in the first column 
                                representing the baseline group. }

} 
 
 
  \code{Mcmc} contains:
  
\describe{ 

  \item{\code{  kNo}}{ A numerical value between 1 and \eqn{K+1} indicating the number of row elements to be updated in 
                       each iteration. Note that eventually notation \eqn{l} is used in the literature.}
  \item{\code{  M}}{An integer indicating the overall number of iterations.}
  \item{\code{  M0}}{An integer indicating the number of the first iteration \emph{after} the burn-in phase.}
  \item{\code{  mOut}}{An integer indicating that after each \code{mOut}-th iteration a report line is written to the output window/screen.}
  \item{\code{  mSave}}{An integer indicating that after each \code{mSave}-th iteration an intermediate storage of the workspace is carried out.}
  \item{\code{  showAcc}}{If \code{TRUE}, additionally the current acceptance rate of the recent \code{mOut} draws of the M-H-steps is shown in the log-file
                 and on the screen. Rule of thumb for the acceptance probability: should be around 0.25, at least between 0.15 and 0.4. }
  \item{\code{  monitor}}{If \code{TRUE}, the paths of the draws of \eqn{\mathbf{e}_h}{e_h} and \eqn{\boldsymbol{\xi}_h}{\xi_h} starting at the beginning (\eqn{m=1}) up to the 
                 current draws are shown and currently updated in a diagram. }
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
        The name of the output file starts with \dQuote{\code{DMC_}} or \dQuote{\code{DMC_Logit_newAux_}} respectively followed by the number of groups \code{H}, the 
        number of iterations \code{M} and the particular point in time when the function was called, with format: \code{yyyymmdd_hhmmss}. 
        E.g. \code{DMC_H4_M10000_20110218_045254.RData} or \cr
        \code{DMC_Logit_newAux_H4_M10000_20111121_165723.RData}.        
        }
  \item{accept }{A 3-dimensional array with dimension \eqn{M \times H*(K+1) \times 2}{M x H*(K+1) x 2}. This array contains the (calculated) acceptance probabilities
                  (\code{accProb}) of the M-H-algorithm and whether the draw(s) were accepted or not (\code{accYesNo}) for each row \eqn{j} in each 
                  group \eqn{h} in the \eqn{m}-th iteration. The first dimension indicates the \eqn{m}-th iteration, the second dim row \eqn{1,\ldots,K+1} in group 1, 
                  then row \eqn{1,\ldots,K+1} in group 2 and so on. The third dim indicates \code{accProb} and \code{accYesNo}. }
  \item{Beta.m }{ A 3-dimensional array of dimension \eqn{\code{ncol(X)} \times H \times M}{ncol(X) x H x M} containing the draws for the regression coefficients 
                  \eqn{\beta_h} in each \eqn{m}-th iteration step.}
  \item{bk0 }{ The prior parameters for the mean vectors of the normal (prior) distributions of the regression coefficients. }
  \item{Bk0inv }{ The prior parameters for the inverse variance-covariance matrices of the normal (prior) distributions of the regression coefficients. }
  \item{Data }{ The argument \code{Data}.}
  \item{e_h_0 }{A 3-dimensional array with dimension \eqn{K+1 \times K+1 \times H}{K+1 x K+1 x H}  containing the (calculated) initial values for \eqn{\bold{e}_h}{e_h}.}
  \item{e_h_m }{A 4-dimensional array with dimension \eqn{K+1 \times K+1 \times H \times M}{K+1 x K+1 x H x M} containing the draws for \eqn{\bold{e}_h}{e_h} in the \eqn{m}-th 
                   iteration step.}
  \item{eta_m }{ A matrix of dimension \eqn{M \times H}{M x H} containing the draws for \eqn{\eta_h} in each \eqn{m}-th iteration step.}
  \item{fileName }{ A character value indicating the name of the output file (see also \code{workspaceFile}).}
  \item{Initial }{ The argument \code{Initial}. }
  \item{K }{ An integer indicating the number of categories minus one (!). See \bold{Note}.}
  \item{logFileName }{A character value indicating the name of the log file and the corresponding directory.}
  \item{mcc }{ The prior data (see Section \bold{Prior Data}) provided with \code{mccFile}, \code{NULL} otherwise.}
  \item{Mcmc }{ The argument \code{Mcmc}.}
  \item{N }{ An integer indicating \eqn{N}, the number of individuals/units/objects. }
  \item{Njk.i }{ The data (see \bold{Details}) provided with \code{dataFile}.}
  \item{Prior }{ The argument \code{Prior}.}
  \item{S_i_freq }{A \eqn{H \times N}{H x N}-matrix containing the frequencies how often individual \eqn{i} was allocated to a certain group during the 
                      iterations from \code{M0+1} to code{M}.}  
  \item{xi_h_m }{ A 4-dimensional array of dimension \eqn{(K+1) \times (K+1) \times H \times M}{(K+1) x (K+1) x H x M} containing the draws for \eqn{\boldsymbol{\xi}_h}{\xi_h}
                    in each \eqn{m}-th iteration step.}                    
  \item{xi_prior }{A 3-dimensional array of dimension \eqn{(K+1) \times (K+1) \times H}{(K+1) x (K+1) x H} that contains the finally used a priori parameter values 
                     for \eqn{\boldsymbol{\xi}_h}{\xi_h}.}
  \item{bkN }{ The posterior parameters (in the last iteration step) for the mean vectors of the normal (posterior) distributions from which the regression coefficients were drawn. }
  \item{BkN }{ The posterior parameters (in the last iteration step) for the variance-covariance matrices of the normal (posterior) distributions from which the regression coefficients were drawn. }
  \item{logLike }{ A vector containing the values of the log-likelihood calculated in each iteration step.  }
  \item{logBetaPrior }{ A vector containing the values of the prior distribution for the regression coefficients calculated in each iteration step. }  
  \item{logEPrior }{ A vector containing the values of the prior distribution for \eqn{\bold{e}}{e} calculated in each iteration step.}  
  \item{logPostDens }{ A vector containing the values of the posterior density calculated in each iteration step.}
  \item{mMax }{ An integer giving the position (number of iteration) of the maximum value in the posterior density \code{logPostDens}. }
  \item{logClassLike }{ A vector containing the values of the log classification likelihood calculated in each iteration step.}
  \item{entropy }{ A vector containing the values of the entropy calculated in each iteration step. }
  \item{logEtaPrior }{ A vector containing the values of the prior distribution for the mixing proportions (group sizes) calculated in each iteration step. }

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\section{Prior Data }{  

The prior data (called \code{mcc} in the following) -- to be passed via \code{mccFile} in argument-list 
\code{Data} -- has to be a list of lists, indexed by \eqn{1,\ldots,H,H+1,\ldots}. Note that, 
depending on parameter \eqn{H} (the number of groups -- to be passed via \code{H} in argument-list \code{Prior}), 
there have to be at least \eqn{H} entries (each a list). See \code{mccXiPrior} in \code{\link{LMEntryPaperData}} for 
example. Within a call to \code{\link{dmClustering}} or \code{\link{mcClustering}}, at least \code{mcc[[H]]} has to 
be provided as a list containing \code{eta} and \code{xi}. \code{eta} is a vector of length \eqn{H} containing prior 
information about the relative group sizes of group \eqn{h=1,\ldots,H}. \code{xi} is a 3-dimensional 
array of dimension \eqn{(K+1) \times (K+1) \times H}{(K+1) x (K+1) x H}, containing prior information in terms of 
probabilities about the transition probabilities of group \eqn{h=1,\ldots,H} (see examples). 
  
}

\section{Log File }{

The log file keeps record of the progress of the estimation procedure (which is also shown on the screen). At first 
some prior parameters and the MCMC-settings and the name of the output file are documented. Then for each 
\code{mOut}-th iteration step (at least for \eqn{m=1, \ldots, 5, 10, 20, 50, 100, 200, 500}) information about the 
elapsed time and the expected time to the end and optionally the current acceptance rate (\code{showAcc=TRUE}) is 
indicated. Finally the total time is shown.      

For example:

\preformatted{Data loaded!
Data Information: Datafile = no file name , N = 9809 , K = 5
Manual Settings: No of groups H = 4 , kNo = 2
MCMC Parameters: M = 10000 , M0 = 5000 , mOut = 200 , mSave = 5000 , seed = 123456 , showAcc = TRUE
Prior Parameters for e_h (Neg Multinom): a0 = 1 , alpha = 1 , N0 = 10 , xi_prior (see below)
Information on xi_prior (for Neg Bin/Neg Multinom Prior):  with persPrior =  0.7  created xi_prior (equal in each group, mccAsPrior = FALSE & xiPooled = FALSE)
Prior information and parameters set!
Inital Values Information: mccUse = FALSE , pers = 0.7
Initial values set!
Initialisations done!
MCMC Iteration...
m = 1 ; Acc Rate of first draws = 0.54 
m = 2 ; duration of iter proc so far: 8.17 sec. ,  exp time to end: 1361.53  min. ; Acc Rate of last 2 draws = 0.5 
m = 3 ; duration of iter proc so far: 16.45 sec. ,  exp time to end: 1370.56  min. ; Acc Rate of last 3 draws = 0.49 
m = 4 ; duration of iter proc so far: 24.62 sec. ,  exp time to end: 1367.37  min. ; Acc Rate of last 4 draws = 0.49 
m = 5 ; duration of iter proc so far: 32.84 sec. ,  exp time to end: 1367.79  min. ; Acc Rate of last 5 draws = 0.53
m = 10 ; duration of iter proc so far: 73.97 sec. ,  exp time to end: 1368.58  min. ; Acc Rate of last 10 draws = 0.57
m = 20 ; duration of iter proc so far: 156.61 sec. ,  exp time to end: 1371.16  min. ; Acc Rate of last 20 draws = 0.61
m = 50 ; duration of iter proc so far: 404.42 sec. ,  exp time to end: 1368.84  min. ; Acc Rate of last 50 draws = 0.59
m = 100 ; duration of iter proc so far: 815.86 sec. ,  exp time to end: 1359.9  min. ; Acc Rate of last 100 draws = 0.61
m = 200 ; duration of iter proc so far: 1635.61 sec. ,  exp time to end: 1342.6  min. ; Acc Rate of last 200 draws = 0.62
m = 400 ; duration of iter proc so far: 3270.83 sec. ,  exp time to end: 1311.75  min. ; Acc Rate of last 200 draws = 0.51
m = 500 ; duration of iter proc so far: 4087.97 sec. ,  exp time to end: 1297.25  min. ; Acc Rate of last 200 draws = 0.47
m = 1000 ; duration of iter proc so far: 8165.91 sec. ,  exp time to end: 1226.25  min. ; Acc Rate of last 200 draws = 0.45
...
m = 10000 ; duration of iter proc so far: 81362.58 sec. ,  exp time to end: 0.14  min. ; Acc Rate of last 200 draws = 0.46
Total time:  22 hours 36 min}
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
\code{\link{mcClust}}, \code{\link{mcClustExtended}}, \code{\link{MNLAuxMix}}, 
\code{\link{MCCExampleData}}, \code{\link{MCCExtExampleData}}
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
myOutfilesDir <- "dmClust-Example-Outfiles"

# load data
data(MCCExampleData)

# function call 
system.time(
  outList <- dmClust(   # parameter lists (every four) must be complete!
     Data = list( dataFile=MCCExampleData$Njk.i,  
                     storeDir=myOutfilesDir,       
                     mccFile=MCCExampleData$somePrior),                     
     Prior   = list( H=2, # sample(2:5, 1), # 3 
                     alpha0=4, 
                     a0=1,      
                     alpha=1, 
                     N0=10,
                     isPriorNegBin=FALSE, 
                     mccAsPrior=TRUE, 
                     xiPooled=FALSE, 
                     persPrior=0.7),                     
     Initial = list( mccUse=FALSE, 
                     pers=1/3 ),                     
     Mcmc    = list( kNo=2, 
                     M=100, 
                     M0=20, 
                     mOut=5, 
                     mSave=50, 
                     showAcc=TRUE, 
                     monitor=FALSE, 
                     seed=sample(1:100000, 1) # 12345
     ) 
  )
)

str(outList)

#outFileName
#results <- load(outFileName)
#results

if (outList$Prior$H > 1) { 
    apply(outList$xi_h_m[,,,seq(outList$Mcmc$M0, outList$Mcmc$M, 1)], c(1,2,3), mean) 
    } else { 
    apply(outList$xi_h_m[,,,seq(outList$Mcmc$M0,outList$Mcmc$M,1)], c(1, 2), mean)
}

allocList <- calcAllocationsDMC(outList, thin=1, maxi=50) # , plotPathsForEta=TRUE
str(allocList)

myTransProbs <- calcTransProbs(outList, estGroupSize=allocList$estGroupSize, thin=1, 
    printXtable=FALSE, printSd=FALSE, printTogether=TRUE ) 
    # grLabels=paste("Group", 1:Prior$H), plotPaths=TRUE
str(myTransProbs)

myTransList <- plotTransProbs(outList, estTransProb=myTransProbs$estTransProb, 
    estGroupSize=allocList$estGroupSize, class=allocList$class, plotPooled=TRUE, 
    plotContTable=TRUE, printContTable=TRUE, plotContPooled=TRUE) 
    # , grLabels=paste("Group", 1:Prior$H)
str(myTransList)

(equiDist <- calcEquiDist(outList, thin=1, maxi=50)) 
# , printEquiDist=TRUE, plotEquiDist=TRUE, grLabels=paste("Group", 1:Prior$H)

myVariation <- calcVariationDMC(outList, thin=1, maxi=50) 
# , printVarE=TRUE, printUnobsHet=TRUE, printUnobsHetSd=TRUE, 
# printUnobsHetAll=TRUE, printAllTogether=TRUE, grLabels=paste("Group", 1:Prior$H)
str(myVariation)

myPars <- calcParMatDMC(outList, thin=1) 
# , grLabels=paste("Group", 1:Prior$H), printPar=TRUE
str(myPars)

myLongRunDistList <- calcLongRunDist(outList, 
    initialStateData=MCCExampleData$initialState, 
    class=allocList$class, equiDist=equiDist, thin=1, maxi=5) 
    # , printLongRunDist=TRUE, , grLabels=paste("Group", 1:Prior$H)
str(myLongRunDistList)

myTypicalMembs <- plotTypicalMembers(outList, moreTypMemb=c(10,13,17,20,23,27,30), 
    myObsList=MCCExampleData$obsList, classProbs=allocList$classProbs) 
    # , noTypMemb=7, moreTypMemb=c(10,25,50,100,200,500,1000)
str(myTypicalMembs)

plotScatter(outList, thin=1, xi11=c(1,1), xi12=c(2,2), xi21=c(2,2), 
    xi22=c(3,3), xi31=c(1,1), xi32=c(3,3) )

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

myMSCrits <- calcMSCritDMC(workDir=myOutfilesDir, myLabel="dmClust-Example", 
    myN0=paste("N0 =",outList$Prior$N0), 
    whatToDoList=c("postMode", "approxML", "approxMCL") )
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
myOutfilesDir <- "dmClustExtended-Example-Outfiles"      

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

outList <- dmClustExtended(      
     Data = list( dataFile=MCCExtExampleData$Njk.i,   
                  storeDir=myOutfilesDir,       
                  mccFile=NULL,   
                  X = cbind(intercept=1, alrateBezNew, unskilled, skilled, angStart )), 
     Prior   = list( H=groupNr, 
                     a0=1,      
                     alpha=1, 
                     N0=10,
                     isPriorNegBin=FALSE, 
                     mccAsPrior=FALSE, 
                     xiPooled=FALSE, 
                     persPrior=0.7,
                     betaPrior = "informative", # N(0,1)
                     betaPriorMean = 0,
                     betaPriorVar = 1),                     
     Initial = list( mccUse=FALSE, 
                     pers=1/3,
                     S.i.start = results$cluster,
                     Beta.start = toStartBeta ),      
     Mcmc    = list( kNo=2, 
                     M=100, 
                     M0=50, 
                     mOut=10, 
                     mSave=50,  
                     showAcc=TRUE, 
                     monitor=FALSE, 
                     seed=sample(1:100000, 1) # 564847
                   ) 
)

str(outList)

#outFileName <- outList$workspaceFile
#outFileName
#results <- load(outFileName)
#results

if (outList$Prior$H > 1) { 
    apply( outList$xi_h_m[,,,seq(outList$Mcmc$M0, outList$Mcmc$M, 1)], c(1,2,3), mean) 
    } else { 
    apply(outList$xi_h_m[,,,seq(outList$Mcmc$M0,outList$Mcmc$M,1)], c(1, 2), mean) 
}

allocList <- calcAllocationsDMCExt(outList, thin=1, maxi=50) 
str(allocList)

myTransProbs <- calcTransProbs(outList, estGroupSize=allocList$estGroupSize, thin=1, 
    printXtable=FALSE, printSd=FALSE, printTogether=TRUE ) 
    # grLabels=paste("Group", 1:Prior$H), plotPaths=TRUE
str(myTransProbs)

myTransList <- plotTransProbs(outList, estTransProb=myTransProbs$estTransProb, 
    estGroupSize=allocList$estGroupSize, class=allocList$class, plotPooled=TRUE, 
    plotContTable=TRUE, printContTable=TRUE, plotContPooled=TRUE) 
    # , grLabels=paste("Group", 1:Prior$H)
str(myTransList)

(equiDist <- calcEquiDist(outList, thin=1, maxi=50)) 
# , printEquiDist=TRUE, plotEquiDist=TRUE, grLabels=paste("Group", 1:Prior$H)

myVariation <- calcVariationDMC(outList, thin=1, maxi=50) 
# , printVarE=TRUE, printUnobsHet=TRUE, printUnobsHetSd=TRUE, 
# printUnobsHetAll=TRUE, printAllTogether=TRUE, grLabels=paste("Group", 1:Prior$H)
str(myVariation)

myPars <- calcParMatDMC(outList, thin=1) 
# , grLabels=paste("Group", 1:Prior$H), printPar=TRUE
str(myPars)

myRegCoeffs <- calcRegCoeffs(outList, hBase=2, thin=1) 
#, M0=Mcmc$M0, grLabels=paste("Group", 1:Prior$H), printHPD=TRUE, 
# plotPaths=TRUE, plotACFs=TRUE
str(myRegCoeffs)

myLongRunDistList <- calcLongRunDist(outList, initialStateData=initialState, 
    class=allocList$class, equiDist=equiDist, maxi=2) 
    # , printLongRunDist=TRUE
str(myLongRunDistList)

myTypicalMembs <- plotTypicalMembers(outList, myObsList=MCCExtExampleData$obsList, 
    classProbs=allocList$classProbs) 
    # , noTypMemb=7, moreTypMemb=c(10,25,50,100,200,500,1000)
str(myTypicalMembs)

plotScatter(outList, thin=1, xi11=c(1,1), xi12=c(2,2), xi21=c(2,2), 
    xi22=c(3,3), xi31=c(1,1), xi32=c(3,3) )

mySegPower <- calcSegmentationPower(outList, classProbs=allocList$classProbs, 
    class=allocList$class, printXtable=TRUE, calcSharp=TRUE, 
    printSharpXtable=TRUE ) 
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

myMSCrits <- calcMSCritDMCExt(workDir=myOutfilesDir, myLabel="dmClustExtended-Example", 
    myN0=paste("N0 =",outList$Prior$N0), 
    whatToDoList=c("postMode", "approxML", "approxMCL") )
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


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ cluster }
\keyword{ ts }% __ONLY ONE__ keyword per line
