autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_branch() {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $(git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$(git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
      echo " %{$fg_bold[magenta]%}(unpushed)%{$reset_color%}"
  fi
}

ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv version | awk '{print $1}')"
  fi

  if (( $+commands[rvm-prompt] ))
  then
    echo "$(rvm-prompt | awk '{print $1}')"
  fi
}

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]] && [ "$(ruby_version)" != "$(rbenv global)" ]
  then
    echo "%{$fg[red]%}(ruby:$(ruby_version))%{$reset_color%} "
  else
    echo ""
  fi
}

directory_name() {
  echo "%{$fg[cyan]%}%1/%\/%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  #set_prompt
}

# show current rbenv version if different from rbenv global
rbenv_version_status() {
  local ver=$(rbenv version-name)
  [ "$(rbenv global)" != "$ver" ] && echo "[$ver]"
}

prompt_hostname() {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "%{$fg[white]%}%m::%{$reset_color%} "
    else
        echo ""
    fi
}

local ret_status="%(?:%{$fg_bold[green]%}$:%{$fg_bold[red]%}$)"
local timeval="%{$fg[blue]%}[%D{%H:%M:%S}]%{$reset_color%}"
PROMPT=$'\n$(prompt_hostname)$(rb_prompt)in $(directory_name) $(git_dirty)$(need_push)\n${timeval} %B${ret_status}%b '
