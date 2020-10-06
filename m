Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp412686lfq;
        Mon, 5 Oct 2020 23:58:25 -0700 (PDT)
X-Received: by 2002:a17:906:6a4e:: with SMTP id n14mr2625077ejs.14.1601967505533;
        Mon, 05 Oct 2020 23:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601967505; cv=none;
        d=google.com; s=arc-20160816;
        b=S7FvI8Zwtd64bunum3TTEULYMuAwNNbUtS5d0H1Rl9F1j/FpU6GeXJcIRqS4TMMGym
         orWNmx0bynNzu3bzghn3BuNJZSsUsz3tXhnLIqTCHZFPVFyCKXkyuVQOL4TR2YiY0Jw1
         fGu9VHDR/9Xe4nOx3d8lB5XBv/hVsB6dOjaJJltw/EykTSZBLrkIVfSIgrUbJnuiLTQd
         0thPY3Wj28MIIXCo2l2ZWQq/AXTERhOXuvhtVIq2gXyDGmoCv/hlNGNWhPCzYiM+QGG2
         0KXZP+MwjGZYsplawA9b38Mm4mfI8qRUUc5U8zAVP69YRgG9GUZymMKjleSBhVQz7DtG
         7IUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=gSNo/iVKw0b/U1AJxJHVjcbsRGqawrAy4cj6DiNCzWA=;
        b=jN8TH98vpxtX/MckZ5nJBozRM+vS3X+l4qlWMc4zhRvCiNGA3OAETjXHd0ikRicnJv
         /fI3HtNj78aw7iTzIoZtJrBZau3pukmROJ37FQpKetcxjoJtOGvrzgeS/t47J/hrhjBp
         TUvBvszuXxBLzf05ZdYvo47zdoH7mpFynZ2Dw6ETuxuThhx4G26judp+knQV+XwEIDWH
         hvYc+OewslIegR8xkaWsLY/NLxvoGsvots0SoCHF0d3coOUooMxbfoIGlgSKbmcy3CHO
         ryAuCjtPuXkiRH6zf+pugWEg2p7DAaOzd9FX/BsdyOdXVtJapc9Q4qaMos3QXplOB/J/
         6Evg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="d4/YkQ6f";
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <74cmonty@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v17sor1247751ejc.29.2020.10.05.23.58.25
        (Google Transport Security);
        Mon, 05 Oct 2020 23:58:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="d4/YkQ6f";
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=gSNo/iVKw0b/U1AJxJHVjcbsRGqawrAy4cj6DiNCzWA=;
        b=d4/YkQ6fvVjozjZQxqSgHoH47+UOZ+6MIIl3i0jqccl+gWYT2JcY5M7HW/bZVdH5rr
         yMhfbD7iMOxptWK6yjeT/1PYXc/kDBVnp3axbrs6CxrgNX7TGVGd51R1t6F4OIhJQLD3
         HJU3xjUad1IPFsw+evZv/jz5Ck6Vg+pHJhAln4YCg5n2JWlHi3OrUe1nLVGHR0fvEgYt
         8HyuGWj6FTYbpmbE755APl5gt1VQK99XQdq6knQukor6L6CetVVmfBwkMiVwdFBUGmhf
         5wPKbhROIzVoArtcXCf2enZ+b6Lf3OOa2n8qZ+CEjsSWIndNja2CV5MuqDBlHnxeFWr4
         rS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=gSNo/iVKw0b/U1AJxJHVjcbsRGqawrAy4cj6DiNCzWA=;
        b=dj8KQpOVloReBKwWxjOqIU53hKzodbfnFKuyZF0/B3xnTOm1/G5JRcz2hoZ+CmWidh
         PrnOklYXHLhTRHPXmfZu9+i1d7maX9h6QRDQAH1uc5DNBhexmmP0cAiPjZRj9OkXvnEW
         jjEPzfzqmckCktugmy3eULb2qJPppGCJ7K44dqE+BcLhXkcBt2ovnbUg5g8GyibL+sQ2
         yhR2cXhHl7s0aKp89YzfO1uIxq6+8rkzlUk53PB7IjDO1x+149mWZOsoBSx3bf5bO/uU
         d5Upgqj2Xg7qqxTBhgVNiiJuheGpYdzbDjADvSj7WzvDnJwuck7Gv83NMR0KvzJOrPiR
         G6jw==
