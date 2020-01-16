Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8216925lff;
        Thu, 16 Jan 2020 03:06:11 -0800 (PST)
X-Received: by 2002:a05:6830:20c5:: with SMTP id z5mr443988otq.0.1579172771417;
        Thu, 16 Jan 2020 03:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579172771; cv=none;
        d=google.com; s=arc-20160816;
        b=T+yxpI1lxqw1HUJBcuAGI+Y3bTBJvP1DdG7Qdos119etbmo8x2A7G+QIT7qTpUTfnv
         vVXMmGbiXj84KTtTfnhISIUJZqt2IGFoOT7jb0BZaYwz6fEDUcmv5FPzuOF3zt3rteli
         Ga2De8dMFJDUVzqRCS/D3R0MrH7iYTzo8Dh2aV2owyebvZokoBp3zoeEufmrUiFmIeKN
         tSY2cQJ4wNt9R3aDH4iYqI646mu0epaaZRkNYrROQJGv95t2lCt7JC92mhUQKgh+UR3C
         ZHcw7DD8cQMyi1bvlNhT+S/4HKQ+m6azuCUlFlPlSHOu94rdhckwXP8CqvNtENvAvftT
         ldpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NXs9zejndSKn58taRfp3OhJmHFveZnbnUxGrW0n4mYc=;
        b=FE8unU/T04vtFwfoOt2H+iPPZ+uNkIMTCrGoVA4U/3IIfgoeloXyyrf56DZQVdvpum
         lAz1czwTtagV4Ojcf5iqVF1z376Et0uhUhcnGmc7GgeSCwTu8XWQJZK9T6CWkfIAEBKV
         MUbJmKuPwbRH7pS6lQqZV7AWkdkwuGYrEZCCaRcjPq78BHxK284Acrq3DA+7ys1voyeI
         WHp3dhZHVIeXII/eVK4WiAc7l4YInYZpngwjS7SWVDVLOxo/rMzNgVZOEV5cspnRi2G2
         gNRY0cVIXE6MRTDOehcCNFvCi3p7KukSxivJJH4DbioIWQiEDIpib6hyRpATkE5xhl3r
         dfMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gf9kufkS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 26sor10477705oir.34.2020.01.16.03.06.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Jan 2020 03:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gf9kufkS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NXs9zejndSKn58taRfp3OhJmHFveZnbnUxGrW0n4mYc=;
        b=gf9kufkS8+lJ/lcLjzaXcj3peGPEkEW6oS+bGX78afCakKebr/kL1EvfJkaPOVzSER
         FU5jdxH3O8YypPTkiWigRiSWThCTO+7oATbkL9o1y8JFlhYoUZOGY/poEbka6xphHI3V
         4fU3oToPCu+z4+GPmf4lBkDAjeb05y53C5cYRLXtA7OBaVMIGhJfk3zGaq8VWweJKMkV
         8VtCHnkLsNG3qqBW4dVgqtXq0GpZnSI6AjjYk1eFJ+g/Rh/V7KmDKAPEtjPCMOjguc86
         1vhcJyIq60xWLRdfk0/VDvgqMy1tpbxEtYBco56amr/wRK0j4qTHfPyseGEHzxHc6iFo
         GC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NXs9zejndSKn58taRfp3OhJmHFveZnbnUxGrW0n4mYc=;
        b=YT3Bt+hDjkEejLiZXOh+R5Np38qJo21cTb2t9UBjknu0ErbFWi0K/UCsOnSJvKBkNm
         hLz34wyGZz52FpDY6/cdcFhTHsgjX9zzeSuybhM0CjUUw5qi2irBGU1EplXsP7cMR4fD
         jIh2RWzzSwJ5W0T4CS+qVDH7t78Z9FtjmfQbF0lwqAvaiUotJjhcAgGz8QXxgP8SHAHU
         4sq9TlByoZYeGNQ9Z94K96h6LNTR4JT6mU5XlNzJ8Et3/QbSegPYvQ10p5zAF3DoiBUt
         lIvMk9/vbHyoCcma6sCx0XVuH0htJ9+QgK0CCKbYj+NwZZ+n4sXbVQ+wHDQfLSYa0v4B
         0O6g==
X-Gm-Message-State: APjAAAVnYNDXG8EmjicAC+lz+arW67371QWUpaJiSwMUZVdzIKTn4few
	7pSWHMsnvEl9pti2wW1X7i5rMUbjhC05ay8CF2LNoHJd
X-Google-Smtp-Source: APXvYqxzU3UK5yklKHGc9cNeUWtTTJkyFo4NmjuEy5IbNUpk9JUoiScFdzGmVvrxrr1Nf/oVfxjqJMFIo7IsXefKmFw=
X-Received: by 2002:aca:f484:: with SMTP id s126mr3479891oih.48.1579172769658;
 Thu, 16 Jan 2020 03:06:09 -0800 (PST)
