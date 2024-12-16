Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2391968njb;
        Mon, 16 Dec 2024 10:15:07 -0800 (PST)
X-Received: by 2002:a05:690c:628a:b0:6ee:bcdd:b1fb with SMTP id 00721157ae682-6f279b2dda4mr97289857b3.19.1734372907685;
        Mon, 16 Dec 2024 10:15:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734372907; cv=none;
        d=google.com; s=arc-20240605;
        b=aB6imuEBns1ZroUMW1mPnNetYT3olxYoxW0Bf52HMb9Q6T8rdt2qJiRos7kUC/5FCM
         +tCKDAs81UU253ZdjnOTSbWor5vbfaxNF+y3xK/Lorzm+BzIJHxmTqOzRnW3D2/qP11o
         Vh8LtOe0z/p3+xhC/2wT0Oib4QDYtliLfxOSOrlQqFWbY9xAuLnsIaL2IZkQP3ZEMW0C
         mNPhJEB+DADULhYiYoHIAwAu/8jLMEWgy28gepJoWJn7rYd4Nk9V3P5gbFF3J//4GUNW
         4pVkKscOMrPmsRtQiSFPD3itVnuTsPjtze9dpZqGBXEhjokn3MTf8jzgsnjyQxKDcWC4
         Aq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9O1TKsg2TNHr4BpDtt2C4w1mwrPUnbzM/X5S3xllnMI=;
        fh=CK4xvtBf7wvdSkFQWqr//NOFasnvoXLneAc10k2Os0w=;
        b=URiY2QRwaNXqcrQg8vWsdhi/3sLMrh7VE+GK2kKYmFkWXvIIM/DfpBKG/6zW642YvZ
         ahtj4MVurCtdEdsggQu2gsx6SXe8881mJRe/f6oKkZZyQcUrgOFqbda9D57K+KXb5Vxi
         ABrACQuFQH2/ma0nHFJtw4h7RKL7vit9dd1lHqu6wiZ9cLLBsRnb6TRVu3KucOwB/ha5
         iywtqjYMTFPIQGZZ5u4pKMxDHvsXm2BwPWZo7qKx46zTHrWJSfIMf4TJSb30hBKbGRO4
         TIABb0t/jL8DN0ZVRxji9J8iB6TkJd9SnV9gtiiq+JrTVttnWlP6Njk5U0mjFJ8cZxef
         k4mA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hM9Iiilb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f2890564d1sor33690927b3.9.2024.12.16.10.15.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 10:15:07 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hM9Iiilb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734372907; x=1734977707; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O1TKsg2TNHr4BpDtt2C4w1mwrPUnbzM/X5S3xllnMI=;
        b=hM9IiilbH+JWz0o9MtkP35n+HLyq7zOQzZfQdqDNRoad2eLxTHCMbJGrW5nsyRlIdr
         YhQoww2vG68pKql+96fTZIpLA74qK46Rrgfu3jOiYEiZvpft0JaAEZN1Uda7BO5EfLDe
         96zqPgWmRSNYHsDBmtFLo1JjVSEAho/SBR1Vfy3d8rJrAp6WXQ6d6KK4JlkMTTBhjBfh
         /sbDBGTb58ssBnK4FQ3cK3kHDVAF4ng2obKlzkkWUAY7CsMA9NIwGjAVAMnhNxy3AmyA
         dW7/3t2kl+mI+H9LZ5zddbKXN/OYR81TElJwK0LT+fAZJJRbUl5USkcu3eULWcVYOkeJ
         njeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734372907; x=1734977707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9O1TKsg2TNHr4BpDtt2C4w1mwrPUnbzM/X5S3xllnMI=;
        b=kf88ySMO59Tt61v0RTiwZyKl5QhrBor4hu3quc9qYzgMUXPE0GwpPU0TjHXB6uoWSD
         6ieZLmRFktuYIKJnIXYy6YBUuz0Gt/q4GfXe0iwVWeF103gupCbE6j0HQTXz7L8kuCaC
         biTWxkvno52Ml6sw9EdOHab+2cRJSyF3F3ODe3c7EJMe9V08R+nYX3HdW/58Ox9qOidO
         8j1A3j1QcKTxjMMnbTO7W0UoVfDfREj2LpPcaVzPsPyTcYDJylw/y7uO89Lg5np3Uds7
         pQwhsTooZMv8ufsTnkcSVfnkFxZl6geM6uyMrkTuQdQ1E+yzvRplbSvrjqS/SMVT034c
         nH5g==
X-Gm-Message-State: AOJu0Yw4uJZb27u1Y5QUb5PORAX6dnsyNp157JHezXFOohHQvqB/9mEE
	jd7tihEPL1Mxa+2rzukswXVrGkCmQi4BQnmgX1m1+LL5e5HYU1rb3ivDpYGj2LOXiW3wunQjy3b
	PkEOa4JcJZjq9AQ0XWCRlCdGcL3WpnM+0foZPAMHCea+uwlDuCdo=
