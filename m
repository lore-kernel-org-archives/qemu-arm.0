Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp783956njb;
        Thu, 4 Jul 2024 11:30:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrDF8a0A1A4e9Y+9NRuGvOBg9uyi4HsQVgr8f99BnCepkv2R1e7THXWEGhnIU2LtAhYDedHUK0Y4bsZcLKtSgqcpUuSiZZ
X-Received: by 2002:a05:600c:6d5:b0:424:a5df:b998 with SMTP id 5b1f17b1804b1-4264a3d1d2bmr17718685e9.9.1720117858258;
        Thu, 04 Jul 2024 11:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720117858; cv=none;
        d=google.com; s=arc-20160816;
        b=ypcv0uDaTc1/MZgq82z8rs5dtPcrPR1TfSVmTkz/nJw3nsPb3Lfz1+pyBtLNFDKDXY
         bC40rPw1YjbLqMC2AEp1aRZhPIywSvAwiLKQINU1OVdqjs4qqrddXwFeOqMz5N6gTtEw
         BKC8zStSUFbNBPf6c7D+hn47oFDkO5RvZFEt1WbGlib8Xg3ZWdCycFfzULeswDdMCnKR
         AqnYMB0W+4Ojcz9pZoniACibYvvAj44Clg6BnkxUcGZNQ6EhzChTQVnAE0KsBxAdZqsO
         aioC9nMSt8dvyCpR8Yml6gV1jwhDAP3Y6mCTgfC5STLRHh/ECMibsc6eReIQXvidMj8N
         06zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=kBz6wkB7tMJYy0wPftLZ4Ulgjae0KVvXGdcfYoc+8Eg=;
        fh=QA0ezY7L2eSxjeVvcYWGvSSqx7rgyT+BOEEZbIGk6eI=;
        b=hv8qXhD7G794b7ChLqpYjdQVbtfXP3ilKDZZXwb6NubuG6T1+BvZ8IMZFDZXP0On3D
         pQoATvJ2TPAL2zWSOUXk68hjsd11CUgzivOLlBVNzh7eSbLprS/ajTydUiBuSvqPgAGr
         eWffiDY5MNUG6r2f1XMCUTvYRjbF9Dz7HA4rpWy+75KiCjBRMoCKHf9qYUEcakd/zbMq
         F18XaN8hVICSstjlajAeb4Qyaq/EW6O5jmLQbCHAUx56ziiV/+voYviA6R9aptpwsJAO
         vLZ+WmT1SG/3GGCGGuPrbtMiHfJsb7apilf1GoRE75zrgsDFyZ+m52/cxiyzqUHUtwq3
         FdhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiZfV+HR;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-367a1bef3d6sor427066f8f.4.2024.07.04.11.30.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiZfV+HR;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720117858; x=1720722658; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBz6wkB7tMJYy0wPftLZ4Ulgjae0KVvXGdcfYoc+8Eg=;
        b=KiZfV+HRAWeAmwj2NzOcSuJ6adTVUuAI5pmJXwgoTTPYlDVxSK9rz9mVCPvbhYH9Gk
         x0rFDaA/JPU4ss1VwQUqP0b1OATGPEDK9RNdsBTEH46FckCWCyI4qrvhERbvN7UUW00l
         eyhQNmttb7qs4Qz62UVTuOgskOz91OEM0UZX9RQOItlYq/JyjjyJj3SXXHvNXhVJU6qo
         tn1pjI9hnZLklc5no07GEujt6JEO/blG4wIcQoQLXIYDRfQe1tBM6GRzO3L5YKVyb5tz
         D1bwVzzf3Ual5I+/ST7gsj5CuTnmgyIJERJOrRz+rJ+nPLwx/QJR79QGnkjYWvymglBz
         sv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720117858; x=1720722658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBz6wkB7tMJYy0wPftLZ4Ulgjae0KVvXGdcfYoc+8Eg=;
        b=dsx3WfZIK1oVjEhPKwr7Yu+/WE0pWcEI/yueOyeq2Vir5RiNrDskMIetsWK3nyWb5A
         ERRmS3FdWtOfRtqf8WhU0ZccYMU547pJz3EUjDCNkt1Gs+pv9O4GBp5Wv1vVjuHtH29J
         D4rSVNH0SqydhM/Q5jjq7nZuYTGG2fFLj4LJCcQjuV+W1R1gvqhFFWNzq3/Yo35JXTXl
         fJs80OrpXDnEfxIBmcRIEnqrfdycGZbTE7BDnoXOm8sfw5i5KvjIAuqnbRAMa9i+bOUF
         RKGRFdyFK1jBZ86Sc3LRrZx2F3gYngTj2A0VJdyzwaLHYs0dhFlyTd4HTliH/Ro3WCOM
         un8w==
