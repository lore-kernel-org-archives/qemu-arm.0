Received: by 2002:a05:7022:1102:b0:84:b8cb:c71e with SMTP id ou2csp983585dlb;
        Wed, 17 Jul 2024 08:29:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh6REa29iQ9Ox2TOBc47mbXeMi87dbLfH+PIzsZKAt4mkGgaveanXmLwD41+OlRqQPlCTucQDakfWzXktC+ZXq8+vGqRli
X-Google-Smtp-Source: AGHT+IFjrM/0is/1aJwgBZtN+dFrLSmvyhdl4tEUG1zBG5TEgjUa3Fw/AkciC5pSRCzdwWmAulf+
X-Received: by 2002:a05:620a:904:b0:79e:ffae:cdc6 with SMTP id af79cd13be357-7a17ccf59c7mr757370485a.32.1721230143133;
        Wed, 17 Jul 2024 08:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721230143; cv=none;
        d=google.com; s=arc-20160816;
        b=HuB8QFksGx9XYGiVlb8NxQu2TaV9JN+5yrzQWW9IjbskJtQh/4VwIXNuh7q1ibdV5O
         XPDw1/00qUDdWq1DzpvKenq//gZ85/JmpXzF+y0/tmxKpP06c57Z4GfOa8NyCmr64iIy
         oxrGk8Gm6iLy8ddlNXJ8dooQaXaqKSjULXWPgJ/lJGkR0QMfcYh76bG4/orQgXylBTrq
         UPw/+tqDUEIR8gUwQG4mFCbb//GDURptAKKXcmq9D0TL38K8RDaX/4uSgjr22YuA68pD
         9aQykDPnNTVWfus0o2J1vkHEx8+bQwp1cnWXPDgoobvnxdpynmTV3BsYVqAuY9FJ+64A
         iFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=dqkFYoMCBmaYlBCn43LVLHVoG26nrATtJOLsRiV6fxo=;
        fh=PPhNE5j7AnmK7TaKma0ouTJ4vtXwUi5eENJbM1PKFWE=;
        b=n7tm9r/0f5t6cj9L5rcdy31JMcLMhCv8By3kNBRPzVzpza8wfPHoTJe28Z3APPH14L
         7JQQaZ8Y+1I8FAtQDaRnql97oTgJ3Y4l4MqRh7fUuPT5PdU+a32II/LP2KqOeRjMDnpZ
         tAFESFXEvGlGhLSxFzXbOptzZgtRy+Whhk0bxIL9LmwYSn29VZGWHQeT/Krs7baKk2pb
         cxEkLBePfGQJopUoxBpbJORZyVDFbZbG7HBCaKru4rwx6j/Afvh7mxd2Uyj3fTocq73p
         GjV+nLP83mZGVZe0bJTRYGmcEtJAmHp7KZ6F9TcaUV/MKLMdAxB78F4nhrsi9uziemCE
         8Wfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WuKmAwsd;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c515ddsi951912685a.305.2024.07.17.08.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WuKmAwsd;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721230142;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqkFYoMCBmaYlBCn43LVLHVoG26nrATtJOLsRiV6fxo=;
	b=WuKmAwsdTWK3i52TuCyu/PeiY15jEr70lSLY0Oct48R9XkcNpUlmcZ5QRGqVEtOPnOAXih
	FK8HimpWYDr66gMCziPoM6AB8EKyUGThO6CbZ0Uj+Ild0odbtuzKhLY+NJK/SJX3ONP8Pg
	d7OeSVQUOo0LM6hAqGi+lC3yAZ4lGo4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-uyXDr_dzMhqgpVJZJ5_Zow-1; Wed, 17 Jul 2024 11:29:01 -0400
