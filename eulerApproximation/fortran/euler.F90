! This is the main driver of the Euler's method of approximation.
! The purpose of this code is to do the actual approximating of 
! the differential equation 5 using equation 12 (given on the final).
! It will accomplish this by calling the function module and then 
! approximating the solution at each "h" interval. The results will
! be output to a file called "output.txt" and will be fed into a python
! program which will then plot the resulting data using matplotlib. 

program euler
   use function, only: f
   implicit none
   ! Defining all of the variables we may need for this program
   real(kind=8) :: h, currentXPos, currentNumSol, prevNumSol

   ! Function used on previous assignment to replace the default spacing of the
   ! write function.
   ! https://pages.mtu.edu/~shene/COURSES/cs201/NOTES/chap05/format.html
   character(len=*), parameter :: fmt = "(*(1x,g0))"

   ! Setting initial values
   ! "h" is the increment at which we will be moving
   ! The currentXPosition is where step we are currently at (from 0-10)
   ! The currentNumSol is the the numerical solution at the
   ! given x position. It is initialized as -2 because that is the solution
   ! when x == 0.
   h = 0.25
   currentXPos = 0
   currentNumSol = -2

   ! These lines will create a new file called "output.txt" and it will
   ! write the initial X positon and initial numerical solution (0,2).
   open(unit=900 , file='output.txt')
   write(900,fmt) currentXPos,currentNumSol

   ! The previous numerical solution is now set
   ! to the current value as we begin the while loop.
   prevNumSol = currentNumSol

   ! Starts at X position == 0, and ends when x position == 9.75
   ! (then adds h, to get the final vaue where x == 10)
   do while (currentXPos < 10)
      currentXPos = currentXPos+h
      currentNumSol = prevNumSol + h*f(currentXPos-h,prevNumSol)
      write(900,fmt) currentXPos,currentNumSol
      prevNumSol = currentNumSol
   enddo

end program euler


