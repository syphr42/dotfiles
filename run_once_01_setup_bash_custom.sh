#!/usr/bin/env sh

# This script manages custom modifications to .bashrc without overwriting the
# entire file.

# Remove the chezmoi managed portion of .bashrc
sed -i '/^# chezmoi managed START/,/^# chezmoi managed END/d;' ~/.bashrc

# Insert a fresh copy of the chezmoi managed section into .bashrc
cat <<- EOF >> ~/.bashrc
	# chezmoi managed START
	if [ -f ~/.bash_custom ]; then
		. ~/.bash_custom
	fi
	# chezmoi managed END
EOF
