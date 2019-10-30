function s:invert_dict(source_dict)
	let result = {}
	for [key, value] in items(a:source_dict)
		let result[value] = key
	endfor
	return result
endfunction

let s:extensions = g:splitopen_extensions
let s:extensions_rev = s:invert_dict(s:extensions)

function s:isLeftSideExtension(extension)
	return has_key(s:extensions, a:extension)
endfunction

function s:isRightSideExtension(extension)
	return has_key(s:extensions_rev, a:extension)
endfunction

function s:getFileExtension(filename)
	return fnamemodify(a:filename, ":e")
endfunction

function s:getFileRoot(filename)
	return fnamemodify(a:filename, ":r")
endfunction

function s:getSwitchExtension(filename)
	let extension = s:getFileExtension(a:filename)
	if s:isLeftSideExtension(extension)
		return s:extensions[extension]
	elseif s:isRightSideExtension(extension)
		return s:extensions_rev[extension]
	endif
endfunction

function s:getSwitchFile(filename)
	return s:getFileRoot(a:filename) . "." . s:getSwitchExtension(a:filename)
endfunction

function s:addLeftSplit(filename)
	execute("vsplit " . s:getSwitchFile(a:filename))
	execute("wincmd l")
endfunction

function s:addRightSplit(filename)
	execute("vsplit " . s:getSwitchFile(a:filename))
	execute("wincmd L")
	execute("wincmd h")
endfunction

function s:splitOpenFile(filename)
	let extension = s:getFileExtension(a:filename)
	if s:isLeftSideExtension(extension)
		call s:addRightSplit(a:filename)
	elseif s:isRightSideExtension(extension)
		call s:addLeftSplit(a:filename)
	endif
endfunction

function! splitopen#SplitOpenFile(filename)
	execute("tabedit " . a:filename)
	call s:splitOpenFile(a:filename)
endfunction

function! splitopen#SplitFile()
	call s:splitOpenFile(expand("%:p"))
endfunction
