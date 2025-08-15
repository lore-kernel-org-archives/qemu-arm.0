Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6239CA0EE9
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umu9D-0005SR-Ic; Fri, 15 Aug 2025 09:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umu92-0005RP-MX
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:06:59 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umu8z-0002dm-VS
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:06:56 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e931cad1fd8so2168581276.1
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755263194; x=1755867994; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rgCCaWlzyw5EHfOiarNNwHzvnmh8nZfVeEr6OqGB/uE=;
 b=vFmmRpmdi+gVMGNRwfeUA0UoRfbIdmR5PaG+pJN6osqeXed+74W6ouNGG5s9TEcdOg
 HhCvfYaN8NReDxlvRBoFRw1HVAmOHxOBK1pML7FRfsZit/NvqqhHwG0sJ54m6FJle6Rc
 1R9dQTzN4uLBwPp5bTrTbsXKiB8TM8sXnPL1Gjh6jZClZRyWtt2GtB7XhmtFQ183URw6
 nGB0qdP9FRv6jgcj6GN/jLXHs8vVScRzDYDYZi3cqwocuPWLBSFP8oFk3phOKygzdzLR
 7k/qGEaFi2/3f2MI8BwDmOHYulXwYV54GDQvWNUH8yWk+i2u4UyGsIn5EtzWc/aJV/dH
 Ac3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755263194; x=1755867994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rgCCaWlzyw5EHfOiarNNwHzvnmh8nZfVeEr6OqGB/uE=;
 b=GHB4j5QTXE45DqhRbaS0jSRM/lMZ4XEu7WMXN1hTWxzsZBP00uFZUVc8XHHwxspZkw
 IQ7yn3IwqE8JATy0NGT9TiCdPbyIhbg1ixoAAbGnGRtalFtOWw1DWyWmg7vfc9/7q5q9
 4C4a9xH5iqXHEFpy9eavQytDEYIclq8qqatS/o9hqsQUTMTJvccTWjM+cYr7JKQW0syU
 uf5zbdw1ekt73uE2eUDZrzgSxxz7+KHRKRJrBDbFgRKE/IBPoUZhB4XZI3al0+UWjjSs
 iF+HqpzNbapdM/dytEwxk6sUkidIkamgNmpvNLjdylOUGVxR1BK/+1RBGuBlGeqBuClQ
 V2LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMFZi/BMsJcflwN5l+FTdQJZrB+qdw5EoP41LPSrUw8k1Rc0/u6QShlt+yMKbV1op7yJn0RtlwPg==@nongnu.org
X-Gm-Message-State: AOJu0YwNvZhmbRURicAMrJ9iw23DDi5IkFbiI/rrmkaP6jc6XwUCCfYK
 zYYYQIb2yp1X3rgEINnW5RKZWSqdFNGQmDeDsBqhGeFtiZgont5FpKW9P+ZuugXpP7LniQreI5y
 uhxKfetT9cUUJSdH099A1V5z+xddnc1OaBV9qBX63no9lrqCrLyEc
X-Gm-Gg: ASbGncs35nZuBf5va8m0M2Lk5EktrDgh9gjUPQ0tZUkL180l11ro9UTGciTal71Mvsx
 Kouxk4lDbmQsns5NyhXIGk/8teTvf3I+Ye8HjqUBiLN7fg0++XSlqwCMdzvWH8S6wqp1g0ftKxi
 yzQXEmzZnQ4rA6/Idl//ceXK0yIrBZHS96XaOfqtWqEngqv3JzsKZkNgtIR07PqDJKSdxibwv09
 uXdCQMh
X-Google-Smtp-Source: AGHT+IGoRzK7obsM9c7HBopsK6qTkdGBc962ZjiQcBxtbpmWeZPTxUEFQhB7ZZGQo7ZUWB7+p+VZ3TK5gJWUeIlaTL8=
X-Received: by 2002:a05:6902:721:b0:e90:6f18:e7e2 with SMTP id
 3f1490d57ef6-e933211155bmr2903423276.0.1755263193624; Fri, 15 Aug 2025
 06:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250803014019.416797-1-richard.henderson@linaro.org>
 <20250803014019.416797-2-richard.henderson@linaro.org>
In-Reply-To: <20250803014019.416797-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 14:06:22 +0100
X-Gm-Features: Ac12FXwgSUnYTtJvBoxSrFAiz9SLceIxk8ZHE9-HcfUTSTkeG_fKtuP5gIpJdLA
Message-ID: <CAFEAcA8n+hEbVnH7kx+TK9Pxf3TKKs_4agKcUHBY8CSVgH+-aw@mail.gmail.com>
Subject: Re: [PATCH 01/11] target/arm: Add feature predicate for FEAT_CSSC
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 3 Aug 2025 at 02:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 5876162428..f12c5c8be7 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -604,6 +604,11 @@ static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
>      return FIELD_EX64_IDREG(id, ID_AA64ISAR2, RPRES);
>  }
>
> +static inline bool isar_feature_aa64_cssc(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, CSSC) != 0;
> +}
> +
>  static inline bool isar_feature_aa64_lut(const ARMISARegisters *id)
>  {
>      return FIELD_EX64_IDREG(id, ID_AA64ISAR2, LUT);
> --
> 2.43.0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

