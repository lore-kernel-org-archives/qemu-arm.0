Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3231562wrv;
        Mon, 29 Jul 2019 07:42:46 -0700 (PDT)
X-Received: by 2002:aca:518f:: with SMTP id f137mr48310897oib.123.1564411365859;
        Mon, 29 Jul 2019 07:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564411365; cv=none;
        d=google.com; s=arc-20160816;
        b=bz63SZME5OmzZsU5K7yAZHnX9AAD27PZvpRHVmHa6Pbf39YHFGxaVYdM3ChyuXovpg
         5lFkJNR7roDBAdjgCu3VYQunxjFGXzsdIhZh7Ws4rxtNpZiNWS3x8XZgFNr/aL0VKXiE
         mWkOxxwKTGWDK9H1BMo8Mg66Mcw2fPqzxCtLsD+ntxhJgCg3U30MS3Q5gKmXdV4vTsmr
         XrqmuWRRtRorqGnxqSqK5mqt9LnQricDvmvwNx1SvlCUtlOOuovaaWjQ+yeoKnrjuHr8
         iWjw60ld5WM8U8Qd5XB1lkcg595Fkd/cx7GvPkQUYpXfPZhUs/3h0G8kEgaAbNM7I9bZ
         sp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sN+B8p3nt+elIHLIEIxGmV1cowNIOR5qOFD2eryaUOE=;
        b=d21Bmd4a8Kgrow8wyQlMD/ya1RYpTNrcoNNBTx0BYBGd7NJgSzlUjz+SlrSi7+55i5
         oBbN1Sg8vlLO9DbZXfFyJxNaQWB2N+E+QqWbw0CqandfxWIYKSMKyxzwuY5Dr2PeqJ70
         zrnYsDyzNiV1K1SPeDteBEOxGzUZW4jColrBtaKH4mNGIWC8Lgq7ZAGpumaBdcXHJVHD
         XSbU9v8f9xM460vtg7llJ4E4bCu725qVecbFGLHnAOcOCfXVya8dl+dsz/nmkwX42snD
         5yQ+QWBuMT+kvsQXYBVrtSPqiwMBMbBUNOaiSkr1llbguQyB0b3+d+BA35CvGORGtOtl
         NTGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZpLqZ7+m;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q11sor31783333otf.29.2019.07.29.07.42.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 07:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZpLqZ7+m;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sN+B8p3nt+elIHLIEIxGmV1cowNIOR5qOFD2eryaUOE=;
        b=ZpLqZ7+mr16jZy6lWFjcr+TelKJWl9614jdeC/BErJZKX7ooooEXVeEFvTDS4t6XOg
         lz2cqZAyxcRRjT1p1R+0q6PZZ0av6kHtq0H4GPtcVzD5EvLW71+ew7jS1WivA3ZSItis
         COVcCmB1WG+QAjIFc+OUbbbJeHjsruO8Fy+iS8cCGuK36qndyDteLVqZ02LumOTVs+I2
         4mqAoBbM6POxo/cmkj2m3DKi6l/t5cOYUDnI7lwDRiXUiMhbhuEzTm48pQgNqYAJz1x3
         tMxCq8Y7LnFa1+zezBOlvwZAcBULYuOz2VBIInP+E1+hUHezV636fXNOnIJ9TS4eitYS
         IA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sN+B8p3nt+elIHLIEIxGmV1cowNIOR5qOFD2eryaUOE=;
        b=MpcznUObHdSzYWyoOI7F1Zo36dss5+0rukdQTACfyk4jo96SAvD5yNsjcMp/khmVjR
         dsHF2TSTxDfGuvTOrXMOhJDwMp3OZnP1IM5zDjL4pu9B5GtWkNEdhl3nkIqyBKYVcff2
         YXivSYN1mZIkEhBb2qCMPMs15SJzsV+Y+cC6/DoDMSW7N7KuuRNiWHsP1ylFcB96IFlK
         v+XHuZJofOsc3ccKIy49czxbUc5RefzMuSVu7phYu57N6BYdz0cXwJ6Gqe6irdioiHQj
         elCqnJKhGwF5lQozWPz9ztIRnUrBK7T+ukMAuT/6MSxrZV4Thdni+1pFCJPJl5Fn8+NS
         NlwA==
X-Gm-Message-State: APjAAAWEbff5ByQM0o3X/7kEyLbbWa8EjA7umYC1VpWjDLwKvtGsbjHl
	nUpHodlRQtQKmDo0SKW01aCncU7GDCfs51TCyVQZDNVO
