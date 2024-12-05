## The following pair of functions catch the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## This function First checks if the inverse is cached. 
## If not, calculates it, caches it, and then returns it.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)){
    message("getting catched data")
    return(i)
  }
   mat <- x$get()
   i <- solve(mat, ...)
   x$setinverse(i)
   i
       ## Return a matrix that is the inverse of 'x'
}
