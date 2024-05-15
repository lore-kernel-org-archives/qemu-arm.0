Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp662778ejl;
        Wed, 15 May 2024 06:48:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUStpqMDXrjaW00twL5cDdQHE36uxcon0pyV39RJiUfoup/pPjoAEugshSKtTasO/tFFsjcyEaJT/CieitX2K4yrFSxpTbG
X-Google-Smtp-Source: AGHT+IGeHgxVWXKPx2d7hdE2XO6q/DSpsVzARC3lc0wXUOaj2FE4yayxSRw2LRtMCcJqCR0pVrbz
X-Received: by 2002:a05:6870:d69c:b0:232:f9da:5cf3 with SMTP id 586e51a60fabf-24172a77b3dmr17400053fac.15.1715780892678;
        Wed, 15 May 2024 06:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715780892; cv=none;
        d=google.com; s=arc-20160816;
        b=vEkTgq5//Ft133iESwcLM+InPapf1cN+0EYcUTcAxPvXwR4s2FgSIS22GHSsrSAY7v
         jlXtyVBje4Bx2msh9UAKKRajuZTBRGHI/WPKsp9s6ntswWsK648PAc96+NyoLd4Llfpr
         q/iBvgxXPoKR11IaD5a+3Ocy8+6636DMk6sRcaisqn8QoWpQgTIi/gZO40+SF38BGndx
         sv4v/kL24qoz0Yi2pqQiEPSDs9AO8S9Eqskxe0eVJeBNwBLU2d72/cH3sgWbQEmI41tt
         F9SaDbuDgtU6qIDyHB/MOsjSudI4Lvn8gSFWcq1rb7IzzpTyosI/BpxzrajlRgXdEAir
         BkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=yN/W4znmh25KeMkw0tN9v+vwAvSt9Dl+q3bnDyXcLEo=;
        fh=MZq+jrRvL0VxnEZgu1R+P8tQ3CkybJP6oPLPMEBWKOk=;
        b=ERPwIoQK7oUirzMYer2A+FLbyMwWzUV13CjTtAvixdta9HttAS68Lr2A0sRi147kjI
         ScA4c7A9SAFK4B49xb+4OJ0H0BzQZ14u2EiAjvTHZu9XXOxJFUBg0RNUdlf7lKBDyxyT
         H3+d+iq2lFai2sXfqLLo1U9QzmzM5VxbF1f+N2iRFZ5U5XeAJbnIZJORG0UOKVbI/RSd
         tdB1QAbqzH/0rJWWYT9pMVEU2l0/oAZMirN2xGkXHO0bm+cJ5TJBRoe+NwyMGPaGFmUx
         jxqc7pUVJHG+FQ/xsY4fM6Da7FfD/axVTebRTPJwKnGFBUbGh5y7c7kY/1Nmo9d4Uq/x
         EceQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DfqX38H8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-792bf30ab6esi1398393185a.295.2024.05.15.06.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DfqX38H8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715780892;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yN/W4znmh25KeMkw0tN9v+vwAvSt9Dl+q3bnDyXcLEo=;
	b=DfqX38H8F2rH6axmts/fbOvjgKJYrc5mEy9GWInHWSCQB7jxE+mOW1Kcd1mnX32XsubsPX
	fjB1wKMfOPYELtdKeoQ93c7boSK22yS94a/OUwwARGT1K814EFm5qLuZ55xrwf1ZQCIlMX
	QLHpE97bHCg5vcCs+N0jDQHf/pEn/Wo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-gbv-zq3LNuu_wYEgnW2JPg-1; Wed, 15 May 2024 09:48:11 -0400
X-MC-Unique: gbv-zq3LNuu_wYEgnW2JPg-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-62079696c58so118591447b3.0
        for <alex.bennee@linaro.org>; Wed, 15 May 2024 06:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780890; x=1716385690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yN/W4znmh25KeMkw0tN9v+vwAvSt9Dl+q3bnDyXcLEo=;
        b=o+az1xhOhZqUad25ViLoG/23Jp72AbwQ0YmCSeSGSexBuJd1ZcUXiQa0oEabgBLNe8
         /RBh3jaQncxdFvnlIb4yx/9xYg7OkAKZSA3LyXWW7xWgsIwqgQ2f6ZaZpABjVujUz5FR
         WkRQrNI6zj16jqjEckh0ZvTbHxTb8oYEi1yBIUQfARi0NSREM7/7IeTHyKr8wt0PMnOa
         R7p7/KC90WXsVqEz2mjk2e5EsneLvipUMiYW2OysVRJavpszP2KJ26bTrrJ0YjsaP7K7
         9MNHCi7yJsKVDR6c7VDCGvvnylI0jVncGXDJ7LO7bQzKZW2cVNJBlcnMxMVx68CixTzQ
         4TdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuyPTAkdd6r/5q/3JyI7bWCQwxr6Rj9gRvmzLmfC812Cb9gh0zkJNsajRv+LOr+uf8WM6RalouTUcgZNAGP2tP1vM/bwux
X-Gm-Message-State: AOJu0Yz2KbMiXRLzwffv0FlMCvivkJD9K6L+Ota5P0ZuYOzypAeQvdyM
	FtaHy10Ao7nDZfEtAmpMr4G5MpqJszRRsPGMmTOHwu8VEviXI9xlwxQxKO2LhB8CwBZFnjLKg2E
	h5PfMCTRQIw+glecjZuMxQnimRFwXnRJJ59VuS/mnsu+7kGgTbdo+aQ==
