OCBFLAGS := -r -Is util,x86
.PHONY: main

all: main 

main: 
	dune build --profile release @install 
	@test -L main.native || ln -s _build/install/default/bin/main.native main.native

utop:
	dune utop . --profile release

clean:
	rm -rf main.native
	dune clean
