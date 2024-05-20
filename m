Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1331425ejb;
        Mon, 20 May 2024 02:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDosciQEg/IqNWwjOzOvIbAJ3D/8Sb9WOYJfsRsDq+aZGgy01Pe9Zh5k4eYAVttqF0A2DhRmnoHQWGOW56niXR0kC7mSEA
X-Google-Smtp-Source: AGHT+IGoiMCmL5dJUj6ygnohHp0viXpMJnBYw+f/FiM2/mD35NTvmNxwDGwLz0UeC5gyV520xeea
X-Received: by 2002:a05:620a:7294:b0:792:9d4c:6433 with SMTP id af79cd13be357-792c75f43b4mr2993966085a.51.1716198508808;
        Mon, 20 May 2024 02:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716198508; cv=none;
        d=google.com; s=arc-20160816;
        b=wO17xDvpCUJZapILWFofPbLBFtMmm9TPru3Oc9wyETLE4H9XZxRahm4JZ5tsKZLtyu
         c7CdltdiSC0Zzx0GFFTfc9+Erym3Kb/zFkmOxNYZRS2PBBQg7/WjEtBcTzfapix3CkDW
         QPaz1xbQERnQiecAMwePJi7ZVIF8kydx3sge09bl91uo6HtkxkxhFRYpKuvBg25A7wbR
         y2oB4aOL6hrmc56zmpTMmTVy9USpilkam5DK1Txbg+WbR9t8//Rt2DIcFgIq5rVuMuvk
         /er+lEhTAZ0PrPRyIwXoDRBqw29Z7aJc4j9tl9pWij+CKRjCB7oD/HRlOQaBqqcVWPS0
         v48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=UK/95iBmAg6EpTL6BggqtUeHWkOQSZit6swmc+zIvbo=;
        fh=4hcu3lqFccFKSli5ljToRacb1zV28BpyLVYpi1lihy4=;
        b=HEZjQklJK2MemGJv9FWyX8+++EmR6ip+be+r1EWaHp9RKP9qbmJlGJK3A5iNjUGjCt
         T2Ac1znAVgjqqCc6BTJY/ENHczGK8e7CUMuoiSTx7cLsIPOEMl+qN5XHk4QTnaWvv3i8
         u97MDLqGLT3vMkU3zWmbtiavcvxsJZGB9SFkFVFOCOYXzINJNjGbPlB3uZjB1OwIeEON
         GryTBQnMULDk9ZFVZGcp2jIqOfYjXo2lL7SNs7/0wG5EPhy0Rg6PZcfvg2cc91coSq5M
         ZiJz/h5Unvg16j9OqPy7m9LqiySSvLxbYLJBbwwT6Kb3aYwJJaEbNQmhNrDzCLMGLhkB
         m4KA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GdsJAAhV;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-792bf309968si296171885a.303.2024.05.20.02.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 02:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GdsJAAhV;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716198508;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UK/95iBmAg6EpTL6BggqtUeHWkOQSZit6swmc+zIvbo=;
	b=GdsJAAhVHDgFvsTUAM40W0rX5FVuLpjYc+QTCLP6c9LgJtSd4gVQ8oXBXzMNzJPFbxdGa+
	AzlKLi9rjXTU5vgRjDTpBWxJsz6+vYn3FwlChujI9v5R2Lxvhs3O+GXmelp/LG/gYqvcI/
	mTR02s3DBEpgHlL+N32MvMa/fDWBFSE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-S3n6mehBNmy-ybQv8dQ0og-1; Mon, 20 May 2024 05:48:25 -0400
X-MC-Unique: S3n6mehBNmy-ybQv8dQ0og-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6a975ff9193so17685776d6.2
        for <alex.bennee@linaro.org>; Mon, 20 May 2024 02:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716198505; x=1716803305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UK/95iBmAg6EpTL6BggqtUeHWkOQSZit6swmc+zIvbo=;
        b=JRJAJgvcMa261YEBmKmkKZD/v3V3dAOFjkP3ebukfAFllkogX6asI29ClnopMYrklk
         jfn8hdBzh67fGqc08zRoFklue6sw559eHZUO3A3IaEMFWW/Quu/0TNpa93NCWR2Ux4HP
         fCK9r8EP477rvaAJQ5FNaHZUGQaNKDM5pF57/nX8XfM5jML634uAgvKyVqQOjFmC8NXZ
         0fdytEDNKvEG35ale/AZ89ea6mBYKGeAQThFYt2ANaN+rtvwJnkFwSQqUWp8YyyxKUyz
         pB5vX0S4QpbE6UGWyMmPIhbXM/p8ZLce0JZmPhZlHWgNWUrYSBFvpK8iNPFfNbzWl+FO
         aznw==
