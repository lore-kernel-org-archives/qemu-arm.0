Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4120743wrv;
        Mon, 5 Aug 2019 08:32:51 -0700 (PDT)
X-Received: by 2002:a9d:6287:: with SMTP id x7mr11326647otk.359.1565019171707;
        Mon, 05 Aug 2019 08:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565019171; cv=none;
        d=google.com; s=arc-20160816;
        b=FpLFj7iVn5mZIzwjwqUxy8VbY2f+5H5zoWOS6hmpqfAC2T3dFomPy/8b1QWHMz6q0P
         UEoj0abzeSxynrl+hxaNXfMNi7AHf+EkvEWilkqmfqSusYClLyzIxgSdg4093ZiveBMh
         LwSrlvA/7mmPsxijzhY3W8XlPNVJKVuBOkXpagceU0Ue+S9ejWkMhNWmAKU8Xx5kJMkq
         Qd2xOAlanr1Nn1VUND3S+PmAolyJpTj0FCaBhUj0s3FY0Yatt2mtI+kBMp8sLtXKNQsu
         Zgw81q4dMOpX2uUbEjehVZlkoYq0cPmHD4SfjtIf5Z1Xnxzyxz9IlMy1dOEn1LBQfgpp
         TJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C47760llTQhFiFECzG/hHMnHdPDdskoYWYgyfiJ9SNM=;
        b=N2w6tAZ353dUTVsI6cmdsNbCbb1S8a5vD8vMBAZUeAnJEmJkg24eMJr9teuBFwH9dh
         r5/5ua3v3HB8oYAtqyjL9U/DV1WNshVHfMSHQ7bu+5Km6QDbsBYFynoVflCZ4eVxzQG0
         CKffyj8ERCtrtVH8I/xLtEMV+zQ2JPi0nzl1lyod6qFcpJQb4IVFQTb+drJyic1TYHu2
         yBiMzz/UnlgMzctiiBORgGiaMZZDkH3PB6l4BcS99WHo0Wx3qH46TejdmrTE/jZlgKGh
         CU/Q2VH0Vd6f1PuQbYc5oq81wZB/KhoEm8hxmSxcJpUvDO+/LdSkFC28HDZClI9TaKbJ
         1YVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELodW9gF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i4sor43287158ota.11.2019.08.05.08.32.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2019 08:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELodW9gF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C47760llTQhFiFECzG/hHMnHdPDdskoYWYgyfiJ9SNM=;
        b=ELodW9gFZU3d712pkkQwovv6skxckzqUERsy3MSAOaAJrbDYPfaxQWw9gCutEzdQp0
         GuWFu5Nuj+Hr52U7blOubmIhP5LmlsGnLJZ8Qiw+HgQLTBvpksDKTFr73sFXY5fKtqSg
         KhRasCfxXjvqe/xfjkdO45GKFxdlDPvFoy6Zd3/O6hA7PDzFgBt28M+qP98HxMVBdp44
         MHaCmcf4ElqgOYe61hN9B16WImxxv0LK7z2j+U6nIxCHNefUtMTi/Fm+5J2bmUergS0L
         e5FUhAb8geCIhJAJZB0GqJ9ttX/8po2YRZ6JI+VTIFjTQChMSlBTXeiYDVejN2TLaKB8
         LEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C47760llTQhFiFECzG/hHMnHdPDdskoYWYgyfiJ9SNM=;
        b=Ho/FLHVeIRSYaUr0OkNA3b4LocQjTJqhAl5G04mDYhbkRnjZ/Jowwvv9iFi8D7o44R
         drpPb/TXlxnNiMtnqhpFwWUTUB+HqEWK9t+C6jCsBB27oGpu7isEJfIfQle5eycWL/K2
         G4MjMZ9YSLOOr08Qc06BrVq4lrvoe9yGWqorP/VXTxG82AlFt/S/2Sd/EDtQomClh06o
         uHkmULaqbDFjjsjgQeHQO1D8t3eEwQ9Shv0rGxtvNwj25gDdTgdIm8g5CudAH7Z6rhNd
         +LaLLCLiiTu5pjymgm9ZgHZB6TTBMMhGpRt1LEoLFflSJblr1216wgBKGF3gInMpa4Ep
         IIxA==
