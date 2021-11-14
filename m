Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4693459lfk;
        Sun, 14 Nov 2021 09:20:51 -0800 (PST)
X-Received: by 2002:a5d:534b:: with SMTP id t11mr38889942wrv.75.1636910450929;
        Sun, 14 Nov 2021 09:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636910450; cv=none;
        d=google.com; s=arc-20160816;
        b=PjaBL+uJ/RFIGKpRcbC74diz5R6uWy2wMmeA11QqmxlN7mr03pUzXI3Ic+LJvo5d+B
         M4GkEpbdvq5hkoxb5RdA7BaEp750jxuTQhh9RJyLtcq4Ie2M4pzwfQ+yBapb/9Ax8Zdp
         yXee+8/q7Q+oYZ6JD3jBo3HWCIev9k29hLPvh0JqOubHItZLyVfU1A7D3R3pHhDqJzqZ
         19whOSh0Jxo/gwIX06FvVGce3xy17W4wMAvol5jlc6mCNLdsqMSdNG+7m6JDwU8ajsUg
         Po44Cc5dKcruzWmv6hKEA74s72FG/cwBv+SrqnmV3boYk0GD0J3H/XYBpooJpEfXKkS/
         G0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0GaARxGD+SE60SqGCTY0bjpSpup/KzOCXsExYeIS1wM=;
        b=c3YPQpJ160aEfkcxx8Uza8JQ/0RF+O0ciaYLkyUCmHlpfsvdwt2DcbBYh2xk3W9D+v
         h5u9lHAHc7XeeqeHYgtT96EZH7uCMsxcPIZqrSTcOffwQmokK76Eo9VU2v7fbvqd3jDT
         Dij/pBuSVBAoWgq4STC6c2nq9LkeM88dpXN7eBYHZXFNJGWHBe9P1GevlhcWTHzN/TVY
         xv6m01ORqhgDPHZaZAnVBzoBNCBWAVvK68Bp+dk6RuiBm0ICiAYUpdK1UqtO6+1iGBGf
         +wyHIGEpAiP6zYX+I/KSv8AUEhaq4CeJZsnqafuzPk+Nac3UUvGHnXFUzq8Uetiyqz8x
         G3iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K+a7e+TC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o22sor7077334wra.45.2021.11.14.09.20.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 14 Nov 2021 09:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K+a7e+TC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0GaARxGD+SE60SqGCTY0bjpSpup/KzOCXsExYeIS1wM=;
        b=K+a7e+TCnq6G1t7sQaKI/VPaqpM4TejRBAsgfhMrn8vW+UxB0a+V3jK8iGJqNJBder
         MIAAYxfDrcpJL0FYkiyO0M/zbG9LpbfK3VGDZsRCXADDYrzJheOs5ljue/fTiRRbCFuG
         SV3BaXadX4VFXa4KWtI0cq/aXdO0RM1r1eb/49dg/L1o+JvcCKTsA8EY0FQW00VGIEbI
         Y2r1iiBW8gle7AT4sPaUi2m4OzKpIjNKJIBOpVxzldtlAg93mp7333ZnqMos49brSNm0
         p7kVAnSg30Kzu6o+PpUWad3C3MiLv3AsS9pnTXKKsCctd2BDIsdnycuqR0zmlmjmW/6Q
         kdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0GaARxGD+SE60SqGCTY0bjpSpup/KzOCXsExYeIS1wM=;
        b=r+Sw7YBpRsM33b4qlxsQBd54WOsscfZBFAVAoihpTeVannr1cQm7E/UjBPi4b6zIDT
         dgfo1YwqlGnO0tZMw1oGezDEVE03U2TX+5Q21pRkDFHv1zOcUgkTd19CURWOVYM/M3mL
         bANH7JRXkxfQov5hLDha/4z/5rbAVxoV1zuCe+ClwY6MH0iVTvHFPrHmSdc4P2xuH92g
         7i2frAwaAfNF5ihWm7843VZZTHqYWuXz0IFs0DPEoO0X3NwgVrHtbLOa6ki9Jsdvc7UO
         Oj8xnV567H08odyYw5tzR55izC5qvzgFQ/u8aFJVFJnu3A2j0GKoRezDnyAHv1xq9Q9q
         PULA==
X-Gm-Message-State: AOAM533utDgfJmlAWOMIr12YzBR9yBfFRHV8yRWrUEH/RWBNrfGGvrh4
	IiWFVMHXRDwXHL8n/pWbbC1fPatdtsuTSV2ay8KDzmhX
X-Google-Smtp-Source: ABdhPJyQOfg/11FRLk685grtJU8JpllJnyxBPJfApAHS83iHsB3U6xcRlUz9/O8nDibtVv1+6bNIxAm9GR8geWySzZk=
X-Received: by 2002:a05:6000:186e:: with SMTP id d14mr38637898wri.376.1636910450610;
 Sun, 14 Nov 2021 09:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20211114105645.16841-1-agraf@csgraf.de>
In-Reply-To: <20211114105645.16841-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Nov 2021 17:20:39 +0000
Message-ID: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Andrei Warkentin <andrey.warkentin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: rgg44VSvtQbe

On Sun, 14 Nov 2021 at 10:56, Alexander Graf <agraf@csgraf.de> wrote:
>
> When we expose an SMC conduit, we're implicitly telling the guest that
> there is EL3 available because it needs to call it. While that EL3 then
> is not backed by the emulated CPU, from the guest's EL2 point of view,
> it still means there is an EL3 to call into.
>
> This is a problem for VMware ESXi, which validates EL3 availability before
> doing SMC calls. With this patch, VMware ESXi works with SMP in TCG.
>
> Reported-by: Andrei Warkentin <andrey.warkentin@gmail.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/cpu.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a211804fd3..21092c5242 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1782,11 +1782,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           */
>          unset_feature(env, ARM_FEATURE_EL3);
>
> -        /* Disable the security extension feature bits in the processor feature
> -         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
> -         */
> -        cpu->isar.id_pfr1 &= ~0xf0;
> -        cpu->isar.id_aa64pfr0 &= ~0xf000;
> +        if (cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
> +            /*
> +             * We tell the guest to use SMC calls into EL3 for PSCI calls, so
> +             * there has to be EL3 available. We merely execute it on the host
> +             * in QEMU rather than in actual EL3 inside the guest.
> +             */
> +        } else {
> +            /*
> +             * Disable the security extension feature bits in the processor
> +             * feature registers as well. These are id_pfr1[7:4] and
> +             * id_aa64pfr0[15:12].
> +             */
> +            cpu->isar.id_pfr1 &= ~0xf0;
> +            cpu->isar.id_aa64pfr0 &= ~0xf000;
> +        }

This is tricky, because we use the cpu->isar values to determine whether
we should be emulating things. So this change means we now create an
inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
unset), and depending on which of the two "do we have EL3?" methods
any bit of the TCG code is using will give different results...

-- PMM
