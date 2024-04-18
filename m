Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1781781ejd;
        Thu, 18 Apr 2024 07:46:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWu680bo+E5AbSkgM+Qb24eUrK/tUNuAQPla4oaSIVMBkHiTsuS7uFsnuFr1XJoKXJAM8CKOMsKGuk6K7tLHe7VihJ+xYWf
X-Google-Smtp-Source: AGHT+IENe56DejNf5vQXrwwm+rk2cQ4zcfaKsQbg5QND+c+ItHmUY/+Dv49X17PzJ6nqS+gR4BzM
X-Received: by 2002:a05:620a:29c6:b0:78d:7738:67fb with SMTP id s6-20020a05620a29c600b0078d773867fbmr3706573qkp.11.1713451593361;
        Thu, 18 Apr 2024 07:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713451593; cv=none;
        d=google.com; s=arc-20160816;
        b=cQ0SZdiwX8xpXrBLPTaEIAvhslCZtYShNDX5+cshir2FnfJQh3/54ygwm4o0EiX/gB
         1ImrH3Bif7kpfgt0SxV21f5Hy5WCQB/cdq/SqK9xfmauAm26ynk+d9fPtmxk7U/YbhvV
         72PeMN62SWyw58xi6eX9lLcwMiSRzgIsJ1AjjN7igC7JUmeiig7TR/fDowA/KSz0gsnS
         rjE3Npn4xJbEWCFdHev/As4LPcb68ufwxVpqrqsMmo9H9oZoXdH+5sKSAWXd3Q9om8to
         pJlpTvtXso9g3iVm5/g8W1MVUsl1bHVQZ1FseOK4fMfbTERqW1cQsNo4gosypzkSTBBg
         LCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Tt1H6YHE3uANqLlb5H/WW66779er0jWqNwBP9uLtL1s=;
        fh=E9HtZ3Clc2vMyZ7RbcrG5d9+JsD6ai2MlMcCD2RPoDQ=;
        b=SNx7ABCNbOlSwz0+6x/jls5e/YWCuSjSgogfVxLUMAKAuZkoqVei+5M8YAlLO1amph
         VoiOAV6c8au3DMzqa0DiV249Vb38tp1DEFXAm52dhdjGfXMsidJ6KupWTAjXf1RAvOMX
         OYNTmqNR1+maAwxhYs9y0srIBbB8ca7jO4HcwWgf5LMTeIsF/nlxmQAxUKOj5KUNCkz+
         Z+02xNrhAaMsiRBRUJQzfWWhTTVc6ijyfcajbu+DwkdD5GgwW2WWa3xgflp9dnlJQx5u
         31ucVST6AqpwmK+FUTiBdixqRQEFSSj9sUdVsnfenz5ORLGuWnMrn5hMUxWuez49St6G
         g+dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Rztj//AW";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s16-20020a05620a16b000b0078d747cbed2si1626600qkj.421.2024.04.18.07.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Rztj//AW";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713451592;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tt1H6YHE3uANqLlb5H/WW66779er0jWqNwBP9uLtL1s=;
	b=Rztj//AWBwRDP/Vcnudne1dyBrmZb4J7FS1Uu1DLe1lRv8sDoVCKVW5GXA+N5YOgSdSlqp
	SQJZofVOmgImA4305pG32MQLckQOyZ+acU6YF5tNFCCbNnzyvHKHdKG8W6j+hWuYH9V+lP
	D8dTBfyz/5u9t+zuQyyqsSgcDaSuFkg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-wBdKEK-YPeGs3em20G9_3Q-1; Thu, 18 Apr 2024 10:46:31 -0400
X-MC-Unique: wBdKEK-YPeGs3em20G9_3Q-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-56e573582b9so414861a12.1
        for <alex.bennee@linaro.org>; Thu, 18 Apr 2024 07:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713451590; x=1714056390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tt1H6YHE3uANqLlb5H/WW66779er0jWqNwBP9uLtL1s=;
        b=BCRU6EbomIO9NjSP/1jcWvyhQcOD0YKCOo4QUJAVxbTF8sCppRb6cFvdPKLNR4pYrh
         KCsSYg2C7JYBI815kOvEIMScU18UvC90+wnKAaKI9JLhwWOw4B+LViuGRUk8KWQ/7vHn
         yto7BZGCj2GmQ40Lz93Vu46OPKC4/ZDZMVD6I7U8xk7P21zuTTysiblSPqMblt8c6PMP
         iTp+QZkGc17BcyocQRxqW/r9c8+qfF10KHxsADVQsaLdH4jetde5UG55LN7Jk0/9gFlW
         fLcPKaXtV1Bz0frwL/A2w1CyymCb5G+HetUbVkUkgOn89L3r23BNVveYOcYdMadDT+/J
         huSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWenJ5dk/cjpjqYkna3jFg6Pe+2h4wVBboxk+LCnKCYFXl4ofmvFdA/3U6B+oq2HDgeWxgnleiJZGk//F6uLvsRnZB1xN93