X-MC-Unique: uyXDr_dzMhqgpVJZJ5_Zow-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-79efed0e796so198807885a.1
        for <alex.bennee@linaro.org>; Wed, 17 Jul 2024 08:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721230140; x=1721834940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqkFYoMCBmaYlBCn43LVLHVoG26nrATtJOLsRiV6fxo=;
        b=bHXDfRBRHWPEw+WLB4N+XSH8rFOaI98wZDt+z/iJJunPA2WaK49+EPeSkZwh0wfi26
         fy0NVwVOP53zHz4D9zHVF0mjTkfIplsXsjMvLt6tmUEslJVNxTy8wxEiqFJQsO97Pn9g
         Rd4zahAxICDhbgsz7moJyw5DQlIs01ejKFTgy4S2z1+gFO+9vmAB1FXl24v5YNC+iXw1
         DofmieOjMhs/jJp4cbtko12o37eX0ia7ZvtuPZMEXKX4R9TPzbjf5m6TICNlTIGQhZFm
         q7c+6GdjSLOOyUyuZWaF7uNUEo3zZVRY1++M7T8DQJHj5cIni46NC0wE3q7/jXDwOw6T
         XNjw==
X-Forwarded-Encrypted: i=1; AJvYcCV3DEaIBE4kl6o0nzosHbQvNbDtpS/HUhdLXt8jqBCkyOkNIIHobGTEWnREyfiJOFxGIE8GEvisDVwhqlQR4BaM12ofB4j+
X-Gm-Message-State: AOJu0YxtE5acs7+BHW3y5pwFRZl1sS7aW1YWyH26XxTY4s20GMOSxWnk
	UHS9Yqt5xVMTMKtvr71CscAR9Dlpc7m7QMoK9vBnx+piZyR72PXwRtOpKgvTqXP66fnxBa2+scO
	OYRwFt7Y7s4dtuJ0Dc+PbMLUbvldZ2kPRpI+9cDMMJxHqneJdbjAx3g==
X-Received: by 2002:a05:620a:2994:b0:79f:741:5d4f with SMTP id af79cd13be357-7a18da57f8dmr1662985a.3.1721230140445;
        Wed, 17 Jul 2024 08:29:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2994:b0:79f:741:5d4f with SMTP id af79cd13be357-7a18da57f8dmr1658785a.3.1721230140016;
        Wed, 17 Jul 2024 08:29:00 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160b92ba7sm414925685a.27.2024.07.17.08.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 08:28:59 -0700 (PDT)
Message-ID: <c3ac816e-12ca-4362-a1e7-cfb75e55286a@redhat.com>
Date: Wed, 17 Jul 2024 17:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 11/18] hw/arm/smmu-common: Support nested translation
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240715084519.1189624-12-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240715084519.1189624-12-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 0o6Q1TekN//4