X-Gm-Message-State: AOAM5318V/zxKArI1VWk0KDBBQwuqFMqMhpK7B/uxZu5P0MhM30EPRrT
	cRIz6UHIm+NtnziuLxntf42Drj+3dA9kvw==
X-Google-Smtp-Source: ABdhPJyvd7jgQ1rTfMhMkRTAlUXQmGwps9faPyffEBXg55eqVOLLLvCpq7ed0Eiuhqk3W1jMziSFaA==
X-Received: by 2002:a17:906:515:: with SMTP id j21mr3571564eja.105.1601967504903;
        Mon, 05 Oct 2020 23:58:24 -0700 (PDT)
Return-Path: <74cmonty@gmail.com>
Received: from [10.16.23.138] ([193.16.224.10])
        by smtp.gmail.com with ESMTPSA id e4sm1647990edk.38.2020.10.05.23.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 23:58:23 -0700 (PDT)
Subject: Re: Emulate Rpi with QEMU fails
To: Paul Zimmerman <pauldzim@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
From: Thomas Schneider <74cmonty@gmail.com>
Message-ID: <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com>
Date: Tue, 6 Oct 2020 08:58:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZRrGausIMksB

Hello Paul,

many thanks for sharing this info.

Can you confirm that the emulated RPi with your command will use 
"internal QEMU" network, means the client cannot be accessed from any 
other device in LAN?
If yes, what is required to setup a TAP connected to host's network bridge?

Regards
Thomas

