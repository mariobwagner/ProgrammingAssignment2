## Put comments here that give an overall description of what your
## functions do

## Comment
# Boths functions have to work together. First you have to run
# makeCacheMatrix() to create a list object that will be
# processed by cacheSolve().


## Write a short comment describing this function
# This function creates a list object with 4 items
# from the input matrix
makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Write a short comment describing this function
# This function DOES NOT uses the input matrix itself,
# it just uses the list created by makeCacheMatrix.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}
