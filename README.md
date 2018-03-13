# Programming-Assignment-2-Lexical-Scoping

Background
The second programming assignment for this course is a demonstration of lexical scoping using the cache. The file cachematrix.R contains a pair of functions that can store and recall a cached version of a square matrix and its inverse matrix.

Functions
makeCacheMatrix creates an object with the cache of a square matrix and creates a list of functions for interacting with the matrix. The complete set of functions are:

set Creates a cache of the matrix upon the call of makeCacheMatrix and clears any previous cached inverse matrix.
get Returns the cached matrix.
setinv Creates a cache of the solved inverse of the orignal cached matrix created by set.
getinv Returns the cached inverse matrix.
cacheSolve solves the inverse of the cached square matrix created by makeCacheMatrix. If the inverse of the cached matrix has already been solved, returns the cached version of the inverse matrix. Otherwise, solves the inverse matrix and stores it in the cache.

Usage
First, a variable mat is created to store a 2 x 2 matrix that will be passed to makeCacheMatrix.

> mat <- matrix(c(1:4),c(2,2))
> mat
     [,1] [,2]
[1,]    1    3
[2,]    2    4
The function makeCacheMatrix takes a matrix as its argument stores it in the cache. It also removed any previous inverse matrix that might have been stored in the cache. To demonstrate, a variable cacheMat will used to store the object created by 'makeCacheMatrix'.

> cacheMat <- makeCacheMatrix(mat)
> cacheMat$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> cacheMat$getinv()
NULL
The function cacheSolve can then be used to solve the inverse of the square matrix stored in cacheMat. Each time cacheSolve is run, it first checks to see if a solved inverse matrix has already been cached. If there is no cached matrix, cacheSolve will solve the inverse and then store it in the cache. Otherwise, cacheSolve returns the solved inverse matrix.

> cacheSolve(cacheMat)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(cacheMat)
Retreiving the cached inverse matrix...
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
The cached inverse matrix can also be retreived using the getinv function of the matrix object stored in cacheMat.

> cacheMat$getinv()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
