Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2108562njc;
        Mon, 4 Nov 2024 05:38:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrcBNoqU8gBNyeJ2Jtfxp5JYfBwU8u9ysGingvjTsjV/k0LOWcfU8cr88Ntr51Hxteru8QA//n7CryoQ==@linaro.org
X-Received: by 2002:a05:6512:3405:b0:539:fcb7:8d53 with SMTP id 2adb3069b0e04-53b34c5fa2cmr15945388e87.46.1730727507686;
        Mon, 04 Nov 2024 05:38:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730727507; cv=none;
        d=google.com; s=arc-20240605;
        b=f75FeLFvny4PDwCiQdNbAV+bYSBKoLpyhYLTPFFaiRibHloVS3Fcw4MqYW7HvI28Wr
         3DOVgcGuFVzWqoDCIBZ0nFflPQzyhuRe7MTgCEDWQZEBeVSO9XYSLlqdROy1tfb0I0Mj
         izwHWuynXr4hjbNmIPJmTWGr3nirHsUnC40O20oD/4360k7mxoO63Jg+GmSsxF3REaqb
         XBdkMhzIfEOTHk4t8xc/RIpUBGh6pgcAMKNMxOY4fv++GDSqNkYm5KoGhEh24vYtVDwx
         Q1jubBiNgQ7VV1eYMpMPzSXRC4vqasagUDgUa9iObqkXzE1UB4j3hZ2HpkSwsjqoV1A0
         w2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=go9/v40Y/7RdK76AIxCKH2IKaRhoqjtAJzDbG/iGJ6A=;
        fh=crtlnYyGngx+1gbqprOvPaB+fF9dnKbtDitc+esT+Ss=;
        b=lpBRQYoQvNlHnfcPKviK7+/QpptZyT4e986VhyPI+3ChRpYMCH/7yqP2Rbx9lfipmK
         vKRikPgIdCRlcl0Qbrv++KFpBO2oWuDW/NzF6oUpFBLthtZx/vPj1X4ww7D1O1NohrMd
         fQ4JqFuyydWguYpa0CWya6M2ivfO/kVX0CsjDfosDiYCAMT7HkRb2i1s8pqyp2EAd7qT
         20brbvYr7bYbHvZYI+B0I0kumlBrYyIuKOwAfBNVTQ9HRD6FEVsv9f8SWgbW1IiXAlAf
         zws577AAvXu2qiJFHPOvRTRuOcsYatX17qmtHMWzREuCqzcythTz6CJR79IolzRfn2fs
         LXxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZL0bVPI+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53c7bc980f7sor2497406e87.3.2024.11.04.05.38.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Nov 2024 05:38:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZL0bVPI+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730727507; x=1731332307; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=go9/v40Y/7RdK76AIxCKH2IKaRhoqjtAJzDbG/iGJ6A=;
        b=ZL0bVPI+r1JzrZHNoBeRK+mTEZOXJlnh3ifuiOyeATkBtM4lWK+GIbxqfAx1kROvBn
         QrzZ3+L23zg3kx1bhpzRcVRUKpwy0WCYt5GMjNArm4LPT56J26B3T3aEhZIjzrgGgW2X
         QRHdl6RXOIw02Nz9x95LaltnMrEv/8ybtnz2nt3e021ipQRNcYv/V+FzdfWBo1QHOy7v
         flULWhiZH0UrwFb+5DHRmhckzMviQdIzTezwnlIcvGmiI9wJ5hTbTuRXBXdQhW+iF5o/
         YuhWck4lpoBUEzaLo3mKwm3O43YmUwlDBtReoFr8SKMaxR2j1ceEZhUvXz/lHjVnVfBm
         P9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727507; x=1731332307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=go9/v40Y/7RdK76AIxCKH2IKaRhoqjtAJzDbG/iGJ6A=;
        b=Ub70b1INV74qa3oGCP9/j1IX2Ih1HYBND8TjMz73RqDqS+HgAKk/VXrF3n+pC+DL3/
         EAZqUWzw+WXy7x+NnUUyFhjiXqYpfM+0rkjTVOsX0Vb2nxGwdCJhutrVoSYcYPCHzN3Z
         KAGAx4XjfzawZLUSQlD7XUiAl9g/mvMroQlnYuDB8O0eqENok+KPw2oYVvyuHL9fBvZB
         U0BQUCyQKmKXjXxh4KJ18ZBHQ5Mu5N/SKbNM9tbVrxjFDVqXhFarQpViFonYgZ4T/Qcs
         eOi0k2Z9C1CT5XVy2nFwvB6o4bFlW1/DLRjWppV0HYZJAQAnjvdJUnIqQbNnyUkPPhL5
         xK2w==
X-Forwarded-Encrypted: i=1; AJvYcCXRWVF4d9dGfs7S+YFXX/TPpWtAlD26vKI4Uq4CAJ37zZVboQ3MVnyLOmyzPEp/5P6d4oJHmqUkN8MsMQ==@linaro.org
X-Gm-Message-State: AOJu0YyEnEx9SWjHvuFxFta9x6V4sOzqcth3XaAUTcI7g4CcDWcfdTe4
	ABXXPCPCKvwZqfS6LaU0wTBMslBfrrkzc/qtHdAu7oRU1fTaSMxreZ/mFBSq8qAqPA1GGP0G8ou
	z3FlJflwlEdeXQz11j76kq2ZfAai5l9zrynCHjdqGPDYRgjAVnTY=
