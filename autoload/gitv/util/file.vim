" Gitv line-related utility functions

if exists('g:autoloaded_gitv_util_file')
    finish
endif
let g:autoloaded_gitv_util_file = 1

fu! gitv#util#file#relativepath() "{{{
    return exists('b:Gitv_FileModeRelPath') ? b:Gitv_FileModeRelPath : ''
endf "}}}

fu! gitv#util#file#range() "{{{
    return exists('b:Gitv_FileModeRange') ? b:Gitv_FileModeRange : []
endfu "}}}

 " vim:set et sw=4 ts=4 fdm=marker:
