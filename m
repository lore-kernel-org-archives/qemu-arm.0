Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp786795njb;
        Thu, 4 Jul 2024 11:37:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcPWS06pIrs/uCtB+CM/a3gnklZ/2Nvsv/i4qQyJEUr0DwNzrIv9HkvrwhbXqOK0JPmSwRbaVjP8bCz9dY7ya0k/ybI2aS
X-Received: by 2002:a5d:4c4e:0:b0:367:892e:c6a0 with SMTP id ffacd0b85a97d-3679dd336f1mr1941142f8f.34.1720118229338;
        Thu, 04 Jul 2024 11:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720118229; cv=none;
        d=google.com; s=arc-20160816;
        b=ETYmap+kgdIbX/nYSduDxTqDSHxJQvYg3OKWUpIKFQaeeWH/he20fsSfnnyWTcpfng
         Z8zMncGbONah1xqHQpnoEJc7aKB5Hs5cB06lV8svbvl2dRjJ/3PhfXm/EBboRoT91KXW
         Vkxt0w2tJ4jkouSoabsODkvoZztS5AM5GvhP98Y3BIns/5OBBxByl/Z5T2ScsoukIG7w
         +PXIDvziwVvOwUo2r87cESrHwyb1+LMsj3t+g8A1E/l7kyAsBarkkzG3YQ6UJvcoTbd0
         XIE9oXtzzHk9TQPQYet0QAsuvQSCNTMbybSu0X0Qe3TCAg/MWUFHps2vE8tVv67UU1ex
         IWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=iMf1a2w7VycJ9es19fvo3ydFWICUzfaziKIWRKUyz3Q=;
        fh=qZz80KIpj+fMQ6qiSKuN99H8Lz+l/okwxLqRKeUe7zw=;
        b=KE4j1F7NVNy+xpNZv9E9pEdEnfjWZ/lLxTNOuBv9THL+/hFPvJtBf2k9mFTgdEu390
         BIGHusKGoTQ+NH28ZOEUKc3YuxHDJPRQxKAvMhD8PJW8ZBLrKvQ1vBPtDJqj45n42ogw
         U9yyev7WWL491IpN6kApj4lE9lc0CiAcbFRpVweayufyWjqmxgu7I3hob7fUXwFdZgQq
         99wtyn0frHNt7RUB55BIBfNGuBJ8RaMzNqFF50KuGtDJl+Pd0KtKFG+j9Au45tzxwfvC
         vNvq2u2P7eM6tQJoa6TiyfOJVfq4OqpqzmhoNg5RSjcgtAzkVBqljkU1dWADVVm61F7P
         FqeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3Xhger8;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3679592caadsor915603f8f.0.2024.07.04.11.37.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:37:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K3Xhger8;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720118229; x=1720723029; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iMf1a2w7VycJ9es19fvo3ydFWICUzfaziKIWRKUyz3Q=;
        b=K3Xhger8E6FHd/Zy11iC9PX/imFAOL+tg9H5OIBZ6Js8l8vkRWxIZmaLj0nzrxXxaa
         /n71REQqL3HJWzaqrSolDWymHBEbd2QBdPOITZf3xLC8Ejp4v9pOxr1Lo8AqdpaDaPuG
         9ZtMh7sy8wfz17lkf6rDL55KKhwiR1SHGv+5FXmNzDqSsBVAkrLTs/MTwUAaKVnLvKcZ
         ViCuWOG9Nlbb4t0keLnk1ovFjUzpKsiWQ8wLthg873epgcRueKFI73y0yOYNY1sFY7C8
         AnTikOJgN8kSgPra0Ts9BKcYeghVUekHzSRqHKPF1xkXYh2T7abFhFExNSXldjPrgepR
         0Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720118229; x=1720723029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMf1a2w7VycJ9es19fvo3ydFWICUzfaziKIWRKUyz3Q=;
        b=uBWDgkjiIXT4GMiRLUpQxaXRrnl6luyRlk5nT35e0GHQKw+CcWlsiNiWKxfyKoJJaw
         Ddoe2fOA/PNYh1vGUKP7fPQCIaLvyq/sERr3plfb3qQZ9c1fiDmmCsRXEoasz2SYZIjF
         +XriHKu8Ilj12Trxt1WWrt6Xp2aHLlobiZtER7SHRw2FW/Z80Y/Rj9lhILF9/ZGPncTp
         9rOo/+2LkLiqC6Rg64gGBEDJJI1XAa8ptE/18A+5Dw3OqmHhpPTXomH6KQm5nJPe0oGO
         IoCOBT2xyrx+cGXihdv0M5/k84NWrPbMLv60UFkYy9SbavTCLZLDR9FeDWqzznmZOEzh
         4V8g==
