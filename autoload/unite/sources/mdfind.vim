
let s:source =
      \ { 'name'                    : 'mdfind'
      \ , 'description'             : 'candidates from mdfind'
      \ , 'max_candidates'          : 100
      \ , 'required_pattern_length' : 3
      \ , 'hooks' : {}
      \ }

function! unite#sources#mdfind#define()
  return s:source
endfunction

function! s:source.change_candidates(args, context)
  let command    = s:build_command(a:args, a:context)
  let candidates = split(unite#util#system(command), '\n')
  return s:build_candidates(candidates)
endfunction

function! s:build_command(args, context)
  let cmd = 'mdfind'
  if len(a:args) > 0
    let cmd .= ' -onlyin ' . a:args[0]
  end
  let cmd .=' -name ' . a:context.input
  return cmd
endfunction

function! s:build_candidates(candidates)
  let list = []
  for candidate in a:candidates
    if isdirectory(candidate)
      continue
    endif
    let entry = {
          \ 'word'              : candidate,
          \ 'abbr'              : candidate,
          \ 'kind'              : 'file',
          \ 'source'            : 'mdfind',
          \ 'action__path'      : candidate,
          \ 'action__directory' : unite#util#path2directory(candidate),
          \	}
    call add(list, entry)
  endfor
  return list
endfunction
