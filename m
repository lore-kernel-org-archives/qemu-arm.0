Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp99984njk;
        Tue, 17 Dec 2024 02:26:22 -0800 (PST)
X-Received: by 2002:a05:690c:9002:b0:6ea:86ae:cbc with SMTP id 00721157ae682-6f2bbb0825emr17341457b3.13.1734431182556;
        Tue, 17 Dec 2024 02:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734431182; cv=none;
        d=google.com; s=arc-20240605;
        b=kNeIpYcFINNkbF/0qzzWlBUYmr0eeRiGQEmcKZXyDsCkEjDhaCastZhoV5L1e+xoxE
         1TFcHvSSMSxNw/V3e9H80kHEAAw/DaM8oyBqV34i4cjjK2OBh29KDQoXupBMHrh9y1ZC
         qbCr6d+waNdyHKliXseHBREHvrUag337rP91LvAdtDD1pcLZx1CPzOGV4NCquw06xDrT
         x9EM8s60McvBYmR42HJtrAwzp8peXdufxx1xImbLzZ2oQ46qHtjgPltez+XSzzvIPtbD
         0vh88L8OHd+V6X+7aS22jb0qyr2xdt9hnZ4/BmimPOp5Yd3miNFHvgzf5JdLxPXd/uRa
         Rglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f/rQgZ/oeQahjrYm2PRJmTFP2DkZlk2xmXF2IH2WwbU=;
        fh=CK4xvtBf7wvdSkFQWqr//NOFasnvoXLneAc10k2Os0w=;
        b=XNi0jVnFlPwO/6VuI03n3DOk3mrphMkjgOFCOBJqKmnK66fTvrWi6v9QksRKPOYVOH
         RMsWKLRb/jStVxmSnNxu9iAbf6cSYotBdpc/Ue5KGS+QlaxhEE/RdKe8RhvV9Dd5T3lJ
         b+LK0fuSwZp3oenwdmukkg2W3MW5pC48E3zo7V8Y3UKXPqUG4WSW7QL/z7yMuHuR+IOI
         ExgF36i2sR0X1J2lwIbsdpzFLU22Y35ylxG7AIfPIR67hezfDiV6C2wP1Ib9TmqLxjs0
         BzXHSlBOhvQ0uONRvDMyRd8CGq9RS9wLCgnjwObXOLTlnq1KK24Zy5+BcZh4QojCksOp
         zGbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFIyul8i;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f26d6f06a5sor65364337b3.5.2024.12.17.02.26.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Dec 2024 02:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFIyul8i;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734431182; x=1735035982; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/rQgZ/oeQahjrYm2PRJmTFP2DkZlk2xmXF2IH2WwbU=;
        b=PFIyul8i7uym6WmMRSErpnjkFprCZKmB4ZGavVU0J4k5FxLepflMMLRPnZXbZCdKtx
         SuB0bqrF2m1s+rh4DxHixQn+NuMnFCsJeRqEF0rCHIqoSbJofG15ALy3Vck2917eRGkU
         OV7rUfG8Rx4Tu/aEAmdOaDxtsSsALEsfKJe0HPxI6iA6NDx9SImxhfGC/sjIesiFMzGG
         39pVkQhfccSrpRAIHzXasqRLCjtnIlMOQEoEf3BoHiBrEkQGEa4QCfwKz6M5s5MVQmuK
         5TilzimDlc0AmVWnfazFZo7Efb38/rbInrHOO9w4yuZqdhjQAS16KDbruSzqJW5eHrXC
         vdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734431182; x=1735035982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/rQgZ/oeQahjrYm2PRJmTFP2DkZlk2xmXF2IH2WwbU=;
        b=mNIuRob95nj1FlKAnALSSSzmd9AbrfUhvTbTQG7I3H3pHq0zUU0hZYEATwI9KWilyl
         lIWa9w30xbTqWrv6RYU5aWjXUYQg5P5xshJK0LpfwlcyuG5STMP6xqBdIAUnTHdrrYxy
         HdbBXrwAtN1c+XsvfuIgOuaUto4yMFq8EJooWxinvvnf/VUQAT6YohnilbQbIv4JCW4j
         Arw+Lft7f2XEXS4nx6jjRVRKvVym2MnAzCuvjf1wCDovjIhi4UOhVNBdbuKhF8XifJCT
         V1Dnyjre1zPD9BVxpKsLQgGfxNtYvvFw3TBVYv08PGykmIB8ErEFFEA2KywwKrs07S2A
         t3Ow==
