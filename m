Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp875854lff;
        Sat, 18 Jan 2020 14:38:16 -0800 (PST)
X-Received: by 2002:a92:8c54:: with SMTP id o81mr4693134ild.163.1579387096660;
        Sat, 18 Jan 2020 14:38:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579387096; cv=none;
        d=google.com; s=arc-20160816;
        b=RLpOiUjfQqj9W2Yif0ZKie7ovW4xHxjIsXEnKbr36UdqyFYlNcGN1MdWwlrtB/qPWM
         F1JHhxD0EKJei2oNT7jlgfz8b/Gsjqg9CZN3irBQ47QwlICBVmwxTP1uplDDr7OOmLh6
         pi9o5PtJwikicGDbHNfK6vFuhBzoJr3lvnic/NwOGyEw1ao2ks28QODj+V+9cqaQM3CS
         HvqQR2AYaimVmoESba470+VWiexpfljvbf4PxAj/oWfDkX7rRBJGS37BEsRySFLkJX6H
         u+hN1St2wC4LkGIYKEC0poMtJIRez2Q43i2V4RxOYYsuBLCCjLKIe9MHrvo13yTLNC5u
         7+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hRcd/nm1DDXCy0mM6v2vSKirTIojgRih8LH3c3wiVto=;
        b=mcppNuQs6/KRf0PZquxAD9rpaNndsE4qfsXqFoSASo4Du2iPdtdWONGpfjKBIntP7X
         Q3NUK0+cZORLGNDrnzJoh8nrlUEBN7w0RpuEIbrapKk4qg3YUhKBwSJCZmCMX+M8t9ya
         +6zeyTXaVOi/axgOMW+YhVfDaLuSutv2vMEo2ClR1AeF9vY/TMF8Y935PnFwVj8s1vUO
         oo5WXXfi5k8I5e0VefPgEgKmPpO9ySf+Sg4joH01ZrslNdHc1qwsGFNi0YXLV4khC5BZ
         or31pdtQyK0f1mIDDpgFJozIRLNLFOlbEHBv1ZPzSY/4fIxN9t718sD34ovzgkV+NVqS
         oTCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=E2B5nIy1;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h10sor19980771ilq.114.2020.01.18.14.38.16
        (Google Transport Security);
        Sat, 18 Jan 2020 14:38:16 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=E2B5nIy1;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRcd/nm1DDXCy0mM6v2vSKirTIojgRih8LH3c3wiVto=;
        b=E2B5nIy1zyU1n4iqUmP/7tTG2NV2UUQMjP+9dDgg3hkXSeRk6UiDBK3M+oHddCzFwG
         puFYic+S6zlvGmrBsdwpU5sKGbF2vTlNkO8dXES1UcjRDcXsITOYftXb1urq7xhXwIPl
         R7xaqWsBr6q27UyXugtnLcSh3WIkCNXrxuXYN2JVKgVV+eQ3fQiPbkoiQdJlx6nYPGjf
         z0L0jnOCPQbWxFBUqEUQCewJCYbgIAU6C9UmozuOzQQTZm2aXTbd7y3ZnjGMNsLSadDc
         kA3V3IpbEsy87u8O3sJo6Pz/sXPqHB05KaNZi9YMYU/XwNG478b22ibbcESBlDc/wkG2
         RJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRcd/nm1DDXCy0mM6v2vSKirTIojgRih8LH3c3wiVto=;
        b=iAs391Vnd8Ros59Kem5biGRlj5biur909JgqZjpWkoPzW91yH7g7q7QvMnQkWmlJti
         gr3/U2lqnu2jYCNCCJ8lYEqYNDT2uDYXI1VVEdMmhCAbLAmEXGQeqGtKRxCArEamhIu+
         K0foqg5nTg/X1OlzgkFJ1QJWSzZOy2FA1wK80lWa9alymcn776cWTMoXrIDdRAwCm89W
         +cLkJ4m3P7pBpju0FbeYPY74nQy/AfU+ZR3IEzoUJ8wB5Pq8sEkl27bFMbeS4zBV6HfJ
         VjghulRMh3ctaRMKGWn3l36UkiMXtMFdPLTBk5pAW7LRyoLM16l70Z2rxPvt28eizs5l
         qW4Q==
