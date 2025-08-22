" Cube Language
" use "set filetype" instead of "setfiletype" to override earlier setting

function! DetectCube()
    " echom 'checking for Cube files'
    let likely = 0
    let keys = ['RUN PGM', 'ENDRUN', 'MATRIX', 'NETWORK', 'HIGHWAY', '; Do not change filenames', ';;<<Default Template>>;']
    " Check for keywords in the first 50 lines
   for i in getline(1, 50)
        for k in keys
            if i =~ k
                let likely += 1
                " echom i . ', ' . k .' , ' . likely
                break
            endif
        endfor
        if likely >= 1
            " echom 'Detected Cube syntax file'
            set filetype=cube
            " setfiletype cube
            break
        endif
    endfor
endfunction

au BufRead,BufNewFile,BufWinEnter *.S,*.s,*.PRN,*.prn call DetectCube()
