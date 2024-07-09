Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3170990njb;
        Tue, 9 Jul 2024 02:33:41 -0700 (PDT)
X-Received: by 2002:a17:906:3918:b0:a77:e2e3:3550 with SMTP id a640c23a62f3a-a780b6b0e1amr131339666b.17.1720517620760;
        Tue, 09 Jul 2024 02:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720517620; cv=none;
        d=google.com; s=arc-20160816;
        b=tAqFH7A9gJUgWy2DcehaCexEi59toWT0caLH07sRTPfweNOLpReqdfORbWH+jyR20X
         J11d+gUu1jBujl8ZOBf+QHwRsX1yHH2EEdjX1ulneG9KKRouktwTWwz922v/syT3x/XG
         TK3AFt+2/LmXwo0bWn/3pT/2w1jMuzjONcOVg8oH2MmkM+2k2ohxIq989zNIzWuJi2m2
         flLpaRNwdkh3ggPBPq2ET5v11jK8m1m9vK769YiOWD8nsI52W+VBkw8U0S8YKdMRDKdx
         VK6zmsYB1jQVF/h9nnJdGPZSxoyc6tbi3nIE9M3txC1DClfK8yakjECZNZ4mcUJovcR1
         o3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bbVjctvLXXyMcZGPi8Rzn/blROwKULMdZPgFn3B+fF0=;
        fh=K4nfQkTFTyVpGVPJaU1wdPSdIPFINQP/hwfimRO1co8=;
        b=U9RhfWeJ8WzIJzfZ4wFcxl+YQjaXLDhxOvoBrH+sUQzS4D5ykycy/InK3dYB6bbS8U
         zIsjP4nEgUMaJtkbcjLPGlK+s6kt7bjwfUYfDrTUziQFSVkwI7guVXmNPjl1n3Cxd0N0
         K4QZE4XXmAdCXNeR5rfngn+RlF1LyKnVaBdxY54iYcGJTBgCVj3lFb0hyoecAasVrIKd
         /7TVCjV3P+9tQCxvK1zkkiHz0DVMS5i2lv+KmGf2JhOeugr2sXCwb1OscvCySG2TjpwY
         ynH/igpEkA/OOt4LFLSe29fE1H2Bq+kICmGdgAvxp3w3q01AK+cZZxFk5MrytPUkXvZA
         E8/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VpOsU64b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a780a6dc647sor55646866b.5.2024.07.09.02.33.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 02:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VpOsU64b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720517620; x=1721122420; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbVjctvLXXyMcZGPi8Rzn/blROwKULMdZPgFn3B+fF0=;
        b=VpOsU64bGP2K6CpwE6z1r7eHlnhhFNyPGzyGn8yJLIeal3hhE6RDiftkD/gVcIMZbp
         5N30s0Q/koTvxH/Hu1n0tY9d1OE+Pk2F2HXbYijWpVgiU8qqh70EHt7o/epYUnecWfFi
         Hc3+iz/el+ij5ZAjdvRYBfTDNYdVjutJDs9znxAzdDvL5vvSTiAW5SbWPCuBuWGl0MlT
         OMwLkY0aVvaGQ1UdwON/uWb9Ba8Rx3bG+DXdarMtvXeIEMLxI/TbqvFiNcnaJ96VWp1Y
         GB7vEzAF1L9BVjCJD8IhxwY6GAnTO9NAeWhFcls6W0eREyKBqyP3MbWmxVsIZvXlUmtE
         Z6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720517620; x=1721122420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbVjctvLXXyMcZGPi8Rzn/blROwKULMdZPgFn3B+fF0=;
        b=jDz7codabcZzd0QzVst+I7jHbwvgLh1PzdW1iGcmLxpDe4b24TZAri+FnvpadfMRsc
         PM6XdHJFGDXf8hDGx1Suma3EKd9wZyOUiWkEVPfPJpD5Z9GBUpHArsYuVTqpchHWRGiA
         Rwy20NPpvKXKatZPiAIhUGxQtk9y9pJUeUAY/dML0rHFEJfASZicaE/s67chlGn4IC0e
         U9tfH9XHKLxWXjEFrKk7Hhmyk9A3eFpnbpPX05LjKrMoHJxZAMRNh1w9BvHnYbIT7RWS
         FM8JpPcAh3jNm5jNIQQYhDNdFKCjD8cQV+NeQ4Abc2KFmzZ4LYvJoxGzbSDniM1u5pas
         GT9Q==
