function s:getFileExtension(filename)
	return fnamemodify(a:filename, ":e")
endfunction

function s:getFileRoot(filename)
	return fnamemodify(a:filename, ":r")
endfunc

function s:getSwitchExtension(extension)
	if (a:extension == "cpp")
		return "h"
	elseif (a:extension == "h")
		return "cpp"
	endif
endfunc

function s:getSwitchFile(filename)
	return s:getFileRoot(a:filename) . "." . s:getSwitchExtension(s:getFileExtension(a:filename))
endfunc

function s:addLeftSplit(filename)
	execute("vsplit " . s:getSwitchFile(a:filename))
endfunc

function splitopen#SplitOpenFile(filename)
	execute("tabedit " . a:filename)
	call s:addLeftSplit(a:filename)
endfunction
