    function item_binary_search(val,vec) result(jloc)
    implicit none
    class(item),intent(in) :: val  !! value to match in `vec`
    class(item),dimension(:),intent(in) :: vec  !! array to search (it is assumed to be sorted)
    include 'binary_search.inc'
    end function item_binary_search

    subroutine item_expand_vector(vec,n,chunk_size,val,finished)
    implicit none
    class(item),dimension(:),allocatable,intent(inout) :: vec
    class(item),intent(in),optional :: val  !! the value to add to `vec`
    class(item),dimension(:),allocatable :: tmp  !! temporary array
    include 'expand_vector.inc'
    end subroutine item_expand_vector

    subroutine item_unique(vec,vec_unique,chunk_size)
    implicit none
    class(item),dimension(:),intent(in)  :: vec  !! a vector of items
    class(item),dimension(:),allocatable,intent(out) :: vec_unique  !! unique elements of `vec`
    class(item),dimension(:),allocatable :: tmp  !! temp copy of vec
    include 'unique.inc'
    end subroutine item_unique

    subroutine item_sort_ascending(vec)
    implicit none
    class(item),dimension(:),intent(inout) :: vec
    include 'sort_ascending.inc'
    end subroutine item_sort_ascending

    subroutine item_sort_descending(vec)
    implicit none
    class(item),dimension(:),intent(inout) :: vec
    include 'sort_descending.inc'
    end subroutine item_sort_descending

    subroutine item_swap(v1,v2)
    implicit none
    class(item),intent(inout) :: v1
    class(item),intent(inout) :: v2
    class(item),allocatable :: tmp
    include 'swap.inc'
    end subroutine item_swap
