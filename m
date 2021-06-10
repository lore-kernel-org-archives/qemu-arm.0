Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp451894lfa;
        Thu, 10 Jun 2021 05:32:45 -0700 (PDT)
X-Received: by 2002:a50:bf0f:: with SMTP id f15mr4373937edk.205.1623328365095;
        Thu, 10 Jun 2021 05:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623328365; cv=none;
        d=google.com; s=arc-20160816;
        b=YKVuPvs8ky7+1A3+tIyPqnxCuswlsIdh9SGcdAoO8cleFS1t4bVSl72HMZeKW+w/uf
         TmuGpahTVCCvltIeCNK6MF7Qn8Eqi8MkBmHjD+y2977eGbu7pMPZ/qNfOrlWVh+A1lFC
         qFWJSMo4L41cbKXHzE9jQ6rfGL5ZUurEe4QFZJVTZHSedsjacJ7dnawJG04T8IvqpWkW
         6+k9d5RA3g8ae++byMVUQ0ToH0gscl+6iHh553Rpe16EZyL/X3kDCHE9BkNoh7TxDJu1
         Xpn+gKOzedUKJvlTAFT29u69k2QVz5bWQxNa95UjNgJY31B/pQQl+ogpXRocIANjkrem
         unMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RvfFP/BczbmzpuVw0oueB8mLaRoeRu4Cc1i/lKczi3A=;
        b=P4QiunbKy6ydR+Y7SgNC91NVIbFWURo/N56HFHqeMbqGfezgOWRAHR9sJPPQx1K8XD
         Oj+5y0VPpZaXqGlwikdGq7R94RpoinbcwV/xCreMd3xjOTxN0VqvkH0SlTjds6rClaTv
         UkGFHP5Uv7xn2IFmqIQHjN6erfEKZ05OmHey26BUG3azLXKqpCr+Gm+OslPUDMOX9mV5
         HWTunCDAr4Ngc2o5L1R+XNFYP/KxsgcogBwlDaHQKzysX3iW9dCUCduXcdzac5AFpio5
         JlmHzUIEG2EfhLKKXDBJG66kerH8V25FsI/Yy77eNaVZ2Myjqc8eZhvvqIZRkw6n+7ZP
         YLog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZKsYbLTn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k5sor2963069edo.16.2021.06.10.05.32.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Jun 2021 05:32:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZKsYbLTn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RvfFP/BczbmzpuVw0oueB8mLaRoeRu4Cc1i/lKczi3A=;
        b=ZKsYbLTnlaQjiNaYSXp+zZPEU32Y1eq9BzcSvWSnLqLOUJjLjMMEwNGJ9s/I9iNaNh
         ADywhmKX8ApPSaJ6CPq0b3ni+MLUHrZMN32xjsMFm/JMGTq8yeLPH1Fg0I8agctbcRDW
         3iQfWDoGVew/sBobHTqWGPzQ+T96m2CYvX1F6o7e+uplq2x7+mPSRYupVbfERDkBUJoC
         cuLRTRcCnqyvsmQx/Uomo8inu2bsg5DyNk7hZnp+NkXSTHHyU0Vsnuh/Yvl2pmpNpJNx
         POuS/1eQqpRal+BE0z+2QWr+f56aw2uo37WGo7Nvte91vp7sPwnewUm29OfPpFm4p/vn
         W7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RvfFP/BczbmzpuVw0oueB8mLaRoeRu4Cc1i/lKczi3A=;
        b=HoFm1XbMy0O2FzcHrIhgnIQ/hUz1mePrwo3vRR8P81Cy5Tt3pqAVY0M2b65GTeZSxB
         bZv4Az6TcxTtVfJ7yU/+LHzAaK5eO8XburtD7D2N0HOjWnmMtq89MynUUkZeFPbYuRPO
         IbkiFsvTDkR0ylO5nBctpxcDTWphxSM4VqhTJ/5V0LkXdol0OeHO8KJh1YTUdWzgyBZJ
         k+g11hqTdwfkMkAC4iDmgngxqAzUDxm4HPw1yvlH2RZAnlCN9yzCgFr4AmMRfWvMPin4
         ultlDgHrvibHkFZZnXQvthKmItGCQfCJAaNZgKMwQeJrhgPYUNPCuDMN8hD97K1gxmGG
         N/bg==
X-Gm-Message-State: AOAM531Zd4C6PK5cBvCNkLSO2t6aVwcVFihMtrniLou40pMtBwtD02dS
	+SefkDWhki0ETNGh98NfwGapLuMIsR5h2ekubJyBn9yiyA5lZulW
X-Google-Smtp-Source: ABdhPJw8EiuP7AhmmNbjRn9g5+KoIamu/yP3ds8ERfGpbSWBFvJaNp9qpQl5iTQhQcRt9QGKrugG/zi7VUMQ0SX4r2Q=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr4420113edt.100.1623328364783;
 Thu, 10 Jun 2021 05:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210610102617.17281-1-alex.bennee@linaro.org>
In-Reply-To: <20210610102617.17281-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 13:32:11 +0100
Message-ID: <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Andrew Strauss <astrauss11@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: y0Oas233henw

On Thu, 10 Jun 2021 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The previous numbers were a guess at best. While we could extract the
> information from a loaded ELF file via -kernel we could still get
> tripped up by self decompressing or relocating code. Besides sane
> library code like newlib will fall back to known symbols to determine
> of the location of the heap. We can still report the limits though as
> we are reasonably confident that busting out of RAM would be a bad
> thing for either stack or heap.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Andrew Strauss <astrauss11@gmail.com>
> Reviewed-by: Andrew Strauss <astrauss11@gmail.com>
> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>
> ---
> v2
>   - report some known information (limits)
>   - reword the commit message
> ---
>  semihosting/arm-compat-semi.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 1c29146dcf..8873486e8c 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -1202,10 +1202,14 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[3] =3D 0; /* Stack limit.  */
>  #else
>              limit =3D current_machine->ram_size;
> -            /* TODO: Make this use the limit of the loaded application. =
 */
> -            retvals[0] =3D rambase + limit / 2;
> -            retvals[1] =3D rambase + limit;
> -            retvals[2] =3D rambase + limit; /* Stack base */
> +            /*
> +             * Reporting 0 indicates we couldn't calculate the real
> +             * values which should force most software to fall back to
> +             * using information it has.
> +             */
> +            retvals[0] =3D 0; /* Heap Base */
> +            retvals[1] =3D rambase + limit; /* Heap Limit */
> +            retvals[2] =3D 0; /* Stack base */
>              retvals[3] =3D rambase; /* Stack limit.  */
>  #endif

I'm told that the Arm C compiler C library always assumes that
the "stack base" value is what it should set SP to, so reporting 0
for that will break binaries that were built with it.

As the TODO comment notes, the "heap base" is a bit of a guess,
but putting stackbase at top-of-RAM seems generally sensible.

What bug are we trying to fix here?

I think one possible implementation that might not be too
hard to make work would be:

 (1) find the guest physical address of the main machine
     RAM (machine->ram). You can do this with flatview_for_each_range()
     similar to what rom_ptr_for_as() does. (It might be mapped
     more than once, we could just pick the first one.)
 (2) find the largest contiguous extent of that RAM which
     is not covered by a ROM blob, by iterating through the
     ROM blob data. (This sounds like one of those slightly
     irritating but entirely tractable algorithms questions :-))
 (3) report the lowest address of that extent as the heap base
     and the stack limit, and the highest address as the heap
     limit and the stack base.

This would work for all guest architectures and remove the need
for that Arm-specific code...

-- PMM
