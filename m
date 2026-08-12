Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59434C5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 10:49:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wu6WI-0006Y2-Q6; Wed, 12 Aug 2026 06:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wu6WG-0006XN-Ot
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 06:49:12 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wu6WE-0005Hl-Ut
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 06:49:12 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-81e69a2db34so12268727b3.0
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 03:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786531749; cv=none;
 d=google.com; s=arc-20260327;
 b=PJVJ9lQCF/s2sO+R58ZgnSOBUp0RjeIXUHQE1zwrNsjrbxrffwMUkVZuPnyotElnsF
 Eon1HYsHK/vbTRfzOrrq4nr3PUevbC/p7fdnRjrhyNxSpPcziqKqDYT7jkYXgGP1KFEV
 jkqQwU9Yod1TzwqwY/3/Cg1WrYIOCr8b9814/rU0cF+ky4dT+HguzYSlISFVht1Mr/c6
 XmgfK6jYxGBnHv4xNGtEysTNxnlGnKQZ1krBrILHBULLINre3x0bGJQUd5Tbxdn350eB
 ctdu5b4RjGKFMTlUvzsNpXBY+F2CDYDXiwPpvSbzuJgpkkb6QdGfrWy2KxknIzr/62+V
 itOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5i/V48r7uzuz1OG9Zh5Gu5Y0/TnUEksBAMsmsnDC6bI=;
 fh=l1WtbJHEJZA+nbB2r0tu4CCbxThlcboLDgMLpCjG/5o=;
 b=oi1Rvsxn4wZ3chBOiWug+ilSLX4orro8/DcUoNZViz3SESREtAzhvCD2ye2/XRnUZq
 b8rTb7+0lxkU9Lf7Tuy5LnN+IEq64OuknOcw+QFdd+leSNGPfuBzOHc/APJUUOYuKKhS
 y9ymTWUX/DylkpDZv4LMjUONJWRWNGPhcWONbJYDIZ/VkTg5Ui9lmChiLMwP80aR7KHr
 bdIS8gxMFTZjlKLKCgmA/U0lnvuz3rWmqV+wP4+XgCu7UTr6evGofroAXjFQXK9b4oT/
 Wv6bXFm+dVBGIgUDlK5kB/qleeWJUbh+M9LUxf00PgUGvMTeI/pOdaVPLEKysKXzfkI8
 z6Mg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786531749; x=1787136549; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5i/V48r7uzuz1OG9Zh5Gu5Y0/TnUEksBAMsmsnDC6bI=;
 b=r7kaJUkLSRVv2ckeh8cYTaXqmbkkVH39t53XWKSaXaY0r2C1z0eT9NliHHzmm+jvJj
 PnrzvR1u4OLdnER01YL8uMR39Lt3KvuHn9r1418zb49r+R/dMxdKBGMZUgByO7F6/7yD
 ForLW7EzJwizGZtWUPvNiX2XXAOCu8JXlUlKvY+1ViBWaqNWe6sDvq9/wB6dsikWr5ns
 E4PtRYAv4CEH7WVEtKvPm3BV46+aTyoaScFCrFVB/d9qNOPAHrDXyygiIy6medlZbYDa
 L1S8fsJOZuVfLPXOhchtXC4svLjKxoBQF3rX9Yh0UND8LzHH+bmpLBqwXVXTnY5DA9mn
 SHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786531749; x=1787136549;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5i/V48r7uzuz1OG9Zh5Gu5Y0/TnUEksBAMsmsnDC6bI=;
 b=RoM3QJXGuIKAF0Z4XVkWueGr4R48bPPYdnzMQuzVqmWHTdiaJht3Zcw96a6Lb135wS
 BUlQdra+JQgcvAjLglKNvK4WbqMaij1qZeOKcU1eLOdg9riKLSUwqpUiXOcUgwMRsGxD
 IUVLgcYcL3Swa7uAhny3Zfgv5P/lyD5jayyyI38Vdo0uJVfvCmrgdnOhORQIbpSPnuG9
 JOVSdvbzxUZ5tFK81R+seiWgTGFfghZst+QjoSJF58LAGBc3LA+0u9TMlBEyh2X1B2hJ
 oRmBeOrohdoVAfXTYUHI9W34aASLXWiQOVmjo++s+oBCAS1vINH2eV2bFBuuwslMnQVL
 sB0A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqzprrjf2zr3ZQ3ddyjN6dkf35pZ17zMe/EHyQ0vR5QLRLeDkPI6mjuqDAyhqwZnK8h3WuULzi8VA==@nongnu.org
X-Gm-Message-State: AOJu0YwCEtHFP4Zsj1l85MUs9vVbgTT88hx7H3FDTS0kLbBeY12OreWj
 oltildIqBFRareyj9RgsFuUzkp+OHsR9w/EmwBL9NnXQZ64tMO02b669ICFCpwJpon9zvM/iwIK
 iRe7vJN2vKQL9ZAo18YoYjs5wWYA7+LTd5HHELLZEpA==
