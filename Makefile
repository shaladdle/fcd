APPNAME=fc

default:
	go build -o $(APPNAME)

install: default
	cp $(APPNAME) $(HOME)/bin

clean:
	rm -rf fc
