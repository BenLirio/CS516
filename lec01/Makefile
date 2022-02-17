CFLAGS := -mmacosx-version-min=10.12 -fno-stack-protector -fno-asynchronous-unwind-tables -fno-vectorize -fno-slp-vectorize 

parameters := O0 O1 O2 O3

.PHONY: all
all: factorialO0 factorialO1 factorialO2 factorialO3

LIBPATH := /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib


define COMPILE_WITH_OPT
$(info DEFINING $1)
factorial$(1): factorial-rec.c
	gcc $$(CFLAGS) -$(1) -emit-llvm -S -o factorial-$(1).ll factorial-rec.c
	gcc $$(CFLAGS) -$(1) -S -o factorial-$(1).s factorial-$(1).ll
	as -o factorial-$(1).o factorial-$(1).s
	ld -macosx_version_min 12.0 -L $(LIBPATH) -lSystem  -o factorial-$(1) factorial-$(1).o
endef 

$(foreach P, $(parameters), $(eval $(call COMPILE_WITH_OPT,$(P))))


clean:
	rm -rf a.out factorial*.s factorial*.ll factorial*.o factorial-O?