X-Gm-Gg: AR+sD11DbtZ4Dh5G5j/GpBQjJezRmLKV0Qr1Scan5MvmFUOz/yHiCkRvlQop6psj1jz
 QQyDDFUCyyXri2qqoSo08X2uO83j3MGgoX29Ke2BUGXkIRhb091XgfM6zBEe6bt5laq/qH9r0oO
 Lx/uRK2Lwr7yigbcbojmal2cfvwToWSmT0dbXeqlrkTQZpaheTPn7MgcDkvaqlWxyJOklA8+UTo
 U64DDtaezKTIvBSoGbsYT9NtrwMLU8nebLN6QGfEhCfl2oXr+pIHdrrGBKinC18wHfR+WGGm+j1
 /sLlGaQDtw/u4Sd1wkA2yYjJAeG6+zND7Re/aHk3Ce8HByafw+xxaDW6vZlGrmmJd9bYNwxqIaH
 mAfDcaDiS9t5c/jrN0v6UYdYcvz0L
X-Received: by 2002:a05:690c:60c4:b0:80d:a249:4854 with SMTP id
 00721157ae682-83109ef95bcmr22059257b3.17.1786531749229; Wed, 12 Aug 2026
 03:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260806163939.328201-1-richard.henderson@linaro.org>
 <20260806163939.328201-8-richard.henderson@linaro.org>
In-Reply-To: <20260806163939.328201-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Aug 2026 11:48:57 +0100
X-Gm-Features: AUfX_mz77ePcDw5qhNXXy8ErTv6EUbrATcmJox-cluOmZLznMPW5S4wA4N9-P9Q
Message-ID: <CAFEAcA8Q3RmeGpTdC1KjTBMriiUMmYZTEpgiP83PBDvUmCdOkw@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/arm: Separate cpu types max-v8 and max-v9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Thu, 6 Aug 2026 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not include v9-only features in "max-v8".
> Do not include the prohibited v8 features in "max-v9".
> In tcg mode, define "max" as "max-v9".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h        |   2 +-
>  target/arm/cpu-max.c          |   2 +-
>  target/arm/tcg/cpu64.c        | 408 ++++++++++++++++++++--------------
>  target/arm/tcg/stubs32.c      |   2 +-
>  docs/system/arm/emulation.rst |  11 +-
>  5 files changed, 253 insertions(+), 172 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 5e7f41a50d..2ced0b1c2c 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1809,7 +1809,7 @@ void aarch64_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
>  void aarch64_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
>  void aarch64_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
>  void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
> -void aarch64_max_tcg_initfn(Object *obj);
> +void aarch64_max_v9_tcg_initfn(Object *obj);
>  void aarch64_add_pauth_properties(Object *obj);
>  void aarch64_add_sve_properties(Object *obj);
>  void aarch64_add_sme_properties(Object *obj);
> diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
> index cfcc46eb9d..e6872c1c8d 100644
> --- a/target/arm/cpu-max.c
> +++ b/target/arm/cpu-max.c
> @@ -220,7 +220,7 @@ static void cpu_max_initfn(Object *obj)
>           * '-cpu max' for TCG: we currently do this as
>           * "A57 with extra things"
>           */
> -        aarch64_max_tcg_initfn(obj);
> +        aarch64_max_v9_tcg_initfn(obj);
>      }
>  }
>
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 556fa9fa3c..5eeb6712da 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1156,13 +1156,11 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
>  }
>
>  /*
> - * -cpu max: a CPU with as many features enabled as our emulation supports.
> - * The version of '-cpu max' for qemu-system-arm is defined in cpu32.c;
> - * this only needs to handle 64 bits.
> + * -cpu max-v8: an ARMv8 CPU with as many features enabled as
> + * our emulation supports.
>   */
> -void aarch64_max_tcg_initfn(Object *obj)
> +static void aarch64_max_v8_tcg_initfn_aa64(ARMCPU *cpu)
>  {
> -    ARMCPU *cpu = ARM_CPU(obj);
>      ARMISARegisters *isar = &cpu->isar;
>      uint64_t t;
>      uint32_t u;
> @@ -1226,203 +1224,148 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, CTR_EL0, DIC, 1);
>      cpu->ctr = t;
>
> +    /*
> +     * Below, note the revision from which the feature is OPTIONAL.
> +     */
>      t = GET_IDREG(isar, ID_AA64ISAR0);
> -    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 3);   /* FEAT_LSE, FEAT_LSE128 */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);     /* FEAT_SHA3 */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);      /* FEAT_SM3 */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);      /* FEAT_SM4 */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);      /* FEAT_FHM */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2);       /* FEAT_FlagM2 */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);      /* FEAT_TLBIRANGE */
> -    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* v8.0: FEAT_PMULL */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* v8.0: FEAT_SHA1 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* v8.1: FEAT_SHA512 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* v8.0: FEAT_CRC32 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* v8.0: FEAT_LSE */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* v8.0: FEAT_RDM */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);     /* v8.1: FEAT_SHA3 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);      /* v8.1: FEAT_SM3 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);      /* v8.1: FEAT_SM4 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* v8.1: FEAT_DotProd */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);      /* v8.1: FEAT_FHM */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2);       /* v8.1: FEAT_FlagM2 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);      /* v8.3: FEAT_TLBIRANGE */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* v8.4: FEAT_RNG */
>      SET_IDREG(isar, ID_AA64ISAR0, t);

Because this commit updates every line to put the optional-from
version in the comment, it makes it very hard to review for what
has functionally changed (i.e. which features that we previously
had in 'max' have we dropped from 'max-v8'). Could we do the
bulk comment update as a separate commit, please ?

thanks
-- PMM

