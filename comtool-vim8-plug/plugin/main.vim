" main vim file

if exists("g:loaded_complug")
    finish
endif
let g:loaded_complug = 1
let g:com_count = 0 
" P.S. for adding support more one port in future

if !has("python3")
    echomsg "Python is not installed."
    finish
endif

python3 import comtool.comtool as com
execute 'python3 com' .. g:com_count .. ' = com.COMPort()'

command! -nargs=* Connect call funs#connect(<f-args>)
command! -nargs=* Disconnect call funs#disconnect(<f-args>)
command! -nargs=* Send call funs#send(<f-args>)



" call timer_start(1000, function('s:read_buf'), {'repeat': -1})
