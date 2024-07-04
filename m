Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp785529njb;
        Thu, 4 Jul 2024 11:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHqJ+c0OJ2T3jPvh0ab5q1fpdrGrsOHt5KOmqGgts5qHcGjrngfen2drXT/Dz9mkMkoTO/hiGyh/Fg+oTbjmsIu0vHJV4U
X-Received: by 2002:a05:600c:6d5:b0:424:a5df:b998 with SMTP id 5b1f17b1804b1-4264a3d1d2bmr17762555e9.9.1720118052519;
        Thu, 04 Jul 2024 11:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720118052; cv=none;
        d=google.com; s=arc-20160816;
        b=0U8bjhrfX68ffAHYgPHbDT05QSg+Lat2IkZ2ZnY9uS/Ccg7eJXvgzoYEtW0aUkAZdF
         KrJd7XaSf7KNJ7XrH4xSqkiUzo85W2oR9HjUm7DPAAzSEyQ3Ok6zDoXb/iyuOnxoOxsX
         s7mLPbwp39z5+TPaGYt4HvLdfPFaWv3PxUosmrkryRXAzqNlSe3xhHqMxCDkgaeXHJ8G
         vx0/NN8feoyxWpL8QWTxYceLYLvGcqDok6JXxI3fspf07Yt+kAoIy2C8eWAiT+DC5rri
         JEcNugo/ktiMT/u8O3wMpgGBaobrtl5xnNfwtZIPOPyECj8dw+hTBLMKFPWb2/YtYOwG
         Q02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ZOyZIM2oMhU/q1qfOkv3NvnCzlYt7sTiv5uJYduiYpQ=;
        fh=5DRWUrgW5jbloPHfdzx35dPhwb5+Ee9O2agHfg32vAo=;
        b=pzQB7Ajb2MazLtwFauPRYtI+0YXAS5vT4htUwIGxDCsJglXb+h5j6iLJVI977+yA+a
         atCg4awpr3h3HTbMMM/rjeMqCS03cUtyvhkG1X1CI6TD08jM00gQpgFlTbyS0t/F/+ZN
         vEFJlQRhehrFC32Tm3CVm7pf5xz/NWtYBVF7XDV5LWgCku0uVZ9T2Br1EFSaX//oFmP1
         tglFbz1y2EaZpdzqxWIDyE84hIAfNE6vNforLRrrvuM4sK4VdcRu6OSlMalMUvv4RY5f
         gzXmNKfmFAoh2vSijyTQWbARJbSTF5QD+hGbRGwBHoddts9MbwNt08RUHGH7sTQ0MuLK
         s9uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vGA3dSBg;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4256525d354sor45319935e9.3.2024.07.04.11.34.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vGA3dSBg;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720118052; x=1720722852; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOyZIM2oMhU/q1qfOkv3NvnCzlYt7sTiv5uJYduiYpQ=;
        b=vGA3dSBgfOsPSF6km2l8nr3qPfig4DcLVxk7DF+qGYs2cNMQf57HL1s0msEaBN+UNh
         WHZ8lyi8hmUqk0UZWMHSMM4rr7lfdAvs2SSLMWL1AuXWV1/94d3PC8eI45eobHymaObB
         dVmOLlvW5fCiJI7I+tJ/CWYo1F7KdS10QtUkvGDmiMGJp//6U7Jbg/2KFdHZY7zGdOUa
         YxRRrajangw2UP5I8I9JdcgB2DAF/7GITef3wSzc+q7cMQb3pI7JAdedRnxPFXXb3w3R
         7zBBPs0LhyZQw8KasdRFelXdaOIsxWu7asJtBIQptnAqjKuzO8bTvqleV3k6oTn6yh67
         q6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720118052; x=1720722852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOyZIM2oMhU/q1qfOkv3NvnCzlYt7sTiv5uJYduiYpQ=;
        b=wjaB+klCgB2/uyfZedaEFsJiyt+2KRXkHIIr19Jq32dJuWftWKwGsrqTXTBAWaQoaM
         5vTuFH9pP4wulGCSWL/AFjxAdRnaLA1OjIxsD6AHBcLtWhDGHZXlIGiF6k7ygRBkgjin
         PnrDTvWTfvbZe/cNKY9QyoIYgraArOPDJd56cXuBbZ1VVr+RP6iTDAXR+YhIRiIu1KMo
         shozBsyZh9YIlsWyqhp0Z89mUivffpwmtRS1SuIRf+08hmrtBG3DsbZQBRgHaZX4cavx
         ZrE6Vq6iNAl2mCOSv+TtY2G7tjA1y98ZvNqEK230GUB743JLDXGLFOvBnODw1KJO6YFp
         SEDg==
X-Forwarded-Encrypted: i=1; AJvYcCX4D1GMZPUqJPgHKl8LslN6s8ZBBarZ4o6lqIJoFjSCaJoUF3LIKANuw7crkrT/2T5CCdvjodyEUbyBCwHRNHtlb3rINcDw
X-Gm-Message-State: AOJu0YxRR+CYHGpK2DySykdhdaCyZv8wB1EDGjj0ZunlaWDeVxAwxIGX
	wv+yDksmT8Gq96dcWiaSYLg1o+I8GLFM5ff29lS+TiGFn4UXB2K8e5UsBdqcWnqDYA==
X-Google-Smtp-Source: AGHT+IGDP/oPx4p9eJ5ihhFeWt4g6wnzwssdFXvt3XLdCfuKfeLjKOoBBZE8mI+EBGOJWwIhq3jmpg==
X-Received: by 2002:a05:600c:4b17:b0:424:a578:fc7 with SMTP id 5b1f17b1804b1-4264a3cc9f5mr20260265e9.3.1720118051911;
        Thu, 04 Jul 2024 11:34:11 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426487c1c66sm15431045e9.0.2024.07.04.11.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:34:11 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:34:24 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 14/19] hw/arm/smmu: Support nesting in the rest of
 commands
Message-ID: <20240704183424.GK1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-15-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-15-smostafa@google.com>
X-TUID: iVWTYDXASUs2

On Mon, Jul 01, 2024 at 11:02:36AM +0000, Mostafa Saleh wrote:
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

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

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
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
