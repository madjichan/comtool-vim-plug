vim9script
# Functions

var is_connected = 0
var buf_size = 30
var delay = 1000
g:com_error = 0

g:read_buf = "" 

def g:Comfuns_connect(port_name: string, str_speed: string, p_row=1)
    var speed = str2nr(str_speed)
    if is_connected
        echo "You can't open port before closing last one."
        return
    endif
    execute 'python3 com0.connect("' .. port_name .. '", ' .. speed .. ')'
    if g:com_error
        g:com_error = 0
        return
    endif
    g:Buf_set_point_pos(p_row)
    is_connected = timer_start(delay, function('Iter'), {'repeat': -1})
enddef

def Iter(timer: number)
   execute 'python3 com0.read(' .. buf_size .. ')'
   g:Buf_write(g:read_buf)
enddef

def g:Comfuns_send(msg: string)
    execute 'python3 com0.write("' .. msg .. '")'
enddef

def g:Comfuns_disconnect()
    if !is_connected
        echo "You can't close port because no port is open."
        return
    endif
    timer_stop(is_connected)
    is_connected = 0
    execute 'python3 com0.disconnect()'
enddef