X-Forwarded-Encrypted: i=1; AJvYcCWsU7mt/UIaYFEFLErDrzLJz+YQ5ZMUavIaeNgwCeiOlAyEeFsYWK+kaAO/vZ33cHZom7/F61rD0bdcdFI/nqrKSGKPFajy
X-Gm-Message-State: AOJu0YwBiZnZSv7lqGWk0qLvwDkG9ztjkPpSk8ZHjuhxIpz5QkTNQtT7
	6i+7W7bqxkbflNkt2JDq6OS3s10fyDtE1Rg9o9rOgS3jwJKKmhK9jhoxzoMFoWIxZA==
X-Google-Smtp-Source: AGHT+IGk1rcRfobvCyz8ROSlgmGUT3lBfb91NhA3zH7UjjfwAbcYNb5Br5rKmV8SKHwTnTjqWRlm+w==
X-Received: by 2002:a05:6000:124d:b0:362:fc59:1ff5 with SMTP id ffacd0b85a97d-3679dd73891mr2021105f8f.59.1720117857623;
        Thu, 04 Jul 2024 11:30:57 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a3b1e523sm853610f8f.53.2024.07.04.11.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:30:57 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:31:10 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 11/19] hw/arm/smmu-common: Support nested translation
Message-ID: <20240704183110.GH1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-12-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-12-smostafa@google.com>
X-TUID: Ti64iZbUT7nG

On Mon, Jul 01, 2024 at 11:02:33AM +0000, Mostafa Saleh wrote:
> When nested translation is requested, do the following:
> 
> - Translate stage-1 table address IPA into PA through stage-2.
> - Translate stage-1 table walk output (IPA) through stage-2.
> - Create a single TLB entry from stage-1 and stage-2 translations
>   using logic introduced before.
> 
> For stage-1 table translation, the spec (ARM IHI 0070 F.b) says in:
>     7.3.12 F_WALK_EABT:
>         Translation of an IPA for Stage 1 descriptor fetch:
> 	S2 == 1 (stage 2), CLASS == T
> So, F_WALK_EABT is used which propagtes to CLASS == TT.

I don't think the text applies to this case, the context is:

	A stage 2 table walk can encounter EABT accessing the physical
	address of a stage 2 descriptor, because of a:
	[...]
	* Translation of an IPA for Stage 1 descriptor fetch

So EABT is when failing to load the stage 2 descriptor. I can't find
exact text for this case but looking at the flowchart 15.5, I think
this should be F_TRANSLATION/F_ADDR_SIZE/F_PERMISSION/F_ACCESS with
CLASS=TT and S2.

Thanks,
Jean

