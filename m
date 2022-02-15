Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp610692lfl;
        Tue, 15 Feb 2022 13:50:21 -0800 (PST)
X-Received: by 2002:a05:600c:364b:b0:37b:e457:1abd with SMTP id y11-20020a05600c364b00b0037be4571abdmr4579173wmq.91.1644961821527;
        Tue, 15 Feb 2022 13:50:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644961821; cv=none;
        d=google.com; s=arc-20160816;
        b=hmYBCb7PK6y5VsoSRFoxw4S46u+WG5GGfAXvcxJY6it0M5O0YkYl0WFWGFoyB7eYt4
         onNaY1IJjusyZZ+yi2UXRMD18vXfzVJXqLgFh8Y15VpJpoa9yDxRzQr8c2j/ESB5MeIp
         NC6LWrSF8D4q7+orymmBPXrzk4jhLLXbBI7cZnrAXJR0NW7JZ7EmrkrsJgkokiMWJ+fF
         YttvY3hOJggq11AK+TrhV1TvukBPDcg1K+jL7nIplcL7FGX+jAdAZ+Eb1d0R6Fo2H1eT
         18cQE8eK3XBeJD8y0mYcSLSymbqZsME8XlwJ0i9c+7tgREQ5P8iL81RPqzIirRll1ex6
         38Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hl9V2vSIDvdQJg3iIq63+5zfKgN3QkEu00wlkzTr30k=;
        b=x+AAkbaAhZxpwAaD65+AhwJjONgUgFobF0+8+RkutMUwELUmbmmHdKGMHOoFJXnAsW
         tXVCkpNskOF0STUOK6cAge7bzZthTmNxweW4Y+HsZMHHAHWdUbcBWTZEoWyDWVDo5O9/
         6I9X+UaxhWHyDYYEHUx/qUWvrmyuJOBQyvGlwecvQt6lp3H1HPI07krgJYLAr+OTrDgd
         NQFKFm8yGWiZofpA8wgjqXy5hT6HS2BOds7ysHnPlfFmEHXOrFqroQflx3kvIN0b2til
         2jqQkjKwmmm+kaSZUJTrPKQi5t2BAU+pje7kKEpZBoh4YsOJzRZEopuFN8Hf/1TR2qq6
         a8DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LBpS/6tL";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h6sor3088836wmq.29.2022.02.15.13.50.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 13:50:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LBpS/6tL";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hl9V2vSIDvdQJg3iIq63+5zfKgN3QkEu00wlkzTr30k=;
        b=LBpS/6tLDOtJEesn+pFKwuNu9zjjTMZ67UnUWcviJ19SgT4LCRMdKDvGCFTCodrRwM
         3NeeubDcRDk2Yi6TlP0xJW6qTiBNeyJ6nNt+MH+HiokseBJfCCAhV6239mdsA1wG7vRN
         36TZtKJM0OjH1vBIeN3DBJ6O/Q55pv2lOpcba/Xtg1Wn68cZl1Hmp9sv7McWdHtMToFl
         leV+1YsFCQkS6odVdUfzXhNCj9XPvbVUYCWFKp+y5W8EuilCBApBJrIsXQkFkgYUFH9N
         YYy8VdOK2SSqR0joHwYEa5bv+ocFRaNU7/lLlp1WQfSUu0cY27sKgMoaCOK4u+TTcjXs
         zpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hl9V2vSIDvdQJg3iIq63+5zfKgN3QkEu00wlkzTr30k=;
        b=taD7WgxmitYmAZ0hEdMc1E5MWyLkW1MQB8RbAot/zXrtAzgj0fjEIb4IZNp4+lP5oT
         TLxtPhzcTkcSEU+Yy9cC4V0wEdT28u01rcBLqSW5kMXJNUlllUAYOXWUy+M8BVKI4N14
         e8LTf5/cVPQDVIsPhhHC1Enk/E5YfAo5dVyHjGFTBNEPMdbIDJVzy8hlObvOt+aBlbNe
         o24IEUlYZf6zI0Vns8DOmHflB1BpJWhvHFRIR2HCsHsqmZgs9DEkBpYuLEfFlA7Lx/LQ
         s4w67BUA5+f5sepB/C5tG+E2ZRzEg/vanRMqEcVL/f7wrIkTzkqrEBA7QtGFC1gKdajQ
         bk6Q==
X-Gm-Message-State: AOAM533v0bpsfFEYk2vxbCmTsJCgtlJONDpizlLaIzfBtzBu2aa7mu3q
	Qh5IxyUJGDUtPosRgw2UUJo5a9xAHY6wpr2+iu1rzcl2trUJDQ==
X-Google-Smtp-Source: ABdhPJxmYSegOmL5KaR0sNI2T5QaX3zGffPuQL1PKmTh+2wN1UubHRH38t29cz5cSUZNeB/tBTzhT7dKYGpaoi+hQ1s=
X-Received: by 2002:a05:600c:4f14:b0:353:32b7:b47 with SMTP id
 l20-20020a05600c4f1400b0035332b70b47mr4915281wmq.126.1644961821239; Tue, 15
 Feb 2022 13:50:21 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-3-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:50:10 +0000
Message-ID: <CAFEAcA826e-gGQkLuD+eeCAv4+MYHCyaZzU=QKpPjRUctos-+A@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] target/arm: Set TCR_EL1.TSZ for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: rMRGW041rj0O

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Set this as the kernel would, to 48 bits, to keep the computation
> of the address space correct for PAuth.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5a9c02a256..92f19f919a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -206,10 +206,11 @@ static void arm_cpu_reset(DeviceState *dev)
>                  aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
>          }
>          /*
> +         * Enable 48-bit address space (TODO: take reserved_va into account).
>           * Enable TBI0 but not TBI1.
>           * Note that this must match useronly_clean_ptr.
>           */
> -        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
> +        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);

I think the kernel defaults to 39 bits if it's built for 4K pages
(probably the usual setup), but OTOH we've been effectively
using 48 bits previously so not changing that seems the best
option.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
