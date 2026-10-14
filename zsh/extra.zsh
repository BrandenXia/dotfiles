# magick
function to-pngs() {
  for filename in (#i)*.HEIC; do
    magick "${filename}" "${filename%.*}.png"
    echo "Converted ${filename} to ${filename%.*}.png"
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
