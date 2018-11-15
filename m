Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7205556wrw;
        Thu, 15 Nov 2018 08:21:20 -0800 (PST)
X-Received: by 2002:aca:3cc5:: with SMTP id j188-v6mr3745350oia.203.1542298880320;
        Thu, 15 Nov 2018 08:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542298880; cv=none;
        d=google.com; s=arc-20160816;
        b=NpehpzM+gI5tuUHDt5hZcMz4BVXA6+mnB/vLgL+eNTtlSYYjVWtuiPdU99JwmlJG9W
         3njaJFiQ9+iCkvbo58NZ1gr1XxgrjdMz6VTVY546yzGACY1Wnc+LAqdM0u+vBG+qdn4C
         MyXVIc9l9jGi1Ps50S6kxPMp9+kwRb6LI/Ni/QiapEwS3LwtHVG49+9p/bDgitH+1hQU
         /scUq/J4EFyk0amwiTkp/gkF2XwQLZNSoAyc1Y64wd96+JLhHDA9O1sMy2++9BxcTIRg
         rnFpv9/k6iT7gNPOrAWyFg7W/R02JGmCg4cBz3z5T10UlkoCgvRfXBnE4X+Z60VoR3HG
         Tv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=VJBJEtuSUqasp3pvJQO4inBeMZQlpVSY2J9TQ1ncVk0=;
        b=00FtxM5WiJviGOALEaMVtlWeQXN2gfFe1VZ4barewKqyTjv0q+Mogu7rvrfpghyRUS
         d3jxy15/uE5YOggVbl96ZZ5XYOKE4LpuRWX92dyPKnTXn6BUmhogGvKJB+tIpunVMeLV
         8wEMqeJYt+55hO8YaiwxkNXr2NYrHn9hCE7II0yZKv4oHQbsCCFrG1QxG1bLEtxdcI1i
         Vwj52fXzYjJAqFv6vgIORbosIIt3P5fMGxqcDzkm6vi3mtjUnsFD9VqOFY81jjKDE3Xv
         AMgX+8Fy7KPqzQ93szFObeTRlH7apwXuH7LfBKeffVkypc6PtRkN3qJTxOeDp7fzdZjD
         BphA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TlYG8ltO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o107sor14323477ota.140.2018.11.15.08.21.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Nov 2018 08:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TlYG8ltO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VJBJEtuSUqasp3pvJQO4inBeMZQlpVSY2J9TQ1ncVk0=;
        b=TlYG8ltOslkrxayGxzqflBAm6DworzQcYqZB7cbkXzIJL7wlF0xR7NR6SBNkI0pnjZ
         YqSFZhXkCjrZrW5vh1CYUJxAyIVowF82gjJQAGYPMDpINsSssKNzXUqVA05fLygXrHsA
         ZZbO7/p3P2DpFe10n1RL/lmbyFeYZ8MO5hQi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VJBJEtuSUqasp3pvJQO4inBeMZQlpVSY2J9TQ1ncVk0=;
        b=GpgbvsgpKDrqLDrAKS1LqRq6kVDGPb5AgfkPfe8EXVx6cpwmBUvebQmPUWZyb17vsv
         dhu1hi7BxBXaTILN8GEByDgQfqQ+wMNsWuCDJBT7QtRAOGNAAcS78LgJ2ah4c0f6gjGp
         VqEGqrP073AUBNsmz/Pw4MF7yaurD6/sHZ2Qzg/vjG8+nj127PyhA7YhEyeYNGANtW0M
         /Efe8/TiSNZfza9A5BuWGD5AAqQ7/SQQbGkGro7HbPcOmv6yTXkXjWCcZ5wYikg+KyV9
         ld9asvK5/n2RqU7Kuqc9gih7/GFP16FAYZGOx37OLjh6anhEPlizyX6JYj/IHt8U5bss
         /pzQ==
X-Gm-Message-State: AGRZ1gLIchfK+PYj5rngE/lbOrmJINnKY7PRCoOSeqbPwJXxuRLd2qLw
	JXs2BsrK5UNq8axXfVNc6Y6RrKhB7uUjJu4aSmHEMuiF
X-Google-Smtp-Source: AJdET5cpdm5bZoBbUUZeCy73eizU92V+pqh4niaE1n5XqaeYzjLVp87h0lvM+Y+oF7w5DiKTjcXllyv6aCkSR6DW4yw=
X-Received: by 2002:a9d:12d:: with SMTP id 42mr3846897otu.352.1542298879891;
 Thu, 15 Nov 2018 08:21:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 08:20:59
 -0800 (PST)
In-Reply-To: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 16:20:59 +0000
Message-ID: <CAFEAcA-gt4aLx171zU=qzbzygL6AN98HEPmL6iKG2O6E31ka4A@mail.gmail.com>
Subject: Re: [PATCH v4] Add arm SBSA reference machine
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: aK3nn2ujZ5da

On 19 October 2018 at 09:55, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> there are two commit reverts I have to do to boot system currently, these=
 block not only my new 'sbsa-ref', but also the 'virt'.
