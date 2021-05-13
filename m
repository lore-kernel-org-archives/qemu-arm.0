Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp458711lfg;
        Thu, 13 May 2021 05:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxteYtcdAGiahNV//fYlWVSguRiKUaLpVvlFoCuttSeBWVeaSjRmYwbAS/mqx7t0Y5BlyEM
X-Received: by 2002:a4a:6202:: with SMTP id x2mr31886817ooc.36.1620909815842;
        Thu, 13 May 2021 05:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620909815; cv=none;
        d=google.com; s=arc-20160816;
        b=QVDhzgc0RqQhLDE/PWyIPG97UYvBu1CSW2vM5370oUoR35rBFE+NFu8SlpkKPUVS4v
         55/PyQF8jg9SBH9CX7vrgtnkw4O9crlVFMoe21y1h6dd5kmgXIb6akPQ1CdZQR7ZYr8g
         /Rc7C9XUsR0CZcKvt5OI3Q945ujQxNL7dMNUqj1Fq5pXZi9AW/7ohr/iYPKcZbJR4x2f
         CqjDo7Q8ir2k4r7nU1PDbyu1LIXFkMtYqa8bJsKPbyPRk6QCL2NDNAC6UHQyIjtuwDvB
         T0gcqr2H+OypFExP0KPHWbuPmqBC9ENVcJpmFRGu2ctgBjzohxYGgAbvUgac2w0/hpFr
         SDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EomQNbVtlc8M5NkNZlu+i3CqWnYgcN9RPDZo+xVNp8g=;
        b=fgaHKhnxPQ99rdvZgvD2K5VZYf6zqbYne7PTMZe1AAnjy9GtIapEh54cGUM51ouEDB
         vCd6k9e7+TpecOfAK/Lh+1gtxqbEeoq6DNiy3lXDCQAWVBdHzK7HETTjyRI6ugaNZFo9
         yyD5DHbnsZC91ets/94YWmB5bjcCxsr1ZC1DU+I4aYgNWEW8o040yV8pyvKSjCd5sxuQ
         eDCU81odgWcytINCSU6XPKsOn+5KEppWpLd1V4sS8bXKrlj6fujemf991LBvwIMa/iP6
         Z8ptkMp8rECE2saKr4nl8Uw0wzgqUMaJWAk4wO/gVXFIf8aiNYxv+AKZyKyVRdiMwHKa
         whWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R4T8N4sZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f67si3368474otf.15.2021.05.13.05.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 05:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R4T8N4sZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhAgh-00014D-13
	for alex.bennee@linaro.org; Thu, 13 May 2021 08:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAfv-00012X-Im
 for qemu-arm@nongnu.org; Thu, 13 May 2021 08:42:49 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAfn-0005Hm-2v
 for qemu-arm@nongnu.org; Thu, 13 May 2021 08:42:47 -0400
Received: by mail-ed1-x52c.google.com with SMTP id b17so30827004ede.0
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EomQNbVtlc8M5NkNZlu+i3CqWnYgcN9RPDZo+xVNp8g=;
 b=R4T8N4sZhjAZUWeXNriqSW0cyc4cz7Q5rO38UZ5bpuSHJTQs2EKte6MMvX0bziqHnL
 zuM+hOl4Vc5RYO3Wzu/D66Xp/4ZbFJ9J+2tdY/VBPJKC1wVqpd/AsgUsYEoaVy1PxQyj
 IVlZmez90ZvxubxpeumGGLoEoruw1asnBeO+dSBb8vP1OTEqrtgyczFgY0OXlzIQSC7Z
 xA5bpUdSQZpBQEB33BpHDXbObsB+HTT56hBgplR1LmWWFJ0/IkfJiPROCf6ZbpLHYQuP
 FGGa0Dcqo8/iz9hNI88F3ilATcebBe158oWT4lCDF6ZSfbj6tK+nOMqBf6RU+tP9oBmz
 bHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EomQNbVtlc8M5NkNZlu+i3CqWnYgcN9RPDZo+xVNp8g=;
 b=ssaaE7FbKGI4XtvjOX27J95KqB66chpvK9Rw5pjwobyu5BxszzwDMESem4crZdFJpD
 O0DpP9u1FzTZ5Un9BuNbqTK7mHzbmooTQSqEPz6jefKpYwhJxRa8ZOvjJxgC9q1NEjYN
 5ACnMM1oTIu7UOA9VY3EmrwyoK33ppte/6X+A7CY+M2RUdL4QYjpJbDbBvHlq2tNVgcq
 SbqRA/hVTL8i/zTdd767Q4xKDfeKfQtKt1fewnTf2eTFbhLzHGa4npDe1WaoSX9Y1mIZ
 6miUX37TVNi9rmwQtJ0pqa8t90hBCB2ruCkGoNoPSojVXmfBETos6LM+POFqqIHQVoPG
 lNHw==
X-Gm-Message-State: AOAM531iXx2DTXzKw6RT/+0nIyBOARYvh7qW9cWs1hC9cEiNw2RuVo9I
 j537kqCK74gxCy1o8tBIqyx8O3bkZyWiA7iiZFmfFQ==
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr49600260edx.52.1620909757395; 
 Thu, 13 May 2021 05:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-56-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:42:26 +0100
Message-ID: <CAFEAcA8SrNTpUCzJtx0ejEjFcURk43BJ+8Sa3XvqNSAuQCPjLw@mail.gmail.com>
Subject: Re: [PATCH v6 55/82] target/arm: Implement SVE2 saturating
 multiply-add (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: 3szZ495vh3NY

On Fri, 30 Apr 2021 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  9 +++++++++
>  target/arm/sve.decode      | 18 ++++++++++++++++++
>  target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 32 ++++++++++++++++++++++++--------
>  4 files changed, 81 insertions(+), 8 deletions(-)
>
> +#define DO_ZZXW(NAME, TYPEW, TYPEN, HW, HN, OP) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
> +{                                                                         \
> +    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
> +    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
> +    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
> +    for (i = 0; i < oprsz; i += 16) {                                     \
> +        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \

Doesn't this need an H macro ?

> +        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
> +            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
> +            TYPEW aa = *(TYPEW *)(va + HW(i + j));                        \
> +            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm, aa);                  \
> +        }                                                                 \
> +    }                                                                     \
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
