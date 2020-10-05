Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t202sm12801892wmt.14.2020.10.05.02.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 02:40:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 69E351FF7E;
	Mon,  5 Oct 2020 10:40:45 +0100 (BST)
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas <74cmonty@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: Emulate Rpi with QEMU fails
In-reply-to: <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
Date: Mon, 05 Oct 2020 10:40:45 +0100
Message-ID: <875z7p3t9e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: pi4GbUmYQn/i


Peter Maydell <peter.maydell@linaro.org> writes:

> On Sun, 4 Oct 2020 at 18:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>> Thomas <74cmonty@gmail.com> writes:
>> > I'm trying to emulate Rpi with QEMU.
>> > I found
>> > [url=3D1]this[/url]
>> > arcticle in Raspberry Pi Geek documenting the steps including persiste=
nt
>> > storage on host.
>> >
>> > However when starting the emulation with command
>> > qemu-system-arm -M versatilepb -cpu arm1176 -m 256 -serial stdio -hda
>> > 2020-08-20-raspios-buster-armhf-lite.img -net
>> > "user,hostfwd=3Dtcp::5022-:22" -dtb versatile-pb-buster.dtb -kernel
>> > kernel-qemu-5.4.51-buster -append "root=3D/dev/sda2 rootfstype=3Dext4 =
rw
>> > panic=3D1" -no-reboot
>>
>> Let's start with the fact you are using a versatilepb machine type with
>> a versatilepb dtb and not the rasppi model.
>
> Given the name of the kernel image, this probably actually *is*
> built for versatilepb, or it wouldn't have got as far as failing
> to mount the root partition. There seems to be a lot of confusion
> in the raspberry pi community about the difference between
> running the raspi userspace plus a for-versatilepb kernel
> versus running a full raspi setup.

Ahh your German is considerably better than mine ;-) Looking more
closely at the blog it seems to be predicated on extracting a Raspbian
kernel which at least stands a fighting chance of being a multi_config
kernel - like the buster above.

I can see why these sorts of shenanigans used to be pulled when there
where no RaspPi models although if all you want to do is run an ARM user
space what's wrong with using linux-user for this sort of thing?

> Anyway, failing to mount the rootfs and not listing any
> sda devices is not a problem with the fstab, because the system
> hasn't got as far as being able to mount the filesystem with a
> fstab on it yet. One possibility is that the kernel is
> missing the device drivers for either PCI or for the SCSI
> controller that gets plugged in to versatilepb by default.
>
> My guess at the cause is that you're trying to boot a Linux 5.something
> kernel and you've run into the issue described in this thread:
> https://lists.gnu.org/archive/html/qemu-discuss/2020-09/msg00023.html
> where the Linux 5.x sym53c8xx scsi driver is not compatible with QEMU's
> emulation of that device. If that's the case then you should see
> earlier in the kernel boot log error messages similar to the ones
> that Roger reported. The fix would be either to use an older
> kernel, or to change the QEMU commandline to use a different
> SCSI controller (or to use a virtio block device).

Do we have any documentation for the RaspPi models? The acceptance tests
look like they support the inbuilt MMC/SD controller device:

        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
                               serial_kernel_cmdline[uart_id] +
                               ' root=3D/dev/mmcblk0p2 rootwait ' +
                               'dwc_otg.fiq_fsm_enable=3D0')

It would be useful to fill the hole in the documentation so gently steer
people away from these hybrid franken-machine approaches.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
