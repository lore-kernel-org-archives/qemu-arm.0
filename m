Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3297708wru;
        Fri, 5 Jul 2019 08:39:35 -0700 (PDT)
X-Received: by 2002:aca:4d8:: with SMTP id 207mr2472452oie.88.1562341175721;
        Fri, 05 Jul 2019 08:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562341175; cv=none;
        d=google.com; s=arc-20160816;
        b=y527NwkMO6hEuiMTerm2a4XwnmGQBuMiWEZuqKksQHop9i74YqsMjlbvlFqbja7kBC
         FZzJlbEkjed2Ixc9NTwZ7Q4Su78Q5LaBgQAR4TRXNuq+2YIcaRwUjVOH1G0Vfu1kdtp1
         z8Jot1Q3rvHs/16H+AAWSNvdot/PGjA7Oz10sbm2yq7SC/a/VZuvJVNoHNHbE3HHrUpm
         rN6iAHmtofsZY271758X7HKrlIASNhowVHQkUNVErDqhTMXrOowM5f1AbLe7SUZpZaKK
         jlfV22hGDhF4dyW3QhJ6IF3QNNb1vJ3vCgmpd4U3cYZ7HX6ieLiBMd19r0YiEMzSrN5s
         WxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=shKJw3qDIYwJGnYjocaoDrWEDEOtUhuu1wOY5zKgLQQ=;
        b=0Vj5jhHvyM1CrNiv+p2Fey5zE+qOhuxRD/2PUoVLAWsyPeF8az8byePOxF6Qc31cwQ
         AVjiADw51WU5oZCBiUJ+uF5adA2at8pwPld7UV09RKVPyqDiv3NibF0K/NyWDHs895Ab
         8/j4GT6oqNFNr84PHl0LJ0OLi7lPb9ZqCKR0Eq3BnvluIasUXxx53LV/keCs3gZ1nm70
         z9WrNx+KHt/+jXK/9SNV9kTM4k42xUdcpHyz0Xkjx6LXxri+3O/yTWHiIU/EywbSxpqO
         tuRxzv55pzxqlKNylZBVD7IGuKVXOW4zWsJEYElk/hYiDq43reMdT8Ehst3IPh+ypKTv
         Utuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/QL6bqw";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q25sor4892543otl.168.2019.07.05.08.39.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2019 08:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/QL6bqw";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=shKJw3qDIYwJGnYjocaoDrWEDEOtUhuu1wOY5zKgLQQ=;
        b=A/QL6bqw42DGjP4UUDLfCdELiebjscYeQ2EfwFOYnVGqVa1R0E4SVlKwHraT/gkEtt
         PMxVeC06c+UGC23Vz4TgcEoN+PizmQmtIG0vANIAj8pJn8cBB0KHGO7aA+KX+zf32eVb
         74cIGki+zooo7XPR8JSHrlt3YzBvHLNjs9X98LyuSnzTXM+3pzmnIhyRevAGoOs7egXk
         sQVrbLgty5yzN+Dpwo/KCvPHjcVd5AJRTsb1uLPBnKr40oI60bGjFDIdH6WQRnxItUgD
         BBIZ7NeUSdf4yYiNOESYXKCsHLWjj8GQYp6O1pzVOT6EPhs6E57Dw71CHaBdZ+UG2/5j
         mNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=shKJw3qDIYwJGnYjocaoDrWEDEOtUhuu1wOY5zKgLQQ=;
        b=j/hL+YM/oP4tWiVd1bSGudO5mzrZuFOaICSpfewxv4ul3g4OmwQza/gusMLKiZ5RIo
         99gYIj0Y4JH4Zv4/xH+bYia1CEUNermL9Ib8pY/YnKFB+D2k1mgkWOpqLPDL1KI2xdQc
         asZrNDqoTmqgZAdjwN1C/wqVJpobrSNWipmpxg+UJ4m5NXiniGcox96rKlXjZ0qBTCJK
         e1K/cCKE97xk10oa9IAbf+kbFB8ovLQh+bU4qojhjfivKs44uVBrUm/1X11x6rAROwz+
         egm/hPDJCracaqmuMjp8jPh1cYrVmhJs/5pj+RQ3QqprHeGjnz7zqnbimVJwFl2OuqMl
         Z2zA==
X-Gm-Message-State: APjAAAWKD9CSlIPu3hTbrZVsMCN6u51LVrFPek5OL1tlsgRrVQCYQ9NZ
	is+gpq4WjcYCoEQ8MvICYzBUkZ+nlErE4e3MbrLK9zi3YRzN7A==
X-Google-Smtp-Source: APXvYqwektAab60un/FkTo/LkVBkKmy78E+owFvv8Y52TDYqY1J4S8v3RYX2r8viGqP1EK6voKqPWTec+TBb9XDRWn8=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr1936871otk.232.1562341175087;
 Fri, 05 Jul 2019 08:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190703102208.10086-1-alex.bennee@linaro.org>
