# Standard makefile. slightly modified from the one provided in class.
FC = gfortran-6
EXE = eulerexe
FFLAGS = -fdefault-real-8 -fdefault-double-8 -Wall -Wextra -Wconversion
OBJECTS =  function.o euler.o

.PHONY: clean

$(EXE): $(OBJECTS)
	$(FC) $(FFLAGS) $(OBJECTS) -o $(EXE)

%.o : %.F90
	$(FC) $(FFLAGS) -c $<

eulerexe.o : euler.o
function.mod : euler.o

clean:
	rm -f $(OBJECTS) $(EXE) *.mod
