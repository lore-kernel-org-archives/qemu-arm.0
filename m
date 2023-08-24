Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp810328ejc;
        Thu, 24 Aug 2023 09:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQzFqpmVhafm9pkFvkZsjR1eQqZR7OytOJ80nY1jPedFXylVSt79x3o1GWm72IQS9FZDEx
X-Received: by 2002:a05:622a:1a9a:b0:410:a671:95e2 with SMTP id s26-20020a05622a1a9a00b00410a67195e2mr8953485qtc.10.1692893373203;
        Thu, 24 Aug 2023 09:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692893373; cv=none;
        d=google.com; s=arc-20160816;
        b=P2sz37F52tXu4L4ybNYQpt92hrw4vN3PlICwwf1GEuBxQTtntT20jDNVGGmreLF6Om
         HXcOehHBd+TPXD5HTc9Jq3YOkgjQcI+X2uix1reyTvpESHIKk/SZD6FEieB7/U3GILSx
         4ioKmK+UIImCgglDFun+zYzBMB27ccA4RAbtwnJ5INgZAuVCOCdJrr61nm1LRU4YsB9e
         +eVdAe7moD9wk2jE2MHTocttvCt4J+eSbdIKL4bof62H9RO5ht054cjoQRh99FJl1WAd
         /0w6VnU+dtpuhtWTK/a5gUOMW47mkW6Cp/y309GXWZj8WHu87DFbjxCchCZzNqh3T4XT
         2j4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Uej7KS2UcaovjYPC1AF4EolyVdNxa6Am86KL1m8qa44=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=JB8p50M1gWgwpTQLdbAOIu1kHIPGoXL5vhOovcPcTNPurLkraqtWA9Wmj9Uz8ZiAPW
         nGZtA4am+BkJtjmkHD00hkP8xRJU7o08M4uK3yEZtJQ68r3rTHWtJDPddcboYMHLeLfd
         3RRL+eUIq+QjqX2D7w2rruJsPtfaSiF7kgVwsYeHoHbhccqG1nnpR3GQmtObzl8u8t/k
         zpHLXU/kE4txbBypCtmLiYnqdvshBvq1AVtMQ3foWUAhIKJ/eNNal2UEFnDUFA9OE2fw
         zvAQ35oDxw3GLFQDukJ/Lsa+SOMVODFF3HVuBO5dMRMKF2cpwKuDpXEi2Xq4daeE4wGE
         EHoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jOznvTgU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19-20020ac85c93000000b004032cbfb5absi8421927qta.603.2023.08.24.09.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 09:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jOznvTgU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZCte-00011F-QQ; Thu, 24 Aug 2023 12:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCtc-0000yp-46
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 12:09:20 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCta-0002Ya-0u
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 12:09:19 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5256d74dab9so95172a12.1
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692893356; x=1693498156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uej7KS2UcaovjYPC1AF4EolyVdNxa6Am86KL1m8qa44=;
 b=jOznvTgUFKIVXCqEPoCEb80XHqdtfc0DWIT3A3sUOecLMTlVOjNUSYdCUys32B9fYG
 9lM5i0oB1b22ldQBiRyaot9UegSKnqIx/2dCWgMaD6SBND/f/4wcu1IEKZDtz1RU03MR
 YX/9MiyzsE6Vsk9dbWhQz0RdSybaKj/W2JE8mfPI0j7N8wBL2ICSRKyCw6hOCHAGxn6c
 /CFP52D/NQmFnPimfsMoO2t/6F4pnoikpvHprHdes6y9cfa7SH4YFpxo7n765++VR6z2
 ahiLhX5hZkNfEhtt8DOXJEOJIcyQM3p+8r72HDCjuU3PymmZpvhX7sNP4HZ3uLHT+IRJ
 LZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692893356; x=1693498156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uej7KS2UcaovjYPC1AF4EolyVdNxa6Am86KL1m8qa44=;
 b=L3mXWSIDmRh6JHhn+jiaaFvtTL//OH/Pw2dyU9qVm7DusMo+8N8x8wghE4ZezY/zKM
 BV8z7h7DkKt/5dCO6SFKs1urL3fg0imkRUYvfeOtxeq2iV8+cO1nmOlpkllfVVhihPtp
 d42FcbYDcRIEfDgmGHBLntJh7vS5L3Yiic+oN53aGlfXcPYrQq1FZYqie2i+lf17a0ro
 9UVxOntNN5o99j1K+mZpQzZhhRYepxGMXsHnTE1FInDHnUZF4v+wepQig5YApcx+CtWJ
 0WuR/Q9nwyTxWHEh/Im/VkR/cu44gZVbsbE2ZWzBsq5MX7XESY2zLHszeA7NsGz+MmWw
 flSw==
X-Gm-Message-State: AOJu0YyGhINYCcWGIW4nGIF+J1B31vwgTdFQBuNOfMsEYjdq/9E0OP3b
 XObXfYCQQHj3+yCBU9iRLTpkPrFlmiUNJGKSdMaLY6TwzRyKju8V
X-Received: by 2002:a05:6402:b29:b0:523:aef9:3b7b with SMTP id
 bo9-20020a0564020b2900b00523aef93b7bmr13068752edb.4.1692893356266; Thu, 24
 Aug 2023 09:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230811214031.171020-1-richard.henderson@linaro.org>
 <20230811214031.171020-10-richard.henderson@linaro.org>
In-Reply-To: <20230811214031.171020-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Aug 2023 17:09:05 +0100
Message-ID: <CAFEAcA8pRRv=-6JvLtXCtcUVvD-6X_Gs4DSPto7QnCJ4oX-23A@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] target/arm: Suppress FEAT_TRBE (Trace Buffer
 Extension)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hg2aX+ewmXa/

On Fri, 11 Aug 2023 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Like FEAT_TRF (Self-hosted Trace Extension), suppress tracing
> external to the cpu, which is out of scope for QEMU.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 85c02308e4..43c5ac6456 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2088,6 +2088,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          /* FEAT_SPE (Statistical Profiling Extension) */
>          cpu->isar.id_aa64dfr0 =
>              FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMSVER, 0);
> +        /* FEAT_TRBE (Trace Buffer Extension) */
> +        cpu->isar.id_aa64dfr0 =
> +            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEBUFFER, 0);
>          /* FEAT_TRF (Self-hosted Trace Extension) */
>          cpu->isar.id_aa64dfr0 =
>              FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEFILT, 0);
> --
> 2.34.1
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
