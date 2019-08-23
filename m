Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp547782wrs;
        Fri, 23 Aug 2019 06:05:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQv5WupAAzEe0TDudS3Zkf2g0EQuV4hUmK1qDKSFCVZz+zEumTIxH+hLmEdwqDYaPI8KEU
X-Received: by 2002:a7b:c954:: with SMTP id i20mr5271811wml.169.1566565543033;
        Fri, 23 Aug 2019 06:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566565543; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9rNk/odtZoGvhT/AbhufpX4XZCjm233KEh7iG3OLpsRSZ7DNXRtI8tPyZ1cirTNZR
         g25eW+Sy1MX0cnaWeyn1cRXtPLZYu83h0k+4lj33wFYOe1ob40wXgZRVqQQyZ0N1/4wg
         xo5hKjfbx8TR+OfsPbo9Hso4EW+jFxN/054A2zmFZdU7zEQYDMCwVuK19qnJ+EM4rIru
         sKb/CAtXtKJHf6lJkNNbAUuXIgfwyzHcNZ9j+a4sDDh0fbDCG0x5hmYR6TJSSUK7zC6t
         4HWknjBfA91HFfnqv14V5vRmOJVUlpQPcv48DaVJrM5BCPa10yJuKLzLB5Fxa2ApfhJJ
         dHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3V5IMwDRdJxEHaCpGw2y6KqCjyfmiyL4t/7PUYITS3c=;
        b=Q6LOOuFthfvSEXBcM9rh/z8TwO1Smw6Rh8e/RwEtL/OLJ2Dt5wW+FVmg/SqJ21EIxj
         Rg75w+9t3nDU3K1++w6XvN40fq17dWm1WMK8Wjg50saHV5kgV+F1cpe1Lmn+orZSboEs
         7yjpztNDKl1oHXCsqs1L8rTHP3qKzCllRyYr/2CcUrZEJdadZc9WepDcWLnEaImR6usl
         Qe9E7HA2jVe+t3eMpGPICx80ZRxI6MT635wgqXPcGJ3QGmkRsS/u+eHdFPBnhtkDNXLK
         xstS+VDxRfmnUw1pe3QPna4bnIs34KyMQbBtcRAZ6GolarqlYvwHwgcRH6EGRFQJU1cG
         Ilaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dJK4Hwo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a32si1723836edd.382.2019.08.23.06.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 06:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dJK4Hwo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i19G9-0001f1-TZ
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 09:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i19Fc-0001RO-I6
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 09:05:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i19Fb-0004bF-7c
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 09:05:08 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41606)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i19Fb-0004aU-21
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 09:05:07 -0400
Received: by mail-ot1-x344.google.com with SMTP id o101so8652213ota.8
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3V5IMwDRdJxEHaCpGw2y6KqCjyfmiyL4t/7PUYITS3c=;
 b=dJK4Hwo7sT7nUFxqN8b/r6F2b21//5H/pTet9eMpEIiJ2OnsB6kAG+IiypGE/ZHOS1
 3irTdV/pS9+w2Zt+ONRr36iVuiFQrlk7d6wIoZxp73sUjoyR0rul2H6LfoDUSWZUhhRR
 NOqigikV2t8hVeHOLsNKc8UWPaSUVmRyxEsnwly1ezKgAoGf676J0vP06c8Hl0xm8E5+
 WqEIx5qMzh4L/1cqNxFM5B9dttJLpmFvpJJ2Kd4UNW8N5T/T7j5sbrRKAgmqrhsdZiz5
 7+pGil+2BT1tI/HntGv7V9vaMn479yv+fmIhfwhLB9tUb6aqjWJBx2dpfWFTAsj2fTUp
 pSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3V5IMwDRdJxEHaCpGw2y6KqCjyfmiyL4t/7PUYITS3c=;
 b=lVeMHmqIsFOzt7SNZ2yvhTqQaJ84UEL1lgo+seXPfgZTfU8wB2mhEgLsMjDhIB7xtk
 ROZDfuSIbA9tQEQdN4p9gI1H6N+jxHeeMBHH6sg2LB3oQp7LCCsiBrqz5WC8e/LH6Ntl
 7qSAmeVX+mBCXlAAhJPDjV3lcl5bNJggoB8RPRzYVaBQDPUHDS6hD7s2mlKg3jg6ld6l
 aErZY/JpZzde6bQ7hxfelZ+JtE2eyICsoQyAMqD+4TZXB/I7hw5sUTICsO+ccB+B7Yi5
 E1ua/B1GVWdU4G677CEGdh8zlcu/pL/qK2q+/1p2JA+1P68Bbp3qwIELTAxBnyNVsU2L
 4xOQ==
