

## Creating a function that accepts a matrix with default values of (9) numbers 
#normally distributed with mean = 5 & standerd deviation = 4
# and its default dimentions is 3 * 3

makeCacheMatrix <- function(x = matrix(rnorm(9,5,4),3,3)) {
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


## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
       
  
    s <- x$getsolve()
    if(!is.null(s)) {
      message("getting inversed matrix")
      return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
  
  
  
}
a<-makeCacheMatrix()
a
cacheSolve(a)
