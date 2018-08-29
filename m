Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp390739wrd;
        Wed, 29 Aug 2018 02:17:21 -0700 (PDT)
X-Received: by 2002:a24:610d:: with SMTP id s13-v6mr4608707itc.68.1535534241762;
        Wed, 29 Aug 2018 02:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535534241; cv=none;
        d=google.com; s=arc-20160816;
        b=fwXRyRoqef4wXFCrQRpxLfBxEmqrD6qJ/uci9ekla1/B8uLZ96YqUn6QunzX2TYSfM
         JwwOXaqnKVhgTG6r99PlyvYf2vyLrhl98pLLnuQsTHHZRV922cO2+UbdzB5QJ3tICAKJ
         4ImXFgxvCHHxGXOX+BMvIyDyUB7+2R/GQZfLVvGlnU+6k4deway8GfbJlSt6a4awV8vk
         w8XTvzV+WLnpE2xsrSskLd00sy1nCOjP+amYWZTbYfe0v4eiDaFpPNBpEIxXdGpoTfyp
         4hIWCvN+3rnuPgblXpKkeONaEZdR8YaNacCz5a3wScxvGPFP7biHkxr2uQBJIrKOJdAV
         2QDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Th8lFl39NqoelSwqMP5EtNilHydrwCJwDW/we6ckk9s=;
        b=Z+Ij5Fk78/ZbCakiR+eUys/0dBCaZR35fFkCohefFidpfKFAH8gUE6zvhCoJm1Qc6r
         ZhQg0lORV4ugvy/RTvFp3hyCi584tp1r50Uo+lQtA42Pb5DAOXdPIf9gKM5jA3n2mb/F
         vu+p4XFYuXla4Xq00mH00ENhlbvyeYfR98prfY7Ez3BQr+3i9K8bEJeSgGlCVE54uTBX
         W18B6uHXHWpEzQHzprnOSEPZogVbj0iuxlJQD2hAfDUo3tiItcSIdV8SXbEYNy8hq+9k
         6r6xaWrOa2lPLzM71diuTARdbmDUCwzMvCbsjaUL7yu4ZfLsFU+WDuR7e62Gd28Aptyz
         APEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=epN9FfzW;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t185-v6sor1429977itd.112.2018.08.29.02.17.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 29 Aug 2018 02:17:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=epN9FfzW;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Th8lFl39NqoelSwqMP5EtNilHydrwCJwDW/we6ckk9s=;
        b=epN9FfzWr3zbvuMIkiepjWQ256s+JOMm7x8mewDjLoD1pQN6wBvRbOK3Rqit4j0Pyb
         ZzfBNe08FUgHqS4ROSrXIdyC4zPl7p6vKbmD30m7062vDYnocStpz+7Gyup9RyoOSZYA
         2ZqEQxpIhBq/nbiopi5PCRW7hE594gt55XxJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Th8lFl39NqoelSwqMP5EtNilHydrwCJwDW/we6ckk9s=;
        b=gt1Rv2NFyJ3iSW0faYP+euI6rleE9cb7uxuLG2JWzEQGi5IyCI2qXgA90oBio6To6+
         xg0oWgO7bKPpIJ+32TowjMpbcqL98MJMrrQGg/xAJT8ccqOn7zXUMmTxboh3FzzkYZKD
         aXkAYKPLh2/HU+H3yUQmvfd1YshwEGfFdCU3yY4vqMRjx2w4Y7EwJlGZtXkLr6xpEAlU
         O8LSbsyPkESoDu3KTsTU4O1CZ248bJ8VDxyLF35HqUrVsjRjO709+Eka6qSbMgScv8yG
         E89gOXbH+ArFigfz/bHdrISt+xV9B6OQy3OtOdqYPR5wPGpmTbmTE0DdOP2049Lm5R55
         zTqQ==
X-Gm-Message-State: APzg51DrLN8h12YM3Fdh5GEXNGk1HBeIimvYQTLzQlflE4IxGbn0M/a+
	1fN+inQ2tiMXXIfGJI7KumuSLfus96GX4MjfZBDSRosc
X-Google-Smtp-Source: ANB0VdZC698sTBUyfbMSrXSjPjIUkQD1bOnd/XeyX2CJNz4PJgg9oInNQvdxSRwc9L/HKSa+Qb+HF1T6eYxsZ4m3G84=
X-Received: by 2002:a24:328d:: with SMTP id j135-v6mr4569579ita.5.1535534241381;
 Wed, 29 Aug 2018 02:17:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:d852:0:0:0:0:0 with HTTP; Wed, 29 Aug 2018 02:17:20
 -0700 (PDT)
In-Reply-To: <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 29 Aug 2018 17:17:20 +0800
Message-ID: <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 2u7TDXVGUSUA

On 17 August 2018 at 21:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 July 2018 at 06:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
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
>>  - No paravirtualized fw_cfg device either.
>>
>> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> ---
>> Changes since v1:
>>  - rebase on v3.0.0-rc0
>>  - introduce another auxillary patch as 1/2, so this is 2/2
>>  - rename 'sbsa' to 'enterprise'
>>  - remove paravirualized fw_cfg
>>  - set gic_vertion to 3 instead of 2
>>  - edit commit message to describe purpose of this platform
>
> Hi; there's been a lot of discussion on this thread. I'm going
> to assume that you don't need any further review commentary for
> the moment, and will wait for a v3. If there are any specific
> questions you want guidance on to produce that v3, let me know.
>
Thank you for this summary/remind.
Sorry for the late reply due to my vacation last week.

Yes, I am working on the v3, with main changes:
 - machine name "sbsa-ref" (good name?)
 - a separate file sbsa-ref.c
 - don't touch the acpi c file, acpi will be supplied by uefi
 - only necessary dt node, no other peripheral dt nodes

Before my sending, I still like comments on the above effort, it is
feasible/reasonable or not etc, in case I go wrong too much.

I also know that some reviewers may like to give comments when they
see the patch codes, so if you don't have comments now, you can do it
after seeing the patch.
Thanks all.

> thanks
> -- PMM
