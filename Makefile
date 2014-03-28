all:
	edho

setup:
	mkdir -p ~/.vim/bundle
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim 
	cp ./.vimrc ${HOME}

update:
	git pull
	cp ./.vimrc ${HOME}
	cp -rf ./snippets ~/.vim/
