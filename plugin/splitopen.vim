command -nargs=1 SplitOpen :call splitopen#SplitOpenFile("<args>")

let g:fzf_action = {
	\	'ctrl-s': 'SplitOpen',
	\	'ctrl-t': 'tab split',
  	\ 	'ctrl-x': 'split',
  	\ 	'ctrl-v': 'vsplit' }

