## Caching the Inverse of a Matrix

## makeCacheMatrix: This function creates a special "matrix" object that can 
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL

        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        get <- function() x
        
        setInverse <- function(inverse) m <<- inverse
        
        getInverse <- function() m
        
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve the 
## inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        minv <- x$getInverse()

        if (!is.null(minv)) {
                return(minv)
        }

        m <- x$get()

        minv <- solve(m, ...)
        x$setInverse(minv)
        minv
}
