Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4671112wrd;
        Wed, 5 Sep 2018 03:08:58 -0700 (PDT)
X-Received: by 2002:a25:2d0d:: with SMTP id t13-v6mr15873045ybt.246.1536142138906;
        Wed, 05 Sep 2018 03:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536142138; cv=none;
        d=google.com; s=arc-20160816;
        b=jHWowJzXB2fNT3wdTvSsR5+BEOE+wRLzXhnxDpabTRSCt8+ieEcOWxCGfvRGoCccmP
         YIVeweZfHru7NRjfjp2C3GIUriLrVHmf8glnpgWPJubE5Jbz628A9vvWfh70lfKYwgGZ
         roe5Qz0J/VOp6JTWAJGMJva+0BHa7LuC6AiaQtmjYg0l+Fed04wI9YKyOp7dPUlI0Aq1
         u7Y7CSu7Bmpa+TylrCBSTkRUqiiQyiTmYjaRzMKOwkDgrWnlgKWqPMHfQ81eAPuCItB5
         1R26RLUa/UT6xZlbQ6M4HEwjumQ4WC0tR1SOnRw79XqNhxImaaIVt8ZE1Q+cnjUwBIlJ
         Z3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=MtGV99GR/o3WMn/h6wpPIZKbA/AuMwwXDdUglh3A1PA=;
        b=VT/mtajpOcEYZtpegRqdbWYMKZSn0tXx08Z3nL8rLJIexSw9otmz+CqS+D4amKC9Bb
         uc46Tle6tRbxT6anvs5bBpWdVyYkdvzWtSq1GboRpmEfgBN6DypsTm/pTXjicYh33Ghv
         THrWM4hr4aZyBgz420Jrk64En88gACwrwHFXzzv1hXmndiWX8K3fLMLzKTR0oDSLc+uz
         gsJzy+2qbsV/KBZR9KS6Ufpu2ormRlYufCHYNvXZMAAS/3z1HmGWJhSsY8JXE1Lw8poc
         z8MhcYs//IqL8VoCd8ONf3Za5MF5IIp8oMoPj/hkSW4njCpNuJi01+Vat+T7iccOZvIV
         TVhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dhd/wDjt";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 139-v6sor244360ybf.153.2018.09.05.03.08.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Sep 2018 03:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dhd/wDjt";
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=MtGV99GR/o3WMn/h6wpPIZKbA/AuMwwXDdUglh3A1PA=;
        b=dhd/wDjtBF6jVbU1bgJ+HysNaHMMh+FmaVFTtkSYDzxe6W4MZjN3RN/6OI2FEgMdl3
         hIjpzqTPObkumEZrGPsRVALOxzVU04suYH4ggLO3ixuUb7I8897+Z1yUwUtbkA8UNNOK
         ekv0e1iHg9aIRTFIqh8nVvxUPxMBivzxjhTp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=MtGV99GR/o3WMn/h6wpPIZKbA/AuMwwXDdUglh3A1PA=;
        b=P3He0R7dD6Z0NR5oBM+PlndzaTEJouKWAmyVamttoOrAWFQvaBr+mJbWN/dQ2HtNHH
         adaM5LgPNPmmHAJSGCznPtp7gs+lkjglQXMA9Wh6KphI+cZ/Tp6Lx5xxDyP1juv6mwbm
         vLe40RcxXfVIAacYagbRwRTi7Q5XNlX7WO+1u0T6YltLXeaVC1HVD/RU8W4ZDyqyW/2/
         Azr+hO91Mbf4D/KHguCKPGgy+LT9hc7Z8SHYAh1OcmDjMzGfQsHDaAALFdONDM62NUtH
         2O8XiTuLwf33A5vj2c9sdbrr/WFSUIEn9F0Qz15BxQvJtle5gvg23OxrJFO2+2d0gGh2
         SU3A==
X-Gm-Message-State: APzg51B+zq76oYyj6kk4SN1V2jVx6m0qvALO5O56lURDte6hqF97CLSv
	26HyWeVyGm5URjst50gWJViIv4K3/VRr98iPEPDtkpj6
X-Google-Smtp-Source: ANB0VdYnMCYVt3MmG0pQf5LJOCqENKsr7J1jIdp8I0b4JnJEdLeW+Z/c/9h2AF7SOyuhi38gs38ejX9R9QWWxB2kHgU=
X-Received: by 2002:a25:4c45:: with SMTP id z66-v6mr7712545yba.58.1536142138542;
 Wed, 05 Sep 2018 03:08:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:58c5:0:0:0:0:0 with HTTP; Wed, 5 Sep 2018 03:08:57 -0700 (PDT)
In-Reply-To: <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com> <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net> <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net> <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 5 Sep 2018 18:08:57 +0800
Message-ID: <CAHmQWvBDjMeBpe9Puv+oRii3JrVULW_+AYJL9WV1tXT7F7ALfg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Leif Lindholm <leif.lindholm@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: weSzNwCAhjSn

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

Ard, we need to clarify which DT nodes should be kept in SBSA-ref QEMU.
I've researched and tested, there are 3 kinds of DT nodes in the
current 'virt' machine:

a) CPU DT node, because it is dynamic according to input parameters,
and we don't want to get it by other way, so we agreed to keep it.
b) GIC, UART, Timer (and RTC?) nodes, these nodes are now used by
UEFI, if removed, UEFI needs a rework to not rely on them any longer.
c) All the other devices nodes, such as GPIO, PCIE etc, currently the
UEFI doesn't need them, so UEFI can boot with them removed.

How about b) and c)?
my idea is to keep a) only, remove b) and thus a UEFI modification
accordingly is to be done, c) can be removed freely.

So what is your consideration from firmware point of view?

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