X-Gm-Message-State: APjAAAWT48RqiHMxP403qCZ19U/OADOpXiQknwBpzR/52jopjx/YqCrX
	k32H6jMl8Bg10iCph4Jh2lZuOMOHxwXp3FcJ2SE=
X-Google-Smtp-Source: APXvYqzAWqN00LfwIByfJra637idfqA5aLbwTcLEGavZVU0r8rpA8DbcYzmGRbf7mnoqILBhYFzYQHKHdnxh9mRGsV4=
X-Received: by 2002:a92:7509:: with SMTP id q9mr4472042ilc.67.1579387096216;
 Sat, 18 Jan 2020 14:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-18-nieklinnenbank@gmail.com> <15d377a2-9d40-6195-5bfb-64e69037cd64@redhat.com>
In-Reply-To: <15d377a2-9d40-6195-5bfb-64e69037cd64@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sat, 18 Jan 2020 23:38:05 +0100
Message-ID: <CAPan3WrbuKWNvnXaDbCrc4cjHh1bGTfSU39jvM46GP26nhGrMw@mail.gmail.com>
Subject: Re: [PATCH v3 17/17] docs: add Orange Pi PC document
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d53bc8059c71b696"
X-TUID: GFK/Tff/ASvu

--000000000000d53bc8059c71b696
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Sat, Jan 18, 2020 at 10:38 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> On 1/8/20 9:00 PM, Niek Linnenbank wrote:
> > The Xunlong Orange Pi PC machine is a functional ARM machine
> > based on the Allwinner H3 System-on-Chip. It supports mainline
> > Linux, U-Boot, NetBSD and is covered by acceptance tests.
> >
> > This commit adds a documentation text file with a description
> > of the machine and instructions for the user.
> >
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > ---
> >   docs/orangepi.rst | 200 +++++++++++++++++++++++++++++++++++++++++++++=
+
> >   MAINTAINERS       |   1 +
> >   2 files changed, 201 insertions(+)
> >   create mode 100644 docs/orangepi.rst
> >
> > diff --git a/docs/orangepi.rst b/docs/orangepi.rst
> > new file mode 100644
> > index 0000000000..5ac2a7b7cc
> > --- /dev/null
> > +++ b/docs/orangepi.rst
> > @@ -0,0 +1,200 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +Orange Pi PC Machine Type
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
> > +based embedded computer with mainline support in both U-Boot
> > +and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
> > +512MB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
> > +various other I/O.
> > +
> > +Supported devices
> > +-----------------
> > +
> > +The Orange Pi PC machine type supports the following devices:
>
> Maybe drop "type"?
>
> > +
> > + * SMP (Quad Core Cortex A7)
> > + * Generic Interrupt Controller configuration
> > + * SRAM mappings
> > + * SDRAM controller
> > + * Real Time Clock
> > + * Timer device (re-used from Allwinner A10)
> > + * UART
> > + * SD/MMC storage controller
> > + * EMAC ethernet connectivity
>
> Drop "connectivity"?
>
> > + * USB 2.0 interfaces
> > + * Clock Control Unit
> > + * System Control module
> > + * Security Identifier device
> > +
> > +Limitations
> > +-----------
> > +
> > +Currently, Orange Pi PC does *not* support the following features:
> > +
> > +- Graphical output via HDMI, GPU and/or the Display Engine
> > +- Audio output
> > +- Hardware Watchdog
> > +
> > +Also see the 'unimplemented' array in the Allwinner H3 SoC module
> > +for a complete list of unimplemented I/O devices:
> > +  ./hw/arm/allwinner-h3.c
> > +
> > +Using the Orange Pi PC machine type
> > +-----------------------------------
> > +
> > +Boot options
> > +~~~~~~~~~~~~
> > +
> > +The Orange Pi PC machine can start using the standard -kernel
> functionality
> > +for loading a Linux kernel or ELF executable. Additionally, the Orange
> Pi PC
> > +machine can also emulate the BootROM which is present on an actual
> Allwinner H3
> > +based SoC, which loads the bootloader from SD card, specified via the
> -sd argument
>
> "from a SD card"?
>
> > +to qemu-system-arm.
> > +
> > +Running mainline Linux
> > +~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Recently released mainline Linux kernels from 4.19 up to latest master
>
> Drop "Recently released mainline" or only use "Mainline"?
>
> Thanks, I'll correct all comments above.


