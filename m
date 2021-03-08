Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1694103lfg;
        Mon, 8 Mar 2021 02:10:01 -0800 (PST)
X-Received: by 2002:a17:906:d790:: with SMTP id pj16mr13996134ejb.255.1615198200935;
        Mon, 08 Mar 2021 02:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615198200; cv=none;
        d=google.com; s=arc-20160816;
        b=U/OOriLKOp2p5JdZc86E9tMwn2F/llLXvWItOTm1L+IRsI3z9rOeQPK1AXMP281xdR
         utJyrYRuN5VhBcAU5IMqalYvXRLxYd9I6o6LAdaBEWCdCQKWYCwbAC3aBlTCFwugArCf
         9JWmbkBJeGJZhtqusabQYZ6bbnFKlGSdkgVgUxYjefGaUVF5qS8qSKxMddr/bVN767zu
         W06y9rOtu2w1IbxH5KCPvKaI1h1iRlrX/9mKhQRS+p4ub2u3Ulek+JMl2MfeV7acmbvr
         Py6yKDKcKJN5CBiMl4qh+IwOwiPrHRMXzpNNASIA4cvhi4gUHrYWfboomz4NdbjbOXYE
         j/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4gc62TWE5gqasqsKUNpHr6cpjOkd1uWEK4cQ/0LQGC8=;
        b=WBJpcOWw71pWTpIq+KB/Yzpvvqf4r0f0N4WaNUuYd1SrHdRanxrPBYk84RYZcQBwGQ
         nPIVYqsZNOEdH4d6g4XYvJgnUPCala8VnMWmd26DffSLOiWSxTgWaOvpXE2+iYlGPOxZ
         OU1rRhk3YF7nOyBIvoBHxH1XW16MsgZ7G8tSnKAt6wcscFdw+lAJnONBI/qypVbJrPzm
         YsQoRsyoYGKgJbsmwU4oyKEDB+xnyCH8KjhOhaWZsSpDbeHMH9Pgh9HGH9incCGFQlCA
         PZK0GpN8nhjAjbZrm57nY1GOrsbHYLPkk8NJYT4g7gni0FywwRryZqFg1PCiOjqMYZE0
         A+ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKeYlGhJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u9sor9906079edb.13.2021.03.08.02.10.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Mar 2021 02:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKeYlGhJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4gc62TWE5gqasqsKUNpHr6cpjOkd1uWEK4cQ/0LQGC8=;
        b=oKeYlGhJry5toGjDb06GaRP0C0yuZwQMOHr9n0YtxMPma5GV99xQGnVwa6Pjbb7+jY
         f792J7kfiGKaN9J+kugHNtPgAfbnykEqNihvOKVOGJKg0jsbuBfRvbLDU7YwQsfYS5hF
         RPGzanrZIShiW8O3XRZIuCfHTIFrCxEVz1Hk9gsaLXAPohAuJAMI6XxULT80k46M2O/R
         8BxwKKD9sfbL3mA4oi9K5gH1aXTAu6gZYNng5idE/aq7Npsr0BM7UoZKkzjRT4XT/Q2L
         E3RdgnCDayKNe2DfQLz19yOCgAtYSrxPcbraoVax3i+fvaHXafERvpyXZnbtbCOlyLIf
         5Jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4gc62TWE5gqasqsKUNpHr6cpjOkd1uWEK4cQ/0LQGC8=;
        b=U/sHGhvkWeiQEmlC1gkXWjjQc1c/oYP4bBTCvEOxk10VY+PWvl7Ag2pBaIuxgCYSVS
         Z756TBZobYeyw29d0gXQm2UtaQBwemC2dN/AQq5jSLIoN8WgvIGtXzsBxSihZHweByY2
         74LMZdmXQ4IaKVPEF9v4hOnqHCF5VGPoO8nIi2OZhZbk7a+bL2ULuvXRFBmykCGajwAn
         FpYZMwfX8mWi50rbZOPZcOw2PPrMyRaTuE79Pm2gBc2j0frUsnbEdrHt/iVN390mbFE0
         k1K10hxLsVcPpMaGq8Tu+j/nxec5v+vphU3EeQLdFeyBhIbpy2oBt6dxo+m2luVV1j9r
         M8MQ==
X-Gm-Message-State: AOAM533OI19nuS5F6T6SiyiirxI8076ufdHesTzJtRDPBDNMtrGB+JU8
	wb09bMzUMd8XAQ8+xzahKe21uXvDal2p6h014LjihM5ZG6ZImw==
X-Google-Smtp-Source: ABdhPJwwS26xRUNCvR9URpXOo+g1KQhla4C3qajGDhejsEBW6BzNBQ6Vp89gPzU3Fx7cZEtWSeCyO2wPiMVdd4Xtujo=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr21093269edr.52.1615198200718;
 Mon, 08 Mar 2021 02:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org> <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com> <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com> <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
 <87o8fwfcjd.fsf@keithp.com>
In-Reply-To: <87o8fwfcjd.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 10:09:44 +0000
Message-ID: <CAFEAcA-X6aqsePMKgxzHcRA8okyVUg=Lxve2KqXrd+qiX=jjFg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of SYS_HEAPINFO
To: Keith Packard <keithp@keithp.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: AK1DWNb9m2RZ

On Sat, 6 Mar 2021 at 16:54, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Part of why I asked is that the current RISCV implementation
> > is just looking at sizeof(target_ulong); but the qemu-system-riscv64
> > executable AIUI now supports emulating both "this is a 64 bit
> > guest CPU" and "this is a 32 bit host CPU", and so looking at
> > a QEMU-compile-time value like "sizeof(target_ulong)" will
> > produce the wrong answer for 32-bit CPUs emulated in
> > the qemu-system-riscv64 binary. My guess is maybe
> > it should be looking at the result of riscv_cpu_is_32bit() instead.
>
> Wow. I read through the code and couldn't find anything that looked like
> it supported that, sounds like I must have missed something?

I thought Alistair had done that work (which brings riscv into
line with the other 32/64 bit QEMU targets, which all support
the 32-bit CPU types in the 64-bit-capable executable). But maybe
it hasn't landed in master yet?

thanks
-- PMM
