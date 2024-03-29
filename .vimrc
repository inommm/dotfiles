if has('vim_starting')
		set all&
		if !filereadable(expand("~/.vim/autoload/plug.vim"))
				echo "Installing vim-plug..."
				call system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
		endif
endif

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'pbogut/fzf-mru.vim'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'
Plug 'EvanDotPro/nerdtree-chmod'
Plug 'dbakker/vim-projectroot'
Plug 'majutsushi/tagbar'
Plug 'dhruvasagar/vim-table-mode'
Plug 'elzr/vim-json'
Plug 'cohama/lexima.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'andymass/vim-matchup'

Plug 'cocopon/iceberg.vim'

if v:version >= 800
		Plug 'prabirshrestha/vim-lsp'
		Plug 'prabirshrestha/async.vim'
		Plug 'prabirshrestha/asyncomplete.vim'
		Plug 'prabirshrestha/asyncomplete-lsp.vim'
		Plug 'prabirshrestha/asyncomplete-buffer.vim'
		Plug 'prabirshrestha/asyncomplete-file.vim'
		Plug 'mattn/vim-lsp-settings'
end

Plug 'vim-ruby/vim-ruby',                      { 'for': 'ruby' }
Plug 'tpope/vim-rails',                        { 'for': 'ruby' }
Plug 'mattn/vim-goimports'
Plug 'othree/yajs.vim',                        { 'for': 'javascript' }
"Plug 'jason0x43/vim-js-indent',                { 'for': ['javascript', 'typescript', 'html'] }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'kchmck/vim-coffee-script',               { 'for': 'coffee' }
Plug 'Rykka/riv.vim',                          { 'for': 'rst' }
Plug 'othree/html5.vim',                       { 'for': 'html' }
Plug 'alvan/vim-closetag',                     { 'for': 'html' }
Plug 'hashivim/vim-terraform',                 { 'for': 'terraform' }
Plug 'vim-scripts/tracwiki',                   { 'for': 'tracwiki' }
Plug 'saltstack/salt-vim',                     { 'for': 'sls' }
Plug 'glidenote/keepalived-syntax.vim',        { 'for': 'keepalived' }

call plug#end()

function s:is_plugged(name)
		if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
				return 1
		else
				return 0
		endif
endfunction

set nowrap
set number
set autoindent
set list
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
set display=lastline
set showmatch
set matchtime=1
set showtabline=2
set noswapfile
set scrolloff=10
set sidescrolloff=16
set noshowmode
set laststatus=2
set hlsearch
set ignorecase
set smartcase
set clipboard+=unnamed
set backspace=indent,eol,start
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set shortmess+=I
set autoread
set nofoldenable
set re=0
set lazyredraw
set ttyfast
set tabstop=4
"set ambiwidth=double
set nobackup
set visualbell t_vb=
set updatetime=750

" disable plugins
let g:loaded_gzip            = 1
let g:loaded_tar             = 1
let g:loaded_tarPlugin       = 1
let g:loaded_zip             = 1
let g:loaded_zipPlugin       = 1
let g:loaded_rrhelper        = 1
let g:loaded_2html_plugin    = 1
let g:loaded_vimball         = 1
let g:loaded_vimballPlugin   = 1
let g:loaded_getscript       = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_netrw           = 1
let g:loaded_netrwPlugin     = 1

" auto reload
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
						\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" matchup
let g:matchup_matchparen_deferred = 1

" ale
let g:ale_set_highlights          = 0
let g:ale_sign_error              = "\uf06a"
let g:ale_sign_warning            = "\uf071"
let g:ale_ruby_rubocop_executable = 'bundle'

" vim-json
let g:vim_json_syntax_conceal = 0

"set guicursor+=n-v-c:blinkon0
syntax enable
filetype plugin indent on

" auto read
augroup vimrc-checktime
		autocmd!
		autocmd WinEnter * checktime
augroup END

" NERDTree
let g:NERDTreeChDirMode                 = 0
let g:NERDTreeHijackNetrw               = 0
let g:NERDTreeWinSize                   = 60
let g:NERDTreeShowHidden                = 1
let g:NERDTreeQuitOnOpen                = 1
let g:NERDTreeAutoDeleteBuffer          = 1
autocmd BufEnter * silent! lcd %:p:h
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NerdTreeToggleFind()
		if exists("g:NERDTree") && g:NERDTree.IsOpen()
				NERDTreeClose
		elseif filereadable(expand('%'))
				NERDTreeFind
		else
				NERDTree
		endif
endfunction

" gitgutter
let g:gitgutter_max_signs = 2000

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_type_ruby = {
						\ 'kinds' : [
						\ 'm:modules',
						\ 'c:classes',
						\ 'd:describes',
						\ 'C:contexts',
						\ 'f:methods',
						\ 'F:singleton methods'
						\ ]
						\ }
