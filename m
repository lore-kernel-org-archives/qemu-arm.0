Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3205285wrv;
        Mon, 29 Jul 2019 07:15:37 -0700 (PDT)
X-Received: by 2002:a9d:7248:: with SMTP id a8mr17906933otk.363.1564409737582;
        Mon, 29 Jul 2019 07:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564409737; cv=none;
        d=google.com; s=arc-20160816;
        b=KSE3Heu3r0JMqY+PEWEW4gAbFtSo47Q5asFbXOjqpVrFo6GZo7i9WkEfEnA5FD1uW9
         ohYQuZv9B8iQNOBPSk25hEvwoLJdlzTPN9nejqXR/p127InxiI9GGuijpSyC3jdUeyS6
         DTII3Bpd6VFEHHJQK2KCQ0WgUWWqaRdM1cvsTGcTg1g8EFo4kGtBkK/aL16gmLixZagu
         Q0mMAQFVe9Fye1CwvuEUQeYettRYl3Q+P35z+GTG6MhufaEEpvbqe9Mu+cng5QLkKOEY
         EPqPLVM3j1JJ85YIJEYR/rTNlM511Cc7oqPtW8HzWE4tuCOaw2bkRNHqtQUEtBZZpsjV
         fv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KQrl1BFn7FHz3PBVwJtYxz4acbe9CFGzumyCZ9gkleM=;
        b=xb2hBnNGNxxKn+YhVka8HyMVvD12zGGhH0I/hYTbxqvyjJ0EZNJxtvZ+i/4pCLMfk+
         l9QvmxJCiMMAyVOYjD9r8dlTqzBrJ4b4e6U5CPZBpxWmAxgXIOLq885Xf+lgydq3H1CI
         89OTEIAcGdeWMp5eL11Mj/oJpBMfKydOIXvYwbA/IFuz3P/IeCB35opbeXc48k2eqFWc
         vyW98MLeW+LH54/2bwKD4pE5fitnPbDl1IK0VjoQk4gUyqn4jTOvXRtamCdGDe5UL5H0
         0IkBDn2WafyhuB1nJ/HrfGC0bDOJNljuu1iqmvjXC445Pe0wM51gzBCLr7EbVaVxkfkk
         aJhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ib5miL4N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z16sor31575784otp.77.2019.07.29.07.15.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 07:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ib5miL4N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KQrl1BFn7FHz3PBVwJtYxz4acbe9CFGzumyCZ9gkleM=;
        b=Ib5miL4NAiQszXsR5dFJDTfv8nIxoMXpYuqJWbha37asuk2aov23uXthBzDiCNEjJw
         vxXxpbOF6AfCx45L5XPM7P12Vn7UwWBy6DqaoUMEbKo6E102BMMpywERatK/417ynN7F
         KEPZxpjvkvM+M38LiZ0CKVtQvmla7kY+FcHZdJWpCeGwDICpjYMmEwq9OabPx2sf79cm
         0WwDuC2nbweeMlP3bijcFRUyCxOhP2klCNOlQ+yZ4kFF67AkxlBbfqDYWTCVCKi9Xs3U
         qYu01ltttZbCvb52Ztnqoi/LTCoeq/DFg6DtH3hmzrVcpauqInb8kmTYfxfRqNzAyWz8
         l6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KQrl1BFn7FHz3PBVwJtYxz4acbe9CFGzumyCZ9gkleM=;
        b=ii07Kn1/MBGUusreszeI+5TlWnF2J7DpxTEIIqc6ySGWUT8Ju5PIX8qfrw0lptulLk
         DQRPvqTg2MDrsyHWx6v0Fj8L+gIJ17GXzlYZsNKS/0/cN61gY5behWauzZsMkNCYm0KE
         CEZySurRXX9bjUzloNJwol3y4SqSu07BlFjQEXYaaMuoF03RnFsKmPTmixwRc5EIxCnX
         yJ8iYQbFExpbT5FBfefNihVcMxsVV1BC7lDGisLYfgXMEyqDnw8lseVhvTN5w/yyOhvw
         CiAEFzdcF/mLZJV87XNB/7iKLf+0DZicbxkNXEypAv9EtRy/S9WsGVjoUk1W0Orlx+Yt
         5FWA==
