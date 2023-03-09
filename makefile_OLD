#
#	This is a makefile to build Hartree-Fock-Fortran
#
LIBS = -llapack -lblas
RunF = gfortran 

all: hf.exe

#
# Rules to build module (*.mod) and object (*.o) files
#

%.exe: hf.o hf_mod.o
	$(RunF) $(LIBS) -o $*.exe hf.o hf_mod.o 

hf_mod.o : hf_mod.f03
	$(RunF) $(LIBS) -c hf_mod.f03

hf.o : hf_mod.f03 hf_mod.o
	$(RunF) $(LIBS) -c hf.f03 

#
# Clean object files
#

clean: 
	rm -rf *.o *.mod