let g:tagbar_type_go = {
						\ 'ctagstype': 'go',
						\ 'kinds' : [
						\'p:package',
						\'f:function',
						\'v:variables',
						\'t:type',
						\'c:const'
						\]
						\}
let g:tagbar_type_markdown = {
						\ 'ctagstype' : 'markdown',
						\ 'kinds' : [
						\ 'h:Heading_L1',
						\ 'i:Heading_L2',
						\ 'k:Heading_L3'
						\ ]
						\ }

" indentLine
let g:indentLine_enabled = 1

" Encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" Color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if (s:is_plugged('iceberg.vim'))
		colorscheme iceberg
		set background=dark
		hi EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
endif

if (s:is_plugged('vim-gotham'))
		colorscheme gotham

		hi NonText ctermbg=bg ctermfg=bg guibg=bg guifg=bg
		hi EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
		hi VertSplit guifg=bg
endif

if (s:is_plugged('ayu-vim'))
		let g:ayucolor = 'mirage'
		colorscheme ayu
endif

if (s:is_plugged('Base2Tone-vim'))
		set background=dark
		colorscheme Base2Tone_EveningDark

		hi GitGutterAdd guibg=bg
		hi GitGutterChange guibg=bg
		hi GitGutterDelete guibg=bg
		hi GitGutterChangeDelete guibg=bg
endif

" GUI
set guifont=SF\ Mono\ Square\ Regular:h15
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=e

" Custom Keymap
let mapleader = ";"
nnoremap <Leader>vr :source $MYVIMRC<CR>
nnoremap tc         :<C-u>tabnew<CR>
nnoremap tn         gt
nnoremap tp         gT
nnoremap <Leader>n  :call NerdTreeToggleFind()<CR>
nnoremap <Leader>f  :Files<CR>
nnoremap <Leader>b  :Buffers<CR>
nnoremap <Leader>r  :FZFMru<CR>
nnoremap <Leader>jf :call FormatJson()<CR>
nnoremap <Leader>gb  :Gblame<CR>
nnoremap <Leader>gs  :Gstatus<CR>
nnoremap <Leader>gc  :Gcommit<CR>
nnoremap <Leader>gd  :Gdiff<CR>
nnoremap <Leader>u  :UpdateTags -R .<CR>
nnoremap <Leader>t  :TagbarToggle<CR>
nnoremap <Leader>h  :noh<CR>
nnoremap <Leader>tm :TableModeToggle<CR>
nnoremap <C-]>      :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"
vmap     <Enter>    <Plug>(EasyAlign)

" vim-lsp
let g:lsp_diagnostics_enabled     = 0
let g:lsp_diagnostics_echo_cursor = 0
let g:asyncomplete_auto_popup     = 1
let g:lsp_insert_text_enabled     = 0
let g:lsp_text_edit_enabled       = 0

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
						\ 'name': 'buffer',
						\ 'whitelist': ['*'],
						\ 'blacklist': [],
						\ 'completor': function('asyncomplete#sources#buffer#completor'),
						\ 'config': {
						\    'max_buffer_size': 5000000,
						\  },
						\ }))

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
						\ 'name': 'file',
						\ 'whitelist': ['*'],
						\ 'priority': 10,
						\ 'completor': function('asyncomplete#sources#file#completor')
						\ }))

