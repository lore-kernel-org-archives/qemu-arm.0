Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp439994lfq;
        Tue, 6 Oct 2020 00:42:57 -0700 (PDT)
X-Received: by 2002:a05:6638:97:: with SMTP id v23mr101068jao.7.1601970177655;
        Tue, 06 Oct 2020 00:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601970177; cv=none;
        d=google.com; s=arc-20160816;
        b=kqCe2eNqEtp2sk6dcS3jrD1S94d+gGY3l3w/2sRT9mnjoxTc5TzWLoF0/6RDt81hrO
         xPkgqRj5ZYCm5ldS0GlJ1ZRw5jD+Vu79HP7vreVg8rEUde7CZI80BsZU0GUvo3zJzCtw
         Hbkbm7FbAjpbKa6QDNT8I/M3gOBr24r44dsP77Z8AmA/u+FJoerG1k3gsb6ciJ7rLi6T
         xPq9z2GxUfe2VjO96MBqEzhUVq7HnVmBmQ4hgIoTvj7zJlDdUm3RoUnZom6Y9lpjGCi+
         rMkbS1fjFbSMS+DelX9vdwoeFJg9gSprfWEam1UgsJTaRviDuctpiyOh1oQuuYusRfAW
         9CFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EpNOyjJEoGEqkUe5g40gxaSooCGpNy6YOittGiTUrOg=;
        b=z2Dfmv0lY+Hl9arG0RgKswjrwKe2MoYq3+MDp8f6g7LEhj+9icWB3mdiYo/e0GvNMk
         EYTlfer2C7FiIqgi7IxmwAcbp9+DNNDJ4qvjRe3ugi4frB97/MHQViG4ZhRbJRkA4BFa
         iCsmjFtST4vcLCy2Eeci8H0igVAxM5H07vsYXeqPDnzNNL5wZOIzvWvmy85wpQsT8UF3
         FrCx15Z9IdCdaWhxSaqWxAc5fC4oK8C5IU39c0CZzniw0JU6ze2+oO3RUqLSCSlfKov8
         xxZG1Lvfx63Z7qYrgvuUb1SaIwfFiXi2H+L14TkTRnOwc5cJmimat8buHo+5LNua/vxU
         dEZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=F+imbLJz;
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <pauldzim@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v4sor1456476ilk.12.2020.10.06.00.42.57
        (Google Transport Security);
        Tue, 06 Oct 2020 00:42:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=F+imbLJz;
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EpNOyjJEoGEqkUe5g40gxaSooCGpNy6YOittGiTUrOg=;
        b=F+imbLJzEv4PYSQQUvKYEtwaTGq3yGaPYHAQDOusbGc75v5edHj6caQZE0kQqNUWsw
         6koR4aS1SeJhHhwHS4gryARVcE64VbwWup6e5am4NuxFC7DhAPWhF9BU3QGrFicrSTBY
         YXKosWkWEjMm4ldFnS7bXPQ2pl5Rxqkdg9IiajtU2QgPF9r+DL5UdhjOjh84IcsKYNZH
         jVE4GRh++5M1rRxFQp+TL1T8Znv0sb1dEX0kdPjSbfUACmIxAlRMgkQEbfRfsB8b+j30
         +5r+12YTECFFoDPa3eRMA8X15gU5BKix8O1sz1CUgM9gnl+9njLqwv8GMhTSgIn6ocXU
         4ClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EpNOyjJEoGEqkUe5g40gxaSooCGpNy6YOittGiTUrOg=;
        b=DpaMomVhK8fFMbncvqvdJl06JjmOF+iTGeLd4KuLIOjcI3XdkdaeWH2LMxfZSj4NKG
         5EtHTYxW7Fs6Ce1/ccVpUhRU6VjzkrkmejYB9TB0FrERULnfLjrRj82uI/inL6QgJbFN
         37snB6M+dpFlpHtT2V1zp5iUdGf0DO85S9ysEuFKWBwLQ3Fg0CivpQnaduY/iEdPtY7x
         q8HR15BFPExswtBoFscl9TrRuKa0Nf28bhLM4XXrfiBluQKsd7HkKZn3DmPhVhf2SAOR
         msF6ZJDHC1SlBisgUYrz0n61QgFVirjK6dlVw+cBG0d4dWPPjEmt8UfNPjhnj6JDDim6
         CbJA==
X-Gm-Message-State: AOAM531cBQG1htEnI1b0Z3gCxT68zYCjI10GDQevy27TKQTq40m/EJ7T
	Q0Zml15EZTDYTV3JtDdzf/ig51EUDpl19Kas3fM=
