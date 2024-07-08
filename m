Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2782652njb;
        Mon, 8 Jul 2024 09:15:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6nQplVsVbdbYPxPIuvoFAsJnrJerTE9FPvoFbbxXQQGoqwW4clan/r2omx02doPwPQafPnMrNYA7ktZm+PdsjyVQGolBR
X-Google-Smtp-Source: AGHT+IE/e9IMjwLKgi7uv1qbBBcQ6CTzLiBQav3LTFUGSXAD4PMBxE74FYd92vCcPZlxAiEmP7zO
X-Received: by 2002:ac8:588f:0:b0:447:f4e0:8d19 with SMTP id d75a77b69052e-447f4e0991cmr16726301cf.44.1720455355297;
        Mon, 08 Jul 2024 09:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720455355; cv=none;
        d=google.com; s=arc-20160816;
        b=MDibSYwoggeiYlK2GR6xXuNEfmRoqHS01lptX08Pqj3slfZ291DfLr19YeaKxFJish
         Ryy9mKJfe4GjMUhzUR9ESWr7ZVfWc3gMjiMcZK6UskFqglNmAXVZW/B6BY62rfLH6ml7
         Ygw5m8uNmcJYZPsdXByRVrJX63mgODBl2XF+vad0NIjY0QJqXOJ7ZGjWv98sc1rv5esQ
         +YV+a8PTcKTC6wJrmqoILKkt/w6yKVbIMERQpoOvu+P0cNyGCM+CJ/ln+XHZ6bt/u41q
         Rd0ws0niCV/CAMKOgbtfvPIwbdyG5+ObhxtWxovsFRq7wSi0ERZffMqmwTBK96+I7pRm
         H5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=n3t2Sy52xezSz/ZX79pDsxXJ5AwAQfMwMcyAwGI6YbA=;
        fh=vpPLLAP67NwacFOnECCRkYTvege8oI1d0kSQliTvvqM=;
        b=rdHVTu7uD4rm0uot/c1Jrm8qESfi2NYUyzCaVU70PjA1o3t+MeGDl4z2/GKg6ZOcKz
         eNf/oSJRqav936smyg2LCtXPUmJ8hGdJrFinU9ViE5Vc/nYDC8QO1zePQqRvqhk18lKY
         ZTgbuhcEz6G5plUegrKzue3gEyAmaxEh9GYbNir6AcHO60qXl8scMQYArfq47hNcu555
         RGT9eeWwRD1eV21AxRLuiojuYZL+UAIoGwAOBvn7kdfp+dE5Cfizao/D5Isn0hL1MxPG
         vsDXco7fO+aAOEUgEXpg646GPPc8IkHd7PWa6+s42He8xn5tS1A3T0ngZUGcKM7lCfG/
         kVTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gkpEl8Xh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9beeae1si2002211cf.604.2024.07.08.09.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gkpEl8Xh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720455354;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3t2Sy52xezSz/ZX79pDsxXJ5AwAQfMwMcyAwGI6YbA=;
	b=gkpEl8XhyzRNwByWrTb3wp+WN95jgrIfpZsZwV613sFKfuTpiYGR8s36jIsVo7cvXmRUbQ
	7rr13y8Il2LrD4dl4HwdH4Fm3C3jH2fCWyz7rkbBoz1FDPMUoCdbCeUbWRY4hBrTt1qFy1
	BkpIl7iuMhkk62hv39pei6/4LVSIrXE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-0bQYRYXjMDKCv2Dg-egeiw-1; Mon, 08 Jul 2024 12:15:53 -0400
X-MC-Unique: 0bQYRYXjMDKCv2Dg-egeiw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-367963c4f52so2940923f8f.2
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 09:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720455352; x=1721060152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3t2Sy52xezSz/ZX79pDsxXJ5AwAQfMwMcyAwGI6YbA=;
        b=vJ8kAlDplhOnLpp7OxbI7TRGPdCF+m2cTxAJkzcVnApWHTUS9ab4rtet2fIgohtZhs
         kn5kjnP429k5x3Yy+innSalk+MA4WzMUh5ntJ8EsmM1kRtnrhR7NLP7+nC3C9tINQzoH
         L21ndIwNhnYdNAxA1ysSMd0ngbvY6rtJ+G4f4bHtsfsPKyabUogHii1rYoiytywhAbST
         0+jsY+ehb//OA38t/bXuqXE4QbfeVsLHsN0m4Qax5qrZriTU19ghIJw+Cf1HaTzghxWO
         FtLXUtXVYwDv/nzyvfCb17PIic75+DiKIV/+LfGphbwkUMwZ0/IrCgrE0+ERSiUjTGgi
         bo4g==
