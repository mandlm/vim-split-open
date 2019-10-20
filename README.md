# SplitOpen

This vim plugin opens file-pairs in a new split-window tab

## Usage

Use 

	:SplitOpen filename 

with a .cpp or .h file as filename to open a new tab containing a vertical split
with the corresponding header file in the left window and the corresponding
source file in the right window.

## Configuration

You can configure the following settings:

### g:splitopen_extensions

Use this dictionary to define your pairs of left-hand- right-hand-side file
types. E.g.

	let g:splitopen_extensions = {"h": "cpp"}

always places a .cpp file on the right-hand side when opening an .h file and
vice versa.

### g:splitopen_set_fzf_keys

Set this option to 1 

	let g:splitopen_set_fzf_keys = 1

to have SplitOpen overwrite the default fzf keybindings ctrl-t/x/v for opening 
files in splits or tabs to add an addional binding ctrl-s to call SplitOpen.

## License

SplitOpen is GPL-3.0 licensed. See LICENSE file for more info.

## Changelog 

v0.0.3
* Add fzf.vim keybinding

v0.0.2
* Added delay-loading
* Added documentation

v0.0.1
* Initial release
