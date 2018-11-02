! This is the function module which contains the function f(x,y) = dy/dx
! This module will be called by the euler fortran code in order to implement
! Euler's method of approximation.

module function

   implicit none
   contains
   real(kind=8) function f(x,y)
   real(kind=8), intent(in) :: x, y
   f=(2d0*x)/(y*(1d0+x**2d0))
   end function f

end module function

