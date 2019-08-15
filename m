Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1868402wrs;
        Thu, 15 Aug 2019 03:17:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDWHpCyP6KZfF3IdP28MCDLXGTM/I2gllPGt0fguem81HC3jV9ixgPSP02P++k+q67lmLa
X-Received: by 2002:a37:6392:: with SMTP id x140mr3356099qkb.114.1565864231496;
        Thu, 15 Aug 2019 03:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565864231; cv=none;
        d=google.com; s=arc-20160816;
        b=zc67XyXQdZkyS9dPSFlJ8x33mFQ5i5Yz6/G84LCsrowWSintllY6V+5biO4hODUyWD
         l7jnUTNvkuKzimdSKb3SnMJ4SPzXIEqjZqU1Hwvsha2lkjzPyoDb1S4s2RY02S+gUlWQ
         +XfBtk8zs+0AHbHhEpLSGyOSZEcZSCyULFc4q80AxkLJlz7D0d280soN18gtAFEyX5EP
         iwUXD38Oehx82UelxwZoZhJNPTpMLfiOOi24Kxb3GnD7q+xsfd0QqPkAGd3ErzEI8FLW
         n4g5ara96YbV0ND6k4q80pNX/I4MJ2tbkWuovR2j6OowMzpjnxkSvZKvp+zjKaTS1/B3
         anSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YTBGy8hY8j2dBBvtOvP3BdhLLmRMvjqHIRqhjQwRHow=;
        b=NDh+131QN7BFs3TRyvj4GTHvv9Wu9lkjq2EdGjpJvTecKmNvh2+A7P+U49COJaZbM6
         8vv6wtDFoa6ad69iurMidtRzpK0scjqIJ/D7DVKSSH8QmCbtcgBrSeNIsM87SATiL2X/
         50KyVejHvMOKkrcG5yX3+/QkhNW/3ePU3nEIAe5nuYR6EGU+iQ3iHWM9QpKt1AlEs2MH
         qbebrrw/JHsRX114/GmVGIdur+D5/h3bzPxyglvu6xsivbnnd3uHCf8EBMWTC6CGMygX
         /CbrgARKqmMqY2VrZxBmm2W/2Nu/SVsAk8LHw9JSGgetrpyckjT0DrLoTS5Luh+y1lNm
         sKDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XGtitOTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g33si1264322qta.377.2019.08.15.03.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2019 03:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XGtitOTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyCog-00040b-Qa
	for alex.bennee@linaro.org; Thu, 15 Aug 2019 06:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51247)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyCoW-00040I-Bs
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 06:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyCoV-0004bn-8N
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 06:17:00 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42065)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyCoV-0004al-26
 for qemu-arm@nongnu.org; Thu, 15 Aug 2019 06:16:59 -0400
Received: by mail-ot1-x343.google.com with SMTP id j7so4733016ota.9
 for <qemu-arm@nongnu.org>; Thu, 15 Aug 2019 03:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YTBGy8hY8j2dBBvtOvP3BdhLLmRMvjqHIRqhjQwRHow=;
 b=XGtitOTCY/4NTLjMx54tzmTquH+yFUJgii3uDqYduwZAu4DvVXWUXpdU2HMiMaxLVG
 Qx9eI0N1lnbwZPrAKxRqeIssEym2dCBfeiiIr3EOnVvYMtEzacGkaWQ5eeIplrNsfg4w
 ipk+rMs/QIghqNrrY8oqzcaH/dOnoge14irFVTPREjSfsBEpyRuJ2ijsSXpDrCfIsBPP
 IaSxLmDuIgbNL/TrpwehIWH+QX0zyCogVPpIuZ86CxJlxrkBhRNzzBcbnxBdTKUDC+jp
 EjbggW0n7FuoUNQWZOq5WRHVyYxy/ZhmNqeB7VOVBlSs8UaHnuGvfa3+SZUFyJ5BXGOu
 DthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YTBGy8hY8j2dBBvtOvP3BdhLLmRMvjqHIRqhjQwRHow=;
 b=c2nER7GOaCLxl4VEcUT6g2YqVE1QyKrr4oE9/trbRytkEveifZlOE6Hgl0P8vvzuuX
 MCDn/SHdGZ8uXcb18LfXlmB4LGsu8umKENvj291FBbJff1rcpLsQ54nR5l0iWnrftMBJ
 vJHhyLtWJAiYfdkPYsBFjm5RRusiIIKPWSBD9NjQ4p5oxy2p1TmFx0ARkFmofzgoNZ7k
 6sHPEwZUf5btQRCECQStunJZxmGJyoFwPEjPFb7I9Df7KG5sEAMBu37dtu1NwnDdSfMu
 ME1h3Jv/YwqPxnKKhIK3SbIBvUBLEZ6pn68mpvzgRMBKaMnR7L7ROfpILWA8mzV9tmA2
 uEGw==
X-Gm-Message-State: APjAAAU03gbP307lyV1wvC1fbRhUVfedNd8S2OckIMvCvwTLD2Aq9yP3
 sz/xElRSFpAg55JdavXQLveKnbrLiIZymg/7JyuVvA==
X-Received: by 2002:a05:6830:2103:: with SMTP id
 i3mr3006080otc.135.1565864218040; 
 Thu, 15 Aug 2019 03:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190808202616.13782-1-richard.henderson@linaro.org>
 <20190808202616.13782-8-richard.henderson@linaro.org>
In-Reply-To: <20190808202616.13782-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Aug 2019 11:16:46 +0100
Message-ID: <CAFEAcA8exvd3khkNhw2JnJWHdkFH5O=ut7LvN9Tz5H0ZTg95Sw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 7/7] target/arm: Use tcg_gen_extrh_i64_i32 to
 extract the high word
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
X-TUID: z0NfBEfT5SAs

On Thu, 8 Aug 2019 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Separate shift + extract low will result in one extra insn
> for hosts like RISC-V, MIPS, and Sparc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 77154be743..9e103e4fad 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1761,8 +1761,7 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
>              if (insn & ARM_CP_RW_BIT) {                         /* TMRRC */
>                  iwmmxt_load_reg(cpu_V0, wrd);
>                  tcg_gen_extrl_i64_i32(cpu_R[rdlo], cpu_V0);
> -                tcg_gen_shri_i64(cpu_V0, cpu_V0, 32);
> -                tcg_gen_extrl_i64_i32(cpu_R[rdhi], cpu_V0);
> +                tcg_gen_extrh_i64_i32(cpu_R[rdhi], cpu_V0);
>              } else {                                    /* TMCRR */
>                  tcg_gen_concat_i32_i64(cpu_V0, cpu_R[rdlo], cpu_R[rdhi]);
>                  iwmmxt_store_reg(cpu_V0, wrd);

This patch is fine, but I noticed while reviewing it that tcg/README
labels both the extrl_i64_i32 and extrh_i64_i32 operations as
"for 64-bit hosts only". Presumably that's a documentation error,
since we're not guarding the existing uses of the extrl_i64_i32
here with any kind of ifdeffery to restrict them to 64-bit hosts ?

thanks
-- PMM
