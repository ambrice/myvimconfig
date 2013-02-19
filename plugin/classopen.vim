if exists('class_open_plugin')
    finish
endif

let class_open_plugin = 1

function! s:ClassOpen(...)
    let class = a:0 > 0 ? a:1 : input("Class name: ")
    let origsua = &suffixesadd
    set suffixesadd=.h,.hpp,.hh,.hxx
    let f = findfile(class, "**3")
    if empty(f)
        echo "File" class "not found "
        let &suffixesadd = origsua
        return
    endif
    if empty(bufname("%"))
        execute "edit" f
    else
        execute "tabnew" f
    endif
    set suffixesadd=.cpp,.cc,.c,.cxx
    let f = findfile(class, "**3")
    if empty(f)
        echo "File" class "not found "
        let &suffixesadd = origsua
        return
    endif
    execute "vsplit" f
    let &suffixesadd = origsua
    execute "TName \"" . class . "\""
endfunction

command! -nargs=? ClassOpen call s:ClassOpen(<args>)