In-Reply-To: <20190703102208.10086-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jul 2019 16:39:24 +0100
Message-ID: <CAFEAcA-rT3B-1GvFY55Ete1cm8f+38AGFyzDcJxQsqM1c=D4sQ@mail.gmail.com>
Subject: Re: [RFC PATCH for semihosting-tests] semihosting tests: add v7m tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 1CLd5rqIDZJq

On Wed, 3 Jul 2019 at 11:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> M-profile has yet another way of triggering semihosting calls using
> the BKPT instruction. To support this we need to add a M-profile setup
> so we use the nice and simple microbit model which has a Cortex-M0 in
> it.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  Makefile         | 24 ++++++++++++++++++++---
>  microbit.lds     | 32 ++++++++++++++++++++++++++++++
>  semicall.S       |  7 ++++++-
>  start-microbit.S | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 110 insertions(+), 4 deletions(-)
>  create mode 100644 microbit.lds
>  create mode 100644 start-microbit.S

Good to have this semihosting mode in the test suite, thanks.

> diff --git a/Makefile b/Makefile
> index 1fea97e..9f04cdd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -40,6 +40,7 @@
>
>  A32GCC :=3D arm-linux-gnueabihf-gcc -marm
>  T32GCC :=3D arm-linux-gnueabihf-gcc -mthumb
> +V7MGCC :=3D arm-none-eabi-gcc -mcpu=3Dcortex-m0 -mfloat-abi=3Dsoft
>  A64GCC :=3D aarch64-linux-gnu-gcc
>
>  A32LD :=3D arm-linux-gnueabihf-ld
> @@ -47,7 +48,9 @@ A32LD :=3D arm-linux-gnueabihf-ld
>  A32LINKOPTS :=3D -nostdlib -lgcc -Xlinker --script=3Dbaremetal.lds -Xlin=
ker --build-id=3Dnone
>  A64LINKOPTS :=3D -nostdlib -lgcc -Xlinker --script=3Dbaremetal-a64.lds -=
Xlinker --build-id=3Dnone
>
> -QEMU_BUILDDIR :=3D ~/linaro/qemu-from-laptop/qemu/build/x86
> +AV7MLINKOPTS :=3D -nostdlib -lgcc -Xlinker --script=3Dmicrobit.lds -Xlin=
ker --build-id=3Dnone
> +
> +QEMU_BUILDDIR :=3D ~/lsrc/qemu.git/builds/arm.all

My local devel hack for this is obviously more important
to have in the git repo than yours :-)

>  ifdef GDBPORT
>  SYSGDB :=3D -gdb tcp::$(GDBPORT)
> @@ -60,11 +63,15 @@ QEMU_SYSTEM_ARM =3D $(QEMU_BUILDDIR)/arm-softmmu/qemu=
-system-arm $(SYSGDB)
>  QEMU_SYSTEM_AARCH64 =3D $(QEMU_BUILDDIR)/aarch64-softmmu/qemu-system-aar=
ch64 $(SYSGDB)
>
>  all: usertest-a32 usertest-a64 usertest-t32 \
> -       systest-a32.axf systest-t32.axf systest-a64.axf
> +       systest-a32.axf systest-t32.axf \
> +       systest-a32-hlt.axf systest-t32-hlt.axf \
> +       systest-t32-bkpt.axf \
> +       systest-a64.axf

(The omission of the -hlt axfs from this target is a separate
bug, strictly speaking, but I don't think we need to be too picky
about this kind of thing given this is just a test suite.)

>  usertest-srcs =3D usertest.c semihosting.c semicall.S printf/printf.c
>
>  systest-srcs =3D start.S string.c $(usertest-srcs)
> +microbit-systest-srcs =3D start-microbit.S string.c $(usertest-srcs)
>
>  usertest-a32: $(usertest-srcs)
>         $(A32GCC) --static -o $@ $^
> @@ -93,6 +100,9 @@ systest-a32-hlt.axf: $(systest-srcs)
>  systest-t32-hlt.axf: $(systest-srcs)
>         $(T32GCC) -DUSE_HLT -o $@ $^ $(A32LINKOPTS)
>
> +systest-t32-bkpt.axf: $(microbit-systest-srcs)
> +       $(V7MGCC) -DUSE_BKPT -o $@ $^ $(AV7MLINKOPTS)
> +
>  systest-a64.axf: $(systest-srcs)
>         $(A64GCC) -nostdlib -o $@ $^ $(A64LINKOPTS)
>
> @@ -123,6 +133,9 @@ run-systest-a32-hlt: systest-a32-hlt.axf
>  run-systest-t32-hlt: systest-t32-hlt.axf
>         $(QEMU_SYSTEM_ARM) -M virt --display none --semihosting -kernel $=
^
>
> +run-systest-t32-bkpt: systest-t32-bkpt.axf
> +       $(QEMU_SYSTEM_ARM) -M microbit --display none --semihosting -kern=
el $^
> +
>  run-systest-a64: systest-a64.axf
>         $(QEMU_SYSTEM_AARCH64) -M virt --display none --semihosting \
>                 -cpu cortex-a57 -kernel $^
> @@ -130,4 +143,9 @@ run-systest-a64: systest-a64.axf
>  run: run-usertest-a32 run-usertest-t32 run-usertest-a64 \
>         run-systest-a32 run-systest-t32 run-systest-a64 \
>         run-usertest-a32-hlt run-usertest-t32-hlt \
> -       run-systest-a32-hlt run-systest-t32-hlt
> +       run-systest-a32-hlt run-systest-t32-hlt \
> +       run-systest-t32-bkpt
> +
> +run-alt: run-usertest-a32 run-usertest-t32 run-usertest-a64 \
> +       run-systest-a64 \
> +       run-usertest-a32-hlt run-usertest-t32-hlt \

