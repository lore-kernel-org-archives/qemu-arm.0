Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1783008ejd;
        Thu, 18 Apr 2024 07:48:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8kCyoV/0oTCs+lucbeolJM2R6hdyHfG/KdB8Bbq3HOBVrQy9GhjXSaH12ZKf6Ri05TWRPf79w48TAXD/X9aFNNeRrWgcm
X-Google-Smtp-Source: AGHT+IHpWe8FEPsAh5JUXQdA9/RqFIn4y93YUWaxZxL72E5e/gncyp/EILxmw6/1Kl8Rg7oLtsMv
X-Received: by 2002:a05:620a:43aa:b0:78d:56ed:1b63 with SMTP id a42-20020a05620a43aa00b0078d56ed1b63mr4356716qkp.52.1713451725076;
        Thu, 18 Apr 2024 07:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713451725; cv=none;
        d=google.com; s=arc-20160816;
        b=CFCUStZZ9rEc3xsJGwHWzG2qT0KIrqjkEQ18vedkehaXjuoWWNeJUg//GxsOaqLY18
         n6gozKRVeMMxAqmTkMl00GVWhvOhR4elyOPAm8IKqd1KR8afVH1Dr6EjZDWNFIVr36q/
         qx6jmv+bii6Xyz9AhZ9j7n8/DVNLf5n8JMwBRH23fSxy/YM+Rbu8QI/TeonCs9j2Ddcp
         2ygJ6IN80gXUJYsUMGOAU/BIVrr1W4JZnLaxBFLIoo2ax46qgts0vaWoC4/V0gMAWJfH
         uOul0Wid3HivSRFs6E613F6A/o8wjn75ZhJIuSaIXhvx83qy89beFGUCpelOlPAqjI/e
         lCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=enxY/DHRZLwIyCmI8664oAPoGfsD/JfngFCP4Fvyl8w=;
        fh=SyNBgPX76NiFNznXAHmVU3yRR+TneCswPnLgvW70wa4=;
        b=ka9kTVO/bsmG7rWOKX+Uh1LY6D7cBw/1+gLerc7c1tS/QOaJ158DKzUaG7XvzFKa9I
         6RYafTrvsOTNSrXxCT4CE28N9orM/I8Y1BmdYkWPfLKannj5/XudDnKlMD2KFKfHflbR
         5k2MH/16nOe5yGk0n6Rs42OpM2DUdp2WTXQAfC+x85nnGE7MX6OVBQagCsPz1D2QWxWV
         Nf3K8c0Oo+7bxg6ifTSxWOsk7uShsiq4X60zpQITLj5GPCHAuH5xj5jBuOe5b5/KpwZT
         9C8ou2+3MhFe10dqDUs+Y+IjAR9gZJBZFcmHYyVWsL34vdU9pwmaE0OebmWAwwK9HSh9
         PgfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gTaFzxTU;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i21-20020ae9ee15000000b0078edc1974b6si1571358qkg.455.2024.04.18.07.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gTaFzxTU;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713451724;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=enxY/DHRZLwIyCmI8664oAPoGfsD/JfngFCP4Fvyl8w=;
	b=gTaFzxTUtGMOMWE0zjWg4a135AiTXKQQa+7PHCxl3nRzhcrMGVGvI03pprzGgA4Dz0m4zr
	2FcpeNOPdR9VzsutxRvby459eFnCOdDmbgvg+t7PGBypA9nl+4DjHW+2AwHkc4RqMmd5pC
	H+ULwTL+VCh69XvG22ESmYiW5euehD8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-pv8iX4RANIqHUwtaTItsAg-1; Thu, 18 Apr 2024 10:48:43 -0400
