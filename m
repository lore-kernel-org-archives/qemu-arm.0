Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1459475ejb;
        Mon, 20 May 2024 06:59:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkrUrYfDyLOkg2f9cbYgA6mIqsSN455slBqQDlwd0cLuL1FEqbNb84NVTi4mFDPouaiez5AepkZh0xntKPfY60IXGKpCc0
X-Google-Smtp-Source: AGHT+IF2bpLiajOdE21Qi7ngDw/gg/e+nJ9o4WcgfueA6tj82e6xLG5/agqTWAi38Ic0swOkt7r8
X-Received: by 2002:a05:620a:2281:b0:792:c0bd:bd5c with SMTP id af79cd13be357-792c760106emr2977400185a.69.1716213558287;
        Mon, 20 May 2024 06:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716213558; cv=none;
        d=google.com; s=arc-20160816;
        b=I5+jH7rgeIZcZWrVtMQrtHmm9bbBa4QKHWAmbOllUTERGwvtUooY5wj8cZnzELVF1D
         FT3dWXPzYH38hXnkeVOFw4gU2OBtYeRrho/P8chVPjjawnMW9G/g5vZ1nUbReI4m4lpL
         QPdYW9+H8ba2Gc8AzyDx7bMu+R8B6RqKIbVOxDdxVmmTXZJ3k8/l28tyF/xAmtLc8GCn
         2Hxlre+5bRWRn90gYK7d1mTj71d+5BGAzvHpm6TMQa4KUQ9JjhikLQqjFoUX9XGxjQYB
         fyzzw0F9jxZ6Uco7jMvD969bzKF1TFQ0NG2ZXkn+jJe6UYR2l4raMU/93golsMZ0hcs+
         XbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=W/2cXgJlqem1GpJTLgOvNgLkMQei9LGhhfTBhbVymVM=;
        fh=KOp1gAo/y+cnSyjO29jwtBiHKiQtxFHcJRlBRJjBwdw=;
        b=dKWxZDzYmEUa9edVsRE7KRJyo/qDE99gKwY4SH5GppiMb1TecFFW/+G8MrWbHHFDX8
         0QdGcPnpPLWag2xYnWZYykpO8+LY/Y2p/vF4q8UG72M1b+8knZNM6ZiIaP+NwtvuVrxo
         x0RDNGFuZtVboQkf2mQTPWfq3K5f7Kq4sozM1Q4UuHMR9JeCR/fYr8VqfM8MaWkRck1A
         yFXXLDMAPFMtQhoeWT68EvgZkGndDZT92ir9bPvnQ4WLVhkSvTE6gSvZdIVvQ3oHA9x6
         5ECJXWyaP1x7nFB72QVcpChxMPrXbO5Znyj/Iq3zODIvawXW1zQYek8zYrw5PqWBmCB1
         SUGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUbWOcjr;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-794769863d2si5153885a.644.2024.05.20.06.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUbWOcjr;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716213557;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/2cXgJlqem1GpJTLgOvNgLkMQei9LGhhfTBhbVymVM=;
	b=FUbWOcjrHx+OEuaBFUulKlySEjhXoetScq3oe1TE9QpBGKyPoclEX/02ZDKEGNmgANdzwb
	jh/Ol+VndjvRm/pVZvPjvFTB8k0wNs6n0AXCxBuNd7WQTaWZue1T7Q1X8HP71eT8r5/uBw
	n7V82zt8vQ75PVWzB4kZHbYFwr6Fh9I=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-7k_GlladP0uAGRqC0_M94w-1; Mon, 20 May 2024 09:59:14 -0400
X-MC-Unique: 7k_GlladP0uAGRqC0_M94w-1
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-de0b4063e59so10519745276.3
        for <alex.bennee@linaro.org>; Mon, 20 May 2024 06:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716213554; x=1716818354;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/2cXgJlqem1GpJTLgOvNgLkMQei9LGhhfTBhbVymVM=;
        b=fpUJ8dJlE/ddEa7YuMnXKt7N2LN8Zx1+IZ8Yx6KD+F62X5TBKYDwyNN8TrFwxsYvov
         W+agEyO6i2TDXZcyLLL8BSQq9+XEhrF3Hih5Ff+e+g8KPRqyGeT5EKsD1NaNalwXrzuO
         WUVd5WWr/1r2pESELohO5pYp0IYJBGTqdVhucpMg0htIOjn5xL2RLIHvzy4QXUPSdQmk
         lgAp+0LahWSSzs4YU14cxgu8SoL8YFhZOotk0IyUn6OnWsGtepK1dfslhGzRT7wNX8za
         6bCCe5qe9w5h+EYIKH6MOB0FlhqhgEk0hIn1lzSZYHeWqAWbzFmrHcdtlUTP4JCMqFoB
         +tTg==
