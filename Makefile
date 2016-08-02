all:
	echo

setup_fonts:
	git clone git@github.com:powerline/fonts.git
	cd fonts
	sh install.sh
	rm -r fonts

setup:
	mkdir -p ~/.vim/bundle
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	cp ./.vimrc ${HOME}

update:
	git pull
	cp ./.vimrc ${HOME}
	cp -rf ./snippets ~/.vim/
	cp -rf ./init.vim ~/.config/nvim/

setup_neocomplete:
	sudo brew install lua
	sudo brew reinstall vim --with-lua
	sudo brew install vim --with-lua --with-python3 --with-python --enable-interp=python,python3,ruby,perl,lua
	mv /usr/bin/vim /usr/bin/vim_old
