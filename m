Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp529021wru;
        Wed, 25 Jul 2018 03:22:18 -0700 (PDT)
X-Received: by 2002:a24:b54b:: with SMTP id j11-v6mr181467iti.79.1532514138447;
        Wed, 25 Jul 2018 03:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532514138; cv=none;
        d=google.com; s=arc-20160816;
        b=OKty/rmTE0vZ9/c6jphkksc4JodCKUaPMfguAtY1w33khpm+SexEFVaxVLdH5gbiD0
         kkTrS+eX32aP7v+iSXZzwhgNmI6hf3I22qKGsrmAISqpHLEeMZeB22nn4urnz3+HCRCq
         V7NEvfE6y2W60PTVj4Ff7DOCzWSOYbNMKLWhbFLoOGOSSWnD4Z9I3AXFkscQe6AVM8oR
         cEQSJQMAao/FB40ud+A3aQvyz3lDYC5RQ/BAYnKM/L2oDFOuik5HWDCPGFi+cW5+qyL2
         84IYko/Hi1GYJOlHbrlrVXjCRMFwovY53O2WlMnKTlLMgW+gtZS2FWvx+PnVocwkLEKY
         No6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=XFxLM8Mx2oqOvnO+jYUS7YXAjqJgFvqB9SRU4nNGb2A=;
        b=nPnwIYHI7clCC6AfuKtXUG+i3BfF6+6g+osZbBe2EE1rYyKoAgEfnzAGW8Q7OXORwt
         tQIsA7zIma59NOVoIOa0C5O/O/HI/cBTM20i+HQeSQvaItdn5jphOpe4XgVKWL2oeFXj
         VxnxK6OfufQUUnaxnOKqAQmiqkyZRXHENzI12wKKPWsvz8pcEUjDjcMY2w2Nmbr5PA61
         Qx5gX8whTcH7Kegx5z5+kmwdCDsc54fik/8KyS0YhrGeTuYHnKgihXQmQG+457qcJKyL
         HXhX0xg6N0bGojc97DQPrRb4B9dDwGh5yofueYLNwFYN+SeJroLar3JsJfeIeToqDm8v
         Rykw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RWAZgJ3t;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c21-v6sor4489706jaa.141.2018.07.25.03.22.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 03:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RWAZgJ3t;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=XFxLM8Mx2oqOvnO+jYUS7YXAjqJgFvqB9SRU4nNGb2A=;
        b=RWAZgJ3tnEx/l62tM09sx9kpb3iNqXPp8a7CBR/9M8rnWAfi51OQSbQvWxWORjudS/
         07dJXSYkGK6uoa918pmqj4Bb9nTvcCT6oCfQW7SxLarXY/zWohus8v1VHXUAIl5wP+wn
         AzItCjwFIpxWIzwdVyBXYQYyIs6v1nFa2rn+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=XFxLM8Mx2oqOvnO+jYUS7YXAjqJgFvqB9SRU4nNGb2A=;
        b=WfppGxf3gLqmrQr3oUJkcI5JrpmZ0DkGfb7irVYhTRGJdL19Ob0ahVakR+L6FB71mG
         Tx0SxyRW6jpOCservi/89GrO/hPd4ZiZ3PeRES5lWCkd9dJQDlZwtYFGTXylFpsFRMbF
         Y/Kghp8cUb8BeUVwyHz1ck91eqpVgZ0JfNfcbYYIa7nAwuN069f8eMWkOJDVRxq4/JA5
         3arfXj/ETIvPjrGPPxy0ThKLchHpY9ucczbw1JhOP2/gAAAZjpim3Ups39WaTlGz8Qhk
         z+vS1PVFkFcrIRZkHSZ1lrPVSg1AC/W1zPsLAkYeYYhpuaeq4gGftnwUT6LGSYfVH6IC
         47Pg==
X-Gm-Message-State: AOUpUlE9ZjCVw2FFyG8WnB4Skn7L/xeGj9kv4PL7zcqQGDWltFcDdS1x
	GnhPVLr3e+2jbgNWtr0lEA+fgIkRGeHiqPoo7V0nM1QX
X-Google-Smtp-Source: AAOMgpc6hzxJthUGfHH/e7gz7U92iCGy42bZmHiT0u0mF1/ZWwkGuAvJBeRnOOvzqZZGUlYQmG+Z3pWpqtRMeZjjJjg=
X-Received: by 2002:a02:8b57:: with SMTP id w23-v6mr18130480jak.73.1532514138129;
 Wed, 25 Jul 2018 03:22:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 03:22:17
 -0700 (PDT)
In-Reply-To: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org> <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 25 Jul 2018 18:22:17 +0800
Message-ID: <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: RNna0Qh07LAK

On 25 July 2018 at 17:54, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> run on KVM and execute virtualization workloads, but we need an
>> environment as faithful as possible to physical hardware, for supporting
>> firmware and OS development for pysical Aarch64 machines.
>>
>> This patch introduces new machine type 'Enterprise' with main features:
>>  - Based on 'virt' machine type.
>>  - Re-designed memory map.
>>  - EL2 and EL3 are enabled by default.
>>  - GIC version 3 by default.
>>  - AHCI controller attached to system bus, and then CDROM and hard disc
>>    can be added to it.
>>  - EHCI controller attached to system bus, with USB mouse and key board
>>    installed by default.
>>  - E1000E ethernet card on PCIE bus.
>>  - VGA display adaptor on PCIE bus.
>>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>>  - No virtio functions enabled, since this is to emulate real hardware.
>
> In the last review it was pointed out that using virtio-pci should still
> be "real" enough, so there's not much reason to avoid it. Well, unless
> there's some concern as to what drivers are available in the firmware and
> guest kernel. But that concern usually only applies to legacy firmwares
> and kernels, and therefore shouldn't apply to AArch64.
>
In real physical arm hardware, *HCI are system memory mapped, not on PCIE.
we need a QEMU platform like that. We need firmware developed on this
QEMU platform can run on real hardware without change(or only a minor
change)
Concern is not only available firmwares, but more emphasis is on new
firmwares to be developed on this platform (target is developing
firmware for hardware, but using qemu if hardware is not available
temporarily), if virtio device used, then the newly developed firmware
must include virtio front-end codes, but it isn't needed while run on
real hardware at last.

>>  - No paravirtualized fw_cfg device either.
>>
>> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>>
>
> How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
> see any sort of reserved ROM region in the patch for them.
>
UEFI gets ACPI and kernel from network or mass storage, just like the
real hardware.
If we develop firmware depends on paravirtualized device like fw_cfg,
then we canot run such firmware on real hardware.

> Thanks,
> drew
