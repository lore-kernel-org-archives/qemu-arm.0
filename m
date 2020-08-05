Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp792321lfy;
        Wed, 5 Aug 2020 09:52:19 -0700 (PDT)
X-Received: by 2002:a4a:ea06:: with SMTP id x6mr3769174ood.14.1596646338997;
        Wed, 05 Aug 2020 09:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596646338; cv=none;
        d=google.com; s=arc-20160816;
        b=k9s1pS9IzCuokyUo6qMAReYJCdmLO1T6raLAgIgf/RyQP67J6Ao0y4hF7l3w7463Om
         fauV0Z0gn6mHaAOmZ3e3mRfzRlpgchsC+kw49g2Rdd+tZVMPUcw6Q4fQF/2BgpfR8TB5
         SA6EGHz44YVbrcdup7fD2LsLBga9u7J8LDLPua22hl3UnwZlngpYXvi4dtLiQ5i5807y
         hC+WajCYdzaR+anEX3B9IkEVWmjjRZrTA04q97l3+eFt8YGcASvUcvIx01psQ4+9Wax+
         f4tvQefE753EBrLx4Marqr25cswdhdCB9T211wcny9m6qk7QUmd/zpCkb38GZQTo0jp0
         luEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wQZEdO6IRmBkW9gAD+QQA+Rxogg7RwJiDbXkcomON+A=;
        b=kvDlsfCqQXbH8WSLiESws2q0wLrx9gO+RujgTCel07CCFqLs0PKCP6vbfJ7k4Y7793
         0EzX+x0SyyFHNigFIPnH2p/LvLABToxnCtu3CLImymStm7TfBUkybPcEbhDNBIHUFKfv
         kjMMPwyKo4uu1aJ+PI/n0cO8b2Pc/osIGPeWzkHEHKcbcF/KbYIu1a2nLeVAqJHvKN3E
         7yP5ul7g2Z3Qivtlm3yHRO0/4hNqCIPoARNZ27BMoBR1esm29fwzdVbZv9H5QPIojtE6
         wCH2hScMX0wPbt9DP4syUKZz68piWwXmB6PoS6R2Lt2+ZTeJCF/vKvvnWsQnJ0xbxDLi
         eUcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PO/mKelE";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b1sor3080952oon.0.2020.08.05.09.52.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Aug 2020 09:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PO/mKelE";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wQZEdO6IRmBkW9gAD+QQA+Rxogg7RwJiDbXkcomON+A=;
        b=PO/mKelEWXE/0m6tUMD1Nx0Qucvx9Rd/0E7vI9ZylOlCcAl0OS9fm2Qowph1/UQ23C
         G/hPoaqPzVLiHl2fAtw5kA/ycdVunMy7UqrmpbGGNbuPcHVW6QFAMXF3MJW43NgKMCpx
         nr08TVfOB4TI4Nc/HptDG7Am2G1TiOJnV/3Vz2286eNwX213Ru2bx4MbToKm2UFcAVHJ
         i53P7BPjvNnHjI0fmrrWLEoKuQ9rYHSLi/gcmTz/sI4SoERw4tWpZKKLO6qn2RZCEcch
         6l1NCDsU7+hiP5rx6ZnzaJHrxVmNigBkvs8vHfy2hCvHBMPn+/kjQbXZq2GpsV0NyGqv
         KPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wQZEdO6IRmBkW9gAD+QQA+Rxogg7RwJiDbXkcomON+A=;
        b=kdzb88DKvWAxFYEuOJtVdCgBVWqAdkpsDqO3WLbZXyYgMc/uWA4wq3yIKWfTz/NL9B
         PuKV7qa5jYfLjHTNMJ0KgGQmOoZgxZDPPrE47Fi8TObM3ZFhTY+557B69f+KRN7bI4PW
         vfRty25C1sq8HuqRvnb6A64ibPzJD0Agtlq0MhBiC9FRJdFePWgKPfTAM652wK11/SNo
         AAbwmMEndJPoqutX8KjuuQXzNsPlZy2FRYeqwgbn/75Ft8lml7fQFzHYOj0Y7T6mpMAA
         rHyHJmjwySUQUub2adx46me2o7WJBhlE0o441fnO3O0Ab5KK5wIU1jPym3YwmXnPid0Y
         lO9g==
X-Gm-Message-State: AOAM531CrpffHWfCWp1aOv2h9jxF81W+lS2uWFbDBwc+Gza2i8fnbDpg
	4AYmZsfpni6z4lQ6zXPdjwLQ6QIEF7KddlNIKkABu6QtIYMYMw==
X-Google-Smtp-Source: ABdhPJzYcgspKiWF/vBeQhRU+5YCSCJ60GUsn6XpwXQJTOfPrVjsOpsKR5V3OvO9ynMOJ8XbAAjPELz5wrD9deUk6mM=
X-Received: by 2002:a4a:8dc1:: with SMTP id a1mr3728104ool.69.1596646338406;
 Wed, 05 Aug 2020 09:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
 <2c5ed9d8-6d79-1b53-5588-8fb9efebf0fa@linaro.org> <87tuxhkpo2.fsf@linaro.org>
In-Reply-To: <87tuxhkpo2.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Aug 2020 17:52:07 +0100
Message-ID: <CAFEAcA8+acTg6KoBDW5-7FvnrW=vDMXohWfTAXtTFv6BDqyuRQ@mail.gmail.com>
Subject: Re: v8.1M cpu emulation and target-arm feature-identification strategy
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: LD+uvKyeLQLE

On Wed, 5 Aug 2020 at 17:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> I wouldn't test other feature bits but what stopping us adding:
>
>     struct ARMISARegisters {
>         uint32_t id_isar0;
>         ...
>         uint64_t id_aa64dfr1;
>         /*
>          * The following are synthetic flags for features not exposed to
>          * the directly exposed to the guest but needed by QEMU's
>          * feature detection.
>          */
>         bool v81m_lob;
>     } isar;

Nothing, except we already have a set of synthetic flags, that's
what the ARM_FEATURE_* are...

> That said we still seem to have a number of ARM_FEATURE flags, are we
> hoping they all go away eventually?

I think that they're a mixed bag. Some represent cleanups we
haven't got round to doing yet (eg ARM_FEATURE_NEON, which would
be a fair chunk of work, or ARM_FEATURE_PXN which would be pretty
trivial to change to looking at ID_MMFR0.VMSA >=3D4). Some are
features that pre-date the ID feature bit scheme and so might
be awkward to convert (eg ARM_FEATURE_XSCALE). One or two
we've already converted and just forgot to take out of the
enum (eg ARM_FEATURE_CRC)...

thanks
-- PMM
