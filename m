Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp123236lfq;
        Mon, 5 Oct 2020 15:08:28 -0700 (PDT)
X-Received: by 2002:a05:6638:242:: with SMTP id w2mr1953949jaq.32.1601935708841;
        Mon, 05 Oct 2020 15:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601935708; cv=none;
        d=google.com; s=arc-20160816;
        b=z34/+6AVzDc9u5l9DfXvMKsxJTbnmBq0YThCcyoOiM++1qSnGgixCgOPfpkRaY7jL7
         7hp//bMcggmjE6408KQuyV2CsAplkH31f6zB11fqRSIc4aCggJShr7rkgWJEPV6oOo4V
         WfjwLJGgBoRNLM+cIYX7IX4lqtTrun8BLtl7a2zSyZ6i7c1wh5vqVVCC2CwSn31dWDs3
         /GHqNZfUsJC9Vwj+oR6suvQds2aFNmSxrvbkoDQ1xy7FNnKORnWppL2EvofmcsZbPbXP
         ebcxkim1wUB3mIVP1mYbMC0frNWd87cdxBJPFpSNJLA945H/ZADU0eoJ+xvj2qLZnMKc
         /9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kElEDkSB/y1n8weFenZdcNF8XtMXgsLU4Kh6hIb6KhE=;
        b=nPutXmdZnI2pct9IRGjz+S7dPZc1JqvIk8XaqAKetJhDNm9I58CmusNR4UoK1umYU9
         ArH6TXcZxRAtKuEx/Kcav2DGtM6jv5KQ+7T1UUvlLEFPMbi6+9Pebrm2BJt9SiK5VrlY
         FHQgbezk6AK0f5mqpd6QR4Ax3ZbpOfT+iwzbcX0sXffwtEy4C461fB6znYhDi1AC9Hw6
         E7kzu5yh01juKNweERlA7hrJDC3YaAqm4fNqm50j60kUWeu9jgfFzEDIQbt6Y0Ejp3QL
         kIZa37iv0QTYyVRpJF0HVLzL2D919cg3ia1srBJrftPmEBs2R3lhT/TalVljSpEN3x2w
         pj9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=R1vAemth;
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <pauldzim@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r14sor1122380iog.50.2020.10.05.15.08.28
        (Google Transport Security);
        Mon, 05 Oct 2020 15:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=R1vAemth;
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kElEDkSB/y1n8weFenZdcNF8XtMXgsLU4Kh6hIb6KhE=;
        b=R1vAemthUV9oDEeIt18p0l4JV6tVztg5F6sn2Ne8yfyuKkHYfSgBfUuMuaFD4oMRGT
         DEZZFM5Sy82H6KoaWbjGf2hd/iSzeXd7LkG2coMbqBfWS93cwMqyKDynyhlABZrRGy7A
         vELmLxwg4uEUnsJAbSeIfKzJUgXnTl+A20IY2+iKFSzPQfJ8kFEtBQ1gbeXIPpssZeud
         nv2T4wPMjU4l2nVZut2LeOGqJg8p9GYU3oboy/oY6JIvrB25sJLrlyQIrexrDWEf43Rc
         hb1p4JDzSDcnQHVrQXcg/xhD9V6PUeLZlf+8ZQgLmYSTPdnfDGIWlJyDr89uN0vxEMte
         KWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kElEDkSB/y1n8weFenZdcNF8XtMXgsLU4Kh6hIb6KhE=;
        b=JSup2u3HiIx12Lw9A9bxim14SR/MzxvNS3LQCHgwXRfoR2hYGRLvUYHghO31UmBI+O
         9hqdUvI5zL8D7UpZ9z23a5sg+QlFBGl/tvcV8vPp305Nk7+ldD78gjJVa3SgNNxK4sDS
         4T+SSsvrnrx00RY2aTpNMnfpco0J4sXPwIYyFkesrN1y8cVaNtUqG1QEWxAXWhEOnlpb
         TKFbIhqgy1VsmJN9ilf54OLTAs9kqwPyCynPL3/j2txFTsPGdu90MnB8ODnSKjFFkMU9
         Tn8hBbixqwfnoGcn1xhpPQwuj50rdrnriUDOiGT28iX8ApDYnzbu88trKZasXau0Htpe
         RRlg==
