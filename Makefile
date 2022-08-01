all:
	echo

setup_fonts:
	git clone git@github.com:powerline/fonts.git
	cd fonts
	sh install.sh
	rm -r fonts

update:
	git pull
	cp ./.vimrc ${HOME}
	cp -rf ./snippets ~/.vim/
	cp -rf ./init.vim ~/.config/nvim/
