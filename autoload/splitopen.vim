function splitopen#SplitOpenFile(filename)
	execute("tabedit " . a:filename)
	let l:file_extension = tolower(fnamemodify(a:filename, ":e"))
	if l:file_extension == "cpp"
		execute("FSSplitLeft")
		execute("wincmd l")
	elseif l:file_extension == "h"
		execute("FSSplitRight")
		execute("wincmd h")
	endif
endfunction
