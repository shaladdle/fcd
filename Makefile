APPNAME=fcd

default:
	go build -o $(APPNAME)

install:
	@echo
	@echo Installing into home bin folder. You will also have to add the script
	@echo contained in fc.sh to your bashrc. Then you should be good to!
	@echo
	go build -o $(HOME)/bin/$(APPNAME)

clean:
	rm -rf $(APPNAME)
