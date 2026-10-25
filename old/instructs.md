Build the combined helper
The x86-64 assembly helper embeds payloud.bin, so the linked executable does not need the script at runtime.

gcc -nostdlib -no-pie -x assembler payloudhelper.asm -o payloudhelper
./payloudhelper SOURCE_DEVICE OUTPUT_IMAGE

Run the helper from hardware and storage you own or are authorized to access.