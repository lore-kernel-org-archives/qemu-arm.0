Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7379134wrw;
        Thu, 15 Nov 2018 11:00:05 -0800 (PST)
X-Received: by 2002:a02:715a:: with SMTP id n26-v6mr7029868jaf.34.1542308404949;
        Thu, 15 Nov 2018 11:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542308404; cv=none;
        d=google.com; s=arc-20160816;
        b=GzSf02y6i/3PKGAUiOpDGzLHZQwqrwvr+8/uUtue2p/RZJiPr8mA9r8XYtwEwE7uQN
         Rh7Y1IiDczN7g7IZHOjbHKod1OQ/H+x2IUSZ00FSJrWF4CzQVePNJnmwf2Megu/1++cD
         i4kSwYJEZqvez1OLjuAe5iBr1MTSbDWV5Ggkw0q0ynDCS15RcSc2VNFqDUugjCIBqAoh
         ugA/vmlwVGPs8GcwqExP6b5nRotF24kAkiQtX0j7whEGzQ6mjRYMVXIw350LKYgKuoZZ
         svgd461SHu+XPcrD5IZ+rBXgQUIHxxELo/NPiRhIEX4iBgM9ComVx3N0YWhjdwT3Bmqq
         5Gkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jxI4WKSdYaKq6iiINbNZRcFPXvq3jT5GyVi9PDt/kqc=;
        b=ps15L3gcL2CJARdcKVYeeH5ant2Btgrm6f6eGVrKs4QaBTvXu1zZLL5LvhWgyQgpvt
         xjV+NBTDpabqFZg8uGN43SaB+E2z/ozCBUrhaJh2ihBYznAHs13+rzsc/drURTJIHJ9G
         3NzBit81iki0cwDXtgN58Q5P0Hl74CHwTqZ88/3/kHwphE6S9p8IdSnp+oGn+LWPczf/
         2Q3462uQo3LM7jYleSg+wsWj6oqNAyGZfELiT/OnfOx74p/kKdyDL7TSmDw6nDlU3e+7
         MuWf41mTzrPTyvS7LWjlBoocnOjy15xeFLB1wCn4MArd0S4r5o6hwe5Qwjwkf1/e/2tn
         C+xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXHxNPmB;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j66sor4711973iof.43.2018.11.15.11.00.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Nov 2018 11:00:04 -0800 (PST)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXHxNPmB;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jxI4WKSdYaKq6iiINbNZRcFPXvq3jT5GyVi9PDt/kqc=;
        b=gXHxNPmBR8XK3ro6cwSVeMbkwCyC4Hk3lfJO83x4yzeIdAB2zXlMSiN+yv+1G/rXrw
         xbLk+ElZDuRHWZq6VkeeHSdEKiD2angK499pYLyjChN05o44aIunJ9+IbLC5VuAPItoS
         Lrts+h4Li4XMqpT+Ed98AB2Qy+xrZCo1Wm460=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jxI4WKSdYaKq6iiINbNZRcFPXvq3jT5GyVi9PDt/kqc=;
        b=YIh7trBzYMQn5NkgU+x/bSMuId0QjDbQBPgx4i3JzTxELgjKS1rmAV7uPg/4zLIaYF
         9/jOywnt6gD4Ytz+DWSoRuT90ly+6XnLLeBpTennagXOR5zVclcCh1u455kEv+RiwvA/
         qStvfXhyHyd+NGTcPEPBkASfjqOuhb9M0AsXl1vuJ/eepmjxa9EpROLq8fYFbpUgLOCQ
         ihDOtPwxToxU67lWgvG+e3vjwDf41mWlZzaDoXLgy7AceV1EPfsCtEXE16RANc9G+gi+
         pQC5iCjmPpIjOdgZdeT81MqN3KVvvHbSaIzUCw2lD2/7OcCyIBlpt7/1yh0meZNfJimj
         bNcQ==
X-Gm-Message-State: AGRZ1gKDVT8mjrReZFgE3zQG7rE3ghMfLo46PM3kcUHFwJyQO8S1aa7A
	+80qPgUZWi1DhDfbSl2BletTLkOKIaM9j44bqBRNW/9H
X-Google-Smtp-Source: AFSGD/VcQw2A5Nf4bbVlxxbNgzwlGfXQnLRw8EPhK+6m94qXhzSsir61szbfKJBPI4/an9PCFOZf0Fw4Zi9pIRezAv4=
X-Received: by 2002:a6b:37c2:: with SMTP id e185-v6mr6087460ioa.173.1542308404415;
 Thu, 15 Nov 2018 11:00:04 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA-gt4aLx171zU=qzbzygL6AN98HEPmL6iKG2O6E31ka4A@mail.gmail.com>
In-Reply-To: <CAFEAcA-gt4aLx171zU=qzbzygL6AN98HEPmL6iKG2O6E31ka4A@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 15 Nov 2018 10:59:52 -0800
Message-ID: <CAKv+Gu_3nzz3Z0a70YHXUd4e-FWLxZokaqPqwTL4Z70zzE80aw@mail.gmail.com>
Subject: Re: [PATCH v4] Add arm SBSA reference machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: f7ZmfgWFQiV3