X-Gm-Message-State: APjAAAXHd6a7/8zPHpthU2OqFp1ESW/kAzoH9pwVzwqSQ25ikKBblqv9
	+XVz+gb8cWEIik7c7jfcVbyAyF3BL86vhccp3Lmm3uMG
X-Google-Smtp-Source: APXvYqx5B5+80R6D8ZZRXEitZM26v+oEEicdccDuUJRcP9DwfeOsPQd9TWQlOAlFnke971OXUYhS0Lxo6XHraTNktjM=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr52343390otn.135.1564409737009;
 Mon, 29 Jul 2019 07:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-8-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 15:15:26 +0100
Message-ID: <CAFEAcA_HY=WuGEPxTEm5g5tYuCDHXRDs=9EXQd6r+zvsL6_=Uw@mail.gmail.com>
Subject: Re: [PATCH 07/67] target/arm: Introduce add_reg_for_lit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: KXnce34vQCKW

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Used only on the thumb side so far, but will be more obvious
> once we start unifying the implementation of A32+T32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c |  34 +------
>  target/arm/translate.c         | 163 +++++++++++++++------------------
>  2 files changed, 76 insertions(+), 121 deletions(-)
>
> diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
> index e7389bc057..4066b2febf 100644
> --- a/target/arm/translate-vfp.inc.c
> +++ b/target/arm/translate-vfp.inc.c
> @@ -941,14 +941,7 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
>          offset = -offset;
>      }
>
> -    if (s->thumb && a->rn == 15) {
> -        /* This is actually UNPREDICTABLE */
> -        addr = tcg_temp_new_i32();
> -        tcg_gen_movi_i32(addr, s->pc & ~2);
> -    } else {
> -        addr = load_reg(s, a->rn);
> -    }
> -    tcg_gen_addi_i32(addr, addr, offset);
> +    addr = add_reg_for_lit(s, a->rn, offset);
>      tmp = tcg_temp_new_i32();
>      if (a->l) {
>          gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
> @@ -983,14 +976,7 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
>          offset = -offset;
>      }
>
> -    if (s->thumb && a->rn == 15) {
> -        /* This is actually UNPREDICTABLE */
> -        addr = tcg_temp_new_i32();
> -        tcg_gen_movi_i32(addr, s->pc & ~2);
> -    } else {
> -        addr = load_reg(s, a->rn);
> -    }
> -    tcg_gen_addi_i32(addr, addr, offset);
> +    addr = add_reg_for_lit(s, a->rn, offset);
>      tmp = tcg_temp_new_i64();
>      if (a->l) {
>          gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
> @@ -1029,13 +1015,7 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
>          return true;
>      }
>
> -    if (s->thumb && a->rn == 15) {
> -        /* This is actually UNPREDICTABLE */
> -        addr = tcg_temp_new_i32();
> -        tcg_gen_movi_i32(addr, s->pc & ~2);
> -    } else {
> -        addr = load_reg(s, a->rn);
> -    }
> +    addr = add_reg_for_lit(s, a->rn, 0);
>      if (a->p) {
>          /* pre-decrement */
>          tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
> @@ -1112,13 +1092,7 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
>          return true;
>      }
>
> -    if (s->thumb && a->rn == 15) {
> -        /* This is actually UNPREDICTABLE */
> -        addr = tcg_temp_new_i32();
> -        tcg_gen_movi_i32(addr, s->pc & ~2);
> -    } else {
> -        addr = load_reg(s, a->rn);
> -    }
> +    addr = add_reg_for_lit(s, a->rn, 0);
>      if (a->p) {
>          /* pre-decrement */
>          tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index a48e9a90f8..5e2dd8bb16 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -214,6 +214,23 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
>      return tmp;
>  }
>
> +/*
> + * Create a new temp, incremented by OFS, except PC is aligned but not
> + * incremented for thumb.  This is used for load/store for which use of
> + * PC implies (literal), or ADD that implies ADR.
> + */
> +static TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
> +{
> +    TCGv_i32 tmp = tcg_temp_new_i32();
> +
> +    if (reg == 15) {
> +        tcg_gen_movi_i32(tmp, (s->pc_read & ~3) + ofs);
> +    } else {
> +        tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
> +    }
> +    return tmp;
> +}

This is losing the information in the comments about the UNPREDICTABLE
cases. Are there callsites where the new function is called where
"thumb and reg == 15" is not UNPREDICTABLE, or are they all
that way?

thanks
-- PMM
