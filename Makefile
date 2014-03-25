build:

	go get github.com/lib/pq
	
	go build -o pg2txt main.go

dist: build
	
	$(eval VER := $(shell ./pg2txt -version))
	$(eval DISTPATH := dist/$(VER))

	gox -osarch="darwin/amd64 linux/amd64 windows/amd64"

	#
	# Creating Archive for $(VER)
	#
	
	mkdir -p $(DISTPATH)
	rm -rf $(DISTPATH)/*

	cp pg2txt_darwin_amd64 pg2txt_linux_amd64 pg2txt_windows_amd64.exe $(DISTPATH)/;

.PHONY: build