X-Gm-Message-State: AOJu0YwS/AQX90MLcb5rh59QbpS7zTO2fVCHO6Cvj6br0OcowC3XYzh3
	JrKFLj+BQn4bZ5S0omfxLq59vbOnjnG9ubSH/f3eUCkQyIS2p/PcvZGdtAcALTtub0GTqfPQEnz
	qnK/TpriuTCWte+PQoohoAprUFhmZmy+A/MI92ODW
X-Google-Smtp-Source: AGHT+IEqljXx2JIG3odC0TZPvGH0S1XjoUQIcTmvsx8pPi2YJJHZXULcFmWZ4T2QD5eT6hnsCNvPIpRKmpFQApbwFJc=
X-Received: by 2002:a05:6402:b19:b0:58d:842:6272 with SMTP id
 4fb4d7f45d1cf-594bb67e9demr1055765a12.25.1720517620131; Tue, 09 Jul 2024
 02:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
 <20240702163515.1964784-2-alex.bennee@linaro.org> <Zoz7sQNoC9ePXH7w@arm.com>
In-Reply-To: <Zoz7sQNoC9ePXH7w@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2024 10:33:28 +0100
Message-ID: <CAFEAcA-LFtAi0DkFGc0Q3TYR_+X3TUWQru8crhbKun4EHctcdQ@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH v1 1/2] arm/pmu: skip the PMU introspection
 test if missing
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, pbonzini@redhat.com, 
	drjones@redhat.com, thuth@redhat.com, kvm@vger.kernel.org, 
	qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, christoffer.dall@arm.com, maz@kernel.org, 
	Anders Roxell <anders.roxell@linaro.org>, Andrew Jones <andrew.jones@linux.dev>, 
	Eric Auger <eric.auger@redhat.com>, "open list:ARM" <kvmarm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8HG9oINzrjV7

On Tue, 9 Jul 2024 at 09:58, Alexandru Elisei <alexandru.elisei@arm.com> wr=
ote:
>
> Hi,
>
> On Tue, Jul 02, 2024 at 05:35:14PM +0100, Alex Benn=C3=A9e wrote:
> > The test for number of events is not a substitute for properly
> > checking the feature register. Fix the define and skip if PMUv3 is not
> > available on the system. This includes emulator such as QEMU which
> > don't implement PMU counters as a matter of policy.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  arm/pmu.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/arm/pmu.c b/arm/pmu.c
> > index 9ff7a301..66163a40 100644
> > --- a/arm/pmu.c
> > +++ b/arm/pmu.c
> > @@ -200,7 +200,7 @@ static void test_overflow_interrupt(bool overflow_a=
t_64bits) {}
> >  #define ID_AA64DFR0_PERFMON_MASK  0xf
> >
> >  #define ID_DFR0_PMU_NOTIMPL  0b0000
> > -#define ID_DFR0_PMU_V3               0b0001
> > +#define ID_DFR0_PMU_V3               0b0011
> >  #define ID_DFR0_PMU_V3_8_1   0b0100
> >  #define ID_DFR0_PMU_V3_8_4   0b0101
> >  #define ID_DFR0_PMU_V3_8_5   0b0110
> > @@ -286,6 +286,11 @@ static void test_event_introspection(void)
> >               return;
> >       }
> >
> > +     if (pmu.version < ID_DFR0_PMU_V3) {
> > +             report_skip("PMUv3 extensions not supported, skip ...");
> > +             return;
> > +     }
> > +
>
> I don't get this patch - test_event_introspection() is only run on 64bit.=
 On
> arm64, if there is a PMU present, that PMU is a PMUv3.  A prerequisite to
> running any PMU tests is for pmu_probe() to succeed, and pmu_probe() fail=
s if
> there is no PMU implemented (PMUVer is either 0, or 0b1111). As a result,=
 if
> test_event_introspection() is executed, then a PMUv3 is present.
>
> When does QEMU advertise FEAT_PMUv3*, but no event counters (other than t=
he cycle
> counter)?

When we're using TCG but not icount mode we present only the SW_INCR,
CPU_CYCLES, STALL_FRONTEND, STALL_BACKEND and STALL events.
If we aren't counting instructions we can't present an INST_RETIRED
event, because we don't have the information. (The STALL events
always return a zero count.)

thanks
-- PMM
