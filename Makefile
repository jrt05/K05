
All: cheetah

cheetah: kern.asm
	nasm kern.asm -f elf -l kern.lst -o kern.o
	gcc -Xlinker -T -Xlinker ldscript -ffreestanding -fno-builtin -nostdlib -nostartfiles -s kern.o -m32 -o kern.bin
	cp   ./kern.bin ./isofiles/boot/kernel.bin
	 mkisofs -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -boot-info-table -o bootable.iso isofiles

clean:
	rm -rf kern.bin kern.o *.iso ./isofiles/boot/kernel.bin
