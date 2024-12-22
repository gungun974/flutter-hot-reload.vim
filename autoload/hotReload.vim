function! hotReload#TriggerHotReload() abort
    if $SHELL =~? 'fish'
      silent !kill -SIGUSR1 (ps aux | grep -E "[f]lutter_tool.*run" | grep -v "build_runner" | grep -v "slang" | awk '{print $2}')
    else
      silent !kill -SIGUSR1 $(ps aux | grep -E "[f]lutter_tool.*run" | grep -v "build_runner" | grep -v "slang" | awk '{print $2}')
    endif
endfunction
