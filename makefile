all: build

install:
	echo '(install-shim "$(DESTDIR)" "tfhe")' | mit-scheme --batch-mode

clean:
	rm tfhe-const* tfhe-types* tfhe-shim*

build: tfhe-shim.so tfhe-types.bin tfhe-const.bin

tfhe-shim.so: tfhe-shim.o
	echo "(link-shim)" | mit-scheme --batch-mode -- -o $@ $^ -L/usr/local/lib -ltfhe-spqlios-fma

tfhe-shim.o: tfhe-shim.c
	echo '(compile-shim)' | mit-scheme --batch-mode -- -I/usr/local/include -c $<

tfhe-shim.c tfhe-const.c tfhe-types.bin: tfhe.cdecl
	echo '(generate-shim "tfhe" "#include <tfhe/tfhe.h>")' | mit-scheme --batch-mode

tfhe-const.bin: tfhe-const.scm
	echo '(sf "tfhe-const")' | mit-scheme --batch-mode

tfhe-const.scm: tfhe-const
	./tfhe-const

tfhe-const: tfhe-const.o
	$(CC) -o $@ $^ $(LDFLAGS) -L/usr/local/lib -ltfhe-spqlios-fma

tfhe-const.o: tfhe-const.c
	$(CC) -I/usr/local/include $(CFLAGS) -o $@ -c $<