X-Gm-Message-State: APjAAAXHnBtsODEWpjG89zdglNcGy76JnRDY8pJtsQAmmi1IuKw4FgKh
	pAdRnFIYxh775I5uaTABaRa/U7alZNIxQ9++CWWw+jF3IF4=
X-Google-Smtp-Source: APXvYqxpL3y8rk+3NLBRz1ZXsAHKP9hcAHXNkakja1PYpbiDeND35UT9w4AGe+7eJEf+qdnJSzG0R2eC83BfuIPvzac=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr55921980oti.91.1565019171245;
 Mon, 05 Aug 2019 08:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-15-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Aug 2019 16:32:40 +0100
Message-ID: <CAFEAcA8OC+Rru_qHU+1gQqmzmTY_8F+gtqZ5TyWoQAf60gUD1g@mail.gmail.com>
Subject: Re: [PATCH 14/67] target/arm: Convert multiply and multiply accumulate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: bjIQD5iOc0Ne

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 214 ++++++++++++++++++++++++-----------------
>  target/arm/a32.decode  |  17 ++++
>  target/arm/t32.decode  |  19 ++++
>  3 files changed, 163 insertions(+), 87 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index ee7d53dfa5..354a52d36c 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7376,21 +7376,6 @@ static void gen_storeq_reg(DisasContext *s, int rlow, int rhigh, TCGv_i64 val)
>      store_reg(s, rhigh, tmp);
>  }
>
> -/* load a 32-bit value from a register and perform a 64-bit accumulate.  */
> -static void gen_addq_lo(DisasContext *s, TCGv_i64 val, int rlow)
> -{
> -    TCGv_i64 tmp;
> -    TCGv_i32 tmp2;
> -
> -    /* Load value and extend to 64 bits.  */
> -    tmp = tcg_temp_new_i64();
> -    tmp2 = load_reg(s, rlow);
> -    tcg_gen_extu_i32_i64(tmp, tmp2);
> -    tcg_temp_free_i32(tmp2);
> -    tcg_gen_add_i64(val, val, tmp);
> -    tcg_temp_free_i64(tmp);
> -}
> -

> +static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
> +{
> +    TCGv_i32 t0, t1, t2, zero;
> +
> +    if (s->thumb
> +        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
> +        : !ENABLE_ARCH_6) {
> +        return false;
> +    }
> +
> +    t0 = load_reg(s, a->rm);
> +    t1 = load_reg(s, a->rn);
> +    tcg_gen_mulu2_i32(t0, t1, t0, t1);
> +    zero = tcg_const_i32(0);
> +    t2 = load_reg(s, a->ra);
> +    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
> +    tcg_temp_free_i32(t2);
> +    t2 = load_reg(s, a->rd);
> +    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
> +    tcg_temp_free_i32(t2);
> +    tcg_temp_free_i32(zero);
> +    store_reg(s, a->ra, t0);
> +    store_reg(s, a->rd, t1);
> +    return true;
> +

Is using mulu2/add2/add2 like this really generating better
code than the mulu_i64_i32 and 2 64-bit adds that we had before?
If we're going to change how we're generating code it would be
nice to at least mention it in the commit message...


> @@ -10292,13 +10337,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                      }
>                  }
>                  if (op & 4) {
> -                    /* umaal */
> -                    if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
> -                        tcg_temp_free_i64(tmp64);
> -                        goto illegal_op;
> -                    }
> -                    gen_addq_lo(s, tmp64, rs);
> -                    gen_addq_lo(s, tmp64, rd);
> +                    /* umaal, in decodetree */
> +                    goto illegal_op;
>                  } else if (op & 0x40) {
>                      /* 64-bit accumulate.  */
>                      gen_addq(s, tmp64, rs, rd);

This doesn't seem to remove all of the Thumb insns we implement
in the decode tree from the legacy decoder.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
