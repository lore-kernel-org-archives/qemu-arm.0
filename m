Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp162671njm;
        Tue, 4 Mar 2025 06:36:53 -0800 (PST)
X-Received: by 2002:a05:690c:6489:b0:6fb:9146:44f5 with SMTP id 00721157ae682-6fd4a039303mr250898217b3.20.1741099013797;
        Tue, 04 Mar 2025 06:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741099013; cv=none;
        d=google.com; s=arc-20240605;
        b=RmIA2LeT3KD7ERFXJpWXit67TOtehE1gPLbepwIMRWdSr7ncjCTpN3aXG/+1x9jAVL
         0N07CwaKTnHRsuruvax5//4THmr3oFVVemYfYPRgyxSz2SAFuuehjriaZzMR9cOFddpL
         LKwS1k5gNhkJIb+tdEHV/9FfyUMCDU0na2iy1lP0SnV/pk+Z7t+lCSGYIhAi1MWQYwAV
         m59EFOwEnEZtSnUG5OAG6mGV1xM2g1Vwj3SNDAU0fs4al3Xqm8s0mcDnXh4GW6iCaeLU
         CoDOfNiqcK/Oy22W2BzGF4cbmdV8JC5ancWEhU+aGBMt39jpop910hf1MmS8HNiGHIjx
         zXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7cWQYOWnqy4Gwrd8HosQID6tt4wRQqdObtZVgA0+p2U=;
        fh=qVWCfp5cAbBY0ANV+bV9qYxhaQkocC3pw4wxQ8eVl4A=;
        b=AkqotNEzJr1ZEYa9vQ0UsMves44IRjgPWicI61ElrZGGoH9BbBs7R+NWQ3D5vJJ9iN
         KsjfYuvlsJAjtknRr3cUvyXXKEq7+SafTtGkBjCjzbSsVbMJG7+T+BexWdhFFiiEQN5H
         LKlFWLMTgU0Ulk1JDHZTLS6wJlAaY70hr108PQEMAFu8zgParSG42tfF5RI35SKiAqjG
         qkoFGbTUlTFdlhphlig3uXTvTfTLXpDA5eGwL40otEIhp/DT4Zz59CFVMUJbG7I9435M
         MWk8RlyNYVeStEvDRHE+BVGGBU5yWfVRIk5cPhlqbgmNx9NUAl/5+6kSrQXd4uaNMloN
         4M6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzeUnLgS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fd3cb8a1dcsor73389617b3.13.2025.03.04.06.36.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Mar 2025 06:36:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzeUnLgS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741099013; x=1741703813; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cWQYOWnqy4Gwrd8HosQID6tt4wRQqdObtZVgA0+p2U=;
        b=vzeUnLgSHcdCA7UUuutn4eM+kRg9MsR4jCv0DyjiyZwKLxVVtSRgfKvEDxU/g3zQr7
         RPWtSZZS7S5+3Y3bxaYuf2a8h6+DdZzylUEpZnNrxQU325haOo/9QQuWz2IPS6Cnvz2H
         JzKI09CFu2zJ9dpLSCYa2O3Q0LEg96MilqiKbuPwcmYIPGwE4v4vBaz3qS2AwujDU6Iv
         5QC6pdghOHEUhnTUnQyJ/NNCxB62GsYFURtk7GxHIYBEbL9Zwp9BoTbL0ORPEDSvQv5C
         9GPfwCt9Y3h/VxIx1Lc4+K4G2kQ9JwhSjtsotKfvOIDTp59t7+Drs1FYM5jrRKwTEmJc
         U74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741099013; x=1741703813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cWQYOWnqy4Gwrd8HosQID6tt4wRQqdObtZVgA0+p2U=;
        b=D4Jl/mWpk0QL+ZyaQZuqO22pt+PsTCvVuyX2FQrioqcY/LaA2MaTzRG4JfBD5zbDr2
         gjlK4gIxgVd1sBbEjMqq/mABBD+QEaxSUH2FQWH0xGk0a3Qa/9uNNAlNto7wlki0sGp2
         MRAXE9Uh8cz6wJAZQx20YSLFL7ArZkGObEL+ijwKGtqVr4EBuMBjA06r+l4o2XqNpg4i
         cg6COehhozkhyeexSTS/LNtlAtiXxlbnfUw8jCjGxv2c6zNa70rK7x3HzMD085FZJoWb
         wfhVC8fMTY8K2hQRcxGjh7xVGEPNOKKDNpEjyIpjj1TEVql0YaWMETLfodzV/m9St1fM
         8VqQ==
