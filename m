Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp117865nji;
        Tue, 27 Aug 2024 06:05:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsiYcKu0PENFpqxTqB2eT5yiKkw0t4rccsQm7YqFvHkYJjrfhjG6zgjR0kj4G1ZcGH8zS3RzcSiSGggg==@linaro.org
X-Received: by 2002:a17:90a:4cc2:b0:2d3:b93d:ba48 with SMTP id 98e67ed59e1d1-2d646bd1a27mr16079880a91.8.1724763922180;
        Tue, 27 Aug 2024 06:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724763922; cv=none;
        d=google.com; s=arc-20160816;
        b=zBg/PyLzQ0FhX0NQHINCvjZFAD4Qa/KjRzks9z5rMpjYWR1ifJapLcSBHurFAqzpqz
         +hpA7lVnROceS/Nbe8TqiangVqzPSr/F6AFA/2aOkiv/i7mewbifmUFBNTbRPTV7xJlt
         biBnYoEz2j0lcKcGKllDsDGMBg6+UEnmbIjYVdoH8XZxpLLiSSPFmwucuJE1ut9GcbXa
         2DTBipBW+z9HwPuNRSvpkyRoD6AHlN/GAbNI1AS2auxFbFkY4HCQI1csQu437l51fD8X
         Is4tPnTkI8YBKNDBpJgyCYhqeIpl4kKJ191d7lB3L8wBFjx1xdUgpMWt3be1zzVLiPvM
         jX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0cQuc9j5e1c9dQHvnIExvCRn/iX2ozRrQz5pEat9fAM=;
        fh=djexxpJyHHwV3SFVrxxH+tx9ugFbgSGsJOq4PI4RWUw=;
        b=MqOyiKg57TLXfEpSZJ0aCG2C+6Qo4HjUjkZTjtJIGHO5XFhAgCLRX4gwhZssRzX4GN
         M8EtZodTY66wQFBEb/6BihTRPpDKL/wzBgCVI8MKm1pTrB44BdULoS+WsgzMMMwS+sZv
         NBdRAzCO+WlMzzB5Jw7KXOtB6qEVSSav4eNL0QZK4f/d1U7xNohJKIc6ugteWC6a1U2+
         UBsGIHk8NhaT0pIl7rPrlpX+u8WqWLTvRjVPrpvqohqPpWq2q8ECU550Cmz7S5X9/hL6
         /Y4irdmBO5viLuAX5XOLoqVJw9d1YDFpQs/wxWkt+xKKfKdBYaPhc40uaAwi9HVGvH0q
         pf4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wu3V0Dpi;
       spf=pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marietto2008@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <marietto2008@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2d61555ad54sor7113347a91.8.2024.08.27.06.05.21
        (Google Transport Security);
        Tue, 27 Aug 2024 06:05:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wu3V0Dpi;
       spf=pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marietto2008@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724763921; x=1725368721; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0cQuc9j5e1c9dQHvnIExvCRn/iX2ozRrQz5pEat9fAM=;
        b=Wu3V0DpiaJnBQpFDaLhH324MbXVqYHV6MemZSzOSi9lwv2LzMnP79spb+VrC2DUr4j
         84y7h+4AaieicQK0rBqq7UhmSpLyRXt+eBXQQkt6IMnE8gr49gsBSOf77vK6DcXM2V/H
         lnHWU56rUms61wn91l6EcGAy9N9WZnyaiXERI9BKBDZnmO1qfKa5V+E85YcRPeGDqf2T
         H6ZXEr0/kxJ8ZnRSLSUT9i4itwDujJsB+HFBmHD03G8kQgnfZuU9jK9g7VC26tW0keOE
         NbSBR1hiS8ZbVSv8IRQO8BjeA0oby8rVrw2wt5FKzRANyGYICySoXbJoEB0+U4OYkTP+
         XqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763921; x=1725368721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cQuc9j5e1c9dQHvnIExvCRn/iX2ozRrQz5pEat9fAM=;
        b=lQGrIdjrY4PsPrgSKwlyg5Z6pT0oBMngg1sl9pG4D4fxGgFgs841vokqYoYqx4WgHg
         gu2IbT4aft19ejoeH+HDTBRvn6pgWI7rAwO3LsZFcxFgP0t0r/C+y2J+YBFv8BHO+2pT
         KsBFcdMSrGZB1uXZ1sOxjdmxGPif89QoQz/e4zd0f/7Mtap4lkqtneYLKZ7Y7o5DFQl7
         K5QikznaktnK4uMnDi08loqZ0XOdy48QQl+rDJ8wmFiYA9sq2SO2NMGISd/urNRYvISQ
         zeuXU5QQw/ywibGpSJawJvXEaITx/7BbSYF2AJLz5hPzlqPv1WfmWZuqIRxBRrDp5Gyv
         PtVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYCTLNN867UxSF9mxigjplBWmOdi5BRL4T13R/1GHRunzWIWmMjYrFV24g6TzMX1SqVzHOrviSPhSP2w==@linaro.org
X-Gm-Message-State: AOJu0Yyuek4FXrl++0hulfyBuciw9NpnEfnbaCkItmy/+GpDTQZsCJid
	KzJvo5QDWDHYjzMZHfEpjTV8hNIHYZJ8pffAvoswFLE9f6v01cnvR7eGtOJo2OSfZDF195KqQfo
	dWz+g77FDDb9pyY9byTnDaF21XxxgZ/jGMJ0=
X-Google-Smtp-Source: AGHT+IFGDwbhPyzKzOjfg4QjUmKH2wIric8W4cGjcA3AQBqS0DsYcUki5DKwHVbQOuj2JShfwnbChf2igiA+IECfA08=
X-Received: by 2002:a17:90a:4cc7:b0:2cd:2992:e8dc with SMTP id
 98e67ed59e1d1-2d646bd1741mr14298542a91.5.1724763920453; Tue, 27 Aug 2024
 06:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <CAFEAcA8J18z8WubfzLu-DmTp6vGwcy4D652ib-KReqNS0whMVA@mail.gmail.com>
 <CA+1FSiir=RG1BTKF29BKxmO+GWDieyW6TxzWtdEX-CYu7a+z5g@mail.gmail.com>
 <CA+1FSij3LJc9S2ChBY-pHZ8QacFt2P0ygsr9LRK9FXLyMJrorQ@mail.gmail.com>
 <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
 <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
 <CAFEAcA_zRSgFhs+kauEfkyzAYg2RwSBrkagDEoj5OCgm5j6=iQ@mail.gmail.com>
 <CA+1FSigzZxzdgTCWNRz3UGgTH5mRN8XTWWkeTU20N2ey4a+i+Q@mail.gmail.com>
 <CA+1FSigqsAx_s+-_eP0GtSi7Qq6Vcou12gHcGZwqPk1hhnXXwg@mail.gmail.com>
 <CA+1FSiiYm03SmjMaR0dLKye7j+LR4V-=u=nQu66=_aTrLVUpPg@mail.gmail.com> <CA+1FSigvsXe7eo17_qdKaY0Uo68u7Ep3UacooHZDNCnWJHD4+w@mail.gmail.com>
In-Reply-To: <CA+1FSigvsXe7eo17_qdKaY0Uo68u7Ep3UacooHZDNCnWJHD4+w@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 27 Aug 2024 15:04:43 +0200
Message-ID: <CA+1FSiiFFjp8O_D=PaGuZMj8oPYLdx5i-+Aq=S7=AZjZmb_aOw@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "cc: Sergey Kambalin" <sergey.kambalin@auriga.com>, 
	qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ccd7e40620a9e43a"
X-TUID: 4D0RYS6Q2MQj

--000000000000ccd7e40620a9e43a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello to everyone.

As I said before,some years ago I was able to emulate Android on my Jetson
Nano. It was a special version of Android,prepared by antmicro and the
github is located here :

https://github.com/antmicro/kvm-aosp-jetson-nano

I would like to compile it again and try to emulate it on my Jetson Nano
again and on my Intel PC + Ubuntu 24.04 x64 bit.
I followed the tutorial again and I've been able to create the Android img
files below without problems :


out/target/product/generic_arm64/vendor.img
out/target/product/generic_arm64/system.img
out/target/product/generic_arm64/userdata.img
out/target/product/generic_arm64/ramdisk.img

Now I need the kernel,so I tried to fetch the kernel sources to compile it.
Unfortunately the github is old and some links are broken.
I want to ask your help to fix the broken link as better as possible :

root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo init -u
https://android.googlesource.com/kernel/manifest -b q-common-android-4.14

Downloading Repo source from https://gerrit.googlesource.com/git-repo

Your identity is: ziomario <marietto2008@gmail.com>
If you want to change this, please re-run 'repo init' with --config-name

repo has been initialized in /mnt/sdl1/aosp_kernel

root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync


