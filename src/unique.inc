    integer,intent(in),optional :: chunk_size  !! chunk size for expanding arrays.
                                               !! if not present, default is 100.

    integer :: i     !! counter
    integer :: n     !! number of unique elements
    integer :: chunk !! chunk size to use

    if (present(chunk_size)) then
        chunk = abs(chunk_size)
    else
        chunk = 100
    end if

    allocate(tmp(size(vec)), source = vec)

    ! first we sort it:
    call sort_ascending(tmp)

    ! add the first element:
    n = 1
    allocate(vec_unique(1), source = tmp(1))

    ! walk through array and get the unique ones:
    if (size(tmp)>1) then
        do i = 2, size(tmp)
            if (.not. tmp(i)==tmp(i-1)) then
                call expand_vector(vec_unique,n,chunk,val=tmp(i))
            end if
        end do
        call expand_vector(vec_unique,n,chunk,finished=.true.)
    end if
