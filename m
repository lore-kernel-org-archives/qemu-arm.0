Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp1262577wrt;
        Sun, 17 Mar 2019 04:11:03 -0700 (PDT)
X-Received: by 2002:a0c:be81:: with SMTP id n1mr9206080qvi.226.1552821063756;
        Sun, 17 Mar 2019 04:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552821063; cv=none;
        d=google.com; s=arc-20160816;
        b=oWaM8pk9gIA0nLBWVuAynhFEH8OuqUuEzkxrECmsodHjBBaUetbSuz7mNwGdIgydac
         srR0Elt0kCI5deBwPsL4oisc5UdhtoMQPFiqV25QeHIbyvMNJFGa1Ry/NfkvD+VpMSUS
         EVx90X+OQcBvb/pH8RFyaIFimFMIc+J4tWBWgBn1PZsDs7umKA3OuNS4MgQmmyhmoHO2
         82rmouSHifNqUXr/zQzuu2HuFh81olxzIEWEnE6Ye8gPxjiiQdZNt8AcxlcJaIrGGdvj
         IgVMHWz8USbKY9V8dzL/gFiHY30N1C03VghUGFclxTmAPZpxyCrgrzGEu0OMsJZXK8fK
         lN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IVi6byz+uviuXaPeVKBbGsi7q/NdMyYPPFbxbbb8b58=;
        b=hvAJNNEVuE5RWFaNNopMuhQlZ/PI9ZgDrthOTAVVXCnL4qL/ABrb6tiOgfmq3e1ee+
         ZktzBUEZ4WBwX/CGLCKjChtNyvRcSx4lW8JQpOSLgH852J1jx/xgPCuodTSxLpTMIlRw
         uIBMJ9erVfWNgIM5YJO2LPitlA8ML6U+9PgqMXS+Bqmtj691zuXc6isHSf8waaFM182m
         iufq2nVDHETYlm8M7x88iqx+5AtalvpZoh23+LJqd0As81R63iBIXqbb8bMep37D6Tka
         6AhZ5Ffkrw9M8e7CJ/J7XBUqzj/irWDQU4TBW+zWfLYHDAt2rXrNIXl1Fez3eTXJZyAT
         9AoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gyE1Dal1;
       spf=pass (google.com: domain of cialdi@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=cialdi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <cialdi@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s25sor6888029qts.34.2019.03.17.04.11.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 17 Mar 2019 04:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of cialdi@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gyE1Dal1;
       spf=pass (google.com: domain of cialdi@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=cialdi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IVi6byz+uviuXaPeVKBbGsi7q/NdMyYPPFbxbbb8b58=;
        b=gyE1Dal1ah/NhcK3dC4lfRO5JPbPGrDAC8RNBoIZRVMFrFCRbjOnNUVU5NuH4alrBR
         esIPzBAihZjJpTWh0sa9yz3Ql18ZsXgZMxc8GwghiEht3pBaa0JpDid6/eN4K6KPsrVG
         uM2GNQN6357L0uu8dHf2At2V2EspfgL8fbowxuxbTlWsXNJvd2yZaJS7nB+fu9dZEFas
         ZD5tRIBwOVyC/5imptOt11bvPetttKn2HKzv7Sp0FWBFC2agVATPGgSMdu/BpS0XJ4H1
         UQPdp1VqBN+E3er67bqARFeAdYudybQVhHAgVUyIvjd1XwLvzrL0IcSrZR9cZdQnIrfB
         hODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IVi6byz+uviuXaPeVKBbGsi7q/NdMyYPPFbxbbb8b58=;
        b=QJeDaK+cpS8jV404azpdgGNUEd6cH3E2mvyXKPgaPvX+JFhVZb86qXNjqEvN4GbvJ1
         Ij6t0tBLC9qe6+/+KThvU5pCeA9dTSvCMcqCE8+TSiVkS53tC+MK3rHEvlpXOK7sHdbF
         ypQQRw+SwCS5h9z8nA0scCZsWB9qtroyl04eghRAoS9vC/KykiXTa08LA9xC/wMJiOrK
         1lWMj/CmyIknpW8SWTLJlASD6D8nybBdHGkdMOqnc4sAgeenKKfWCp2453UsU9tY79Yy
         /Y1L7aLKVCsF6rUbOcEAdnLsre5/W/uSHuA0IVpMzgrAliQvr/3KbE4Ahug0QyGGCnsh
         SooQ==
X-Gm-Message-State: APjAAAU7EbIqrCr4oTOHw9z8w8jDd9xS5lTWQg2cipm4s3Hn6KYenywz
	xWp4dA+yZ6e9Rb4RC0jqi+ENW3046pT75qVmDO4oEO6wP40=
X-Google-Smtp-Source: APXvYqw7y9SgdauOvzLAqr5VfNk6fUbuHeOVoDzI9K1xdXnQkG2+mw7ftp3GXaGjh5PgEuC16jX7FRbyfYcKl52nQv0=
X-Received: by 2002:ac8:267c:: with SMTP id v57mr9633305qtv.76.1552821063079;
 Sun, 17 Mar 2019 04:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <CABgYhWf=unSbmTksO+gkUuX+UL3g8HvEuDAeDdxBQVbzci05DQ@mail.gmail.com>
 <CAFEAcA8xqO=iV9oJWWdPHhhDFRmAoegMpwUZQUszXLwG7zS=Hw@mail.gmail.com>
 <CABgYhWdu-H6zfWjwwtJbFK6TJa89tqERtX=djYpFobWjir_C6A@mail.gmail.com>
 <87sgvnt4d4.fsf@zen.linaroharston> <CABgYhWfre7FcfvRZ+gRQi9k_1S_CTBKvMix8zGQdOLK2c-vRNA@mail.gmail.com>
In-Reply-To: <CABgYhWfre7FcfvRZ+gRQi9k_1S_CTBKvMix8zGQdOLK2c-vRNA@mail.gmail.com>
From: Massimiliano Cialdi <cialdi@gmail.com>
Date: Sun, 17 Mar 2019 12:10:51 +0100
Message-ID: <CABgYhWd6wQqo9XdXWfJkwOjDp_otr8j9eoYp+UL2QofLaTA=Eg@mail.gmail.com>
Subject: Re: [Qemu-arm] QEMU user mode for cortex M
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2WRAALasCy1i

I did it.

File main.c:

--------8<------------------------
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    printf("Hallo ARM world!\n");
    exit(0);
}
--------8<------------------------

compiled with:
/opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc
-std=3Dgnu11 -mcpu=3Dcortex-m4 -mthumb  -fno-common -specs=3Drdimon.specs
-Wl,--cref,-Map=3Dmain.map  -O0 -g3 main.c -o main.elf

I run it with qemu user mode, and it works:
~/Downloads/qemu/qemu-3.1.0/arm-linux-user/qemu-arm -D prova.out -d
in_asm,cpu,nochain,unimp,guest_errors -cpu cortex-m4 main.elf
Hallo ARM world!


probably works by accident, but I have achieved my goal. Any comment?

best regards
Max


On Sat, Mar 16, 2019 at 9:34 PM Massimiliano Cialdi <cialdi@gmail.com> wrot=
e:
>
> On Sat, Mar 16, 2019 at 1:01 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >
> >
> > Massimiliano Cialdi <cialdi@gmail.com> writes:
> >
> > > I have my exetutable compiled with
> > > /opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc -std=3Dg=
nu11
> > > -mcpu=3Dcortex-m7 -mthumb -mfloat-abi=3Dhard -mfpu=3Dfpv5-d16 -fno-co=
mmon
> > > -specs=3Drdimon.specs -Wl,--cref,-Map=3Dmain.map main.c -o main.elf
> >
> > I thought you wanted to target a cortex-m4?
> yes.
> I tried to compile it like this.:
> /opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc
> -std=3Dgnu11 -mcpu=3Dcortex-m4 -mthumb  -fno-common -specs=3Drdimon.specs
> -Wl,--cref,-Map=3Dmain.map -T prova.ld -O0 -g3 main.c -o main.elf
> The linker script is attached
>
> I don't know how to compile with arm-linux-gnueabihf-gcc
>
> >
> > Have a look at how test-armv6m-undef is built. It is the simplest
> > dumbest M profile image you can build with a kernel that maps to 0 and =
a
> > simple reset vector at the start of the vector table:
> I don't want to have to deal with interrupt vectors and memory layouts.
> Just see "hallo world!" on the output.
>
>
>
> > I don't know what the virt machine defaults to for CPU but I'm fairly
> > sure it's not an m-profile CPU.
> I had only tried the machine none and virt... I didn't know which one
> to choose for cortex M4
>
>
> > It's hard to say without seeing what your test is doing. However I can =
force
> > a cortex-m4 on a microbit and run the following ok:
> >
> >   ./qemu-system-arm  -monitor none -display none \
> >                      -chardev file,path=3Dtest-armv6m-undef.out,id=3Dou=
tput \
> >                      -semihosting -M microbit \
> >                      -cpu cortex-m4 \
> >                      -kernel tests/test-armv6m-undef
> >                      -d in_asm,cpu,nochain
>
> tried with:
> ~/Downloads/qemu/qemu-3.1.0/arm-softmmu/qemu-system-arm -d
> in_asm,cpu,nochain,unimp,guest_errors -chardev
> file,path=3Dprova.out,id=3Doutput -machine microbit -cpu cortex-m4
> -monitor null -serial null  -semihosting -nographic
> -semihosting-config enable=3Don,target=3Dnative  -kernel main.elf
> ----------------
> IN:
> 0x00000000:  00000000  andeq    r0, r0, r0
>
> R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
> R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
> R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
> R12=3D00000000 R13=3D00000000 R14=3Dffffffff R15=3D00000000
> XPSR=3D40000000 -Z-- A priv-thread
> nrf51_soc.private: unimplemented device write (size 4, value 0x0,
> offset 0xfffffe0)
> nrf51_soc.private: unimplemented device write (size 4, value 0x0,
> offset 0xfffffe4)
> nrf51_soc.private: unimplemented device write (size 4, value 0x0,
> offset 0xfffffe8)
> nrf51_soc.private: unimplemented device write (size 4, value 0x0,
> offset 0xfffffec)
> nrf51_soc.private: unimplemented device write (size 4, value 0x0,
> offset 0xffffff0)
> nrf51_soc.private: unimplemented device write (size 4, value
> 0xffffffff, offset 0xffffff4)
> nrf51_soc.private: unimplemented device write (size 4, value 0x0,
> offset 0xffffff8)
> nrf51_soc.private: unimplemented device write (size 4, value
> 0x40000000, offset 0xffffffc)
> ----------------
> IN:
> 0x00000000:  00000000  andeq    r0, r0, r0
>
> R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
> R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
> R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
> R12=3D00000000 R13=3Dffffffe0 R14=3Dfffffff9 R15=3D00000000
> XPSR=3D40000003 -Z-- A handler
> qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)
>
> R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
> R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
> R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
> R12=3D00000000 R13=3Dffffffe0 R14=3Dfffffff9 R15=3D00000000
> XPSR=3D40000003 -Z-- A handler
> FPSCR: 00000000
> Aborted (core dumped)
>
>
> still no success
>
> best regards
> Max
>
>
> --
> Et nunc, auxilium solis, vincam!
> Oppugnatio solaris!
> VIS!
>
> Massimiliano Cialdi
> cialdi@gmail.com



--=20
Et nunc, auxilium solis, vincam!
Oppugnatio solaris!
VIS!

Massimiliano Cialdi
cialdi@gmail.com
