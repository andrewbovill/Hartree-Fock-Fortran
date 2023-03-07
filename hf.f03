      program hf
    
!
!     This program computes the HF energy for the first 2 rows of atoms 
!     on the periodic table. Input files will have the following layout:
!
!     Basis set (For now STO-3G and 6-31G)
!     (blank line)
!     x y z Atom 
!     (blank line)
!       
!     Example:
!
!     STO-3G 
!
!     0.0 0.0 0.0 H
!     0.0 0.0 0.0 H
!
!
!     -Andrew Bovill 2023
!
!     Connections

      use hf_mod

!
!     Variable Declarations
!
      implicit none
     
      integer :: nCommands
      character(len=512) :: filename, basis
      integer,parameter :: Iunit=10

!
!     Format Statements
!

1000  Format(1x,'Calculating SCF energy with Hartree Fock')
1010  Format(1x,'Name of File: ',A)
1020  Format(1x,'Basis set: ',A)
1030  Format(1x,'Atomic Coordinates : ',A)


8999  Format(1x,'ERROR Program did not succesfully terminate!')
9999  Format(1x,'HF program completed')

!
!     Read in file "Atoms".txt
!

      nCommands = command_argument_count()
      if(nCommands.ne.1) THEN 
        write(IOut,*) "Only 1 command line arguement is accepted."
        write(IOut,8999)
        go to 999
      end if
      write(*,1000)
      call get_command_argument(1,filename)
      open (File=trim(filename), Unit = Iunit)
      write(*,1010) trim(filename)

      call read_basis (filename, basis)
      call read_coordinates (filename)

  999 Continue 
      write(IOut,9999)
      end program hf