X-Gm-Message-State: APjAAAUtlh9MxygR3f6kl7o5DuXzLxT6AY1FaA+l7xPOVPNzkYhtRXq8
 OJCFCZCpxlXqruTuqi5dzHdUZIw8PtCmror1hUCOuQ==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr4198136oti.91.1566565505695; 
 Fri, 23 Aug 2019 06:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-20-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 14:04:54 +0100
Message-ID: <CAFEAcA8Q3ujQFtZfLXTsbKBxUQAHCPo0i_TpdX9KcmnNUY04Eg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 19/68] target/arm: Convert T32 ADDW/SUBW
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eg+3VzfQ1Qm9

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 24 +++++++++++++-----------
>  target/arm/a32.decode  |  1 +
>  target/arm/t32.decode  | 19 +++++++++++++++++++
>  3 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index cb6296dc12..0e51289928 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7626,6 +7626,11 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
>   * Constant expanders for the decoders.
>   */
>
> +static int negate(DisasContext *s, int x)
> +{
> +    return -x;
> +}
> +
>  static int times_2(DisasContext *s, int x)
>  {
>      return x * 2;
> @@ -7975,6 +7980,12 @@ static bool trans_ORN_rri(DisasContext *s, arg_s_rri_rot *a)
>  #undef DO_ANY2
>  #undef DO_CMP2
>
> +static bool trans_ADR(DisasContext *s, arg_ri *a)
> +{
> +    store_reg_bx(s, a->rd, add_reg_for_lit(s, 15, a->imm));
> +    return true;
> +}
> +
>  /*
>   * Multiply and multiply accumulate
>   */
> @@ -10670,17 +10681,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                          }
>                          store_reg(s, rd, tmp);
>                      } else {
> -                        /* Add/sub 12-bit immediate.  */
> -                        if (insn & (1 << 23)) {
> -                            imm = -imm;
> -                        }
> -                        tmp = add_reg_for_lit(s, rn, imm);
> -                        if (rn == 13 && rd == 13) {
> -                            /* ADD SP, SP, imm or SUB SP, SP, imm */
> -                            store_sp_checked(s, tmp);
> -                        } else {
> -                            store_reg(s, rd, tmp);
> -                        }
> +                        /* Add/sub 12-bit immediate, in decodetree */
> +                        goto illegal_op;

We seem to have lost the store_sp_checked() handling ?

>                      }
>                  }
>              } else {
> diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> index c7f156be6d..aac991664d 100644
> --- a/target/arm/a32.decode
> +++ b/target/arm/a32.decode
> @@ -30,6 +30,7 @@
>  &rrrr            rd rn rm ra
>  &rrr             rd rn rm
>  &rr              rd rm
> +&ri              rd imm
>  &r               rm
>  &i               imm
>  &msr_reg         rn r mask

Should this change be in some other patch ?

> diff --git a/target/arm/t32.decode b/target/arm/t32.decode
> index 5116c6165a..be4e5f087c 100644
> --- a/target/arm/t32.decode
> +++ b/target/arm/t32.decode
> @@ -27,6 +27,7 @@
>  &rrrr            !extern rd rn rm ra
>  &rrr             !extern rd rn rm
>  &rr              !extern rd rm
> +&ri              !extern rd imm
>  &r               !extern rm
>  &i               !extern imm
>  &msr_reg         !extern rn r mask
> @@ -121,6 +122,24 @@ SBC_rri          1111 0.0 1011 . .... 0 ... .... ........     @s_rri_rot
>  }
>  RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
>
> +# Data processing (plain binary immediate)
> +
> +%imm12_26_12_0   26:1 12:3 0:8
> +%neg12_26_12_0   26:1 12:3 0:8 !function=negate
> +@s0_rri_12       .... ... .... . rn:4 . ... rd:4 ........ \
> +                 &s_rri_rot imm=%imm12_26_12_0 rot=0 s=0
> +
> +{
> +  ADR            1111 0.1 0000 0 1111 0 ... rd:4 ........ \
> +                 &ri imm=%imm12_26_12_0
> +  ADD_rri        1111 0.1 0000 0 .... 0 ... .... ........     @s0_rri_12
> +}
> +{
> +  ADR            1111 0.1 0101 0 1111 0 ... rd:4 ........ \
> +                 &ri imm=%neg12_26_12_0
> +  SUB_rri        1111 0.1 0101 0 .... 0 ... .... ........     @s0_rri_12
> +}
> +
>  # Multiply and multiply accumulate
>
>  @s0_rnadm        .... .... .... rn:4 ra:4 rd:4 .... rm:4      &s_rrrr s=0
> --
> 2.17.1


thanks
-- PMM
