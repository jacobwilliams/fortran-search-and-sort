
    module intvec_type_module

    use sorting_module

    implicit none

    private

    type,extends(item),public :: intvec
        integer,dimension(4) :: i = [0,0,0,0]
    contains
        procedure :: greater_than => intvec_greater_than
        procedure :: less_than    => intvec_less_than
        procedure :: equal_to     => intvec_equal_to
        procedure :: assign_equal => intvec_assign_equal,&
                                     intvec_assign_equal_vec
    end type intvec

    contains

    pure elemental subroutine intvec_assign_equal(v1,v2)
        implicit none
        class(intvec),intent(out) :: v1
        class(item),intent(in)  :: v2
        select type(v2)
        class is (intvec)
            v1%i = v2%i
        class default
            error stop 'assignment not defined'
        end select
    end subroutine intvec_assign_equal

    pure subroutine intvec_assign_equal_vec(v1,v2)  ! doesn't work?
        implicit none                               !
        class(intvec),intent(out) :: v1             !
        integer,dimension(4),intent(in) :: v2       !
        v1%i = v2                                   !
    end subroutine intvec_assign_equal_vec          !

    pure elemental function intvec_greater_than(v1,v2) result(gt)
        implicit none
        class(intvec),intent(in) :: v1
        class(item),intent(in) :: v2
        logical :: gt
        integer :: i !! counter
        select type(v2)
        class is (intvec)
            if (v1 == v2) then
                gt = .false.
            else
                do i=1,size(v1%i)
                    if (v1%i(i)==v2%i(i)) then
                        cycle
                    elseif (v1%i(i)>v2%i(i)) then
                        gt = .true.
                        return
                    else
                        gt = .false.
                        return
                    end if
                end do
            end if
        class default
            error stop '> operator not defined'
        end select
    end function intvec_greater_than

    pure elemental function intvec_less_than(v1,v2) result(lt)
        implicit none
        class(intvec),intent(in) :: v1
        class(item),intent(in) :: v2
        logical :: lt
        lt = (.not.(v1==v2)) .and. (.not.(v1>v2))
    end function intvec_less_than

    pure elemental function intvec_equal_to(v1,v2) result(eq)
        implicit none
        class(intvec),intent(in) :: v1
        class(item),intent(in) :: v2
        logical :: eq
        select type(v2)
        class is (intvec)
            eq = all(v1%i == v2%i)
        class default
            error stop '== operator not defined'
        end select
    end function intvec_equal_to

    end module intvec_type_module
