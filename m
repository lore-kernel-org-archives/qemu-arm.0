Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3932816ejc;
        Tue, 17 Oct 2023 06:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJj8ts9o6RzPbZF+hX1tAAjCBSBFYZPCnJOTvwlXQrIpzThfo2OqkzKoAEII06NrVZDf5r
X-Received: by 2002:a0c:fbc4:0:b0:65a:f7b2:2057 with SMTP id n4-20020a0cfbc4000000b0065af7b22057mr2319639qvp.24.1697550482670;
        Tue, 17 Oct 2023 06:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697550482; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1uzeOg2HNYHaJODh2KIpFfJhNEQ987YjJ7v1NhuhbB97NqZzlObhhcvhxeZSMmfVA
         +Xg9vLKlPW5y+hdYADBUNMGxjs+9OYVzdqzCGQM7hvaFZWIcJ3cqB8kdnU42iScOvk3u
         dL8wmR8hjsJHA7SRNRpkN4qy6HOHgN/4izMbR7NMuCzo57DcAO8MyxCCejfgL2DnbDEF
         AYLfv/AdshQZ2O2xnY1WkNQQni+lM+0t/5wWwgWvkj94u9CA2h3Nhzn/j1LAUMvq0/r6
         LdAgYb+XS+bVsf43py3u7xuP/O6RH+P9bqSVN2EJcvDLvZ2GQLqavdWSqX2PdymcLo7V
         Jicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kT6tbBlWVaFEs6BExuSkBQhN71HDEFU/UCl0nf/kFuw=;
        fh=Ih5WSXUNOM7tdVEin/QM8IzWzshQakt2hPWKv7EUIh8=;
        b=OqWLmXl3VH9KeRpikC2ktpnvlx3th7fVTtVZvmxQrGGnLpBUHqj0NmJPKucIkXrG+n
         jk7DxolVNjTFWuVm0usQZAseYHfMeJ0nLgRiirr4MFm6RNRtxZjEWYp7UBNFm1OKxI8i
         wRqjIhatQXkaXPDQNoil3pAqqg9zLB8mvoP2pTeg2x4KPp/XsaKD1piioBWmZD/NFcH8
         0ECt+0qwwYh8xKW4RK1JpUtJMSv+9uRqGE+6tyqp+W7MmVG9kaak0nz7yfoT1izkmicD
         pUaS2tyQ2EPzS/0WxN2K8ompsGSWWInCUvV6oeL8zPxcu0UxXDfxgNe0ZbkPyQfircny
         vJBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GSDWUIET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cp13-20020ad44aed000000b00655dd38f662si992855qvb.15.2023.10.17.06.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 06:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GSDWUIET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qskQ9-0005mL-4p; Tue, 17 Oct 2023 09:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qskQ7-0005lz-KO
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:47:39 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qskQ5-0005Fb-SP
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:47:39 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso8823376a12.1
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697550456; x=1698155256; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kT6tbBlWVaFEs6BExuSkBQhN71HDEFU/UCl0nf/kFuw=;
 b=GSDWUIETNJEIlXIn0G3PDf94BsVyo8S50k2cIGLRbnM/ixmQoji3pt2O9q8uAwl5j4
 7yNXAz6e3/0eXgQCrD3Da9a+As/mznAc30MlGVrH4ar90ut/lFyU8gHZyiDy/KWFNgMG
 fmz2KXR7/am9A2UUPPQMoIBlnpU+j0YNcui8Bv5lIeHA/iNioFGdwAgQvsD5lx9VFUrR
 wipo6QfZzoJljUtj2Nz1Dijvzo2v6DknYXfH5Eyt4q9pOOkJy4S3BwFihmUWK8Lc5W5q
 JjE+ehiGXpJGXta7+phuzQsL4efWjy+PVkuNPBJIETA3nIM5gTgmM0sUv+wMLBONZx9K
 qy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697550456; x=1698155256;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kT6tbBlWVaFEs6BExuSkBQhN71HDEFU/UCl0nf/kFuw=;
 b=u/9+YF76NJcHdw/Y6fJA6deiOf6nFVXB0iNctNa447GQTfBUiSGMPH4vfAQEpVBLoE
 lYRYCwyo0b+WVQ8gX0z3F76Oitd1AzFdb+BKE8LVloAHV3i4kj0e8d88/TNU/fa+7yKS
 g/N3xAMNx3fMiBaQnhGAAovLOHQ5zF9C9cMg4v10gJ2v6/l1bl3AbFzEaT5UuGw0/rV+
 L1Gk2NellK6jzeEfHKQyyeZ5gocVy039tzONgQUHrTAiWmp99dU1u1noAqi4Vb22X6ys
 g7SWitNuEHKmrYm2o4wXqu127VXSiffqqIuEQD+osPxhUPta7NzrHGlChF7EjV3hsXKJ
 Q7ow==
