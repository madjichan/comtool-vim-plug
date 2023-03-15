" Functions

let s:is_connected = 0
let s:buf_size = 30
let s:delay = 1000
let g:com_error = 0

function funs#connect(port_name, speed, p_row=1)
	if s:is_connected
		echo "You can't open port before closing last one."
        return
	endif
	execute 'python3 com0.connect("' .. a:port_name .. '", ' .. a:speed .. ')'
	if g:com_error
		let g:com_error = 0
		return 
	endif
    call buf#set_point_pos(a:p_row)
    let s:is_connected = timer_start(s:delay, function('s:iter'), {'repeat': -1})
endfunction

function s:iter(timer)
   execute 'python3 com0.read(' .. s:buf_size .. ')'
   call buf#write(g:read_buf)
endfunction

function funs#send(msg)
    execute 'python3 com0.write("' .. a:msg .. '")'
endfunction

function funs#disconnect()
	if !(s:is_connected)
        echo "You can't close port because no port is open."
        return
    endif
	call timer_stop(s:is_connected)
    let s:is_connected = 0
    execute 'python3 com0.disconnect()'
endfunction
