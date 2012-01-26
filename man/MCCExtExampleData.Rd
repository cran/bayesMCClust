\name{MCCExtExampleData}
\alias{MCCExtExampleData}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
An Extended MCC/DMC Example Data Set Including Covariates
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~

An extended MCC/DMC example data set including covariates and response variables -- a data set for demonstration purposes... 

This small data set is from data from the Austrian Social Security Database (ASSD), which combines detailed 
longitudinal information on employment and earnings of all private sector workers in Austria since 1972. The IEW 
Working Paper Zweimueller et al. (2009) (see \bold{Source}) gives an overview and a description of the main 
characteristics of the Austrian Social Security Database.     

The ASSD was made available for the Austrian Center of Labor Economics and the Analysis of the Welfare State 
(\url{http://www.labornrn.at/}). This small sample consists of \eqn{N=9402} male Austrian workers, who enter the 
labor market for the first time in the years 1975 to 1985 and are less than 25 years old at entry. The cohort 
analysis is based on an observation period from 1975 to 2005. 

}
\usage{data(MCCExtExampleData)}
\format{
  The format is:
 \preformatted{
List of 4
 $ Njk.i     : num [1:6, 1:6, 1:9402] 0 0 0 0 0 0 0 0 0 0 ...
  ..- attr(*, "dimnames")=List of 3
  .. ..$ : chr [1:6] "0" "1" "2" "3" ...
  .. ..$ : chr [1:6] "0" "1" "2" "3" ...
  .. ..$ : NULL
 $ covariates:'data.frame': 9402 obs. of  4 variables:
  ..$ alrateBezNew        : num [1:9402] 5.97 2.1 2.47 4.26 5.05 ...
  ..$ angStart            : num [1:9402] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ skilled             : int [1:9402] 0 0 0 0 0 0 0 0 0 0 ...
  ..$ unskilled           : int [1:9402] 0 0 0 0 0 0 0 0 0 0 ...
 $ NjkiMat   : num [1:9402, 1:36] 0 0 3 0 1 0 0 1 0 2 ...
 $ obsList   :List of 9402
  ..$ SVNR2166110217: int [1:9] 0 2 2 2 2 2 2 2 2
  ..$ SVNR1924158211: int [1:10] 1 0 3 2 3 2 3 4 4 2
  ..$ SVNR1982609045: int [1:10] 1 0 2 3 0 0 0 4 0 0
  .. [list output truncated]
 $ MNLresponse2gr: int [1:9402] 2 2 2 2 1 2 2 2 2 1 ...
 $ MNLresponse3gr: int [1:9402] 3 2 2 3 1 3 3 2 3 1 ...
 $ MNLresponse4gr: int [1:9402] 2 4 3 4 1 2 4 4 4 4 ...
 } 
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~

\code{MCCExtExampleData} is a list containing the following objects:

\describe{

    \item{\code{Njk.i} }{A 3-dimensional array of dimension \eqn{6 \times 6 \times 9402}{6x6x9402} 
        containing the transition frequencies (\eqn{6 \times 6}{6 x 6}-matrices) of 
        9402 individuals. These represent the counts of transitions between wage categories from year to 
        year with varying observation periods. Categories 1 to 5 correspond to the wage quintiles and 0 to 
        no income.}
    
    \item{\code{covariates} }{contains the data.frame with the covariates used in the logit regression model. 
        It contains the following variables:
        \tabular{llll}{ 
            \tab \tab {\code{alrateBezNew }} \tab {unemployment rate in the district} \cr
            \tab \tab {\code{angStart }} \tab {dummy for white collar workers} \cr
            \tab \tab {\code{skilled }} \tab {dummy for skilled workers} \cr
            \tab \tab {\code{unskilled }} \tab {dummy for unskilled workers} 
        }
    }
    
    \item{\code{NjkiMat}}{contains the \code{Njk.i}-data in matrix format of dimension \eqn{9402 \times 36}{9402x36} 
        (each row corresponds to the columns of the matrices in \code{Njk.i}).  }

    \item{\code{obsList} }{A list of 9402 numeric vectors (of integers with variable lengths) representing 
        wage categories. Wage mobility time series with variable lengths describing (transitions between) wage 
        categories (from year to year) of 9402 individuals where categories 1 to 5 correspond to the wage 
        quintiles (in the income distribution of the corresponding year) and 0 to no income. Each positive 
        number represents the position in the income distribution in terms of quintiles of a particular year. }
    
    \item{\code{MNLresponse2gr,...,MNLresponse4gr} }{vectors containing the response variable for \eqn{h=2,3,4} 
         clusters/groups, (necessary) for use in \code{\link{MNLAuxMix}} (for demonstration purposes).}

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

Christoph Pamminger and Sylvia Fruehwirth-Schnatter, (2010), 
"Model-based Clustering of Categorical Time Series". 
\emph{Bayesian Analysis}, Vol. 5, No. 2, pp. 345-368. DOI: 10.1214/10-BA606  
\url{http://ba.stat.cmu.edu/journal/2010/vol05/issue02/pamminger.pdf}

}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{LMEntryPaperData}}, \code{\link{MCCExampleData}}, \code{\link{mcClustExtended}}, \code{\link{dmClustExtended}}, 
\code{\link{MNLAuxMix}}
}
\examples{
data(MCCExtExampleData)
str(MCCExtExampleData) 

# see example(s) in mcClustExtended, dmClustExtended, MNLAuxMix or LMEntryPaperData
}
\keyword{datasets}
