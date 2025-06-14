# setopt
setopt extended_history
setopt HIST_IGNORE_SPACE

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

function to-pngs() {
  for filename in *.HEIC; do
    magick "${filename}" "${filename%.*}.png"
  done
}

# yazi
function r() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
