function! hotReload#TriggerHotReload() abort
    if !exists('s:last_reload_time')
        let s:last_reload_time = 0
    endif
    let l:current_time = localtime()

    if l:current_time - s:last_reload_time < 0.5
        return
    endif

    let s:last_reload_time = l:current_time

    if $SHELL =~? 'fish'
      silent !kill -SIGUSR1 (ps aux | grep -E "[f]lutter_tool.*run" | grep -v "build_runner" | grep -v "slang" | awk '{print $2}')
    else
      silent !kill -SIGUSR1 $(ps aux | grep -E "[f]lutter_tool.*run" | grep -v "build_runner" | grep -v "slang" | awk '{print $2}')
    endif
endfunction
