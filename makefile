#
#	This is a makefile to build Hartree-Fock-Fortran
#

all hf.exe


#
# Rules to build module (*.mod) and object (*.o) files
#

%.mod: %.f03
	gfortran -c $*.f03
%.exe 
	gfortran -o $*.exe $*.f03
