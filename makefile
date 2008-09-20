
all: clean copy compile build

clean:
	rm -rf target

copy:
	mkdir -p target/debian
	cp -r src/debian/* target/debian
	cp -r src/script/* target
	cp -r src/desktop/* target
	mkdir target/man
	cp -r src/man/* target

compile: en.mo de.mo

%.mo: src/locale/%/gpg-open.po
	mkdir -p target/locale/$(*F)/LC_MESSAGES 
	msgfmt -o target/locale/$(*F)/LC_MESSAGES/gpg-open.mo $<  

build:
	cd target && \
	debuild -b
	