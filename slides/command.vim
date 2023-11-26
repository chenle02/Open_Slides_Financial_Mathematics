set nowrapscan

" The following is to open latex file without extension.
" Created one if it does not exist.
noremap gf :e <cfile>.tex<cr>

let g:ChapterNum = 1
function! g:SetChapter(number)
  let g:ChapterNum = a:number
  let g:Run=  'AsyncRun! lualatex --shell-escape -synctex=1 '. expand('%:p:h') . '/Chapter-' . g:ChapterNum . '_full.tex'
  let g:Pdf=  'AsyncRun! zathura ' . expand('%:p:h') . '/Chapter-' . g:ChapterNum . '_full.pdf &'
endfunction

call g:SetChapter(20)
noremap <M-1> :call g:SetChapter(1)<cr>
noremap <M-2> :call g:SetChapter(2)<cr>
noremap <M-3> :call g:SetChapter(3)<cr>
noremap <M-4> :call g:SetChapter(4)<cr>
noremap <M-5> :call g:SetChapter(5)<cr>
noremap <M-6> :call g:SetChapter(6)<cr>
noremap <M-7> :call g:SetChapter(7)<cr>
noremap <M-8> :call g:SetChapter(8)<cr>
noremap <M-9> :call g:SetChapter(9)<cr>
noremap <M-0> :call g:SetChapter(10)<cr>

noremap <leader><leader> :update<bar>:exec g:Run<cr>
noremap <leader><space> :exec g:Pdf<cr>

" The following is to make a letter as a vector
noremap <space>v i\vec{<esc>la}<esc>

" The following make a definition for the words in side {}
let @d='di{i\textit{pa}}F{;i\textcolor{yellow}f};'

set tw=100
ab fa \forall
ab ex \exists
ab ba \bigcap
ab bu \bigcup
ab lsup \lim\sup_n A_n
ab linf \lim\inf_n A_n
ab lsupa \limsup_{n\to\infty} a_n
ab linfa \liminf_{n\to\infty} a_n
ab seq \left\{x_n\right\}_{n=1}^\infty
ab SKIP %-------------- start slide -------------------------------%{{{ 1 Skip\begin{frame}[fragile,t] \begin{center} This section will be skipped for the interested students. \end{center} \end{frame} %-------------- end slide -------------------------------%}}}

" The following generate an example slides, the content is in the register.
let @k='ibfrm	"-ddp'

" The following add \item at the beginning of current line
let @l='I\item :w'

" the following register o is used to make a list
" (a) ...
" (b) ...
" (c) ...
" to the form
"       \only<1>{(a) ...}
"       \only<1>{(b) ...}
"       \only<1>{(c) ...}
let @o='I\only<1>{}0f}xA}j'

" The following is to increase letters
" https://stackoverflow.com/questions/18109625/writing-whole-alphabet-in-vim
" set nrformats+=alpha
" set nrformats-=alpha
