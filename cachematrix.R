## The 'makeCacheMatrix` function is used to create a special "matrix" object that can cache a matric and its inverse.
## BY using the make CacheMatrix function, you can use the set, get, setinverse and getinverse functions to navigate the cached data
## The `cacheSolve` computes the inverse of the special "matrix" in the `makeCacheMatrix`. If the inverse has been calculated,
##, it retrives it, otherwise it calculates it from the cache data.

### The 'makeCacheMatrix` function is used to create a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        s<- NULL
        set<- function(y) {
                x<<- y
                s<<- NULL
        }
        get<- function() x
        setinverse<- function(inverse) s<<- inverse 
        getinverse<- function() s
        list(set= set, get = get, 
             setinverse = setinverse, 
             getinverse = getinverse)
}


### The `cacheSolve` computes the inverse of the special "matrix" in the `makeCacheMatrix`. It returns the inverse if it already exists.
### Otherwise, it calculates a new one

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s<- x$getinverse()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        retrieveddata<- x$get()
        s<- solve(retrieveddata)
        x$setinverse(s)
        s
}
