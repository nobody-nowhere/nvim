let g:airline_powerline_fonts = 1
let g:airline_theme="onedark"

"" Easy-motion remap
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_inc_highlight = 0

map <Space>f <Plug>(easymotion-f)
map <Space>s <Plug>(easymotion-s)
map <Space><Space> <Plug>(easymotion-s2)
map <Space>t <Plug>(easymotion-t)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)

" These `n` & `N` map[pings[ are options.] You] do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map / <Plug>(easymotion-sn)
" map n <Plug>(easymotion-next)
" map N <Plug>(easymotion-prev)

" ale-specific
let g:ale_linters = {'text': ['proselint'], 'cpp': ['clang'], 'c': ['clang'], 'vim': ['vint'], }
let airline#extensions#ale#error_symbol = '⨉ '
let airline#extensions#ale#warning_symbol = '⚠ '
let g:ale_sign_column_always = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <silent> <F5> :ALEToggle<CR>

" Expand region plugin.
" call expand_region#custom_text_objects()
" vmap v <Plug>(expand_region_expand)
" vmap <C-v> <Plug>(expand_region_shrink)
" Chromatica
" let g:chromatica#enable_at_startup=1
" let g:chromatica#highlight_feature_level=1
" let g:chromatica#responsive_mode=1

" autocmd! BufWritePost * Neomake

" Deoplete
" let g:deoplete#enable_at_startup = 1
" inoremap <expr><tab> pumvisible() ? "\<c-p>" : "\<tab>"

" let g:neotags#cpp#order = 'cedfm'
" let g:neotags#c#order = 'cedfm'
" let g:neotags_enabled = 1

" highlight link cTypeTag Special
" highlight link cppTypeTag Special
" highlight link cEnumTag Identifier
" highlight link cppEnumTag Identifier
" highlight link cPreProcTag PreProc
" highlight link cppPreProcTag PreProc