X-Google-Smtp-Source: APXvYqzSK+LaWBoH4zBo4atgXa0APGABiUIpgZV84J7J7U4hZ/sOPvN7osp63+qs2QVlhuMp3Sx57Hd4dgNNn7agMkc=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr23340197oti.91.1564411365349;
 Mon, 29 Jul 2019 07:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-12-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 15:42:34 +0100
Message-ID: <CAFEAcA82MOZ4ZJmQtte=LchMGT9grkWKBUwxPe9GMMRgh-wR-g@mail.gmail.com>
Subject: Re: [PATCH 11/67] target/arm: Add stubs for aa32 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: WevDtZgbftma

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the infrastructure that will become the new decoder.
> No instructions adjusted so far.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c       | 45 +++++++++++++++++++++++++++++++++++-
>  target/arm/Makefile.objs     | 18 +++++++++++++++
>  target/arm/a32-uncond.decode | 23 ++++++++++++++++++
>  target/arm/a32.decode        | 23 ++++++++++++++++++
>  target/arm/t32.decode        | 20 ++++++++++++++++
>  5 files changed, 128 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/a32-uncond.decode
>  create mode 100644 target/arm/a32.decode
>  create mode 100644 target/arm/t32.decode
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 36419025db..4738b91957 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7715,6 +7715,33 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
>      }
>  }
>
> +/*
> + * Include the generated decoders.
> + * Note that the T32 decoder reuses some of the trans_* functions
> + * initially declared by the A32 decoder, which results in duplicate
> + * declaration warnings.  Suppress them.
> + */
> +
> +#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> +# pragma GCC diagnostic push
> +# pragma GCC diagnostic ignored "-Wredundant-decls"
> +# ifdef __clang__
> +#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
> +# endif
> +#endif
> +
> +#include "decode-a32.inc.c"
> +#include "decode-a32-uncond.inc.c"
> +#include "decode-t32.inc.c"
> +
> +#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> +# pragma GCC diagnostic pop
> +#endif

I'm not a great fan of having to use the diagnostic pragmas --
they seem a bit ugly and not very robust. Is this the only way?

> +
> +/*
> + * Legacy decoder.
> + */
> +
>  static void disas_arm_insn(DisasContext *s, unsigned int insn)
>  {
>      unsigned int cond, val, op1, i, shift, rm, rs, rn, rd, sh;
> @@ -7733,7 +7760,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>          return;
>      }
>      cond = insn >> 28;
> -    if (cond == 0xf){
> +
> +    if (cond == 0xf) {
>          /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
>           * choose to UNDEF. In ARMv5 and above the space is used
>           * for miscellaneous unconditional instructions.

This whitespace fixup should probably be in its own patch.

> @@ -7741,6 +7769,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>          ARCH(5);
>
>          /* Unconditional instructions.  */
> +        if (disas_a32_uncond(s, insn)) {
> +            return;
> +        }
> +        /* fall back to legacy decoder */
> +
>          if (((insn >> 25) & 7) == 1) {
>              /* NEON Data processing.  */
>              if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
> @@ -7953,6 +7986,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>
>      arm_skip_unless(s, cond);
>
> +    if (disas_a32(s, insn)) {
> +        return;
> +    }
> +    /* fall back to legacy decoder */
> +
>      if ((insn & 0x0f900000) == 0x03000000) {
>          if ((insn & (1 << 21)) == 0) {
>              ARCH(6T2);
> @@ -9440,6 +9478,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>          ARCH(6T2);
>      }
>
> +    if (disas_t32(s, insn)) {
> +        return;
> +    }
> +    /* fall back to legacy decoder */
> +
>      rn = (insn >> 16) & 0xf;
>      rs = (insn >> 12) & 0xf;
>      rd = (insn >> 8) & 0xf;

> diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> new file mode 100644
> index 0000000000..2d84a02861
> --- /dev/null
> +++ b/target/arm/a32.decode
> @@ -0,0 +1,23 @@
> +# A32 conditional instructions
> +#
> +#  Copyright (c) 2019 Linaro, Ltd
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, see <http://www.gnu.org/licenses/>.
> +
> +#
> +# This file is processed by scripts/decodetree.py
> +#
> +# All of the insn that have a COND field in insn[31:28] are here.
> +# All insns that have 0xf in insn[31:28] are in a32u.decode.

"a32-uncond.decode"

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