X-Forwarded-Encrypted: i=1; AJvYcCWniuNXUcbRT1PhhMfMYNDMPGAEGa0T/UL9nYEWorFUsDaFH0GtPk1iqh7Qq4M35wPpKOzLxCFNKba10fx+TFZ48u3XZOWD
X-Gm-Message-State: AOJu0Yw++xswD8CjNOq5MWn0SQ8UgVRI5zCBC7ZNusbpeGTN2RnVIRDH
	AmFV4yEGiqVb9rkh5kE4EWc/P4SbXghqmp4JebOknFKUVymhiIuPQ5r+mgJ9l6y+WRWbaiVNBEH
	5sJKNEEHo8RuSlR9Pe0fxCoDlE0KMDMVWxu6Fl9NtwbFogJLi3Cij9g==
X-Received: by 2002:a05:6214:590b:b0:6a9:4917:7341 with SMTP id 6a1803df08f44-6a949177651mr54596196d6.18.1716198504672;
        Mon, 20 May 2024 02:48:24 -0700 (PDT)
X-Received: by 2002:a05:6214:590b:b0:6a9:4917:7341 with SMTP id 6a1803df08f44-6a949177651mr54596066d6.18.1716198504267;
        Mon, 20 May 2024 02:48:24 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ab6d76e124sm952916d6.46.2024.05.20.02.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 02:48:23 -0700 (PDT)
Message-ID: <770312ee-8093-431a-bfdf-b01ca90945cf@redhat.com>
Date: Mon, 20 May 2024 11:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 10/18] hw/arm/smmu-common: Support nested
 translation
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-11-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-11-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: qXOivUiPeIEc

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
> When nested translation is requested, do the following:
>
> - Translate stage-1 IPA using stage-2 to a physical address.
stage-1 table address IPA into PA through S2 stage

> - Translate stage-1 table walks using stage-2.
output of S1 stage (IPA) through S2.
> - Combine both to create a single TLB entry using the logic
>   introduced before.
this applies to second only. First one is associated with an S2 TLB
entry, right?
>
> For stage-1 table translation, the spec (ARM IHI 0070 F.b) says in:
>     7.3.12 F_WALK_EABT:
>         Translation of an IPA for Stage 1 descriptor fetch:
> 	S2 == 1 (stage 2), CLASS == T
> So, F_WALK_EABT is used which propagtes to CLASS == TT.
>
> smmu_ptw() has a new argument SMMUState which include the TLB as
> stage-1 table address can be cached in there.
>
> Also in smmu_ptw() a separate path used for nesting to simplify the
> code, although some logic can be combined.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 67 ++++++++++++++++++++++++++++++------
>  include/hw/arm/smmu-common.h |  2 +-
>  2 files changed, 58 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index c67af3bc6d..d48ec08947 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -306,6 +306,32 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>      return NULL;
>  }
>  
> +/* Translate stage-1 table address using stage-2 page table. */
> +static inline int translate_table_s1(dma_addr_t *table_addr, SMMUTransCfg *cfg,
> +                                     SMMUPTWEventInfo *info, SMMUState *bs)
would suggest translate_table_addr_ipa().
> +{
> +    dma_addr_t addr = *table_addr;
> +    SMMUTLBEntry *cached_entry;
> +    int asid;
> +
> +    asid = cfg->asid;
> +    cfg->stage = SMMU_STAGE_2;
> +    cfg->asid = -1;
> +    cached_entry = smmu_translate(bs, cfg, addr, IOMMU_RO, info);
so this is going to be cached as an S2 entry. Maybe worth adding a comment.
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
> @@ -321,7 +347,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>   */
>  static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>                            dma_addr_t iova, IOMMUAccessFlags perm,
> -                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
> +                          SMMUState *bs)
>  {
>      dma_addr_t baseaddr, indexmask;
>      SMMUStage stage = cfg->stage;
> @@ -369,6 +396,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>                  goto error;
>              }
>              baseaddr = get_table_pte_address(pte, granule_sz);
> +            if (cfg->stage == SMMU_NESTED) {
> +                if (translate_table_s1(&baseaddr, cfg, info, bs)) {
> +                    goto error;
> +                }
> +            }
>              level++;
>              continue;
>          } else if (is_page_pte(pte, level)) {
> @@ -551,10 +583,8 @@ error:
>  }
>  
>  /* combine 2 TLB entries and return in tlbe in nested config. */
> -static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
> -                                                SMMUTLBEntry *tlbe_s2,
> -                                                dma_addr_t iova,
> -                                                SMMUTransCfg *cfg)
> +static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
> +                        dma_addr_t iova, SMMUTransCfg *cfg)
>  {
>      if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
>          tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
> @@ -579,14 +609,19 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
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
> @@ -600,11 +635,23 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>              tlbe->entry.perm = IOMMU_NONE;
>              return -EINVAL;
>          }
> -
spurious line change
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
> @@ -660,7 +707,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
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
Thanks

Eric
