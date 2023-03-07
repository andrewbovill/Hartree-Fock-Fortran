      module hf_mod
!
!   
!
      
!
!     Variable Declarations
!
      implicit none
      integer,parameter::IOut=6

!
!     Module Procedures
!
      CONTAINS

      subroutine read_basis (filename,basis)

      character(len=512),intent(in):: filename
      character(len=512),intent(out):: basis

      write(*,*) "Testing ", filename
      end subroutine read_basis 

      subroutine read_coordinates (filename1)

      character(len=512) :: filename1

      end subroutine read_coordinates 

      end module hf_mod

