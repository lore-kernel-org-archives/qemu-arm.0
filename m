Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp323003ejb;
        Mon, 13 Feb 2023 08:01:41 -0800 (PST)
X-Received: by 2002:a62:844d:0:b0:5a8:b28d:b1ef with SMTP id k74-20020a62844d000000b005a8b28db1efmr4164081pfd.14.1676304101096;
        Mon, 13 Feb 2023 08:01:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676304101; cv=none;
        d=google.com; s=arc-20160816;
        b=OALgT5+/n/iagRyHEd6ZDqomBj3WbBHAZXmv9ZWdFycDgd7sptWCoff5tgVSvLiFNL
         wXZBKCQsbk7ZC3qJHPGNz4uG/ikPxuiBqpU4UoGNYNcpRZNpuFtb2KVUwKqS0yXZuWOm
         f3pmywhcy4/nmN294/HwL2HKvLYoryN0RRSSXPPCX4mjorzH0PuV2CqpbNRDfsiPOgBq
         2rbJ6cDtBVVnqMsQHG0mEnXhZwPW8lGI0LSKb1Pujl9LP7Ft9lghWRC+3wV/imgBIAQN
         9TShzKvxEIIByKClXx0vfEzfs+G1hq8IcESOREftdAe2ZzTCV8ub0EOckX3PrtbU0HHJ
         EwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SPYd2GWyjSrPJ6422NzWzWB23rJk3/Q3uSi6v0okH/E=;
        b=QiuLMa07xE1s0+1Ba5l0dvZfsl5j6oxcEQ/vvSgF0NfECkRRBUSfftb98ftXu+8BMV
         he39Tvjm6SRQ3tSD5pg3zaU+Rst5DNGFw+kA+QB8r8L8fOGN3Stu0sp/ejTwwIL9bRHl
         loxNLFw5qu4s4h0hL/olLrnzykwsCL5ujoZ9bPUBf3CGF+STFCn6YJlfkJGSKyaNnG8I
         +ZJpxRn139bYV5Slo2D7THIhkzlSeQs13vlmyEEbSC5rDmdC65nuIiWwx9bVeFD7whUA
         L+8nCjDB+vO4Ud7coAlJ4chxPxJlLMDjGvoBKkNiXN5/BVmdpMH98Q2nF+zfnMtnNGj/
         3COA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f01iZ7qm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a27-20020aa78e9b000000b005a8b6f64906sor1320705pfr.47.2023.02.13.08.01.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 08:01:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f01iZ7qm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676304100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SPYd2GWyjSrPJ6422NzWzWB23rJk3/Q3uSi6v0okH/E=;
        b=f01iZ7qmrvJVJ9PLBk5d4R9LV1jAcEMSuA8IXg5sz96VH/TLJ/Vt5Ey7Hf8Fn6cPGQ
         CsaUHmtr6ogp8T2SQOREG4itkcSke7uSggMt9t5xTYrtJtGARhIdMio6yMPNvpQe8AVH
         eT3TUFWww6bUs7tLuUDmsA3HeZU+1e227CzDN+59TF9726HHhDBOYtQsIHK9gYkjftNa
         CZWCy2NPwIlsAm4Euzoip/kppstyKfBu94HCtlhJFNzFti2NvzWsFrPAk2HHYCO2xcSL
         YzmJD9D4btgDP9AKvjAczyzl8H0Q519tWuF2u9arPsQlAaKtkm9GNsTfH3bn5sE8r6k5
         wwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676304100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPYd2GWyjSrPJ6422NzWzWB23rJk3/Q3uSi6v0okH/E=;
        b=lPFskPueS0I6RahFD3FNRBHqUJAr+KrGeABX/xKxZ8fwZXgTDB7b4uC8EDeGHmxi5M
         L0CerOFfHQUOrPSfsueyCfysqLT1aMhnGHrJ5StOBz1p8IJ6+V4j4hY0ujNZZa3jZP39
         9aKlcmbTaNJO6kkfjFWmWjDkWzELNHbEimVD4/T+xSsM2n3I79EptEFg9giLRMAQX+V0
         rcv/NiS3hYWZOQ71oYhM2Q18mCcvVwHWpQVIHswNAFTAvl3t9E+YbWverTmtPXolwUEp
         ceA7odsl8RuinKZQkyOqGo6AFH/7iLUZxY3AM712qlj9lD2ADGXrhmB0WxWKtEhzHPD9
         yA7g==
X-Gm-Message-State: AO0yUKX/EXbph/y4zJqCku//i1J75xxB+/6lfPlhAZjeekHDCnbuLJqM
	upcTkrM/xzeoM074UEBPDfkdJkpebBlAnZ5Gox3EUHBz
X-Google-Smtp-Source: AK7set9DPHkjBbnm5ItEOKqGvX+9TOHuULG/aSMzsk9nmIJ7rU+nsqGgu21kd7lop7tspvNDmKy0IAVCa9LmuKuc3fc=
X-Received: by 2002:a62:1b83:0:b0:593:fa6a:b960 with SMTP id
 b125-20020a621b83000000b00593fa6ab960mr4939267pfb.48.1676304100585; Mon, 13
 Feb 2023 08:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com> <20230202211129.984060-2-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-2-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:01:29 +0000
