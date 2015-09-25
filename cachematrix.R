## takes a square invertavle matrix
## return a list containing functions to get and set matrix, and get and set inverted 
## matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
    x <<- y
    m <<- NULL
    }
    get <- function() x
    setmatrx <- function(solve) m <<- solve
    getmatrx <- function() m
    list(set=set, get=get, 
         setmatrx=setmatrx, 
         getmatrx=getmatrx )
}

## return: the inverse of the original matrix input to makeCacheMatrix()
cacheSolve <- function(x, ...) {
        
        m<-x$getmatrx()
	## if the inverse matrix is alredy calculated 
	## uses cahed data
        if(!is.null(m)){message("getting cached data") 
	                return(m)}  
        ## if inverse not calculated - inverse original matrix
	matrix<-x$get()
        m<-solve(matrix,...)
        x$setmatrx(m)
        return(m)
}