> > +are known to work. To build a Linux mainline kernel that can be booted
> > +by the Orange Pi PC machine, simply configure the kernel using the
> > +sunxi_defconfig configuration:
> > +
> > +  $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make mrproper
> > +  $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make sunxi_defconfig
> > +
> > +To be able to use USB storage, you need to manually enable the
> corresponding
> > +configuration item. Start the kconfig configuration tool:
> > +
> > +  $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make menuconfig
> > +
> > +Navigate to the following item, enable it and save your configuration:
> > +
> > +  Device Drivers > USB support > USB Mass Storage support
>
> Isn't it simpler to run 'echo CONFIG_USB_STORAGE=3Dy >> .config && make
> oldconfig'?
>

Yes true, that is also a way to enable it. I just wrote it down like this
since using menuconfig
or xconfig is usually the way people are familiar with.


>
> > +
> > +Build the Linux kernel with:
> > +
> > +  $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make -j5
>
> I'm not sure about recommending "-j5" in the doc, not all user have >=3D4
> SMP system. Maybe we don't care.
>

Thanks, I'll remove the -j5.


>
> > +
> > +To boot the newly build linux kernel in QEMU with the Orange Pi PC
> machine, use:
> > +
> > +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> > +      -kernel /path/to/linux/arch/arm/boot/zImage \
> > +      -append 'console=3DttyS0,115200' \
> > +      -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb
> > +
> > +Orange Pi PC images
> > +~~~~~~~~~~~~~~~~~~~
> > +
> > +Note that the mainline kernel does not have a root filesystem. You may
> provide it
> > +with an official Orange Pi PC image from the official website:
> > +
> > +  http://www.orangepi.org/downloadresources/
> > +
> > +Another possibility is to run an Armbian image for Orange Pi PC which
> > +can be downloaded from:
> > +
> > +   https://www.armbian.com/orange-pi-pc/
> > +
> > +Alternatively, you can also choose to build you own image with buildro=
ot
> > +using the orangepi_pc_defconfig. Also see https://buildroot.org for
> more information.
> > +
> > +You can choose to attach the selected image either as an SD card or as
> USB mass storage.
> > +For example, to boot using the Orange Pi PC Debian image on SD card,
> simply add the -sd
> > +argument and provide the proper root=3D kernel parameter:
> > +
> > +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> > +      -kernel /path/to/linux/arch/arm/boot/zImage \
> > +      -append 'console=3DttyS0,115200 root=3D/dev/mmcblk0p2' \
> > +      -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb \
> > +      -sd OrangePi_pc_debian_stretch_server_linux5.3.5_v1.0.img
> > +
> > +To attach the image as an USB mass storage device to the machine,
> > +simply append to the command:
> > +
> > +  -drive if=3Dnone,id=3Dstick,file=3Dmyimage.img \
> > +  -device usb-storage,bus=3Dusb-bus.0,drive=3Dstick
> > +
> > +Instead of providing a custom Linux kernel via the -kernel command you
> may also
> > +choose to let the Orange Pi PC machine load the bootloader from SD
> card, just like
> > +a real board would do using the BootROM. Simply pass the selected imag=
e
> via the -sd
> > +argument and remove the -kernel, -append, -dbt and -initrd arguments:
> > +
> > +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> > +       -sd Armbian_19.11.3_Orangepipc_buster_current_5.3.9.img
> > +
> > +Note that both the official Orange Pi PC images and Armbian images sta=
rt
> > +a lot of userland programs via systemd. Depending on the host hardware
> and OS,
> > +they may be slow to emulate, especially due to emulating the 4 cores.
> > +To help reduce the performance slow down due to emulating the 4 cores,
> you can
> > +give the following kernel parameters (or via -append):
> > +
> > +  =3D> setenv extraargs 'systemd.default_timeout_start_sec=3D9000
> loglevel=3D7 nosmp console=3DttyS0,115200'
> > +
> > +Running U-Boot
> > +~~~~~~~~~~~~~~
> > +
> > +U-Boot mainline can be build and configured using the
> orangepi_pc_defconfig
> > +using similar commands as describe above for Linux. Note that it is
> recommended
> > +for development/testing to select the following configuration setting
> in U-Boot:
> > +
> > +  Device Tree Control > Provider for DTB for DT Control > Embedded DTB
> > +
> > +To start U-Boot using the Orange Pi PC machine, provide the
> > +u-boot binary to the -kernel argument:
> > +
> > +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> > +      -kernel /path/to/uboot/u-boot -sd disk.img
> > +
> > +Use the following U-boot commands to load and boot a Linux kernel from
> SD card:
> > +
> > +  -> setenv bootargs console=3DttyS0,115200
> > +  -> ext2load mmc 0 0x42000000 zImage
> > +  -> ext2load mmc 0 0x43000000 sun8i-h3-orangepi-pc.dtb
> > +  -> bootz 0x42000000 - 0x43000000
> > +
> > +Running NetBSD
> > +~~~~~~~~~~~~~~
> > +
> > +The NetBSD operating system also includes support for Allwinner H3
> based boards,
> > +including the Orange Pi PC. NetBSD 9.0 is known to work best for the
> Orange Pi PC
> > +board and provides a fully working system with serial console,
> networking and storage.
> > +
> > +Currently NetBSD 9.0 is in testing, but release candidate 1 can be
> started
> > +successfully on the Orange Pi PC machine. Get the 'evbarm-earmv7hf'
> based image from:
> > +
> > +
> https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0_RC1/evbarm-earmv7hf/binary/g=
zimg/armv7.img.gz
> > +
> > +The image requires manually installing U-Boot in the image. Build
> U-Boot with
> > +the orangepi_pc_defconfig configuration as described in the previous
> section.
> > +Next, unzip the NetBSD image and write the U-Boot binary including SPL
> using:
> > +
> > +  $ gunzip armv7.img.gz
> > +  $ dd if=3D/path/to/u-boot-sunxi-with-spl.bin of=3Darmv7.img bs=3D102=
4
> seek=3D8 conv=3Dnotrunc
> > +
> > +Start the machine using the following command:
> > +
> > +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> > +        -sd armv7.img
> > +
> > +At the U-Boot stage, interrupt the automatic boot process by pressing =
a
> key
> > +and set the following environment variables before booting:
> > +
> > +  =3D> setenv bootargs root=3Dld0a
> > +  =3D> setenv kernel netbsd-GENERIC.ub
> > +  =3D> setenv fdtfile dtb/sun8i-h3-orangepi-pc.dtb
> > +  =3D> setenv bootcmd 'fatload mmc 0:1 ${kernel_addr_r} ${kernel};
> fatload mmc 0:1 ${fdt_addr_r} ${fdtfile}; fdt addr ${fdt_addr_r}; bootm
> ${kernel_addr_r} - ${fdt_addr_r}'
> > +
> > +Optionally you may save the environment variables to SD card with
> 'saveenv'.
> > +To continue booting simply give the 'boot' command and NetBSD boots.
> > +
> > +Orange Pi PC acceptance tests
> > +-----------------------------
> > +
> > +The Orange Pi PC machine has several acceptance tests included.
> > +To run the whole set of tests, build QEMU from source and simply
> > +provide the following command:
> > +
> > +  $ AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avocado --show=3Dapp,console run=
 \
