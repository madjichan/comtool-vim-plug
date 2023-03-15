vim9script
# Variables and functions for buffer

var row = 1

def g:Buf_set_point_pos(new_row: number)
    row = new_row
enddef

def g:Buf_write(msg: string)
    for i in split(msg, '\' .. "\n", 1)
        setline(row, getline(row) .. i)
        row += 1
    endfor
    # if msg[-1] != "\n"
    row = row - 1 # I don't now how it work
    # endif
enddef

