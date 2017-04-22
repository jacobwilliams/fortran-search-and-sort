    integer :: jloc   !! the first matched index in `vec`
                      !! (if not found, 0 is returned)

    integer :: j,k,khi,klo,n

    n = size(vec)
    jloc = 0

    if ( n<min_size_for_binary_search ) then

        ! sequential search more efficient

        do j = 1 , n
            if ( vec(j)==val ) then
                jloc = j
                return
            elseif (vec(j)>val) then
                exit ! error
            end if
        end do

    else

        klo = 1
        khi = n
        k = (klo+khi+1)/2
        do
            j = k
            if ( val<vec(j) ) then
                khi = k
            elseif ( val==vec(j) ) then
                jloc = j
                return
            else
                klo = k
            end if
            if ( khi-klo<1 ) then
                exit ! error
            elseif ( khi-klo==1 ) then
                if ( k==klo ) then
                    k = khi
                else
                    k = klo
                end if
                klo = khi
            else
                k = (klo+khi+1)/2
            end if
        end do

    end if