X-Google-Smtp-Source: ABdhPJy2/JojQvJjFqufGOBXzrpxj6rDm+pl4kf5qOsU1jCjvZAkGUrFY4DKTawn7LKM3gu4yL0V+aHKQc73VLVcMkM=
X-Received: by 2002:a92:9ec7:: with SMTP id s68mr2475643ilk.143.1601970176959;
 Tue, 06 Oct 2020 00:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org> <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com> <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com>
In-Reply-To: <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Tue, 6 Oct 2020 00:42:30 -0700
Message-ID: <CADBGO7_vtjOtQ4k_FH_0=W4w2pZpX8Z6qiuhJT2szdHJCcdw6A@mail.gmail.com>
Subject: Re: Emulate Rpi with QEMU fails
To: Thomas Schneider <74cmonty@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WZrI47S7Nc10

On Mon, Oct 5, 2020 at 11:58 PM Thomas Schneider <74cmonty@gmail.com> wrote=
:
>
> Hello Paul,
>
> many thanks for sharing this info.
>
> Can you confirm that the emulated RPi with your command will use
> "internal QEMU" network, means the client cannot be accessed from any
> other device in LAN?
> If yes, what is required to setup a TAP connected to host's network bridg=
e?
>
> Regards
> Thomas

That sets up User networking, so yes, generally you cannot access the
client from the outside network.

If you set up a bridge device on the host using TAP, then you can change
the "-netdev user,id=3Dnet0" in the command line to
"-netdev tap,helper=3D/usr/local/libexec/qemu-bridge-helper,id=3Dnet0"
(assuming your qemu was installed in /usr/local) and you should get a fully
functional network connection. I found that the bridge device must be named
"br0" or this will not work.

I found that setting up a bridge device is pretty finicky, though. You can
google for instructions on how to do it. I *think* these are the steps I
followed to make it work for me. This is on Ubuntu, other Linux
distributions work differently I believe. My ethernet device is 'eth0'
and my host ip address is '192.168.0.54', so you should change those
as needed for your environment.

sudo ip link add br0 type bridge
sudo ip tuntap add dev tap0 mode tap
sudo ip link set dev tap0 master br0
sudo ip link set dev eth0 master br0
sudo ip link set dev br0 up
sudo ip address delete 192.168.0.54/24 dev eth0
sudo ip address add 192.168.0.54/24 dev br0
sudo ip route add default via 192.168.0.1 dev br0

- Paul

