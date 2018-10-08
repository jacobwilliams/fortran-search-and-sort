    function real32_binary_search(val,vec) result(jloc)
    implicit none
    real(real32),intent(in) :: val  !! value to match in `vec`
    real(real32),dimension(:),intent(in) :: vec  !! array to search (it is assumed to be sorted)
    include 'binary_search.inc'
    end function real32_binary_search

    subroutine real32_expand_vector(vec,n,chunk_size,val,finished)
    implicit none
    real(real32),dimension(:),allocatable,intent(inout) :: vec
    real(real32),intent(in),optional :: val  !! the value to add to `vec`
    real(real32),dimension(:),allocatable :: tmp  !! temporary array
    include 'expand_vector.inc'
    end subroutine real32_expand_vector

    subroutine real32_unique(vec,vec_unique,chunk_size)
    implicit none
    real(real32),dimension(:),intent(in)  :: vec  !! a vector
    real(real32),dimension(:),allocatable,intent(out) :: vec_unique  !! unique elements of `vec`
    real(real32),dimension(:),allocatable :: tmp  !! temp copy of vec
    include 'unique.inc'
    end subroutine real32_unique

    subroutine real32_sort_ascending(vec)
    implicit none
    real(real32),dimension(:),intent(inout) :: vec
    include 'sort_ascending.inc'
    end subroutine real32_sort_ascending

    subroutine real32_sort_descending(vec)
    implicit none
    real(real32),dimension(:),intent(inout) :: vec
    include 'sort_descending.inc'
    end subroutine real32_sort_descending

    subroutine real32_swap(v1,v2)
    implicit none
    real(real32),intent(inout) :: v1
    real(real32),intent(inout) :: v2
    real(real32),allocatable :: tmp
    include 'swap.inc'
    end subroutine real32_swap
