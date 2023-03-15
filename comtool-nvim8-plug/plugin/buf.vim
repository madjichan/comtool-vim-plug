" Variables and functions for buffer

let s:row = 1

function buf#set_point_pos(row)
    let s:row = a:row
endfunction

function buf#write(msg)
    for l:i in split(a:msg, '\' .. "\n", 1)
        call setline(s:row, getline(s:row) .. l:i)
        let s:row += 1
    endfor
    if a:msg[-1] != "\n"
        let s:row = s:row - 1
    endif
endfunction

