! Name: Joseph Olivier
! AMS 129 - Foundations of Scientifc Computing
! Assignment 2
!############################################################
! The main comments are in my calc_basel.F90 file 
!############################################################
program main
    use param
    print *, "Please input a threshold:"
    read *, threshold
    call calc_basel(threshold) 
end program main
