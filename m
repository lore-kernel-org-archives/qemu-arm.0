Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1876954wrp;
        Thu, 12 Sep 2019 02:02:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4a8hQ6hNtjiCWx3BpEwCkSVzTfM/2HkjaodTZOaqtXUV3/ueIacv0Diub7Q1ZpDV9nshf
X-Received: by 2002:ae9:ea0c:: with SMTP id f12mr5841429qkg.498.1568278953918;
        Thu, 12 Sep 2019 02:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568278953; cv=none;
        d=google.com; s=arc-20160816;
        b=BHT4hjJLIRGK2jZIrpGFlMS0ZmnenkuyYt1rf5/mmzOyNrbFZmZZAd3tRaGGjdi5kp
         w0PLGdwTSlCptmf+80aVTRY5q00gm09HPsVnUvOaRzxbaxx3Wo9vYgZ0dy6EfsF8Dia8
         T8r2y/kd/Imy9FH38MCssoBdYjN2+I2nL1MgvDQrwlG0FGcv8tK75mniu61c/Rc18o4/
         bi1tqzjhNF/ePHjgiCR9q7dxeAWYAFVRG7ZLC+T10AIeIToLHlB/RzNR/k4GfwzFbARI
         ZBb8qw/Sz4QdDM9BUCwP7UilzV2TT5D+dw7hQu7mDpB237w9A4ligUgUSs6Su7FueL0Q
         tvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NPpL4OpK/yJcKOIDDXKrVIVtNfYCvKqi68M1Uf5NUu4=;
        b=0TJxNpMwVFfgvlT8Xe1FZTguLWSeiNS15F9uSuW/tSEKVBBgKz7WyW4SZCQCLKrtpz
         18a+4n6s/B3j1w/YGxKGcLib78+wXj/W0xaE+iORpJbXAQ4WkIKAr7/OfPin0VNwbBKH
         1mlNDpektml64hijSsY6XK65/Xc6A5QEzxpocgtbV7RL+B1VkQ7M95Ery/KjgRBbsJuV
         t98t6W1JQ+6gnyzVr5IXnVLorn5t39G9GWrA3qr03pMavNOK05c4YUUZ7q/dtNRj7FM7
         7VfNgY00kRNoFhCBdTIljlGz6JRT5xOWrRdjQ46FFCF2+4QIZnO+KH43xNsuFAIe6oF6
         RmbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="NmD/pBD/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si14043858qkk.292.2019.09.12.02.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 02:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="NmD/pBD/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8Kzn-0003aL-FX
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 05:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1i8Kwx-0001ib-03
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 04:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1i8Kws-0004V3-2E
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 04:59:34 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43529)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1i8Kwr-0004Ub-UN; Thu, 12 Sep 2019 04:59:30 -0400
Received: by mail-io1-xd44.google.com with SMTP id r8so27756081iol.10;
 Thu, 12 Sep 2019 01:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NPpL4OpK/yJcKOIDDXKrVIVtNfYCvKqi68M1Uf5NUu4=;
 b=NmD/pBD/hIyENFX+Jf1Nrh74EHB9TvGrwCAYA4vjiDdS0OU1l8+9P9qSIigO8F2J9C
 J3WJMnsgVQgyCqX9EazqWk7qoUtsDSYZl9Irq6pCbVsn4yUICv+SzN478HbsdgCJQFO7
 2WMFmo9KqsDfZrxuc1+Up9eQ5ofyebWgIBa6gDrfoxOvGwPvV9mXEUZ1bedXf3b+zP8g
 vtD4qewWUrZ5PjtHLA8DtzV/uuy3G8v3Qj68Vd2MSq8YqDLWgLHbUfJyh8oVZp7k00KZ
 mC8Dn/gFHvNeLCHJcRKZYX+BVe3wu+89/Fp1zEgK3T4pusw3zUgvMaPgt8QNZe+JEMj3
 b39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPpL4OpK/yJcKOIDDXKrVIVtNfYCvKqi68M1Uf5NUu4=;
 b=NZKUbIDBNrreb+t2loy8NY9oQAmKw7RwktBmXh2+4O7yWZTSEb+hd9e+kjpz3B88bO
 a3To9Fxq7Vzd/IT0RVYjDXL3+QQAvSe5cxRtecLmrWsS6rU9oTzZs6ROmIiT9FmlEDAd
 IrG8k396giWsMRMZIQIC8+Egc9lHamJ2DkoYmwgRNMTFzMs+ewnsDyTae4ArAZaZ3aC+
 F/kgYKo9lEqa7W0uMVkK2uZezXT4691ahbF265MiuNJvsThCg3LvMerv8/lgKFzXpFIE
 O8Y0yZJxTsunS48btWVu/RQvqQ3Hvovrhon+2wU3h6vwENN3q1zEqm90Hg3CRpRlW5a+
 9rlw==
X-Gm-Message-State: APjAAAVaYu91ILfehOc95l0J4HGHVYafidzKePMfp8wKK9qvLTr/UfR+
 zjsP4g40ZTkF29aOkwUVAgz6bCNzeHNELkuJ9YEMlYvUjFU=
X-Received: by 2002:a6b:8f15:: with SMTP id r21mr3266284iod.259.1568278768300; 
 Thu, 12 Sep 2019 01:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190904193059.26202-1-richard.henderson@linaro.org>
 <20190904193059.26202-11-richard.henderson@linaro.org>
In-Reply-To: <20190904193059.26202-11-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 12 Sep 2019 10:59:26 +0200
Message-ID: <CABoDooPfrrmAo5UdVmysZYihHDJW2Np74rQ5e112SU6of3LowA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-devel] [PATCH v4 10/69] target/arm: Simplify op_smlaxxx
 for SMLAL*
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O13yKLYY3mNk

Hi Richard,

On Wed, Sep 4, 2019 at 9:39 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since all of the inputs and outputs are i32, dispense with
> the intermediate promotion to i64 and use tcg_gen_add2_i32.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 5306e93470..37aa873e25 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8177,8 +8177,7 @@ DO_QADDSUB(QDSUB, false, true)
>  static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
>                         int add_long, bool nt, bool mt)
>  {
> -    TCGv_i32 t0, t1;
> -    TCGv_i64 t64;
> +    TCGv_i32 t0, t1, tl, th;
>
>      if (s->thumb
>          ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
> @@ -8202,12 +8201,14 @@ static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
>          store_reg(s, a->rd, t0);
>          break;
>      case 2:
> -        t64 = tcg_temp_new_i64();
> -        tcg_gen_ext_i32_i64(t64, t0);
> +        tl = load_reg(s, a->ra);
> +        th = load_reg(s, a->rd);
> +        t1 = tcg_const_i32(0);

The product is sign-extended before the addition so t1 is not always 0.

Thanks,

Laurent

> +        tcg_gen_add2_i32(tl, th, tl, th, t0, t1);
>          tcg_temp_free_i32(t0);
> -        gen_addq(s, t64, a->ra, a->rd);
> -        gen_storeq_reg(s, a->ra, a->rd, t64);
> -        tcg_temp_free_i64(t64);
> +        tcg_temp_free_i32(t1);
> +        store_reg(s, a->ra, tl);
> +        store_reg(s, a->rd, th);
>          break;
>      default:
>          g_assert_not_reached();
> --
> 2.17.1
>
>
