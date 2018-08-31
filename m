Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp285225wrd;
        Fri, 31 Aug 2018 00:20:47 -0700 (PDT)
X-Received: by 2002:a81:ac62:: with SMTP id z34-v6mr7972948ywj.146.1535700047302;
        Fri, 31 Aug 2018 00:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535700047; cv=none;
        d=google.com; s=arc-20160816;
        b=WTW0/kij/JZ65ncYna/Q3ILnIEvu7r1DPMhEbCoVmNvxyLVgME2GC82BaOYeYFq2A7
         rLqIUUdipQECUXAFvhXZv/5aSu9c579nN23uRN6v6FyOGGJ1nAZQzCw811EjSE7d97p9
         rvNqK0OQkRL/3i9KXBNdEotTJug2YEJq1V7iEHqf/9GBxpfoxbPlYSLjvljwx+Z6L7+x
         Hs7qqGoZWc8tRgI90ACtrkzfRvAPRHc50k4cHd0DKioeiVe5lq2uHj3MPQfxd6PmFZ0C
         XQhvwOWG0/+Da75dQgsZx1mu2J4ab19zWPJFpfx+BTG4SNY7KWTmHU4opMjTZ0go8Umi
         jgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=OB7v8hBVyeM2IScf2J5+7IoEGYJBxxi1f5XHBvwaDIw=;
        b=jPYWjSk0OCb7pxXOvZsXp6Luy9b7nTR5heCSQBvcf1KIznUkUiD3cfVtY4J3/1L0ck
         x78Lpf5FXR5ri/LY224OIWoBFXDCY7G7ObAcjTsLf8TzZGvBJSLXttEyqDJFWTeelvuW
         RIalgpMSsfrxwHSrFqXm1KJlCgtvnw/uZ60hdCyPsoAaJjMh6YeEG+qeQYUPrHvW8Qmh
         TG2CDCuQ5zmuXr1CBa4MYR/cJz0fPimiiv+PANtOURHPlmF66Az6E9kksZ4glmo28zVX
         NCO07/IiKqVrFNddkjl3gcHVn+4xA/xvBd4e3dFvwawlZswsARbd/ZtkU/GiUN0XpVhk
         ig4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aSOVB2aE;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 203-v6sor2213480ywz.107.2018.08.31.00.20.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 Aug 2018 00:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aSOVB2aE;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=OB7v8hBVyeM2IScf2J5+7IoEGYJBxxi1f5XHBvwaDIw=;
        b=aSOVB2aEE3KfMEb1ghWk95LwF3R4O5ghgm3NyaKsaPrwkedJF4nbuBwC+lipb6PSY9
         RdnOmnYLoygSSrWVksFD+qJs07utxA4Zb7ncMTeJ17zrag3x6JDZbzE1y62KY+4ST06x
         aHpjFLDJAxIHfEESzivTEsxn3qr3XWSq1AjSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=OB7v8hBVyeM2IScf2J5+7IoEGYJBxxi1f5XHBvwaDIw=;
        b=o1YcUBGh5T4lU4AyYZf5BO6pLpahUJ6hBwCVIBl0gKVfwrPerv4e5CJnEqF3ArUv7Y
         0tnxUjBQHmqaAAfq3STInpMYJGjwIhk4DG/ThhGUen0+70MqvFlOIV8GfAVWJ73kC/1w
         C1m25v9ykI1XV7VowDMdMEd/6wLjZBy5tUwqj20uETit70HeHKZtTx7on5wTy0B2ueaD
         Al7hhHtN1Mu/KE57mL2jhB6ova81ayL4lWoMftTZGxhWHk2cDggpSaIgcKBuEjHosGqh
         YylucmKm+F0zMeZZOws3jbhLxKUWX/1yWX4JUJBEM5jEI/TqCyYQBB1Faoeab6d3wWiH
         s6NA==
X-Gm-Message-State: APzg51CylDVxTIBTO6rzbgWxGrxNq19OnXRzN6PeLm8+270/W27V5prV
	Sxt9QbKpYkXS3bWRROdNPqEcIicQvft82wildyODl9ec