Fetching:  0% (0/8) 0:07 | 2 jobs | 0:05 kernel/build @ buildRicezione
degli oggetti:  84% (14706/17

Fetching:  0% (0/8) 0:07 | 2 jobs | 0:06 kernel/build @ buildRicezione
degli oggetti:  85% (14881/17
Ricezione degli oggetti: 100% (17506/17506), 12.23 MiB | 46.57 MiB/s,
fatto.
Risoluzione dei delta: 100% (8869/8869), fatto.
Fetching: 50% (4/8) 9:11 | 1 job | 9:01 kernel/common @ commonRicezione
degli oggetti:   0% (1/12468
Fetching: 50% (4/8) 9:12 | 1 job | 9:02 kernel/common @ commonRicezione
degli oggetti:   0% (80382/1
Fetching: 50% (4/8) 9:12 | 1 job | 9:03 kernel/common @ commonRicezione
degli oggetti:   1% (124682/
Fetching: 50% (4/8) 9:13 | 1 job | 9:03 kernel/common @ commonRicezione
degli oggetti:   1% (163592/
Fetching: 50% (4/8) 9:14 | 1 job | 9:04 kernel/common @ commonRicezione
degli oggetti:   1% (245123/
Fetching: 50% (4/8) 9:15 | 1 job | 9:05 kernel/common @ commonRicezione
degli oggetti:   2% (333147/
Fetching: 50% (4/8) 9:15 | 1 job | 9:06 kernel/common @ commonRicezione
degli oggetti:   3% (374044/
.....
Fetching: 50% (4/8) 12:06 | 1 job | 11:57 kernel/common @ commonRisoluzione
dei delta:  98% (1023355
Fetching: 50% (4/8) 12:07 | 1 job | 11:58 kernel/common @ commonRisoluzione
dei delta:  99% (1028207
Fetching: 50% (4/8) 12:08 | 1 job | 11:59 kernel/common @ commonRisoluzione
dei delta: 100% (1034277
Risoluzione dei delta: 100% (10342775/10342775), fatto.

Fetching: 50% (4/8) 13:44 | 1 job | 13:34 kernel/common @ common


fatal: can't find remote refs/heads/android-4.14-q

kernel/common:

kernel/common: sleeping 4.0 seconds before retrying

error: Cannot fetch kernel/common from
https://android.googlesource.com/kernel/common


Fetching: 50% (4/8) 13:45 | 1 job | 0:01 kernel/tests @ kernel/tests

Ricezione degli oggetti:


Ricezione degli oggetti: 100% (11797/11797), 4.91 MiB | 48.34 MiB/s, fatto.
Risoluzione dei delta: 100% (2123/2123), fatto.
Fetching: 100% (8/8), done in 18m26.961s
Fetching:  0% (0/1) 0:04 | 1 job | 0:04 kernel/common @ common
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q

kernel/common:
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
kernel/common: sleeping 4.0 seconds before retrying
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
error: Cannot fetch kernel/common from
https://android.googlesource.com/kernel/common
Fetching: 100% (1/1), done in 5.046s
error: Cannot checkout kernel/common: ManifestInvalidRevisionError:
revision android-4.14-q in kernel/common not found
error: in `sync`: revision android-4.14-q in kernel/common not found
root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
Fetching:  0% (0/8) 0:09 | 2 jobs | 0:07 kernel/common @ common
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q

kernel/common:
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
kernel/common: sleeping 4.0 seconds before retrying
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
error: Cannot fetch kernel/common from
https://android.googlesource.com/kernel/common
Fetching: 100% (8/8), done in 12.927s
Fetching:  0% (0/1) 0:04 | 1 job | 0:04 kernel/common @ common
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q

kernel/common:
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
kernel/common: sleeping 4.0 seconds before retrying
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
error: Cannot fetch kernel/common from
https://android.googlesource.com/kernel/common
Fetching: 100% (1/1), done in 5.008s
error: Cannot checkout kernel/common: ManifestInvalidRevisionError:
revision android-4.14-q in kernel/common not found
error: in `sync`: revision android-4.14-q in kernel/common not found
root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
Fetching: 50% (4/8) 0:04 | 1 job | 0:03 kernel/common @ common
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q

kernel/common:
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
kernel/common: sleeping 4.0 seconds before retrying
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
error: Cannot fetch kernel/common from
https://android.googlesource.com/kernel/common
Fetching: 100% (8/8), done in 5.696s
Fetching:  0% (0/1) 0:04 | 1 job | 0:04 kernel/common @ common
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
kernel/common:
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
kernel/common: sleeping 4.0 seconds before retrying
fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-q
error: Cannot fetch kernel/common from
https://android.googlesource.com/kernel/common
Fetching: 100% (1/1), done in 4.930s
error: Cannot checkout kernel/common: ManifestInvalidRevisionError:
revision android-4.14-q in kernel/common not found
error: in `sync`: revision android-4.14-q in kernel/common not found

thanks.


On Sun, Aug 25, 2024 at 5:58=E2=80=AFPM Mario Marietto <marietto2008@gmail.=
com>
wrote:

> ok,I've understood that initrd is ramdisk.img,so :
>
> qemu-system-aarch64 \
>         -smp 4 \
>         -m 2048 \
>         -cpu cortex-a72 \
>         -machine virt \
>         -initrd
> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-r=
pi4-atv/boot/ramdisk.img
> \
>         -kernel
> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-r=
pi4-atv/boot/Image
> \
>         -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>         -display sdl,gl=3Don \
>         -device usb-ehci \
>         -device usb-kbd \
>         -device virtio-tablet-pci \
>         -usb \
>         -serial stdio \
>         -drive
> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/lineag=
e-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/lineage-21.0-20240618-UNOFFI=
CIAL-KonstaKANG-rpi4-atv.img,format=3Draw,index=3D0,media=3Ddisk
> \
>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdel=
ay=3D5
> root=3D/dev/vdd1 rw"
>
> =3D=3D=3D=3D=3D=3D>
>
> [    2.862352] Run /init as init process
> [    3.119264] magiskinit: open /proc/bootconfig failed with 2: No such
> file or directory
> [    4.741230] init: init first stage started!
> [    4.754789] init: Unable to open /lib/modules, skipping module loading=
.
> [    4.788159] init: Copied ramdisk prop to
> /second_stage_resources/system/etc/ramdisk/build.prop
> [    4.804110] init: [libfstab] Using Android DT directory
> /proc/device-tree/firmware/android/
> [    4.811371] init: [libfstab] ReadFstabFromDt(): failed to read fstab
> from dt
> [    4.825409] init: [libfstab] ReadDefaultFstab(): failed to find device
> default fstab
> [    4.828176] init: Failed to create FirstStageMount : failed to read
> default fstab for first stage mount
> [    4.831564] init: FirstStageMount not available
> [    4.890952] init: InitFatalReboot: signal 6
> [    5.063207] init:   #00 pc 00000000003b7764  /init
> (unwindstack::AndroidLocalUnwinder::InternalUnwind(std::__1::optional<int=
>,
> unwin
> dstack::AndroidUnwinderData&)+96) (BuildId:
> 48bce72d2f0c6e6c34530a67b6b7b3be)
> [    5.064741] init:   #01 pc 00000000003ab4b8  /init
> (android::init::InitFatalReboot(int)+204) (BuildId:
> 48bce72d2f0c6e6c34530a67b6b7b
> 3be)
> [    5.066931] init:   #02 pc 00000000003abb48  /init
> (android::init::InstallRebootSignalHandlers()::$_0::__invoke(int)+32)
> (BuildId: 4
> 8bce72d2f0c6e6c34530a67b6b7b3be)
> [    5.068545] init:   #03 pc 0000000000000854  [vdso]
> [    5.069555] init:   #04 pc 000000000035285c  /init (abort+164)
> (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
> [    5.072153] init:   #05 pc 00000000003b029c  /init
> (android::init::InitAborter(char const*)+44) (BuildId:
> 48bce72d2f0c6e6c34530a67b6
> b7b3be)
> [    5.075216] init:   #06 pc 00000000003131d0  /init
> (android::base::SetAborter(std::__1::function<void (char
> const*)>&&)::$_0::__invo
> ke(char const*)+80) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
> [    5.077609] init:   #07 pc 00000000003128f4  /init
> (android::base::LogMessage::~LogMessage()+356) (BuildId:
> 48bce72d2f0c6e6c34530a67
> b6b7b3be)
> [    5.079506] init:   #08 pc 00000000003a1ec0  /init
> (android::init::FirstStageMain(int, char**)+13140) (BuildId:
> 48bce72d2f0c6e6c3453
> 0a67b6b7b3be)
> [    5.081404] init:   #09 pc 0000000000350e9c  /init
> (__real_libc_init(void*, void (*)(), int (*)(int, char**, char**),
> structors_arra
> y_t const*, bionic_tcb*)+688) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
> [    5.083648] init: Reboot ending, jumping to kernel
> [    5.091556] reboot: Restarting system with command 'bootloader'
>
>
>
> On Sun, Aug 25, 2024 at 3:31=E2=80=AFPM Mario Marietto <marietto2008@gmai=
l.com>
> wrote:
>
>> The file below is called config.txt and it's available only if Android i=
s
>> installed physically. I don't see it when I unpack the main img file.
>> Probably it is embedded inside the file 0.fat,or 1.img,who knows. Anyway=
,Is
>> useful to understand what's the name of the initrd file. Actually I trie=
d
>> to use 0.fat,but I think it's wrong. Can you give a look at the file bel=
ow
>> and tell me if it could be "ramdisk.img" ?
>>
>> # Kernel
>> arm_64bit=3D1
>> kernel=3DImage
>>
>> # Ramdisk
>> gpio=3D21=3Dip,pu
>> [gpio21=3D1]
>> initramfs ramdisk.img followkernel
>> [gpio21=3D0]
>> initramfs ramdisk-recovery.img followkernel
>> [all]
>>
>> # Audio
>> dtparam=3Daudio=3Don
>>
>> # Audio DAC
>> #dtoverlay=3Dallo-boss-dac-pcm512x-audio
>> #dtoverlay=3Dallo-piano-dac-pcm512x-audio
>> #dtoverlay=3Dallo-piano-dac-plus-pcm512x-audio
>> #dtoverlay=3Dhifiberry-dacplus
>> #dtoverlay=3Di-sabre-q2m
>> #dtoverlay=3Diqaudio-dac
>> #dtoverlay=3Djustboom-dac
>>
>> # Boot device
>> dtoverlay=3Dandroid-sdcard
>> #dtoverlay=3Dandroid-usb
>> #dtoverlay=3Dandroid-nvme
>>
>> # Camera
>> camera_auto_detect=3D1
>> start_x=3D1
>>
>> # CPU
>> arm_boost=3D1
>> #arm_freq=3D1500
>>
>> # Display
>> disable_overscan=3D1
>>
>> # Display panel
>> [gpio21=3D1]
>> #dtoverlay=3Dcutiepi-panel
>> #dtoverlay=3Dvc4-kms-dsi-7inch
>> #dtoverlay=3Dvc4-kms-dsi-lt070me05000
>> #dtoverlay=3Dvc4-kms-dsi-lt070me05000-v2
>> [all]
>> #dtoverlay=3Drpi-backlight
>>
>> # Fan
>> #dtoverlay=3Dgpio-fan
>> #dtoverlay=3Di2c-fan
>> #dtoverlay=3Drpi-poe
>> #dtoverlay=3Drpi-poe-plus
>>
>> # Graphics acceleration
>> disable_fw_kms_setup=3D1
>> [gpio21=3D1]
>> dtoverlay=3Dvc4-kms-v3d
>> [all]
>>
>> # I2C
>> dtparam=3Di2c_arm=3Don
>>
>> # I2S
>> #dtparam=3Di2s=3Don
>>
>> # IR
>> #dtoverlay=3Dgpio-ir,gpio_pin=3D18
>>
>> # Keys
>> #dtoverlay=3Dgpio-key,gpio=3D21,keycode=3D116,label=3D"POWER"
>> #dtoverlay=3Dgpio-key,gpio=3D26,keycode=3D115,label=3D"VOLUME_UP"
>> #dtoverlay=3Dgpio-key,gpio=3D20,keycode=3D114,label=3D"VOLUME_DOWN"
>>
>> # RTC
>> dtoverlay=3Di2c-rtc,ds3231
>>
>> # Sensors
>> #dtoverlay=3Dandroid-i2c-sensor,mpu6050
>>
>> # Serial console
>> #enable_uart=3D1
>>
>> # SPI
>> dtparam=3Dspi=3Don
>>
>> # Touchscreen
>>
>> #dtoverlay=3Dads7846,cs=3D1,penirq=3D25,penirq_pull=3D2,speed=3D50000,ke=
ep_vref_on=3D0,swapxy=3D0,pmax=3D255,xohms=3D150,xmin=3D200,xmax=3D3900,ymi=
n=3D200,ymax=3D3900
>> #dtoverlay=3Dedt-ft5406
>> #dtoverlay=3Dgoodix
>> #dtoverlay=3Drpi-ft5406
>>
>> # USB
>> dtoverlay=3Ddwc2,dr_mode=3Dperipheral
>> [cm4]
>> dtoverlay=3Ddwc2,dr_mode=3Dotg
>> [all]
>>
>> include config_user.txt
>>
>> On Sun, Aug 25, 2024 at 2:44=E2=80=AFPM Mario Marietto <marietto2008@gma=
il.com>
>> wrote:
>>
>>> Appending the root device does not change the scenario :
>>>
>>> qemu-system-aarch64 \
>>>         -smp 4 \
>>>         -m 2048 \
>>>         -cpu cortex-a72 \
>>>         -machine virt \
>>>         -serial stdio \
>>>         -initrd
>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG=
-rpi4-atv/0.fat
>>> \
>>>         -kernel
>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG=
-rpi4-atv/boot/Image
>>> \
>>>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait
>>> rootdelay=3D5 root=3D/dev/vdd1 rw"
>>>
>>>
>>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
>>> [    0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@build-host)
>>> (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928)
>>> clang version 18.0.0 (
>>> https://android.googlesource.com/toolchain/llvm-project
>>> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #
>>> 1 SMP PREEMPT Tue Jul  2 09:02:32 UTC 2024
>>> [    0.000000] KASLR enabled
>>> [    0.000000] random: crng init done
>>> [    0.000000] Machine model: linux,dummy-virt
>>> [    0.000000] efi: UEFI not found.
>>> [    0.000000] Zone ranges:
>>> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff]
>>> [    0.000000]   DMA32    empty
>>> [    0.000000]   Normal   empty
>>> [    0.000000] Movable zone start for each node
>>> [    0.000000] NoSplit zone start for each node
>>> [    0.000000] NoMerge zone start for each node
>>> [    0.000000] Early memory node ranges
>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
>>> [    0.000000] Initmem setup node 0 [mem
>>> 0x0000000040000000-0x00000000bfffffff]
>>> [    0.000000] cma: Reserved 8 MiB at 0x00000000bd000000 on node -1
>>> [    0.000000] psci: probing for conduit method from DT.
>>> [    0.000000] psci: PSCIv1.1 detected in firmware.
>>> [    0.000000] psci: Using standard PSCI v0.2 function IDs
>>> [    0.000000] psci: Trusted OS migration not required
>>> [    0.000000] psci: SMC Calling Convention v1.0
>>> [    0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d31768 u12697=
6
>>> [    0.000000] Detected PIPT I-cache on CPU0
>>> [    0.000000] CPU features: detected: Spectre-v2
>>> [    0.000000] CPU features: detected: Spectre-v3a
>>> [    0.000000] CPU features: detected: Spectre-v4
>>> [    0.000000] CPU features: detected: Spectre-BHB
>>> [    0.000000] CPU features: kernel page table isolation forced ON by
>>> KASLR
>>> [    0.000000] CPU features: detected: Kernel page table isolation
>>> (KPTI)
>>> [    0.000000] CPU features: detected: ARM erratum 1742098
>>> [    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or
>>> 1530923
>>> [    0.000000] alternatives: applying boot alternatives
>>> [    0.000000] Kernel command line: console=3DttyAMA0,38400 drm.debug=
=3D0x0
>>> rootwait rootdelay=3D5 root=3D/dev/vdd1 rw androidboot.serialno=3D100
>>> 00000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66
>>> [    0.000000] Dentry cache hash table entries: 262144 (order: 9,
>>> 2097152 bytes, linear)
>>> [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 104857=
6
>>> bytes, linear)
>>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
>>> 516096
>>> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap
>>> free:off
>>> [    0.000000] Memory: 1881596K/2097152K available (19328K kernel code,
>>> 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 207364K rese
>>> rved, 8192K cma-reserved)
>>> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
4,
>>> Nodes=3D1
>>> [    0.000000] ftrace: allocating 56269 entries in 220 pages
>>> [    0.000000] ftrace: allocated 220 pages with 5 groups
>>> [    0.000000] trace event string verifier disabled
>>> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>>> [    0.000000] rcu:     RCU event tracing is enabled.
>>> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to
>>> nr_cpu_ids=3D4.
>>> [    0.000000]  Trampoline variant of Tasks RCU enabled.
>>> [    0.000000]  Rude variant of Tasks RCU enabled.
>>> [    0.000000]  Tracing variant of Tasks RCU enabled.
>>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
>>> is 25 jiffies.
>>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
>>> nr_cpu_ids=3D4
>>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>>> [    0.000000] Root IRQ handler: gic_handle_irq
>>> [    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
>>> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
>>> contention.
>>> [    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
>>> [    0.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff
>>> max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
>>> [    0.000069] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps
>>> every 4398046511096ns
>>> [    0.003628] kfence: initialized - using 2097152 bytes for 255 object=
s
>>> at 0x(____ptrval____)-0x(____ptrval____)
>>> [    0.010906] Calibrating delay loop (skipped), value calculated using
>>> timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
>>> [    0.011082] pid_max: default: 32768 minimum: 301
>>> [    0.013020] LSM: initializing lsm=3Dcapability,selinux,integrity
>>> [    0.013436] SELinux:  Initializing.
>>> [    0.016921] Mount-cache hash table entries: 4096 (order: 3, 32768
>>> bytes, linear)
>>> [    0.016984] Mountpoint-cache hash table entries: 4096 (order: 3,
>>> 32768 bytes, linear)
>>> [    0.031469] cgroup: Disabling memory control group subsystem
>>> [    0.050059] cacheinfo: Unable to detect cache hierarchy for CPU 0
>>> [    0.059978] RCU Tasks: Setting shift to 2 and lim to 1
>>> rcu_task_cb_adjust=3D1.
>>> [    0.060584] RCU Tasks Rude: Setting shift to 2 and lim to 1
>>> rcu_task_cb_adjust=3D1.
>>> [    0.060822] RCU Tasks Trace: Setting shift to 2 and lim to 1
>>> rcu_task_cb_adjust=3D1.
>>> [    0.062427] rcu: Hierarchical SRCU implementation.
>>> [    0.062463] rcu:     Max phase no-delay instances is 1000.
>>> [    0.068568] EFI services will not be available.
>>> [    0.071086] smp: Bringing up secondary CPUs ...
>>> [    0.074801] Detected PIPT I-cache on CPU1
>>> [    0.075909] CPU1: Booted secondary processor 0x0000000001
>>> [0x410fd083]
>>> [    0.081065] Detected PIPT I-cache on CPU2
>>> [    0.081470] CPU2: Booted secondary processor 0x0000000002
>>> [0x410fd083]
>>> [    0.083873] Detected PIPT I-cache on CPU3
>>> [    0.084168] CPU3: Booted secondary processor 0x0000000003
>>> [0x410fd083]
>>> [    0.084681] smp: Brought up 1 node, 4 CPUs
>>> [    0.084715] SMP: Total of 4 processors activated.
>>> [    0.084800] CPU features: detected: 32-bit EL0 Support
>>> [    0.084824] CPU features: detected: 32-bit EL1 Support
>>> [    0.084885] CPU features: detected: CRC32 instructions
>>> [    0.088191] CPU features: emulated: Privileged Access Never (PAN)
>>> using TTBR0_EL1 switching
>>> [    0.088512] CPU: All CPU(s) started at EL1
>>> [    0.088714] alternatives: applying system-wide alternatives
>>> [    0.113756] devtmpfs: initialized
>>> [    0.126262] Enabled cp15_barrier support
>>> [    0.126449] Enabled setend support
>>> [    0.127708] clocksource: jiffies: mask: 0xffffffff max_cycles:
>>> 0xffffffff, max_idle_ns: 7645041785100000 ns
>>> [    0.127840] futex hash table entries: 1024 (order: 4, 65536 bytes,
>>> linear)
>>> [    0.131302] pinctrl core: initialized pinctrl subsystem
>>> [    0.138216] DMI not present or invalid.
>>> [    0.147664] NET: Registered PF_NETLINK/PF_ROUTE protocol family
>>> [    0.158502] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
>>> allocations
>>> [    0.158987] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for
>>> atomic allocations
>>> [    0.159303] audit: initializing netlink subsys (disabled)
>>> [    0.161302] audit: type=3D2000 audit(0.148:1): state=3Dinitialized
>>> audit_enabled=3D0 res=3D1
>>> [    0.164412] thermal_sys: Registered thermal governor 'step_wise'
>>> [    0.164806] cpuidle: using governor menu
>>> [    0.165816] hw-breakpoint: found 6 breakpoint and 4 watchpoint
>>> registers.
>>> [    0.166975] ASID allocator initialised with 32768 entries
>>> [    0.168385] Serial: AMBA PL011 UART driver
>>> [    0.196712] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13,
>>> base_baud =3D 0) is a PL011 rev1
>>> [    0.198278] printk: console [ttyAMA0] enabled
>>> [    0.224278] Modules: 2G module region forced by
>>> RANDOMIZE_MODULE_REGION_FULL
>>> [    0.224486] Modules: 0 pages in range for non-PLT usage
>>> [    0.224510] Modules: 516176 pages in range for PLT usage
>>> [    0.241442] iommu: Default domain type: Translated
>>> [    0.241679] iommu: DMA domain TLB invalidation policy: strict mode
>>> [    0.244200] SCSI subsystem initialized
>>> [    0.245459] usbcore: registered new interface driver usbfs
>>> [    0.245841] usbcore: registered new interface driver hub
>>> [    0.246154] usbcore: registered new device driver usb
>>> [    0.247257] mc: Linux media interface: v0.10
>>> [    0.247617] videodev: Linux video capture interface: v2.00
>>> [    0.248602] pps_core: LinuxPPS API ver. 1 registered
>>> [    0.248700] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
>>> Rodolfo Giometti <giometti@linux.it>
>>> [    0.248967] PTP clock support registered
>>> [    0.251884] Advanced Linux Sound Architecture Driver Initialized.
>>> [    0.262663] Bluetooth: Core ver 2.22
>>> [    0.262960] NET: Registered PF_BLUETOOTH protocol family
>>> [    0.263069] Bluetooth: HCI device and connection manager initialized
>>> [    0.263344] Bluetooth: HCI socket layer initialized
>>> [    0.263516] Bluetooth: L2CAP socket layer initialized
>>> [    0.263840] Bluetooth: SCO socket layer initialized
>>> [    0.266790] vgaarb: loaded
>>> [    0.268841] clocksource: Switched to clocksource arch_sys_counter
>>> [    0.272056] VFS: Disk quotas dquot_6.6.0
>>> [    0.272284] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
>>> bytes)
>>> [    0.273060] FS-Cache: Loaded
>>> [    0.278526] CacheFiles: Loaded
>>> [    0.287007] NET: Registered PF_INET protocol family
>>> [    0.288390] IP idents hash table entries: 32768 (order: 6, 262144
>>> bytes, linear)
>>> [    0.297021] tcp_listen_portaddr_hash hash table entries: 1024 (order=
:
>>> 2, 16384 bytes, linear)
>>> [    0.297273] Table-perturb hash table entries: 65536 (order: 6, 26214=
4
>>> bytes, linear)
>>> [    0.297485] TCP established hash table entries: 16384 (order: 5,
>>> 131072 bytes, linear)
>>> [    0.298036] TCP bind hash table entries: 16384 (order: 7, 524288
>>> bytes, linear)
>>> [    0.298873] TCP: Hash tables configured (established 16384 bind
>>> 16384)
>>> [    0.301283] MPTCP token hash table entries: 2048 (order: 3, 49152
>>> bytes, linear)
>>> [    0.301759] UDP hash table entries: 1024 (order: 3, 32768 bytes,
>>> linear)
>>> [    0.302186] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes=
,
>>> linear)
>>> [    0.304009] NET: Registered PF_UNIX/PF_LOCAL protocol family
>>> [    0.306868] PCI: CLS 0 bytes, default 64
>>> [    0.312145] Trying to unpack rootfs image as initramfs...
>>> [    0.312808] kvm [1]: HYP mode not available
>>> [    0.318856] rootfs image is not initramfs (invalid magic at start of
>>> compressed archive); looks like an initrd
>>> [    0.335544] Initialise system trusted keyrings
>>> [    0.338430] workingset: timestamp_bits=3D46 max_order=3D19 bucket_or=
der=3D0
>>> [    0.339134] zbud: loaded
>>> [    0.347742] Key type cifs.idmap registered
>>> [    0.348673] fuse: init (API version 7.39)
>>> [    0.386722] Key type asymmetric registered
>>> [    0.386992] Asymmetric key parser 'x509' registered
>>> [    0.387460] Block layer SCSI generic (bsg) driver version 0.4 loaded
>>> (major 244)
>>> [    0.388796] io scheduler mq-deadline registered
>>> [    0.388954] io scheduler kyber registered
>>> [    0.389319] io scheduler bfq registered
>>> [    0.406358] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000
>>> mem_size:0x00000000(0 MiB)
>>> [    0.476330] brd: module loaded
>>> [    0.508286] loop: module loaded
>>> [    0.512092] Loading iSCSI transport class v2.0-870.
>>> [    0.522449] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com
>>> for information.
>>> [    0.522729] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <
>>> Jason@zx2c4.com>. All Rights Reserved.
>>> [    0.538429] tun: Universal TUN/TAP device driver, 1.6
>>> [    0.541953] usbcore: registered new interface driver brcmfmac
>>> [    0.542290] usbcore: registered new device driver r8152-cfgselector
>>> [    0.542675] usbcore: registered new interface driver r8152
>>> [    0.542971] usbcore: registered new interface driver lan78xx
>>> [    0.543488] usbcore: registered new interface driver asix
>>> [    0.543810] usbcore: registered new interface driver ax88179_178a
>>> [    0.544134] usbcore: registered new interface driver cdc_ether
>>> [    0.544609] usbcore: registered new interface driver smsc95xx
>>> [    0.544909] usbcore: registered new interface driver net1080
>>> [    0.545240] usbcore: registered new interface driver cdc_subset
>>> [    0.545596] usbcore: registered new interface driver zaurus
>>> [    0.545896] usbcore: registered new interface driver cdc_ncm
>>> [    0.546192] usbcore: registered new interface driver r8153_ecm
>>> [    0.547442] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
>>> [    0.550591] usbcore: registered new interface driver cdc_acm
>>> [    0.550756] cdc_acm: USB Abstract Control Model driver for USB modem=
s
>>> and ISDN adapters
>>> [    0.551948] usbcore: registered new interface driver uas
>>> [    0.552352] usbcore: registered new interface driver usb-storage
>>> [    0.566050] usbcore: registered new interface driver cp210x
>>> [    0.566791] usbserial: USB Serial support registered for cp210x
>>> [    0.567318] usbcore: registered new interface driver pl2303
>>> [    0.567653] usbserial: USB Serial support registered for pl2303
>>> [    0.573531] mousedev: PS/2 mouse device common for all mice
>>> [    0.573930] usbcore: registered new interface driver xpad
>>> [    0.574228] usbcore: registered new interface driver usb_acecad
>>> [    0.574588] usbcore: registered new interface driver aiptek
>>> [    0.574937] usbcore: registered new interface driver hanwang
>>> [    0.575292] usbcore: registered new interface driver kbtab
>>> [    0.577388] usbcore: registered new interface driver usbtouchscreen
>>> [    0.580179] i2c_dev: i2c /dev entries driver
>>> [    0.584010] ir_imon_decoder: IR iMON protocol handler initialized
>>> [    0.584179] IR JVC protocol handler initialized
>>> [    0.584296] IR MCE Keyboard/mouse protocol handler initialized
>>> [    0.584435] IR NEC protocol handler initialized
>>> [    0.584734] IR RC5(x/sz) protocol handler initialized
>>> [    0.584863] IR RC6 protocol handler initialized
>>> [    0.584991] IR RCMM protocol handler initialized
>>> [    0.585111] IR SANYO protocol handler initialized
>>> [    0.585226] IR Sharp protocol handler initialized
>>> [    0.585358] IR Sony protocol handler initialized
>>> [    0.585477] IR XMP protocol handler initialized
>>> [    0.586421] usbcore: registered new interface driver uvcvideo
>>> [    0.589015] device-mapper: uevent: version 1.0.3
>>> [    0.590448] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01)
>>> initialised: dm-devel@redhat.com
>>> [    0.591924] Bluetooth: HCI UART driver ver 2.3
>>> [    0.592106] Bluetooth: HCI UART protocol H4 registered
>>> [    0.592885] Bluetooth: HCI UART protocol Broadcom registered
>>> [    0.594293] sdhci: Secure Digital Host Controller Interface driver
>>> [    0.594442] sdhci: Copyright(c) Pierre Ossman
>>> [    0.594948] sdhci-pltfm: SDHCI platform and OF driver helper
>>> [    0.596987] ledtrig-cpu: registered to indicate activity on CPUs
>>> [    0.599350] hid: raw HID events driver (C) Jiri Kosina
>>> [    0.612270] usbcore: registered new interface driver usbhid
>>> [    0.612441] usbhid: USB HID core driver
>>> [    0.615743] ashmem: initialized
>>> [    0.617297] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis302dl-spi
>>> [    0.617473] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis3lv02dl-accel
>>> [    0.617626] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis3dh-accel
>>> [    0.617769] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm330d-accel
>>> [    0.617919] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm330dl-accel
>>> [    0.618062] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm330dlc-accel
>>> [    0.618206] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis331dlh-accel
>>> [    0.618357] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm330-accel
>>> [    0.618493] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm303agr-accel
>>> [    0.618638] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis2dh12-accel
>>> [    0.618775] SPI driver st-accel-spi has no spi_device_id for
>>> st,lng2dm-accel
>>> [    0.618911] SPI driver st-accel-spi has no spi_device_id for
>>> st,h3lis331dl-accel
>>> [    0.619056] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis331dl-accel
>>> [    0.619209] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm303c-accel
>>> [    0.620207] SPI driver st-magn-spi has no spi_device_id for
>>> st,lis3mdl-magn
>>> [    0.620355] SPI driver st-magn-spi has no spi_device_id for
>>> st,lsm303agr-magn
>>> [    0.620510] SPI driver st-magn-spi has no spi_device_id for
>>> st,lsm9ds1-magn
>>> [    0.620768] SPI driver st-magn-spi has no spi_device_id for
>>> st,lsm303c-magn
>>> [    0.626130] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
>>> counters available
>>> [    0.630320] usbcore: registered new interface driver snd-usb-audio
>>> [    0.638439] Mirror/redirect action on
>>> [    0.639343] netem: version 1.3
>>> [    0.639435] u32 classifier
>>> [    0.639508]     input device check on
>>> [    0.639602]     Actions configured
>>> [    0.648469] xt_time: kernel timezone is -0000
>>> [    0.649096] gre: GRE over IPv4 demultiplexor driver
>>> [    0.649255] IPv4 over IPsec tunneling driver
>>> [    0.654843] Initializing XFRM netlink socket
>>> [    0.655213] IPsec XFRM device driver
>>> [    0.676037] NET: Registered PF_INET6 protocol family
>>> [    0.687646] Segment Routing with IPv6
>>> [    0.687964] In-situ OAM (IOAM) with IPv6
>>> [    0.689074] mip6: Mobile IPv6
>>> [    0.693823] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
>>> [    0.699298] NET: Registered PF_PACKET protocol family
>>> [    0.699567] NET: Registered PF_KEY protocol family
>>> [    0.699819] Key type dns_resolver registered
>>> [    0.798005] Freeing initrd memory: 131072K
>>> [    0.806166] registered taskstats version 1
>>> [    0.807819] Loading compiled-in X.509 certificates
>>> [    0.834497] Key type .fscrypt registered
>>> [    0.834641] Key type fscrypt-provisioning registered
>>> [    0.841634] of_cfs_init
>>> [    0.842079] of_cfs_init: OK
>>> [    0.845830] cfg80211: Loading compiled-in X.509 certificates for
>>> regulatory database
>>> [    0.876283] Loaded X.509 cert 'benh@debian.org:
>>> 577e021cb980e0e820821ba7b54b4961b8b4fadf'
>>> [    0.877632] Loaded X.509 cert 'romain.perier@gmail.com:
>>> 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
>>> [    0.878441] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>>> [    0.879187] Loaded X.509 cert 'wens:
>>> 61c038651aabdcf94bd0ac7ff06c7248db18c600'
>>> [    0.885017] clk: Disabling unused clocks
>>> [    0.885499] ALSA device list:
>>> [    0.885646]   No soundcards found.
>>> [    0.894059] uart-pl011 9000000.pl011: no DMA platform data
>>> [    0.895672] Waiting 5 sec before mounting root device...
>>> [    6.132758] RAMDISK: Couldn't find valid RAM disk image starting at
>>> 0.
>>> [    6.133865] Waiting for root device /dev/vdd1...
>>> [   10.994096] platform gpio-keys: deferred probe pending
>>>
>>>
>>>
>>> On Sun, Aug 25, 2024 at 2:30=E2=80=AFPM Mario Marietto <marietto2008@gm=
ail.com>
>>> wrote:
>>>
>>>> When I unpack this file :
>>>>
>>>> lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv.img
>>>>
>>>> I get these files :
>>>>
>>>> 0.fat
>>>> 1.img
>>>> 2.img
>>>> 3.img
>>>>
>>>> So,I assume that :
>>>>
>>>> 0.fat is : initrd
>>>> 1.img is : system-rw.img
>>>> 2.img is   :  vendor-rw.img
>>>> 3.img is   :  userdata.img
>>>>
>>>> If I use 0.fat as initrd,like this :
>>>>
>>>> -initrd
>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/0.fat
>>>>
>>>> I get this message :
>>>>
>>>> rootfs image is not initramfs (invalid magic at start of compressed
>>>> archive); looks like an initrd
>>>>
>>>> it looks like an initrd : right,it's true : it is initrd. (for this
>>>> reason I've assumed that 0.fat is initrd...
>>>>
>>>>
>>>> On Sun, Aug 25, 2024 at 1:26=E2=80=AFPM Peter Maydell <peter.maydell@l=
inaro.org>
>>>> wrote:
>>>>
>>>>> On Sun, 25 Aug 2024 at 11:45, Mario Marietto <marietto2008@gmail.com>
>>>>> wrote:
>>>>> >
>>>>> > Please look at this example :
>>>>> >
>>>>> > qemu-system-aarch64 \
>>>>> > -smp 4 \
>>>>> > -m 2048 \
>>>>> > -cpu cortex-a72 \
>>>>> > -machine virt \
>>>>> > -serial stdio \
>>>>> > -kernel
>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKA=
NG-rpi4-atv/boot/Image
>>>>> \
>>>>>
>>>>> This (assuming it's the complete command line your script is
>>>>> running) doesn't pass any arguments telling QEMU to provide a
>>>>> root disk, and it doesn't pass any arguments to the kernel
>>>>> telling it what root disk to use...
>>>>>
>>>>> > [    0.000000] Kernel command line: console=3DttyAMA0,115200
>>>>> kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rootw=
ait
>>>>> androidboot.serialno=3D10000000abcd1234
>>>>> androidboot.btmacaddr=3D11:22:33:44:55:66
>>>>>
>>>>> ...so the kernel defaults to "/dev/mmcblk0p2" as its root disk becaus=
e
>>>>> it's using the command line argument that was compiled into it...
>>>>>
>>>>> > [    0.658240] Waiting for root device /dev/mmcblk0p2...
>>>>>
>>>>> ...and then it's hanging around forever waiting for that.
>>>>>
>>>>> You need to:
>>>>>  (1) pass QEMU arguments telling it to provide a root fs
>>>>>  (2) pass the kernel arguments telling it to look for the
>>>>>      root fs in the place where QEMU is providing it
>>>>>
>>>>> Your other command line looks more on the right lines:
>>>>>
>>>>>         -kernel
>>>>>
>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKA=
NG-rpi4-atv/boot/Image
>>>>> \
>>>>>         -initrd
>>>>>
>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKA=
NG-rpi4-atv/0.fat
>>>>> \
>>>>>         -drive
>>>>> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/li=
neage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/1.img
>>>>> \
>>>>>         -device virtio-blk-pci,drive=3Dsystem \
>>>>>         -drive
>>>>> index=3D1,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot2/zroot2/OS/Linux/li=
neage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/2.img
>>>>> \
>>>>>         -device virtio-blk-pci,drive=3Dvendor \
>>>>>         -drive
>>>>> index=3D2,if=3Dnone,id=3Duserdata,file=3D/mnt/zroot2/zroot2/OS/Linux/=
lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/3.img
>>>>> \
>>>>>         -device virtio-blk-pci,drive=3Duserdata \
>>>>>
>>>>> though I wonder if the kernel really expects a
>>>>> FAT file for the initrd, given it complains:
>>>>>
>>>>> [    0.344033] Trying to unpack rootfs image as initramfs...
>>>>> [    0.344947] rootfs image is not initramfs (invalid magic at start
>>>>> of compressed archive); looks like an initrd
>>>>>
>>>>> and then later
>>>>>
>>>>> [    5.905329] RAMDISK: Couldn't find valid RAM disk image starting a=
t
>>>>> 0.
>>>>>
>>>>> I think if I were you I'd start by figuring out what's going on
>>>>> with the initrd.
>>>>>
>>>>> thanks
>>>>> -- PMM
>>>>>
>>>>
>>>>
>>>> --
>>>> Mario.
>>>>
>>>
>>>
>>> --
>>> Mario.
>>>
>>
>>
>> --
>> Mario.
>>
>
>
> --
> Mario.
>


--=20
Mario.

--000000000000ccd7e40620a9e43a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello to everyone.</div><div><br></div><div>As I said=
 before,some years ago I was able to emulate Android on my Jetson Nano. It =
was a special version of Android,prepared by antmicro and the github is loc=
ated here :</div><div><br></div><div><a href=3D"https://github.com/antmicro=
/kvm-aosp-jetson-nano" target=3D"_blank">https://github.com/antmicro/kvm-ao=
sp-jetson-nano</a></div><div><br></div><div>I would like to compile it agai=
n and try to emulate it on my Jetson Nano again and on my Intel PC + Ubuntu=
 24.04 x64 bit. <br></div><div>I followed the tutorial again and I&#39;ve b=
een able to create the Android img files below without problems :<br></div>=
<div><pre><code><br>out/target/product/generic_arm64/vendor.img
out/target/product/generic_arm64/system.img
out/target/product/generic_arm64/userdata.img
out/target/product/generic_arm64/ramdisk.img<br><br></code></pre><div>Now I=
 need the kernel,so I tried to fetch the kernel sources to compile it. Unfo=
rtunately the github is old and some links are broken. <br></div><div>I wan=
t to ask your help to fix the broken link as better as possible :</div><div=
><br></div><div><blockquote><span style=3D"font-family:monospace">root@Z390=
-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo init -u <a href=3D"https://andr=
oid.googlesource.com/kernel" target=3D"_blank">https://android.googlesource=
.com/kernel</a></span><span style=3D"font-family:monospace">/manifest -b q-=
common-android-4.14
</span></blockquote><blockquote><span style=3D"font-family:monospace">Downl=
oading Repo source from <a href=3D"https://gerrit.googlesource.com/git-repo=
" target=3D"_blank">https://gerrit.googlesource.com/git-repo</a>
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">Your identity is: ziomario=
 &lt;<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">marietto20=
08@gmail.com</a>&gt;
</span><br><span style=3D"font-family:monospace">If you want to change this=
, please re-run &#39;repo init&#39; with --config-name
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace"></span></blockquote><block=
quote><span style=3D"font-family:monospace">repo has been initialized in /m=
nt/sdl1/aosp_kernel<br><br></span></blockquote><blockquote><span style=3D"f=
ont-family:monospace">
</span></blockquote><blockquote><span style=3D"font-family:monospace"></spa=
n></blockquote><blockquote><span style=3D"font-family:monospace">root@Z390-=
AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
</span><br><span style=3D"font-family:monospace"></span></blockquote><block=
quote><span style=3D"font-family:monospace"><br></span></blockquote><blockq=
uote><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/8) 0:07 | =
2 jobs | 0:05 kernel/build @ buildRicezione degli oggetti: =C2=A084% (14706=
/17</span></blockquote><blockquote><span style=3D"font-family:monospace"></=
span></blockquote><blockquote><span style=3D"font-family:monospace">Fetchin=
g: =C2=A00% (0/8) 0:07 | 2 jobs | 0:06 kernel/build @ buildRicezione degli =
oggetti: =C2=A085% (14881/17</span><br><span style=3D"font-family:monospace=
">Ricezione degli oggetti: 100% (17506/17506), 12.23 MiB | 46.57 MiB/s, fat=
to.
</span><br><span style=3D"font-family:monospace">Risoluzione dei delta: 100=
% (8869/8869), fatto.
</span><br><span style=3D"font-family:monospace">Fetching: 50% (4/8) 9:11 |=
 1 job | 9:01 kernel/common @ commonRicezione degli oggetti: =C2=A0=C2=A00%=
 (1/12468</span><br><span style=3D"font-family:monospace">Fetching: 50% (4/=
8) 9:12 | 1 job | 9:02 kernel/common @ commonRicezione degli oggetti: =C2=
=A0=C2=A00% (80382/1</span><br><span style=3D"font-family:monospace">Fetchi=
ng: 50% (4/8) 9:12 | 1 job | 9:03 kernel/common @ commonRicezione degli ogg=
etti: =C2=A0=C2=A01% (124682/</span><br><span style=3D"font-family:monospac=
e">Fetching: 50% (4/8) 9:13 | 1 job | 9:03 kernel/common @ commonRicezione =
degli oggetti: =C2=A0=C2=A01% (163592/</span><br><span style=3D"font-family=
:monospace">Fetching: 50% (4/8) 9:14 | 1 job | 9:04 kernel/common @ commonR=
icezione degli oggetti: =C2=A0=C2=A01% (245123/</span><br><span style=3D"fo=
nt-family:monospace">Fetching: 50% (4/8) 9:15 | 1 job | 9:05 kernel/common =
@ commonRicezione degli oggetti: =C2=A0=C2=A02% (333147/</span><br><span st=
yle=3D"font-family:monospace">Fetching: 50% (4/8) 9:15 | 1 job | 9:06 kerne=
l/common @ commonRicezione degli oggetti: =C2=A0=C2=A03% (374044/</span><br=
><span style=3D"font-family:monospace">.....</span><br><span style=3D"font-=
family:monospace">Fetching: 50% (4/8) 12:06 | 1 job | 11:57 kernel/common @=
 commonRisoluzione dei delta: =C2=A098% (1023355</span><br><span style=3D"f=
ont-family:monospace">Fetching: 50% (4/8) 12:07 | 1 job | 11:58 kernel/comm=
on @ commonRisoluzione dei delta: =C2=A099% (1028207</span><br><span style=
=3D"font-family:monospace">Fetching: 50% (4/8) 12:08 | 1 job | 11:59 kernel=
/common @ commonRisoluzione dei delta: 100% (1034277</span><br><span style=
=3D"font-family:monospace">Risoluzione dei delta: 100% (10342775/10342775),=
 fatto.
</span><br><span style=3D"font-family:monospace"></span></blockquote><block=
quote><span style=3D"font-family:monospace">Fetching: 50% (4/8) 13:44 | 1 j=
ob | 13:34 kernel/common @ common</span></blockquote><blockquote><span styl=
e=3D"font-family:monospace"><br></span></blockquote><blockquote><span style=
=3D"font-family:monospace"></span></blockquote><blockquote><span style=3D"f=
ont-family:monospace">fatal: can&#39;t find remote refs/heads/android-4.14-=
q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace"></span><br><span style=3D"=
font-family:monospace">kernel/common: sleeping 4.0 seconds before retrying
</span><br><span style=3D"font-family:monospace"></span><br><span style=3D"=
font-family:monospace"><span style=3D"color:rgb(178,24,24);background-color=
:rgb(255,255,255)">error: Cannot fetch kernel/common from <a href=3D"https:=
//android.googlesource.com/kernel/common" target=3D"_blank">https://android=
.googlesource.com/kernel/common</a></span><span style=3D"color:rgb(0,0,0);b=
ackground-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace"></span></blockquote=
><blockquote><span style=3D"font-family:monospace"><br></span></blockquote>=
<blockquote><span style=3D"font-family:monospace">Fetching: 50% (4/8) 13:45=
 | 1 job | 0:01 kernel/tests @ kernel/tests</span></blockquote><blockquote>=
<span style=3D"font-family:monospace">Ricezione degli oggetti: =C2=A0=C2=A0=
</span></blockquote><blockquote><span style=3D"font-family:monospace"><br><=
/span></blockquote><blockquote><span style=3D"font-family:monospace"></span=
></blockquote><blockquote><span style=3D"font-family:monospace">Ricezione d=
egli oggetti: 100% (11797/11797), 4.91 MiB | 48.34 MiB/s, fatto.
</span><br><span style=3D"font-family:monospace">Risoluzione dei delta: 100=
% (2123/2123), fatto.
</span><br><span style=3D"font-family:monospace">Fetching: 100% (8/8), done=
 in 18m26.961s
</span><br><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/1) 0=
:04 | 1 job | 0:04 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (1/1=
), done in 5.046s
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot checkout kernel/=
common: ManifestInvalidRevisionError: revision android-4.14-q in kerne</spa=
n>l/common not found<span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">
</span></span><br><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(178,24,24);background-color:rgb(255,255,255)">error: in `sync`: revis=
ion android-4.14-q in kernel/common not found</span><span style=3D"color:rg=
b(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">root@Z390-AORUS-PRO=
-DEST:/mnt/sdl1/aosp_kernel# repo sync
</span><br><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/8) 0=
:09 | 2 jobs | 0:07 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (8/8=
), done in 12.927s
</span><br><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/1) 0=
:04 | 1 job | 0:04 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (1/1=
), done in 5.008s
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot checkout kernel/=
common: ManifestInvalidRevisionError: revision android-4.14-q in kerne</spa=
n>l/common not found<span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">
</span></span><br><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(178,24,24);background-color:rgb(255,255,255)">error: in `sync`: revis=
ion android-4.14-q in kernel/common not found</span><span style=3D"color:rg=
b(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">root@Z390-AORUS-PRO=
-DEST:/mnt/sdl1/aosp_kernel# repo sync
</span><br><span style=3D"font-family:monospace">Fetching: 50% (4/8) 0:04 |=
 1 job | 0:03 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (8/8=
), done in 5.696s
</span><br><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/1) 0=
:04 | 1 job | 0:04 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q

</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (1/1=
), done in 4.930s
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot checkout kernel/=
common: ManifestInvalidRevisionError: revision android-4.14-q in kerne</spa=
n>l/common not found<span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">
</span></span><br><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(178,24,24);background-color:rgb(255,255,255)">error: in `sync`: revis=
ion android-4.14-q in kernel/common not found</span></span></blockquote></d=
iv><div>thanks.<br></div><pre></pre></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 25, 2024 at 5:58=E2=
=80=AFPM Mario Marietto &lt;<a href=3D"mailto:marietto2008@gmail.com" targe=
t=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>ok,I&#39;ve unders=
tood that initrd is ramdisk.img,so : <br></div><div><br></div><div>qemu-sys=
tem-aarch64 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a72 \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -machine virt \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
-initrd /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Konsta=
KANG-rpi4-atv/boot/ramdisk.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mn=
t/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-a=
tv/boot/Image \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-gpu-pci,xres=
=3D1024,yres=3D768 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -display sdl,gl=3Don \<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -device usb-kbd \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-tabl=
et-pci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -serial stdio \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D0,if=3Dno=
ne,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNO=
FFICIAL-KonstaKANG-rpi4-atv/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv.img,format=3Draw,index=3D0,media=3Ddisk \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdela=
y=3D5 root=3D/dev/vdd1 rw&quot;</div><div><br></div><div>=3D=3D=3D=3D=3D=3D=
&gt;<br></div><div><span style=3D"font-family:monospace"><span style=3D"col=
or:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></span></div><d=
iv><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);ba=
ckground-color:rgb(255,255,255)">[ =C2=A0=C2=A0=C2=A02.862352] Run /init as=
 init process
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">[ =C2=A0=C2=A0=C2=A03.119264] magisk=
init: open /proc/bootconfig failed with 2: No such file or directory
<br>[ =C2=A0=C2=A0=C2=A04.741230] init: init first stage started!
<br>[ =C2=A0=C2=A0=C2=A04.754789] init: Unable to open /lib/modules, skippi=
ng module loading.
<br>[ =C2=A0=C2=A0=C2=A04.788159] init: Copied ramdisk prop to /second_stag=
e_resources/system/etc/ramdisk/build.prop
<br>[ =C2=A0=C2=A0=C2=A04.804110] init: [libfstab] Using Android DT directo=
ry /proc/device-tree/firmware/android/
<br>[ =C2=A0=C2=A0=C2=A04.811371] init: [libfstab] ReadFstabFromDt(): faile=
d to read fstab from dt
<br>[ =C2=A0=C2=A0=C2=A04.825409] init: [libfstab] ReadDefaultFstab(): fail=
ed to find device default fstab
<br>[ =C2=A0=C2=A0=C2=A04.828176] init: Failed to create FirstStageMount : =
failed to read default fstab for first stage mount
<br>[ =C2=A0=C2=A0=C2=A04.831564] init: FirstStageMount not available
<br>[ =C2=A0=C2=A0=C2=A04.890952] init: InitFatalReboot: signal 6
<br>[ =C2=A0=C2=A0=C2=A05.063207] init: =C2=A0=C2=A0#00 pc 00000000003b7764=
 =C2=A0/init (unwindstack::AndroidLocalUnwinder::InternalUnwind(std::__1::o=
ptional&lt;int&gt;, unwin<br>dstack::AndroidUnwinderData&amp;)+96) (BuildId=
: 48bce72d2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.064741] init: =C2=A0=C2=A0#01 pc 00000000003ab4b8=
 =C2=A0/init (android::init::InitFatalReboot(int)+204) (BuildId: 48bce72d2f=
0c6e6c34530a67b6b7b<br>3be)
<br>[ =C2=A0=C2=A0=C2=A05.066931] init: =C2=A0=C2=A0#02 pc 00000000003abb48=
 =C2=A0/init (android::init::InstallRebootSignalHandlers()::$_0::__invoke(i=
nt)+32) (BuildId: 4<br>8bce72d2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.068545] init: =C2=A0=C2=A0#03 pc 0000000000000854=
 =C2=A0[vdso]
<br>[ =C2=A0=C2=A0=C2=A05.069555] init: =C2=A0=C2=A0#04 pc 000000000035285c=
 =C2=A0/init (abort+164) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.072153] init: =C2=A0=C2=A0#05 pc 00000000003b029c=
 =C2=A0/init (android::init::InitAborter(char const*)+44) (BuildId: 48bce72=
d2f0c6e6c34530a67b6<br>b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.075216] init: =C2=A0=C2=A0#06 pc 00000000003131d0=
 =C2=A0/init (android::base::SetAborter(std::__1::function&lt;void (char co=
nst*)&gt;&amp;&amp;)::$_0::__invo<br>ke(char const*)+80) (BuildId: 48bce72d=
2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.077609] init: =C2=A0=C2=A0#07 pc 00000000003128f4=
 =C2=A0/init (android::base::LogMessage::~LogMessage()+356) (BuildId: 48bce=
72d2f0c6e6c34530a67<br>b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.079506] init: =C2=A0=C2=A0#08 pc 00000000003a1ec0=
 =C2=A0/init (android::init::FirstStageMain(int, char**)+13140) (BuildId: 4=
8bce72d2f0c6e6c3453<br>0a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.081404] init: =C2=A0=C2=A0#09 pc 0000000000350e9c=
 =C2=A0/init (__real_libc_init(void*, void (*)(), int (*)(int, char**, char=
**), structors_arra<br>y_t const*, bionic_tcb*)+688) (BuildId: 48bce72d2f0c=
6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.083648] init: Reboot ending, jumping to kernel
<br>[ =C2=A0=C2=A0=C2=A05.091556] reboot: Restarting system with command &#=
39;bootloader&#39;<br>
<br><br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 25, 2024 at 3:31=E2=80=AFPM Mario Marietto &lt;=
<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div>The file below is called config.txt and it&#39=
;s available only if=20
Android is installed physically. I don&#39;t see it when I unpack the main=
=20
img file. Probably it is embedded inside the file 0.fat,or 1.img,who=20
knows. Anyway,Is useful to understand what&#39;s the name of the initrd=20
file. Actually I tried to use 0.fat,but I think it&#39;s wrong. Can you giv=
e
 a look at the file below and tell me if it could be &quot;ramdisk.img&quot=
; ? <br></div><div><br></div><div># Kernel</div>arm_64bit=3D1<br>kernel=3DI=
mage<br><br># Ramdisk<br>gpio=3D21=3Dip,pu<br>[gpio21=3D1]<br>initramfs ram=
disk.img followkernel<br>[gpio21=3D0]<br>initramfs ramdisk-recovery.img fol=
lowkernel<br>[all]<br><br># Audio<br>dtparam=3Daudio=3Don<br><br># Audio DA=
C<br>#dtoverlay=3Dallo-boss-dac-pcm512x-audio<br>#dtoverlay=3Dallo-piano-da=
c-pcm512x-audio<br>#dtoverlay=3Dallo-piano-dac-plus-pcm512x-audio<br>#dtove=
rlay=3Dhifiberry-dacplus<br>#dtoverlay=3Di-sabre-q2m<br>#dtoverlay=3Diqaudi=
o-dac<br>#dtoverlay=3Djustboom-dac<br><br># Boot device<br>dtoverlay=3Dandr=
oid-sdcard<br>#dtoverlay=3Dandroid-usb<br>#dtoverlay=3Dandroid-nvme<br><br>=
# Camera<br>camera_auto_detect=3D1<br>start_x=3D1<br><br># CPU<br>arm_boost=
=3D1<br>#arm_freq=3D1500<br><br># Display<br>disable_overscan=3D1<br><br># =
Display panel<br>[gpio21=3D1]<br>#dtoverlay=3Dcutiepi-panel<br>#dtoverlay=
=3Dvc4-kms-dsi-7inch<br>#dtoverlay=3Dvc4-kms-dsi-lt070me05000<br>#dtoverlay=
=3Dvc4-kms-dsi-lt070me05000-v2<br>[all]<br>#dtoverlay=3Drpi-backlight<br><b=
r># Fan<br>#dtoverlay=3Dgpio-fan<br>#dtoverlay=3Di2c-fan<br>#dtoverlay=3Drp=
i-poe<br>#dtoverlay=3Drpi-poe-plus<br><br># Graphics acceleration<br>disabl=
e_fw_kms_setup=3D1<br>[gpio21=3D1]<br>dtoverlay=3Dvc4-kms-v3d<br>[all]<br><=
br># I2C<br>dtparam=3Di2c_arm=3Don<br><br># I2S<br>#dtparam=3Di2s=3Don<br><=
br># IR<br>#dtoverlay=3Dgpio-ir,gpio_pin=3D18<br><br># Keys<br>#dtoverlay=
=3Dgpio-key,gpio=3D21,keycode=3D116,label=3D&quot;POWER&quot;<br>#dtoverlay=
=3Dgpio-key,gpio=3D26,keycode=3D115,label=3D&quot;VOLUME_UP&quot;<br>#dtove=
rlay=3Dgpio-key,gpio=3D20,keycode=3D114,label=3D&quot;VOLUME_DOWN&quot;<br>=
<br># RTC<br>dtoverlay=3Di2c-rtc,ds3231<br><br># Sensors<br>#dtoverlay=3Dan=
droid-i2c-sensor,mpu6050<br><br># Serial console<br>#enable_uart=3D1<br><br=
># SPI<br>dtparam=3Dspi=3Don<br><br># Touchscreen<br>#dtoverlay=3Dads7846,c=
s=3D1,penirq=3D25,penirq_pull=3D2,speed=3D50000,keep_vref_on=3D0,swapxy=3D0=
,pmax=3D255,xohms=3D150,xmin=3D200,xmax=3D3900,ymin=3D200,ymax=3D3900<br>#d=
toverlay=3Dedt-ft5406<br>#dtoverlay=3Dgoodix<br>#dtoverlay=3Drpi-ft5406<br>=
<br># USB<br>dtoverlay=3Ddwc2,dr_mode=3Dperipheral<br>[cm4]<br>dtoverlay=3D=
dwc2,dr_mode=3Dotg<br>[all]<br><br>include config_user.txt</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 25, 2=
024 at 2:44=E2=80=AFPM Mario Marietto &lt;<a href=3D"mailto:marietto2008@gm=
ail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Appe=
nding the root device does not change the scenario :</div><div><br></div><d=
iv>qemu-system-aarch64 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a=
72 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -machine virt \<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -serial stdio \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd /mnt/zroot2/=
zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/0.fat =
\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mnt/zroot2/zroot2/OS/Linux/lineag=
e-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0 roo=
twait rootdelay=3D5 root=3D/dev/vdd1 rw&quot;</div><div><br></div><div><br>=
</div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(0=
,0,0);background-color:rgb(255,255,255)">[ =C2=A0=C2=A0=C2=A00.000000] Boot=
ing Linux on physical CPU 0x0000000000 [0x410fd083]
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">[ =C2=A0=C2=A0=C2=A00.000000] Linux =
version 6.6.36-g01aac93821d2-v8 (kleaf@build-host) (Android (11368308, +pgo=
, +bolt, +lto, +mlgo, based on r510928)<br> clang version 18.0.0 (<a href=
=3D"https://android.googlesource.com/toolchain/llvm-project" target=3D"_bla=
nk">https://android.googlesource.com/toolchain/llvm-project</a> 477610d4d0d=
988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #<br>1 SMP PREEMPT Tue Jul =C2=
=A02 09:02:32 UTC 2024
<br>[ =C2=A0=C2=A0=C2=A00.000000] KASLR enabled
<br>[ =C2=A0=C2=A0=C2=A00.000000] random: crng init done
<br>[ =C2=A0=C2=A0=C2=A00.000000] Machine model: linux,dummy-virt
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: UEFI not found.
<br>[ =C2=A0=C2=A0=C2=A00.000000] Zone ranges:
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0[mem 0x0000000040000000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA32 =C2=A0=C2=A0=C2=A0empty
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0Normal =C2=A0=C2=A0empty
<br>[ =C2=A0=C2=A0=C2=A00.000000] Movable zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] NoSplit zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] NoMerge zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] Early memory node ranges
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
00000040000000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] Initmem setup node 0 [mem 0x0000000040000=
000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] cma: Reserved 8 MiB at 0x00000000bd000000=
 on node -1
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: probing for conduit method from DT.
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: PSCIv1.1 detected in firmware.
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: Using standard PSCI v0.2 function I=
Ds
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: Trusted OS migration not required
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: SMC Calling Convention v1.0
<br>[ =C2=A0=C2=A0=C2=A00.000000] percpu: Embedded 31 pages/cpu s87016 r819=
2 d31768 u126976
<br>[ =C2=A0=C2=A0=C2=A00.000000] Detected PIPT I-cache on CPU0
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v2
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v3a
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v4
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-BHB
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: kernel page table isolation=
 forced ON by KASLR
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Kernel page table=
 isolation (KPTI)
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: ARM erratum 17420=
98
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: ARM errata 116552=
2, 1319367, or 1530923
<br>[ =C2=A0=C2=A0=C2=A00.000000] alternatives: applying boot alternatives
<br>[ =C2=A0=C2=A0=C2=A00.000000] Kernel command line: console=3DttyAMA0,38=
400 drm.debug=3D0x0 rootwait rootdelay=3D5 root=3D/dev/vdd1 rw androidboot.=
serialno=3D100<br>00000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66
<br>[ =C2=A0=C2=A0=C2=A00.000000] Dentry cache hash table entries: 262144 (=
order: 9, 2097152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Inode-cache hash table entries: 131072 (o=
rder: 8, 1048576 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Built 1 zonelists, mobility grouping on.=
=C2=A0 Total pages: 516096
<br>[ =C2=A0=C2=A0=C2=A00.000000] mem auto-init: stack:all(zero), heap allo=
c:off, heap free:off
<br>[ =C2=A0=C2=A0=C2=A00.000000] Memory: 1881596K/2097152K available (1932=
8K kernel code, 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 207364K =
rese<br>rved, 8192K cma-reserved)
<br>[ =C2=A0=C2=A0=C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D4, Nodes=3D1
<br>[ =C2=A0=C2=A0=C2=A00.000000] ftrace: allocating 56269 entries in 220 p=
ages
<br>[ =C2=A0=C2=A0=C2=A00.000000] ftrace: allocated 220 pages with 5 groups
<br>[ =C2=A0=C2=A0=C2=A00.000000] trace event string verifier disabled
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: Preemptible hierarchical RCU impleme=
ntation.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: =C2=A0=C2=A0=C2=A0=C2=A0RCU event tr=
acing is enabled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: =C2=A0=C2=A0=C2=A0=C2=A0RCU restrict=
ing CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D4.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Trampoline variant of Tasks RCU ena=
bled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Rude variant of Tasks RCU enabled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Tracing variant of Tasks RCU enable=
d.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: RCU calculated value of scheduler-en=
listment delay is 25 jiffies.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: Adjusting geometry for rcu_fanout_le=
af=3D16, nr_cpu_ids=3D4
<br>[ =C2=A0=C2=A0=C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated ir=
qs: 0
<br>[ =C2=A0=C2=A0=C2=A00.000000] Root IRQ handler: gic_handle_irq
<br>[ =C2=A0=C2=A0=C2=A00.000000] GICv2m: range[mem 0x08020000-0x08020fff],=
 SPI[80:143]
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: srcu_init: Setting srcu_struct sizes=
 based on contention.
<br>[ =C2=A0=C2=A0=C2=A00.000000] arch_timer: cp15 timer(s) running at 62.5=
0MHz (virt).
<br>[ =C2=A0=C2=A0=C2=A00.000000] clocksource: arch_sys_counter: mask: 0x1f=
fffffffffffff max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
<br>[ =C2=A0=C2=A0=C2=A00.000069] sched_clock: 57 bits at 63MHz, resolution=
 16ns, wraps every 4398046511096ns
<br>[ =C2=A0=C2=A0=C2=A00.003628] kfence: initialized - using 2097152 bytes=
 for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
<br>[ =C2=A0=C2=A0=C2=A00.010906] Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
<br>[ =C2=A0=C2=A0=C2=A00.011082] pid_max: default: 32768 minimum: 301
<br>[ =C2=A0=C2=A0=C2=A00.013020] LSM: initializing lsm=3Dcapability,selinu=
x,integrity
<br>[ =C2=A0=C2=A0=C2=A00.013436] SELinux: =C2=A0Initializing.
<br>[ =C2=A0=C2=A0=C2=A00.016921] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.016984] Mountpoint-cache hash table entries: 4096=
 (order: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.031469] cgroup: Disabling memory control group su=
bsystem
<br>[ =C2=A0=C2=A0=C2=A00.050059] cacheinfo: Unable to detect cache hierarc=
hy for CPU 0
<br>[ =C2=A0=C2=A0=C2=A00.059978] RCU Tasks: Setting shift to 2 and lim to =
1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.060584] RCU Tasks Rude: Setting shift to 2 and li=
m to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.060822] RCU Tasks Trace: Setting shift to 2 and l=
im to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.062427] rcu: Hierarchical SRCU implementation.
<br>[ =C2=A0=C2=A0=C2=A00.062463] rcu: =C2=A0=C2=A0=C2=A0=C2=A0Max phase no=
-delay instances is 1000.
<br>[ =C2=A0=C2=A0=C2=A00.068568] EFI services will not be available.
<br>[ =C2=A0=C2=A0=C2=A00.071086] smp: Bringing up secondary CPUs ...
<br>[ =C2=A0=C2=A0=C2=A00.074801] Detected PIPT I-cache on CPU1
<br>[ =C2=A0=C2=A0=C2=A00.075909] CPU1: Booted secondary processor 0x000000=
0001 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.081065] Detected PIPT I-cache on CPU2
<br>[ =C2=A0=C2=A0=C2=A00.081470] CPU2: Booted secondary processor 0x000000=
0002 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.083873] Detected PIPT I-cache on CPU3
<br>[ =C2=A0=C2=A0=C2=A00.084168] CPU3: Booted secondary processor 0x000000=
0003 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.084681] smp: Brought up 1 node, 4 CPUs
<br>[ =C2=A0=C2=A0=C2=A00.084715] SMP: Total of 4 processors activated.
<br>[ =C2=A0=C2=A0=C2=A00.084800] CPU features: detected: 32-bit EL0 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.084824] CPU features: detected: 32-bit EL1 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.084885] CPU features: detected: CRC32 instruction=
s
<br>[ =C2=A0=C2=A0=C2=A00.088191] CPU features: emulated: Privileged Access=
 Never (PAN) using TTBR0_EL1 switching
<br>[ =C2=A0=C2=A0=C2=A00.088512] CPU: All CPU(s) started at EL1
<br>[ =C2=A0=C2=A0=C2=A00.088714] alternatives: applying system-wide altern=
atives
<br>[ =C2=A0=C2=A0=C2=A00.113756] devtmpfs: initialized
<br>[ =C2=A0=C2=A0=C2=A00.126262] Enabled cp15_barrier support
<br>[ =C2=A0=C2=A0=C2=A00.126449] Enabled setend support
<br>[ =C2=A0=C2=A0=C2=A00.127708] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
<br>[ =C2=A0=C2=A0=C2=A00.127840] futex hash table entries: 1024 (order: 4,=
 65536 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.131302] pinctrl core: initialized pinctrl subsyst=
em
<br>[ =C2=A0=C2=A0=C2=A00.138216] DMI not present or invalid.
<br>[ =C2=A0=C2=A0=C2=A00.147664] NET: Registered PF_NETLINK/PF_ROUTE proto=
col family
<br>[ =C2=A0=C2=A0=C2=A00.158502] DMA: preallocated 256 KiB GFP_KERNEL pool=
 for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.158987] DMA: preallocated 256 KiB GFP_KERNEL|GFP_=
DMA pool for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.159303] audit: initializing netlink subsys (disab=
led)
<br>[ =C2=A0=C2=A0=C2=A00.161302] audit: type=3D2000 audit(0.148:1): state=
=3Dinitialized audit_enabled=3D0 res=3D1
<br>[ =C2=A0=C2=A0=C2=A00.164412] thermal_sys: Registered thermal governor =
&#39;step_wise&#39;
<br>[ =C2=A0=C2=A0=C2=A00.164806] cpuidle: using governor menu
<br>[ =C2=A0=C2=A0=C2=A00.165816] hw-breakpoint: found 6 breakpoint and 4 w=
atchpoint registers.
<br>[ =C2=A0=C2=A0=C2=A00.166975] ASID allocator initialised with 32768 ent=
ries
<br>[ =C2=A0=C2=A0=C2=A00.168385] Serial: AMBA PL011 UART driver
<br>[ =C2=A0=C2=A0=C2=A00.196712] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 =
(irq =3D 13, base_baud =3D 0) is a PL011 rev1
<br>[ =C2=A0=C2=A0=C2=A00.198278] printk: console [ttyAMA0] enabled
<br>[ =C2=A0=C2=A0=C2=A00.224278] Modules: 2G module region forced by RANDO=
MIZE_MODULE_REGION_FULL
<br>[ =C2=A0=C2=A0=C2=A00.224486] Modules: 0 pages in range for non-PLT usa=
ge
<br>[ =C2=A0=C2=A0=C2=A00.224510] Modules: 516176 pages in range for PLT us=
age
<br>[ =C2=A0=C2=A0=C2=A00.241442] iommu: Default domain type: Translated
<br>[ =C2=A0=C2=A0=C2=A00.241679] iommu: DMA domain TLB invalidation policy=
: strict mode
<br>[ =C2=A0=C2=A0=C2=A00.244200] SCSI subsystem initialized
<br>[ =C2=A0=C2=A0=C2=A00.245459] usbcore: registered new interface driver =
usbfs
<br>[ =C2=A0=C2=A0=C2=A00.245841] usbcore: registered new interface driver =
hub
<br>[ =C2=A0=C2=A0=C2=A00.246154] usbcore: registered new device driver usb
<br>[ =C2=A0=C2=A0=C2=A00.247257] mc: Linux media interface: v0.10
<br>[ =C2=A0=C2=A0=C2=A00.247617] videodev: Linux video capture interface: =
v2.00
<br>[ =C2=A0=C2=A0=C2=A00.248602] pps_core: LinuxPPS API ver. 1 registered
<br>[ =C2=A0=C2=A0=C2=A00.248700] pps_core: Software ver. 5.3.6 - Copyright=
 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it" target=
=3D"_blank">giometti@linux.it</a>&gt;
<br>[ =C2=A0=C2=A0=C2=A00.248967] PTP clock support registered
<br>[ =C2=A0=C2=A0=C2=A00.251884] Advanced Linux Sound Architecture Driver =
Initialized.
<br>[ =C2=A0=C2=A0=C2=A00.262663] Bluetooth: Core ver 2.22
<br>[ =C2=A0=C2=A0=C2=A00.262960] NET: Registered PF_BLUETOOTH protocol fam=
ily
<br>[ =C2=A0=C2=A0=C2=A00.263069] Bluetooth: HCI device and connection mana=
ger initialized
<br>[ =C2=A0=C2=A0=C2=A00.263344] Bluetooth: HCI socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.263516] Bluetooth: L2CAP socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.263840] Bluetooth: SCO socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.266790] vgaarb: loaded
<br>[ =C2=A0=C2=A0=C2=A00.268841] clocksource: Switched to clocksource arch=
_sys_counter
<br>[ =C2=A0=C2=A0=C2=A00.272056] VFS: Disk quotas dquot_6.6.0
<br>[ =C2=A0=C2=A0=C2=A00.272284] VFS: Dquot-cache hash table entries: 512 =
(order 0, 4096 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.273060] FS-Cache: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.278526] CacheFiles: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.287007] NET: Registered PF_INET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.288390] IP idents hash table entries: 32768 (orde=
r: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.297021] tcp_listen_portaddr_hash hash table entri=
es: 1024 (order: 2, 16384 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.297273] Table-perturb hash table entries: 65536 (=
order: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.297485] TCP established hash table entries: 16384=
 (order: 5, 131072 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.298036] TCP bind hash table entries: 16384 (order=
: 7, 524288 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.298873] TCP: Hash tables configured (established =
16384 bind 16384)
<br>[ =C2=A0=C2=A0=C2=A00.301283] MPTCP token hash table entries: 2048 (ord=
er: 3, 49152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.301759] UDP hash table entries: 1024 (order: 3, 3=
2768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.302186] UDP-Lite hash table entries: 1024 (order:=
 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.304009] NET: Registered PF_UNIX/PF_LOCAL protocol=
 family
<br>[ =C2=A0=C2=A0=C2=A00.306868] PCI: CLS 0 bytes, default 64
<br>[ =C2=A0=C2=A0=C2=A00.312145] Trying to unpack rootfs image as initramf=
s...
<br>[ =C2=A0=C2=A0=C2=A00.312808] kvm [1]: HYP mode not available
<br>[ =C2=A0=C2=A0=C2=A00.318856] rootfs image is not initramfs (invalid ma=
gic at start of compressed archive); looks like an initrd
<br>[ =C2=A0=C2=A0=C2=A00.335544] Initialise system trusted keyrings
<br>[ =C2=A0=C2=A0=C2=A00.338430] workingset: timestamp_bits=3D46 max_order=
=3D19 bucket_order=3D0
<br>[ =C2=A0=C2=A0=C2=A00.339134] zbud: loaded
<br>[ =C2=A0=C2=A0=C2=A00.347742] Key type cifs.idmap registered
<br>[ =C2=A0=C2=A0=C2=A00.348673] fuse: init (API version 7.39)
<br>[ =C2=A0=C2=A0=C2=A00.386722] Key type asymmetric registered
<br>[ =C2=A0=C2=A0=C2=A00.386992] Asymmetric key parser &#39;x509&#39; regi=
stered
<br>[ =C2=A0=C2=A0=C2=A00.387460] Block layer SCSI generic (bsg) driver ver=
sion 0.4 loaded (major 244)
<br>[ =C2=A0=C2=A0=C2=A00.388796] io scheduler mq-deadline registered
<br>[ =C2=A0=C2=A0=C2=A00.388954] io scheduler kyber registered
<br>[ =C2=A0=C2=A0=C2=A00.389319] io scheduler bfq registered
<br>[ =C2=A0=C2=A0=C2=A00.406358] vc-mem: phys_addr:0x00000000 mem_base=3D0=
x00000000 mem_size:0x00000000(0 MiB)
<br>[ =C2=A0=C2=A0=C2=A00.476330] brd: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.508286] loop: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.512092] Loading iSCSI transport class v2.0-870.
<br>[ =C2=A0=C2=A0=C2=A00.522449] wireguard: WireGuard 1.0.0 loaded. See <a=
 href=3D"http://www.wireguard.com" target=3D"_blank">www.wireguard.com</a> =
for information.
<br>[ =C2=A0=C2=A0=C2=A00.522729] wireguard: Copyright (C) 2015-2019 Jason =
A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason=
@zx2c4.com</a>&gt;. All Rights Reserved.
<br>[ =C2=A0=C2=A0=C2=A00.538429] tun: Universal TUN/TAP device driver, 1.6
<br>[ =C2=A0=C2=A0=C2=A00.541953] usbcore: registered new interface driver =
brcmfmac
<br>[ =C2=A0=C2=A0=C2=A00.542290] usbcore: registered new device driver r81=
52-cfgselector
<br>[ =C2=A0=C2=A0=C2=A00.542675] usbcore: registered new interface driver =
r8152
<br>[ =C2=A0=C2=A0=C2=A00.542971] usbcore: registered new interface driver =
lan78xx
<br>[ =C2=A0=C2=A0=C2=A00.543488] usbcore: registered new interface driver =
asix
<br>[ =C2=A0=C2=A0=C2=A00.543810] usbcore: registered new interface driver =
ax88179_178a
<br>[ =C2=A0=C2=A0=C2=A00.544134] usbcore: registered new interface driver =
cdc_ether
<br>[ =C2=A0=C2=A0=C2=A00.544609] usbcore: registered new interface driver =
smsc95xx
<br>[ =C2=A0=C2=A0=C2=A00.544909] usbcore: registered new interface driver =
net1080
<br>[ =C2=A0=C2=A0=C2=A00.545240] usbcore: registered new interface driver =
cdc_subset
<br>[ =C2=A0=C2=A0=C2=A00.545596] usbcore: registered new interface driver =
zaurus
<br>[ =C2=A0=C2=A0=C2=A00.545896] usbcore: registered new interface driver =
cdc_ncm
<br>[ =C2=A0=C2=A0=C2=A00.546192] usbcore: registered new interface driver =
r8153_ecm
<br>[ =C2=A0=C2=A0=C2=A00.547442] dwc_otg: version 3.00a 10-AUG-2012 (platf=
orm bus)
<br>[ =C2=A0=C2=A0=C2=A00.550591] usbcore: registered new interface driver =
cdc_acm
<br>[ =C2=A0=C2=A0=C2=A00.550756] cdc_acm: USB Abstract Control Model drive=
r for USB modems and ISDN adapters
<br>[ =C2=A0=C2=A0=C2=A00.551948] usbcore: registered new interface driver =
uas
<br>[ =C2=A0=C2=A0=C2=A00.552352] usbcore: registered new interface driver =
usb-storage
<br>[ =C2=A0=C2=A0=C2=A00.566050] usbcore: registered new interface driver =
cp210x
<br>[ =C2=A0=C2=A0=C2=A00.566791] usbserial: USB Serial support registered =
for cp210x
<br>[ =C2=A0=C2=A0=C2=A00.567318] usbcore: registered new interface driver =
pl2303
<br>[ =C2=A0=C2=A0=C2=A00.567653] usbserial: USB Serial support registered =
for pl2303
<br>[ =C2=A0=C2=A0=C2=A00.573531] mousedev: PS/2 mouse device common for al=
l mice
<br>[ =C2=A0=C2=A0=C2=A00.573930] usbcore: registered new interface driver =
xpad
<br>[ =C2=A0=C2=A0=C2=A00.574228] usbcore: registered new interface driver =
usb_acecad
<br>[ =C2=A0=C2=A0=C2=A00.574588] usbcore: registered new interface driver =
aiptek
<br>[ =C2=A0=C2=A0=C2=A00.574937] usbcore: registered new interface driver =
hanwang
<br>[ =C2=A0=C2=A0=C2=A00.575292] usbcore: registered new interface driver =
kbtab
<br>[ =C2=A0=C2=A0=C2=A00.577388] usbcore: registered new interface driver =
usbtouchscreen
<br>[ =C2=A0=C2=A0=C2=A00.580179] i2c_dev: i2c /dev entries driver
<br>[ =C2=A0=C2=A0=C2=A00.584010] ir_imon_decoder: IR iMON protocol handler=
 initialized
<br>[ =C2=A0=C2=A0=C2=A00.584179] IR JVC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584296] IR MCE Keyboard/mouse protocol handler in=
itialized
<br>[ =C2=A0=C2=A0=C2=A00.584435] IR NEC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584734] IR RC5(x/sz) protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584863] IR RC6 protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584991] IR RCMM protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585111] IR SANYO protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585226] IR Sharp protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585358] IR Sony protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585477] IR XMP protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.586421] usbcore: registered new interface driver =
uvcvideo
<br>[ =C2=A0=C2=A0=C2=A00.589015] device-mapper: uevent: version 1.0.3
<br>[ =C2=A0=C2=A0=C2=A00.590448] device-mapper: ioctl: 4.48.0-ioctl (2023-=
03-01) initialised: <a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank=
">dm-devel@redhat.com</a>
<br>[ =C2=A0=C2=A0=C2=A00.591924] Bluetooth: HCI UART driver ver 2.3
<br>[ =C2=A0=C2=A0=C2=A00.592106] Bluetooth: HCI UART protocol H4 registere=
d
<br>[ =C2=A0=C2=A0=C2=A00.592885] Bluetooth: HCI UART protocol Broadcom reg=
istered
<br>[ =C2=A0=C2=A0=C2=A00.594293] sdhci: Secure Digital Host Controller Int=
erface driver
<br>[ =C2=A0=C2=A0=C2=A00.594442] sdhci: Copyright(c) Pierre Ossman
<br>[ =C2=A0=C2=A0=C2=A00.594948] sdhci-pltfm: SDHCI platform and OF driver=
 helper