> > +     -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
> > +
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6e1b92b5fa..b52ac2fb9e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -488,6 +488,7 @@ S: Maintained
> >   F: hw/*/allwinner-h3*
> >   F: include/hw/*/allwinner-h3*
> >   F: hw/arm/orangepi.c
> > +F: docs/orangepi.rst
> >
> >   ARM PrimeCell and CMSDK devices
> >   M: Peter Maydell <peter.maydell@linaro.org>
> >
>
>
Regards,
Niek

--=20
Niek Linnenbank

--000000000000d53bc8059c71b696
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 18, 2020 at 10:38 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 1/8/20 9:00 PM, Niek Linnenbank wrote:<br>
&gt; The Xunlong Orange Pi PC machine is a functional ARM machine<br>
&gt; based on the Allwinner H3 System-on-Chip. It supports mainline<br>
&gt; Linux, U-Boot, NetBSD and is covered by acceptance tests.<br>
&gt; <br>
&gt; This commit adds a documentation text file with a description<br>
&gt; of the machine and instructions for the user.<br>
&gt; <br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0docs/orangepi.rst | 200 ++++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
&gt;=C2=A0 =C2=A02 files changed, 201 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 docs/orangepi.rst<br>
&gt; <br>
&gt; diff --git a/docs/orangepi.rst b/docs/orangepi.rst<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5ac2a7b7cc<br>
&gt; --- /dev/null<br>
&gt; +++ b/docs/orangepi.rst<br>
&gt; @@ -0,0 +1,200 @@<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; +Orange Pi PC Machine Type<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; +<br>
&gt; +The Xunlong Orange Pi PC is an Allwinner H3 System on Chip<br>
&gt; +based embedded computer with mainline support in both U-Boot<br>
&gt; +and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,<br>
&gt; +512MB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and<br>
&gt; +various other I/O.<br>
&gt; +<br>
&gt; +Supported devices<br>
&gt; +-----------------<br>
&gt; +<br>
&gt; +The Orange Pi PC machine type supports the following devices:<br>
<br>
Maybe drop &quot;type&quot;?<br>
<br>
&gt; +<br>
&gt; + * SMP (Quad Core Cortex A7)<br>
&gt; + * Generic Interrupt Controller configuration<br>
&gt; + * SRAM mappings<br>
&gt; + * SDRAM controller<br>
&gt; + * Real Time Clock<br>
&gt; + * Timer device (re-used from Allwinner A10)<br>
&gt; + * UART<br>
&gt; + * SD/MMC storage controller<br>
&gt; + * EMAC ethernet connectivity<br>
<br>
Drop &quot;connectivity&quot;?<br>
<br>
&gt; + * USB 2.0 interfaces<br>
&gt; + * Clock Control Unit<br>
&gt; + * System Control module<br>
&gt; + * Security Identifier device<br>
&gt; +<br>
&gt; +Limitations<br>
&gt; +-----------<br>
&gt; +<br>
&gt; +Currently, Orange Pi PC does *not* support the following features:<br=
>
&gt; +<br>
&gt; +- Graphical output via HDMI, GPU and/or the Display Engine<br>
&gt; +- Audio output<br>
&gt; +- Hardware Watchdog<br>
&gt; +<br>
&gt; +Also see the &#39;unimplemented&#39; array in the Allwinner H3 SoC mo=
dule<br>
&gt; +for a complete list of unimplemented I/O devices:<br>
&gt; +=C2=A0 ./hw/arm/allwinner-h3.c<br>
&gt; +<br>
&gt; +Using the Orange Pi PC machine type<br>
&gt; +-----------------------------------<br>
&gt; +<br>
&gt; +Boot options<br>
&gt; +~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +The Orange Pi PC machine can start using the standard -kernel functio=
nality<br>
&gt; +for loading a Linux kernel or ELF executable. Additionally, the Orang=
e Pi PC<br>
&gt; +machine can also emulate the BootROM which is present on an actual Al=
lwinner H3<br>
&gt; +based SoC, which loads the bootloader from SD card, specified via the=
 -sd argument<br>
