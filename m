Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f24sm5568663wmb.37.2019.11.14.03.17.16
        for <qemu-arm@nongnu.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 03:17:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 65DB41FF87
	for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 11:17:16 +0000 (GMT)
References: <CA+aXn+EtxWUVBBqhtjuY9hyKjtLFiSF=fZ8nSiqZq7+KCJDgfQ@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Subject: Re: Qemu support for mcimx6ul-evk machine
In-reply-to: <CA+aXn+EtxWUVBBqhtjuY9hyKjtLFiSF=fZ8nSiqZq7+KCJDgfQ@mail.gmail.com>
Date: Thu, 14 Nov 2019 11:17:16 +0000
Message-ID: <878soi7lmr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0S/Q6OX4Tber


Pratik Parvati <pratikp@vayavyalabs.com> writes:

> Hi Support team,
>
> Lately, I am trying to get Linux up on qemu-arm *mcimx6ul-evk* machine
> using buildroot. I have generated all the images required for my target
> machine. Following are the steps I followed for building images on
> buildroot (*version: buildroot-2016.11.1*).
>
> $ make freescale_imx6ulevk_defconfig
> $ make nconfig
>
> I have selected the packages required for my qemu build and then built the
> images using command
>
> $ make
>
> in "*output/images"* I see the following images generated,
> *boot.vfat,  imx6ul-14x14-evk.dtb,  rootfs.ext2,  rootfs.ext4,
> rootfs.tar,  sdcard.img,  u-boot.bin,  u-boot.imx,  zImage*.
>
> I am referring this <https://dzone.com/articles/an-arm-image-with-buildro=
ot>
> article to replicate the same for mcimx6ul-evk. I ran the below command to
> boot Linux on my target machine
>
> $ qemu-system-arm -M mcimx6ul-evk -m 512M -kernel output/images/zImage
> -monitor stdio -drive file=3Doutput/images/rootfs.ext2,format=3Draw

Currently you have the monitor set to stdio so you won't see any output
from the serial port. You can configure serial output to multiplex with
the monitor with the command line option:

  -serial mon:stdio

and toggle between the two with C-a c

>
> I don't see Linux booting on the serial0 console without any logs. can
> someone please help me how to resolve this? Or am I missing something her=
e?
>
> Note: The qemu(*version: qemu-4.1.0*) is built for arm target using below
> commands.
>
> $ ./configure --target-list=3Darm-softmmu --enable-sdl
> $ make
> $ sudo make install
>
> Thanks & Regards,
> Pratik


--
Alex Benn=C3=A9e
