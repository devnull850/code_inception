#include <stdint.h>
#include <stdio.h>

uint64_t a[] = { 0x31c050c704246f72, 0x6c6466c744240421,
                 0xa48b848656c6c6f, 0x2c2057506a01586a,
                 0x15f4889e66a0e5a, 0xf0531ff6a3c580f, 0x5 };

int main(void) {
	uint8_t *p;
	uint64_t b;

	for (uint32_t i = 0; i < 0x6; ++i) {
		b = a[i];

		a[i] = (b & 0xff) << 0x38 |
		       (b & 0xff00) << 0x28 |
		       (b & 0xff0000) << 0x18 |
		       (b & 0xff000000) << 0x8 |
		       ((b >> 0x38) & 0xff) |
		       ((b >> 0x28) & 0xff00) |
		       ((b >> 0x18) & 0xff0000) |
		       ((b >> 0x8) & 0xff000000);
	}

	p = (uint8_t *) a;

	for (uint32_t i = 0; i < 0x31; ++i) {
		p[i] ^= 0x6e;
	}

	for (uint32_t i = 0; i < 0x7; ++i) {
		printf("\tmovq\t$0x%0lx,%%rax\n", a[i]);
	}

	return 0;
}
