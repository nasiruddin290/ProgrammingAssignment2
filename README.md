## A pair of functions that cache the inverse of a matrix


## Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(a = matrix()) {
  
  inversa <- NULL
  y <- function(n) {
    a <<- d
    inversa <<- NULL
  }
  get <- function() a
  setinv <- function(inverse) inversa <<- inverse
  getinv <- function() inversa
  list(y = y, get = get, setinv = setinv, getinv = getinv)
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the "cachesolve" should retrieve the inverse from the cache.
cacheSolve <- function(a, ...) {
  
  inversa <- a$getinv()
  if(!is.null(inversa)) {
    message("getting cached data")
    return(inversa)
  }
  data <- a$get()
  inversa <- solve(data, ...)
  a$setinv(inversa)
  inversa
}