MIME-Version: 1.0
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
 <CAFEAcA-A_caQgwi5DzExdZChoTg-Qa73hq7Ho7dPLiN633Yj1Q@mail.gmail.com>
 <3ab2ca1f7a9b37b201a58f3a817edc5193e8b1f4.camel@kernel.crashing.org>
 <CAFEAcA8mphBky9Q2HTdOpQHiizd+5-o=yRnBbd_k1y6Uk-h8dA@mail.gmail.com> <5dabf7d9e2af43d6c01d2e7e51e466616d84a8df.camel@kernel.crashing.org>
In-Reply-To: <5dabf7d9e2af43d6c01d2e7e51e466616d84a8df.camel@kernel.crashing.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jan 2020 11:05:58 +0000
Message-ID: <CAFEAcA8yhB_POKJbXNykvyH+dx5Xb00GgT0qciNfCxLOQzuRuw@mail.gmail.com>
Subject: Re: Semihosting, arm, riscv, ppc and common code
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Keith Packard <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 1JiXoeIcNijT

On Thu, 16 Jan 2020 at 02:01, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Wed, 2020-01-15 at 13:32 +0000, Peter Maydell wrote:
> > On Wed, 15 Jan 2020 at 01:17, Benjamin Herrenschmidt
> > <benh@kernel.crashing.org> wrote:
> > > On Tue, 2020-01-14 at 09:59 +0000, Peter Maydell wrote:
> > > > Note that semihosting is not a "here's a handy QEMU feature"
> > > > thing. It's an architecture-specific API and ABI, which should
> > > > be defined somewhere in a standard external to QEMU.
> > >
> > > There is no such standard for powerpc today that I know of.
> >
> > So you need to write one down somewhere. You're proposing
> > an ABI which will be implemented by multiple implementors
> > and used by multiple consumers. That needs a spec, not
> > just code. I don't want to see more semihosting implementations
> > added to QEMU that don't have a specification written
> > down somewhere.
>
> That's ok, I can probably get openpower to put a link to the ARM one
> somewhere :-)

Minimally, you need to say:
 * this architecture follows version x of the Arm semihosting
   spec [and give URL]
 * specify the equivalent things to the 'The semihosting interface'
   part of the Arm spec:
    - instruction that causes the trap
    - what the OPERATION NUMBER REGISTER, PARAMETER REGISTER
      and RETURN REGISTER are for your architecture
    - what the data block field size is (32 or 64 bit)
 * say whether your SYS_EXIT is doing the silly 32-bit Arm
   thing or the more sensible allow-app-to-specify-exit-status
   64-bit Arm thing (you should choose the latter!)
 * if you want to make either of the 'semihosting extensions'
   (which fix missing features) mandatory, say so here
 * does your architecture need to define some SYS_EXIT
   codes? The Arm ones have a lot of arm-specific stuff
   like "stopped because of prefetch abort"...

> > The point about the mistakes is that you can't easily fix
> > them by adding extensions, because the core of the biggest
> > mistake is "we didn't provide a good way to allow extensions to
> > be added and probed for by the user". So we had to implement
> > an ugly and hard to implement mechanism instead.
> >  New
> > architectures could mandate providing the good way from the start
> > and avoid the painful-to-implement approach entirely.
> > (I think RISCV has already missed this window of opportunity,
> > which is a shame.)
>
> It is done and so now we have two architectures using that standard, I
> think the value in using the same overweight the value in fixing it but
> yes, we should try to agree on a method of extending at least. Is it
> really that hard ?

It's hard if you don't do it from the start. This is why the
Arm spec's feature-query API is "open a magic filename" --
we couldn't guarantee that existing implementations wouldn't
blow up/crash/etc if the guest code attempted a new "query
feature" semihosting call that didn't exist. If you can
reliably say "all implementations of semihosting for this
arch will fail ENOSYS on unknown semihosting calls", or if
you put in a get-feature-flags call from the start, you don't
have that problem. Otherwise you're stuck with doing it the
way the Arm version does (which requires your implementation
to actually track file handles so it can distinguish "magic
feature-flag file" from "normal host file"; it can't just
pass through host fds/handles to the guest).

Similarly, actually specifying errnos is only easy if you do it
before any implementations.

> IE. We could add a new call for capabilities that takes a pointer to
> a region which we pre-zero before calling in the client and if remains
> zero after the call, then the new stuff isn't there for example. That
> sort of stuff is easy, or am I missing something ?

The problem is if you do "call" and then the implementation
does "kill the VM" or "drop the user into the debugger"...

thanks
-- PMM