X-Forwarded-Encrypted: i=1; AJvYcCXtboNEkEU2l9J/FzV5Z0MzlKlaRIZp9zHsdZc+KAh05pEhbIixn9nZ4362AEH0eiMx2dErEyO5nQfIrg6XsTDXo6nk6mYi
X-Gm-Message-State: AOJu0YzhtHPxkjwaUnEIceQSXEnGe7rEwqaJKjb+rIK2hfBasyZIP/lp
	xGuX658T4v6iJq4YBFahUAVREw4ISZpGNrC/647uwUJRRGCcPiLK0IK/kZJB198zqg==
X-Google-Smtp-Source: AGHT+IErKuRR4tcYeAJJxFKJdMpKQelJaP0GUTVGnGsivPfYaOWuPGzg2OVSKUNVmrrOJp18x6rBwg==
X-Received: by 2002:a5d:48c9:0:b0:367:8a39:85ce with SMTP id ffacd0b85a97d-3679dd806a8mr1754794f8f.70.1720118228471;
        Thu, 04 Jul 2024 11:37:08 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367956ca37asm4535626f8f.75.2024.07.04.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:37:08 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:37:21 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 19/19] hw/arm/smmu: Refactor SMMU OAS
Message-ID: <20240704183721.GP1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-20-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-20-smostafa@google.com>
X-TUID: DnpFiOvu6T4x