<br>
&quot;from a SD card&quot;?<br>
<br>
&gt; +to qemu-system-arm.<br>
&gt; +<br>
&gt; +Running mainline Linux<br>
&gt; +~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +Recently released mainline Linux kernels from 4.19 up to latest maste=
r<br>
<br>
Drop &quot;Recently released mainline&quot; or only use &quot;Mainline&quot=
;?<br>
<br></blockquote><div>Thanks, I&#39;ll correct all comments above.<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +are known to work. To build a Linux mainline kernel that can be boote=
d<br>
&gt; +by the Orange Pi PC machine, simply configure the kernel using the<br=
>
&gt; +sunxi_defconfig configuration:<br>
&gt; +<br>
&gt; +=C2=A0 $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make mrproper<=
br>
&gt; +=C2=A0 $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make sunxi_def=
config<br>
&gt; +<br>
&gt; +To be able to use USB storage, you need to manually enable the corres=
ponding<br>
&gt; +configuration item. Start the kconfig configuration tool:<br>
&gt; +<br>
&gt; +=C2=A0 $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make menuconfi=
g<br>
&gt; +<br>
&gt; +Navigate to the following item, enable it and save your configuration=
:<br>
&gt; +<br>
&gt; +=C2=A0 Device Drivers &gt; USB support &gt; USB Mass Storage support<=
br>
<br>
Isn&#39;t it simpler to run &#39;echo CONFIG_USB_STORAGE=3Dy &gt;&gt; .conf=
ig &amp;&amp; make <br>
oldconfig&#39;?<br></blockquote><div><br></div><div>Yes true, that is also =
a way to enable it. I just wrote it down like this since using menuconfig</=
div><div>or xconfig is usually the way people are familiar with.<br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +Build the Linux kernel with:<br>
&gt; +<br>
&gt; +=C2=A0 $ ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi- make -j5<br>
<br>
I&#39;m not sure about recommending &quot;-j5&quot; in the doc, not all use=
r have &gt;=3D4 <br>
SMP system. Maybe we don&#39;t care.<br></blockquote><div><br></div><div>Th=
anks, I&#39;ll remove the -j5.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +To boot the newly build linux kernel in QEMU with the Orange Pi PC ma=
chine, use:<br>
&gt; +<br>
&gt; +=C2=A0 $ qemu-system-arm -M orangepi-pc -nic user -nographic \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -kernel /path/to/linux/arch/arm/boot/zImage \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 -append &#39;console=3DttyS0,115200&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-o=
rangepi-pc.dtb<br>
&gt; +<br>
&gt; +Orange Pi PC images<br>
&gt; +~~~~~~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +Note that the mainline kernel does not have a root filesystem. You ma=
y provide it<br>
&gt; +with an official Orange Pi PC image from the official website:<br>
&gt; +<br>
&gt; +=C2=A0 <a href=3D"http://www.orangepi.org/downloadresources/" rel=3D"=
noreferrer" target=3D"_blank">http://www.orangepi.org/downloadresources/</a=
><br>
&gt; +<br>
&gt; +Another possibility is to run an Armbian image for Orange Pi PC which=
<br>
&gt; +can be downloaded from:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0<a href=3D"https://www.armbian.com/orange-pi-pc/" rel=3D=
"noreferrer" target=3D"_blank">https://www.armbian.com/orange-pi-pc/</a><br=
>
&gt; +<br>
&gt; +Alternatively, you can also choose to build you own image with buildr=
oot<br>
&gt; +using the orangepi_pc_defconfig. Also see <a href=3D"https://buildroo=
t.org" rel=3D"noreferrer" target=3D"_blank">https://buildroot.org</a> for m=
ore information.<br>
&gt; +<br>
&gt; +You can choose to attach the selected image either as an SD card or a=
s USB mass storage.<br>
&gt; +For example, to boot using the Orange Pi PC Debian image on SD card, =
simply add the -sd<br>
&gt; +argument and provide the proper root=3D kernel parameter:<br>
&gt; +<br>
&gt; +=C2=A0 $ qemu-system-arm -M orangepi-pc -nic user -nographic \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -kernel /path/to/linux/arch/arm/boot/zImage \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 -append &#39;console=3DttyS0,115200 root=3D/dev/=
mmcblk0p2&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-o=
rangepi-pc.dtb \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -sd OrangePi_pc_debian_stretch_server_linux5.3.5=
_v1.0.img<br>
&gt; +<br>
&gt; +To attach the image as an USB mass storage device to the machine,<br>
&gt; +simply append to the command:<br>
&gt; +<br>
&gt; +=C2=A0 -drive if=3Dnone,id=3Dstick,file=3Dmyimage.img \<br>
&gt; +=C2=A0 -device usb-storage,bus=3Dusb-bus.0,drive=3Dstick<br>
&gt; +<br>
&gt; +Instead of providing a custom Linux kernel via the -kernel command yo=
u may also<br>
&gt; +choose to let the Orange Pi PC machine load the bootloader from SD ca=
rd, just like<br>
&gt; +a real board would do using the BootROM. Simply pass the selected ima=
ge via the -sd<br>
&gt; +argument and remove the -kernel, -append, -dbt and -initrd arguments:=
<br>
&gt; +<br>
&gt; +=C2=A0 $ qemu-system-arm -M orangepi-pc -nic user -nographic \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-sd Armbian_19.11.3_Orangepipc_buster_curr=
ent_5.3.9.img<br>
&gt; +<br>
&gt; +Note that both the official Orange Pi PC images and Armbian images st=
art<br>
&gt; +a lot of userland programs via systemd. Depending on the host hardwar=
e and OS,<br>
&gt; +they may be slow to emulate, especially due to emulating the 4 cores.=
<br>
&gt; +To help reduce the performance slow down due to emulating the 4 cores=
, you can<br>
&gt; +give the following kernel parameters (or via -append):<br>
&gt; +<br>
&gt; +=C2=A0 =3D&gt; setenv extraargs &#39;systemd.default_timeout_start_se=
c=3D9000 loglevel=3D7 nosmp console=3DttyS0,115200&#39;<br>
&gt; +<br>
&gt; +Running U-Boot<br>
&gt; +~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +U-Boot mainline can be build and configured using the orangepi_pc_def=
config<br>
&gt; +using similar commands as describe above for Linux. Note that it is r=
ecommended<br>
&gt; +for development/testing to select the following configuration setting=
 in U-Boot:<br>
