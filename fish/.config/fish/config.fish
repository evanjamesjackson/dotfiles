if status is-interactive
and not set -q TMUX
	exec tmux attach
end

set fish_prompt_pwd_dir_length 0

set -g fish_greeting