<br>[ =C2=A0=C2=A0=C2=A00.596987] ledtrig-cpu: registered to indicate activ=
ity on CPUs
<br>[ =C2=A0=C2=A0=C2=A00.599350] hid: raw HID events driver (C) Jiri Kosin=
a
<br>[ =C2=A0=C2=A0=C2=A00.612270] usbcore: registered new interface driver =
usbhid
<br>[ =C2=A0=C2=A0=C2=A00.612441] usbhid: USB HID core driver
<br>[ =C2=A0=C2=A0=C2=A00.615743] ashmem: initialized
<br>[ =C2=A0=C2=A0=C2=A00.617297] SPI driver st-accel-spi has no spi_device=
_id for st,lis302dl-spi
<br>[ =C2=A0=C2=A0=C2=A00.617473] SPI driver st-accel-spi has no spi_device=
_id for st,lis3lv02dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.617626] SPI driver st-accel-spi has no spi_device=
_id for st,lis3dh-accel
<br>[ =C2=A0=C2=A0=C2=A00.617769] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330d-accel
<br>[ =C2=A0=C2=A0=C2=A00.617919] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.618062] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dlc-accel
<br>[ =C2=A0=C2=A0=C2=A00.618206] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dlh-accel
<br>[ =C2=A0=C2=A0=C2=A00.618357] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330-accel
<br>[ =C2=A0=C2=A0=C2=A00.618493] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303agr-accel
<br>[ =C2=A0=C2=A0=C2=A00.618638] SPI driver st-accel-spi has no spi_device=
_id for st,lis2dh12-accel
<br>[ =C2=A0=C2=A0=C2=A00.618775] SPI driver st-accel-spi has no spi_device=
_id for st,lng2dm-accel
<br>[ =C2=A0=C2=A0=C2=A00.618911] SPI driver st-accel-spi has no spi_device=
_id for st,h3lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.619056] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.619209] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303c-accel
<br>[ =C2=A0=C2=A0=C2=A00.620207] SPI driver st-magn-spi has no spi_device_=
id for st,lis3mdl-magn
<br>[ =C2=A0=C2=A0=C2=A00.620355] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303agr-magn
<br>[ =C2=A0=C2=A0=C2=A00.620510] SPI driver st-magn-spi has no spi_device_=
id for st,lsm9ds1-magn
<br>[ =C2=A0=C2=A0=C2=A00.620768] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303c-magn
<br>[ =C2=A0=C2=A0=C2=A00.626130] hw perfevents: enabled with armv8_pmuv3 P=
MU driver, 7 counters available
<br>[ =C2=A0=C2=A0=C2=A00.630320] usbcore: registered new interface driver =
snd-usb-audio
<br>[ =C2=A0=C2=A0=C2=A00.638439] Mirror/redirect action on
<br>[ =C2=A0=C2=A0=C2=A00.639343] netem: version 1.3
<br>[ =C2=A0=C2=A0=C2=A00.639435] u32 classifier
<br>[ =C2=A0=C2=A0=C2=A00.639508] =C2=A0=C2=A0=C2=A0=C2=A0input device chec=
k on
<br>[ =C2=A0=C2=A0=C2=A00.639602] =C2=A0=C2=A0=C2=A0=C2=A0Actions configure=
d
<br>[ =C2=A0=C2=A0=C2=A00.648469] xt_time: kernel timezone is -0000
<br>[ =C2=A0=C2=A0=C2=A00.649096] gre: GRE over IPv4 demultiplexor driver
<br>[ =C2=A0=C2=A0=C2=A00.649255] IPv4 over IPsec tunneling driver
<br>[ =C2=A0=C2=A0=C2=A00.654843] Initializing XFRM netlink socket
<br>[ =C2=A0=C2=A0=C2=A00.655213] IPsec XFRM device driver
<br>[ =C2=A0=C2=A0=C2=A00.676037] NET: Registered PF_INET6 protocol family
<br>[ =C2=A0=C2=A0=C2=A00.687646] Segment Routing with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.687964] In-situ OAM (IOAM) with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.689074] mip6: Mobile IPv6
<br>[ =C2=A0=C2=A0=C2=A00.693823] sit: IPv6, IPv4 and MPLS over IPv4 tunnel=
ing driver
<br>[ =C2=A0=C2=A0=C2=A00.699298] NET: Registered PF_PACKET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.699567] NET: Registered PF_KEY protocol family
<br>[ =C2=A0=C2=A0=C2=A00.699819] Key type dns_resolver registered
<br>[ =C2=A0=C2=A0=C2=A00.798005] Freeing initrd memory: 131072K
<br>[ =C2=A0=C2=A0=C2=A00.806166] registered taskstats version 1
<br>[ =C2=A0=C2=A0=C2=A00.807819] Loading compiled-in X.509 certificates
<br>[ =C2=A0=C2=A0=C2=A00.834497] Key type .fscrypt registered
<br>[ =C2=A0=C2=A0=C2=A00.834641] Key type fscrypt-provisioning registered
<br>[ =C2=A0=C2=A0=C2=A00.841634] of_cfs_init
<br>[ =C2=A0=C2=A0=C2=A00.842079] of_cfs_init: OK
<br>[ =C2=A0=C2=A0=C2=A00.845830] cfg80211: Loading compiled-in X.509 certi=
ficates for regulatory database
<br>[ =C2=A0=C2=A0=C2=A00.876283] Loaded X.509 cert &#39;<a href=3D"mailto:=
benh@debian.org" target=3D"_blank">benh@debian.org</a>: 577e021cb980e0e8208=
21ba7b54b4961b8b4fadf&#39;
<br>[ =C2=A0=C2=A0=C2=A00.877632] Loaded X.509 cert &#39;<a href=3D"mailto:=
romain.perier@gmail.com" target=3D"_blank">romain.perier@gmail.com</a>: 3ab=
bc6ec146e09d1b6016ab9d6cf71dd233f0328&#39;
<br>[ =C2=A0=C2=A0=C2=A00.878441] Loaded X.509 cert &#39;sforshee: 00b28ddf=
47aef9cea7&#39;
<br>[ =C2=A0=C2=A0=C2=A00.879187] Loaded X.509 cert &#39;wens: 61c038651aab=
dcf94bd0ac7ff06c7248db18c600&#39;
<br>[ =C2=A0=C2=A0=C2=A00.885017] clk: Disabling unused clocks
<br>[ =C2=A0=C2=A0=C2=A00.885499] ALSA device list:
<br>[ =C2=A0=C2=A0=C2=A00.885646] =C2=A0=C2=A0No soundcards found.
<br>[ =C2=A0=C2=A0=C2=A00.894059] uart-pl011 9000000.pl011: no DMA platform=
 data
