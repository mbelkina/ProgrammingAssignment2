## This function makeCacheMatrix creates a special "matrix" object that can cache its inverse
## The function creates a list containing four functions to operate with an invertible matrix:
##	set the value of the matrix
##	get the value of the matrix
##	set the value of the inverse
##	get the value of the inverse
## The resulting objest a S3 type object that will contain also variables x and inv
## that are defined within the makeCacheMatrix function environment 
## It will be used to cache for future use time-consuming computation of matrix inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## This function cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix
## It expects for input the object created by makeCacheMatrix
## To avoid recalculation, it first checks if the inverse of matrix has already been calculated.
## If the inverse has already been calculated (and the matrix has not changed),
## it retrieves the inverse from the cache and skips the computation
## Otherwise, it calculates the inverse and sets the value in the cache via the setinverse function
## It is assumed that the matrix is always invertible

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data)
        x$setinverse(inv)
        inv
        
}

## SAMPLE RUN
#source("cachematrix.R")     ##load functions

## create myMatrix object and print out the initial matrix 
#> myMatrix <- makeCacheMatrix (matrix(rnorm (25), 5,5))
#> myMatrix$get ()
#[,1]         [,2]       [,3]        [,4]        [,5]
#[1,] -0.32087306  0.361375666 -0.5150519 -0.03064775 -0.56070512
#[2,] -0.05775923 -0.011423811  0.2878593  1.54117646  0.50589748
#[3,] -1.14802074  2.506874145  1.1681837  0.68004547 -0.39829656
#[4,] -0.21801815 -2.342761184 -2.0992232  2.38567566 -0.06574999
#[5,]  1.01069042 -0.008811717 -0.1457434 -1.19444519 -1.01394758

## inverse matrix twice, second time cache is used
#> cacheSolve (myMatrix)
#[,1]       [,2]       [,3]       [,4]       [,5]
#[1,]  2.02130248  2.0706878 -1.0488996 -0.8221153  0.3807182
#[2,]  3.12150544  1.9197042 -1.0290811 -1.0547662 -0.2957157
#[3,] -3.81357637 -1.8139924  1.4660983  0.9872727  0.5638778
#[4,] -0.03458781  0.5247949  0.1445663  0.1459915  0.2147121
#[5,]  2.57658484  1.6898773 -1.4176231 -1.1241973 -0.9381641

#> cacheSolve (myMatrix)
# getting cached data
#[,1]       [,2]       [,3]       [,4]       [,5]
#[1,]  2.02130248  2.0706878 -1.0488996 -0.8221153  0.3807182
#[2,]  3.12150544  1.9197042 -1.0290811 -1.0547662 -0.2957157
#[3,] -3.81357637 -1.8139924  1.4660983  0.9872727  0.5638778
#[4,] -0.03458781  0.5247949  0.1445663  0.1459915  0.2147121
#[5,]  2.57658484  1.6898773 -1.4176231 -1.1241973 -0.9381641## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
