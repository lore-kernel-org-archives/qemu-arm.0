Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp473236wru;
        Wed, 25 Jul 2018 02:09:24 -0700 (PDT)
X-Received: by 2002:a6b:445:: with SMTP id 66-v6mr15128327ioe.50.1532509764453;
        Wed, 25 Jul 2018 02:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509764; cv=none;
        d=google.com; s=arc-20160816;
        b=YEsPkdswHPpDCaUuzfMqw/ym6BzcAJ9P4QKBvoLG5y0HNMBshB+kWcq0hT4uPM3m82
         1HAjjXDZiVGHHn50BNwDAmn5Pw/FWexi30rw96efQnib2nywa09vERYoGXMl6VqIvTZB
         mIimVMDXGeVW6CqdvFqZCfx8RZFDF0wF1+V4jmf3p3IosrlJ1RXCI1EfzVJVrYOe4ohZ
         7YCeP1PjnBmjDabEaRCtKq0UmNT5yVPZ6fci3fbnDjT/Q0x3RvTyybJ3rW741ySlNu9R
         a3zNL9HLk7t6UE67mR6IxzioDuqj5au5N/JiMMpGPbTuQDuArEa7HTVjNA7L/qUMgiUB
         HHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Vg0CEMUz/sxLUdVCemUZyGhJCpv0U8KMDwqOvBzDwQQ=;
        b=S7z913qEmlW5XSfyzC2DQZCGUZHCjRAAkTLrVvKNF+IFXIZLKnzkqihB369HjiDq0s
         Iuf5Ko2U5PDRti5lQjL+UisOr53HeOHOCkCgtX4KMsXhGRReINjlbCvcS9t1UhdlLPbB
         WBEvVn3LrvpI/cAH4ovKYNGCtPi5kqlFofFa1mTlRn0wodxf0BsAlNuwX5zbovckpJt/
         icTyL8qbNTJL3E/MaQtrDBe0DFXlxC+NgM32cdZNkX1YtiqdMjhdjg+W3XlKduSaaGrL
         t0cy8aCVua0r8qr8QScSucEV8XGs9w9EgP/KQT5NWfr0ntkVQMpb7WcwlIVsIEAEMsKN
         z4Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYbES0tY;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 127-v6sor1490880itr.145.2018.07.25.02.09.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYbES0tY;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Vg0CEMUz/sxLUdVCemUZyGhJCpv0U8KMDwqOvBzDwQQ=;
        b=JYbES0tYL3IX75rlH52dzYBSOmUlrBbo0rndVmK9h63+NeOt0Nd1QlJvraZT4L29ES
         ntnDqangnusv/uxx0lddhVKQwoMzskxgJlxU7cW+hsKfpdeFjWdxY4//M2jFccHARxJH
         xfEwNYY3ecIg+amXi/sVqtIg6Lq5RWG7fGCbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Vg0CEMUz/sxLUdVCemUZyGhJCpv0U8KMDwqOvBzDwQQ=;
        b=Fbbne6f1FhdAIyq+G73EaV1U5PtiKFdWJpPyF7wX3ar7yVyoRY+cNBUj+1c672AchA
         Oso+CjzWglcK/7OunsnVmh/aRJmM2gDiwpf81k/fCEplHo8JwCnHWxsjqvP37Pb1qLJC
         0dbNtkG5+PEzC/wDCh4HuF5jtMYu/iYdEUlsZSjfqU0GDR1XmwdG1JgyEfd3fHtC+hqP
         eMfkYbsPM5J4IgaN3OM7HkRskZgLBxKyKkx08T4v0Jky96q8mr4n3QkzIJjYl9YUBbfN
         J2EvdSBVYzUPyUkYNipiLtRjQ56Enni0c/GWymVSic8qy14UIXk7DWZSuPka7ZFHk+gv
         WgCw==
X-Gm-Message-State: AOUpUlHPG7zFnMuyTmWRQDr0vxco4y1A8/qk53RKaKm5YGudEAsSf9J4
	5S8yM8EpQPVTpDohpGhJHoNnxKNackYDA3M1IksxZwAg
X-Google-Smtp-Source: AAOMgpdTzTW2+/3QU6nEnl7xU1/bpEbltTdbGI0liB9Bvwe5/jtAnSyfzZrGja1k1QEEH5THgE4o7T8uNvMrfn3ZS8Y=
X-Received: by 2002:a24:cc07:: with SMTP id x7-v6mr5430425itf.3.1532509764132;
 Wed, 25 Jul 2018 02:09:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:09:23
 -0700 (PDT)
In-Reply-To: <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com> <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 25 Jul 2018 17:09:23 +0800
Message-ID: <CAHmQWvCqKqQXnXxOUgi=kLTyE5BhV2NxqaKzvPp63HX02V=X2g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ATBUbAvPXr6V

On 25 July 2018 at 17:01, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On 25 July 2018 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com> w=
rote:
>> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>>> For the Aarch64, there is one machine 'virt', it is primarily meant to
>>> run on KVM and execute virtualization workloads, but we need an
>>> environment as faithful as possible to physical hardware, for supportin=
g
>>> firmware and OS development for pysical Aarch64 machines.
>>>
>>> This patch introduces new machine type 'Enterprise' with main features:
>>
>> The 'enterprise' name is really awful - this is essentially a marketing
>> term completely devoid of any useful meaning.
>>
>> You had previously called this "sbsa" which IIUC was related to a real
>> world hardware specification that it was based on. IOW, I think this old
>> name was preferrable to calling it "enterprise".
>>
>
> I couldn't agree more. However, IIUC this change was made at the
> request of one of the reviewers, although I wasn't part of the
> discussion at that point, so I'm not sure who it was.
>
> Hongbo, could you please share a link to that discussion?
>
> Thanks,
> Ard.
>

V1 discussion here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg545775.html


>>>  - Based on 'virt' machine type.
>>>  - Re-designed memory map.
>>>  - EL2 and EL3 are enabled by default.
>>>  - GIC version 3 by default.
>>>  - AHCI controller attached to system bus, and then CDROM and hard disc
>>>    can be added to it.
>>>  - EHCI controller attached to system bus, with USB mouse and key board
>>>    installed by default.
>>>  - E1000E ethernet card on PCIE bus.
>>>  - VGA display adaptor on PCIE bus.
>>>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>>>  - No virtio functions enabled, since this is to emulate real hardware.
>>>  - No paravirtualized fw_cfg device either.
>>>
>>> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>>>
>>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>>> ---
>>> Changes since v1:
>>>  - rebase on v3.0.0-rc0
>>>  - introduce another auxillary patch as 1/2, so this is 2/2
>>>  - rename 'sbsa' to 'enterprise'
>>>  - remove paravirualized fw_cfg
>>>  - set gic_vertion to 3 instead of 2
>>>  - edit commit message to describe purpose of this platform
>>>
>>>  hw/arm/virt-acpi-build.c |  59 +++++++++++++-
>>>  hw/arm/virt.c            | 199 +++++++++++++++++++++++++++++++++++++++=
+++++++-
>>>  include/hw/arm/virt.h    |   3 +
>>>  3 files changed, 255 insertions(+), 6 deletions(-)
>>
>> Regards,
>> Daniel
>> --
>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberra=
nge :|
>> |: https://libvirt.org         -o-            https://fstop138.berrange.=
com :|
>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberra=
nge :|