X-Gm-Gg: ASbGncu98E04brgQE5fUSl0yJiX/OqjFEpKd4L8SvI1+TGOSjqKqTmS07dvFq6t6fOy
	E15XPeUctO7nbRCuZRBylnr8NIi00JvTTu0T/jpU=
X-Google-Smtp-Source: AGHT+IHyXK09daxX4pz/42t243P7Dp4eqSZpvj2mEl9smiSAx9tvRckEJrODyV1nya0vZI0rTG02tXdNPs6lSY6O0KA=
X-Received: by 2002:a05:690c:397:b0:6ef:a187:f377 with SMTP id
 00721157ae682-6f279b8da60mr100466677b3.34.1734372907304; Mon, 16 Dec 2024
 10:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20241206160239.3229094-1-alex.bennee@linaro.org> <20241206160239.3229094-4-alex.bennee@linaro.org>
In-Reply-To: <20241206160239.3229094-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2024 18:14:55 +0000
Message-ID: <CAFEAcA8mi=gTBvh9FqyMFeyqAHqirkah84sW4m8axKPqwMZDkQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: implement SEL2 physical and virtual timers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, qemu-stable@nongnu.org, 
	Andrei Homescu <ahomescu@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@google.com>, 
	=?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 9oaMjq0eUFo6

On Fri, 6 Dec 2024 at 16:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> When FEAT_SEL2 was implemented the SEL2 timers where missed. This
> shows up when building the latest Hafnium with SPMC_AT_EL=3D2. The
> actual implementation utilises the same logic as the rest of the
> timers so all we need to do is:
>
>   - define the timers and their access functions
>   - conditionally add the correct system registers
>   - create a new accessfn as the rules are subtly different to the
>     existing secure timer
>
> Fixes: e9152ee91c (target/arm: add ARMv8.4-SEL2 system registers)
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> Cc: Andrei Homescu <ahomescu@google.com>
> Cc: Arve Hj=C3=B8nnev=C3=A5g <arve@google.com>
> Cc: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>
> ---
> v1
>   - add better comments to GTIMER descriptions
>   - also define new timers for sbsa-ref
>   - don't conditionally gate qemu_timer creation on the feature
>   - take cntvoff_el2 int account for SEC_VEL2 in gt_recalc/g_tval_[read|w=
rite]
> ---
>  include/hw/arm/bsa.h |   2 +
>  target/arm/cpu.h     |   2 +
>  target/arm/gtimer.h  |   4 +-
>  hw/arm/sbsa-ref.c    |   2 +
>  hw/arm/virt.c        |   2 +

I would put the board changes in their own patch(es).


> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index cd147b717a..f82503304e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2668,6 +2668,41 @@ static CPAccessResult gt_stimer_access(CPUARMState=
 *env,
>      }
>  }
>
> +static CPAccessResult gt_sel2timer_access(CPUARMState *env,
> +                                          const ARMCPRegInfo *ri,
> +                                          bool isread)
> +{
> +    /*
> +     * The AArch64 register view of the secure EL2 timers are mostly
> +     * accessible from EL3 and EL2 although can also be trapped to EL2
> +     * from EL1 depending on nested virt config.
> +     */
> +    switch (arm_current_el(env)) {
> +    case 0:
> +        return CP_ACCESS_TRAP;
> +    case 1:
> +        if (!arm_is_secure(env)) {
> +            return CP_ACCESS_TRAP;
> +        } else if (arm_hcr_el2_eff(env) & HCR_NV) {
> +            return CP_ACCESS_TRAP_EL2;
> +        }
> +        return CP_ACCESS_TRAP;
> +    case 2:
> +        if (!arm_is_secure(env)) {
> +            return CP_ACCESS_TRAP;
> +        }
> +        return CP_ACCESS_OK;
> +    case 3:
> +        if (env->cp15.scr_el3 & SCR_EEL2) {
> +            return CP_ACCESS_OK;
> +        } else {
> +            return CP_ACCESS_TRAP;
> +        }

These should generally be using CP_ACCESS_TRAP_UNCATEGORIZED,
not CP_ACCESS_TRAP. The pseudocode uses "UNDEF", which means
it wants ESR to be reported as an uncategorized-exception
(classic UNDEF), not as a "trapped system register access".

Almost always a trapped-sysreg-access is directed to a
specific EL; an UNDEF is never directed to a specific EL
but always to the usual destination for exceptions.
I should probably check whether the other uses of
CP_ACCESS_TRAP are correct or just bugs we haven't noticed
yet...

> +    default:
> +        g_assert_not_reached();
> +    }
> +}

thanks
-- PMM
