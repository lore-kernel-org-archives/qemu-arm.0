Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp372676wrs;
        Wed, 28 Aug 2019 00:22:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjG+KX9/Mo1IqCWbT1Ww11e/qyP3R+waQsrZZ7UUBdI6bqxecigzOW3x6BO8VmxhF+SH7y
X-Received: by 2002:a17:906:c669:: with SMTP id ew9mr1871926ejb.217.1566976962575;
        Wed, 28 Aug 2019 00:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566976962; cv=none;
        d=google.com; s=arc-20160816;
        b=aNj3f+PeYE3fftFABJLi2n/WJ0d2sHC9ePUuQSgYBlSOz+hkQcD04lsRSCmG8S/t0t
         Ko6DPvmVxSohq0eJD8L6/2OuelKrFIwvfc5hEtSWMrc6ha9IxT53+0kQDWEn082D2foK
         D1D4tLZlJGBBjT0o3HqsnbgrftBMOVbmO6lJTm51i/tE7LtGV05lsIKs74WZQJxhCWCM
         49ub0OVR+w/uEn/NwZCVi45kLsYfV8kIKl06neJVAmWhKT4wNn4mvtGvPMC5THcndpK/
         33g2LjdJTI4vEvDdqhhnEaV13NaW0RupVFZ8171c58VhsG4QpRwNTvTNhBhZ2FDSQwsq
         /d9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2S5dxWQpGt9cRZtnrFqZQMNRJhoJBe5zlvTj3e53eAk=;
        b=TQCLqy+glEMI7iBX7mK+9giiwDQGblvc3CTVyJUS8KNM6P3DHecKLSebJCM50qHMsM
         23QvGgU7Jr7WbBYUM/R18E1txhJtmD9z3CTOc2FCg+mnumgFzdI4XmZEEIWkVBuBct+k
         TaB34u7asX8AZeXQ+NbY4qQqwK+wM1r60TLrw01UFrlLUTIwxxmuOQjqtD4gPWTaykim
         bEOWk4umHc9E4Ypx7+T3OflktlDwbh7VXOqm3sbIcCgtJhHMqDXKv8E6e0LIbSVOZx/j
         xzbTwQ3nxtqRT7aUtLFGdAx6YKRtIYoBnS6ThU/HVfpOZH/rUvfH+xDQkwSNYbMbMyg3
         eXDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TAOa4ti6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si694661eje.197.2019.08.28.00.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 00:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TAOa4ti6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2sHx-0007kL-F1
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 03:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1i2sHk-0007ek-SU
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 03:22:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1i2sHj-0007NF-Mx
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 03:22:28 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:35573)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1i2sHh-0007Lx-4s; Wed, 28 Aug 2019 03:22:25 -0400
Received: by mail-io1-xd41.google.com with SMTP id b10so3975028ioj.2;
 Wed, 28 Aug 2019 00:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2S5dxWQpGt9cRZtnrFqZQMNRJhoJBe5zlvTj3e53eAk=;
 b=TAOa4ti6MGQMCQVyxbOpnEfMr+q+pn64jwigkq3Akm0tg6pC9eFtJsHziElTibxBBZ
 hAWh+ZHEvl63VYotycKds2MCZmsUJRR6TjjFWmNzezt78snBaoA1NyRJ1iEafPUsRozK
 6xRbLoGpbTv0xBgA2I1gLWCWcHDKu65zGGXONPcaeYDkw8j5KdUzrfYhO5aepZb0wHHN
 K3j8/h6XPRBOs5cCDkHJ0NgeV4TdnK59afFnVcTK04UZYdCXyH+EgcCduglU4quM+5St
 gaQTsVBAL3epSs/29I7cyvycNvFT40pLJ7iCS1TDQxKO7rR+Lqf7onz5gaCLdS7i3rox
 WMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2S5dxWQpGt9cRZtnrFqZQMNRJhoJBe5zlvTj3e53eAk=;
 b=PAm2apV6x9joFgCBPn0GfQ/NSWdLy7pER8WugnbvePRKamxmj9tVkwShlFQ5usu/6t
 CKI90kNl0OaQ5wGMkVS1XGmgITFlHWlUHIwC6z8KFR6KShn8Vp26PNtwx6POSbWY4GPD
 VAH/lyDPBfuM+7iBTee6msRJOy3BeTyfuV5HVs6Oym7pbsdhp0rZlrLEeTHz3uiJ3v2C
 0sRHx29dgWy8AjE+0pUGwuqGYdpJOvAdHiWLsvj+JBOO68iAdq4fzM3l07Bp9L4fZqLW
 e6+ufeW2kHg4o1wlUv9BWx21HY8ZR65USIvLJzFphCjL8I89KMEWfgkuoXNJl6wkxdBe
 K32Q==
X-Gm-Message-State: APjAAAV+3yGTOn9gB0J/q+OHjx1SXD3w2H6sgMG9Y8rtVZ8K3gNKnBKT
 ofey7vTuEuwWzssAlUUJevYPOYRcVeEBLR/vpjo=
X-Received: by 2002:a5e:8301:: with SMTP id x1mr339844iom.84.1566976944254;
 Wed, 28 Aug 2019 00:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190808202616.13782-1-richard.henderson@linaro.org>
 <20190808202616.13782-7-richard.henderson@linaro.org>
In-Reply-To: <20190808202616.13782-7-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 28 Aug 2019 09:22:14 +0200
Message-ID: <CABoDooPO37bEjDF77_mU6Z57boRzuYaDP8DcTqtAOJxCjvBkRw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Subject: Re: [Qemu-arm] [PATCH 6/7] target/arm: Simplify SMMLA, SMMLAR, SMMLS,
 SMMLSR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uhKhhEIPL7hQ

Hi Richard,

