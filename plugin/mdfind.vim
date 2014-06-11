
let s:file_mdfind = {
\ 'is_selectable' : 1,
\ }
function! s:file_mdfind.func(candidates)
  let candidate = a:candidates[0]
  let path = candidate.action__directory
  if candidate.kind == 'directory'
    let path = fnamemodify(path . '/../', ':p:h')
  endif
  call unite#start([['mdfind', path]])
endfunction
call unite#custom#action('file', 'mdfind', s:file_mdfind)