" fzf
let g:fzf_buffers_jump = 1
let g:fzf_mru_relative = 1
let g:fzf_layout       = { 'window': { 'width': 0.9, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS  = '--reverse'

" vim-rooter
let g:rooter_disable_map  = 1
let g:rooter_silent_chdir = 1
let g:rooter_patterns     = ['.git', '.hg', '.svn']

" lightline
if s:is_plugged('lightline.vim')
		let g:lightline = {
								\ 'colorscheme': g:colors_name,
								\ 'active': {
								\ 	'left':  [ [ 'mode', 'paste' ], [ 'current_branch' ], [ 'filepath', 'modified', 'readonly' ] ],
								\ 	'right': [ [ 'lineinfo' ], [ 'filetype' ], [ 'fileformat', 'fileencoding', 'indentation' ] ]
								\ },
								\ 'inactive': {
								\ 	'left':  [ [ 'mode', 'paste' ], [ 'current_branch' ], [ 'filepath', 'modified', 'readonly' ] ],
								\ 	'right': [ [ 'lineinfo' ], [ 'filetype' ], [ 'fileformat', 'fileencoding', 'indentation' ] ]
								\ },
								\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
								\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
								\ 'component': {
								\ 	'rows'    : '%L',
								\ 	'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
								\ },
								\ 'component_visible_condition': {
								\ 	'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
								\ },
								\ 'component_function': {
								\ 	'current_branch': 'CurrentBranch',
								\ 	'filename': 'Filename',
								\ 	'filepath': 'Filepath',
								\ 	'lineinfo': 'LineInfo'
								\ },
								\ 'component_expand': {
								\ 	'indentation': 'MixedIndentationWarning',
								\ 	'readonly': 'ReadOnly',
								\ },
								\ 'component_type': {
								\ 	'indentation': 'error',
								\ 	'readonly': 'error',
								\ },
								\ 'tab': {
								\ 	'active': [ 'title' ],
								\ 	'inactive': [ 'title' ]
								\ },
								\ 'tab_component_function': {
								\ 	"title": "TabTitle"
								\ }
								\ }

		function! ReadOnly()
				return &ft !~? 'help' && &ro ? 'RO' : ''
		endfunction

		function! CurrentBranch()
				try
						if exists('*fugitive#head')
								let _ = fugitive#head()
								return strlen(_) ? _ : ''
						endif
				catch
				endtry
				return ''
		endfunction

		function! MixedIndentationWarning()
				if (search('^\t', 'nw') != 0) && (search('^ ', 'nw') != 0)
						return 'MixedIndentation'
				else
						return ''
				endif
		endfunction

		function! Filename()
				return expand('%:t')
		endfunction

		function! Filepath()
				return expand('%')
		endfunction

		function! TabFilePath(n)
				let buflist = tabpagebuflist(a:n)
				let winnr = tabpagewinnr(a:n)
				let _ = expand('#'.buflist[winnr - 1].':p')
				return strlen(_) ? _ : '[No Name]'
		endfunction

		function! TabProjectName(n)
				return fnamemodify(ProjectRootGet(TabFilePath(a:n)), ':t')
		endfunction

		function! TabTitle(n)
				let projectname = TabProjectName(a:n)
				let filename = lightline#tab#filename(a:n)

				if ( projectname == filename )
						return projectname
				elseif( projectname != '' )
						return projectname . ":" . filename
				endif

				return filename
		endfunction

		function! UpdateExpandComponents()
				call MixedIndentationWarning()
				call lightline#update()
		endfunction

		augroup AutoUpdateExpandComponents
				au BufWritePost * call UpdateExpandComponents()
		augroup END

		function! LineInfo()
				return line('.') . '/' . line('$')
		endfunction
endif

" JSON formatter
if executable('jq')
		function! FormatJson()
				execute "%!jq '.'"
		endfunction
endif

" FileTypes Definition
au BufRead,BufNewFile *.txt                           setl filetype=text
au BufRead,BufNewFile *.rb,*.json.jb                  setl filetype=ruby
au BufRead,BufNewFile *.erb                           setl filetype=eruby
au BufRead,BufNewFile *.md,*.markdown,*.md.*          setl filetype=markdown
au BufRead,BufNewFile *.go                            setl filetype=go
au BufRead,BufNewFile *.tracwiki                      setl filetype=tracwiki
au BufRead,BufNewFile *.tf,*.tfstate,*.tfstate.backup setl filetype=terraform
au BufRead,BufNewFile *etc/httpd/conf/*,*etc/httpd/conf.d/*,/etc/apache2/apache2.conf setl filetype=apache
au BufRead,BufNewFile keepalived.conf setl ft=keepalived
au BufRead,BufNewFile *.case setl ft=case
au BufRead,BufNewFile *.rule setl ft=rule

" Plain Text
au FileType text setl sw=2 sts=2 ts=2 et

" HTML
au FileType html setl sw=2 sts=2 ts=2 et

let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete          = 1
let g:html5_microdata_attributes_complete     = 1
let g:html5_aria_attributes_complete          = 1

" Ruby
au FileType ruby,eruby setl sw=2 ts=2 sts=2 et
let ruby_space_errors                   = 1
let g:ruby_indent_block_style           = 'do'
let g:rubycomplete_buffer_loading       = 1
let g:rubycomplete_classes_in_global    = 1
let g:rubycomplete_include_object       = 1
let g:rubycomplete_include_object_space = 1

" Python
au FileType python setl smartindent sw=4 sts=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class

" JavaScript
au FileType javascript setl sw=2 sts=2 ts=2 et

" CSS/SCSS
au FileType css setl sw=2 sts=2 ts=2 et
au FileType scss setl sw=2 sts=2 ts=2 et

" JSON
au FileType json setl sw=2 sts=2 ts=2 et

" CoffeeScript
au FileType coffeescript setl sw=2 sts=2 ts=2 et

" TypeScript
au FileType typescript setl sw=2 sts=2 ts=2 et
let g:js_indent_typescript=1

" TypeScript (React)
au FileType typescriptreact setl sw=2 sts=2 ts=2 et
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Yaml
au FileType yaml setl sw=2 sts=2 ts=2 et

" SLS
au FileType sls setl sw=2 sts=2 ts=2 et

" Markdown
au FileType markdown setl sw=2 sts=2 ts=2 et

" reStructuredText
let g:riv_disable_folding = 1

" liquid
au FileType liquid setl sw=2 ts=2 sts=2 et

" Go
au FileType go setl sw=8 sts=8 ts=8 noet
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command                 = 'goimports'
let g:go_fmt_autosave                = 1

" Terraform
au FileType terraform setl sw=2 ts=2 sts=2 et
