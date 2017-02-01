# .bash_profile is read once on login. .bashrc is read whenever a new shell starts.
# Mac OSX reads .bash_profile with each new shell that starts.
# source .bashrc if it exists so it runs whenever a shell starts, on Mac or Linux.
if [[ -e ~/.bashrc ]]
then
	source ~/.bashrc
fi
