! Name: Joseph Olivier
! AMS 129 - Foundations of Scientifc Computing
! Assignment 2
!############################################################
! The purpose of this program is to solve the Basel problem.
! This program takes one input, which is a threshold, and will
! output a .txt file. It will also take in a subroutine which contains
! the calculation for pi, in order to show my ability to properly call
! subroutines. 
!
! This program works by taking the summation of the inverse square
! of all natural numbers. After each subsequent addition, we will
! calculate how far away we are from the solution (pi**2/6) to 
! recalculate the error. Once the error is equal to or less than
! the threshold, the program will stop and print to the .txt file.
! The .txt output file contains the following information: 
! 0. The error value every 1000 iterations
! 1. total number of iterations 
! 2. numerical solution to the Basel problem, given our threshold
! 3. The final error (iteration number)
!############################################################

subroutine calc_basel(threshold)
  ! threshold is defined as user input in the form of 1E-xx
  ! counter is the current iteration starting from 1
  use param, only: pi
  implicit none
  integer :: iteration
  real, intent(in) :: threshold
  real*16 :: error,real_soln,currentBasel,numerical_soln

  ! Here I looked up how to remove the nasty default spacing.
  ! https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap05/format.html
  character(len=*), parameter :: fmt = "(*(1x,g0))"

  ! Setting variables
  iteration = 1
  numerical_soln = 0
  error = 10000
  real_soln = (pi**2.0)/6.0

  ! while loop which will iterate until error is smaller than threshold 
  do while(error > threshold)

    ! Set value of the inverse square of the current iteration
    ! if iteration = 5, currentBasel = 1/(5^2)
    currentBasel = 1d0/iteration**2
    numerical_soln = numerical_soln + 1d0/iteration**2d0
    error = real_soln - numerical_soln
    
    ! Check if we are on a 1000th iteration, if so, then print
    ! current error
    if (MODULO(iteration,1000) == 0) THEN 
      open(unit=900, file="results.txt")
      write(900,fmt) "n = ",iteration,"   error = ",error
    endif

    ! Update iteration number for next cycle.
    iteration = iteration + 1

  enddo

  ! append output file with professor defined outputs.
  open(unit=900,Access="append", file="results.txt")
  write(900,fmt) "total number of cycles: ",iteration-1
  write(900,fmt) "numerical solution: ",numerical_soln
  write(900,fmt) "error: ",error


end subroutine calc_basel