APPNAME=fc

default:
	go build -o $(APPNAME)

install: default
	@echo
	@echo Installing into home bin folder. You will also have to add the script
	@echo contained in fc.sh to your bashrc. Then you should be good to!
	@echo
	cp $(APPNAME) $(HOME)/bin

clean:
	rm -rf fc