X-Forwarded-Encrypted: i=1; AJvYcCX1icNJlwPbB2yZ881EVRo7JKQVYF3R1YZ6cb0TDvt3Ky5aQa+5qtj70J8s7VWKs9wsZ+LR0ls180KX6lCat8bVgH3q5A3b
X-Gm-Message-State: AOJu0Yy2hedLUeYYb9aQl29oGe/whk9wc/Rj79W8PLMSDzi03R2oRVW8
	UOHddlSl0hW7YaBiXvYvhigs669TVBOU9A25Ioc83j3IZlFO5X6oDt0vTrABp4mAWu4RYhj7IJu
	v58VYTvlhME6KT9EO27B4oQGpdyPcJBwBgBo10PmPC+vIzgn1bWEXLA==
X-Received: by 2002:a05:6000:1041:b0:367:13a:5276 with SMTP id ffacd0b85a97d-367cea737c1mr54926f8f.20.1720455352648;
        Mon, 08 Jul 2024 09:15:52 -0700 (PDT)
X-Received: by 2002:a05:6000:1041:b0:367:13a:5276 with SMTP id ffacd0b85a97d-367cea737c1mr54908f8f.20.1720455352281;
        Mon, 08 Jul 2024 09:15:52 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa0613sm165495f8f.88.2024.07.08.09.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 09:15:52 -0700 (PDT)
Message-ID: <b42ec5e5-befe-4c1f-a3f2-944dcc66ad4f@redhat.com>
Date: Mon, 8 Jul 2024 18:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 14/19] hw/arm/smmu: Support nesting in the rest of
 commands
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-15-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240701110241.2005222-15-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: YLXJ2HsVvmEW



On 7/1/24 13:02, Mostafa Saleh wrote:
> Some commands need rework for nesting, as they used to assume S1
> and S2 are mutually exclusive:
>
> - CMD_TLBI_NH_ASID: Consider VMID if stage-2 is supported
> - CMD_TLBI_NH_ALL: Consider VMID if stage-2 is supported, otherwise
>   invalidate everything, this required a new vmid invalidation
>   function for stage-1 only (ASID >= 0)
>
> Also, rework trace events to reflect the new implementation.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric

> ---
>  hw/arm/smmu-common.c         | 16 ++++++++++++++++
>  hw/arm/smmuv3.c              | 28 ++++++++++++++++++++++++++--
>  hw/arm/trace-events          |  6 ++++--
>  include/hw/arm/smmu-common.h |  1 +
>  4 files changed, 47 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index d0309a95b2..faba4adc49 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -178,6 +178,16 @@ static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
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
> @@ -288,6 +298,12 @@ void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
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
> index 928f125523..e9007af3cd 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1321,25 +1321,49 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
> +             * VMID is only matched when stage 2 is supported, otherwise set it
> +             * to -1 as the value used for stage-1 only VMIDs.
> +             */
> +            if (STAGE2_SUPPORTED(s)) {
> +                vmid = CMD_VMID(&cmd);
> +            }
> +
>              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
>              smmu_inv_notifiers_all(&s->smmu_state);
> -            smmu_iotlb_inv_asid_vmid(bs, asid, -1);
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
> +             * invalidate the whole thing.
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
> index 7d9c1703da..593cc571da 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -11,8 +11,9 @@ smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint6
>  smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
>  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
>  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
> -smmu_iotlb_inv_asid(int asid) "IOTLB invalidate asid=%d"
> +smmu_iotlb_inv_asid_vmid(int asid, int vmid) "IOTLB invalidate asid=%d vmid=%d"
>  smmu_iotlb_inv_vmid(int vmid) "IOTLB invalidate vmid=%d"
> +smmu_iotlb_inv_vmid_s1(int vmid) "IOTLB invalidate vmid=%d"
>  smmu_iotlb_inv_iova(int asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
>  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
>  smmu_iotlb_lookup_hit(int asid, int vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> @@ -47,7 +48,8 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
>  smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
>  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
>  smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
> -smmuv3_cmdq_tlbi_nh(void) ""
> +smmuv3_cmdq_tlbi_nh(int vmid) "vmid=%d"
> +smmuv3_cmdq_tlbi_nsnh(void) ""
>  smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=%d"
>  smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
>  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 2bc9a03d47..361e639630 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -214,6 +214,7 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>  void smmu_iotlb_inv_all(SMMUState *s);
>  void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
> +void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>  void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