On Thu, Aug 8, 2019 at 10:28 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All of the inputs to these instructions are 32-bits.  Rather than
> extend each input to 64-bits and then extract the high 32-bits of
> the output, use tcg_gen_muls2_i32 and other 32-bit generator functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 72 +++++++++++++++---------------------------
>  1 file changed, 26 insertions(+), 46 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index ddc54e77e4..77154be743 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -391,34 +391,6 @@ static void gen_revsh(TCGv_i32 var)
>      tcg_gen_ext16s_i32(var, var);
>  }
>
> -/* Return (b << 32) + a. Mark inputs as dead */
> -static TCGv_i64 gen_addq_msw(TCGv_i64 a, TCGv_i32 b)
> -{
> -    TCGv_i64 tmp64 = tcg_temp_new_i64();
> -
> -    tcg_gen_extu_i32_i64(tmp64, b);
> -    tcg_temp_free_i32(b);
> -    tcg_gen_shli_i64(tmp64, tmp64, 32);
> -    tcg_gen_add_i64(a, tmp64, a);
> -
> -    tcg_temp_free_i64(tmp64);
> -    return a;
> -}
> -
> -/* Return (b << 32) - a. Mark inputs as dead. */
> -static TCGv_i64 gen_subq_msw(TCGv_i64 a, TCGv_i32 b)
> -{
> -    TCGv_i64 tmp64 = tcg_temp_new_i64();
> -
> -    tcg_gen_extu_i32_i64(tmp64, b);
> -    tcg_temp_free_i32(b);
> -    tcg_gen_shli_i64(tmp64, tmp64, 32);
> -    tcg_gen_sub_i64(a, tmp64, a);
> -
> -    tcg_temp_free_i64(tmp64);
> -    return a;
> -}
> -
>  /* 32x32->64 multiply.  Marks inputs as dead.  */
>  static TCGv_i64 gen_mulu_i64_i32(TCGv_i32 a, TCGv_i32 b)
>  {
> @@ -8872,23 +8844,27 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                             (SMMUL, SMMLA, SMMLS) */
>                          tmp = load_reg(s, rm);
>                          tmp2 = load_reg(s, rs);
> -                        tmp64 = gen_muls_i64_i32(tmp, tmp2);
> +                        tcg_gen_muls2_i32(tmp2, tmp, tmp, tmp2);
>
>                          if (rd != 15) {
> -                            tmp = load_reg(s, rd);
> +                            tmp3 = load_reg(s, rd);
>                              if (insn & (1 << 6)) {
> -                                tmp64 = gen_subq_msw(tmp64, tmp);
> +                                tcg_gen_sub_i32(tmp, tmp, tmp3);

Shouldn't you subtract tmp from tmp3?

>                              } else {
> -                                tmp64 = gen_addq_msw(tmp64, tmp);
> +                                tcg_gen_add_i32(tmp, tmp, tmp3);
>                              }
> +                            tcg_temp_free_i32(tmp3);
>                          }
>                          if (insn & (1 << 5)) {
> -                            tcg_gen_addi_i64(tmp64, tmp64, 0x80000000u);
> +                            /*
> +                             * Adding 0x80000000 to the 64-bit quantity
> +                             * means that we have carry in to the high
> +                             * word when the low word has the high bit set.
> +                             */
> +                            tcg_gen_shri_i32(tmp2, tmp2, 31);
> +                            tcg_gen_add_i32(tmp, tmp, tmp2);
>                          }
> -                        tcg_gen_shri_i64(tmp64, tmp64, 32);
> -                        tmp = tcg_temp_new_i32();
> -                        tcg_gen_extrl_i64_i32(tmp, tmp64);
> -                        tcg_temp_free_i64(tmp64);
> +                        tcg_temp_free_i32(tmp2);
>                          store_reg(s, rn, tmp);
>                          break;
>                      case 0:
> @@ -10114,22 +10090,26 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                    }
>                  break;
>              case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
> -                tmp64 = gen_muls_i64_i32(tmp, tmp2);
> +                tcg_gen_muls2_i32(tmp2, tmp, tmp, tmp2);
>                  if (rs != 15) {
> -                    tmp = load_reg(s, rs);
> +                    tmp3 = load_reg(s, rs);
>                      if (insn & (1 << 20)) {
> -                        tmp64 = gen_addq_msw(tmp64, tmp);
> +                        tcg_gen_add_i32(tmp, tmp, tmp3);
>                      } else {
> -                        tmp64 = gen_subq_msw(tmp64, tmp);
> +                        tcg_gen_sub_i32(tmp, tmp, tmp3);

Same here.

Also the way you do the computation means you don't propagate the
borrow from the lower 32-bit of the 64-bit product when doing the
subtraction.

Thanks,

Laurent

>                      }
> +                    tcg_temp_free_i32(tmp3);
>                  }
>                  if (insn & (1 << 4)) {
> -                    tcg_gen_addi_i64(tmp64, tmp64, 0x80000000u);
> +                    /*
> +                     * Adding 0x80000000 to the 64-bit quantity
> +                     * means that we have carry in to the high
> +                     * word when the low word has the high bit set.
> +                     */
> +                    tcg_gen_shri_i32(tmp2, tmp2, 31);
> +                    tcg_gen_add_i32(tmp, tmp, tmp2);
>                  }
> -                tcg_gen_shri_i64(tmp64, tmp64, 32);
> -                tmp = tcg_temp_new_i32();
> -                tcg_gen_extrl_i64_i32(tmp, tmp64);
> -                tcg_temp_free_i64(tmp64);
> +                tcg_temp_free_i32(tmp2);
>                  break;
>              case 7: /* Unsigned sum of absolute differences.  */
>                  gen_helper_usad8(tmp, tmp, tmp2);
> --
> 2.17.1
>
>