On Mon, Jul 01, 2024 at 11:02:41AM +0000, Mostafa Saleh wrote:
> SMMUv3 OAS is currently hardcoded in the code to 44 bits, for nested
> configurations that can be a problem, as stage-2 might be shared with
> the CPU which might have different PARANGE, and according to SMMU manual
> ARM IHI 0070F.b:
>     6.3.6 SMMU_IDR5, OAS must match the system physical address size.
> 
> This patch doesn't change the SMMU OAS, but refactors the code to
> make it easier to do that:
> - Rely everywhere on IDR5 for reading OAS instead of using the
>   SMMU_IDR5_OAS macro, so, it is easier just to change IDR5 and
>   it propagages correctly.
> - Add additional checks when OAS is greater than 48bits.
> - Remove unused functions/macros: pa_range/MAX_PA.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/arm/smmu-common.c     |  7 ++++---
>  hw/arm/smmuv3-internal.h | 13 -------------
>  hw/arm/smmuv3.c          | 35 ++++++++++++++++++++++++++++-------
>  3 files changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index faba4adc49..2cff80e5dd 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -452,7 +452,8 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>      inputsize = 64 - tt->tsz;
>      level = 4 - (inputsize - 4) / stride;
>      indexmask = VMSA_IDXMSK(inputsize, stride, level);
> -    baseaddr = extract64(tt->ttb, 0, 48);
> +
> +    baseaddr = extract64(tt->ttb, 0, cfg->oas);
>      baseaddr &= ~indexmask;
>  
>      while (level < VMSA_LEVELS) {
> @@ -576,8 +577,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>       * Get the ttb from concatenated structure.
>       * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
>       */
> -    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
> -                                  idx * sizeof(uint64_t);
> +    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, cfg->s2cfg.eff_ps) +
> +                                  (1 << stride) * idx * sizeof(uint64_t);
>      dma_addr_t indexmask = VMSA_IDXMSK(inputsize, stride, level);
>  
>      baseaddr &= ~indexmask;
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 0f3ecec804..0ebf2eebcf 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -602,19 +602,6 @@ static inline int oas2bits(int oas_field)
>      return -1;
>  }
>  
> -static inline int pa_range(STE *ste)
> -{
> -    int oas_field = MIN(STE_S2PS(ste), SMMU_IDR5_OAS);
> -
> -    if (!STE_S2AA64(ste)) {
> -        return 40;
> -    }
> -
> -    return oas2bits(oas_field);
> -}
> -
> -#define MAX_PA(ste) ((1 << pa_range(ste)) - 1)
> -
>  /* CD fields */
>  
>  #define CD_VALID(x)   extract32((x)->word[0], 31, 1)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 88378e83dd..6954b385c7 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -410,10 +410,10 @@ static bool s2t0sz_valid(SMMUTransCfg *cfg)
>      }
>  
>      if (cfg->s2cfg.granule_sz == 16) {
> -        return (cfg->s2cfg.tsz >= 64 - oas2bits(SMMU_IDR5_OAS));
> +        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.eff_ps);
>      }
>  
> -    return (cfg->s2cfg.tsz >= MAX(64 - oas2bits(SMMU_IDR5_OAS), 16));
> +    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.eff_ps, 16));
>  }
>  
>  /*
> @@ -434,8 +434,11 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
>      return nr_concat <= VMSA_MAX_S2_CONCAT;
>  }
>  
> -static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
> +static int decode_ste_s2_cfg(SMMUv3State *s, SMMUTransCfg *cfg,
> +                             STE *ste)
>  {
> +    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
> +
>      if (STE_S2AA64(ste) == 0x0) {
>          qemu_log_mask(LOG_UNIMP,
>                        "SMMUv3 AArch32 tables not supported\n");
> @@ -468,7 +471,15 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
>      }
>  
>      /* For AA64, The effective S2PS size is capped to the OAS. */
> -    cfg->s2cfg.eff_ps = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
> +    cfg->s2cfg.eff_ps = oas2bits(MIN(STE_S2PS(ste), oas));
> +    /*
> +     * For SMMUv3.1 and later, when OAS == IAS == 52, the stage 2 input
> +     * range is further limited to 48 bits unless STE.S2TG indicates a
> +     * 64KB granule.
> +     */
> +    if (cfg->s2cfg.granule_sz != 16) {
> +        cfg->s2cfg.eff_ps = MIN(cfg->s2cfg.eff_ps, 48);
> +    }
>      /*
>       * It is ILLEGAL for the address in S2TTB to be outside the range
>       * described by the effective S2PS value.
> @@ -544,6 +555,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
>  {
>      uint32_t config;
> +    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
>      int ret;
>  
>      if (!STE_VALID(ste)) {
> @@ -587,8 +599,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>           * Stage-1 OAS defaults to OAS even if not enabled as it would be used
>           * in input address check for stage-2.
>           */
> -        cfg->oas = oas2bits(SMMU_IDR5_OAS);
> -        ret = decode_ste_s2_cfg(cfg, ste);
> +        cfg->oas = oas2bits(oas);
> +        ret = decode_ste_s2_cfg(s, cfg, ste);
>          if (ret) {
>              goto bad_ste;
>          }
> @@ -714,6 +726,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>      int i;
>      SMMUTranslationStatus status;
>      SMMUTLBEntry *entry;
> +    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
>  
>      if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
>          goto bad_cd;
> @@ -732,7 +745,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>      cfg->aa64 = true;
>  
>      cfg->oas = oas2bits(CD_IPS(cd));
> -    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
> +    cfg->oas = MIN(oas2bits(oas), cfg->oas);
>      cfg->tbi = CD_TBI(cd);
>      cfg->asid = CD_ASID(cd);
>      cfg->affd = CD_AFFD(cd);
> @@ -761,6 +774,14 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>              goto bad_cd;
>          }
>  
> +        /*
> +         * An address greater than 48 bits in size can only be output from a
> +         * TTD when, in SMMUv3.1 and later, the effective IPS is 52 and a 64KB
> +         * granule is in use for that translation table
> +         */
> +        if (tt->granule_sz != 16) {
> +            cfg->oas = MIN(cfg->oas, 48);
> +        }
>          tt->tsz = tsz;
>          tt->ttb = CD_TTB(cd, i);
>  
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
