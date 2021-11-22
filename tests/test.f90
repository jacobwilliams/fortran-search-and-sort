
    program test

    use sorting_module
    use int_type_module
    use intvec_type_module

    implicit none

    integer,dimension(10)      :: integer_list
    type(myint),dimension(10)    :: list
    type(intvec),dimension(24) :: listvec

    class(item),dimension(:),allocatable :: unique_elements
    integer :: i,j
    type(intvec) :: aa,bb
    integer,dimension(:),allocatable :: unique_integer_elements

    integer_list = [9,77,1,2,3,10,2,6,1,1]

    !listvec(1 ) = [ 7,20,31,9 ]  ! intvec_assign_equal_vec ... doesn't work?

    listvec(1 )%i = [ 7,20,31,9 ]
    listvec(2 )%i = [ 3,22,36,8 ]
    listvec(3 )%i = [ 3,22,35,7 ]
    listvec(4 )%i = [ 3,22,33,6 ]
    listvec(5 )%i = [ 3,22,31,5 ]
    listvec(6 )%i = [ 3,20,36,4 ]
    listvec(7 )%i = [ 3,20,35,3 ]
    listvec(8 )%i = [ 8,22,36,24 ]
    listvec(9 )%i = [ 8,22,35,23 ]
    listvec(10)%i = [ 8,22,33,22 ]
    listvec(11)%i = [ 8,22,31,21 ]
    listvec(12)%i = [ 8,20,36,20 ]
    listvec(13)%i = [ 3,20,33,2 ]
    listvec(14)%i = [ 8,20,35,19 ]
    listvec(15)%i = [ 8,20,33,18 ]
    listvec(16)%i = [ 8,20,31,17 ]
    listvec(17)%i = [ 7,22,36,16 ]
    listvec(18)%i = [ 7,22,35,15 ]
    listvec(19)%i = [ 7,22,33,14 ]
    listvec(20)%i = [ 7,22,31,13 ]
    listvec(21)%i = [ 7,20,36,12 ]
    listvec(22)%i = [ 7,20,35,11 ]
    listvec(23)%i = [ 7,20,33,10 ]
    listvec(24)%i = [ 3,20,31,1 ]

    !list = int([9,77,1,2,3,10,2,6,1,1])  ! how to make this happen?
    list%i = int([9,77,1,2,3,10,2,6,1,1])

    write(*,*) ''
    write(*,*) 'original list:'
    write(*,*) list

    call sort_ascending(list)

    write(*,*) ''
    write(*,*) 'sorted list:'
    write(*,*) list

    call unique(list,unique_elements)

    select type (unique_elements)
    type is (myint)
        write(*,*) ''
        write(*,*) 'unique elements:'
        write(*,*) unique_elements
    end select

    write(*,*) ''
    write(*,*) 'binary search:'
    do i=1,size(unique_elements)
        j = binary_search(unique_elements(i),unique_elements)
        write(*,*) j
    end do

    write(*,*) ''
    write(*,*) '----------'
    write(*,*) ''
    write(*,*) ' listvec: '
    write(*,*) ''
    write(*,*) 'original list:'
    do i=1,size(listvec)
        write(*,'(*(I2,1X))') listvec(i)%i
    end do

    call sort_ascending(listvec)

    write(*,*) ''
    write(*,*) 'sorted list:'
    do i=1,size(listvec)
        write(*,'(*(I2,1X))') listvec(i)%i
    end do

    write(*,*) ''
    aa%i = [ 8,20,36,20 ]
    bb%i = [ 3,22,31,5 ]
    write(*,*) 'aa<bb',  aa<bb
    write(*,*) 'aa>bb',  aa>bb
    write(*,*) 'aa==bb', aa==bb

    write(*,*) ''
    write(*,*) '-------------------------'
    write(*,*) ''
    write(*,*) ' integer list: '
    write(*,*) ''

    write(*,*) ''
    write(*,*) 'original list:'
    write(*,*) integer_list

    call sort_descending(integer_list)
    write(*,*) ''
    write(*,*) 'sorted list (descending):'
    write(*,*) integer_list

    call sort_ascending(integer_list)
    write(*,*) ''
    write(*,*) 'sorted list (ascending):'
    write(*,*) integer_list

    call unique(integer_list,unique_integer_elements)
    write(*,*) ''
    write(*,*) 'unique elements:'
    write(*,*) unique_integer_elements

    write(*,*) ''
    write(*,*) 'binary search:'
    do i=1,size(unique_integer_elements)
        j = binary_search(unique_integer_elements(i),unique_integer_elements)
        write(*,*) j
    end do

end program test
