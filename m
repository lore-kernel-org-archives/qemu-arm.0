Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp784696njb;
        Thu, 4 Jul 2024 11:32:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaCHC1oszHU7mGqWuBcxgHmB65Pgyc1NnUjlglV4GMPWPq0e1FlfU24W74/E7FZvFrPWCRjQuUb4ivVUFF9Nx2B18Et1uU
X-Received: by 2002:a05:600c:4205:b0:424:9023:a7f1 with SMTP id 5b1f17b1804b1-4264a456308mr17330835e9.25.1720117944020;
        Thu, 04 Jul 2024 11:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720117944; cv=none;
        d=google.com; s=arc-20160816;
        b=vgugTXiLQqHiaoWItnc2mAmQ3arzrVMMnRyfTyHCQ53rWlTlucnr5WPxjBwXo5sCVx
         ZACAPja4QIc+NoT8KVSW8B45a652FB7+UpgJ0kOdAXr4jCXF/SUJgv5imFI+czwqGmgM
         sLs9JXPwUc+Tj2ULO4pyhteEdAop5VPz9N6nJIjekmb4J4dmchEwvrpUjVTyb/OFJoY3
         dOVk9GhZQJ4xqc3oUr+hnz31wTfGKZjQ2YJ9vQlG2okEE7wP1fOAdExvro8kq1zOdRum
         /lQtRt6fCoS1pOCxDBggkkJAFJXjikVglIWIxAJu5XRPLNZJlX2DdKbBcSQgkdH6wCC1
         22Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7TOCBq5LD8HAiR5C6PVsdvrLvb43CV73KIzSvyIMYDc=;
        fh=EKRdpjMMYD/Nfr8qK1FqY27siQvO+qqTxfpd6Ryz43w=;
        b=ZrKONWM9Esfpb7xmMgbTQnzlVaalOLY9F8q8HybxtojtRQNpLGIkvpQeKu52jfmg6f
         eGGs1bzCrbw6LQOKwERHRJB8oE0no/PG3cYBq2gxO4dftUdqoRgBIKY25W3VDppL/kna
         PaZS5exs+NcgOW6j6IA2BvT8syqFzTVAiLkwdVpkzPj2kWjI99wxuxS0ZetNtd5AMlmG
         TatXkMJeP/PGYjfcUjzYdBArJz8SFupZYxs2bg6eXsS6HqQ9fr6jNGSjd3tkoIWKC0Jb
         dfYJcL4lHfF92VBURbajRaDfdY60T2YPidsLnyeGh/NNbVutS+dhsCTjZZJiEoQv+IMZ
         iEug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/YllPK9";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-425654a8915sor47789245e9.6.2024.07.04.11.32.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/YllPK9";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720117943; x=1720722743; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7TOCBq5LD8HAiR5C6PVsdvrLvb43CV73KIzSvyIMYDc=;
        b=l/YllPK9mmwPAu96V3icrXUnk/Qz8ifKUhJmca5k3zQGlXYfElMGDYdrOpNVtfr9vu
         r7eD4oW263uzWpVYIwHHd2uFBn2Cao/x52CEHqG6Xg30k46iyZ1FUPDzAKIGeGRCmJGN
         T3jx64Tpdd4LRRA0AIMbnryQ3m0rnRFSNoP0zdk9f8qatxXEIkrq2MaUI2hY2nrP7FEd
         ltuaUTM9g0YScpdGS0ArNSIoQngj+4GIrNUPeBy5VpeJ6t1Yd36SmLydjNq+gLxjv4Zj
         vlSlq4LtXX89DAioYnPWKYVoxBNRIVDBkpOxcDB5ce/zhr1EMnjcQhloGf06E4sf0KxG
         pUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720117943; x=1720722743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TOCBq5LD8HAiR5C6PVsdvrLvb43CV73KIzSvyIMYDc=;
        b=Fd1EMGNecMb5H3FEFpbjjoS9ihHfmnWrXegQCeEtevPFUuDBnN5N9ZgUozlfdQuwvc
         wjUDJWkwjR9o/JaJHSsUr2Ib5w7QgHZAnRJV5fUpH05/6amTyygHItlhy6fOiPheruPu
         +QgsLskq8cgmbbhR+ofRLyVLnRVSq5XPdeJuJBLOpDXRtJZUgn/6n14C3iOYz61aQDc0
         Y539emja+aVVXjPgzB3jNAR37RLS9ij0Qlyt1j9qoIkhVWaLpjxp5QLn4vXEJMwicQzp
         ogmoMInTf2SBcD3dnUPcjWxn7a8WdwjF1F+ZQ/EPFCrfU3incOEs3zdt50HriKQtCBoe
         93Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXiOZlEYk5rX06yCBj9dBd7HkKSDpStBgPULIjK+6rfJXKp9KJaNp96xyWhfe3U1U33C/qVPShnCgA9Zj05iLwkWVv4qMVu
X-Gm-Message-State: AOJu0YwNBgjYsxcPPoilq6V8UKVCcdQlTOimDGar+yTsGWHBHk02n5bq
	KThU3DIiQBpFww1aJR+injzHIm/hdyEHg8YEmXMH3peNItIK19iXoERnCfCKRdCqaw==
X-Google-Smtp-Source: AGHT+IGaHWUkZN74ZL0dcLxAa3LPmFWkrCi3Q1+pUxT1pvQRQxVtmPpImcCotXYB0QVRGpPAz8u1Pg==
X-Received: by 2002:a05:600c:3388:b0:425:796b:3813 with SMTP id 5b1f17b1804b1-4264a456313mr15371245e9.28.1720117943439;
        Thu, 04 Jul 2024 11:32:23 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f2391sm33787885e9.25.2024.07.04.11.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:32:23 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:32:36 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 12/19] hw/arm/smmu: Support nesting in
 smmuv3_range_inval()