X-Google-Smtp-Source: AGHT+IE40dRHnJ9VMhdmQ2IW9Gu+tsqZR7xVnmFn+hcCvSbAIIHkBIT2uGmWtii2jURArYbNVxk5XBDnK/Z391/R6Uc=
X-Received: by 2002:a2e:be84:0:b0:2fb:4f2e:5be7 with SMTP id
 38308e7fff4ca-2fcbdfe4a77mr158336871fa.24.1730727506909; Mon, 04 Nov 2024
 05:38:26 -0800 (PST)
MIME-Version: 1.0
References: <20241101013541.883785-1-gustavo.romero@linaro.org>
In-Reply-To: <20241101013541.883785-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2024 13:38:15 +0000
Message-ID: <CAFEAcA-aNf7ca1jYc0YnzSYKjvC42u178gmFTB+5p+TSgz0MfA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Enable FEAT_CMOW for -cpu max
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
	richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: CNKqcwBGXli0

On Fri, 1 Nov 2024 at 01:36, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> FEAT_CMOW introduces support for controlling cache maintenance
> instructions executed in EL0/1 and is mandatory from Armv8.8.
>
> On real hardware, the main use for this feature is to prevent processes
> from invalidating or flushing cache lines for addresses they only have
> read permission, which can impact the performance of other processes.
>
> QEMU implements all cache instructions as NOPs, and, according to rule
> [1], which states that generating any Permission fault when a cache
> instruction is implemented as a NOP is implementation-defined, no
> Permission fault is generated for any cache instruction when it lacks
> read and write permissions.
>
> QEMU does not model any cache topology, so the PoU and PoC are before
> any cache, and rules [2] apply. These rules states that generating any
> MMU fault for cache instructions in this topology is also
> implementation-defined. Therefore, for FEAT_CMOW, we do not generate any
> MMU faults either, instead, we only advertise it in the feature
> register.
>
> [1] Rule R_HGLYG of section D8.14.3, Arm ARM K.a.
> [2] Rules R_MZTNR and R_DNZYL of section D8.14.3, Arm ARM K.a.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  docs/system/arm/emulation.rst | 1 +
>  target/arm/cpu-features.h     | 5 +++++
>  target/arm/cpu.h              | 1 +
>  target/arm/tcg/cpu64.c        | 1 +
>  4 files changed, 8 insertions(+)
>
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index 35f52a54b1..a2a388f091 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -26,6 +26,7 @@ the following architecture extensions:
>  - FEAT_BF16 (AArch64 BFloat16 instructions)
>  - FEAT_BTI (Branch Target Identification)
>  - FEAT_CCIDX (Extended cache index)
> +- FEAT_CMOW (Control for cache maintenance permission)
>  - FEAT_CRC32 (CRC32 instructions)
>  - FEAT_Crypto (Cryptographic Extension)
>  - FEAT_CSV2 (Cache speculation variant 2)
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 04ce281826..e806f138b8 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -802,6 +802,11 @@ static inline bool isar_feature_aa64_tidcp1(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, TIDCP1) != 0;
>  }
>
> +static inline bool isar_feature_aa64_cmow(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, CMOW) != 0;
> +}
> +
>  static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8fc8b6398f..1ea4c545e0 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1367,6 +1367,7 @@ void pmu_init(ARMCPU *cpu);
>  #define SCTLR_EnIB    (1U << 30) /* v8.3, AArch64 only */
>  #define SCTLR_EnIA    (1U << 31) /* v8.3, AArch64 only */
>  #define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
> +#define SCTLR_CMOW    (1ULL << 32) /* FEAT_CMOW */
>  #define SCTLR_MSCEN   (1ULL << 33) /* FEAT_MOPS */
>  #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
>  #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 0168920828..2963d7510f 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1218,6 +1218,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 2);      /* FEAT_ETS2 */
>      t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
>      t = FIELD_DP64(t, ID_AA64MMFR1, TIDCP1, 1);   /* FEAT_TIDCP1 */
> +    t = FIELD_DP64(t, ID_AA64MMFR1, CMOW, 1);     /* FEAT_CMOW */
>      cpu->isar.id_aa64mmfr1 = t;
>
>      t = cpu->isar.id_aa64mmfr2;

We don't need to do anything for the actual cache operations,
but we do need to make sure that the SCTLR_ELx and HCRX_EL2
control bits for it can be set and read back. Our sctlr_write()
doesn't impose a mask, so no change nedeed there, but
our hcrx_write() does set up a valid_mask and doesn't allow
the guest to write bits that aren't in that mask. So we
need to add an
   if (cpu_isar_feature(aa64_cmow, cpu)) {
       valid_mask |= HCRX_CMOW;
   }
in there.

thanks
-- PMM
