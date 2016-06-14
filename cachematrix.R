## R Programming Assignment 2: create two functions to cache and return the 
## inverse of a matrix,

## makeCacheMatrix: This function creates a special "matrix" object that can 
## cache its inverse.The matrix is assumed to be a square invertible matrix.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}



## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve should retrieve the inverse 
## from the cache. Note: pass to cacheSolve the return of makeCacheMatrix, not 
## matrix itself.

cacheSolve <- function(x, ...) {
    ## first determine if inverse matrix is in cache, if so return the inverse
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    ## if inverse is not already in cache, then calculate and return the inverse
    message("calculating matrix inverse")
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}