X-Gm-Message-State: AOJu0YyeGFsJMd6asdd8IHa6SOFh4t1bKc4EqvgGNs4OOKuorkDxbkWj
	rj/SuZ2YH1/sOOSiXN7kd61TBNZ/O73KU0vo+580l9h14+wcjWoJcSQKSAfsWiQHjcu+KbHw6R/
	g3awtczGgzv6xY3xyO+UFKU/231bFeYf8seCKu7k2pvuTdfKa4EA=
X-Gm-Gg: ASbGncva411bgjON4hvD1c0kn3Axj0SqgZxF8EjnMBATktDj+VrN2ma0h/jlF7LZCQT
	Bx+WOxlH/LtgsM2hJkVcIkSMVOyvQ3Ful6kMV5K65xwqOOAsn5ioiFPsGTEBpnG7/Urp0kwZQEp
	YJnyqxM/eycPoBkYpYwQP1kMPnGFE=
X-Google-Smtp-Source: AGHT+IG8VxfFSCtC43Hxz6L23TAjI/RL/tr7NkMy99QU5VfxAdDkR/3wU5XbGt7r5/5I+/4PUdmQQosGmLqa++M7iHs=
X-Received: by 2002:a05:690c:60c8:b0:6fd:346f:97ba with SMTP id
 00721157ae682-6fd49fcd7a6mr243540617b3.11.1741099013445; Tue, 04 Mar 2025
 06:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20250227141343.1675415-1-peter.maydell@linaro.org>
 <87o6yh57r2.fsf@draig.linaro.org> <CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
 <87ikoo6hbm.fsf@draig.linaro.org> <CAFEAcA9mFHo=U=F+7on-9m+VWh_b2rQXtEJovU3fuj3MZxHTyw@mail.gmail.com>
 <877c546f9r.fsf@draig.linaro.org>
In-Reply-To: <877c546f9r.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Mar 2025 14:36:42 +0000
X-Gm-Features: AQ5f1JoNbuN3lcdrdqRIq1AtATgoYPUDWNAElwAT0MFUW3IDAIgmulaae5o0vSg
Message-ID: <CAFEAcA_nbax7qq7Lxc-Qo8xTaxxTn9dJ5VQYuQTy+Qp1_2mNXg@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on sha1.c
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: E6Y8iOlwEDsv

On Tue, 4 Mar 2025 at 14:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 4 Mar 2025 at 13:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >> > I think it's new-ish (gcc 11?). On the other hand
> >> > -Wno-unknown-warning-option is quite old, and would suppress
> >> > this error. If we do
> >> >  CFLAGS+=3D-Wno-unknown-warning-option -Wno-stringop-overread
> >> >
> >> > does that work?
> >>
> >> Yes, I did:
> >>
> >> modified   tests/tcg/hexagon/Makefile.target
> >> @@ -18,7 +18,7 @@
> >>  # Hexagon doesn't support gdb, so skip the EXTRA_RUNS
> >>  EXTRA_RUNS =3D
> >>
> >> -CFLAGS +=3D -Wno-incompatible-pointer-types -Wno-undefined-internal
> >> +CFLAGS +=3D -Wno-incompatible-pointer-types -Wno-undefined-internal -=
Wno-unknown-warning-option
> >>  CFLAGS +=3D -fno-unroll-loops -fno-stack-protector
> >
> > I think we should do this where we add -Wno-stringop-overread,
> > not just for the hexagon tests -- or are the tcg tests
> > guaranteed to be run with a fixed compiler from a container
> > regardless of the local dev environment?
>
> I can move it, but hexagon is unusual in being clang based. However the
> oldest compilers we use are 10.2 in the qemu/debian-legacy-test-cross
> container.

My question was more "do we only ever build this test with
a fixed set of compilers that we control, or are we instead
maybe sometimes using the user's clang/cc/gcc" ?
If the latter, we definitely need to associate the
"don't warn about unknown warnings" with the place we are
adding the option that's not known across all our supported
compilers. If the former, then putting it in the hexagon
specific file seems OK I guess.

-- PMM