X-Gm-Message-State: AOJu0Ywt3kOY/CIyzfFWxzU8COFhSMnUnZ0BTTN31ldlW/b51C3BHhw/
	2RrOI8sImggsg3kyeCudbPxztqF6PQC8YaFOJYvTAkmGmD+opjj572BT54+lYCHMcgEZ2rPqoKy
	jLpHFuuum9/b6vXwbXlfuxZrQYg0e3CVT2WxBMNd07L7mxRpkABmRSg==
X-Received: by 2002:a17:906:415a:b0:a55:66d2:95dc with SMTP id l26-20020a170906415a00b00a5566d295dcmr1844850ejk.48.1713451589809;
        Thu, 18 Apr 2024 07:46:29 -0700 (PDT)
X-Received: by 2002:a17:906:415a:b0:a55:66d2:95dc with SMTP id l26-20020a170906415a00b00a5566d295dcmr1844824ejk.48.1713451589375;
        Thu, 18 Apr 2024 07:46:29 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id k14-20020a17090627ce00b00a525669000csm989065ejc.154.2024.04.18.07.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:46:29 -0700 (PDT)
Message-ID: <7053fa09-a942-45b0-b8e8-5003107a6f32@redhat.com>
Date: Thu, 18 Apr 2024 16:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v2 06/13] hw/arm/smmu: Support nesting in
 smmuv3_range_inval()
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240408140818.3799590-1-smostafa@google.com>
 <20240408140818.3799590-7-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240408140818.3799590-7-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: eHYADjTx8GKx

Hi Mostafa,

On 4/8/24 16:08, Mostafa Saleh wrote:
> With nesting, we would need to invalidate IPAs without
> over-invalidating stage-1 IOVAs. This can be done by
> distinguishing IPAs in the TLBs by having ASID=-1.
> To achieve that, rework the invalidation for IPAs to have a
> separate function, while for IOVA invalidation ASID=-1 means
> invalidate for all ASIDs.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 47 ++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3.c              | 23 ++++++++++++------
>  hw/arm/trace-events          |  2 +-
>  include/hw/arm/smmu-common.h |  3 ++-
>  4 files changed, 66 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 2cf27b490b..8b9e59b24b 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -184,6 +184,25 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
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
> +    /* This is a stage-1 address. */
> +    if (info->asid >= 0) {
nit: I am rather used to have the comment associated to the condition
after the condition check
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
> @@ -212,6 +231,34 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
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
> index a7cf543acc..17bbd43c13 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1095,7 +1095,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
>      }
>  }
>  
> -static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
> +static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
>  {
>      dma_addr_t end, addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
> @@ -1120,9 +1120,13 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
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
> @@ -1138,9 +1142,14 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
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
> @@ -1299,7 +1308,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>                  cmd_error = SMMU_CERROR_ILL;
>                  break;
>              }
> -            smmuv3_range_inval(bs, &cmd);
> +            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
>              break;
>          case SMMU_CMD_TLBI_S12_VMALL:
>          {
> @@ -1324,7 +1333,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>               * As currently only either s1 or s2 are supported
>               * we can reuse same function for s2.
>               */
> -            smmuv3_range_inval(bs, &cmd);
> +            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_2);
>              break;
>          case SMMU_CMD_TLBI_EL3_ALL:
>          case SMMU_CMD_TLBI_EL3_VA:
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 5f23f0b963..f5c361d96e 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -46,7 +46,7 @@ smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
>  smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
>  smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
>  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> -smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
> +smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
>  smmuv3_cmdq_tlbi_nh(void) ""
>  smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
>  smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 03ff0f02ba..df166d8477 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -230,7 +230,8 @@ void smmu_iotlb_inv_asid(SMMUState *s, int asid);
>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
> -
> +void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
> +                        uint64_t num_pages, uint8_t ttl);
>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
>  void smmu_inv_notifiers_all(SMMUState *s);

Besides looks good to me
smmu_hash_remove_by_vmid_ipa
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

>  
