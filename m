Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp95800wrw;
        Fri, 16 Nov 2018 00:23:27 -0800 (PST)
X-Received: by 2002:a2e:5b1d:: with SMTP id p29-v6mr5356443ljb.176.1542356607234;
        Fri, 16 Nov 2018 00:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542356607; cv=none;
        d=google.com; s=arc-20160816;
        b=ibzXvxfJO7JedsAzODUwStH2tA63nUr2guppFeRK1uhYMLjzHdzoUmvi0iWFLHJd5k
         9TA83WjqJziC8OxgP7ty57HHmMEsZtWCF68ROWDy3QV/Emw6RQfqZ35tFLYKUSTvV4uM
         iBUZ4qU8cK3neS28HJQjwkFZ4TT9D4Bpb/c/GlpvhRPXYFkcJ/rk6nf3RkDbQthpOtKq
         tDwYNBiInurXnpkOca3w5wbvKNku1i+A4Uv1lG8FyuaNk2GkDiN2qI5Gptg5Vu0ALQnp
         Q0cOJSekIOru4yB4O+KKBoQ6QZ1GwaZbmgyaEhcDbnWO7vx0cYwdW2fSTnUSaJm7xMF+
         4YFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YgnS+e8l3u4dUWD7fXKbVsAp0KUZNUndzLphUe5IO5Y=;
        b=bciqkzIMVfZM6thEzH05x5+6T3cvoqpFYyyvaEg1uO37wtRcy1+kH9T9bmwIuoHDZj
         qE7LDjCilM0AjxlINioE0KBYaAxDhccrVsjh8RUcsmcdyQQtWWCHt0LgBa8PmJzOwZZJ
         1iiQ2a/GVu96KLtaDur+72CriDMufW3VhcFWbVk/EpQC0tZ7TOJ/mNs9AdRYgQ8goKIH
         uhb2/u1PZL738Y05sBJ6cqirZktYt2rlhUDBZABk7Ey+MWwofzuEOCaHbngMYc6Lz1MC
         tpvZNnbyQk4P2pQy7MVz7ZK0zow6ldrwULM7hZOodvHt7iDl848VGN2nfwSD60DJ3kEq
         c9BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cXSERY5/";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j2-v6sor17185970ljg.42.2018.11.16.00.23.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Nov 2018 00:23:27 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cXSERY5/";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YgnS+e8l3u4dUWD7fXKbVsAp0KUZNUndzLphUe5IO5Y=;
        b=cXSERY5/urtp95jjtKWF816qzP/9P11L2+WbZ9Z297lR7oT42dAIiguFpP28WK9Ht4
         8BTKcSav+Sgjy46gwKLzdH1OPWLmatMK6XamLrv8x99xIb/ASR7HRSwe+bbnVEniyrs/
         CKC+Rmor4uV0T1bIEuR3PGrdOeE6S1tHz2rl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YgnS+e8l3u4dUWD7fXKbVsAp0KUZNUndzLphUe5IO5Y=;
        b=dB/1ugeXPhd3kqioA+HlHq9Jyv5KyQGwGF2z4oq647DZCZsS9TjhEuZtaU74TWZclY
         d5tVSwV2HiiWkq/eU/BORyWcOmKYiiNRvNLMWflXhVw2inGNP9bjoaVzOJqZNJaqBIV9
         x0SgB/ChRIMdfMdac3ySGgGN9nKCBp7GOShUCmZoJWtpqMQU4QAn4tkgtwomSSWpm0Kq
         Vya4jPaXTdbNYBdnhyuL2xaEaTxk5Lsqo+Bb747mwrhLP0HIyaBSiHdfkM6EmECxtylY
         RuffKFBsNjCSuXWQ7CRFfhnWwiELvv7EoCO29DtRlLXKEG+zsyIcaLCJwDohpF4NZdJY
         jKCA==
X-Gm-Message-State: AGRZ1gJn6Xic+Iu8b8ANqIc5d1tMMls9QHwLR+kjgGh+bUzRvbp/4L2z
	YjhEIPRdXBhUwqe7e9uVtH7WSW58Y/hsQw+kY++kd5ez
X-Google-Smtp-Source: AJdET5dVSQ8j/B4Nx432f9qXecMnQN/qB2fCl1wsq5mXfLQfEdCUXnfv9L/Vo9dfOnKN0+ks4uN42tVQP4wt9zkx5D8=
X-Received: by 2002:a2e:145a:: with SMTP id 26-v6mr5350119lju.116.1542356606836;
 Fri, 16 Nov 2018 00:23:26 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA-gt4aLx171zU=qzbzygL6AN98HEPmL6iKG2O6E31ka4A@mail.gmail.com>
In-Reply-To: <CAFEAcA-gt4aLx171zU=qzbzygL6AN98HEPmL6iKG2O6E31ka4A@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 16 Nov 2018 16:23:15 +0800
Message-ID: <CAHmQWvA7fyCFz-qE2_B1SHH+29gns5m_tccLSwF_GTs52LV9Lw@mail.gmail.com>
Subject: Re: [PATCH v4] Add arm SBSA reference machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: RFlk16l69u7C

On Fri, 16 Nov 2018 at 00:21, Peter Maydell <peter.maydell@linaro.org> wrot=
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
Well, for the SMP booting, when GICv2 used, there is no problem, max
CPU number 8 can be booted, including all the three cases: kernel
only, UEFI+kernel and ATF+UEFI+kernel.

But when GICv3 used, these two cases still work: kernel only, and
UEFI+kernel, but ATF+UEFI+kernel fails booting more than 4 cores with
GICv3.
The original ATF didn't support GICv3, so I added the support:
http://git.linaro.org/people/hongbo.zhang/atf-sbsa.git/log/?h=3Dsbsa_gicv3

Root cause of failing to boot more than 4 cores with ATF+UEFI+kernel
with my GICv3 enabled is due to this:
In QEMU, we have this defination
#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
But in ATF, the defination is
#define PLATFORM_MAX_CPUS_PER_CLUSTER 4
So when we pass smp=3D6 for example, QEMU generates MPIDR showing all
the 6 cores are at cluster 0, but when ATF parses such MPIDR, the
function plat_core_pos_by_mpidr() in plat/qemu/topology.c returns
error since there should be no more cores than 4.

I think we should change the definition in QEMU to 4, instead of
changing the ATF's, because I checked Cortext a57/a72/a73/a75 spec, it
says there are 4 cores max at one cluster.

> > Steps to reproduce issues:
> > 1. Compile ARMTF
> > make CROSS_COMPILE=3Daarch64-linux-gnu- PLAT=3Dqemu all DEBUG=3D1
>
> What source tree do I need to build this EDK ?
>
I use https://github.com/ARM-software/arm-trusted-firmware.git
And you can also use my
http://git.linaro.org/people/hongbo.zhang/atf-sbsa.git/log/?h=3Dsbsa_gicv3
with GICv3 enabled.

Use additional compiling parameter QEMU_USE_GIC_DRIVER to selecct GICv3
"make PLAT=3Dqemu all DEBUG=3D1 QEMU_USE_GIC_DRIVER=3DQEMU_GICV3"
No such parameter to select default GICv2
(But I found if you change GICv2 and v3 from time to time when
compiling, the build system may not do the correct changing every
time, so it is better to do a clean before compiling)

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
I think the firmware is checking mass storage device to find a
bootable OS at this stage.

> Can EDK be made to give a backtrace with source filenames
> and line numbers for the exception ?
>
> thanks
> -- PMM