On 7/15/24 10:45, Mostafa Saleh wrote:
> When nested translation is requested, do the following:
> - Translate stage-1 table address IPA into PA through stage-2.
> - Translate stage-1 table walk output (IPA) through stage-2.
> - Create a single TLB entry from stage-1 and stage-2 translations
>   using logic introduced before.
>
> smmu_ptw() has a new argument SMMUState which include the TLB as
> stage-1 table address can be cached in there.
>
> Also in smmu_ptw(), a separate path used for nesting to simplify the
> code, although some logic can be combined.
>
> With nested translation class of translation fault can be different,
> from the class of the translation, as faults from translating stage-1
> tables are considered as CLASS_TT and not CLASS_IN, a new member
> "is_ipa_descriptor" added to "SMMUPTWEventInfo" to differ faults
> from walking stage 1 translation table and faults from translating
> an IPA for a transaction.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmu-common.c         | 74 +++++++++++++++++++++++++++++++-----
>  hw/arm/smmuv3.c              | 14 +++++++
>  include/hw/arm/smmu-common.h |  7 ++--
>  3 files changed, 82 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index c894c4c621..8ed53f5b1d 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -318,8 +318,41 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>      return NULL;
>  }
>  
> +/* Translate stage-1 table address using stage-2 page table. */
> +static inline int translate_table_addr_ipa(SMMUState *bs,
> +                                           dma_addr_t *table_addr,
> +                                           SMMUTransCfg *cfg,
> +                                           SMMUPTWEventInfo *info)
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
> +    info->addr = addr;
> +    info->is_ipa_descriptor = true;
> +    return -EINVAL;
> +}
> +
>  /**
>   * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
> + * @bs: smmu state which includes TLB instance
>   * @cfg: translation config
>   * @iova: iova to translate
>   * @perm: access type
> @@ -331,7 +364,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>   * Upon success, @tlbe is filled with translated_addr and entry
>   * permission rights.
>   */
> -static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> +static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>                            dma_addr_t iova, IOMMUAccessFlags perm,
>                            SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
> @@ -381,6 +414,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>                  goto error;
>              }
>              baseaddr = get_table_pte_address(pte, granule_sz);
> +            if (cfg->stage == SMMU_NESTED) {
> +                if (translate_table_addr_ipa(bs, &baseaddr, cfg, info)) {
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
> @@ -591,6 +627,7 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
>  /**
>   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
>   *
> + * @bs: smmu state which includes TLB instance
>   * @cfg: translation configuration
>   * @iova: iova to translate
>   * @perm: tentative access type
> @@ -599,11 +636,15 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
>   *
>   * return 0 on success
>   */
> -int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
> +             IOMMUAccessFlags perm, SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
> +    int ret;
> +    SMMUTLBEntry tlbe_s2;
> +    dma_addr_t ipa;
> +
>      if (cfg->stage == SMMU_STAGE_1) {
> -        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> +        return smmu_ptw_64_s1(bs, cfg, iova, perm, tlbe, info);
>      } else if (cfg->stage == SMMU_STAGE_2) {
>          /*
>           * If bypassing stage 1(or unimplemented), the input address is passed
> @@ -621,7 +662,20 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>          return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
>      }
>  
> -    g_assert_not_reached();
> +    /* SMMU_NESTED. */
> +    ret = smmu_ptw_64_s1(bs, cfg, iova, perm, tlbe, info);
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
> @@ -667,7 +721,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>      }
>  
>      cached_entry = g_new0(SMMUTLBEntry, 1);
> -    status = smmu_ptw(cfg, addr, flag, cached_entry, info);
> +    status = smmu_ptw(bs, cfg, addr, flag, cached_entry, info);
>      if (status) {
>              g_free(cached_entry);
>              return NULL;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 73d5a25705..06a96c65eb 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -910,6 +910,20 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>      if (!cached_entry) {
>          /* All faults from PTW has S2 field. */
>          event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
> +        /*
> +         * Fault class is set as follows based on "class" input to
> +         * the function and to "ptw_info" from "smmu_translate()"
> +         * For stage-1:
> +         *   - EABT => CLASS_TT (hardcoded)
> +         *   - other events => CLASS_IN (input to function)
> +         * For stage-2 => CLASS_IN (input to function)
> +         * For nested, for all events:
> +         *  - CD fetch => CLASS_CD (input to function)
> +         *  - walking stage 1 translation table  => CLASS_TT (from
> +         *    is_ipa_descriptor or input in case of TTBx)
> +         *  - s2 translation => CLASS_IN (input to function)
> +         */
> +        class = ptw_info.is_ipa_descriptor ? SMMU_CLASS_TT : class;
>          switch (ptw_info.type) {
>          case SMMU_PTW_ERR_WALK_EABT:
>              event->type = SMMU_EVT_F_WALK_EABT;
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index d84de64122..a3e6ab1b36 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -63,6 +63,7 @@ typedef struct SMMUPTWEventInfo {
>      SMMUStage stage;
>      SMMUPTWEventType type;
>      dma_addr_t addr; /* fetched address that induced an abort, if any */
> +    bool is_ipa_descriptor; /* src for fault in nested translation. */
>  } SMMUPTWEventInfo;
>  
>  typedef struct SMMUTransTableInfo {
> @@ -184,9 +185,9 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>   * smmu_ptw - Perform the page table walk for a given iova / access flags
>   * pair, according to @cfg translation config
>   */
> -int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
> -
> +int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
> +             IOMMUAccessFlags perm, SMMUTLBEntry *tlbe,
> +             SMMUPTWEventInfo *info);
>  
>  /*
>   * smmu_translate - Look for a translation in TLB, if not, do a PTW.
