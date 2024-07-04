Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp775800njb;
        Thu, 4 Jul 2024 11:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7xRFPHuOx/9aBTD0lR371wkQkOQyHix2a+IvezXdDbe6SYuyZSwW+k8R83N08vU8kxO6krk4ChplJwXOqU47TQtqHVBpq
X-Received: by 2002:a7b:c84c:0:b0:424:f2b9:81f5 with SMTP id 5b1f17b1804b1-4264a3e18f6mr18020165e9.9.1720116794154;
        Thu, 04 Jul 2024 11:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720116794; cv=none;
        d=google.com; s=arc-20160816;
        b=mdQlTV+4Q3jJwDSB+KJCeonjSHxHbedl5lKvxIvJRYaH3XokG4PAe3YEHKZSnTTEEe
         xdTFB6dRxfLAlFa6x4dOTRj6kMc3aIPqgdPe3EEomkMR2UNSnjejWlucJEQ84Hkhht9h
         EMvK16KNYiAWUKVCULKSCxfxqs1v/cTHtelgAgz7DsG2IQRs9N9zQTOg4iPmk+SzZVpi
         fMazvhDFo4+XhNDBT76iMTAX9lVnlPkYkVbxEc18ZA2ZBRg87xtgPPzPZu2w0pKswM/+
         eESVWrTZARqK2jaJ15fqbPBBMJF7/rHaXy5EEp+lhmPviws/H882Iwuh9aAp4VSERJIM
         O+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=YW4wlSuOdKAVTH1hQaVXajuVHuYuIjCXdW92FIYm6MM=;
        fh=mclrRvwkyrBc0tCAYYJnZ09vTAZ2c0pLv1m7tmZG78k=;
        b=ip79b3qkm0FHwmKdRaw8vPQUxQWdOcSKBC4U2yEZn7CijkSeG+sgPyn9E+dZUgcuT3
         1b9dRc/OBWP7MlrHcESikq8cKJeymUdIJmb6OFzSOxKkW3eYbphJ9jnRTOS2PH9h+tOv
         Yz1VKnKz/MwFca/cBl5zG4maUhSvtwq7Lq9VdiEEhJjUdtP8sUOBQgAuvBWI9BMgL9Kk
         5u7uCDH4DUktTOuUPJFvru5Wm0pJQw/AQneoCPD0Rx8MK0HaTNhRGm+0qWUW3OpronzD
         DZre6X6uS97KWlgGVUQx3AQOwVkym2uywuFmYDGDoKFBVGpwkxZNSu5zmfRWounZXvsu
         +BOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EaPuDi0j;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42565615a49sor8055425e9.8.2024.07.04.11.13.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EaPuDi0j;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720116793; x=1720721593; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YW4wlSuOdKAVTH1hQaVXajuVHuYuIjCXdW92FIYm6MM=;
        b=EaPuDi0jcCwi9JqDSq0rMVy+oEegSMvSnaZumOuj9lUJaZ4gW2W18gtYVtVjIn2fda
         CnRMSBOBGXSsPfsKYioyc66MMxLntSDJywvN2y4+fkX3IG6AOTbw8z7OGlRi9a4yvqf1
         pP88n/QDf67ozS465X4xog1PoJkLtVlP4TrOKRHNSgc2veOzBjwn3BoFK3YtRVut0zgE
         v4gqurawK4YNBi89V1a3ZlfUWJ6MAiOS1TC0nJot5UIKD6sbsbo/3x25yzHb5W3OrEoa
         TTGwjXmxjx1P2NSZiLy/QECKJuQTxzYCO/YhqtS+IWjkKU7Qi8bQOCX6izBI7wOlQgcD
         nfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720116793; x=1720721593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YW4wlSuOdKAVTH1hQaVXajuVHuYuIjCXdW92FIYm6MM=;
        b=Us7OVeX9cHbOeTzQItGAOdYGxpXHvAciVIvz3N3ly+Vn5BxNK3OeIevDpC4TnskRYq
         LVKJca4WJrNEp0oAEwZ/Ii0wqLfR3rLaTK0VUsTrgH2PrfxBF5tp5in7AMwQzKA+QcB8
         N+TZqXnGkQ3AeUNC82BbDIW12kcqbN4muwNDoxwM4TMzs4cPaCk9tGu5LcZOYTBlFpSY
         00Y5TfB3A4s73KmbhR4kAl6TQ2CVhRL5fRU2GoMqbWyTIjAp9VesGssg+9oKDQc/GRDU
         JxxVVRbvE3/dbou4/Jj2Rfp/j6YT+A8zk6lud/f9GGYpgk5ttMYbthmnBfSUNUUSELSi
         q1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPROK1qJTJMZMc3NMowJX/igG4KbYbelCi0W+AJz19LH8IFqLfdZJtnFj0OqnIAoWOX4m4BbtpcRMwAS2pTIRgwE2CeOiI
