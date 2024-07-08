Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp912974dlb;
        Mon, 8 Jul 2024 08:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDSmwjFzRSyWaEz1T4JlkwXJ82LklzdodpoyFL2HkHXT+Ab70vlR0ovoGfJKdJEiVUQBrLsEqnZxLcNZSOB+JiKQq+jceh
X-Google-Smtp-Source: AGHT+IHpzl8cEaE082pEwnLIrbQI52x7WVLlJFu7acVLT//3yxfbAKdaxld5WPG+uz/lw3WNB6Cd
X-Received: by 2002:ac8:5d03:0:b0:446:5d83:732c with SMTP id d75a77b69052e-447cbf8ea42mr173586811cf.41.1720451191806;
        Mon, 08 Jul 2024 08:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720451191; cv=none;
        d=google.com; s=arc-20160816;
        b=T4yVd5+127HWvKruHFg7z1cd/UdUeTrF6L6SEgE2P6jg/Fs43vtdnh/zaRBkq0DPGM
         GzmzFFy7gDfdcBepltWvm/g0jRQvoX3JVCStvnJWhPtwbivo7UegssVrBCNFYxg53aFe
         stnuBc0YcZ/J3TLUgaA2M/z87ulRllCKqYva0m8AZi5LBxlb24vifo9yM0tFmg8gILqS
         0hB3eRly+X0Ax14lwtGTJrmiOPkhM+CyEQjkLUT7NlBEedjzAPgK5YggkLQC52hSQFGF
         2SyGRCycZyATd5xLPZobRkk1OuYMgifP3f5LYfqBwoh/8M9D4bdxdVEMvmAIaAygl+fW
         IAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=5fWBx2O4/T0rCdOxeNBt4ocg3FTts1GcdR6N3DCMmAw=;
        fh=gsR0jhdD9eI0ywJF6eQ7cwOLyinxFbGMaTiY1CBT0u0=;
        b=yDO3gxtWGQNi5lJr7PNy9tF2XXvPcrMiOjavQfIKsRi+Nx4o8MHMOCPEI9Q0ulcgGj
         QHPfQlosHF7qVG+8llwgaOOU3UG+kANQovIBJo67OaqFcNXVYooldM2rrAI2sar7fZzS
         83/7yd8DzigeuCpgcl0WqG9NpXq+VvOI1ZORaiyAmEGekUaxuJTlIPg+o0b3gxzyBgSt
         MyUJ2mRIpPk0gsPkp/fZrAxrG+MA5TfZJhsWwtFZYALYYPlmtIEObBqnPd6wMraVWW6V
         2irsJFnXS3PSzVHnMLJAANRx07eInptTsAIYFZaKk1xbprmKHva29u7sEWqYOX6d/E2e
         dmlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CZ+opVKM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9be89e7si651971cf.588.2024.07.08.08.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CZ+opVKM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720451191;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5fWBx2O4/T0rCdOxeNBt4ocg3FTts1GcdR6N3DCMmAw=;
	b=CZ+opVKM0H2Ig8ujldFUa+BTA03OdL9SSAgq0gXJIZ5VOESNJMhZu5hT+qsgSzKlt+5tA/
	tC9BUBnsBCPT01H90gEqwKRi9r9MpCEcWM26HVl7f2qNiOIS0SAHL0x7gDQZsd1iH+zk/I
	Fx5gKjhisSY9xTCbBW37YstEMCYFJjw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-AqVqYI5INWCIaDwAGkEVwA-1; Mon, 08 Jul 2024 11:06:29 -0400
X-MC-Unique: AqVqYI5INWCIaDwAGkEVwA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42668699453so11463625e9.3
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 08:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720451188; x=1721055988;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fWBx2O4/T0rCdOxeNBt4ocg3FTts1GcdR6N3DCMmAw=;
        b=WBP6S29+IQW109V8LmVTUTMwNeqNOMJCt6RqXNVSzYY+IvIokCEDIsknslV9VqdkaI
         IEWEvSuiyDpewMvls9ihZ9My25rgQ/4HZ3ro4kI1br4UUn6Yw6h79V+WqUW7yrkx7ST4
         e1OjKjryi2hRntNLpgwa2nbiLdVFHVnfwTri96xKeU6GmD5VRjfOO4NLTRm+0oFNljND
         h90YQpa64ExU6yidl/j3wz4CLgTPLGeuk2Qk54y9LQ0RA9+bVwyGqpAavVMhPfpkX23W
         GhB2Ua35pWOPnC6f2jVWB1f0gi4IKDIiXEkGMIpVDn+PEwaI8rxGpz2+0TUbNtkwraiW
         beNA==
X-Forwarded-Encrypted: i=1; AJvYcCWY52Nn30OgZ3tjB2PKmQvyLbdm7W/OnUt/QR9VctVI1neG7dqUW9QhuZC+nmt6Xr/uoci5Jma7eWNW5uFvXbw+4m2eB6cn
X-Gm-Message-State: AOJu0YyVliHXHjbr0c0uznBNB4s055bnaKAxBwYbudxdjANjJ8I04byf
	/XzqlAMq6k2IIH2QD9vkwmwr/EHY+s3WWoAD02nQCHQ8K3uRbFHaJ/BkabJknSqstQgdsP/6nxj
	aBJ6sKxGO+gN/0FWBn4RkDjbFkQyQg2e41f1DhwUccn0PtnNfEMld7g==
X-Received: by 2002:adf:e68b:0:b0:367:938d:7065 with SMTP id ffacd0b85a97d-3679dd6583bmr10053990f8f.56.1720451187982;
        Mon, 08 Jul 2024 08:06:27 -0700 (PDT)
X-Received: by 2002:adf:e68b:0:b0:367:938d:7065 with SMTP id ffacd0b85a97d-3679dd6583bmr10053961f8f.56.1720451187595;
        Mon, 08 Jul 2024 08:06:27 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84be6sm25691f8f.48.2024.07.08.08.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 08:06:27 -0700 (PDT)
Message-ID: <a16f0e3e-d5af-410e-9631-5e77f39931e7@redhat.com>
Date: Mon, 8 Jul 2024 17:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 10/19] hw/arm/smmu-common: Add support for nested TLB
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-11-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240701110241.2005222-11-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LCzj/w0pfLGW



On 7/1/24 13:02, Mostafa Saleh wrote:
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
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