X-MC-Unique: pv8iX4RANIqHUwtaTItsAg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a450265c7b6so51593666b.0
        for <alex.bennee@linaro.org>; Thu, 18 Apr 2024 07:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713451722; x=1714056522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enxY/DHRZLwIyCmI8664oAPoGfsD/JfngFCP4Fvyl8w=;
        b=m8oFvK1PaZqqE+UdaiD5Mh4vRhn6VLVxL8YrzqEwqbiHL9V39ArzGTE8CA2oZl4UwZ
         hBKWhFGpIBGUiuE0D61VieJwvYw/Ha6wesLMQ9p3Xx/tdavtT5QLhWu5GpeDW/aSw7ww
         5x29yYBcBq2GkIPuxfmWQ8cZHq9uYeKL206fKm4e1NbDM5aepvEvAHWVP6RTGB77k+ZA
         CONqXifrBe+vetTu/wyddCQk8CHQ1Nv4nJXfwCoiAhv/QVFqJ7z4GfUtVld46jnZBJ0G
         Mld0KOqvsRwH+c66HD3gfiAFE4HxG+kGUU28MI16SNiX1w9s3K17eYpIVJo0rkLqrfg1
         KSGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkSvBzyU2WlPoJ3EHI3KXqp9MrKpLc1PDaU+TJGRg9l8nO+JSzbmRf18AmYl3XJCgU4Ig4wBMUAazc4k2RvR5fbfdLwX14
X-Gm-Message-State: AOJu0YxDo9GjWIO9m2XaD5VBT/fH2StzCo1FLlGTOOyYSk3IvWTJbguf
	ri9vY/XVYbpZwSCulM8JsDLJVu4xRuZ8yrQU9Olh+a+aNJCTrX2pZXmKKIM6mRUKv0sVHNHduLX
	H9o4wpkHW7aU+1Z9ai/VP9KMHWiv/pVyWhhPVzYQNM2a5tx4Z02G1Vw==
X-Received: by 2002:a17:906:4f8b:b0:a52:53f2:5ae0 with SMTP id o11-20020a1709064f8b00b00a5253f25ae0mr1863636eju.74.1713451722273;
        Thu, 18 Apr 2024 07:48:42 -0700 (PDT)
X-Received: by 2002:a17:906:4f8b:b0:a52:53f2:5ae0 with SMTP id o11-20020a1709064f8b00b00a5253f25ae0mr1863618eju.74.1713451721870;
        Thu, 18 Apr 2024 07:48:41 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id re27-20020a170906d8db00b00a521327b019sm987721ejb.197.2024.04.18.07.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:48:41 -0700 (PDT)
Message-ID: <cfb5e002-26d4-437a-91d5-7c2eb49a75b6@redhat.com>
Date: Thu, 18 Apr 2024 16:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v2 07/13] hw/arm/smmu: Support nesting in the rest of
 commands
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240408140818.3799590-1-smostafa@google.com>
 <20240408140818.3799590-8-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240408140818.3799590-8-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: DSyy40Nok3nN

Hi Mostafa,

On 4/8/24 16:08, Mostafa Saleh wrote:
> Some commands need rework for nesting, as they used to assume S1
> and S2 are mutually exclusive:
>
> - CMD_TLBI_NH_ASID: Consider VMID if stage-2 is supported
> - CMD_TLBI_NH_ALL: Consider VMID if stage-2 is supported, otherwise
>   invalidate everything, this required a new vmid invalidation
>   function for stage-1 only (ASID >= 0)
>
> Also, rework trace events to reflect the new implementation.

This does not apply for me. Could you share a branch or respin?

Thank you in advance

