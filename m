Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4128023wrv;
        Mon, 5 Aug 2019 08:40:18 -0700 (PDT)
X-Received: by 2002:a9d:758b:: with SMTP id s11mr76339296otk.130.1565019618397;
        Mon, 05 Aug 2019 08:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565019618; cv=none;
        d=google.com; s=arc-20160816;
        b=XFfwIaUqp6s2kHD8EvlbJlWCo3+byGAvHpBH06lhcq18PbuoTY/mSIZTJoTdnfatfo
         vMaUC+6fmqz6WrCBm5ih4OO5QIoogXpvuXxObqkJtIMsRrL8paI6+rvCca0km4i8OGnF
         YDJfKrZiWsiO2qN7p2gl+PIiEtr67neJyzEhpG9UhO/qATlok6Jv1K0ZDGCI+qmi+Iqz
         KQbWedsGm4JH6iq5msqeHILA2HKQlvhlX4+p3YCkVBItisqg4VTwikjzc1P6zS5Bb3gn
         f8unjfCCXEUYN9PJiLeXepob8p4HHewUTvypEjy+qGNELZRSe7C83hwDshfHNNTwsQ59
         PXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9qbLq7WRTEmy+sTg4oGPeIHaZG61/h7NL2vAEF+G4bM=;
        b=Y+nMQarq+yLEiyrjUmICEvECdgr3nGrqT3xBh8clGz7R5cniTLlkPgHl85Y/8+QN2M
         M0bPzSycqQIHKYINcw0MGOPS8BUiKsN1Q1qyOppMibuCCtn2KA6jd4jz50JqVBkbeNf3
         JV0tDhQElEolK0TAvY4ZITRwt/cYv1f52UXfWSyR+GGD/i+i24dfP1Vpi4WonUiVo/m1
         sH177f3yodnXMBqeB8xCCKlg4b/bq4dgIoWpMzs3AvKY97Ce2ozZjxICI5cBewS796Lj
         Y+lGzIphkvfK6oKGDh11l9+Ts4FcCKJQqOAM73/sNvwO2xhQ91OJd2IXNTwoKQlKOzSR
         FHcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8w3vzc2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c14sor4179420otr.135.2019.08.05.08.40.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2019 08:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8w3vzc2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9qbLq7WRTEmy+sTg4oGPeIHaZG61/h7NL2vAEF+G4bM=;
        b=U8w3vzc203D49LV1z4536ztvut8mnfyupJ1/zuLdXdKFjflWXz0huDC+PTOAUkHQN2
         cse1QzCzKl6HqP6aiedhFT/SLmbkVDqzz3AXbrsr+VrRF+TLhNt+VsazdyN50NbIVzi4
         K/FNtsu6NcU1d9HVEdmuHn0JjUq7G8oyefZGgQLrklxUbukyP+5pAb8MCU/9OuzXG0Qo
         UUbZ7i2eH0XwHDaOD9B3H/799y9VGX3LdrClVgRpZbpiE42vQeKM/U6x/vRR7i2xJuuH
         tWLdPDNJY9qaUa+JcdHF43vqkFRhTWNlR6jn9gpqgr6dyhRfZu9PA9oHhPDiFVRqTyn3
         g22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9qbLq7WRTEmy+sTg4oGPeIHaZG61/h7NL2vAEF+G4bM=;
        b=e9tvzgGFgz0ZP7Q8GKcYhdC7PhfrEvIQ+t1If2amNlzxX2zgl1m3kRR78zbCi9/neK
         yEkyRlNTFzuUjpPxad4vDmw3nTqgUUJarpH7xs7NhNGXIFywAYucbw21JiO3MMd1uSir
         gbVzsopixGX0+87+YvtewS2PjudZCVQ2yU+y49DXX8kvwpzP+i/H+sedMZUszFoFTq1a
         HO1ipmSc6h1cZBLczIeBCqidIBhBSlQRiL8nH0psQ+U0Iv6GhjmFcCV32zK9tFM1MiMm
         8VJlyKB4ZFK3G2T7s63LXGiYvsHsIOdAF5294bIDNv1dY4cFDS3EOONIQflldkVh4avW
         YN9Q==
X-Gm-Message-State: APjAAAVR/EXNslYhoyR/T8fAY8khe3l65yf8eTLUDBt9CGS8CVr4sODa
	lpkL54xW+I21qqba3R4AeIBR2oNR0RKjwezvINFtviSa
X-Google-Smtp-Source: APXvYqyKYizBzxBVZYpNq7b490RwvjKNKGraQXFedDARrVTsSXi8tlIn3kwYS7Ufv/HM1HJc02/5647lMxfPXOVD7X8=
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr11739738otr.232.1565019618017;
 Mon, 05 Aug 2019 08:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-16-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Aug 2019 16:40:07 +0100
Message-ID: <CAFEAcA9h83Xh0D7XjrLBiYB6c+CtP6=ONk8=2ME_4VZGpkhrLA@mail.gmail.com>
Subject: Re: [PATCH 15/67] target/arm: Convert Saturating addition and subtraction
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: PZnZBlGPVaI+

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h    |  1 -
>  target/arm/op_helper.c | 15 ---------
>  target/arm/translate.c | 74 +++++++++++++++++++++++++++---------------
>  target/arm/a32.decode  | 10 ++++++
>  target/arm/t32.decode  |  9 +++++
>  5 files changed, 66 insertions(+), 43 deletions(-)
>
> +/*
> + * Saturating addition and subtraction
> + */
> +
> +static bool op_qaddsub(DisasContext *s, arg_rrr *a, bool add, bool doub)
> +{
> +    TCGv_i32 t0, t1;
> +
> +    if (s->thumb
> +        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
> +        : !ENABLE_ARCH_5TE) {
> +        return false;
> +    }
> +
> +    t0 = load_reg(s, a->rm);
> +    t1 = load_reg(s, a->rn);
> +    if (doub) {
> +        gen_helper_add_saturate(t1, cpu_env, t1, t1);
> +    }
> +    if (add) {
> +        gen_helper_add_saturate(t0, cpu_env, t0, t1);
> +    } else {
> +        gen_helper_sub_saturate(t0, cpu_env, t0, t1);
> +    }
> +    tcg_temp_free_i32(t1);
> +    store_reg(s, a->rd, t0);
> +    return true;
> +}
> +

> -        case 0x5: /* saturating add/subtract */
> -            ARCH(5TE);
> -            rd = (insn >> 12) & 0xf;
> -            rn = (insn >> 16) & 0xf;
> -            tmp = load_reg(s, rm);
> -            tmp2 = load_reg(s, rn);
> -            if (op1 & 2)
> -                gen_helper_double_saturate(tmp2, cpu_env, tmp2);
> -            if (op1 & 1)
> -                gen_helper_sub_saturate(tmp, cpu_env, tmp, tmp2);
> -            else
> -                gen_helper_add_saturate(tmp, cpu_env, tmp, tmp2);
> -            tcg_temp_free_i32(tmp2);
> -            store_reg(s, rd, tmp);
> -            break;

This is changing the way we generate code in the middle
of also doing the refactoring. Could you not do this,
please (or where it really does make sense to do it then
call it out in the commit message)? It makes it harder
to review because now I have to read the patch for two
different changes at once...

thanks
-- PMM
