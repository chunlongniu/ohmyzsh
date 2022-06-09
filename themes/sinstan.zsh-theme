# user, host, full path, pytthon virttual environment and git time/date

function virtualenv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

prompt_char='$'

local virtualenv_info='$(virtualenv_prompt_info)'
local datetime_info=`date +%Y-%m-%d-%H:%M:%S`

PROMPT="┌─[${FG[222]}%B%n%b ${FG[239]}at ${FG[117]}$(box_name) ${FG[239]}in %B${FG[226]}%~%b${virtualenv_info}]
└─[${prompt_char}] %{$reset_color%}"

 RPROMPT='$(git_prompt_info) ${FG[239]}${datetime_info}%{$reset_color%}'

export VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[239]}using${FG[222]} «"
ZSH_THEME_VIRTUALENV_SUFFIX="»%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}git:(%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
