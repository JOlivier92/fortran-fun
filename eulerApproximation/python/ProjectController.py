#!/usr/bin/env python3
# Name: Joseph Olivier
###########################################################################
# PROMPT: This program is the python implementation for the final project #
# of AMS 129. It aims to accomplish a few things:                         #
# 1. "Make your fortran program" by running the makefile                  #
# 2. Run my fortran code.                                                 #
# 3. Load output.txt as a numpy array                                     #
# 4. Caclculate the error by taking the difference between the real and   #
# numerical solutions.                                                    #
# 5. Plot the numerical and real solutions in the same graph              #
# 6. Title and save the figure as a .png file                             #
###########################################################################

class Plotter:
    def __init__(self, outputArray):
        self.solutionGrid = outputArray

    def createPlot(self):
        """
        The purpose of this function is to create a plot comparing the
        Euler approximation to exact solutions of a specific formula.
        This class takes in a numpy array of xPositions and their 
        corresponding Numerical Solutions. It will then calculate their
        exact solutions and will make a graph comparing the two.
        """
        import matplotlib.pyplot as plt
        import numpy as np
        
        #Sets x values to the x position and y values to the corresponding
        #numerical solutions of the x positions.
        xValues = self.solutionGrid[:,0]
        yValues = self.solutionGrid[:,1]

        #Finds the exact solution for each corresponding x value by using
        #equation 6
        exactSolutions = np.sqrt(2*np.log(xValues**2+1)+4)*-1
        
        #This for loop will calculate the total error between the exact
        #solutions compared to the Euler approxmations. It does this by
        #using equation 15.
        totalError = 0
        for i in range(0,len(exactSolutions)):
            totalError+=abs(exactSolutions[i]-yValues[i])

        ###################################################################
        # Below are the plot manipulations used                           #
        ###################################################################
        plt.figure()
        plt.grid(True)
        plt.xlabel("X Position")
        plt.ylabel("Numerical Solution")

        #Below line plots the x values against the euler approxmations
        plt.plot(xValues,yValues,'ro--')
        
        #Below line plots the x values against their exact solutions
        plt.plot(xValues,exactSolutions, 'b-') 
        
        #Titles plot based off of total error between approxmations and
        #exact solutions
        plt.title('Total Calculated Error = '+ str(totalError))
        plt.savefig("results.png")
        ###################################################################


def main():
    import os
    import numpy as np
    """
    The purpose of this main function is to first complete steps 1-3 of the
    prompt that is shown above. After it completes these steps, it will then send
    the output.txt numpy array to the Plotter class in order to complete steps
    4-6
    """

    #This block of code completes steps 1-3 (up through running the fortran code)
    os.chdir("../fortran")
    os.system("make")
    os.system("./eulerexe")


    #This block of code completes the final 3 steps.
    stufftoPlot = np.loadtxt("output.txt")
    os.chdir("../python")
    plotObject = Plotter(stufftoPlot)
    plotObject.createPlot()

if __name__ == "__main__":
    main()
