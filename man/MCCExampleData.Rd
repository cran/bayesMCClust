\name{MCCExampleData}
\alias{MCCExampleData}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
A Small MCC/DMC Example Data Set
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~

A small MCC/DMC example data set -- a small data set for demonstration purposes... 

This small data set is from data from the Austrian Social Security Database (ASSD), which combines detailed 
longitudinal information on employment and earnings of all private sector workers in Austria since 1972. The IEW 
Working Paper Zweimueller et al. (2009) (see \bold{Source}) gives an overview and a description of the main 
characteristics of the Austrian Social Security Database.     

The ASSD was made available for the Austrian Center of Labor Economics and the Analysis of the Welfare State 
(\url{http://www.labornrn.at/}). This small sample consists of \eqn{N=1000} male Austrian workers, who enter the 
labor market for the first time in the years 1975 to 1985 and are less than 25 years old at entry. The cohort 
analysis is based on an observation period from 1975 to 2005. 

}
\usage{data(MCCExampleData)}
\format{
  The format is:
 \preformatted{ 
List of 4
 $ Njk.i       : num [1:6, 1:6, 1:1000] 0 0 0 0 0 0 0 0 0 0 ...
  ..- attr(*, "dimnames")=List of 3
  .. ..$ : chr [1:6] "0" "1" "2" "3" ...
  .. ..$ : chr [1:6] "0" "1" "2" "3" ...
  .. ..$ : NULL
 $ initialState: num [1:1000] 4 1 4 3 0 1 2 1 4 2 ...
 $ obsList     :List of 1000
  ..$ SVNR1680347701: int [1:26] 4 4 5 5 5 5 5 5 5 5 ...
  ..$ SVNR1681207417: int [1:26] 1 1 0 0 0 0 0 2 0 0 ...
  ..$ SVNR1681671288: int [1:26] 4 0 0 1 0 5 5 5 5 5 ...
  .. [list output truncated]
 $ somePrior   :List of 5
  ..$ :List of 2
  .. ..$ xi : num [1:6, 1:6] 0.7303 0.1521 0.0901 0.0589 0.0435 ...
  .. .. ..- attr(*, "dimnames")=List of 2
  .. .. .. ..$ : chr [1:6] "0" "1" "2" "3" ...
  .. .. .. ..$ : chr [1:6] "0" "1" "2" "3" ...
  .. ..$ eta: num 1
  ..$ :List of 2
  .. ..$ eta: num [1:2] 0.632 0.368
  .. ..$ xi : num [1:6, 1:6, 1:2] 0.2163 0.1072 0.0576 0.0373 0.0286 ...
  ..$ :List of 2
  .. ..$ eta: num [1:3] 0.243 0.258 0.5
  .. ..$ xi : num [1:6, 1:6, 1:3] 0.5075 0.2408 0.1595 0.1048 0.0744 ...
  ..$ :List of 2
  .. ..$ eta: num [1:4] 0.193 0.221 0.238 0.348
  .. ..$ xi : num [1:6, 1:6, 1:4] 0.556 0.245 0.196 0.136 0.1 ...
  ..$ :List of 2
  .. ..$ eta: num [1:5] 0.246 0.232 0.156 0.143 0.223
  .. ..$ xi : num [1:6, 1:6, 1:5] 0.2104 0.1581 0.0665 0.0414 0.0388 ...
 } 
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~

\code{MCCExampleData} is a list containing the following objects:

\describe{

    \item{\code{Njk.i} }{A 3-dimensional array of dimension \eqn{6 \times 6 \times 1000}{6x6x1000} 
        containing the transition frequencies (\eqn{6 \times 6}{6 x 6}-matrices) of 
        1000 individuals. These represent the counts of transitions between wage categories from year to 
        year with varying observation periods. Categories 1 to 5 correspond to the wage quintiles and 0 to 
        no income.}
    
    \item{\code{initialState} }{A vector giving the initial wage category for 1000 individuals.}
    
    \item{\code{obsList} }{A list of 1000 numeric vectors (of integers with variable lengths) representing 
        wage categories. Wage mobility time series with variable lengths describing (transitions between) wage 
        categories (from year to year) of 1000 individuals where categories 1 to 5 correspond to the wage 
        quintiles (in the income distribution of the corresponding year) and 0 to no income. Each positive 
        number represents the position in the income distribution in terms of quintiles of a particular year. }
    
    \item{\code{somePrior} }{A list of lists each containing prior-parameters for the group sizes and 
        transition probabilities where the (index) number of the list corresponds to the number of 
        clusters/groups. }

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
\code{\link{LMEntryPaperData}}, \code{\link{MCCExtExampleData}}, \code{\link{mcClust}}, \code{\link{dmClust}}

}
\examples{
data(MCCExampleData)
str(MCCExampleData) 

# see example(s) in mcClust and dmClust
}
\keyword{datasets}
