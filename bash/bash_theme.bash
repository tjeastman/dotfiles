#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY="${yellow}⚡ "
SCM_THEME_PROMPT_CLEAN=" "
SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

function prompt_command() {
    PS1="${yellow}\h${reset_color}${red}:${reset_color}${cyan}\w${reset_color}${red}|${reset_color}${green}$(scm_prompt_info)${reset_color}${cyan}»${reset_color} "
}

PROMPT_COMMAND=prompt_command;
