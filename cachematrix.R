## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# makeCacheMatrix takes only a matrix as an input function
# 
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        
        set <- function(y) {    # the setter function
               x <<- y          # the magic super assign operator
               m <<- NULL       # just store new matrix and del old cache
       }

        get <- function() x     # the getter function
        setInverse <- function(inverse) m <<- inverse
        getInverse <- function() m
        list(set = set, get = get,       # another magic thing, the list contains all
             setInverse = setInverse, getInverse = getInverse)	# possible operations   	      	   
}

# I still dont get how on earth where and how the matrix is stored !!
# as set is not called. is is?


## Returns a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
    
    m <- x$getInverse()     # tries to read the inverse of the matrix
    if(!is.null(m)) {       # if available - return inverse matrix
        message("getting cached matrix")
        return(m)
    }
    data  <- x$get()        # inverse is not available - get input matrix
    m  <- solve(data,...)   # calculate the inverse of the input
    x$setInverse(m)
    m   # returns the inverse matrix
}