> (other two workarounds can be ignored, they are just for temp using befor=
e firmware porting is fully finished)
>
> I am not saying the comments themselves have problem, maybe firmware need=
 to be adapted accordingly too. But before they are fixed, I just simply re=
vert them to not block my run.
> (And, I've mentioned in v3 list that there are still problem of booting S=
MP too, but I won't mention it here this time, otherwise this patch/cover l=
etter becomes too complicated -- at least we can boot one core, I can fix/d=
iscuss it later separately.)

We do need to investigate and at least understand all these issues
before we can take this new board. Thanks for the repro instructions
for the virt board.

> Steps to reproduce issues:
> 1. Compile ARMTF
> make CROSS_COMPILE=3Daarch64-linux-gnu- PLAT=3Dqemu all DEBUG=3D1

What source tree do I need to build this EDK ?

> 2. Compile edk2
> make -C BaseTools
> . edksetup.sh
> export GCC49_AARCH64_PREFIX=3Daarch64-linux-gnu-
> build -a AARCH64 -t GCC49 -p ArmVirtPkg/ArmVirtQemuKernel.dsc
>
> 3. Run QEMU
> 3a. copy or link ARMTF and edk2 images to the directory where you want to=
 launch QEMU
> bl1.bin -> /home/hongbo/work/arm-trusted-firmware/build/qemu/debug/bl1.bi=
n*
> bl2.bin -> /home/hongbo/work/arm-trusted-firmware/build/qemu/debug/bl2.bi=
n*
> bl31.bin -> /home/hongbo/work/arm-trusted-firmware/build/qemu/debug/bl31.=
bin*
> bl33.bin -> /home/hongbo/work/edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_=
GCC49/FV/QEMU_EFI.fd
>
> 3b. command to launch QEMU
> command1 to load a whole system
> qemu-system-aarch64 -machine virt,secure=3Don,virtualization=3Don -cpu co=
rtex-a57 -m 1024 -bios bl1.bin -semihosting -serial stdio -device virtio-sc=
si-device,id=3Dscsi -drive file=3D../qemu-imgs/deb9_arm64_netinst_uefi.raw,=
id=3Drootimg,if=3Dnone -device scsi-hd,drive=3Drootimg -netdev user,id=3Dun=
et -device virtio-net-device,netdev=3Dunet -net user
>
> or command2 simply load a kernel
> qemu-system-aarch64 -machine virt,secure=3Don,virtualization=3Don -cpu co=
rtex-a57 -m 1024 -bios bl1.bin -semihosting -serial stdio -kernel Image -in=
itrd xxx -append "root=3D/dev/xxx console=3DttyAMA0"
>
> 4a. system halt with error message
> ASSERT_EFI_ERROR (Status =3D Not Found)
> ASSERT [ResetSystemRuntimeDxe] /home/hongbo/work/edk2/Build/ArmVirtQemuKe=
rnel-AARCH64/DEBUG_GCC49/AARCH64/MdeModulePkg/Universal/ResetSystemRuntimeD=
xe/ResetSystemRuntimeDxe/DEBUG/AutoGen.c(370): !EFI_ERROR (Status)
>
> 4b. Revert "device_tree: Increase FDT_MAX_SIZE to 1 MiB"
> command1 can run further to halt at nother place, see 5a and 5b
> command2 can load kernel successfully

I'm not sure what's going on here. Some debugging of what the
assertion is checking and why we've hit it would be required.
I didn't expect changing FDT_MAX_SIZE would affect much but
perhaps it changes where the fdt winds up in memory or how
big it is so it overlaps with something else.
There is an fdt_pack() function which should compress a
created dtb, and which QEMU uses for some board models but
not others; but I would want to find out what's actually
happening here before looking at whether that is the right fix.

> 5a. 2nd system halt with message
> Synchronous Exception at 0x0000000078A152F0
> PC 0x000078A152F0 (0x000078A00000+0x000152F0) [ 0] ArmVeNorFlashDxe.dll
> PC 0x000078A152A0 (0x000078A00000+0x000152A0) [ 0] ArmVeNorFlashDxe.dll
> PC 0x000078A11DF0 (0x000078A00000+0x00011DF0) [ 0] ArmVeNorFlashDxe.dll
> [...snip...]
> PC 0x0000600088C4
> PC 0x000060008230
> PC 0x580B24C2580B24A1
>
> Recursive exception occurred while dumping the CPU state
>
> 5b Revert "target/arm: Implement new do_transaction_failed hook"
> then no halt, command1 can boot OS successfully

The bug here will be that the firmware is attempting to access
an address which has no device present there. We need to
find out what code in the firmware is doing that, and what
device it is trying to access. Then we can find out if it's
a firmware bug, or if there needs to be some device present,
or if we've given the wrong information in the device tree
or ACPI tables.

Can EDK be made to give a backtrace with source filenames
and line numbers for the exception ?

thanks
-- PMM