X-Gm-Message-State: AOJu0Ywnb1psXcgWoaJzY+MouGcQR8Ns5VMW48uKFK82UlkuZJ+oDD52
 rvOukmWwTEWMd9S6cSvoOHqYWfXyWGBFNWLgk+R8Vg==
X-Received: by 2002:a05:6402:35c5:b0:53e:b8e2:1d58 with SMTP id
 z5-20020a05640235c500b0053eb8e21d58mr2055604edc.13.1697550456212; Tue, 17 Oct
 2023 06:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231004142746.350225-1-tong.ho@amd.com>
 <20231004142746.350225-4-tong.ho@amd.com>
In-Reply-To: <20231004142746.350225-4-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 14:47:25 +0100
Message-ID: <CAFEAcA-s61X-YAc6Fx27HWAdoGEWt3C9dRa-ncNUaMb5RPwxYw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] tests/qtest: Introduce tests for AMD/Xilinx Versal
 TRNG device
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.com, frasse.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 765unamT17xf

On Wed, 4 Oct 2023 at 15:27, Tong Ho <tong.ho@amd.com> wrote:
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---
>  tests/qtest/meson.build             |   2 +-
>  tests/qtest/xlnx-versal-trng-test.c | 490 ++++++++++++++++++++++++++++
>  2 files changed, 491 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/xlnx-versal-trng-test.c
>



> +static void trng_test_autogen(void)
> +{
> +    const size_t cnt = 512 / 32;
> +    uint32_t rng[cnt], prng[cnt];
> +    size_t n;
> +
> +    trng_reset();
> +
> +    /* PRNG run #1 */
> +    trng_reseed(prng_seed);
> +    trng_generate(true);
> +
> +    n = trng_collect(prng, cnt);
> +    if (n != cnt) {
> +        FAILED("PRNG_1 Auto-gen test failed: expected = %u, got = %u",
> +               (unsigned)cnt, (unsigned)n);
> +    }
> +
> +    /* TRNG, should not match PRNG */
> +    trng_reseed(NULL);
> +    trng_generate(true);
> +
> +    n = trng_collect(rng, cnt);
> +    if (n != cnt) {
> +        FAILED("TRNG Auto-gen test failed: expected = %u, got = %u",
> +               (unsigned)cnt, (unsigned)n);
> +    }
> +
> +    if (!memcmp(rng, prng, sizeof(rng))) {
> +        FAILED("TRNG test failed: matching PRNG");
> +    }

Why can't the TRNG output ever match the PRNG output ?
It's random numbers, so you might get (un)lucky.
This sort of check results in flaky CI, because very very
occasionally the RNG will give you output that results in
a test failure.

> +
> +    /* PRNG #2: should matches run #1 */
> +    trng_reseed(prng_seed);
> +    trng_generate(true);
> +
> +    n = trng_collect(rng, cnt);
> +    if (n != cnt) {
> +        FAILED("PRNG_2 Auto-gen test failed: expected = %u, got = %u",
> +               (unsigned)cnt, (unsigned)n);
> +    }
> +
> +    if (memcmp(rng, prng, sizeof(rng))) {
> +        FAILED("PRNG_2 Auto-gen test failed: does not match PRNG_1");
> +    }
> +}
> +

thanks
-- PMM