Message-ID: <CAFEAcA8uVVCfWwEYVs5ATzi7jNh9--cN+TVQ63M_ZW_bWwqtxg@mail.gmail.com>
Subject: Re: [PATCH 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: X7P1fLxEZZNP

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.h          | 57 ++++++++++++++++++++++++++++++++++++---
>  target/arm/helper.c       |  4 +--
>  target/arm/pauth_helper.c |  4 +--
>  3 files changed, 58 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8cf70693be..9be59163ff 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1001,6 +1001,7 @@ struct ArchCPU {
>          uint32_t dbgdevid1;
>          uint64_t id_aa64isar0;
>          uint64_t id_aa64isar1;
> +        uint64_t id_aa64isar2;
>          uint64_t id_aa64pfr0;
>          uint64_t id_aa64pfr1;
>          uint64_t id_aa64mmfr0;
> @@ -3902,18 +3903,68 @@ static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
>              (FIELD_DP64(0, ID_AA64ISAR1, APA, 0xf) |
>               FIELD_DP64(0, ID_AA64ISAR1, API, 0xf) |
>               FIELD_DP64(0, ID_AA64ISAR1, GPA, 0xf) |
> -             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0;
> +             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0 ||
> +           (id->id_aa64isar2 &
> +            (FIELD_DP64(0, ID_AA64ISAR2, APA3, 0xf) |
> +             FIELD_DP64(0, ID_AA64ISAR2, GPA3, 0xf))) != 0;
>  }
>
> -static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
> +static inline bool isar_feature_aa64_pauth_arch_qarma5(const ARMISARegisters *id)
>  {
>      /*
> -     * Return true if pauth is enabled with the architected QARMA algorithm.
> +     * Return true if pauth is enabled with the architected QARMA5 algorithm.
>       * QEMU will always set APA+GPA to the same value.
>       */
>      return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
>  }
>
> +static inline bool isar_feature_aa64_pauth_arch_qarma3(const ARMISARegisters *id)
> +{
> +    /*
> +     * Return true if pauth is enabled with the architected QARMA3 algorithm.
> +     * QEMU will always set APA3+GPA3 to the same value.
> +     */
> +    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3) != 0;
> +}
> +
> +static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
> +{
> +    return isar_feature_aa64_pauth_arch_qarma5(id) ||
> +        isar_feature_aa64_pauth_arch_qarma3(id);
> +}
> +
> +static inline uint8_t isar_feature_pauth_get_features(const ARMISARegisters *id)
> +{
> +    if (isar_feature_aa64_pauth_arch_qarma5(id))
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA);
> +    else if (isar_feature_aa64_pauth_arch_qarma3(id))
> +        return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3);
> +    else
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API);
> +}
> +
> +static inline bool isar_feature_aa64_pauth_epac(const ARMISARegisters *id)
> +{
> +    return isar_feature_pauth_get_features(id) == 0b0010;

This should ideally be ">= 0b0010", but it depends a bit on
where we call it.

This field, like most ID register fields, follows the "standard
scheme", where the value increases and larger numbers always
imply "all of the functionality from the lower values, plus
some more". In QEMU we implement this by doing a >= type
comparison on the field value.

The PAC related ID fields are documented slightly confusingly,
but they do work this way. The documentation suggests it might not
be quite that way for FEAT_EPAC because it says that
HaveEnhancedPAC() returns TRUE for 2 and FALSE for 3 and up.
However this is more because the definition of the architectural
features means that FEAT_EPAC is irrelevant, and it's an accident
of the way the pseudocode was written that means that
HaveEnhancedPAC() ever gets called when FEAT_PAuth2 is present.

Other than EPAC, the rest of the values in these fields are
straightforward and we can implement the isar_feature functions
with a single >= comparison.

> +}
> +
> +static inline bool isar_feature_aa64_fpac_combine(const ARMISARegisters *id)
> +{
> +    return isar_feature_pauth_get_features(id) == 0b0101;

Should be ">= 0b0101".

> +}
> +
> +static inline bool isar_feature_aa64_fpac(const ARMISARegisters *id)
> +{
> +    return isar_feature_pauth_get_features(id) == 0b0100 ||
> +        isar_feature_aa64_fpac_combine(id);

Should be ">= 0b0100", no need to || with fpac_combine().

> +}
> +
> +static inline bool isar_feature_aa64_pauth2(const ARMISARegisters *id)
> +{
> +    return isar_feature_pauth_get_features(id) == 0b0011 ||
> +        isar_feature_aa64_fpac(id);

Should be ">= 0b0011", no need to || with fpac().

> +}
> +
>  static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 72b37b7cf1..448ebf8301 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8028,11 +8028,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
>                .resetvalue = cpu->isar.id_aa64isar1 },
> -            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +            { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
> -              .resetvalue = 0 },
> +              .resetvalue = cpu->isar.id_aa64isar2 },
>              { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
>                .access = PL1_R, .type = ARM_CP_CONST,
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index d0483bf051..a0c9bea06b 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -282,8 +282,8 @@ static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
>  static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
>                                   uint64_t modifier, ARMPACKey key)
>  {
> -    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
> -        return pauth_computepac_architected(data, modifier, key);
> +    if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
> +        return pauth_computepac_architected(data, modifier, key, false);
>      } else {
>          return pauth_computepac_impdef(data, modifier, key);
>      }
> --
> 2.25.1

thanks
-- PMM
