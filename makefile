all:
	nasm -f bin -o build/boot.bin src/boot.asm
	nasm -f bin -o build/main.bin src/main.asm
	#
	dd if=/dev/zero of=build/floppy.img bs=512 count=2880
	dd if=build/boot.bin of=build/floppy.img bs=512 count=1 conv=notrunc
	dd if=build/main.bin of=build/floppy.img bs=512 seek=1 conv=notrunc
	#
	qemu-system-i386 -drive format=raw,file=build/floppy.img
