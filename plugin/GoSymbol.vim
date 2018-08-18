if exists('s:gosymbol_loaded')
    finish
endif
let s:gosymbol_loaded = 1
function! GoSymbol#ToAnywhere(gosymbol_whichway,gosymbol_side) 
    let g:gosymbol_line = getline('.') 
    " if !exists("g:keywords")
        let g:gosymbol_keywords = "\'\\\/\+\-\=\(\)\<\>\:\;\~\`\?\!\@\#\[\]\{\}\$\%\^\&\"\*"
    " endif
    let g:gosymbol_keywords = split(g:gosymbol_keywords,'\zs')
    let g:gosymbol_pos = col('.')  
    let g:gosymbol_after = strpart(g:gosymbol_line, g:gosymbol_pos) 
    let g:gosymbol_next_chars = split(g:gosymbol_after, '\zs') 
    let g:gosymbol_before = strpart(g:gosymbol_line, 0, g:gosymbol_pos) 
    let g:gosymbol_prev_chars = split(g:gosymbol_before, '\zs') 
    let g:gosymbol_current_char = get(g:gosymbol_next_chars, 0, '') 
    "============================================================
    let g:gosymbol_match_char="a" "Initialize
    let g:gosymbol_count_char=0
    if (a:gosymbol_whichway=="left")
        let g:gosymbol_count_char= col('.') 
    else
        let g:gosymbol_count_char= 1
    endif 
    "============================================================
    let g:gosymbol_test=""
    while g:gosymbol_match_char!="ERRO" && g:gosymbol_count_char!= 0
        if(a:gosymbol_whichway=='left')
            let g:gosymbol_match_char=get(g:gosymbol_prev_chars,g:gosymbol_count_char-1,"ERRO")
            let g:gosymbol_count_char=g:gosymbol_count_char-1
        else
            let g:gosymbol_match_char=get(g:gosymbol_next_chars,g:gosymbol_count_char-1,"ERRO")
            let g:gosymbol_count_char=g:gosymbol_count_char+1
        endif
        let g:gosymbol_count_keychar=0
        let g:gosymbol_key =get(g:gosymbol_keywords,g:gosymbol_count_keychar,"ERRO")
        while g:gosymbol_key !="ERRO"  "when g:gosymbol_key return erro,its means over 
            if (g:gosymbol_match_char==g:gosymbol_key)
                if (a:gosymbol_whichway=="right")
                    execute "normal!f".g:gosymbol_key
                    if (a:gosymbol_side=="i")
                        if(g:gosymbol_count_char==2)"Its means that matched the first char 
                            "do not return
                        else
                            return
                        endif
                    else
                        return
                    endif
                else
                    if (a:gosymbol_side=="i")
                        if((g:gosymbol_count_char+1 )==g:gosymbol_pos)"whether matched the first char
                            " don't execute anything
                            return
                        else
                            execute "normal!F".g:gosymbol_key
                            return
                        endif
                    else
                        if((g:gosymbol_count_char+1)!=g:gosymbol_pos)
                            execute "normal!F".g:gosymbol_key
                            return
                        endif
                    endif
                endif
            endif
            let g:gosymbol_count_keychar=g:gosymbol_count_keychar+1
            let g:gosymbol_key =get(g:gosymbol_keywords,g:gosymbol_count_keychar,"ERRO")
        endwhile
    endwhile
endfunction
