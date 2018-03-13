## Functions that cache the inverse of a matrix

## source('cachematrix.R')
## m <- makeCacheMatrix(matrix(1:4, nrow=2, ncol=2)))
## cacheSolve(m)
##       [,1] [,2]
## [1,]   -2  1.5
## [2,]   1  -0.5

## Let us create a special "matrix" that is a list containing
## a function to
##   * set the value of the matrix
##   * get the value of the matrix
##   * set the value of the inverse matrix
##   * get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) i <<- inv
  getinverse <- function() i
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}

##  Solve the inverse of the cached square matrix created by
##  makeCacheMatrix above. If the inverse of the cached matrix
##  has already been solved, return the cached version of the
##  inverse matrix. Otherwise, solve the inverse matrix and
##  store it in the cache.


cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("Retreiving the cached inverse matrix...")
    return(i)
  }
  m <- x$get()
  i <- solve(m, ...)
  x$setinverse(i)
  i
}
