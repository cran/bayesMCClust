\name{LMEntryPaperData}
\alias{LMEntryPaperData}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~

Data From Fruehwirth-Schnatter et al. (2011): "Labor market entry and earnings dynamics: Bayesian inference using 
mixtures-of-experts Markov chain clustering"   

}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~

The empirical analysis in Fruehwirth-Schnatter et al. (2011) is based on data from the Austrian Social Security 
Database (ASSD), which combines detailed longitudinal information on employment and earnings of all private sector 
workers in Austria since 1972 (see \bold{References}). The IEW Working Paper Zweimueller et al. (2009) (see 
\bold{Source}) gives an overview and a description of the main characteristics of the Austrian Social Security 
Database.    

The ASSD was made available for the Austrian Center of Labor Economics and the Analysis of the Welfare State 
(\url{http://www.labornrn.at/}). The considered sample consists of \eqn{N=49279} male Austrian workers, who enter 
the labor market for the first time in the years 1975 to 1985 and are less than 25 years old at entry. The cohort 
analysis is based on an observation period from 1975 to 2005.  

}
\usage{data(LMEntryPaperData)}
\format{
  The format is:
 \preformatted{
List of 6
 $ InitValBetas: num [1:25, 1:4] 0 0 0 0 0 0 0 0 0 0 ...
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : chr [1:25] "intercept" "unEmplRDist" "unskilled" "skilled" ...
  .. ..$ : chr [1:4] "h1" "h2" "h3" "h4"
 $ InitValClass: int [1:49279] 2 3 1 4 3 2 3 2 4 1 ...
 $ covariates  :'data.frame':   49279 obs. of  25 variables:
  ..$ intercept    : num [1:49279] 1 1 1 1 1 1 1 1 1 1 ...
  ..$ unEmplRDist  : num [1:49279] 0.91 0.697 0.905 0.91 1.051 ...
  ..$ unskilled    : num [1:49279] 0 0 0 0 0 0 0 1 0 0 ...
  ..$ skilled      : num [1:49279] 0 1 1 1 0 0 0 0 1 0 ...
  ..$ whiteColl    : num [1:49279] 0 0 1 0 1 0 0 1 1 1 ...
  ..$ wageCat1Dummy: num [1:49279] 1 1 1 0 0 1 1 1 0 0 ...
  ..$ wageCat2Dummy: num [1:49279] 0 0 0 0 1 0 0 0 0 1 ...
  ..$ wageCat3Dummy: num [1:49279] 0 0 0 1 0 0 0 0 1 0 ...
  ..$ wageCat4Dummy: num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ wageCat5Dummy: num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear76  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear77  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear78  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear79  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear80  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear81  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear82  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear83  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear84  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ entryYear85  : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ ia.ueRD.wc1D : num [1:49279] 0.91 0.697 0.905 0 0 ...
  ..$ ia.ueRD.wc2D : num [1:49279] 0 0 0 0 1.05 ...
  ..$ ia.ueRD.wc3D : num [1:49279] 0 0 0 0.91 0 ...
  ..$ ia.ueRD.wc4D : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ ia.ueRD.wc5D : num [1:49279] 0 0 0 0 0 0 0 0 0 0 ...
 $ mccXiPrior  :List of 1
  ..$ :List of 1
  .. ..$ xi: num [1:6, 1:6] 0.7 0.15 0.0333 0.0333 0.0333 ...
 $ NjkiMat     : num [1:49279, 1:36] 0 0 0 2 7 0 4 0 0 1 ...
 $ Njk.i       : num [1:6, 1:6, 1:49279] 0 0 0 0 0 0 0 1 1 0 ...
  ..- attr(*, "dimnames")=List of 3
  .. ..$ : chr [1:6] "0" "1" "2" "3" ...
  .. ..$ : chr [1:6] "0" "1" "2" "3" ...
  .. ..$ : NULL
 } 
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~

\code{LMEntryPaperData} is a list containing the following objects:

\describe{

    \item{\code{InitValBetas}}{contains a matrix with the initial values (used in our paper) for the logit 
        regression coefficients. }

    \item{\code{InitValClass}}{contains a vector with some initial values (used in our paper) for the 
        classification variable (group membership for 4 groups). }

    \item{\code{covariates}}{contains the data.frame with the covariates used in the logit regression model. 
        It contains the following variables:
        \tabular{llll}{ 
            \tab \tab {\code{unEmplRDist }} \tab {unemployment rate in the district} \cr
            \tab \tab {\code{unskilled }} \tab {dummy for unskilled workers} \cr
            \tab \tab {\code{skilled }} \tab {dummy for skilled workers} \cr
            \tab \tab {\code{whiteColl }} \tab {dummy for white collar workers} \cr       
            \tab \tab {\code{wageCat1Dummy,..., }} \tab { } \cr
            \tab \tab {\code{   wageCat5Dummy }} \tab {dummies for starting in the corresponding wage category} \cr
            \tab \tab {\code{entryYear76,...,}} \tab { } \cr
            \tab \tab {\code{   entryYear85 }} \tab {dummies for starting in the corresponding year} \cr
            
            \tab \tab {\code{ia.ueRD.wc1D,..., }} \tab { } \cr
            \tab \tab {\code{   ia.ueRD.wc5D }}   \tab {interaction variable for unemployment rate in the} \cr
            \tab \tab {\code{                }}   \tab {  district and the dummies for starting in the } \cr         
            \tab \tab {\code{                }}   \tab {  corresponding wage category}            
        }
    }
                   
    \item{\code{mccXiPrior}}{contains the prior-parameters (used in the paper) for the transition matrices.  }

    \item{\code{NjkiMat}}{contains the \code{Njk.i}-data in matrix format of dimension \eqn{49279 \times 36}{49279x36} 
        (each row corresponds to the columns of the matrices in \code{Njk.i}).  }

    \item{\code{Njk.i}}{contains the transition frequencies in a 3-dim array of dimension \eqn{6 \times 6 
        \times 49279}{6x6x49279} containing the transition frequencies (\eqn{6 \times 6}{6 x 6}-matrices) of 49279 
        individuals. These represent the counts of transitions between wage categories from year to year with varying 
        observation periods. Categories 1 to 5 correspond to the wage quintiles and 0 to no income.   }

}

}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~

The following IEW Working Paper gives an overview and a description of the main characteristics of the Austrian 
Social Security Database: 

Zweimueller, Josef, Winter-Ebmer, Rudolf, Lalive, Rafael, Kuhn, Andreas,
Wuellrich, Jean-Philippe, Ruf, Oliver and Buechi, Simon, Austrian Social
Security Database (May 4, 2009). Available at SSRN:
\url{http://ssrn.com/abstract=1399350} or at \url{http://www.labornrn.at/wp/wp0903.pdf}.

}
\note{
%%  ~~further notes~~

Note, that in contrast to the literature (see \bold{References}), the numbering (labelling) of the states of the 
categorical outcome variable (time series) in this package is sometimes \eqn{0,\ldots,K}{0,...,K} (instead of 
\eqn{1,\ldots,K}{1,...,K}), however, there are \eqn{K+1} categories (states)!    

}
\references{
%%  ~~ possibly secondary sources and usages ~~

Sylvia Fruehwirth-Schnatter, Christoph Pamminger, Andrea Weber and Rudolf Winter-Ebmer, (2011), 
"Labor market entry and earnings dynamics: Bayesian inference using 
mixtures-of-experts Markov chain clustering". 
\emph{Journal of Applied Econometrics}. DOI: 10.1002/jae.1249 
\url{http://onlinelibrary.wiley.com/doi/10.1002/jae.1249/abstract}

Link to Journal of Applied Econometrics Data Archive: 
\url{http://econ.queensu.ca/jae/forthcoming/fruehwirth-schnatter-et-al/} 

}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{mcClustExtended}}
} 
\examples{ 
data(LMEntryPaperData)
str(LMEntryPaperData)

# =====================   LMEntry Paper Data   =================================
#rm(list=ls(all=TRUE))

# set working directory
curDir <- getwd()

if ( !file.exists("bayesMCClust-wd") ) dir.create("bayesMCClust-wd")
setwd("bayesMCClust-wd") 
myOutfilesDir <- "LMEntry-Paper-Data-Outfiles"      
# ==============================================================================
if (!is.element("LMEntryPaperData$covariates", search())) { 
    attach(LMEntryPaperData$covariates)
}
# ==============================================================================
groupNr <- 4
# ==============================================================================
if ( FALSE ) {
  try(mcClustExtended(      # parameter lists (all four) must be complete!!!
     Data=list(dataFile=LMEntryPaperData$Njk.i, 
               storeDir=myOutfilesDir,
               priorFile= LMEntryPaperData$mccXiPrior,
               X = cbind( intercept=1, unEmplRDist, unskilled, skilled, whiteColl, 
                                    wageCat1Dummy, wageCat2Dummy, wageCat3Dummy, 
                                    wageCat4Dummy, wageCat5Dummy,
                                    entryYear76, entryYear77, entryYear78, 
                                    entryYear79, entryYear80, entryYear81, 
                                    entryYear82, entryYear83, entryYear84, 
                                    entryYear85,
                                    ia.ueRD.wc1D, ia.ueRD.wc2D, ia.ueRD.wc3D, 
                                    ia.ueRD.wc4D, ia.ueRD.wc5D
                        ) ),
     Prior=list(H=groupNr, 
                c=1,
                cOff=1,
                usePriorFile=TRUE,
                xiPooled=TRUE,
                N0=10,
                betaPrior = "informative", # N(0,1)
                betaPriorMean = 0,
                betaPriorVar = 1),
     Initial=list(xi.start.ind=3, 
                  pers=0.7,
                  S.i.start = LMEntryPaperData$InitValClass,
                  Beta.start = LMEntryPaperData$InitValBetas ), 
     Mcmc=list(M=15000,
               M0=10000,
               mOut=500,
               mSave=5000,
               seed=3546541) 
  ))
}

setwd(curDir)

if (is.element("LMEntryPaperData$covariates", search())) {
    detach(LMEntryPaperData$covariates)
}
# ==============================================================================
}
\keyword{datasets}
