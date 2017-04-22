
    module int_type_module

    use sorting_module

    implicit none

    private

    type,extends(item),public :: int
        integer :: i = 0
    contains
        procedure :: greater_than => int_greater_than
        procedure :: less_than    => int_less_than
        procedure :: equal_to     => int_equal_to
        procedure :: assign_equal => int_assign_equal
    end type int
    interface int
        module procedure :: int_constructor
    end interface

    contains

    pure elemental function int_constructor(i)  ! ifort internal compiler when using ...
        implicit none
        type(int) :: int_constructor
        integer,intent(in) :: i
        int_constructor%i = i
    end function int_constructor

    pure elemental subroutine int_assign_equal(v1,v2)
        implicit none
        class(int),intent(out) :: v1
        class(item),intent(in)  :: v2
        select type(v2)
        class is (int)
            v1%i = v2%i
        class default
            !error stop 'assignment not defined'
        end select
    end subroutine int_assign_equal

    pure elemental function int_greater_than(v1,v2) result(gt)
        implicit none
        class(int),intent(in) :: v1
        class(item),intent(in) :: v2
        logical :: gt
        select type(v2)
        class is (int)
            gt = v1%i > v2%i
        class default
            !error stop '> operator not defined'
        end select
    end function int_greater_than

    pure elemental function int_less_than(v1,v2) result(lt)
        implicit none
        class(int),intent(in) :: v1
        class(item),intent(in) :: v2
        logical :: lt
        select type(v2)
        class is (int)
            lt = v1%i < v2%i
        class default
            !error stop '< operator not defined'
        end select
    end function int_less_than

    pure elemental function int_equal_to(v1,v2) result(eq)
        implicit none
        class(int),intent(in) :: v1
        class(item),intent(in) :: v2
        logical :: eq
        select type(v2)
        class is (int)
            eq = v1%i == v2%i
        class default
            !error stop '== operator not defined'
        end select
    end function int_equal_to

    end module int_type_module