X-Received: by 2002:a05:690c:4382:b0:618:79f5:8d32 with SMTP id 00721157ae682-622b0164185mr115967217b3.48.1715780890218;
        Wed, 15 May 2024 06:48:10 -0700 (PDT)
X-Received: by 2002:a05:690c:4382:b0:618:79f5:8d32 with SMTP id 00721157ae682-622b0164185mr115966947b3.48.1715780889669;
        Wed, 15 May 2024 06:48:09 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e0d56dce5sm54520001cf.58.2024.05.15.06.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 06:48:09 -0700 (PDT)
Message-ID: <dc8d52ac-68af-4426-9a60-07ad909c86b0@redhat.com>
Date: Wed, 15 May 2024 15:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 08/18] hw/arm/smmu-common: Add support for nested
 TLB
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-9-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-9-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BWqRXsJ/OGWb

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
> This patch adds support for nested(combined) TLB entries.
space between nested and (.
> The main function combine_tlb() is not used here but in the next
> patches, but to simplify the patches it is introduced first.
>
> Main changes:
> 1) New entry added in the TLB, parent_perm, for nested TLB, holds the
s/entry/field, s/TLB/SMMUTLBEntry struct
>    stage-2 permission, this can be used to know the origin of a
>    permission fault from a cached entry as caching the “and” of the
>    permissions loses this information.
>
>    SMMUPTWEventInfo is used to hold information about PTW faults so
>    the event can be populated, the value of stage (which maps to S2
>    in the event) used to be set based on the current stage for TLB
I don't understand "(which maps to S2 in the event)". What do you mean?
This could be S1 or S2 depending on the active stage, no?
>    permission faults, however with the parent_perm, it is now set
>    based on which perm has the missing permission
>
>    When nesting is not enabled it has the same value as perm which
>    doesn't change the logic.
>
> 2) As combined TLB implementation is used, the combination logic
>    chooses:
>    - tg and level from the entry which has the smallest addr_mask.
tbh I am scared bout swapping s1/s2 tg and level. In smmu_iotlb_lookup()
I see tt->granule_sz being used which is s1 data. I mean it is not
obvious to me this is correct. Could you maybe give more explanations
detailing why/how this is guaranted to work.

Can you give additional details about what s1+s2 combinations were tested?
>    - Based on that the iova that would be cached is recalculated.
>    - Translated_addr is chosen from stage-2.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 32 ++++++++++++++++++++++++++++----
>  include/hw/arm/smmu-common.h |  1 +
>  2 files changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 21982621c0..0d6945fa54 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -394,7 +394,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = iova & ~mask;
>          tlbe->entry.addr_mask = mask;
> -        tlbe->entry.perm = PTE_AP_TO_PERM(ap);
> +        tlbe->parent_perm = tlbe->entry.perm = PTE_AP_TO_PERM(ap);
nit: I would prefer on separate lines.
>          tlbe->level = level;
>          tlbe->granule = granule_sz;
>          return 0;
> @@ -515,7 +515,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = ipa & ~mask;
>          tlbe->entry.addr_mask = mask;
> -        tlbe->entry.perm = s2ap;
> +        tlbe->parent_perm = tlbe->entry.perm = s2ap;
>          tlbe->level = level;
>          tlbe->granule = granule_sz;
>          return 0;
> @@ -530,6 +530,27 @@ error:
>      return -EINVAL;
>  }
>  
> +/* combine 2 TLB entries and return in tlbe in nested config. */
suggestion: combine S1 and S2 TLB entries into a single entry. As a
result the S1 entry is overriden with combined data.
> +static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
> +                                                SMMUTLBEntry *tlbe_s2,
> +                                                dma_addr_t iova,
> +                                                SMMUTransCfg *cfg)
> +{
> +    if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
> +        tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
> +        tlbe->granule = tlbe_s2->granule;
> +        tlbe->level = tlbe_s2->level;
> +    }
> +
> +    tlbe->entry.translated_addr = CACHED_ENTRY_TO_ADDR(tlbe_s2,
> +                                    tlbe->entry.translated_addr);
> +
> +    tlbe->entry.iova = iova & ~tlbe->entry.addr_mask;
> +    /* parent_perm has s2 perm while perm has s1 perm. */

 suggestion: while perm keeps s1 perm.

> +    tlbe->parent_perm = tlbe_s2->entry.perm;
> +    return;
> +}
> +
>  /**
>   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
>   *
> @@ -607,9 +628,12 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>  
>      cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
>      if (cached_entry) {
> -        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
> +        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm &
> +            cached_entry->parent_perm & IOMMU_WO)) {
>              info->type = SMMU_PTW_ERR_PERMISSION;
> -            info->stage = cfg->stage;
> +            info->stage = !(cached_entry->entry.perm & IOMMU_WO) ?
> +                          SMMU_STAGE_1 :
> +                          SMMU_STAGE_2;
>              return NULL;
>          }
>          return cached_entry;
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 09d3b9e734..1db566d451 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -77,6 +77,7 @@ typedef struct SMMUTLBEntry {
>      IOMMUTLBEntry entry;
>      uint8_t level;
>      uint8_t granule;
> +    IOMMUAccessFlags parent_perm;
>  } SMMUTLBEntry;
>  
>  /* Stage-2 configuration. */
Thanks

Eric
