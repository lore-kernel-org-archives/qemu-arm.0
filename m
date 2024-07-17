Received: by 2002:a05:7022:1102:b0:84:b8cb:c71e with SMTP id ou2csp983104dlb;
        Wed, 17 Jul 2024 08:28:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWovdRJLPqboiLVtSIcrGRPVOmy5ZsmO65kCNndQfCRkMz0Ugs1HolIyuAjvzbvGz0FPqZTKMAJPrWPeyRT3wXH8QOybr2z
X-Google-Smtp-Source: AGHT+IEZNv6S5Qk7nSy0GGxer4JdHvBYO8LVO87hlO/85m0zN2FXuYr3TbxTY5/peYiHC/DEcJRB
X-Received: by 2002:a05:620a:25cd:b0:796:de79:f577 with SMTP id af79cd13be357-7a18da5b524mr1451585a.7.1721230090537;
        Wed, 17 Jul 2024 08:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721230090; cv=none;
        d=google.com; s=arc-20160816;
        b=RaJ/bwvQWOnwPN7Mt82v8w7vzEYAyyg9vqzkERjhLlpj8g3+03fWaXPxpLtWamTEzR
         ymhW/AjTxcSN4NMf1f0pCncxN92niY4poJTcdL6HNNEp2kf/ovyGnrit0w1H3VVVN+Mf
         9VbDUoIs/VGzLJGN7BpsXZxKRCuorGK+u9Ec7b+OnmjMzOlELh0bpGWX1UWGm8A4Zrig
         r/6i2E8KnJ0pdrPolXwYos40SgdO0toB9y6hQNaYcD2jnnhu1AhonYupfef9JOifv82a
         mKxftYrfV9WUsJCXt9qgdbJHJIaz8KJVdm7uhsmovqIESJEW9ECjvjM/wiWfEDuVLkiZ
         zJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Z3lTkBzj+LIVNyyWxcwo+WHox8RYeSSukUvm7LaVKhU=;
        fh=m6Gm3Uo3JAV3/VdGp6YHNU38qngAF6Ebosc6fGaKsNs=;
        b=qizsqQ1Y+LvpCGn2PSuZ5+Ew1IcM6ILkhr0K6pU5v+XU/urRApCKkF35M9R4oAR7re
         /nn7Tsv1kWHhAMwFQY1VLTyUQL1t3zxD6DsyFH/Vf0vF2V7OYrp3xz0759KHK+ewkiJY
         Qqqg/FYyJyGKuDzVX7+P4u/ukrKWbYirZldbshLWQ7YTNMSIfj0FD4xqKUDW6LoraA5f
         kV/CmsQfHpLSis5brCL7fWG4FM+Bvg82MS1TukyEt8oIqzbEJHMGjTkG3dakAg/US9wm
         +49N+Vl26tUdKpaUnFOXBKcNreOONemvXWUMHqglgsir1+jxwwX2A7W4uwPnjvME+OEW
         keXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HMkFYjVX;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c69a72si1014552585a.452.2024.07.17.08.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HMkFYjVX;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721230090;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3lTkBzj+LIVNyyWxcwo+WHox8RYeSSukUvm7LaVKhU=;
	b=HMkFYjVXbZXr0cbs7txnGjV3g2fFOY8IgSRyc19Db8taTJC9BDRJiW//Rl6GSibVbVB7FH
	k5q3POV0ZlhLRzhdsuiHZ5ZZx/tydzmbGG5gGQDZYCrDPD8g876YDn4evtuqqHFae/KwSP
	Mf3YclZ56b25coBk4m27OZlU2qTQn/8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-OyZd5HcyPbOqiOFpdetNdw-1; Wed, 17 Jul 2024 11:28:09 -0400
X-MC-Unique: OyZd5HcyPbOqiOFpdetNdw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-79efed0e796so198602085a.1
        for <alex.bennee@linaro.org>; Wed, 17 Jul 2024 08:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721230088; x=1721834888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3lTkBzj+LIVNyyWxcwo+WHox8RYeSSukUvm7LaVKhU=;
        b=LJHDN2Q/yGKvtj/NG7nxCBGl/S2O2P6rt/idTjVxEDIsUdMornekf8wjWJ6wD3xCUF
         +YNXCNrfoTv7+FE3vE1F2d767yK9RC7UzAovaIgxgY+DIMtJTr8AkonDpGOSBOmtdfP0
         FP/l/KTfCUe/BLjASAXZ2JffSSkY04cJ31vhjHv7Nk+F+Kd0tOCyAzihusxqANPaTR6X
         K1tJ+kyx+/IOsG3S24/4lM6VkLcGkG1fwNEsbznlTr4hxob4cDR/nZUX+cDL8FFYOW4n
         EPkOOdEIm/ATzKWZaKCjKQ2J1tnXWnjGT83G0XxCK8mWqgr/yy93A+Qz2/72sEbM3udx
         S4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYDvH6zuqytar2nxoi/XCvC0mlwlygZtSEa6TIA2y4vQuBDcaZqgNOmBvRahfdt029OWoxZuA8YeiihCYterBI++YeqYjR
X-Gm-Message-State: AOJu0YyAmvCCsOy35Km9nnoFYUhJ2h1h4+QcvlA9OmcYsyd7pJGez5v5
	WVjx2mwX87EoHQn9rUabbjnZ/RIzcekYw8H/ROzTlJQJnJAfGyNqE1F73F8olM/7PvYXMlA7P3m
	4Wy0nT6gG19tyzAOBOFlpDis/vG1eP4Iummz2/WO6APxe/cuMYQPS7Q==
