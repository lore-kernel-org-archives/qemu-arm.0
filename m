Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BA2C5DF93
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 14:58:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxQhP-0008Sy-Oi; Fri, 21 Aug 2026 10:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxQhO-0008Sp-VK
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 10:58:26 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxQhN-0006cb-CA
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 10:58:26 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6682259cae6so1332958d50.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 07:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787324304; cv=none;
 d=google.com; s=arc-20260327;
 b=reWfUTGY8vejyk0PM239DcU8lfa3YgyAzGFnppd7NoWsQkrie5akcNz30Dnuk60p2O
 fYx4jn3qyqGNrFbHnYvLxjTC+MZ+rUrEXsgqUfgELhjnJHxptWDdLN868U4e5FIDoV2e
 UDy1ZesxWuII/9GYjfS2eB7ZSKwuYlAozGKFEBCSXtR1CFkClzFz8jRpEPe3MXmUOF6a
 MUSb4uBiq76UQwMDv/kB5jK4IGWEBGsf1lTUh5RuepwmUYgbzZa3vQ+rJrM6Kex9BF8l
 5Iu61BYFzXvFeu698sRKRWjliGsn3Ec8Z4xs+yoWhaI+/1Lgg7/KNOkAj1f//QA+Of62
 4B3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Z79hWShm9VccnWd+uC/1NaHgQD4YoYjiNLaCCez5k6M=;
 fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
 b=rc16GHnxI1p1l54PCiTLVV7sABW2qOc8qZzrUO705RTPBcPE1Fqn2n2LlJjaw1CDKL
 o6oByvP9AtAkmM4LU0gLJkMMs81kOhobZdLF0iqeoO9b1LLxsM7AD+NwTLgeIAWllTAs
 u6thnjCzhHa2XfhfiTqZMPOBNlNqGpM43RDwgZzXKvUg2TMOr0mvo1T5/HSHXSX8qVEN
 O39aCKG0u23TAbOML+zHQ/He/TCbPseuwnMS/kaBFzosiv+Nn4KhtF7BBdhFxd69Hzlh
 qdWHToYYeF2hy0S89r1RvToQJ4iSDSkt8tO+SA23lbKWc+s7tphl7btjxWi6RYXKa1k6
 JVAw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787324304; x=1787929104; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Z79hWShm9VccnWd+uC/1NaHgQD4YoYjiNLaCCez5k6M=;
 b=fMR7i4OLZGlXD5MnfKQzu4CmH0K1JJvdMUihGZGk8UzHwF7sKvfplE/yXG9mQJRDtQ
 04eWSBKsyjul8roCMMfeMkKkynZoIp9g6YvKjza/jVENiyDHq8W5SLKm6Y3yHOv5/PpQ
 R+AJIegRQ7wjtF27S5mVDC4pjlvVMAOV7i/KaEAboq69RlATtYfOJaXH6zLO4B+EO4xr
 AnzPmw8Ux9SofCq0w+JW2nQNhkUYFKIV47WfK2jKLi5Y+C9DLb0n4dJ4NR8FeZZTJxQU
 R7+LrSJHg3fytjA3sCcStSV7F/CjnMSJDJP0CfeThuvyIyGz/UFD19s2ifWLxuLR1oms
 8fSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787324304; x=1787929104;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Z79hWShm9VccnWd+uC/1NaHgQD4YoYjiNLaCCez5k6M=;
 b=S5kat7dr5tBkwi50T2J+MXN3cdT89Ca7FMu0c2UkeZPXKB67AQB2RRS+gc25/AU/OC
 TIMlpNHGkX39zSyZzQkmH13VDnX7BBN6pNVO+pwyJ4L445qHvao0ktoQwu5JfvCfY5CZ
 7UUTu/oatDPvt+KlKQUHG+mgoW7a0aNK8+571d8dKJTJug8P7h2zFtEZTV4uO4wRIgMk
 VUE+quiTff5Hw4UPNbuzHh6lLph6/KbEKlh+rVxnAB1P6BrhG5Ie/TrQhw+EuckFFLsu
 IRNPYbzPLaHt+aetcINEES3CQwNPMsKolKjjgN1VLhVQTR89SuUT1y5tgsZTeFhknhJn
 PHgQ==
