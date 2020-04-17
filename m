Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp503001lfm;
        Fri, 17 Apr 2020 06:55:09 -0700 (PDT)
X-Received: by 2002:a9d:75cc:: with SMTP id c12mr2497701otl.272.1587131709366;
        Fri, 17 Apr 2020 06:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587131709; cv=none;
        d=google.com; s=arc-20160816;
        b=qIKWc4bphXeQEg08oX1XlTooX0SmMv5pog6ytwvB2JdcoUhZqWv1JGUdhg+/zx1aDT
         7pP0dH1yvBHAqpQJ/SUXU5jDrRF6bkC6TSIdLlMXqD0yeI4MZQZbE7aP3waAMwwtTOwI
         YNFXACQ0WnVc7o2xRyC5iW19h0QFWc3y+wx721KF6wZ8WNOmSdDspGHbHMSOC09dghy7
         brxCoMGofx7rby9ikhXO7TJQQ22pzz9A1qTaxJJtaL2nAxfxRnzBoCuQ8/obJYLMXfB+
         DedWCRhJ4z1toQ7jI1iF+rq+v12GTQPguXGD/Zu8cXuIGr01hbFWK1l18oxLxwGbSlNv
         ScnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qGKkVLPIOtw/YCvUqno/ATBMMnNSopURWMtrEnMW9Q=;
        b=B3xoNThz3edtevgJBM31wdCMS4UzLfckYiNxa2blmD/F0y9evqdYaG63bqHX5hLYYI
         BBgLcJoANXzxxYOe1BS7F6+M8F1XMS0Rjw4xABQNCvEiR2aiWTiSs3PtTCAE874+zosV
         82LHecDc/7iiHVzqDvp+xqHs+3lEGCdd/pNVFBSsYfnfh1eEM90enk0uFLME0i5v87bu
         kqwamaFCtKJB8jLOK9GNOb+wbBPbF6V82/r3OZwQzVY5Geu1821mQ/VhxwBQyK/6Cjyu
         klh/2pMDx2KM6UBQzrBq7oP3dUxPF1mhoRC/bSfsTI+qheaNfPF8dbmuv62+WB4hsgu5
         1r9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=InB76e91;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u4sor13491456oor.15.2020.04.17.06.55.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Apr 2020 06:55:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=InB76e91;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1qGKkVLPIOtw/YCvUqno/ATBMMnNSopURWMtrEnMW9Q=;
        b=InB76e91InNRl4vyHbco2mX3gA95gKqUTLdjn05M2oFYDqF0CAuDPCwlzLNBuuZPfI
         4MKNCkdc40czeE3rueAak70LjGNoLyRag7RpIRPyQwmMXeWyKPR2d6sJRS+POCliPBsW
         Rm0Otziqg0VNrXQr2qN4xCpCOTtIpXXscyHyMey40TvFMEg04ZRYX+dfMwvUxUhFAbo5
         uRlZZekevrWmmnaOTvmg7fD7EaXijbyDsqmo+14ew/gwczaCinlSK7bS22iQH7QSDR1/
         xFf7EuUz1RwtwotdZwc6FI6wA1IN10u4ASDroMW+WzT10O5bFQiJ3komlt10ZbLzNOMf
         84pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1qGKkVLPIOtw/YCvUqno/ATBMMnNSopURWMtrEnMW9Q=;
        b=fGb/AQQSne6ZJm6TcgCJieKRrmMJH3LGkLsQhMmsRh2Yi8mFhyyM0jNP5lEEngP5td
         gn6V4LH5cgbChgESzMonT4Xu3WTZocm4aLwGJT1l4XaJ58NDV4jNDO0lUAlxhWOZ0gOx
         ttJx/msr1DdyjqMKldi6j34tYjpyiKC7/DyzamNkM3sDpEAq93D3pUi7b+GdkJJJUo2R
         8mrwyRzTk4CI9oTUnDkizVaOpARl4Q0h42k1N98uLnh2/MlM7eotzR5gS3oO3TrWknfM
         DU7s60+lnBgPJkSNM5lVKAarE51x5iA/SEDC4vULnQsXdbr+x+kN096qadpGNYLZZOib
         PW1w==
X-Gm-Message-State: AGi0PubK9OYmpvibHDEXGAxHZRYRPc52kCLlPtUdL32o2yd51Z6i7CtF
	uOQ2F0uYyWPieE1nKodIR5067wgnd33sKKkfLJuILFWk
X-Google-Smtp-Source: APiQypIDTfiyQpnk189V+b3jR/JVtVNY8V+qgHsx26aO/iXmbTcjjwPHPe0X0jHHcFoDSvwMFPKVRIFx8YqySqhqrdU=
X-Received: by 2002:a4a:890b:: with SMTP id f11mr2576302ooi.85.1587131708881;
 Fri, 17 Apr 2020 06:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200316160634.3386-1-philmd@redhat.com> <20200316160634.3386-4-philmd@redhat.com>
 <f570579b-da9c-e89a-3430-08e82d9052c1@linaro.org> <CAFEAcA8K-njh=TyjS_4deD4wTjhqnc=t6SQB1DbKgWWS5rixSQ@mail.gmail.com>
 <5d9606c9-f812-f629-e03f-d72ddbce05ee@redhat.com>
In-Reply-To: <5d9606c9-f812-f629-e03f-d72ddbce05ee@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 14:54:57 +0100
Message-ID: <CAFEAcA-4+Jcfxc5dax8exV+kBJKYEnWZ2d-V1A6sm6uJafZdPg@mail.gmail.com>
Subject: Re: [PATCH v3 03/19] target/arm: Restrict DC-CVAP instruction to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: co5x/u3ylV9A

On Fri, 17 Apr 2020 at 14:49, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 3/16/20 9:11 PM, Peter Maydell wrote:
> > On Mon, 16 Mar 2020 at 19:36, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >> I'm not 100% sure how the system regs function under kvm.
> >>
> >> If they are not used at all, then we should avoid them all en masse an=
 not
> >> piecemeal like this.
> >>
> >> If they are used for something, then we should keep them registered an=
d change
> >> the writefn like so:
> >>
> >> #ifdef CONFIG_TCG
> >>      /* existing stuff */
> >> #else
> >>      /* Handled by hardware accelerator. */
> >>      g_assert_not_reached();
> >> #endif
>
> I ended with that patch because dccvap_writefn() calls probe_read()
> which is an inlined call to probe_access(), which itself is only defined
> when using TCG. So with KVM either linking fails or I get:
>
> target/arm/helper.c: In function =E2=80=98dccvap_writefn=E2=80=99:
> target/arm/helper.c:6898:13: error: implicit declaration of function
> =E2=80=98probe_read=E2=80=99;
>       haddr =3D probe_read(env, vaddr, dline_size, mem_idx, GETPC());
>               ^~~~~~~~~~

IN this particular case, DC CVAP is really a system insn rather
than a 'register'; our register struct for it is marked up as
ARM_CP_NO_RAW, which means we'll effectively ignore it when
running KVM (it will not be migrated, have its state synced
against the kernel, or be visible in gdb). If dccvap_writefn()
ever gets called somehow that's a bug, so having it end up
with an assert is the right thing.

> I'll use your suggestion which works for me:

Your suggested patch isn't quite the same as RTH's suggestion,
because it puts the assert inside a stub probe_read()
implementation rather than having the ifdef at the level
of the writefn body. I have no opinion on whether one or
the other of these is preferable.

thanks
-- PMM
