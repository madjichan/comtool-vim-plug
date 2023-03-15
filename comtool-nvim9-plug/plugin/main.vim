vim9script
# Main vim file
if exists("g:loaded_complug")
    finish
endif
g:loaded_complug = 1
g:com_count = 0 # P.S. for adding support more one port in future

if !has("python3")
    echomsg "Python is not installed."
    finish
endif

python3 import comtool.comtool as com
execute 'python3 com' .. g:com_count .. ' = com.COMPort()'

command! -nargs=* Connect g:Comfuns_connect(<f-args>)
command! -nargs=* Disconnect g:Comfuns_disconnect(<f-args>)
command! -nargs=* Send g:Comfuns_send(<f-args>)



# call timer_start(1000, function('s:read_buf'), {'repeat': -1})