<br>[ =C2=A0=C2=A0=C2=A00.895672] Waiting 5 sec before mounting root device=
...
<br>[ =C2=A0=C2=A0=C2=A06.132758] RAMDISK: Couldn&#39;t find valid RAM disk=
 image starting at 0.
<br>[ =C2=A0=C2=A0=C2=A06.133865] Waiting for root device /dev/vdd1...
<br>[ =C2=A0=C2=A010.994096] platform gpio-keys: deferred probe pending<br>
<br><br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 25, 2024 at 2:30=E2=80=AFPM Mario Marietto &lt;=
<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span st=
yle=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">When I unpack th=
is file :</span></span></div><div><span style=3D"font-family:monospace"><sp=
an style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span>=
</span></div><div><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">lineage-21.0-20240618-UNOFF=
ICIAL-KonstaKANG-rpi4-atv.img</span></span></div><div><span style=3D"font-f=
amily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,2=
55,255)"><br></span></span></div><div><span style=3D"font-family:monospace"=
><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">I get t=
hese files :</span></span></div><div><span style=3D"font-family:monospace">=
<span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></sp=
an></span></div><div><span style=3D"font-family:monospace"><span style=3D"c=
olor:rgb(0,0,0);background-color:rgb(255,255,255)">0.fat</span><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br>1.img<span style=3D"color:rgb(0,0,0);background-color:rgb(255,25=
5,255)">
</span><br>2.img
<br>3.img</span></div><div><span style=3D"font-family:monospace"><br></span=
></div><div><span style=3D"font-family:monospace">So,I assume that :</span>=
</div><div><span style=3D"font-family:monospace"><br></span></div><div><spa=
n style=3D"font-family:monospace">0.fat is : initrd</span></div><div><span =
style=3D"font-family:monospace">1.img is : </span>system-rw.img<br>2.img is=
=C2=A0=C2=A0 :=C2=A0 vendor-rw.img<br>3.img is=C2=A0=C2=A0 :=C2=A0 userdata=
.img</div><div><br></div><div>If I use 0.fat as initrd,like this :</div><di=
v><br></div><div><span style=3D"font-family:monospace"><span style=3D"color=
:rgb(24,178,178);background-color:rgb(255,255,255)">-initrd /mnt/zroot2/zro=
ot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/0.fat</sp=
an></span></div><div><span style=3D"font-family:monospace"><span style=3D"c=
olor:rgb(24,178,178);background-color:rgb(255,255,255)"><br></span></span><=
/div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(24=
,178,178);background-color:rgb(255,255,255)">I get this message :</span></s=
pan></div><div><span style=3D"font-family:monospace"><span style=3D"color:r=
gb(24,178,178);background-color:rgb(255,255,255)"><br></span></span></div><=
div><span>rootfs image is not initramfs (invalid magic at start of compress=
ed archive); looks like an initrd</span></div><div><span><br></span></div><=
div><span>it looks like an initrd : right,it&#39;s true : it is initrd. (fo=
r this reason I&#39;ve assumed that 0.fat is initrd...</span></div><div><sp=
an><br></span></div><div><span style=3D"font-family:monospace"></span></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, Aug 25, 2024 at 1:26=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Su=
n, 25 Aug 2024 at 11:45, Mario Marietto &lt;<a href=3D"mailto:marietto2008@=
gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Please look at this example :<br>
&gt;<br>
&gt; qemu-system-aarch64 \<br>
&gt; -smp 4 \<br>
&gt; -m 2048 \<br>
&gt; -cpu cortex-a72 \<br>
&gt; -machine virt \<br>
&gt; -serial stdio \<br>
&gt; -kernel /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-K=
onstaKANG-rpi4-atv/boot/Image \<br>
<br>
This (assuming it&#39;s the complete command line your script is<br>
running) doesn&#39;t pass any arguments telling QEMU to provide a<br>
root disk, and it doesn&#39;t pass any arguments to the kernel<br>
telling it what root disk to use...<br>
<br>
&gt; [=C2=A0 =C2=A0 0.000000] Kernel command line: console=3DttyAMA0,115200=
 kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rootwait a=
