# unite-mdfind

## unite source

    :Unite mdfind

    :Unite mdfind:<onlyin_directory_path>

## unite action

* :Unite file
* <Tab>
* you can select mdfind action

## you can define map to action

    inoremap <silent><buffer><expr> <C-s> unite#do_action('mdfind')