X-Gm-Message-State: AOJu0YxIXTfmny9EkMzIGURMDe9hpPrWEMYoggLYH4bTnkCJVvmfU5d4
	XQy+5EKdoYBASpt+OQvtNLZcQaoENJCObUm7OtiiU4xzdPtm8gDn6g9yHji8U7ibFw==
X-Google-Smtp-Source: AGHT+IGnhknz3ZhTPYKEhVhVRHjuDrsZwdSjkP74rBnbaFPoSpIXQ622cWUCKEWmVeuP276irJI+/A==
X-Received: by 2002:a5d:4f05:0:b0:366:efa2:f2f7 with SMTP id ffacd0b85a97d-3679dd15b0emr1775871f8f.1.1720116793566;
        Thu, 04 Jul 2024 11:13:13 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36788e37b53sm7524064f8f.45.2024.07.04.11.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:13:13 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:13:26 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 10/19] hw/arm/smmu-common: Add support for nested TLB
Message-ID: <20240704181326.GG1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-11-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701110241.2005222-11-smostafa@google.com>
X-TUID: nb+VwpiP7Tfw

On Mon, Jul 01, 2024 at 11:02:32AM +0000, Mostafa Saleh wrote:
> This patch adds support for nested (combined) TLB entries.
> The main function combine_tlb() is not used here but in the next
> patches, but to simplify the patches it is introduced first.
> 
> Main changes:
> 1) New field added in the SMMUTLBEntry struct: parent_perm, for
>    nested TLB, holds the stage-2 permission, this can be used to know
>    the origin of a permission fault from a cached entry as caching
>    the “and” of the permissions loses this information.
> 
>    SMMUPTWEventInfo is used to hold information about PTW faults so
>    the event can be populated, the value of stage used to be set
>    based on the current stage for TLB permission faults, however
>    with the parent_perm, it is now set based on which perm has
>    the missing permission
> 
>    When nesting is not enabled it has the same value as perm which
>    doesn't change the logic.
> 
> 2) As combined TLB implementation is used, the combination logic
>    chooses:
>    - tg and level from the entry which has the smallest addr_mask.
>    - Based on that the iova that would be cached is recalculated.
>    - Translated_addr is chosen from stage-2.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  hw/arm/smmu-common.c         | 37 ++++++++++++++++++++++++++++++++----
>  include/hw/arm/smmu-common.h |  1 +
>  2 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 0840b5cffd..24b7d09e2b 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -426,7 +426,8 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = iova & ~mask;
>          tlbe->entry.addr_mask = mask;
> -        tlbe->entry.perm = PTE_AP_TO_PERM(ap);
> +        tlbe->parent_perm = PTE_AP_TO_PERM(ap);
> +        tlbe->entry.perm = tlbe->parent_perm;
>          tlbe->level = level;
>          tlbe->granule = granule_sz;
>          return 0;
> @@ -547,7 +548,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = ipa & ~mask;
>          tlbe->entry.addr_mask = mask;
> -        tlbe->entry.perm = s2ap;
> +        tlbe->parent_perm = s2ap;
> +        tlbe->entry.perm = tlbe->parent_perm;
>          tlbe->level = level;
>          tlbe->granule = granule_sz;
>          return 0;
> @@ -562,6 +564,30 @@ error:
>      return -EINVAL;
>  }
>  
> +/*
> + * combine S1 and S2 TLB entries into a single entry.
> + * As a result the S1 entry is overriden with combined data.
> + */
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
> +    /* parent_perm has s2 perm while perm keeps s1 perm. */
> +    tlbe->parent_perm = tlbe_s2->entry.perm;
> +    return;
> +}
> +
>  /**
>   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
>   *
> @@ -639,9 +665,12 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
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
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