Eric
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 36 +++++++++++++++++++++++++++++-------
>  hw/arm/smmuv3.c              | 31 +++++++++++++++++++++++++++++--
>  hw/arm/trace-events          |  6 ++++--
>  include/hw/arm/smmu-common.h |  3 ++-
>  4 files changed, 64 insertions(+), 12 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 8b9e59b24b..b1cf1303c6 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -148,13 +148,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
>      g_hash_table_remove_all(s->iotlb);
>  }
>  
> -static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
> -                                         gpointer user_data)
> +static gboolean smmu_hash_remove_by_asid_vmid(gpointer key, gpointer value,
> +                                              gpointer user_data)
>  {
> -    int asid = *(int *)user_data;
> +    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
>      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
>  
> -    return SMMU_IOTLB_ASID(*iotlb_key) == asid;
> +    return (SMMU_IOTLB_ASID(*iotlb_key) == info->asid) &&
> +           (SMMU_IOTLB_VMID(*iotlb_key) == info->vmid);
>  }
>  
>  static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
> @@ -166,6 +167,16 @@ static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
>      return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
>  }
>  
> +static gboolean smmu_hash_remove_by_vmid_s1(gpointer key, gpointer value,
> +                                            gpointer user_data)
> +{
> +    int vmid = *(int *)user_data;
> +    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
> +
> +    return (SMMU_IOTLB_VMID(*iotlb_key) == vmid) &&
> +           (SMMU_IOTLB_ASID(*iotlb_key) >= 0);
> +}
> +
>  static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
>                                                gpointer user_data)
>  {
> @@ -259,10 +270,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
>                                  &info);
>  }
>  
> -void smmu_iotlb_inv_asid(SMMUState *s, int asid)
> +void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid)
>  {
> -    trace_smmu_iotlb_inv_asid(asid);
> -    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
> +    SMMUIOTLBPageInvInfo info = {
> +        .asid = asid,
> +        .vmid = vmid,
> +    };
> +
> +    trace_smmu_iotlb_inv_asid_vmid(asid, vmid);
> +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid_vmid, &info);
>  }
>  
>  inline void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
> @@ -271,6 +287,12 @@ inline void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
>  }
>  
> +inline void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid)
> +{
> +    trace_smmu_iotlb_inv_vmid_s1(vmid);
> +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid_s1, &vmid);
> +}
> +
>  /* VMSAv8-64 Translation */
>  
>  /**
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 17bbd43c13..ece647b8bf 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1280,25 +1280,52 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          case SMMU_CMD_TLBI_NH_ASID:
>          {
>              int asid = CMD_ASID(&cmd);
> +            int vmid = -1;
>  
>              if (!STAGE1_SUPPORTED(s)) {
>                  cmd_error = SMMU_CERROR_ILL;
>                  break;
>              }
>  
> +            /*
> +             * VMID is only matched when stage 2 is supported for the Security
> +             * state corresponding to the command queue that the command was
> +             * issued in.
> +             * QEMU ignores the field by setting to -1, similarly to what STE
> +             * decoding does. And invalidation commands ignore VMID < 0.
> +             */
> +            if (STAGE2_SUPPORTED(s)) {
> +                vmid = CMD_VMID(&cmd);
> +            }
> +
>              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
>              smmu_inv_notifiers_all(&s->smmu_state);
> -            smmu_iotlb_inv_asid(bs, asid);
> +            smmu_iotlb_inv_asid_vmid(bs, asid, vmid);
>              break;
>          }
>          case SMMU_CMD_TLBI_NH_ALL:
> +        {
> +            int vmid = -1;
> +
>              if (!STAGE1_SUPPORTED(s)) {
>                  cmd_error = SMMU_CERROR_ILL;
>                  break;
>              }
> +
> +            /*
> +             * If stage-2 is supported, invalidate for this VMID only, otherwise
> +             * invalidate the whole thing, see SMMU_CMD_TLBI_NH_ASID()
> +             */
> +            if (STAGE2_SUPPORTED(s)) {
> +                vmid = CMD_VMID(&cmd);
> +                trace_smmuv3_cmdq_tlbi_nh(vmid);
> +                smmu_iotlb_inv_vmid_s1(bs, vmid);
> +                break;
> +            }
>              QEMU_FALLTHROUGH;
> +        }
>          case SMMU_CMD_TLBI_NSNH_ALL:
> -            trace_smmuv3_cmdq_tlbi_nh();
> +            trace_smmuv3_cmdq_tlbi_nsnh();
>              smmu_inv_notifiers_all(&s->smmu_state);
>              smmu_iotlb_inv_all(bs);
>              break;
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index f5c361d96e..2556f4721a 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -11,8 +11,9 @@ smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint6
>  smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
>  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
>  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
> -smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
> +smmu_iotlb_inv_asid_vmid(int asid, uint16_t vmid) "IOTLB invalidate asid=%d vmid=%d"
>  smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
> +smmu_iotlb_inv_vmid_s1(uint16_t vmid) "IOTLB invalidate vmid=%d"
>  smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
>  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
>  smmu_iotlb_lookup_hit(int asid, uint16_t vmid, uint64_t addr, uint64_t mask, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" mask=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> @@ -47,7 +48,8 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
>  smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
>  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
>  smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
> -smmuv3_cmdq_tlbi_nh(void) ""
> +smmuv3_cmdq_tlbi_nh(int vmid) "vmid=%d"
> +smmuv3_cmdq_tlbi_nsnh(void) ""
>  smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
>  smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
>  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index df166d8477..67db30e85b 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -226,8 +226,9 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
>  SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
>  void smmu_iotlb_inv_all(SMMUState *s);
> -void smmu_iotlb_inv_asid(SMMUState *s, int asid);
> +void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
> +void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>  void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
