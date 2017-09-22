!*******************************************************************************
!> author: Jacob Williams
!
!  Generic searching and sorting routines.

    module sorting_module

    use iso_fortran_env

    implicit none

    private

    type,abstract,public :: item
        !! An item to be sorted or searched.
        !!
        !! User has to define the operator and assignment functions.
    contains
        private
        generic,public :: operator(>)   => greater_than
        generic,public :: operator(<)   => less_than
        generic,public :: operator(==)  => equal_to
        generic,public :: assignment(=) => assign_equal
        procedure(greater_than_func),deferred :: greater_than
        procedure(less_than_func),deferred    :: less_than
        procedure(equal_to_func),deferred     :: equal_to
        procedure(assign_equal_func),deferred :: assign_equal
    end type item

    abstract interface
        pure elemental subroutine assign_equal_func(v1,v2)
            !!@warning Gfortran is complaining that `v1`
            !!         may not be polymorphic because the
            !!         procedure is pure.
            import :: item
            implicit none
            class(item),intent(out) :: v1
            class(item),intent(in)  :: v2
        end subroutine assign_equal_func
        pure elemental function greater_than_func(v1,v2) result(gt)
            import :: item
            implicit none
            class(item),intent(in) :: v1
            class(item),intent(in) :: v2
            logical :: gt
        end function greater_than_func
        pure elemental function less_than_func(v1,v2) result(lt)
            import :: item
            implicit none
            class(item),intent(in) :: v1
            class(item),intent(in) :: v2
            logical :: lt
        end function less_than_func
        pure elemental function equal_to_func(v1,v2) result(eq)
            import :: item
            implicit none
            class(item),intent(in) :: v1
            class(item),intent(in) :: v2
            logical :: eq
        end function equal_to_func
    end interface

    integer,parameter :: max_size_for_insertion_sort = 20 !! max size for using insertion sort.
                                                          !! (otherwise, use quicksort)
    integer,parameter :: min_size_for_binary_search = 16  !! min size for using binary search
                                                          !! (otherwise, use sequential search)

    interface expand_vector
        !!  Add elements to a vector in chunks.
        procedure :: item_expand_vector,&
                     int32_expand_vector,int64_expand_vector,&
                     real64_expand_vector,real32_expand_vector
    end interface expand_vector
    interface swap
        !!  Swap two values.
        procedure :: item_swap,&
                     int32_swap,int64_swap,&
                     real64_swap,real32_swap
    end interface swap
    interface unique
        !!  Returns only the unique elements of the vector.
        procedure :: item_unique,&
                     int32_unique,int64_unique,&
                     real64_unique,real32_unique
    end interface unique
    interface sort_ascending
        !!  Sorts an array in increasing order.
        !!
        !!  Uses a basic recursive quicksort
        !!  (with insertion sort for partitions with \(\le\) 20 elements).
        !!  Replaces the original array.
        procedure :: item_sort_ascending,&
                     int32_sort_ascending,int64_sort_ascending,&
                     real64_sort_ascending,real32_sort_ascending
    end interface sort_ascending
    interface sort_descending
        !!  Sorts an array in decreasing order.
        !!
        !!  Uses a basic recursive quicksort
        !!  (with insertion sort for partitions with \(\le\) 20 elements).
        !!  Replaces the original array.
        procedure :: item_sort_descending,&
                     int32_sort_descending,int64_sort_descending,&
                     real64_sort_descending,real32_sort_descending
    end interface sort_descending
    interface binary_search
        !! Binary search of a sorted array.
        !! (assumed to be in ascending order)
        procedure :: item_binary_search,&
                     int32_binary_search,int64_binary_search,&
                     real64_binary_search,real32_binary_search
    end interface binary_search

    public :: expand_vector
    public :: unique
    public :: sort_ascending
    public :: sort_descending
    public :: binary_search

    contains
!*******************************************************************************

include 'item_routines.inc'
include 'int32_routines.inc'
include 'int64_routines.inc'
include 'real32_routines.inc'
include 'real64_routines.inc'

!*******************************************************************************
    end module sorting_module
!*******************************************************************************
