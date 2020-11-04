Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a128sm3209068wmf.5.2020.11.04.09.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 09:44:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9B54B1FF7E;
	Wed,  4 Nov 2020 17:44:22 +0000 (GMT)
References: <CAMj1kXFDWJOt+m-nC8CdQ4WeAZmUkaB33fTiSz8TSczfu1c7Fw@mail.gmail.com>
 <87v9elax60.fsf@linaro.org>
 <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: regression in TCG emulation of VTBL neon instruction
In-reply-to: <CAMj1kXEOaHe4QvCbv8L+DKoRt=xX4UpUt8ef0o1OuK8aO6h3Jg@mail.gmail.com>
Date: Wed, 04 Nov 2020 17:44:22 +0000
Message-ID: <87pn4taufd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +N2OPLlWYGgY


Ard Biesheuvel <ardb@kernel.org> writes:

> On Wed, 4 Nov 2020 at 17:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Ard Biesheuvel <ardb@kernel.org> writes:
>>
>> > Hello all,
>> >
>> > I spotted an issue with the TCG emulation of VTBL instructions in 32-b=
it mode.
>> >
>> > It seems that when using the 4 register version, indexes in the range
>> > [0x10 .. 0x1f] are not handled correctly, and I end up with all zero
>> > vectors in the output.
>> >
>> > For example, I am optimizing Linux's NEON ChaCha20 implementation to
>> > use overlapping loads and stores, and this requires the final cipher
>> > stream block to be shifted accordingly, using a sequence such as
>> >
>> > vtbl.8 d4, {q4-q5}, d4
>> > vtbl.8 d5, {q4-q5}, d5
>> > vtbl.8 d6, {q4-q5}, d6
>> > vtbl.8 d7, {q4-q5}, d7
>> >
>> > where q4-q5 contain 32 bytes of cipher stream, and d4-d7 contain a set
>> > of permutation vectors, where each value is in the range [0x0, 0x1f].
>> >
>> > The above works fine with older QEMU and KVM, but with recent QEMU,
>> > this fails, seemingly because d6 and d7 always turn up as all zeros.
>> >
>> > This can be reproduced by running the zImage I prepared [0] as follows:
>> >
>> > qemu-system-aarch64 -M virt -cpu cortex-a15 -m 2048 -net none
>> > -nographic -kernel arch/arm/boot/zImage
>> >
>> > and it will print the following (somewhere halfway down the kernel
>> > log) on the affected builds of QEMU:
>> >
>> > alg: skcipher: chacha20-neon encryption test failed (wrong result) on
>> > test vector 1, cfg=3D"in-place"
>> > alg: skcipher: xchacha20-neon encryption test failed (wrong result) on
>> > test vector 1, cfg=3D"in-place"
>> > alg: skcipher: xchacha12-neon encryption test failed (wrong result) on
>> > test vector 1, cfg=3D"in-place"
>>
>> I get:
>>
>> [    8.974879] testing speed of sync chacha20 (chacha20-neon) encryption
>> [    8.975230] tcrypt: test 0 (256 bit key, 16 byte blocks): 351309 oper=
ations in 1 seconds (5620944 bytes)
>> [    9.967242] tcrypt: test 1 (256 bit key, 64 byte blocks): 383886 oper=
ations in 1 seconds (24568704 bytes)
>> [   10.967103] tcrypt: test 2 (256 bit key, 256 byte blocks): 109213 ope=
rations in 1 seconds (27958528 bytes)
>> [   11.967164] tcrypt: test 3 (256 bit key, 1024 byte blocks): 29061 ope=
rations in 1 seconds (29758464 bytes)
>> [   12.967165] tcrypt: test 4 (256 bit key, 1420 byte blocks): 19577 ope=
rations in 1 seconds (27799340 bytes)
>> [   13.967147] tcrypt: test 5 (256 bit key, 4096 byte blocks): 7217 oper=
ations in 1 seconds (29560832 bytes)
>> [   14.972354] input: gpio-keys as /devices/platform/gpio-keys/input/inp=
ut0
>> [   14.977272] uart-pl011 9000000.pl011: no DMA platform data
>> [   14.980208] VFS: Cannot open root device "(null)" or unknown-block(0,=
0): error -6
>> [   14.980431] Please append a correct "root=3D" boot option; here are t=
he available partitions:
>>
>> I wonder if it was a transient bug when stuff was converted to
>> decodetree and got fixed up later? Tested on HEAD @ 4c5b97bfd and @
>> e46912b66.
>>
>
> I am seeing the issue on 700d20b49e303549 *and* on e46912b66f50b2d8,
> after a clean rebuild.

Just checking - what host are you on?

--=20
Alex Benn=C3=A9e