On Thu, 15 Nov 2018 at 08:21, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On 19 October 2018 at 09:55, Hongbo Zhang <hongbo.zhang@linaro.org> wrote=
:
> > there are two commit reverts I have to do to boot system currently, the=
se block not only my new 'sbsa-ref', but also the 'virt'.
> > (other two workarounds can be ignored, they are just for temp using bef=
ore firmware porting is fully finished)
> >
> > I am not saying the comments themselves have problem, maybe firmware ne=
ed to be adapted accordingly too. But before they are fixed, I just simply =
revert them to not block my run.
> > (And, I've mentioned in v3 list that there are still problem of booting=
 SMP too, but I won't mention it here this time, otherwise this patch/cover=
 letter becomes too complicated -- at least we can boot one core, I can fix=
/discuss it later separately.)
>
> We do need to investigate and at least understand all these issues
> before we can take this new board. Thanks for the repro instructions
> for the virt board.
>
> > Steps to reproduce issues:
> > 1. Compile ARMTF
> > make CROSS_COMPILE=3Daarch64-linux-gnu- PLAT=3Dqemu all DEBUG=3D1
>
> What source tree do I need to build this EDK ?
>
> > 2. Compile edk2
> > make -C BaseTools
> > . edksetup.sh
> > export GCC49_AARCH64_PREFIX=3Daarch64-linux-gnu-
> > build -a AARCH64 -t GCC49 -p ArmVirtPkg/ArmVirtQemuKernel.dsc
> >
> > 3. Run QEMU
> > 3a. copy or link ARMTF and edk2 images to the directory where you want =
to launch QEMU
> > bl1.bin -> /home/hongbo/work/arm-trusted-firmware/build/qemu/debug/bl1.=
bin*
> > bl2.bin -> /home/hongbo/work/arm-trusted-firmware/build/qemu/debug/bl2.=
bin*
> > bl31.bin -> /home/hongbo/work/arm-trusted-firmware/build/qemu/debug/bl3=
1.bin*
> > bl33.bin -> /home/hongbo/work/edk2/Build/ArmVirtQemuKernel-AARCH64/DEBU=
G_GCC49/FV/QEMU_EFI.fd
> >
> > 3b. command to launch QEMU
> > command1 to load a whole system
> > qemu-system-aarch64 -machine virt,secure=3Don,virtualization=3Don -cpu =
cortex-a57 -m 1024 -bios bl1.bin -semihosting -serial stdio -device virtio-=
scsi-device,id=3Dscsi -drive file=3D../qemu-imgs/deb9_arm64_netinst_uefi.ra=
w,id=3Drootimg,if=3Dnone -device scsi-hd,drive=3Drootimg -netdev user,id=3D=
unet -device virtio-net-device,netdev=3Dunet -net user
> >
> > or command2 simply load a kernel
> > qemu-system-aarch64 -machine virt,secure=3Don,virtualization=3Don -cpu =
cortex-a57 -m 1024 -bios bl1.bin -semihosting -serial stdio -kernel Image -=
initrd xxx -append "root=3D/dev/xxx console=3DttyAMA0"
> >
> > 4a. system halt with error message
> > ASSERT_EFI_ERROR (Status =3D Not Found)
> > ASSERT [ResetSystemRuntimeDxe] /home/hongbo/work/edk2/Build/ArmVirtQemu=
Kernel-AARCH64/DEBUG_GCC49/AARCH64/MdeModulePkg/Universal/ResetSystemRuntim=
eDxe/ResetSystemRuntimeDxe/DEBUG/AutoGen.c(370): !EFI_ERROR (Status)
> >
> > 4b. Revert "device_tree: Increase FDT_MAX_SIZE to 1 MiB"
> > command1 can run further to halt at nother place, see 5a and 5b
> > command2 can load kernel successfully
>
> I'm not sure what's going on here. Some debugging of what the
> assertion is checking and why we've hit it would be required.
> I didn't expect changing FDT_MAX_SIZE would affect much but
> perhaps it changes where the fdt winds up in memory or how
> big it is so it overlaps with something else.
> There is an fdt_pack() function which should compress a
> created dtb, and which QEMU uses for some board models but
> not others; but I would want to find out what's actually
> happening here before looking at whether that is the right fix.
>
> > 5a. 2nd system halt with message
> > Synchronous Exception at 0x0000000078A152F0
> > PC 0x000078A152F0 (0x000078A00000+0x000152F0) [ 0] ArmVeNorFlashDxe.dll
> > PC 0x000078A152A0 (0x000078A00000+0x000152A0) [ 0] ArmVeNorFlashDxe.dll
> > PC 0x000078A11DF0 (0x000078A00000+0x00011DF0) [ 0] ArmVeNorFlashDxe.dll
> > [...snip...]
> > PC 0x0000600088C4
> > PC 0x000060008230
> > PC 0x580B24C2580B24A1
> >
> > Recursive exception occurred while dumping the CPU state
> >
> > 5b Revert "target/arm: Implement new do_transaction_failed hook"
> > then no halt, command1 can boot OS successfully
>
> The bug here will be that the firmware is attempting to access
> an address which has no device present there. We need to
> find out what code in the firmware is doing that, and what
> device it is trying to access. Then we can find out if it's
> a firmware bug, or if there needs to be some device present,
> or if we've given the wrong information in the device tree
> or ACPI tables.
>
> Can EDK be made to give a backtrace with source filenames
> and line numbers for the exception ?
>

The list you see up there is the backtrace. You'll have to objdump the
.dll file yourself (it is actually an ELF file with the exact same
memory layout as the PE/COFF image) The numbers in brackets are
indexes into the list of complete filenames that usually follows, but
unfortunately the corrupted PC breaks the backtracer before it gets
there.

My copy of that file is at
Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/AARCH64/ArmPlatformPkg/Drivers/NorFlas=
hDxe/NorFlashDxe/DEBUG/ArmVeNorFlashDxe.dll