X-Gm-Message-State: AOAM533f/8/GfvhXY+sWRvayVTpynp4lPluze2P4WhCn9oyw+cZNQnbS
	HfYysJEx6HG+P9+YdjOrLbqsXLV4O089T0Eliso=
X-Google-Smtp-Source: ABdhPJyAcK5k/Z3L/MsVmIqHhVLm/oDJ7g3NCoMd4/FuMTqRrpHuw2hfc7SWaKiSei3jIR7gFYqUYMGf3PUu1Xeb1RA=
X-Received: by 2002:a02:a50c:: with SMTP id e12mr1953982jam.26.1601935708217;
 Mon, 05 Oct 2020 15:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org> <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
In-Reply-To: <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Mon, 5 Oct 2020 15:08:01 -0700
Message-ID: <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
Subject: Re: Emulate Rpi with QEMU fails
To: Thomas Schneider <74cmonty@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: g+NGsPn0k37J

If you can upgrade to Qemu 5.1 or newer, you should be able to use the
builtin raspi2 or raspi3 emulation directly. Version 5.1 adds support for t=
he
USB controller on the Pi.

There is no limitation on the amount of memory you can use with this
method, and the networking should work.

Here is the command line I use to run the Raspbian image
2019-09-26-raspbian-buster. I extracted bcm2709-rpi-2-b and
kernel7.img from the FAT partition inside the image file.

qemu-system-arm -M raspi2 -drive
file=3Dbootpi/2019-09-26-raspbian-buster.img,format=3Draw,if=3Dsd -dtb
bcm2709-rpi-2-b.dtb -kernel kernel7.img -append 'rw
earlycon=3Dpl011,0x3f201000 console=3DttyAMA0 loglevel=3D8
root=3D/dev/mmcblk0p2 fsck.repair=3Dyes net.ifnames=3D0 rootwait memtest=3D=
1
dwc_otg.fiq_fsm_enable=3D0' -serial stdio -no-reboot -netdev
user,id=3Dnet0 -usb -device usb-kbd -device usb-tablet -device
usb-net,netdev=3Dnet0

Hope this helps.

