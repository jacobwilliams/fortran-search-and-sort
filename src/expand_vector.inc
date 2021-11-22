    integer,intent(inout)       :: n           !! counter for last element added to `vec`.
                                               !! must be initialized to `size(vec)`
                                               !! (or 0 if not allocated) before first call
    integer,intent(in)          :: chunk_size  !! allocate `vec` in blocks of this size (>0)
    logical,intent(in),optional :: finished    !! set to true to return `vec`
                                               !! as its correct size (`n`)

    integer :: i  !! counter

    if (present(val)) then
        if (n==size(vec)) then
            ! have to add another chunk:
            allocate(tmp(size(vec)+chunk_size), mold=vec)
            do i=1,size(vec)
                tmp(i) = vec(i)
            end do
            call move_alloc(tmp,vec)
        end if
        n = n + 1
        vec(n) = val
    end if

    if (present(finished)) then
        if (finished) then
            ! set vec to actual size (n):
            if (allocated(tmp)) deallocate(tmp)
            allocate(tmp(n), mold=vec)
            do i=1,n
                tmp(i) = vec(i)
            end do
            call move_alloc(tmp,vec)
        end if
    end if
