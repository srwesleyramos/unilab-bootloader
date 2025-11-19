all: build_img
	qemu-system-i386 -drive format=raw,file=build/main.img

build_img: build_bin
	cp build/main.bin build/main.img
	truncate -s 1440k build/main.img

build_bin: src/main.asm
	nasm -f bin -o build/main.bin src/main.asm
