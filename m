Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t124sm9900983wmg.31.2020.10.04.10.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 10:44:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1598F1FF7E;
	Sun,  4 Oct 2020 18:44:10 +0100 (BST)
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas <74cmonty@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Emulate Rpi with QEMU fails
In-reply-to: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
Date: Sun, 04 Oct 2020 18:44:09 +0100
Message-ID: <87sgatanti.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: v8mHt/5AMqkR


Thomas <74cmonty@gmail.com> writes:

> Hi,
>
> I'm trying to emulate Rpi with QEMU.
> I found
> [url=3D1]this[/url]
> arcticle in Raspberry Pi Geek documenting the steps including persistent
> storage on host.
>
> However when starting the emulation with command
> qemu-system-arm -M versatilepb -cpu arm1176 -m 256 -serial stdio -hda
> 2020-08-20-raspios-buster-armhf-lite.img -net
> "user,hostfwd=3Dtcp::5022-:22" -dtb versatile-pb-buster.dtb -kernel
> kernel-qemu-5.4.51-buster -append "root=3D/dev/sda2 rootfstype=3Dext4 rw
> panic=3D1" -no-reboot

Let's start with the fact you are using a versatilepb machine type with
a versatilepb dtb and not the rasppi model. The manual goes into more
details about why you can't generally share kernels built for one ARM
system on another:

  https://qemu.readthedocs.io/en/latest/system/target-arm.html

Since that article was written we have added models for the -M raspi2
and -M raspi3 which might work better with a kernel written for it
although the emulation isn't complete.

> I get this error:
> VFS: Cannot open root device "sda2" or unknown-block(0,0): error -6
> Please append a correct "root=3D" boot option; here are the available
> partitions:
> 0100            4096 ram0
>  (driver?)
> 0101            4096 ram1
>  (driver?)
> 0102            4096 ram2
>  (driver?)
> 0103            4096 ram3
>  (driver?)
> 0104            4096 ram4
>  (driver?)
> 0105            4096 ram5
>  (driver?)
> 0106            4096 ram6
>  (driver?)
> 0107            4096 ram7
>  (driver?)
> 0108            4096 ram8
>  (driver?)
> 0109            4096 ram9
>  (driver?)
> 010a            4096 ram10
>  (driver?)
> 010b            4096 ram11
>  (driver?)
> 010c            4096 ram12
>  (driver?)
> 010d            4096 ram13
>  (driver?)
> 010e            4096 ram14
>  (driver?)
> 010f            4096 ram15
>  (driver?)
> 1f00           65536 mtdblock0
>  (driver?)
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
>
> I assume this is related to the content in fstab of RaspiOS:
> proc            /proc           proc    defaults          0       0
> PARTUUID=3D907af7d0-01  /boot           vfat    defaults          0      =
 2
> PARTUUID=3D907af7d0-02  /               ext4    defaults,noatime  0      =
 1
>
> Can you please advise how to fix this error?
>
> THX


--=20
Alex Benn=C3=A9e