ndroidboot.serialno=3D10000000abcd1234 androidboot.btmacaddr=3D11:22:33:44:=
55:66<br>
<br>
...so the kernel defaults to &quot;/dev/mmcblk0p2&quot; as its root disk be=
cause<br>
it&#39;s using the command line argument that was compiled into it...<br>
<br>
&gt; [=C2=A0 =C2=A0 0.658240] Waiting for root device /dev/mmcblk0p2...<br>
<br>
...and then it&#39;s hanging around forever waiting for that.<br>
<br>
You need to:<br>
=C2=A0(1) pass QEMU arguments telling it to provide a root fs<br>
=C2=A0(2) pass the kernel arguments telling it to look for the<br>
=C2=A0 =C2=A0 =C2=A0root fs in the place where QEMU is providing it<br>
<br>
Your other command line looks more on the right lines:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel<br>
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/boot/Image<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd<br>
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/0.fat<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D0,if=3Dnone,id=3Dsystem,file=3D/=
mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4=
-atv/1.img<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dsystem \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D1,if=3Dnone,id=3Dvendor,file=3D/=
mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4=
-atv/2.img<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dvendor \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D2,if=3Dnone,id=3Duserdata,file=
=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/3.img<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Duserdata \<br>
<br>
though I wonder if the kernel really expects a<br>
FAT file for the initrd, given it complains:<br>
<br>
[=C2=A0 =C2=A0 0.344033] Trying to unpack rootfs image as initramfs...<br>
[=C2=A0 =C2=A0 0.344947] rootfs image is not initramfs (invalid magic at st=
art<br>
of compressed archive); looks like an initrd<br>
<br>
and then later<br>
<br>
[=C2=A0 =C2=A0 5.905329] RAMDISK: Couldn&#39;t find valid RAM disk image st=
arting at 0.<br>
<br>
I think if I were you I&#39;d start by figuring out what&#39;s going on<br>
with the initrd.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000ccd7e40620a9e43a--