On Mon, Oct 5, 2020 at 3:51 AM Thomas Schneider <74cmonty@gmail.com> wrote:
>
> Hello,
>
> thanks for your replies.
>
> I must admit that I don't fully understand your analysis.
> However you made some conclusions that are correct.
>
> In fact I have found a Github repo
> <https://github.com/dhruvvyas90/qemu-rpi-kernel> where a specific kernel
> and versatile-pb are provided + instructions for lauching the emulation
> with the original RPi image file:
> $ qemu-system-arm \
>    -M versatilepb \
>    -cpu arm1176 \
>    -m 256 \
>    -drive
> "file=3D/.../2020-05-27-raspios-buster-lite-armhf.img,if=3Dnone,index=3D0=
,media=3Ddisk,format=3Draw,id=3Ddisk0"
> \
>    -device
> "virtio-blk-pci,drive=3Ddisk0,disable-modern=3Don,disable-legacy=3Doff" \
>    -net "user,hostfwd=3Dtcp::5022-:22" \
>    -dtb /.../versatile-pb-buster-5.4.51.dtb \
>    -kernel /.../kernel-qemu-5.4.51-buster \
>    -append 'root=3D/dev/vda2 panic=3D1' \
>    -no-reboot
>
> This means it is more recent than the Raspberry Pi Geek article, and the
> emulation works.
> But I'm not sure if this usable considering the added models -M raspi2
> and -M raspi3.
>
> Can you please advise how to proceed?
>
> In addition I would like to know if there's a memory limitation using
> models -M raspi2 and -M raspi3?
> To my understanding there's a limitation to 256MB using -M versatilepb.
> If yes, I consider to another raw image located on host's temporary
> filesystem and use this a swap in the client.
>
> And how can I make use of a client network device that is based on
> host's tap device connected to a network bridge?
>
> THX
>
>
> Am 05.10.2020 um 11:40 schrieb Alex Benn=C3=A9e:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> >> On Sun, 4 Oct 2020 at 18:44, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>> Thomas <74cmonty@gmail.com> writes:
> >>>> I'm trying to emulate Rpi with QEMU.
> >>>> I found
> >>>> [url=3D1]this[/url]
> >>>> arcticle in Raspberry Pi Geek documenting the steps including persis=
tent
> >>>> storage on host.
> >>>>
> >>>> However when starting the emulation with command
> >>>> qemu-system-arm -M versatilepb -cpu arm1176 -m 256 -serial stdio -hd=
a
> >>>> 2020-08-20-raspios-buster-armhf-lite.img -net
> >>>> "user,hostfwd=3Dtcp::5022-:22" -dtb versatile-pb-buster.dtb -kernel
> >>>> kernel-qemu-5.4.51-buster -append "root=3D/dev/sda2 rootfstype=3Dext=
4 rw
> >>>> panic=3D1" -no-reboot
> >>> Let's start with the fact you are using a versatilepb machine type wi=
th
> >>> a versatilepb dtb and not the rasppi model.
> >> Given the name of the kernel image, this probably actually *is*
> >> built for versatilepb, or it wouldn't have got as far as failing
> >> to mount the root partition. There seems to be a lot of confusion
> >> in the raspberry pi community about the difference between
> >> running the raspi userspace plus a for-versatilepb kernel
> >> versus running a full raspi setup.
> > Ahh your German is considerably better than mine ;-) Looking more
> > closely at the blog it seems to be predicated on extracting a Raspbian
> > kernel which at least stands a fighting chance of being a multi_config
> > kernel - like the buster above.
> >
> > I can see why these sorts of shenanigans used to be pulled when there
> > where no RaspPi models although if all you want to do is run an ARM use=
r
> > space what's wrong with using linux-user for this sort of thing?
> >
> >> Anyway, failing to mount the rootfs and not listing any
> >> sda devices is not a problem with the fstab, because the system
> >> hasn't got as far as being able to mount the filesystem with a
> >> fstab on it yet. One possibility is that the kernel is
> >> missing the device drivers for either PCI or for the SCSI
> >> controller that gets plugged in to versatilepb by default.
> >>
> >> My guess at the cause is that you're trying to boot a Linux 5.somethin=
g
> >> kernel and you've run into the issue described in this thread:
> >> https://lists.gnu.org/archive/html/qemu-discuss/2020-09/msg00023.html
> >> where the Linux 5.x sym53c8xx scsi driver is not compatible with QEMU'=
s
> >> emulation of that device. If that's the case then you should see
> >> earlier in the kernel boot log error messages similar to the ones
> >> that Roger reported. The fix would be either to use an older
> >> kernel, or to change the QEMU commandline to use a different
> >> SCSI controller (or to use a virtio block device).
> > Do we have any documentation for the RaspPi models? The acceptance test=
s
> > look like they support the inbuilt MMC/SD controller device:
> >
> >          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> >                                 serial_kernel_cmdline[uart_id] +
> >                                 ' root=3D/dev/mmcblk0p2 rootwait ' +
> >                                 'dwc_otg.fiq_fsm_enable=3D0')
> >
> > It would be useful to fill the hole in the documentation so gently stee=
r
> > people away from these hybrid franken-machine approaches.
> >
> >> thanks
> >> -- PMM
> >
>
>
