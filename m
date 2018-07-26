Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp76756wru;
        Thu, 26 Jul 2018 00:35:33 -0700 (PDT)
X-Received: by 2002:a24:59c3:: with SMTP id p186-v6mr1020307itb.92.1532590533524;
        Thu, 26 Jul 2018 00:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532590533; cv=none;
        d=google.com; s=arc-20160816;
        b=UCjt0XOaXDxtGOCx9mrFq3leCX7TbW2a6inGZtntMG7B5zX1oLgSy1gR7iSDs1ZbB9
         49E8nt+KkAAMXqQAmCynfdCeBFfHnSB8Dlr3yovHzwGArJTlvMwzvVqocbzHkbhmBzp1
         GmQvGZVZRsLbNrLg+zMLrdvUCrWDjgXO4HkV+uX/PdF7DClP0eEreVNp5RsOiC15Wfn2
         GSH0CBBJoisbld91VV+fp7r+UK4/Z+2qUWMtbkHaeVhLCIcx5ZJYRLYEHSLz1gul8G0j
         /1Bmz/xr44MIi5N39IjDjIY0LhhZZnHpycGHc6Nn47CuQGMcKA26kRfs5o2vHjyiLudS
         yT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=q6Z5Z34linlz1EdWY19IUmypbNGZgIir7CvCxtuM1k8=;
        b=wcIVJhT9WMVeQowdL/xw/nOeAMP0F6jSt1jrvdMuMnfwN6XVudbfIgJo0kwNaztBG9
         wy7Y2F1BfYq7KBSBTWbQVoYqm1kc66WbvdNSOcOLdXndIjLEVeYahtHMaWAttet+paXu
         jT07QPB0ZLO5NKOcq6PclQ+B5HTVvm62d26s27qyE12Qa1pZcc05/FLmcRrw4s+bEFg9
         wzBzgr5zs1lZ3uhR5SMbsBn7HhZVXH31RlSBBNmj5D1jTZkKeMzkXd6SJCvjZHLDJNoQ
         VhKow8yYe26fWw9htuNm7CwVk+PvuAdK1lWllLWBMDtX8n6qYSe7917nFDZdq+mDF6LQ
         JlDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j31xfo1m;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f2-v6sor189388ioa.274.2018.07.26.00.35.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 00:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j31xfo1m;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=q6Z5Z34linlz1EdWY19IUmypbNGZgIir7CvCxtuM1k8=;
        b=j31xfo1m0PEJdln0iVKPSABTPUW902k47rSWuPlw2vWAPUp64d9UqfEDRVDJc48SpB
         XHTnm14aTZ7WE3kzP/t07WJLOdw57Civ1pl883ksWHuh+h42Mnn9pDKlZbzafgym5G27
         TK1p35xdaTC0NOmoHI0KFXGSEERXkWdgkZ2r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=q6Z5Z34linlz1EdWY19IUmypbNGZgIir7CvCxtuM1k8=;
        b=tkMwn1ESEZvT9nz23+0wTILTYsvDxwYpZ0gXQXZfJgX7rpMOk5oAAPQt7mxSc3gjC5
         4zD9Y5nxgN1xdJCksfhHHLlDd9C//dHjYqf6P4BW6MlKa0d+VTXBaJAmJ/L/VisNG/tW
         fF5xKtchKGM59ou3WsFjmuG0DAfRtN++AIBCm7kmYoiww7Q+Qc7yMz1APXOv8yrbhQYq
         f0LbLbD+89ADMnPYyFzMdBj6tiGnnoTu6huUaVB+ErF2yiWzRfdVKZk5huY5yxJpdQUB
         3pgZyl88qTWlFy+vjCOJKAje7O/4HNYF0UcuHMOQwjKddaLAcIZNqKuNq2tymQrMtUs8
         /+0A==
X-Gm-Message-State: AOUpUlGj+mJzqRLAbSSHWUjQadVixpE2HqoQvd1+s2G0HBPpXv9dRxtI
	M0YysujdnqFvSTQSpCQ7yE1UwNoNkXV+oQp2c8uRKlBf
X-Google-Smtp-Source: AAOMgpfcJ9ACeTqdUPqmkN79Vivm13xfSMqItHrg/sfwZMc03gwwi6eg5OIVS2wSYbIOy4DzeMHI9AOQn+tnWkBeBFY=
X-Received: by 2002:a6b:6104:: with SMTP id v4-v6mr609101iob.94.1532590533116;
 Thu, 26 Jul 2018 00:35:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 00:35:32
 -0700 (PDT)
In-Reply-To: <20180725105330.GB2366@work-vm>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725105330.GB2366@work-vm>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 26 Jul 2018 15:35:32 +0800
Message-ID: <CAHmQWvCHBxdMy+Qocc1XfURx86RTZd72rnB5-R=5QA00R6fEqw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: x46MIod2IHAZ

On 25 July 2018 at 18:53, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> * Hongbo Zhang (hongbo.zhang@linaro.org) wrote:
>> On 25 July 2018 at 17:54, Andrew Jones <drjones@redhat.com> wrote:
>> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> >> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> >> run on KVM and execute virtualization workloads, but we need an
>> >> environment as faithful as possible to physical hardware, for supporting
>> >> firmware and OS development for pysical Aarch64 machines.
>> >>
>> >> This patch introduces new machine type 'Enterprise' with main features:
>> >>  - Based on 'virt' machine type.
>> >>  - Re-designed memory map.
>> >>  - EL2 and EL3 are enabled by default.
>> >>  - GIC version 3 by default.
>> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
>> >>    can be added to it.
>> >>  - EHCI controller attached to system bus, with USB mouse and key board
>> >>    installed by default.
>> >>  - E1000E ethernet card on PCIE bus.
>> >>  - VGA display adaptor on PCIE bus.
>> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>> >>  - No virtio functions enabled, since this is to emulate real hardware.
>> >
>> > In the last review it was pointed out that using virtio-pci should still
>> > be "real" enough, so there's not much reason to avoid it. Well, unless
>> > there's some concern as to what drivers are available in the firmware and
>> > guest kernel. But that concern usually only applies to legacy firmwares
>> > and kernels, and therefore shouldn't apply to AArch64.
>> >
>> In real physical arm hardware, *HCI are system memory mapped, not on PCIE.
>> we need a QEMU platform like that. We need firmware developed on this
>> QEMU platform can run on real hardware without change(or only a minor
>> change)
>
> How would you deal with most modern hardware now using XHCI rather than
> EHCI ?
>
Well, EHCI still works well on server, some new X86 servers have both
XHCI and EHCI, Qualcomm Centriq Arm server even has only EHCI, so
currently only the EHCI is added.
I had no strong reason for XHCI or EHCI, if newer is better or some
users have special requirement for XHCI, it can be added too.

> Dave
>
>> Concern is not only available firmwares, but more emphasis is on new
>> firmwares to be developed on this platform (target is developing
>> firmware for hardware, but using qemu if hardware is not available
>> temporarily), if virtio device used, then the newly developed firmware
>> must include virtio front-end codes, but it isn't needed while run on
>> real hardware at last.
>>
>> >>  - No paravirtualized fw_cfg device either.
>> >>
>> >> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>> >>
>> >
>> > How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
>> > see any sort of reserved ROM region in the patch for them.
>> >
>> UEFI gets ACPI and kernel from network or mass storage, just like the
>> real hardware.
>> If we develop firmware depends on paravirtualized device like fw_cfg,
>> then we canot run such firmware on real hardware.
>>
>> > Thanks,
>> > drew
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
