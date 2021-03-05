Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp379400lfg;
        Fri, 5 Mar 2021 06:11:14 -0800 (PST)
X-Received: by 2002:a1c:6707:: with SMTP id b7mr9422929wmc.185.1614953474607;
        Fri, 05 Mar 2021 06:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614953474; cv=none;
        d=google.com; s=arc-20160816;
        b=THjFL2f+Mw/pO65nAFxHRu3It37CrCFBIoTxdOUyGDwsp1EyAnDqvDvWpeEa0S6Qz+
         Q6kgnh+qqLkogEAs/sViGlKbmNtAuIbklJ5doxlGGXGaLLciHXe1+hxpQTTICe9jtOOR
         sQLWn915PZ4Eg3TUALvAOAmKHwI4UbeHo7tKQ94kNKH1GDM2LnEPzE3W+POw/hSI/Dbw
         ifaR2txkIPh8r1cUQyHbh6s2/kv6mh7k0lvjsfz+6tdGB59H19qiwpUyjgCGUalyPUj6
         ALq4C8TsTk826caQVG0z5Sw2oY5eVgHXedU3mHq/NZqbWYq4kzzMC3JTImtN7xCCF75/
         EZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/DKl3G/LtZDtxWR9akFOXs2U+ksZxUPIRkDwj8Ld7E=;
        b=g4JVl9qwZ/kwkgPWgefZIaSA9TcU4hfoWXx/WraiGhzJuecMzPJhZe1IM5L32Ju3uX
         0G43yHXWDepZ+9NUN2hPaTgzJhtuvOLa//VswOUJI4KqKLq75CL8u6RZGdMznvpHZh1U
         XgFvPfP0Ox4cirxFYu+nqJpK9lnZX67BMQ7kdnFfkkYrxR+Jx2y0PjV/B4cTGjUQk/f0
         Dq7y9z+xrno1BtmhJKu7V4gFg1qXC53/zbQa/gRD1qzlxnbU/MVT2mdH8gdUlDNIpDKI
         XQwpSGX3u0ifeY3HMzTtf3dY/H7r9N4YirOxUNdOLBf5A8bSWnzNlpI55SQ+16HjZ7nn
         VYHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EV1PPtgN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w18sor1475590wrk.28.2021.03.05.06.11.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Mar 2021 06:11:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EV1PPtgN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j/DKl3G/LtZDtxWR9akFOXs2U+ksZxUPIRkDwj8Ld7E=;
        b=EV1PPtgNet0UkE/uI52uk5Xy+1jzaH58HWIATmXQMX7igRuBlFhuyNtiLYNmzd7aTa
         9ZHq48krkYkjtr4ayZRR8j5gv9bLh4N3FKwd9lDTzM/B3sCQ6t9dZzen8sawecT81mqW
         ln0ZoTSer7GoBL5ql0KK+x3GvexGZVhtbYZtEsPZPBVyHROmvUS2Smb2xBj4+uBBGtt3
         DGuIJLzbaROfOKH4BFU+HmwyHWe8aM3rQe7dSfpnUBQfuGLnao/B9lElsHtIHQgIwYoE
         3YuXslMsvjV9uLzRfiXAnz3IWxNLJZm3DGI8HMvK7/QtWMmECdVO+gSpnNG0mR2X9O/0
         lTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j/DKl3G/LtZDtxWR9akFOXs2U+ksZxUPIRkDwj8Ld7E=;
        b=mrpr/IZHItPQoaGFWgi2h9Xxp651YU5MsEmKojJmj+GCZmpK2wDa8Kd7kZK/NXEoaK
         trxIcwi1I45FMG8LmM/GqHOFUOz0DYKh3aKli/dAovkDmmaPMnQAhsnEiOI+XJ/2K6/+
         frzF7v5HF/VShEAmBovOwD8OYQbHzF5kkN2nm6fkL49Wfapi8CCYA6YnTk+cxNcYMIj7
         NDNNqm8h4WP15Y863gG5DMfNeuIq6LaJb6jzANzL11JHt8e7jDQRBydFJ7tysA4gAt3V
         blkm55xWGqCA8xZOZo4OvxbIBQtzuri24evdTqvVmbOmEa6nOfmyYyRSOz7mE/mbf7u/
         stlw==
X-Gm-Message-State: AOAM532a3S+v/JwA/CN9UbhiSsK0DCYQ2flr+Fb1M0Ch21VRXvfgkYxU
	E7SYDqzpQ48yIjjIdQF9KUuVCSNyk6RMBZzkaz11lSXtOLhpvQ==
X-Google-Smtp-Source: ABdhPJwpZCPGgY5OQ4rwrRUgfg1C2Gc7oDB8z2orBfQV367LGUrApF/CwmA8s1amcmJ3GFEJZ/zLv+4lZd0eelHJiW4=
X-Received: by 2002:a05:6402:c:: with SMTP id d12mr9052839edu.100.1614953474350;
 Fri, 05 Mar 2021 06:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org> <20210305135451.15427-4-alex.bennee@linaro.org>
In-Reply-To: <20210305135451.15427-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:10:58 +0000
Message-ID: <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, 
	Keith Packard <keithp@keithp.com>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: geN/i8yAjJum

On Fri, 5 Mar 2021 at 13:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> I'm not sure this every worked properly and it's certainly not
> exercised by check-tcg or Peter's semihosting tests. Hoist it into
> it's own helper function and attempt to validate the results in the
> linux-user semihosting test at the least.
>
> Bug: https://bugs.launchpad.net/bugs/1915925
> Cc: Bug 1915925 <1915925@bugs.launchpad.net>
> Cc: Keith Packard <keithp@keithp.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/tcg/arm/semicall.h      |   1 +
>  semihosting/arm-compat-semi.c | 129 +++++++++++++++++++---------------
>  tests/tcg/arm/semihosting.c   |  34 ++++++++-
>  3 files changed, 107 insertions(+), 57 deletions(-)
> +#else
> +    limit =3D current_machine->ram_size;
> +    /* TODO: Make this use the limit of the loaded application.  */
> +    info.heap_base =3D rambase + limit / 2;
> +    info.heap_limit =3D rambase + limit;
> +    info.stack_base =3D rambase + limit; /* Stack base */
> +    info.stack_limit =3D rambase; /* Stack limit.  */
> +
> +    if (cpu_memory_rw_debug(cs, arg0, &info, sizeof(info), true)) {

Blatting a C struct into guest memory has endianness and padding
problems. Why not just do things the way the old Arm code did it ?

Also, you don't seem to have the correct "is the CPU in
32-bit or 64-bit mode" test here: you cannot rely on target_ulong
being the right size, you must make a runtime check.

I suggested in the other email the way I think we should fix this.

thanks
-- PMM
