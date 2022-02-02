.PHONY: all debug clean top profile

all: main.exe calculator
debug: all main.cma

main.exe:
	dune build
	cp code/main.exe .

calculator.s: main.exe
	./main.exe &> calculator.s

runtime.s: runtime.c
	gcc -O0 -arch x86_64 -fno-asynchronous-unwind-tables -S runtime.c

calculator: calculator.s runtime.s
	gcc -o calculator -arch x86_64 runtime.s calculator.s 

test: calculator
	./calculator 1 2 3 4 5 6 7 8

.FORCE:

clean:
	dune clean
	rm main.exe calculator.s calculator runtime.s

utop:
	dune utop
