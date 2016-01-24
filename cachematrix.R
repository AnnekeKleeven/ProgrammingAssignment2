## The following two functions calculate the inverser of a matrix.
## If the matrix has been cached before, the inverse will be returned 
## immediately rather than caculate it repeatedly.

## The first function creates special “matrix”, which is really a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the inverse of the matrix
## 4. get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- funtion() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## The following function caculates the inverse of the matrix created with the 
## makeCacheMatrix function. It first checks if the inverse of the matrix has 
## been cached before. If so, it gets the inverse from the cache and skips the 
## computation. Otherwise, it will calculate the inverse of the data and saves 
## the inverse matrix in the cache using the setinverse function. 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