X-Forwarded-Encrypted: i=1; AJvYcCXkvQDIPpFV1vqirVuhhoIe8+biibQI7jJNdS0awIMErgWL9mHtbxUEB7D00QXG0kLGevviFMms3POkhxkh8sA6+yf2VBDk
X-Gm-Message-State: AOJu0YwIEVW/mSgTuMQ1mdyFMaobqvtnAciyJyP3lHpBqeD3BN3IRVFL
	Bw3Wj/xcaalabAnAoXHr7Xh8KDvk66dcvUWjI2PR9PEwr1UMm84u4ik+yLgAZ8KY24MXdmMLUW6
	WpfTFLO3vY6NkaxsUR2ipS8lwkIlGsvzElK9zHli72tjzK1ASegmsBg==
X-Received: by 2002:a25:d68d:0:b0:df4:43f6:5b75 with SMTP id 3f1490d57ef6-df443f65dd6mr16503945276.24.1716213553661;
        Mon, 20 May 2024 06:59:13 -0700 (PDT)
X-Received: by 2002:a25:d68d:0:b0:df4:43f6:5b75 with SMTP id 3f1490d57ef6-df443f65dd6mr16503926276.24.1716213553254;
        Mon, 20 May 2024 06:59:13 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df550c10fsm148338501cf.43.2024.05.20.06.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 06:59:12 -0700 (PDT)
Message-ID: <d254ae5a-baf9-49c6-a28c-fe7313a45311@redhat.com>
Date: Mon, 20 May 2024 15:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 16/18] hw/arm/smmu: Refactor SMMU OAS
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-17-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-17-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: yadqCNh0CHBD

Hi Mostafa,
On 4/29/24 05:24, Mostafa Saleh wrote:
> SMMUv3 OAS is hardcoded to 44 bits, for nested configurations that
is currently hardcoded in the code.
> can be a problem as stage-2 might be shared with the CPU which might
> have different PARANGE, and according to SMMU manual ARM IHI 0070F.b:
>     6.3.6 SMMU_IDR5, OAS must match the system physical address size.
>
> This patch doesn't change the SMMU OAS, but refactors the code to
> make it easier to do that:
> - Rely everywhere on IDR5 for reading OAS instead of using the macro so
instead of using the SMMU_IDR5_OAS macro.
Also add additional checks when OAS is greater than 48bits
>   it is easier just change IDR5 and it propagages correctly.
> - Remove unused functions/macros: pa_range/MAX_PA
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c     |  7 ++++---
>  hw/arm/smmuv3-internal.h | 13 -------------
>  hw/arm/smmuv3.c          | 35 ++++++++++++++++++++++++++++-------
>  3 files changed, 32 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 3ed0be05ef..b559878aef 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -434,7 +434,8 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>      inputsize = 64 - tt->tsz;
>      level = 4 - (inputsize - 4) / stride;
>      indexmask = VMSA_IDXMSK(inputsize, stride, level);
> -    baseaddr = extract64(tt->ttb, 0, 48);
> +
> +    baseaddr = extract64(tt->ttb, 0, cfg->oas);
>      baseaddr &= ~indexmask;
>  
>      while (level < VMSA_LEVELS) {
> @@ -557,8 +558,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>       * Get the ttb from concatenated structure.
>       * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
>       */
> -    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride)
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
> index 8a11e41144..4ac818cf7a 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -408,10 +408,10 @@ static bool s2t0sz_valid(SMMUTransCfg *cfg)
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
> @@ -432,8 +432,11 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
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
> @@ -466,7 +469,15 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
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
> @@ -542,6 +553,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
>  {
>      uint32_t config;
> +    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
>      int ret;
>  
>      if (!STE_VALID(ste)) {
> @@ -585,8 +597,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
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
> @@ -712,6 +724,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>      int i;
>      SMMUTranslationStatus status;
>      SMMUTLBEntry *entry;
> +    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
>  
>      if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
>          goto bad_cd;
> @@ -730,7 +743,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>      cfg->aa64 = true;
>  
>      cfg->oas = oas2bits(CD_IPS(cd));
> -    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
> +    cfg->oas = MIN(oas2bits(oas), cfg->oas);
>      cfg->tbi = CD_TBI(cd);
>      cfg->asid = CD_ASID(cd);
>      cfg->affd = CD_AFFD(cd);
> @@ -759,6 +772,14 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

Eric