X-Gm-Message-State: AFuF++nHB8Jt0QSx/Fx70ZisuRJM8RUwCmsfR63xVDN02RfDlJMHk1SO
 7O4w0KL9x2j8eY6B1aruAlmXXfCp/iS12DIlTBQ9jwr5TlWoW8tbD130NcEaCuvnqVZOkai4yie
 FN60FXNOV3qOBqrM80Q477OdoPwDLHWR5firUF172pw==
X-Gm-Gg: AR+sD11CiQrBlRzwJPIsGIp9Fp2XvTXPzAl6IemAeQS4P61hT1LRDoRtY0/r8wOmys2
 /uuCR0SICdH6KrvF43j4lVaugZZ6DAV24IDOVR5V4IbtSB9SyAm8KJCP8ocwFbqZ1hjm1V8p91/
 nqI3jYdZDZVd9BMR9QiaMtMdIN+lBUbwJsP+FHUupy2z+o/xH+A98Cz0VmtEmhuIOcXO85eP7Z8
 dMKuGExsNfL784/4Bfs6MyPtTnFz8vKEl+YO34TRFKTSqIpj1nAeqmzxaj3DqBM9W5EQzt2sVJo
 tIKIpQuprEWEwocHqLibxHBe1spmtwaEawGYCFjF1x4K25G3aqy1mBf8DSgk5tosw9WKCdG34EG
 srh3KfeY8GONAnXcbk+H5ALkVetsf
X-Received: by 2002:a05:690e:4814:b0:667:aa5c:d2d1 with SMTP id
 956f58d0204a3-66ce4bab296mr2101378d50.38.1787324303582; Fri, 21 Aug 2026
 07:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260821132550.168896-1-peter.maydell@linaro.org>
 <20260821132550.168896-3-peter.maydell@linaro.org>
 <0a7ca30b-e623-48dd-8db9-c53c76f9407e@linaro.org>
In-Reply-To: <0a7ca30b-e623-48dd-8db9-c53c76f9407e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Aug 2026 15:58:11 +0100
X-Gm-Features: AcwNN1Uq3s4_dG3mePj7BLzqAanyFDzLKm0umz8IhT3SI8uDS-STqAo38Duse3g
Message-ID: <CAFEAcA_UKRZQFiuJV0bq9BhLCPXbVVsKEmCiO1egdmrRgBe9mg@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/arm: Make IT insn undef when not present
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 21 Aug 2026 at 15:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/21/26 06:25, Peter Maydell wrote:
> > The IT insn is introduced for A-profile starting in v6T2; for
> > M-profile it is present when the Main Extension is implemented (which
> > includes v7M and excludes v6M).  We were missing the feature-check,
> > so fail to UNDEF on earlier cores.
> >
> > Add the missing check.
> >
> > Cc: qemu-stable@nongnu.org
> > Fixes: 9ee6e8bb853bde ("ARMv7 support.")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/tcg/translate.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> > index df98dc2e34d..103e2fe7c73 100644
> > --- a/target/arm/tcg/translate.c
> > +++ b/target/arm/tcg/translate.c
> > @@ -6038,6 +6038,16 @@ static bool trans_IT(DisasContext *s, arg_IT *a)
> >   {
> >       int cond_mask = a->cond_mask;
> >
> > +    /*
> > +     * IT insn introduced in v6T2 for A-profile; it is only present
> > +     * on M-profile if the Main Extension is implemented.
> > +     */
> > +    if (!arm_dc_feature(s, ARM_FEATURE_THUMB2) ||
> > +        (arm_dc_feature(s, ARM_FEATURE_M) &&
> > +         !arm_dc_feature(s, ARM_FEATURE_M_MAIN))) {
> > +        return false;
> > +    }
> In practice this is going to be the same as just thumb2, because v7M has v7 which implies
> thumb2, and all v7M have m_main.

v8M without the main extension exists, though we don't model any
of those CPUs at the moment. That will have ARM_FEATURE_THUMB2
(because FEATURE_V8 implies FEATURE_V7 and FEATURE_V7 implies
FEATURE_THUMB2).

> Is it clearer as
>
>         !(arm_dc_feature(s, ARM_FEATURE_M)
>            ? arm_dc_feature(s, ARM_FEATURE_M_MAIN)
>            : arm_dc_feature(s, ARM_FEATURE_THUMB2))
>
> ?

Yeah, I think so. (I actually wrote it first with nested if()s
roughly like that.)

-- PMM

