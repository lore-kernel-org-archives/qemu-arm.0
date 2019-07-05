Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p11sm10635504wrm.53.2019.07.05.08.56.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 08:56:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 33DCC1FF87;
	Fri,  5 Jul 2019 16:56:12 +0100 (BST)
References: <20190703102208.10086-1-alex.bennee@linaro.org> <CAFEAcA-rT3B-1GvFY55Ete1cm8f+38AGFyzDcJxQsqM1c=D4sQ@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH for semihosting-tests] semihosting tests: add v7m tests
In-reply-to: <CAFEAcA-rT3B-1GvFY55Ete1cm8f+38AGFyzDcJxQsqM1c=D4sQ@mail.gmail.com>
Date: Fri, 05 Jul 2019 16:56:12 +0100
Message-ID: <87sgrkv5k3.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wN7rm3KnKXwS


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 3 Jul 2019 at 11:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> M-profile has yet another way of triggering semihosting calls using
>> the BKPT instruction. To support this we need to add a M-profile setup
>> so we use the nice and simple microbit model which has a Cortex-M0 in
>> it.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  Makefile         | 24 ++++++++++++++++++++---
>>  microbit.lds     | 32 ++++++++++++++++++++++++++++++
>>  semicall.S       |  7 ++++++-
>>  start-microbit.S | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 110 insertions(+), 4 deletions(-)
>>  create mode 100644 microbit.lds
>>  create mode 100644 start-microbit.S
>
> Good to have this semihosting mode in the test suite, thanks.
>
>> diff --git a/Makefile b/Makefile
>> index 1fea97e..9f04cdd 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -40,6 +40,7 @@
>>
>>  A32GCC :=3D arm-linux-gnueabihf-gcc -marm
>>  T32GCC :=3D arm-linux-gnueabihf-gcc -mthumb
>> +V7MGCC :=3D arm-none-eabi-gcc -mcpu=3Dcortex-m0 -mfloat-abi=3Dsoft
>>  A64GCC :=3D aarch64-linux-gnu-gcc
>>
>>  A32LD :=3D arm-linux-gnueabihf-ld
>> @@ -47,7 +48,9 @@ A32LD :=3D arm-linux-gnueabihf-ld
>>  A32LINKOPTS :=3D -nostdlib -lgcc -Xlinker --script=3Dbaremetal.lds -Xli=
nker --build-id=3Dnone
>>  A64LINKOPTS :=3D -nostdlib -lgcc -Xlinker --script=3Dbaremetal-a64.lds =
-Xlinker --build-id=3Dnone
>>
>> -QEMU_BUILDDIR :=3D ~/linaro/qemu-from-laptop/qemu/build/x86
>> +AV7MLINKOPTS :=3D -nostdlib -lgcc -Xlinker --script=3Dmicrobit.lds -Xli=
nker --build-id=3Dnone
>> +
>> +QEMU_BUILDDIR :=3D ~/lsrc/qemu.git/builds/arm.all
>
> My local devel hack for this is obviously more important
> to have in the git repo than yours :-)
>
>>  ifdef GDBPORT
>>  SYSGDB :=3D -gdb tcp::$(GDBPORT)
>> @@ -60,11 +63,15 @@ QEMU_SYSTEM_ARM =3D $(QEMU_BUILDDIR)/arm-softmmu/qem=
u-system-arm $(SYSGDB)
>>  QEMU_SYSTEM_AARCH64 =3D $(QEMU_BUILDDIR)/aarch64-softmmu/qemu-system-aa=
rch64 $(SYSGDB)
>>
>>  all: usertest-a32 usertest-a64 usertest-t32 \
>> -       systest-a32.axf systest-t32.axf systest-a64.axf
>> +       systest-a32.axf systest-t32.axf \
>> +       systest-a32-hlt.axf systest-t32-hlt.axf \
>> +       systest-t32-bkpt.axf \
>> +       systest-a64.axf
>
> (The omission of the -hlt axfs from this target is a separate
> bug, strictly speaking, but I don't think we need to be too picky
> about this kind of thing given this is just a test suite.)
>
>>  usertest-srcs =3D usertest.c semihosting.c semicall.S printf/printf.c
>>
>>  systest-srcs =3D start.S string.c $(usertest-srcs)
>> +microbit-systest-srcs =3D start-microbit.S string.c $(usertest-srcs)
>>
>>  usertest-a32: $(usertest-srcs)
>>         $(A32GCC) --static -o $@ $^
>> @@ -93,6 +100,9 @@ systest-a32-hlt.axf: $(systest-srcs)
>>  systest-t32-hlt.axf: $(systest-srcs)
>>         $(T32GCC) -DUSE_HLT -o $@ $^ $(A32LINKOPTS)
>>
>> +systest-t32-bkpt.axf: $(microbit-systest-srcs)
>> +       $(V7MGCC) -DUSE_BKPT -o $@ $^ $(AV7MLINKOPTS)
>> +
>>  systest-a64.axf: $(systest-srcs)
>>         $(A64GCC) -nostdlib -o $@ $^ $(A64LINKOPTS)
>>
>> @@ -123,6 +133,9 @@ run-systest-a32-hlt: systest-a32-hlt.axf
>>  run-systest-t32-hlt: systest-t32-hlt.axf
>>         $(QEMU_SYSTEM_ARM) -M virt --display none --semihosting -kernel =
$^
>>
>> +run-systest-t32-bkpt: systest-t32-bkpt.axf
>> +       $(QEMU_SYSTEM_ARM) -M microbit --display none --semihosting -ker=
nel $^
>> +
>>  run-systest-a64: systest-a64.axf
>>         $(QEMU_SYSTEM_AARCH64) -M virt --display none --semihosting \
>>                 -cpu cortex-a57 -kernel $^
>> @@ -130,4 +143,9 @@ run-systest-a64: systest-a64.axf
>>  run: run-usertest-a32 run-usertest-t32 run-usertest-a64 \
>>         run-systest-a32 run-systest-t32 run-systest-a64 \
>>         run-usertest-a32-hlt run-usertest-t32-hlt \
>> -       run-systest-a32-hlt run-systest-t32-hlt
>> +       run-systest-a32-hlt run-systest-t32-hlt \
>> +       run-systest-t32-bkpt
>> +
>> +run-alt: run-usertest-a32 run-usertest-t32 run-usertest-a64 \
>> +       run-systest-a64 \
>> +       run-usertest-a32-hlt run-usertest-t32-hlt \
>
> What's this target for, and why does it end the makefile with a '\' ?

