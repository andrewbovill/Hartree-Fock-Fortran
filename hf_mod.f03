      module hf_mod

!     This module contains functions and subroutines for "hf.f03". All functions and
!     subrotines are declared in this file. Basis set list is composite file found in "basis.txt".

      use iso_fortran_env, only: iostat_end, iostat_eor

      implicit none

      integer, parameter :: IOut = 6

      contains

      subroutine fail() 
!     Print an error message and stop the program
      write(IOut, '(A)' ) "ERROR: Program did not successfully terminate!"
      stop
      end subroutine fail

      subroutine get_atom(IUnit, nAtoms)
      integer, intent(in) :: IUnit
      integer, intent(out) :: nAtoms
      character(len=512) :: line
      integer :: io, nLines

      nLines = 0
      do
        read (IUnit, '(A)', iostat=io) line
        if (io /= 0) exit
        nLines = nLines + 1
      end do

      nAtoms = nLines - 2
      end subroutine get_atom

      subroutine get_basis(IUnit, basis)
      ! Read in the basis set from a file

      implicit none

      integer, intent(in) :: IUnit
      character(len=*), intent(out) :: basis
      character(len=512) :: basis_line
      integer :: io

!     Rewind file for read to start at beginning
      rewind(IUnit)

!     Read in basis
      read(IUnit, '(A)', iostat=io) basis_line
      basis_line = ADJUSTL(basis_line)
      select case (trim(basis_line))
      case ("STO-3G")
        basis = "STO-3G"
      case ("6-31G")
        basis = "6-31G"
      case ("")
        write(*, *) "No basis set found"
        call fail()
      case default
        write(*, *) "Invalid basis set input: ", trim(basis_line)
        call fail()
      end select

      if (io /= 0 .and. io /= iostat_end .and. io /= iostat_eor) then
        write(*, *) "Error reading basis set from file"
        call fail()
      endif
      end subroutine get_basis

      end module hf_mod
