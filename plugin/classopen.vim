if exists('class_open_plugin')
    finish
endif

let class_open_plugin = 1

function! ClassComplete(ArgLead, CmdLine, CursorPos)
    let f = system("find . -regextype posix-extended -regex '.*" . a:ArgLead . ".*((.cpp)|(.cc)|(.c)|(.cxx)|(.h)|(.hpp)|(.hh)|(.hxx))'")
    let files = split(f, "\n")
    echom join(files, ",")
    " Get the files without paths or extensions
    call map(files, 'fnamemodify(v:val, ":t:r")')
    echom join(files, ",")
    " Get the unique items
    let d = {}
    for file in files
        let d[file] = 1
    endfor
    return sort(keys(d))
endfunction

function! s:ClassOpen(...)
    let class = a:0 > 0 ? a:1 : input("Class name: ", "", "customlist,ClassComplete")
    let origsua = &suffixesadd
    set suffixesadd=.h,.hpp,.hh,.hxx
    let f = findfile(class, "**3;../**3")
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
    let f = findfile(class, "**3;../**3")
    if empty(f)
        echo "File" class "not found "
        let &suffixesadd = origsua
        return
    endif
    execute "vsplit" f
    let &suffixesadd = origsua
    execute "TName \"" . class . "\""
endfunction

command! -nargs=? -complete=customlist,ClassComplete ClassOpen call s:ClassOpen(<args>)
