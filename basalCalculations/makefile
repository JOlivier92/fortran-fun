FC = gfortran-6
EXE = basel
FFLAGS = -fdefault-real-8 -fdefault-double-8 -Wall -Wextra -Wconversion
OBJECTS = main.o param.o calc_basel.o

.PHONY: clean

$(EXE): $(OBJECTS)
	$(FC) $(FFLAGS) $(OBJECTS) -o $(EXE)

%.o : %.F90
	$(FC) $(FFLAGS) -c $<

main.o : param.o
calc_basel.o : param.o

clean:
	rm -f $(OBJECTS) $(EXE) *.mod