X-Received: by 2002:a05:620a:2547:b0:79e:f932:7ca7 with SMTP id af79cd13be357-7a186eb69eamr364070285a.29.1721230088310;
        Wed, 17 Jul 2024 08:28:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:79e:f932:7ca7 with SMTP id af79cd13be357-7a186eb69eamr364065585a.29.1721230087911;
        Wed, 17 Jul 2024 08:28:07 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160b92ba7sm414925685a.27.2024.07.17.08.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 08:28:07 -0700 (PDT)
Message-ID: <da5e2061-14e2-43dc-aa9b-0eccf4abba26@redhat.com>
Date: Wed, 17 Jul 2024 17:28:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 09/18] hw/arm/smmu-common: Rework TLB lookup for
 nesting
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240715084519.1189624-10-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240715084519.1189624-10-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 73s64daN1m3o



On 7/15/24 10:45, Mostafa Saleh wrote:
> In the next patch, combine_tlb() will be added which combines 2 TLB
> entries into one for nested translations, which chooses the granule
> and level from the smallest entry.
>
> This means that with nested translation, an entry can be cached with
> the granule of stage-2 and not stage-1.
>
> However, currently, the lookup for an IOVA is done with input stage
> granule, which is stage-1 for nested configuration, which will not
> work with the above logic.
> This patch reworks lookup in that case, so it falls back to stage-2
> granule if no entry is found using stage-1 granule.
>
> Also, drop aligning the iova to avoid over-aligning in case the iova
> is cached with a smaller granule, the TLB lookup will align the iova
> anyway for each granule and level, and the page table walker doesn't
> consider the page offset bits.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric

> ---
>  hw/arm/smmu-common.c | 64 +++++++++++++++++++++++++++++---------------
>  1 file changed, 43 insertions(+), 21 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 21982621c0..f224e9c1e0 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -66,8 +66,10 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>      return key;
>  }
>  
> -SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> -                                SMMUTransTableInfo *tt, hwaddr iova)
> +static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
> +                                                  SMMUTransCfg *cfg,
> +                                                  SMMUTransTableInfo *tt,
> +                                                  hwaddr iova)
>  {
>      uint8_t tg = (tt->granule_sz - 10) / 2;
>      uint8_t inputsize = 64 - tt->tsz;
> @@ -88,6 +90,36 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>          }
>          level++;
>      }
> +    return entry;
> +}
> +
> +/**
> + * smmu_iotlb_lookup - Look up for a TLB entry.
> + * @bs: SMMU state which includes the TLB instance
> + * @cfg: Configuration of the translation
> + * @tt: Translation table info (granule and tsz)
> + * @iova: IOVA address to lookup
> + *
> + * returns a valid entry on success, otherwise NULL.
> + * In case of nested translation, tt can be updated to include
> + * the granule of the found entry as it might different from
> + * the IOVA granule.
> + */
> +SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> +                                SMMUTransTableInfo *tt, hwaddr iova)
> +{
> +    SMMUTLBEntry *entry = NULL;
> +
> +    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> +    /*
> +     * For nested translation also try the s2 granule, as the TLB will insert
> +     * it if the size of s2 tlb entry was smaller.
> +     */
> +    if (!entry && (cfg->stage == SMMU_NESTED) &&
> +        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
> +        tt->granule_sz = cfg->s2cfg.granule_sz;
> +        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> +    }
>  
>      if (entry) {
>          cfg->iotlb_hits++;
> @@ -569,18 +601,21 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>  SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>                               IOMMUAccessFlags flag, SMMUPTWEventInfo *info)
>  {
> -    uint64_t page_mask, aligned_addr;
>      SMMUTLBEntry *cached_entry = NULL;
>      SMMUTransTableInfo *tt;
>      int status;
>  
>      /*
> -     * Combined attributes used for TLB lookup, as only one stage is supported,
> -     * it will hold attributes based on the enabled stage.
> +     * Combined attributes used for TLB lookup, holds the attributes for
> +     * the input stage.
>       */
>      SMMUTransTableInfo tt_combined;
>  
> -    if (cfg->stage == SMMU_STAGE_1) {
> +    if (cfg->stage == SMMU_STAGE_2) {
> +        /* Stage2. */
> +        tt_combined.granule_sz = cfg->s2cfg.granule_sz;
> +        tt_combined.tsz = cfg->s2cfg.tsz;
> +    } else {
>          /* Select stage1 translation table. */
>          tt = select_tt(cfg, addr);
>          if (!tt) {
> @@ -590,22 +625,9 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>          }
>          tt_combined.granule_sz = tt->granule_sz;
>          tt_combined.tsz = tt->tsz;
> -
> -    } else {
> -        /* Stage2. */
> -        tt_combined.granule_sz = cfg->s2cfg.granule_sz;
> -        tt_combined.tsz = cfg->s2cfg.tsz;
>      }
>  
> -    /*
> -     * TLB lookup looks for granule and input size for a translation stage,
> -     * as only one stage is supported right now, choose the right values
> -     * from the configuration.
> -     */
> -    page_mask = (1ULL << tt_combined.granule_sz) - 1;
> -    aligned_addr = addr & ~page_mask;
> -
> -    cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
> +    cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, addr);
>      if (cached_entry) {
>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>              info->type = SMMU_PTW_ERR_PERMISSION;
> @@ -616,7 +638,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>      }
>  
>      cached_entry = g_new0(SMMUTLBEntry, 1);
> -    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info);
> +    status = smmu_ptw(cfg, addr, flag, cached_entry, info);
>      if (status) {
>              g_free(cached_entry);
>              return NULL;
