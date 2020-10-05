Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3903240lfq;
        Mon, 5 Oct 2020 03:51:24 -0700 (PDT)
X-Received: by 2002:a05:6402:8d3:: with SMTP id d19mr16262797edz.68.1601895084329;
        Mon, 05 Oct 2020 03:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601895084; cv=none;
        d=google.com; s=arc-20160816;
        b=V2aM4b9Vrxoga9FytOWlTZAHQwzLwdOst1UIo9tcsJyzyvAkc3/TErMwey/phdmvUw
         JcMQUqyxlykTgcbmWffrgcrlFHArG3vK0F5HpEfYVNx9c2tbbx1dZPArxupr2B9pi0ul
         Iz/XRojKSk0/cH5a0mv3y3Bi1fBhBePCsT2ZLT5e92IGmUbryjYsxxYXoLxnr85x9oNt
         MsE4iPtoTrnhS+6+WGRW/v4qRHD83ZvwySUADN+i4rObhelATzmlU63Wt5DR3bnQTg8S
         RcnTU/90FNlOgmnuuPwHEltewjutCcMu1XUCAAOIazVDd5yhR3sfZdLtcOTsvoD1aRZr
         +2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=zlomqrOhtPoc70L+vuBIPNvjCF/pYjLzg+HplJ0eKC0=;
        b=wreBSTah43/aOlKxTym2Pz2qoy/JlnrIyyArwJAF2WfHFsVmb5Hsm/pjXo0sLNAwaa
         RdWDP8R1nGbvCzlxvLGqR5WccmCghDOgxZ9RazDwNzCDEMhpBW+lXZlXXRFvqSdIPnX8
         CS05CK+Jj1f4CdSnkxDQlDOYpA/GM/+bgdNhX1VR3nHzICfQ0lXOLxCTIickgtQwRATH
         TN9v15mYYZ6vMhZB7zr/ztCIgQ3m5WcJ30MsSA1Zu+/Fjs+pIAYuQACMw8dD8vMBY5Ot
         Wba4qkZuq1vfFYieRqdSJxZsyA/v00+dx9bqWPxnCLdxVDZaJKAE7YnoN5894X2eWlXY
         W1Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BLI0v3WD;
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <74cmonty@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id do13sor4709125ejc.14.2020.10.05.03.51.24
        (Google Transport Security);
        Mon, 05 Oct 2020 03:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BLI0v3WD;
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=zlomqrOhtPoc70L+vuBIPNvjCF/pYjLzg+HplJ0eKC0=;
        b=BLI0v3WDQskJrV4IrM0ybWiJfV3gQtMGNnVV1D9T2Bz6nSKIRXriLr9WF7J/DS6ViG
         zkYqkNc78eD8OYKMU5zfk1nQX0JLjBw4thPvkN2KgYtUQMCDZ2k6PlozPYz8Ebu7UR/1
         yVMihR0RvFfr21kocl7zoS4jkGS50fPAoV/Fs2HSsV6QkNKBxMMKtwticWCNY2miResK
         MX7h12VkUQ2DWRPwUMCCoFXnVjoOhTRba76kPiE5KX7sWwtLCifCb6lKIs8O5G0hFzL3
         XgdyvwKZ0hX0IPI3BN0kh+6WAcUMyfxerqcjB3EHeCnn2vQOSgmr1Wi7msC6Q0J/11II
         f4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=zlomqrOhtPoc70L+vuBIPNvjCF/pYjLzg+HplJ0eKC0=;
        b=Y96C7ETjpZh2Oh8b7fSXYOIzNxkT0P7RZRhZArBZLWPXyaIXv8V/1BI3IXZGLVA27E
         Xgsb/feNKEmtzbZvr6r6tkYeflcZvlGk8BrE5nfPZgGwNBMGt949t3gkcNaXBVQzungN
         UO+sr/lZJ3h1ctnExAnEDGijwaS7dbT4NzVBYPu+Uvo800gm5hxMSdr6swVOmAHkcxgE
         VQjBdBdOYapSJnpj5fLHwElH+bovCbyUambhOay93tLpT5G9LcYWsM8ZRj7uSzKVpv54
         s4pa3Gex8pXPzscYs4uSuPmbSpYOoaAehe70xy+1Kj7HXSnOUthxvBL3UAJi0Nod9rLJ
         kbMw==
X-Gm-Message-State: AOAM531bZAz6EatZ0rPxcVMlYzsAYejPTYs6mi2v+reuMSmpfO72maf8
	OlL2hmqZG3mlf62pYz1LnxU=
X-Google-Smtp-Source: ABdhPJwj9d/4ggZf13j2Iv+gSgLTGnY5Gjk5oF2jPz6ugiIQNa1CFlBC83g/Ubap//vkQc5eFxhAlg==
X-Received: by 2002:a17:906:f14b:: with SMTP id gw11mr14663475ejb.41.1601895083880;
        Mon, 05 Oct 2020 03:51:23 -0700 (PDT)