Ignore that - it was a alternative run while I was working around the
tests that wouldn't build.

>
>> diff --git a/microbit.lds b/microbit.lds
>> new file mode 100644
>> index 0000000..24840a3
>> --- /dev/null
>> +++ b/microbit.lds
>> @@ -0,0 +1,32 @@
>> +/*
>> + * microbit.lds : simple linker script for baremetal ARM-M test cases
>> + *
>> + * Copyright (C) 2019 Linaro Limited. All rights reserved.
>> + *
>> + * Memory layout is for the BBC Microbit board which puts RAM at 0x2000=
0000
>> + */
>
> I know this is just copied from the baremetal.lds, but we
> really should have a license statement in every source file
> (and I should fix the ones which don't have a license at the moment).
>
>> +
>> +RAMSTART =3D 0x20000000;
>> +STACKTOP =3D 0x20004000;
>
> That puts stacktop really close to the start of the heap --
> isn't there more space to give ourselves some safety margin?

We could - do we actually use any heap in this - I thought it was all
static .data?

>
>> +
>> +ENTRY(exc_reset_thumb)
>> +
>> +SECTIONS
>> +{
>> +    . =3D 0x0;
>> +    .text : {
>> +        *(.text)
>> +    }
>> +    .data : {
>> +        *(.data)
>> +    }
>> +    .rodata : {
>> +        *(.rodata)
>> +    }
>> +    .bss : {
>> +        *(.bss)
>> +    }

I wonder if there are runes for setting STACKTOP as end of .bss +
something? I guess it would help if we could tell the linker what the
top of microbit memory was.

>> +    /DISCARD/ : {
>> +        *(.ARM.attributes)
>> +    }
>> +}
>> diff --git a/semicall.S b/semicall.S
>> index 1418a42..e6316c4 100644
>> --- a/semicall.S
>> +++ b/semicall.S
>> @@ -51,8 +51,13 @@ __semi_call:
>>  #else
>>          /* traditional svc */
>>  #if defined(__thumb__)
>> -        /* NB: assumes not M-profile (which is BKPT) */
>> +#if defined(USE_BKPT)
>> +        /* M-profile T32 */
>> +        bkpt 0xab
>> +#else
>> +        /* A+R Profile T32 */
>>          svc 0xab
>> +#endif
>>  #else
>>          svc 0x123456
>>  #endif
>> diff --git a/start-microbit.S b/start-microbit.S
>> new file mode 100644
>> index 0000000..db1f06e
>> --- /dev/null
>> +++ b/start-microbit.S
>> @@ -0,0 +1,51 @@
>> +/*
>> + * start-microbit.S - assembly code for startup on baremetal M-profile =
tests
>> + *
>> + * Copyright (c) 2015 Linaro Limited
>> + * All rights reserved.
>> + *
>> + * Redistribution and use in source and binary forms, with or without
>> + * modification, are permitted provided that the following conditions
>> + * are met:
>> + * 1. Redistributions of source code must retain the above copyright
>> + *    notice, this list of conditions and the following disclaimer.
>> + * 2. Redistributions in binary form must reproduce the above copyright
>> + *    notice, this list of conditions and the following disclaimer in
>> + *    the documentation and/or other materials provided with the
>> + *    distribution.
>> + * 3. Neither the name of Linaro Limited nor the names of its
>> + *    contributors may be used to endorse or promote products derived
>> + *    from this software without specific prior written permission.
>> + */
>> +
>> +        .syntax unified
>> +        .cpu cortex-m0
>> +        .thumb
>> +
>> +        .text
>> +
>> +vector_table:
>> +        .word STACKTOP          /* 0. SP_main */
>> +        .word exc_reset_thumb   /* 1. Reset */
>> +        .word 0                 /* 2. NMI */
>> +        .word 0                 /* 3. HardFault */
>> +        .rept 7
>> +        .word 0                 /* 4-10. Reserved */
>> +        .endr
>> +        .word 0                 /* 11. SVCall */
>> +        .word 0                 /* 12. Reserved */
>> +        .word 0                 /* 13. Reserved */
>> +        .word 0                 /* 14. PendSV */
>> +        .word 0                 /* 15. SysTick */
>> +        .rept 32
>> +        .word 0                 /* 16-47. External Interrupts */
>> +        .endr
>> +
>> +exc_reset:
>> +.equ exc_reset_thumb, exc_reset + 1
>> +.global exc_reset_thumb
>
> There must be a better way than this to declare an asm label
> for a thumb entrypoint...

That may not be needed any more - I'll drop it and see.

>
>> +
>> +        bl main
>> +        bl semi_exit
>> +        # not reached
>> +1:      b 1b
>> --
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
