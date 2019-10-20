function s:invert_dict(source_dict)
	let result = {}
	for [key, value] in items(a:source_dict)
		let result[value] = key
	endfor
	return result
endfunc

let s:extensions = g:splitopen_extensions
let s:extensions_rev = s:invert_dict(s:extensions)

function s:isLeftSideExtension(extension)
	return has_key(s:extensions, a:extension)
endfunc

function s:isRightSideExtension(extension)
	return has_key(s:extensions_rev, a:extension)
endfunc

function s:getFileExtension(filename)
	return fnamemodify(a:filename, ":e")
endfunction

function s:getFileRoot(filename)
	return fnamemodify(a:filename, ":r")
endfunc

function s:getSwitchExtension(filename)
	let extension = s:getFileExtension(a:filename)
	if s:isLeftSideExtension(extension)
		return s:extensions[extension]
	elseif s:isRightSideExtension(extension)
		return s:extensions_rev[extension]
	endif
endfunc

function s:getSwitchFile(filename)
	return s:getFileRoot(a:filename) . "." . s:getSwitchExtension(a:filename)
endfunc

function s:addLeftSplit(filename)
	execute("vsplit " . s:getSwitchFile(a:filename))
	execute("wincmd l")
endfunc

function s:addRightSplit(filename)
	execute("vsplit " . s:getSwitchFile(a:filename))
	execute("wincmd L")
	execute("wincmd h")
endfunc

function splitopen#SplitOpenFile(filename)
	execute("tabedit " . a:filename)
	let extension = s:getFileExtension(a:filename)
	if s:isLeftSideExtension(extension)
		call s:addRightSplit(a:filename)
	elseif s:isRightSideExtension(extension)
		call s:addLeftSplit(a:filename)
	endif
endfunction