What's this target for, and why does it end the makefile with a '\' ?

> diff --git a/microbit.lds b/microbit.lds
> new file mode 100644
> index 0000000..24840a3
> --- /dev/null
> +++ b/microbit.lds
> @@ -0,0 +1,32 @@
> +/*
> + * microbit.lds : simple linker script for baremetal ARM-M test cases
> + *
> + * Copyright (C) 2019 Linaro Limited. All rights reserved.
> + *
> + * Memory layout is for the BBC Microbit board which puts RAM at 0x20000=
000
> + */

I know this is just copied from the baremetal.lds, but we
really should have a license statement in every source file
(and I should fix the ones which don't have a license at the moment).

> +
> +RAMSTART =3D 0x20000000;
> +STACKTOP =3D 0x20004000;

That puts stacktop really close to the start of the heap --
isn't there more space to give ourselves some safety margin?

> +
> +ENTRY(exc_reset_thumb)
> +
> +SECTIONS
> +{
> +    . =3D 0x0;
> +    .text : {
> +        *(.text)
> +    }
> +    .data : {
> +        *(.data)
> +    }
> +    .rodata : {
> +        *(.rodata)
> +    }
> +    .bss : {
> +        *(.bss)
> +    }
> +    /DISCARD/ : {
> +        *(.ARM.attributes)
> +    }
> +}
> diff --git a/semicall.S b/semicall.S
> index 1418a42..e6316c4 100644
> --- a/semicall.S
> +++ b/semicall.S
> @@ -51,8 +51,13 @@ __semi_call:
>  #else
>          /* traditional svc */
>  #if defined(__thumb__)
> -        /* NB: assumes not M-profile (which is BKPT) */
> +#if defined(USE_BKPT)
> +        /* M-profile T32 */
> +        bkpt 0xab
> +#else
> +        /* A+R Profile T32 */
>          svc 0xab
> +#endif
>  #else
>          svc 0x123456
>  #endif
> diff --git a/start-microbit.S b/start-microbit.S
> new file mode 100644
> index 0000000..db1f06e
> --- /dev/null
> +++ b/start-microbit.S
> @@ -0,0 +1,51 @@
> +/*
> + * start-microbit.S - assembly code for startup on baremetal M-profile t=
ests
> + *
> + * Copyright (c) 2015 Linaro Limited
> + * All rights reserved.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in
> + *    the documentation and/or other materials provided with the
> + *    distribution.
> + * 3. Neither the name of Linaro Limited nor the names of its
> + *    contributors may be used to endorse or promote products derived
> + *    from this software without specific prior written permission.
> + */
> +
> +        .syntax unified
> +        .cpu cortex-m0
> +        .thumb
> +
> +        .text
> +
> +vector_table:
> +        .word STACKTOP          /* 0. SP_main */
> +        .word exc_reset_thumb   /* 1. Reset */
> +        .word 0                 /* 2. NMI */
> +        .word 0                 /* 3. HardFault */
> +        .rept 7
> +        .word 0                 /* 4-10. Reserved */
> +        .endr
> +        .word 0                 /* 11. SVCall */
> +        .word 0                 /* 12. Reserved */
> +        .word 0                 /* 13. Reserved */
> +        .word 0                 /* 14. PendSV */
> +        .word 0                 /* 15. SysTick */
> +        .rept 32
> +        .word 0                 /* 16-47. External Interrupts */
> +        .endr
> +
> +exc_reset:
> +.equ exc_reset_thumb, exc_reset + 1
> +.global exc_reset_thumb

There must be a better way than this to declare an asm label
for a thumb entrypoint...

> +
> +        bl main
> +        bl semi_exit
> +        # not reached
> +1:      b 1b
> --

thanks
-- PMM
