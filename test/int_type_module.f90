
    module int_type_module

    use sorting_module

    implicit none

    private

    type,extends(item),public :: myint
        integer :: i = 0
    contains
        procedure :: greater_than => int_greater_than
        procedure :: less_than    => int_less_than
        procedure :: equal_to     => int_equal_to
        procedure :: assign_equal => int_assign_equal
    end type myint
    interface myint
        module procedure :: int_constructor
    end interface

    contains

    function int_constructor(i)
        implicit none
        type(myint) :: int_constructor
        integer,intent(in) :: i
        int_constructor%i = i
    end function int_constructor

    subroutine int_assign_equal(v1,v2)
        implicit none
        class(myint),intent(out) :: v1
        class(item),intent(in)  :: v2
        select type(v2)
        class is (myint)
            v1%i = v2%i
        class default
            !error stop 'assignment not defined'
        end select
    end subroutine int_assign_equal

    function int_greater_than(v1,v2) result(gt)
        implicit none
        class(myint),intent(in) :: v1
        class(item),intent(in) :: v2
        logical :: gt
        select type(v2)
        class is (myint)
            gt = v1%i > v2%i
        class default
            !error stop '> operator not defined'
        end select
    end function int_greater_than

    function int_less_than(v1,v2) result(lt)
        implicit none
        class(myint),intent(in) :: v1
        class(item),intent(in) :: v2
        logical :: lt
        select type(v2)
        class is (myint)
            lt = v1%i < v2%i
        class default
            !error stop '< operator not defined'
        end select
    end function int_less_than

    function int_equal_to(v1,v2) result(eq)
        implicit none
        class(myint),intent(in) :: v1
        class(item),intent(in) :: v2
        logical :: eq
        select type(v2)
        class is (myint)
            eq = v1%i == v2%i
        class default
            !error stop '== operator not defined'
        end select
    end function int_equal_to

    end module int_type_module
