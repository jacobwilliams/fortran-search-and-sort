    call quicksort(1,size(vec))

    contains

        recursive subroutine quicksort(ilow,ihigh)

        !! Sort the array (ascending order).

        implicit none

        integer,intent(in) :: ilow
        integer,intent(in) :: ihigh

        integer :: ipivot !! pivot element
        integer :: i      !! counter
        integer :: j      !! counter

        if ( ihigh-ilow<=max_size_for_insertion_sort .and. ihigh>ilow ) then

            ! do insertion sort:
            do i = ilow + 1,ihigh
                do j = i,ilow + 1,-1
                    if ( vec(j) < vec(j-1) ) then
                        call swap(vec(j),vec(j-1))
                    else
                        exit
                    end if
                end do
            end do

        else if ( ihigh-ilow>max_size_for_insertion_sort ) then

            ! do the normal quicksort:
            call partition(ilow,ihigh,ipivot)
            call quicksort(ilow,ipivot - 1)
            call quicksort(ipivot + 1,ihigh)

        end if

        end subroutine quicksort

        subroutine partition(ilow,ihigh,ipivot)

        !! Partition the array

        implicit none

        integer,intent(in)  :: ilow
        integer,intent(in)  :: ihigh
        integer,intent(out) :: ipivot

        integer :: i,ip

        call swap(vec(ilow),vec((ilow+ihigh)/2))
        ip = ilow
        do i = ilow + 1, ihigh
            if ( vec(i) < vec(ilow) ) then
                ip = ip + 1
                call swap(vec(ip),vec(i))
            end if
        end do
        call swap(vec(ilow),vec(ip))
        ipivot = ip

        end subroutine partition
