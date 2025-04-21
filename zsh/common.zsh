# setopt
setopt extended_history

# editor
export EDITOR=nvim
export MANPAGER='nvim +Man!'

# alias
alias vi=nvim
alias vim=nvim
alias ls="eza --icons"
alias ll="ls -l"
alias la="ls -la"
alias lg=lazygit
alias sys=fastfetch
alias ra=yazi

# yazi
function r() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
