## R Programming Assignment 2: create two functions to cache and return the 
## inverse of a matrix,

## makeCacheMatrix: This function creates a special "matrix" object that can 
## cache its inverse.The matrix is assumed to be a square invertible matrix.

makeCacheMatrix <- function(x = matrix()) {
    ## use "<<-" operator to assign values to the cached matrix and null value to inverse matrix 
    matrix_object <<- x
    matrix_inverse <<- NULL
    ## list(matrix_object = matrix_object, matrix_inverse = matrix_inverse) # just a test print
    }


## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve should retrieve the inverse 
## from the cache. Tested this with two test 3x3 matrixes using command such as: 
## "test_matrix <- matrix(sample.int(10, 9, 3, 3))".

cacheSolve <- function(x, ...) {
        ## first test to make certain the matrix is same as cached matrix
        if (!isTRUE(all.equal(x, matrix_object))) {
            message("input matrix is not the same as cached matrix!")
        }
        ## check to see if inverse is stored in cache
        else if (!is.null(matrix_inverse)) {
            message("getting cached inverse matrix:")
            return(matrix_inverse)
        }
        ## if inverse is not stored in cache then calculate inverse with solve()
        else {
            matrix_inverse <<- solve(m)
            message("calculating the inverse matrix:")
            return(matrix_inverse)
        }
}
