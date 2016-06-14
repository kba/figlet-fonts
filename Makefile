.PHONY: watch serve

figlet.js:
	wget -O "$@" 'https://raw.githubusercontent.com/patorjk/figlet.js/master/lib/figlet.js'

index.html: src/index.jade
	jade -o . $<

fontlist.txt: fonts
	(cd fonts && ls *.?lf) > "$@"

script.js: src/script.coffee
	coffee -o . -c $<

serve: index.html script.js fontlist.txt
	python -m SimpleHTTPServer

watch:
	nodemon -w . -e jade,coffee -x make serve