Return-Path: <74cmonty@gmail.com>
Received: from [10.16.55.97] ([193.16.224.1])
        by smtp.gmail.com with ESMTPSA id d25sm8344254edq.52.2020.10.05.03.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 03:51:23 -0700 (PDT)
Subject: Re: Emulate Rpi with QEMU fails
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org>
From: Thomas Schneider <74cmonty@gmail.com>
Message-ID: <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
Date: Mon, 5 Oct 2020 12:51:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <875z7p3t9e.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4plfr1EhGkbb

Hello,

thanks for your replies.

I must admit that I don't fully understand your analysis.
However you made some conclusions that are correct.

In fact I have found a Github repo 
<https://github.com/dhruvvyas90/qemu-rpi-kernel> where a specific kernel 
and versatile-pb are provided + instructions for lauching the emulation 
with the original RPi image file:
$ qemu-system-arm \
   -M versatilepb \
   -cpu arm1176 \
   -m 256 \
   -drive 
"file=/.../2020-05-27-raspios-buster-lite-armhf.img,if=none,index=0,media=disk,format=raw,id=disk0" 
\
   -device 
"virtio-blk-pci,drive=disk0,disable-modern=on,disable-legacy=off" \
   -net "user,hostfwd=tcp::5022-:22" \
   -dtb /.../versatile-pb-buster-5.4.51.dtb \
   -kernel /.../kernel-qemu-5.4.51-buster \
   -append 'root=/dev/vda2 panic=1' \
   -no-reboot

This means it is more recent than the Raspberry Pi Geek article, and the 
emulation works.
But I'm not sure if this usable considering the added models -M raspi2 
and -M raspi3.

Can you please advise how to proceed?

In addition I would like to know if there's a memory limitation using 
models -M raspi2 and -M raspi3?
To my understanding there's a limitation to 256MB using -M versatilepb.
If yes, I consider to another raw image located on host's temporary 
filesystem and use this a swap in the client.

And how can I make use of a client network device that is based on 
host's tap device connected to a network bridge?

THX


Am 05.10.2020 um 11:40 schrieb Alex Bennée:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Sun, 4 Oct 2020 at 18:44, Alex Bennée <alex.bennee@linaro.org> wrote:
>>> Thomas <74cmonty@gmail.com> writes:
>>>> I'm trying to emulate Rpi with QEMU.
>>>> I found
>>>> [url=1]this[/url]
>>>> arcticle in Raspberry Pi Geek documenting the steps including persistent
>>>> storage on host.
>>>>
>>>> However when starting the emulation with command
>>>> qemu-system-arm -M versatilepb -cpu arm1176 -m 256 -serial stdio -hda
>>>> 2020-08-20-raspios-buster-armhf-lite.img -net
>>>> "user,hostfwd=tcp::5022-:22" -dtb versatile-pb-buster.dtb -kernel
>>>> kernel-qemu-5.4.51-buster -append "root=/dev/sda2 rootfstype=ext4 rw
>>>> panic=1" -no-reboot
>>> Let's start with the fact you are using a versatilepb machine type with
>>> a versatilepb dtb and not the rasppi model.
>> Given the name of the kernel image, this probably actually *is*
>> built for versatilepb, or it wouldn't have got as far as failing
>> to mount the root partition. There seems to be a lot of confusion
>> in the raspberry pi community about the difference between
>> running the raspi userspace plus a for-versatilepb kernel
>> versus running a full raspi setup.
> Ahh your German is considerably better than mine ;-) Looking more
> closely at the blog it seems to be predicated on extracting a Raspbian
> kernel which at least stands a fighting chance of being a multi_config
> kernel - like the buster above.
>
> I can see why these sorts of shenanigans used to be pulled when there
> where no RaspPi models although if all you want to do is run an ARM user
> space what's wrong with using linux-user for this sort of thing?
>
>> Anyway, failing to mount the rootfs and not listing any
>> sda devices is not a problem with the fstab, because the system
>> hasn't got as far as being able to mount the filesystem with a
>> fstab on it yet. One possibility is that the kernel is
>> missing the device drivers for either PCI or for the SCSI
>> controller that gets plugged in to versatilepb by default.
>>
>> My guess at the cause is that you're trying to boot a Linux 5.something
>> kernel and you've run into the issue described in this thread:
>> https://lists.gnu.org/archive/html/qemu-discuss/2020-09/msg00023.html
>> where the Linux 5.x sym53c8xx scsi driver is not compatible with QEMU's
>> emulation of that device. If that's the case then you should see
>> earlier in the kernel boot log error messages similar to the ones
>> that Roger reported. The fix would be either to use an older
>> kernel, or to change the QEMU commandline to use a different
>> SCSI controller (or to use a virtio block device).
> Do we have any documentation for the RaspPi models? The acceptance tests
> look like they support the inbuilt MMC/SD controller device:
>
>          kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>                                 serial_kernel_cmdline[uart_id] +
>                                 ' root=/dev/mmcblk0p2 rootwait ' +
>                                 'dwc_otg.fiq_fsm_enable=0')
>
> It would be useful to fill the hole in the documentation so gently steer
> people away from these hybrid franken-machine approaches.
>
>> thanks
>> -- PMM
>
