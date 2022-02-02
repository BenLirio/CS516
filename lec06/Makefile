.PHONY: all debug clean top profile

all: main1.exe main2.exe main3.exe
debug: all main1.cma main2.cma main3.cma

%.cma: .FORCE
	$(OCB) $@

%.exe:
	dune build
	cp code/$@ .

.FORCE:

clean:
	dune clean
	rm main1.exe main2.exe main3.exe *.cma

utop: main1.exe main2.exe main3.exe
	dune utop

