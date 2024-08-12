Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp771757njh;
        Mon, 12 Aug 2024 06:15:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqxQOjY8I2S2pYHx7JBUGRBYJswyjSiv7Kbt4WT0SHxgpJhFxbfN17v7QYkeJ7HoS6lRyKptyveD267j83IqIn6sn8cuHx
X-Google-Smtp-Source: AGHT+IHoe/r5uw/4z8TPFIp1xuTUbwZfR0knfwoK8iC/DSV/PI2rsnAGbBu7Y/7H9pH0WZr7kMlx
X-Received: by 2002:a05:620a:4010:b0:7a3:784e:2cce with SMTP id af79cd13be357-7a4e152ca0amr20558285a.18.1723468504100;
        Mon, 12 Aug 2024 06:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723468504; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4S1Uilwubkk/KaTkTkUGdY0vfoU3PNMDZrMb8j1C3Zv7YyIQmSe7VxbqQq3C57v07
         5ciw2Bs7dWR5XcDH7Jf2jsCZM0Zde8AN5hnMD832DbPYrFpE0OvMtRaL4LbMgdWXw+XV
         rk3DK6CX81q/ulOlSS084TQ+hOZtodxzC1UHSRnlznwUgISOnlhbW4SMcmJLhSOuXVj2
         KT2L58EEnXV2IwMF6NrbeATZWXQzB4lXwFOezaCm6Q9z9fFAxOnZ0ucuDHiZOg+GfoUf
         bcCGvinECyNfV5VVVqMT4bQn3dpgKMOpn5LAyrm1o4E3slUvGig45EgH5HkLPDECKnQa
         gIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=olYOILAbtYmNDQlZQXp7mZ5s5POikiskfOYQsb/ZZz0=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=lgH0JaXABu4mgQg7i7hc+ZYF9phNy7wBivf+B7Saa3bxPsL7SfOjtg5D9JPjQnC/lO
         hTnPywGF8el0CyH5zwaSe9gndXZ0iqtR2simEWjkaRmc4TeAKKgOfjwkthW4eO7KoKXk
         QLi340jGRMw9tsJ1VRJesZWzpmsUfJ6P2QZkWdciENQE/fnLtriDfVTCc2OjuTUAgUgx
         iiZ+PGPi24Y1q5GrPG+cg2eneA9lzmfxYBqTF67G8KYZ+XecljvY0a1beCFlPdotKS0K
         98qywgj4OYFgYgncaEW1akSXq3fxBd/SU86dZSoiOLxHbDQeCvsbtSsXbpSElC8ggndj
         /DKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIFo6zKo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4c7e063a5si594675785a.423.2024.08.12.06.15.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2024 06:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIFo6zKo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sdUsR-0004xc-Pv; Mon, 12 Aug 2024 09:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdUsP-0004qv-UF
 for qemu-devel@nongnu.org; Mon, 12 Aug 2024 09:14:21 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdUsN-0005GJ-9B
 for qemu-devel@nongnu.org; Mon, 12 Aug 2024 09:14:20 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f025ab3a7so374754e87.2
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2024 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723468456; x=1724073256; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=olYOILAbtYmNDQlZQXp7mZ5s5POikiskfOYQsb/ZZz0=;
 b=XIFo6zKoLcVcwwT/S0EzkFrvNwZybQ/PgbC3K349xRols1XtFElWzRGx467bQ48nl0
 AVWUncMfPH7cIZxPzL4PBx9MQpoQwTbr9HQl0wK5kJuRKKQBsnTc3qSjTIsHiEVc13Wk
 sAbctHa7CZzActaolMr/bUPoJMd56q9jrLrxktmvQDnbbYauVx48SBELvibzAn5wltaO
 qV/6EjF3c3b+H/ypjUhfsXqRdWVduZM6wR1sdNuQTYf6haWOhzidesJxWv3sQhILn4vP
 7tIslmJShUxWGryZnDb/NbpxFEcYE0SkqIJy6F7if1EoxX7raKjJrDD+YboMNObJbYdj
 F0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723468456; x=1724073256;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=olYOILAbtYmNDQlZQXp7mZ5s5POikiskfOYQsb/ZZz0=;
 b=QEYL3AA89MURGCmDJqwyYeOgAuQn+cyz9Jcj0+I2S5+9PDXan+ZZPoGijz78cJejMM
 UXJHgzd4MHu0MzFESA+DSFVprXc2m9aEnMGrpcoQJ33sDPunLEp13aqH/tMQvkaQEpV9
 AYDd5XQMt9kJrPFDVssY0wriPeCjn+IW4ILsG9ZBcX8reNzGe4vEdNx/IU3ZxnhRFHwp
 N43cnwxhOmN2iyZVD+rCNCbUGPHJak7SCp95SioiErL/lQa8wqwQRIFT4kHIgdRLcXGU
 qEl0d7dF5xVxqQ0il+FOEGr3EzEm/n4jsqXZB7EZq39nQIhVTBQjmEnXhkWTMz4M5IWI
 cO3w==
X-Gm-Message-State: AOJu0YzIZVXzspwHi2s7fILbiTjRFzzevFOc94Z2cLao6jaHAnF3wDPv
 BoA8BjlZuhPD6j4GVXMUTRisYBFTvW2ZWXw4YAleVhzaDo+AgpEeAcT9mmMxrkWau85bj9MYV3h
 9wHq7V95Ofuo83kyFLCEGDrY8ci5UTZj01WkFAA==
X-Received: by 2002:a05:6512:b94:b0:52e:fd53:a25e with SMTP id
 2adb3069b0e04-5321364b515mr62361e87.2.1723468456230; Mon, 12 Aug 2024
 06:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240717060903.205098-1-richard.henderson@linaro.org>
 <20240717060903.205098-13-richard.henderson@linaro.org>
In-Reply-To: <20240717060903.205098-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2024 14:14:04 +0100
Message-ID: <CAFEAcA_yikLcv2gSc6FVbue+HSFuk4w6oUg8H37jCaRJhtPD=w@mail.gmail.com>
Subject: Re: [PATCH 12/17] target/arm: Convert handle_vec_simd_shri to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lxHw1lpDGOMU

On Wed, 17 Jul 2024 at 07:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes SSHR, USHR, SSRA, USRA, SRSHR, URSHR, SRSRA, URSRA, SRI.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 109 +++++++++++++++------------------
>  target/arm/tcg/a64.decode      |  27 +++++++-
>  2 files changed, 74 insertions(+), 62 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index d0a3450d75..1e482477c5 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -68,6 +68,22 @@ static int scale_by_log2_tag_granule(DisasContext *s, int x)
>      return x << LOG2_TAG_GRANULE;
>  }
>
> +/*
> + * For Advanced SIMD shift by immediate, extract esz from immh.
> + * The result must be validated by the translator: MO_8 <= x <= MO_64.
> + */
> +static int esz_immh(DisasContext *s, int x)
> +{
> +    return 32 - clz32(x) - 1;
> +}
> +
> +/* For Advanced SIMD shift by immediate, right shift count. */
> +static int rcount_immhb(DisasContext *s, int x)
> +{
> +    int size = esz_immh(s, x >> 3);
> +    return (16 << size) - x;

We need to avoid shift-by-negative-value if esz_immh()
returns < 0 here, right? (like commit 76916dfa8 did
for tszimm_esz())

-- PMM
