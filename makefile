
all: clean copy compile build

clean:
	rm -rf target
	mkdir target

copy:
	cp -r src/deb/* target
	cp -r src/script/* target
	cp -r src/desktop/* target

compile: en.mo de.mo

%.mo: src/resources/locale/%/gpg-open.po
	mkdir -p target/locale/$(*F)/LC_MESSAGES 
	msgfmt -o target/locale/$(*F)/LC_MESSAGES/gpg-open.mo $<  

build:
	cd target
	debuild -b