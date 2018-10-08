    function int32_binary_search(val,vec) result(jloc)
    implicit none
    integer(int32),intent(in) :: val  !! value to match in `vec`
    integer(int32),dimension(:),intent(in) :: vec  !! array to search (it is assumed to be sorted)
    include 'binary_search.inc'
    end function int32_binary_search

    subroutine int32_expand_vector(vec,n,chunk_size,val,finished)
    implicit none
    integer(int32),dimension(:),allocatable,intent(inout) :: vec
    integer(int32),intent(in),optional :: val  !! the value to add to `vec`
    integer(int32),dimension(:),allocatable :: tmp  !! temporary array
    include 'expand_vector.inc'
    end subroutine int32_expand_vector

    subroutine int32_unique(vec,vec_unique,chunk_size)
    implicit none
    integer(int32),dimension(:),intent(in)  :: vec  !! a vector
    integer(int32),dimension(:),allocatable,intent(out) :: vec_unique  !! unique elements of `vec`
    integer(int32),dimension(:),allocatable :: tmp  !! temp copy of vec
    include 'unique.inc'
    end subroutine int32_unique

    subroutine int32_sort_ascending(vec)
    implicit none
    integer(int32),dimension(:),intent(inout) :: vec
    include 'sort_ascending.inc'
    end subroutine int32_sort_ascending

    subroutine int32_sort_descending(vec)
    implicit none
    integer(int32),dimension(:),intent(inout) :: vec
    include 'sort_descending.inc'
    end subroutine int32_sort_descending

    subroutine int32_swap(v1,v2)
    implicit none
    integer(int32),intent(inout) :: v1
    integer(int32),intent(inout) :: v2
    integer(int32),allocatable :: tmp
    include 'swap.inc'
    end subroutine int32_swap
