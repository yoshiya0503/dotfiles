all:
	echo

setup:
	mkdir -p ~/.vim/bundle
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim 
	brew install ctags
	cp ./.vimrc ${HOME}

update:
	git pull
	cp ./.vimrc ${HOME}
	cp -rf ./snippets ~/.vim/

setup_neocomplete:
	brew install lua
	brew reinstall vim --with-lua
	mv /usr/bin/vim /usr/bin/vim_old
