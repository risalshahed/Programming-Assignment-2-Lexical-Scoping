# Programming-Assignment-2-Lexical-Scoping

##Mean Vector

Introduction This second programming assignment will require you to write an R function that is able to cache potentially time-consuming computations. For example, taking the mean of a numeric vector is typically a fast operation. However, for a very long vector, it may take too long to compute the mean, especially if it has to be computed repeatedly (e.g. in a loop). If the contents of a vector are not changing, it may make sense to cache the value of the mean so that when we need it again, it can be looked up in the cache rather than recomputed. In this Programming Assignment you will take advantage of the scoping rules of the R language and how they can be manipulated to preserve state inside of an R object.

Example: Caching the Mean of a Vector In this example we introduce the <<- operator which can be used to assign a value to an object in an environment that is different from the current environment. Below are two functions that are used to create a special object that stores a numeric vector and caches its mean.

The first function, makeVector creates a special "vector", which is really a list containing a function to

set the value of the vector get the value of the vector set the value of the mean get the value of the mean makeVector <- function(x = numeric()) { m <- NULL set <- function(y) { x <<- y m <<- NULL } get <- function() x setmean <- function(mean) m <<- mean getmean <- function() m list(set = set, get = get, setmean = setmean, getmean = getmean) } The following function calculates the mean of the special "vector" created with the above function. However, it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.

cachemean <- function(x, ...) { m <- x$getmean() if(!is.null(m)) { message("getting cached data") return(m) } data <- x$get() m <- mean(data, ...) x$setmean(m) m }

##Cache Matrix

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
