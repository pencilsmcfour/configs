#!/bin/bash

FILES=(.bashrc .bash_profile .screenrc .vimrc)

if [[ ! -d ~ ]]
then
	echo "no ~ directory, exiting"
	exit 1
fi

for f in ${FILES[@]}
do
	[[ -e ${f} ]] || continue
	if [[ -e ~/${f} ]]
	then
		diff ${f} ~/${f} &>/dev/null && continue
		[[ -d /tmp ]] && cp ~/${f} /tmp/${f}.bk
	fi
	cp ${f} ~/${f} && echo "deployed ${f}"
done

exit 0
