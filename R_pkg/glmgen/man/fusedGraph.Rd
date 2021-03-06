% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fusedGraph.R
\name{fusedGraph}
\alias{fusedGraph}
\title{Fit a fused lasso over a Decomposed Graph}
\usage{
fusedGraph(y, weights, edges, edgeWeights = NULL, lambda = NULL,
  nlambda = 20L, lambdaMinRatio = 1e-05, E = NULL, c = NULL, rho = 1,
  eps = 0.01, maxIter = 20, beta0 = NULL, method = c("prox", "dp"),
  verbose = FALSE)
}
\arguments{
\item{y}{the observed data points as a numeric vector.}

\item{weights}{optional sample weights. If provided, it must be the same length
as \code{y}.}

\item{edges}{a list object describing the edges in the chains. Each element in
the list should be a numeric vector describing the chains. See
Details for a description of how this should be specified.}

\item{edgeWeights}{an optional list of edge weights. Should be a list of the same
length as \code{edges}, with each component having the same length
as well.}

\item{lambda}{a sequence of lambda values at which to produce a fit. Can be
left blank (highly recommended for general use), at which point
the algorithm will determine appropriate lambda values.}

\item{nlambda}{if \code{lambda} is missing, this determines the number of lambda
values dynamically constructed by the algorithm.}

\item{lambdaMinRatio}{if \code{lambda} is missing, this determines the ratio between the
largest and smallest \code{lambda} values. The values are evenly
spaced on a log scale, so this ratio should typically be set fairly
small.}

\item{E}{an optional matrix for supplying a set of linear constraints on
the output. Columns corrispond to the (vectorised version of) the
data samples, and each row to a given constraint. See Details for
more information.}

\item{c}{an optional vector with one element per row of \code{E}. Gives
the right hand side of the constraint. If missing but \code{E}
is supplied, this will be assumed to be a vector of zeros.}

\item{rho}{a positive number used as a tuning parameter for the ADMM
procedure.}

\item{eps}{stopping parameter for the iterative algorithm.}

\item{maxIter}{maximal number of iterations for the algorithm.}

\item{beta0}{initial starting point for the algorithm; if \code{NULL}, the
default, the mean value of all inputs is used.}

\item{method}{method used to solve the 1D chains in the ADMM algorithms.
Currently either \code{dp} for Johnson's dynamic program or
\code{prox} for the proximal optimization method for Barbero and
Suvrit.}

\item{verbose}{logical. Should the function print out intermediate results
as it is running.}
}
\value{
an object of class 'glmgen', with methods for extracting
  coefficents and predictions.
}
\description{
Calculates the fused lasso over a graph, which has been
decomposed into a series of chains.
}
\details{
Each element in the list \code{edges} should idealy contain
  some permutation of the integers 1 through the length of \code{y}
  describing a path over the graph. This path may have holes, which
  can be specified by inserting negative, zero, or \code{NA} values
  into the list element. It is not strictly required that each chain
  visit every node in the graph (these orphaned nodes are simply
  considered to be have no constraints), however it is strictly not
  allowed for a cycle to visit a node multiple times.

  The \code{E} and \code{c} can be supplied to enforce the
  constraint Eb=c, where b is a vector of coefficients
  corrisponding to the vectorised version of \code{y}
  (i.e., \code{as.numeric(y)}). If \code{c} is missing, it will
  be assumed to be a vector of zeros.
}
\examples{

 set.seed(1)


}
\references{
Johnson, Nicholas A. "A Dynamic Programming Algorithm for the
   Fused Lasso and L0-Segmentation." Journal of Computational and
   Graphical Statistics 22.2 (2013): 246-260.

  Barbero, Alvaro, and Suvrit Sra. "Modular proximal optimization
   for multidimensional total-variation regularization." arXiv
   preprint arXiv:1411.0589 (2014).

  Barbero, Alvaro, and Suvrit Sra. "Fast Newton-type methods for
   total variation regularization." Proceedings of the 28th
   International Conference on Machine Learning (ICML-11). 2011.
}
\author{
Taylor Arnold
}