Message-ID: <20240704183236.GI1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-13-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-13-smostafa@google.com>
X-TUID: mJCvswcrVEKo

On Mon, Jul 01, 2024 at 11:02:34AM +0000, Mostafa Saleh wrote:
> With nesting, we would need to invalidate IPAs without
> over-invalidating stage-1 IOVAs. This can be done by
> distinguishing IPAs in the TLBs by having ASID=-1.
> To achieve that, rework the invalidation for IPAs to have a
> separate function, while for IOVA invalidation ASID=-1 means
> invalidate for all ASIDs.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 47 ++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3.c              | 23 ++++++++++++------
>  hw/arm/trace-events          |  2 +-
>  include/hw/arm/smmu-common.h |  3 ++-
>  4 files changed, 66 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 71afd486ba..5bf9eadeff 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -195,6 +195,25 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
>             ((entry->iova & ~info->mask) == info->iova);
>  }
>  
> +static gboolean smmu_hash_remove_by_vmid_ipa(gpointer key, gpointer value,
> +                                             gpointer user_data)
> +{
> +    SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
> +    IOMMUTLBEntry *entry = &iter->entry;
> +    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
> +    SMMUIOTLBKey iotlb_key = *(SMMUIOTLBKey *)key;
> +
> +    if (info->asid >= 0) {

Should this test SMMU_IOTLB_ASID(iotlb_key) instead?

> +        /* This is a stage-1 address. */
> +        return false;
> +    }
> +    if (info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
> +        return false;
> +    }
> +    return ((info->iova & ~entry->addr_mask) == entry->iova) ||
> +           ((entry->iova & ~info->mask) == info->iova);
> +}
> +
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
> @@ -223,6 +242,34 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                                  &info);
>  }
>  
> +/*
> + * Similar to smmu_iotlb_inv_iova(), but for Stage-2, ASID is always -1,
> + * in Stage-1 invalidation ASID = -1, means don't care.
> + */
> +void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
> +                        uint64_t num_pages, uint8_t ttl)
> +{
> +    uint8_t granule = tg ? tg * 2 + 10 : 12;
> +    int asid = -1;
> +
> +   if (ttl && (num_pages == 1)) {
> +        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, ipa, tg, ttl);
> +
> +        if (g_hash_table_remove(s->iotlb, &key)) {
> +            return;
> +        }
> +    }
> +
> +    SMMUIOTLBPageInvInfo info = {
> +        .iova = ipa,
> +        .vmid = vmid,
> +        .mask = (num_pages * 1 << granule) - 1};

Since multiplication takes precedence over shift this looks strange.
We could just remove "* 1" here and in smmu_iotlb_inv_iova() to avoid the
confusion?

Thanks,
Jean

> +
> +    g_hash_table_foreach_remove(s->iotlb,
> +                                smmu_hash_remove_by_vmid_ipa,
> +                                &info);
> +}
> +
>  void smmu_iotlb_inv_asid(SMMUState *s, int asid)
>  {
>      trace_smmu_iotlb_inv_asid(asid);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 86f95c1e40..e5ecd93258 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1136,7 +1136,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
>      }
>  }
>  
> -static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
> +static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
>  {
>      dma_addr_t end, addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
> @@ -1161,9 +1161,13 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
>      }
>  
>      if (!tg) {
> -        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
> +        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
>          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
> -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
> +        if (stage == SMMU_STAGE_1) {
> +            smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
> +        } else {
> +            smmu_iotlb_inv_ipa(s, vmid, addr, tg, 1, ttl);
> +        }
>          return;
>      }
>  
> @@ -1179,9 +1183,14 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
>          uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
>  
>          num_pages = (mask + 1) >> granule;
> -        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> +        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages,
> +                                 ttl, leaf, stage);
>          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
> -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
> +        if (stage == SMMU_STAGE_1) {
> +            smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
> +        } else {
> +            smmu_iotlb_inv_ipa(s, vmid, addr, tg, num_pages, ttl);
> +        }
>          addr += mask + 1;
>      }
>  }
> @@ -1340,7 +1349,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>                  cmd_error = SMMU_CERROR_ILL;
>                  break;
>              }
> -            smmuv3_range_inval(bs, &cmd);
> +            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
>              break;
>          case SMMU_CMD_TLBI_S12_VMALL:
>          {
> @@ -1365,7 +1374,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>               * As currently only either s1 or s2 are supported
>               * we can reuse same function for s2.
>               */
> -            smmuv3_range_inval(bs, &cmd);
> +            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_2);
>              break;
>          case SMMU_CMD_TLBI_EL3_ALL:
>          case SMMU_CMD_TLBI_EL3_VA:
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 09ccd39548..7d9c1703da 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -46,7 +46,7 @@ smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
>  smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
>  smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
>  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> -smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
> +smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
>  smmuv3_cmdq_tlbi_nh(void) ""
>  smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=%d"
>  smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index cf0fd3ec74..de032fdfd1 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -216,7 +216,8 @@ void smmu_iotlb_inv_asid(SMMUState *s, int asid);
>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
> -
> +void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
> +                        uint64_t num_pages, uint8_t ttl);
>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
>  void smmu_inv_notifiers_all(SMMUState *s);
>  
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