>
> Am 06.10.2020 um 00:08 schrieb Paul Zimmerman:
> > If you can upgrade to Qemu 5.1 or newer, you should be able to use the
> > builtin raspi2 or raspi3 emulation directly. Version 5.1 adds support f=
or the
> > USB controller on the Pi.
> >
> > There is no limitation on the amount of memory you can use with this
> > method, and the networking should work.
> >
> > Here is the command line I use to run the Raspbian image
> > 2019-09-26-raspbian-buster. I extracted bcm2709-rpi-2-b and
> > kernel7.img from the FAT partition inside the image file.
> >
> > qemu-system-arm -M raspi2 -drive
> > file=3Dbootpi/2019-09-26-raspbian-buster.img,format=3Draw,if=3Dsd -dtb
> > bcm2709-rpi-2-b.dtb -kernel kernel7.img -append 'rw
> > earlycon=3Dpl011,0x3f201000 console=3DttyAMA0 loglevel=3D8
> > root=3D/dev/mmcblk0p2 fsck.repair=3Dyes net.ifnames=3D0 rootwait memtes=
t=3D1
> > dwc_otg.fiq_fsm_enable=3D0' -serial stdio -no-reboot -netdev
> > user,id=3Dnet0 -usb -device usb-kbd -device usb-tablet -device
> > usb-net,netdev=3Dnet0
> >
> > Hope this helps.
> >
> > On Mon, Oct 5, 2020 at 3:51 AM Thomas Schneider <74cmonty@gmail.com> wr=
ote:
> >> Hello,
> >>
> >> thanks for your replies.
> >>
> >> I must admit that I don't fully understand your analysis.
> >> However you made some conclusions that are correct.
> >>
> >> In fact I have found a Github repo
> >> <https://github.com/dhruvvyas90/qemu-rpi-kernel> where a specific kern=
el
> >> and versatile-pb are provided + instructions for lauching the emulatio=
n
> >> with the original RPi image file:
> >> $ qemu-system-arm \
> >>     -M versatilepb \
> >>     -cpu arm1176 \
> >>     -m 256 \
> >>     -drive
> >> "file=3D/.../2020-05-27-raspios-buster-lite-armhf.img,if=3Dnone,index=
=3D0,media=3Ddisk,format=3Draw,id=3Ddisk0"
> >> \
> >>     -device
> >> "virtio-blk-pci,drive=3Ddisk0,disable-modern=3Don,disable-legacy=3Doff=
" \
> >>     -net "user,hostfwd=3Dtcp::5022-:22" \
> >>     -dtb /.../versatile-pb-buster-5.4.51.dtb \
> >>     -kernel /.../kernel-qemu-5.4.51-buster \
> >>     -append 'root=3D/dev/vda2 panic=3D1' \
> >>     -no-reboot
> >>
> >> This means it is more recent than the Raspberry Pi Geek article, and t=
he
> >> emulation works.
> >> But I'm not sure if this usable considering the added models -M raspi2
> >> and -M raspi3.
> >>
> >> Can you please advise how to proceed?
> >>
> >> In addition I would like to know if there's a memory limitation using
> >> models -M raspi2 and -M raspi3?
> >> To my understanding there's a limitation to 256MB using -M versatilepb=
.
> >> If yes, I consider to another raw image located on host's temporary
> >> filesystem and use this a swap in the client.
> >>
> >> And how can I make use of a client network device that is based on
> >> host's tap device connected to a network bridge?
> >>
> >> THX
> >>
> >>
> >> Am 05.10.2020 um 11:40 schrieb Alex Benn=C3=A9e:
> >>> Peter Maydell <peter.maydell@linaro.org> writes:
> >>>
> >>>> On Sun, 4 Oct 2020 at 18:44, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >>>>> Thomas <74cmonty@gmail.com> writes:
> >>>>>> I'm trying to emulate Rpi with QEMU.
> >>>>>> I found
> >>>>>> [url=3D1]this[/url]
> >>>>>> arcticle in Raspberry Pi Geek documenting the steps including pers=
istent
> >>>>>> storage on host.
> >>>>>>
> >>>>>> However when starting the emulation with command
> >>>>>> qemu-system-arm -M versatilepb -cpu arm1176 -m 256 -serial stdio -=
hda
> >>>>>> 2020-08-20-raspios-buster-armhf-lite.img -net
> >>>>>> "user,hostfwd=3Dtcp::5022-:22" -dtb versatile-pb-buster.dtb -kerne=
l
> >>>>>> kernel-qemu-5.4.51-buster -append "root=3D/dev/sda2 rootfstype=3De=
xt4 rw
> >>>>>> panic=3D1" -no-reboot
> >>>>> Let's start with the fact you are using a versatilepb machine type =
with
> >>>>> a versatilepb dtb and not the rasppi model.
> >>>> Given the name of the kernel image, this probably actually *is*
> >>>> built for versatilepb, or it wouldn't have got as far as failing
> >>>> to mount the root partition. There seems to be a lot of confusion
> >>>> in the raspberry pi community about the difference between
> >>>> running the raspi userspace plus a for-versatilepb kernel
> >>>> versus running a full raspi setup.
> >>> Ahh your German is considerably better than mine ;-) Looking more
> >>> closely at the blog it seems to be predicated on extracting a Raspbia=
n
> >>> kernel which at least stands a fighting chance of being a multi_confi=
g
> >>> kernel - like the buster above.
> >>>
> >>> I can see why these sorts of shenanigans used to be pulled when there
> >>> where no RaspPi models although if all you want to do is run an ARM u=
ser
> >>> space what's wrong with using linux-user for this sort of thing?
> >>>
> >>>> Anyway, failing to mount the rootfs and not listing any
> >>>> sda devices is not a problem with the fstab, because the system
> >>>> hasn't got as far as being able to mount the filesystem with a
> >>>> fstab on it yet. One possibility is that the kernel is
> >>>> missing the device drivers for either PCI or for the SCSI
> >>>> controller that gets plugged in to versatilepb by default.
> >>>>
> >>>> My guess at the cause is that you're trying to boot a Linux 5.someth=
ing
> >>>> kernel and you've run into the issue described in this thread:
> >>>> https://lists.gnu.org/archive/html/qemu-discuss/2020-09/msg00023.htm=
l
> >>>> where the Linux 5.x sym53c8xx scsi driver is not compatible with QEM=
U's
> >>>> emulation of that device. If that's the case then you should see
> >>>> earlier in the kernel boot log error messages similar to the ones
> >>>> that Roger reported. The fix would be either to use an older
> >>>> kernel, or to change the QEMU commandline to use a different
> >>>> SCSI controller (or to use a virtio block device).
> >>> Do we have any documentation for the RaspPi models? The acceptance te=
sts
> >>> look like they support the inbuilt MMC/SD controller device:
> >>>
> >>>           kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> >>>                                  serial_kernel_cmdline[uart_id] +
> >>>                                  ' root=3D/dev/mmcblk0p2 rootwait ' +
> >>>                                  'dwc_otg.fiq_fsm_enable=3D0')
> >>>
> >>> It would be useful to fill the hole in the documentation so gently st=
eer
> >>> people away from these hybrid franken-machine approaches.
> >>>
> >>>> thanks
> >>>> -- PMM
> >>
>