X-Gm-Message-State: AOJu0YxrMGij2Elm0azYueSNrGolbowALpyMxob+A/xV/yNtj/3/e5WU
	MILmx/tMRFHo8yMQMRL2bnTL/tYxpg3pGxUFsmh17V169Zck8hzAIqW4eWOM6uXZIcAPccduE5Q
	6LvR7v43mpdTNqRap/pUy0WjC3XBC/gV+oXdgGLG7GeAD0R4ybfQ=
X-Gm-Gg: ASbGncsAU86VLPaFhqxnTrNpnXUzHnHaZIHMoX/or8Aa9VOH93FIwrckefNrGP9ZFKy
	w7QXaSb+MTmGRMRSs8KsV/p3r3H6jkaY4BJy28+Y=
X-Google-Smtp-Source: AGHT+IGIbn1mQdQVBYitHaeW5bX2cZ8tsbcLxdQXiPMvQeK2MLNBPiDSNM+HZLFaf8LXogMFU68HTmEvK7XCKmDVw8A=
X-Received: by 2002:a05:690c:600e:b0:6f0:5fc:7d with SMTP id
 00721157ae682-6f2bbae5e20mr20582257b3.11.1734431182168; Tue, 17 Dec 2024
 02:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20241206160239.3229094-1-alex.bennee@linaro.org>
 <20241206160239.3229094-4-alex.bennee@linaro.org> <CAFEAcA8mi=gTBvh9FqyMFeyqAHqirkah84sW4m8axKPqwMZDkQ@mail.gmail.com>
 <877c7z1l0h.fsf@draig.linaro.org>
In-Reply-To: <877c7z1l0h.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2024 10:26:10 +0000
Message-ID: <CAFEAcA_F4mXvCjY9r=-=zRYzsThA4_Yz=qN-Uc+1b272f-J20w@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: implement SEL2 physical and virtual timers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, qemu-stable@nongnu.org, 
	Andrei Homescu <ahomescu@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@google.com>, 
	=?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dljIys9BQHUo

On Mon, 16 Dec 2024 at 19:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 6 Dec 2024 at 16:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> When FEAT_SEL2 was implemented the SEL2 timers where missed. This
> >> shows up when building the latest Hafnium with SPMC_AT_EL=3D2. The
> >> actual implementation utilises the same logic as the rest of the
> >> timers so all we need to do is:
> >>
> >>   - define the timers and their access functions
> >>   - conditionally add the correct system registers
> >>   - create a new accessfn as the rules are subtly different to the
> >>     existing secure timer
> >>
> >> Fixes: e9152ee91c (target/arm: add ARMv8.4-SEL2 system registers)
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: qemu-stable@nongnu.org
> >> Cc: Andrei Homescu <ahomescu@google.com>
> >> Cc: Arve Hj=C3=B8nnev=C3=A5g <arve@google.com>
> >> Cc: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >>
> >> ---
> >> v1
> >>   - add better comments to GTIMER descriptions
> >>   - also define new timers for sbsa-ref
> >>   - don't conditionally gate qemu_timer creation on the feature
> >>   - take cntvoff_el2 int account for SEC_VEL2 in gt_recalc/g_tval_[rea=
d|write]
> >> ---
> >>  include/hw/arm/bsa.h |   2 +
> >>  target/arm/cpu.h     |   2 +
> >>  target/arm/gtimer.h  |   4 +-
> >>  hw/arm/sbsa-ref.c    |   2 +
> >>  hw/arm/virt.c        |   2 +
> >
> > I would put the board changes in their own patch(es).
>
> Won't that break bisection?

Any guest code attempting to use this timer currently is
not going to work because the registers don't even exist.
So there's no previous working state that would be broken.

thanks
-- PMM
