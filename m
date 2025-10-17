Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8001CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:06:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9k9Q-0001BY-Ra; Fri, 17 Oct 2025 09:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9k9M-0001AP-AZ
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:05:40 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9k98-0003j5-0L
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:05:35 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-63bc1aeb427so2011643d50.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706319; x=1761311119; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KuBZKmjoBlsw1oUgNA9R0/DESgCD3LzDHTcsDPY6GZA=;
 b=tXLFa4E1rtHf2d6IQG6qE6Ts+k7J9KPM3TlExZaHn1EmWZz8Q9u+6Q5ozBOUuT/vy5
 iVWcXCxCKPUFd4CD8K546hvZY64Uc7zaG+tJBx6ZEjoJDx2S33rVm/A088RRe4L0mSrN
 wtdX2jeq8+JJDNlLLhrjT4pApM3x/KP61vzDIT37/nW0aoHyKcRIlH6zY06X9ZAtbpb5
 wXPPVuRA2BmVnfsFmo8tvvMWhap6mCA4U2xBSUOeWNMCchcjA/QXPBKnIQ0A6UWZeUgS
 B2XwW/7HI4zPWPIap6TRR6XLX3IWNCkUWRPhBqN+G2pMpgiX2XriCPDhaOh7H0KrWZo9
 xlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706319; x=1761311119;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KuBZKmjoBlsw1oUgNA9R0/DESgCD3LzDHTcsDPY6GZA=;
 b=i/08duOqSYBg1jsg+oBxgdYU0Y+PHIq60BI8FiVuuYj/ynPBAgeQNgQ76LyDzCZz1b
 Ddgiz6XonxAMi8uYTkcRawvJPY59K3+pDBLpH9Q8996PEO7Wrw0v//by1PEKUhP1fZz+
 YTpP15m1Kz85nxzkL3sq1CgXg3ryemBfDuFpXX8mnT2uToRACE2/Cgbrp+VIVcwX56tQ
 0oMKdzUGkU8hiXOuieDIhV1EBw2U1UIQdA/Bj38vdhIpOORKqxPQLGZ31Nn8clhJnYFw
 31F3ANs7udTmGothbnkZhJi5FmJmFRLdWGyg0nzlCoU6F8c+Hj+m64htKgHU+OCFB9uT
 OIsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxW99lmek2D7yfujo9PJkg5q8803XorQFYVVJMfDViFLvSy0lRGomO3XdfgRpaI4PNdYijRBXyqQ==@nongnu.org
X-Gm-Message-State: AOJu0YxH3VcfAJk/NyN8oPre5SEbjcQI54YzepXdCFkqtTa6l53kxw07
 ca1L5tMBVy/GRDUPeB6njU6tPahTvR6mCCv6V5Ho5pt+QNTYN8nk6DnWvIXEcghcHy6/UtlQrUp
 vIBl8I0gvaDoq3zgm0a3z/GWUaqXOUMcSeAot2NJI0GWImvc2PE7+
X-Gm-Gg: ASbGnctlQosubfQ5SHIaOkdVpuwEOcnOfP07s/IVSEClhxL0C5zDF+QmC/3YxQ5t3V5
 lu4mEWWtwr/6c5IqlUhsmZCVisrKYUnGtfGJHDT2131xMjS18Q24mH//LttgD8zO9ZWvI2spIOx
 6rVVao0uLCsXf5MXS41dWhTx6msjoZWO/g/cdSkRJTJQIBv4tY0HkACSEKHMiml/TGaEiBcvajH
 9jX0iMX6RRV6mNJu6Fv1BoZj9dF/KbjWO0Ma//If1ZPoxttRE2qfxCd+3FnJHShuD6mquu8
X-Google-Smtp-Source: AGHT+IH19t8SFRumLoN+BuL4EHLU42mChpBHIMBiuO/r2HdZ2RgjgtDfljTnDFNkQwzegu2NMcEtFJmgWNy0PZF+Ja4=
X-Received: by 2002:a05:690e:140d:b0:63e:2471:96ff with SMTP id
 956f58d0204a3-63e247198fbmr133819d50.60.1760706318417; Fri, 17 Oct 2025
 06:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-6-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 14:05:07 +0100
X-Gm-Features: AS18NWDYmmqOTLdlzswdY2NG5BQ0Mvgmh8sfOdNV1i334C8SwkCr9Wqbzj5iEfM
Message-ID: <CAFEAcA9KZcuMenU4yKeGBc7EtWu07-ELHO-SwG+dYKGN-B3zUg@mail.gmail.com>
Subject: Re: [PATCH v2 05/37] target/arm: Split add_cpreg_to_hashtable_aa64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 14 Oct 2025 at 21:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename the existing add_cpreg_to_hashtable_aa64 as *_1.
> Introduce a new add_cpreg_to_hashtable_aa64 that handles
> 128-bit and 64-bit views of an AArch64 system register.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 61 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 57 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3b06704963..c240edf182 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7668,11 +7668,9 @@ static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, ARMCPRegInfo *r)
>      }
>  }
>
> -static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, ARMCPRegInfo *r)
> +static void add_cpreg_to_hashtable_aa64_1(ARMCPU *cpu, ARMCPRegInfo *r,
> +                                          uint32_t key)

I prefer "do_foo()" over "foo_1()" for naming this kind of "internal
part of some other function", and we have a lot more do_foo than
foo_1 in target/arm.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

