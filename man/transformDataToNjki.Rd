\name{transformDataToNjki}
\alias{transformDataToNjki}
\alias{dataFrameToNjki}
\alias{dataListToNjki}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Transform Markov Chain (Time Series) Data Into Transition Frequency Structure
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~

Transform time series (Markov chain) data with several states/categories into the required Njk.i-structure 
containing the transition frequencies between these states/categories. 

The functions \code{dataFrameToNjki} and \code{dataListToNjki} transform time series data representing Markov chains 
with several states/categories in a format ready for use in \code{\link{mcClustering}} and 
\code{\link{dmClustering}} and their versions without extension.   
  
The resulting data format is a 3-dim array which contains the absolute transition frequencies stored in a matrix for 
each individual (see section \bold{Value}).  
  
With \code{dataFrameToNjki} a \code{\link{data.frame}} or \code{\link{matrix}} where the \emph{rows} contain the 
time series (implying equal lengths \eqn{T}) can be transformed.  

Note that by using a special (different) 'number' (end-of-line) to indicate the (earlier) end (and/or remainder) of 
a time series (and with which the vector may be filled afterwards), it is also possible to use this procedure when 
later deleting the corresponding row and column in the transition frequency matrices.    
  
With \code{dataListToNjki} a \code{\link{list}} of vectors representing the time series (which may have individual 
lengths \eqn{T_i}) can be transformed. 

}
\usage{
dataFrameToNjki(dataFrame)
dataListToNjki(dataList)
}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{dataFrame}{
%%     ~~Describe \code{dataFrame} here~~

\code{\link{data.frame}} or \code{\link{matrix}} of dimension \eqn{N \times T}{N x T} where the \eqn{i}-th row 
contains the time series of the \eqn{i}-th individual. \eqn{N} is the number of individuals/units/objects and 
\eqn{T} is the number of columns not necessarily equal to the length of the time series. The time series itself may 
be of different lengths and the end and/or remainder of the rows are indicated or filled up with a different 
(special) number (end-of-line; e.g. zero). In such a case it is necessary to delete the corresponding row and column 
in the resulting transition frequency matrices. 

  }
  \item{dataList}{
%%     ~~Describe \code{dataList} here~~

A \code{\link{list}} of \eqn{N} vectors where the \eqn{i}-th entry corresponds to the time series (with possibly 
individual length \eqn{T_i}) of the \eqn{i}-th individual. 

  }
  
}
\details{
%%  ~~ If necessary, more details than the description above ~~

Note that for a single individual the number of \emph{transitions} is always equal to one minus length of time 
series; that is \eqn{T-1} or \eqn{T_i-1}, respectively. 
  
The categories/states of the Markov chain and optionally the end-of-line number should have consecutive numbering. 
By default, either functions DO NOT transform the (original) indexing of the categories/states into 
\eqn{0,\ldots,K}{0,...,K} (e.g. if the original numbering started with 1). The ORIGINAL numbering IS used for the 
indexing of the (resulting) transition matrices. Note that the number of different categories here is 
\eqn{K+1} (see remark in \bold{Note}).  
  
In other words, the (consecutive) numbering of the categories is NOT transformed into \eqn{0,\ldots,K}{0,...,K}. 
If an end-of-line or end-of-time-series symbol/number appears (in \code{dataFrame}) the corresponding 
rows/columns in the returned 3-dim array (see \bold{Value}) can be deleted afterwards. 

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...

%invisible( Njk.i )

A three-dimensional array of format \eqn{(K + 1) \times (K + 1) \times N}{(K + 1) x (K + 1) x N} where each 
\eqn{i}-th matrix represents the transition frequencies of individual \eqn{i}. \eqn{(K+1)} is equal to the number of 
different categories/states. 

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
# rm(list=ls(all=TRUE))

# set working directory
getwd()
if ( !file.exists("bayesMCClust-wd") ) dir.create("bayesMCClust-wd")
setwd("bayesMCClust-wd") 

# define data 
data(MCCExampleData)

myObsList <- MCCExampleData$obsList
class(myObsList)
length(myObsList)
myObsList[1:5]  # no end-of-line here!
table( unlist(myObsList) ) # categories consecutively numbered?

njki <- dataListToNjki(myObsList) # generate array for N transition matrices
dim(njki)
njki[,,1:5]  # for verification
apply(njki, c(1, 2), sum) # sum up all transitions of all individuals

tsLength <- sapply(myObsList, length) # calculate time series lengths
table(tsLength) # at least 2? -- corresponds to at least 1 transition

Njk.i <- njki # store Njk.i
# save( Njk.i, file = "Njk_i.RData" )      # save Njk.i in "Njk_i.RData"
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }
\keyword{ cluster }
\keyword{ ts }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