&gt; +<br>
&gt; +=C2=A0 Device Tree Control &gt; Provider for DTB for DT Control &gt; =
Embedded DTB<br>
&gt; +<br>
&gt; +To start U-Boot using the Orange Pi PC machine, provide the<br>
&gt; +u-boot binary to the -kernel argument:<br>
&gt; +<br>
&gt; +=C2=A0 $ qemu-system-arm -M orangepi-pc -nic user -nographic \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 -kernel /path/to/uboot/u-boot -sd disk.img<br>
&gt; +<br>
&gt; +Use the following U-boot commands to load and boot a Linux kernel fro=
m SD card:<br>
&gt; +<br>
&gt; +=C2=A0 -&gt; setenv bootargs console=3DttyS0,115200<br>
&gt; +=C2=A0 -&gt; ext2load mmc 0 0x42000000 zImage<br>
&gt; +=C2=A0 -&gt; ext2load mmc 0 0x43000000 sun8i-h3-orangepi-pc.dtb<br>
&gt; +=C2=A0 -&gt; bootz 0x42000000 - 0x43000000<br>
&gt; +<br>
&gt; +Running NetBSD<br>
&gt; +~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +The NetBSD operating system also includes support for Allwinner H3 ba=
sed boards,<br>
&gt; +including the Orange Pi PC. NetBSD 9.0 is known to work best for the =
Orange Pi PC<br>
&gt; +board and provides a fully working system with serial console, networ=
king and storage.<br>
&gt; +<br>
&gt; +Currently NetBSD 9.0 is in testing, but release candidate 1 can be st=
arted<br>
&gt; +successfully on the Orange Pi PC machine. Get the &#39;evbarm-earmv7h=
f&#39; based image from:<br>
&gt; +<br>
&gt; +=C2=A0 <a href=3D"https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0_RC1/ev=
barm-earmv7hf/binary/gzimg/armv7.img.gz" rel=3D"noreferrer" target=3D"_blan=
k">https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0_RC1/evbarm-earmv7hf/binary/=
gzimg/armv7.img.gz</a><br>
&gt; +<br>
&gt; +The image requires manually installing U-Boot in the image. Build U-B=
oot with<br>
&gt; +the orangepi_pc_defconfig configuration as described in the previous =
section.<br>
&gt; +Next, unzip the NetBSD image and write the U-Boot binary including SP=
L using:<br>
&gt; +<br>
&gt; +=C2=A0 $ gunzip armv7.img.gz<br>
&gt; +=C2=A0 $ dd if=3D/path/to/u-boot-sunxi-with-spl.bin of=3Darmv7.img bs=
=3D1024 seek=3D8 conv=3Dnotrunc<br>
&gt; +<br>
&gt; +Start the machine using the following command:<br>
&gt; +<br>
&gt; +=C2=A0 $ qemu-system-arm -M orangepi-pc -nic user -nographic \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -sd armv7.img<br>
&gt; +<br>
&gt; +At the U-Boot stage, interrupt the automatic boot process by pressing=
 a key<br>
