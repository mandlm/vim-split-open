command! -nargs=1 SplitOpen :call splitopen#SplitOpenFile("<args>")
command! Split :call splitopen#SplitFile()

" map left-split / right-split file extensions
if !exists("g:splitopen_extensions")
	let g:splitopen_extensions = {
		\	"h": "cpp",
		\	"H": "CPP",
		\	}
endif

if !exists('g:splitopen_set_fzf_keys')
	let g:splitopen_set_fzf_keys = 0
endif

if g:splitopen_set_fzf_keys
	let g:fzf_action = {
		\	'ctrl-s': 'SplitOpen',
		\	'ctrl-t': 'tab split',
		\ 	'ctrl-x': 'split',
		\ 	'ctrl-v': 'vsplit',
		\	}
endif
