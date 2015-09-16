" Gitv line-related utility functions

if exists('g:autoloaded_gitv_util')
    finish
endif
let g:autoloaded_gitv_util = 1

fu! gitv#util#completion(arglead, cmdline, pos) "{{{
    if match( a:arglead, '^-' ) >= 0
        return  "\n--after\n--all-match\n--ancestry-path\n--author-date-order"
                \ . "\n--author=\n--author=\n--before=\n--bisect\n--boundary"
                \ . "\n--branches\n--cherry-mark\n--cherry-pick\n--committer="
                \ . "\n--date-order\n--dense\n--exclude=\n--first-parent"
                \ . "\n--fixed-strings\n--follow\n--glob\n--grep-reflog"
                \ . "\n--grep=\n--max-age=\n--max-count=\n--merges\n--min-age="
                \ . "\n--min-parents=\n--not\n--pickaxe-all\n--pickaxe-regex"
                \ . "\n--regexp-ignore-case\n--remotes\n--remove-empty\n--since="
                \ . "\n--skip\n--tags\n--topo-order\n--until=\n--use-mailmap"
    else
        let refs = fugitive#buffer().repo().git_chomp('rev-parse', '--symbolic', '--branches', '--tags', '--remotes')
        let refs .= "\nHEAD\nFETCH_HEAD\nORIG_HEAD"

        " Complete ref names preceded by a ^ or anything followed by 2-3 dots
        let prefix = matchstr( a:arglead, '\v^(\^|.*\.\.\.?)' )
        if prefix == ''
            return refs
        else
            return substitute( refs, "\\v(^|\n)\\zs", prefix, 'g' )
        endif
endf "}}}

 " vim:set et sw=4 ts=4 fdm=marker:
