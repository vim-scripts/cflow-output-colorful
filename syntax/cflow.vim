" Vim Cflow's output file
" Maintainer:	Yang Zhang <imyeyeslove@163.com>
" Last Change:	2010 Jan 29

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore


"-------------------------------------------------------------------------------------------
"				Just for cflow's output
"-------------------------------------------------------------------------------------------
syn match 	cflowFileName		"\([[:alpha:]]\|_\)\([[:alnum:]]\|_\)*\.[[:alnum:]]\+:"me=e-1
syn match 	cflowVar	 	"\([[:alpha:]]\|_\)\([[:alnum:]]\|_\)*$"
syn match 	cflowVar	 	"\([[:alpha:]]\|_\)\([[:alnum:]]\|_\)*\s<"me=e-1
syn match 	cflowUserFunc 		"\([[:alpha:]]\|_\)\([[:alnum:]]\|_\)*()"me=e-2
syn match 	cflowSysFunc		"\([[:alpha:]]\|_\).*/usr/include/.*>"
syn match 	cflowNumber		"\(\<[[:digit:]]\+\>\|:\d>\)"

syn keyword 	cflowComment		at

"-------------------------------------------------------------------------------------------
"			C general type keywords, copied from c.vim
"		Maybe u could type ":runtime! syntax/c.vim" instead of them
"-------------------------------------------------------------------------------------------
syn keyword	cflowType		int long short char void
syn keyword	cflowType		signed unsigned float double

if !exists("c_no_ansi") || exists("c_ansi_typedefs")
  syn keyword   cflowType		size_t ssize_t off_t wchar_t ptrdiff_t sig_atomic_t fpos_t
  syn keyword   cflowType		clock_t time_t va_list jmp_buf FILE DIR div_t ldiv_t
  syn keyword   cflowType		mbstate_t wctrans_t wint_t wcflowType_t
endif

if !exists("c_no_c99") " ISO C99
  syn keyword	cflowType		bool complex
  syn keyword	cflowType		int8_t int16_t int32_t int64_t
  syn keyword	cflowType		uint8_t uint16_t uint32_t uint64_t
  syn keyword	cflowType		int_least8_t int_least16_t int_least32_t int_least64_t
  syn keyword	cflowType		uint_least8_t uint_least16_t uint_least32_t uint_least64_t
  syn keyword	cflowType		int_fast8_t int_fast16_t int_fast32_t int_fast64_t
  syn keyword	cflowType		uint_fast8_t uint_fast16_t uint_fast32_t uint_fast64_t
  syn keyword	cflowType		intptr_t uintptr_t
  syn keyword	cflowType		intmax_t uintmax_t
endif
if exists("c_gnu")
  syn keyword	cflowType		__label__ __complex__ __volatile__
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_cflow_syntax_inits")
  if version < 508
    let did_cflow_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cflowNumber		Number
  HiLink cflowUserFunc		Label
  HiLink cflowSysFunc		Comment
  HiLink cflowVar		Include
  HiLink cflowFileName		String
  HiLink cflowComment		Comment
  HiLink cflowType		Type

  delcommand HiLink
endif

let b:current_syntax = "cflow"