&gt; +and set the following environment variables before booting:<br>
&gt; +<br>
&gt; +=C2=A0 =3D&gt; setenv bootargs root=3Dld0a<br>
&gt; +=C2=A0 =3D&gt; setenv kernel netbsd-GENERIC.ub<br>
&gt; +=C2=A0 =3D&gt; setenv fdtfile dtb/sun8i-h3-orangepi-pc.dtb<br>
&gt; +=C2=A0 =3D&gt; setenv bootcmd &#39;fatload mmc 0:1 ${kernel_addr_r} $=
{kernel}; fatload mmc 0:1 ${fdt_addr_r} ${fdtfile}; fdt addr ${fdt_addr_r};=
 bootm ${kernel_addr_r} - ${fdt_addr_r}&#39;<br>
&gt; +<br>
&gt; +Optionally you may save the environment variables to SD card with &#3=
9;saveenv&#39;.<br>
&gt; +To continue booting simply give the &#39;boot&#39; command and NetBSD=
 boots.<br>
&gt; +<br>
&gt; +Orange Pi PC acceptance tests<br>
&gt; +-----------------------------<br>
&gt; +<br>
&gt; +The Orange Pi PC machine has several acceptance tests included.<br>
&gt; +To run the whole set of tests, build QEMU from source and simply<br>
&gt; +provide the following command:<br>
&gt; +<br>
&gt; +=C2=A0 $ AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avocado --show=3Dapp,conso=
le run \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-t machine:orangepi-pc tests/acceptance/boot_linu=
x_console.py<br>
&gt; +<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 6e1b92b5fa..b52ac2fb9e 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -488,6 +488,7 @@ S: Maintained<br>
&gt;=C2=A0 =C2=A0F: hw/*/allwinner-h3*<br>
&gt;=C2=A0 =C2=A0F: include/hw/*/allwinner-h3*<br>
&gt;=C2=A0 =C2=A0F: hw/arm/orangepi.c<br>
&gt; +F: docs/orangepi.rst<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0ARM PrimeCell and CMSDK devices<br>
&gt;=C2=A0 =C2=A0M: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; <br>
<br>
</blockquote></div><div><br></div><div>Regards,</div><div>Niek<br></div><br=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Ni=
ek Linnenbank<br><br></div></div></div></div>

--000000000000d53bc8059c71b696--
