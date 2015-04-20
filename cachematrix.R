## Functions to create a matrix, get its value, calculate its inverse, and read that inverse
##
## This function defines a list of functions to set/create and get a matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y){
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setinverse <- function(solve){s <<- solve}
    getinverse <- function() s
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## Return the inverse of a matrix if already calculated. If not, calculate and cache the answer.

cacheSolve <- function(x) {
    ## Return a matrix that is the inverse of 'x'
    s <- x$getinverse()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data)
    x$setinverse(s)
    s
}