X-Google-Smtp-Source: ANB0Vdaq82cs5Sl24VDT29CuOyz6ULdXPc1PZ5z1KUfqarQtKRww5bl/Rgqfg1ytbQJa+YBs/kLYaLqT/CZ+f3PZD6s=
X-Received: by 2002:a81:5f04:: with SMTP id t4-v6mr5907037ywb.98.1535700046906;
 Fri, 31 Aug 2018 00:20:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:9b82:0:0:0:0:0 with HTTP; Fri, 31 Aug 2018 00:20:45
 -0700 (PDT)
In-Reply-To: <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com> <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net> <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net> <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 31 Aug 2018 15:20:45 +0800
Message-ID: <CAHmQWvAx8+_0vAOd_Pq0NVr5n0spYj8o5vsj1xjn+a1M81w=Lg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Leif Lindholm <leif.lindholm@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Bo33HGmpGxxd

On 30 August 2018 at 21:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On 30 August 2018 at 12:02, Leif Lindholm <leif.lindholm@linaro.org> wrote:
>> On Thu, Aug 30, 2018 at 09:39:33AM +0100, Peter Maydell wrote:
>>> On 30 August 2018 at 09:31, Leif Lindholm <leif.lindholm@linaro.org> wrote:
>>> > On Thu, Aug 30, 2018 at 03:07:29PM +0800, Hongbo Zhang wrote:
>>> >> @Ard, @Leif, is there any possibility to remove all the DT nodes?
>>> >> On real hardware, how does UEFI find the memory size and CPU number?
>>> >
>>> > Usually by asking some form of SCP/PMU.
>>> > So until we have rock-solid multi-cpu-instance (making terms up here,
>>> > there may be a proper name already?) support upstream, we need to take
>>> > shortcuts.
>>>
>>> I would expect that you'd want a "faked-on-the-QEMU end" SCP
>>> communications endpoint to start with anyway. We have one of
>>> those for vexpress, for instance.
>>
>> Ah, I wasn't aware we did!
>>
>> In that case - sure, that is probably the more sensible solution.
>> Does it emulate SCMI?
>>
>
> The purpose of the SBSA/SBBR qemu machine is prototyping the
> interactions between rich firmware and the OS for things like RAS,
> secure variable storage for UEFI or capsule update.
>
> How exactly the firmware figures out how many CPUs and how much memory
> we are running with is out of scope for this, and so I don't think
> there is a need to build something from scratch here: DT will do just
> fine, given that both EDK2 and ARM-TF have working DT code for these
> things.

For firmware prototype development, CPU number and memory size may not
key points.
But from QEMU platform implementation point of view, they can not be
out of scope, they should be passed by command parameters instead,
because we don't know which numbers suit for users (although there are
default values).

From the previous discussion, SBSA machine doesn't supply ACPI, as to
DT, implicit conclusion was same as ACPI: supplied by firmware.
That is why I had the question,  if QEMU doesn't supply DT, if memory
size and CPU number are passed by parameters dynamically, then how can
they be passed to guest firmware and OS, so I considered to keep as
least necessary DT nodes such as memory size, and also learned how
firmware does it on real hardware, to see if we can completely remove
all DT nodes.

You support to keep DT as virt, it is really fine with me, but this
triggers how my patch look like:
If no DT in SBSA machine, then the code had much more difference with
virt, so there is possibility to make it a simple separate file;
If keep same DT as virt, then there are more overlap with virt codes,
so I am not sure how the patch should like finally, I still prefer
separate file to keep virt untouched, but not sure if others would
suggest to extract common codes to a third file, it is up to the
maintainer and reviewers.

So, keeping DT same as virt is final choice, right?
And how the patch look like? or I send a v3 with separate file to see
for discuss?
(understand sometime people cannot / don't like to give comments
without seeing the patch)

>
> fw_cfg, on the other hand, is unsuitable for us. Generating ACPI
> tables in a different way from actual bare metal is not a good idea,
> given that things like RAS interact with ACPI as well, and fw_cfg is
> also exposed to the OS in the default mach-virt configuration. So we
> could tweak fw_cfg to be more suitable, but I think that does not
> improve the usefulness of our prototype at all.
>
> At some point, it would be nice if we could get UEFI to receive its
> platform description from ARM-TF in a generic manner, and it would be
> good for EDK2 and ARM-TF to align on this. So even if we decide that
> SCMI is more suitable way to convey this information from QEMU to the
> guest firmware, I would object to implementing the client side of that
> in UEFI, given that it should be ARM-TF that provides this
> information.
