Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp199176wru;
        Thu, 26 Jul 2018 03:17:38 -0700 (PDT)
X-Received: by 2002:a6b:c085:: with SMTP id q127-v6mr965277iof.255.1532600258123;
        Thu, 26 Jul 2018 03:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532600258; cv=none;
        d=google.com; s=arc-20160816;
        b=RQ71bSNco3akAMm4Q+cf7arfa5hCgrqvQZXbIKr5vHeeRSuZf03bL9SzLTmaadJrGU
         c5tReK/44uPylNe6YF/8Th+uuJ7I2kuItx/m4iRlFN6CoyH4pALIBVxoVoaCYrLEaFXR
         CygcDqBWMm77j6nLUBjj1TNgiTUae7Oh4peOnfODnsyCrTkdlFK/dmASgCovv0Vhwaqr
         p85tQ8lT8wrgPHogxDanPVssQjtlHoJB1X2QMTvzZSb1HYsULdPpnMzZAK1wSKPJHtTD
         qZrDGsWtrU2hTM+ikI2aeivn4O23reACV0xlqxaSR2p9antYUaj8E/leETU795qO/4Wb
         EfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=IhHiat9jDL+qUZ7jQyHKgi/RyJOaOdS4bdcyHdvv8D4=;
        b=KFX1SroxlYSr/mwC6+wvF72lv+DYTzjhdktii4vpaGFe6UchbqU1FH3+5wC17UKkYT
         IKS8AhhQygEVeA5keupwcHIpv5qUXEzQEH3Cg2Nb0B0Ko6rHFovgVjVxO9APhzrYqKOr
         8a+Xi78jhUR08leRLmTlreF4DBfpbHcNVsLJE0zPUjIRRXL0CRMyBafCFZTV0Ip+/MPt
         Irvnbv01PYAaSqwG1q+pU7R1fhxCeUXlucSHYNuA8oPI11AqDn36/doOrHxcMMilnMAV
         vcK0xOcf/lbRoJSkGqqUnh+yZXmFS9lDD+Y/rGsjz99HaWVAZL3BafonfNUgeKGzCpLw
         FCbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IbEqTWUD;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r21-v6sor398874jad.19.2018.07.26.03.17.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 03:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IbEqTWUD;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=IhHiat9jDL+qUZ7jQyHKgi/RyJOaOdS4bdcyHdvv8D4=;
        b=IbEqTWUDCSK5QyiPhU+IMnQVpUT63Ui2LgLM6j5m6tFNYO8k/A1MZHY52frYs/zaU0
         8PPoQ4PcZuGIghDNGoA5Gi+TyA2XtR2DppyETthwgyvf+K2DTyIW5A1hLfI+X43FCsdF
         VrgDcuIdN+ggrIPrzv/anz92teASfXYq1t4YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=IhHiat9jDL+qUZ7jQyHKgi/RyJOaOdS4bdcyHdvv8D4=;
        b=n4jZMwo77EhQGPKT7uz1oPxil02/Dg8+1JP6YD5jS7ujKj4ibW/VPGSZJLgdwO2lDb
         r3trihgGEe+Yqr/SmPYWcBLiOaZ2jSw6BJv86+qtJfjmRTca+PF07eSJeMIGqigT3rlR
         su30x8Vvy4/Dk591zXgE3Qzw7TAOWFZfq/ZmYzLZU4q5o3Mm8qGjr1AgzMhFcRk4i09m
         FDVkU/2iYCoIe5uReTB190ajRtrcCHIwT29VZbOxsPphNyRGMMWj/1FcKSlNOBnGQYZk
         xJvMFnT6RFTaOKQCk7JdItmuICZCCyvUczZOD3FTaKUjvEUDnOWdMYn+DUmAxwaqzB0O
         oKrw==
X-Gm-Message-State: AOUpUlFTqP3+hanbF/Ezfm0aXP2LGfQgemz+HOJ/20OdODAQfo4cQ7Mp
	f3qVzFKV/cdfVYjXsGSwkh6waPV99Boyi0uLFQb231JZ
X-Google-Smtp-Source: AAOMgpeDJnga0dKEqM3crzfbV5n3349pjFNYujTjDKWD6gHKTietav509jCjFFo+/4iBFZYVc76ItcLgyrG7TMkt1Yc=
X-Received: by 2002:a02:b804:: with SMTP id o4-v6mr854689jam.12.1532600257734;
 Thu, 26 Jul 2018 03:17:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 03:17:36
 -0700 (PDT)
In-Reply-To: <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 26 Jul 2018 18:17:36 +0800
Message-ID: <CAHmQWvC44mLchhEFPU0T0gKWVcjjozp95ZumaKK9EkPwpeehTA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: XQBOjV5Wqg5s

On 25 July 2018 at 19:44, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 06:46:59PM +0800, Hongbo Zhang wrote:
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
>> For Armv7, there is one typical platform 'vexpress', but for Armv8, no
>
> Wasn't the vexpress model designed for a specific machine? Namely for
> Arm's simulator? Is the vexpress model really something typical among
> all the Armv7 platforms?
>
>> such typical one, the 'virt' is typically for running workloads, one
>> example is using it under OpenStack.
>> So a 'typical' one for Armv8 is needed for firmware and OS
>> development, similar like 'vexpress' for Armv7.
>
> What is a "typical" Armv8 machine? What will a typical Armv8 machine be in
> two years?
>
> Note, I'm not actually opposed to the current definition (because I don't
> really have one myself). I'm just opposed to hard coding one.
>
For x86, we have i440fx and q35 (although they are old), but for
Armv8, simple usage like "qemu -bios/-pflash -cdrom" to install an OS
and "qemu -bios/-pflash -hda" to launch is needed too.
Armv8 has no such ones like x86, but we need, and SBSA could be the one.

Hard coding, user may have different customs, It couldn't be better if
one platform satisfy requirement, if not satisfied we edit it with
command or readconfig slightly, if we always need to change a platform
to another one with huge difference, then why not maintain the other
one, otherwise we don't need to maintain so many platforms at all.

> Thanks,
> drew