Am 06.10.2020 um 00:08 schrieb Paul Zimmerman:
> If you can upgrade to Qemu 5.1 or newer, you should be able to use the
> builtin raspi2 or raspi3 emulation directly. Version 5.1 adds support for the
> USB controller on the Pi.
>
> There is no limitation on the amount of memory you can use with this
> method, and the networking should work.
>
> Here is the command line I use to run the Raspbian image
> 2019-09-26-raspbian-buster. I extracted bcm2709-rpi-2-b and
> kernel7.img from the FAT partition inside the image file.
>
> qemu-system-arm -M raspi2 -drive
> file=bootpi/2019-09-26-raspbian-buster.img,format=raw,if=sd -dtb
> bcm2709-rpi-2-b.dtb -kernel kernel7.img -append 'rw
> earlycon=pl011,0x3f201000 console=ttyAMA0 loglevel=8
> root=/dev/mmcblk0p2 fsck.repair=yes net.ifnames=0 rootwait memtest=1
> dwc_otg.fiq_fsm_enable=0' -serial stdio -no-reboot -netdev
> user,id=net0 -usb -device usb-kbd -device usb-tablet -device
> usb-net,netdev=net0
>
> Hope this helps.
>
> On Mon, Oct 5, 2020 at 3:51 AM Thomas Schneider <74cmonty@gmail.com> wrote:
>> Hello,
>>
>> thanks for your replies.
>>
>> I must admit that I don't fully understand your analysis.
>> However you made some conclusions that are correct.
>>
>> In fact I have found a Github repo
>> <https://github.com/dhruvvyas90/qemu-rpi-kernel> where a specific kernel
>> and versatile-pb are provided + instructions for lauching the emulation
>> with the original RPi image file:
>> $ qemu-system-arm \
>>     -M versatilepb \
>>     -cpu arm1176 \
>>     -m 256 \
>>     -drive
>> "file=/.../2020-05-27-raspios-buster-lite-armhf.img,if=none,index=0,media=disk,format=raw,id=disk0"
>> \
>>     -device
>> "virtio-blk-pci,drive=disk0,disable-modern=on,disable-legacy=off" \
>>     -net "user,hostfwd=tcp::5022-:22" \
>>     -dtb /.../versatile-pb-buster-5.4.51.dtb \
>>     -kernel /.../kernel-qemu-5.4.51-buster \
>>     -append 'root=/dev/vda2 panic=1' \
>>     -no-reboot
>>
>> This means it is more recent than the Raspberry Pi Geek article, and the
>> emulation works.
>> But I'm not sure if this usable considering the added models -M raspi2
>> and -M raspi3.
>>
>> Can you please advise how to proceed?
>>
>> In addition I would like to know if there's a memory limitation using
>> models -M raspi2 and -M raspi3?
>> To my understanding there's a limitation to 256MB using -M versatilepb.
>> If yes, I consider to another raw image located on host's temporary
>> filesystem and use this a swap in the client.
>>
>> And how can I make use of a client network device that is based on
>> host's tap device connected to a network bridge?
>>
>> THX
>>
>>
>> Am 05.10.2020 um 11:40 schrieb Alex Bennée:
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Sun, 4 Oct 2020 at 18:44, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>> Thomas <74cmonty@gmail.com> writes:
>>>>>> I'm trying to emulate Rpi with QEMU.
>>>>>> I found
>>>>>> [url=1]this[/url]
>>>>>> arcticle in Raspberry Pi Geek documenting the steps including persistent
>>>>>> storage on host.
>>>>>>
>>>>>> However when starting the emulation with command
>>>>>> qemu-system-arm -M versatilepb -cpu arm1176 -m 256 -serial stdio -hda
>>>>>> 2020-08-20-raspios-buster-armhf-lite.img -net
>>>>>> "user,hostfwd=tcp::5022-:22" -dtb versatile-pb-buster.dtb -kernel
>>>>>> kernel-qemu-5.4.51-buster -append "root=/dev/sda2 rootfstype=ext4 rw
>>>>>> panic=1" -no-reboot
>>>>> Let's start with the fact you are using a versatilepb machine type with
>>>>> a versatilepb dtb and not the rasppi model.
>>>> Given the name of the kernel image, this probably actually *is*
>>>> built for versatilepb, or it wouldn't have got as far as failing
>>>> to mount the root partition. There seems to be a lot of confusion
>>>> in the raspberry pi community about the difference between
>>>> running the raspi userspace plus a for-versatilepb kernel
>>>> versus running a full raspi setup.
>>> Ahh your German is considerably better than mine ;-) Looking more
>>> closely at the blog it seems to be predicated on extracting a Raspbian
>>> kernel which at least stands a fighting chance of being a multi_config
>>> kernel - like the buster above.
>>>
>>> I can see why these sorts of shenanigans used to be pulled when there
>>> where no RaspPi models although if all you want to do is run an ARM user
>>> space what's wrong with using linux-user for this sort of thing?
>>>
>>>> Anyway, failing to mount the rootfs and not listing any
>>>> sda devices is not a problem with the fstab, because the system
>>>> hasn't got as far as being able to mount the filesystem with a
>>>> fstab on it yet. One possibility is that the kernel is
>>>> missing the device drivers for either PCI or for the SCSI
>>>> controller that gets plugged in to versatilepb by default.
>>>>
>>>> My guess at the cause is that you're trying to boot a Linux 5.something
>>>> kernel and you've run into the issue described in this thread:
>>>> https://lists.gnu.org/archive/html/qemu-discuss/2020-09/msg00023.html
>>>> where the Linux 5.x sym53c8xx scsi driver is not compatible with QEMU's
>>>> emulation of that device. If that's the case then you should see
>>>> earlier in the kernel boot log error messages similar to the ones
>>>> that Roger reported. The fix would be either to use an older
>>>> kernel, or to change the QEMU commandline to use a different
>>>> SCSI controller (or to use a virtio block device).
>>> Do we have any documentation for the RaspPi models? The acceptance tests
>>> look like they support the inbuilt MMC/SD controller device:
>>>
>>>           kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>>>                                  serial_kernel_cmdline[uart_id] +
>>>                                  ' root=/dev/mmcblk0p2 rootwait ' +
>>>                                  'dwc_otg.fiq_fsm_enable=0')
>>>
>>> It would be useful to fill the hole in the documentation so gently steer
>>> people away from these hybrid franken-machine approaches.
>>>
>>>> thanks
>>>> -- PMM
>>