> 
> smmu_ptw() has a new argument SMMUState which include the TLB as
> stage-1 table address can be cached in there.
> 
> Also in smmu_ptw() a separate path used for nesting to simplify the
> code, although some logic can be combined.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 72 +++++++++++++++++++++++++++++++-----
>  include/hw/arm/smmu-common.h |  2 +-
>  2 files changed, 64 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 24b7d09e2b..71afd486ba 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -318,6 +318,38 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>      return NULL;
>  }
>  
> +/* Translate stage-1 table address using stage-2 page table. */
> +static inline int translate_table_addr_ipa(dma_addr_t *table_addr,
> +                                           SMMUTransCfg *cfg,
> +                                           SMMUPTWEventInfo *info,
> +                                           SMMUState *bs)
> +{
> +    dma_addr_t addr = *table_addr;
> +    SMMUTLBEntry *cached_entry;
> +    int asid;
> +
> +    /*
> +     * The translation table walks performed from TTB0 or TTB1 are always
> +     * performed in IPA space if stage 2 translations are enabled.
> +     */
> +    asid = cfg->asid;
> +    cfg->stage = SMMU_STAGE_2;
> +    cfg->asid = -1;
> +    cached_entry = smmu_translate(bs, cfg, addr, IOMMU_RO, info);
> +    cfg->asid = asid;
> +    cfg->stage = SMMU_NESTED;
> +
> +    if (cached_entry) {
> +        *table_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
> +        return 0;
> +    }
> +
> +    info->stage = SMMU_STAGE_2;
> +    info->type = SMMU_PTW_ERR_WALK_EABT;
> +    info->addr = addr;
> +    return -EINVAL;
> +}
> +
>  /**
>   * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
>   * @cfg: translation config
> @@ -333,7 +365,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>   */
>  static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>                            dma_addr_t iova, IOMMUAccessFlags perm,
> -                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
> +                          SMMUState *bs)
>  {
>      dma_addr_t baseaddr, indexmask;
>      SMMUStage stage = cfg->stage;
> @@ -381,6 +414,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>                  goto error;
>              }
>              baseaddr = get_table_pte_address(pte, granule_sz);
> +            if (cfg->stage == SMMU_NESTED) {
> +                if (translate_table_addr_ipa(&baseaddr, cfg, info, bs)) {
> +                    goto error;
> +                }
> +            }
>              level++;
>              continue;
>          } else if (is_page_pte(pte, level)) {
> @@ -568,10 +606,8 @@ error:
>   * combine S1 and S2 TLB entries into a single entry.
>   * As a result the S1 entry is overriden with combined data.
>   */
> -static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
> -                                                SMMUTLBEntry *tlbe_s2,
> -                                                dma_addr_t iova,
> -                                                SMMUTransCfg *cfg)
> +static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
> +                        dma_addr_t iova, SMMUTransCfg *cfg)
>  {
>      if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
>          tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
> @@ -596,14 +632,19 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
>   * @perm: tentative access type
>   * @tlbe: returned entry
>   * @info: ptw event handle
> + * @bs: smmu state which includes TLB instance
>   *
>   * return 0 on success
>   */
>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs)
>  {
> +    int ret;
> +    SMMUTLBEntry tlbe_s2;
> +    dma_addr_t ipa;
> +
>      if (cfg->stage == SMMU_STAGE_1) {
> -        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> +        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
>      } else if (cfg->stage == SMMU_STAGE_2) {
>          /*
>           * If bypassing stage 1(or unimplemented), the input address is passed
> @@ -621,7 +662,20 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>          return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
>      }
>  
> -    g_assert_not_reached();
> +    /* SMMU_NESTED. */
> +    ret = smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ipa = CACHED_ENTRY_TO_ADDR(tlbe, iova);
> +    ret = smmu_ptw_64_s2(cfg, ipa, perm, &tlbe_s2, info);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    combine_tlb(tlbe, &tlbe_s2, iova, cfg);
> +    return 0;
>  }
>  
>  SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> @@ -677,7 +731,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>      }
>  
>      cached_entry = g_new0(SMMUTLBEntry, 1);
> -    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info);
> +    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info, bs);
>      if (status) {
>              g_free(cached_entry);
>              return NULL;
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 1db566d451..cf0fd3ec74 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -185,7 +185,7 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>   * pair, according to @cfg translation config
>   */
>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
> +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs);
>  
>  
>  /*
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
