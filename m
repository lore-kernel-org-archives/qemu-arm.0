Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp619689ejl;
        Wed, 15 May 2024 05:41:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCfVkXXXAgJmn9cyYso3uzg+KolNHzXezKpDtlAgzr+GszkdUfoMtpdlBfAFszb7EhF8rmf47/9tMVjh33g7wvNw3aFO+7
X-Google-Smtp-Source: AGHT+IHz0OwumbiJmY50kYXW3pQ+ncIVMkPbzKEpkn6Gs1FM0flfPPDJjJaq71APR7rD5ErofVTB
X-Received: by 2002:ac8:7f10:0:b0:43b:1546:f8a9 with SMTP id d75a77b69052e-43dfdd19877mr175721551cf.51.1715776909787;
        Wed, 15 May 2024 05:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715776909; cv=none;
        d=google.com; s=arc-20160816;
        b=x09Xat+1srKGY2aE/OfbvZqbnj23kVQCm1JbdWDXufDF6T6SMEUabLVvq9P9BANzTF
         q6OLiqZL4S+DswwZ/cl4GSez90eNVeis08S1fWPj4A8dRXDirW7HeOHcNnW7Z76Hay/J
         4NRpZbSs85mew1R92X9GUVvmUXylSRA5Jyo+ZQYasLNue/hhUBrO4md0UPF6J4KGKx/O
         /9/q8/1mKiIVUkYApfxRAt/VHLp7npWorcZxlXp77MRyip/JdS/y7IbZ69Sw34L8l7nD
         yx85bUACh/DWzAhznmWrMm3Ev/tTKRBaHBhAuYNHRLVZUl3z5qp3fV/oVML58ThjYl2q
         mCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=9KNfcZMT4EbRYsu7Qmem6zWhRf0dUHw8W2+vQBBdO70=;
        fh=7Un73pR/5hRM+g5xztFWucMO+tHIp9oa33vJRkmQ3UU=;
        b=jaKM50raOzo/nbt3qKtRpjSaXFiSDW7bXVAdbJPb2LPYbhrmhcMxTUa+dqDtDHEcC0
         bCwiXCzQZUGInQKYPgFa5LEL7a6J1+IxO+KEtagXMbM2yCUi6DZyxDj2cEpAb9b1riLy
         Ks2g8p+wKR3PZM2S9mfHa0Iz5q80SBUbRL6Hk4Y+JeFRq0sfKwb2ypNZFBSIdsNTVDXy
         sv1UJYeGwI+3tL5eEHdymZ6S72YXgH2W4xO0RO37m1W2Ois8YWOW7mVr+d2lj7+XerI7
         mWsg/13gPJ9H/75ODMOkQdUznaqG4eb0SnSuFomysEoIwwpL2OhbaerdtMfsSJdcZQ0b
         PryA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K1ArtGds;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-43df54b56casi144307081cf.187.2024.05.15.05.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 05:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K1ArtGds;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715776909;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9KNfcZMT4EbRYsu7Qmem6zWhRf0dUHw8W2+vQBBdO70=;
	b=K1ArtGdsJzOjnV0aswqrxojp42qUsy6uZ0ne+u+NIW2shC07cvqJFr6wUZh7EEKJVX/DV3
	Y5mlbmiX31BnI2CDykMCl7MjzhZB2/YUfU2tOK9G8EDpCDAfnSLDrTvv61KL0XtlUYcsXb
	cytDywjBvZAFkLcViZGfYl6juMXttEY=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-jAdx2hYHMC6DHCp-tt_9lA-1; Wed, 15 May 2024 08:41:47 -0400
X-MC-Unique: jAdx2hYHMC6DHCp-tt_9lA-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6f10d71ed9eso2977604a34.2
        for <alex.bennee@linaro.org>; Wed, 15 May 2024 05:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715776907; x=1716381707;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KNfcZMT4EbRYsu7Qmem6zWhRf0dUHw8W2+vQBBdO70=;
        b=kKQdAZnrCsvolwGwGsV5wbP4vaIqdzQM8oiaWl3xmDMBfPbyCR6rVjzI+Hw/ZaoPs+
         neZpp4hDZyDllA+LQr6dFwoI1Bhz1RBkmSlJFUaeM6lxYgodts/shucem2cWI6yq3n42
         PzI4uSl6+ub6g2gsAQR/pPDGu6ci576/QdLA/UDWX/I6PsN+TBQRLrOaysMHP7ClZDta
         BNVeGe+YUTSWA8NlzJkC6FRIPwcZwd7Qlgt+j4VFUZEJJRGdtAUeGE0MloXxZZ5VqNyk
         /yyxRiRT4e411T2WeNgmwXknhBwG2jR0g8Ei7pP6eS6a9BY6vqbCpQNxLxjSf5kmK1Y1
         vtWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj8OEa7leeAsR0APpiSQN6RWFBHvwpgg/6BUOfqy8z1C+ZHmcymtiVx25/stQFD+prQegaAVNtF5dOzZYNxOFsq6pmi878
X-Gm-Message-State: AOJu0Yz3MYzpxGxqNz4X78JgHeWNO4oCIA9ce/PJM8GgUKHRHFemdywa
	2DVt58Yr+/YW6cFIQKLjRsiSHzgsNNSH5OUdyFbzSuoGoCtw2i7px8Rnv21cIiq3dQi8eDNqLIj
	MJF4pUFQQ1emGszwBsZm81+US5ScrsshK61k0KhthRwgl3xRSUw9WIA==
X-Received: by 2002:a05:6830:18d1:b0:6f1:18da:603 with SMTP id 46e09a7af769-6f118da06admr4748018a34.4.1715776907117;
        Wed, 15 May 2024 05:41:47 -0700 (PDT)
X-Received: by 2002:a05:6830:18d1:b0:6f1:18da:603 with SMTP id 46e09a7af769-6f118da06admr4747995a34.4.1715776906686;
        Wed, 15 May 2024 05:41:46 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54b58b5sm82910141cf.7.2024.05.15.05.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 05:41:46 -0700 (PDT)
Message-ID: <195e906c-d263-4736-91aa-69274fa85180@redhat.com>
Date: Wed, 15 May 2024 14:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 06/18] hw/arm/smmu: Consolidate ASID and VMID types
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-7-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-7-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z8MOm4TV0aTy

Hi Mostafa,
On 4/29/24 05:23, Mostafa Saleh wrote:
> ASID and VMID used to be uint16_t in the translation config, however,
> in other contexts they can be int as -1 in case of TLB invalidation,
other contexts = TLB invalidation, right?
> to represent all(don’t care).
add space bewteen all and (.
> When stage-2 was added asid was set to -1 in stage-2 and vmid to -1
> in stage-1 configs. However, that meant they were set as (65536),
> this was not an issue as nesting was not supported and no
> commands/lookup targets both.
s/targets/uses
>
> With nesting, it’s critical to get this right as translation must be
> tagged correctly with ASID/VMID, and with ASID=-1 meaning stage-2.
> Represent ASID/VMID everywhere as int.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 10 +++++-----
>  hw/arm/smmuv3.c              |  4 ++--
>  hw/arm/trace-events          | 18 +++++++++---------
>  include/hw/arm/smmu-common.h | 14 +++++++-------
>  4 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index d94db6b34f..21982621c0 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -57,7 +57,7 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>             (k1->vmid == k2->vmid);
>  }
>  
> -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> +SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level)
>  {
>      SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
> @@ -130,7 +130,7 @@ void smmu_iotlb_inv_all(SMMUState *s)
>  static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>                                           gpointer user_data)
>  {
> -    uint16_t asid = *(uint16_t *)user_data;
> +    int asid = *(int *)user_data;
>      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
>  
>      return SMMU_IOTLB_ASID(*iotlb_key) == asid;
> @@ -139,7 +139,7 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>  static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
>                                           gpointer user_data)
>  {
> -    uint16_t vmid = *(uint16_t *)user_data;
> +    int vmid = *(int *)user_data;
>      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
>  
>      return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
> @@ -191,13 +191,13 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                                  &info);
>  }
>  
> -void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
> +void smmu_iotlb_inv_asid(SMMUState *s, int asid)
>  {
>      trace_smmu_iotlb_inv_asid(asid);
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
>  }
>  
> -void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
> +void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
>  {
>      trace_smmu_iotlb_inv_vmid(vmid);
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index f98c157221..cc61708160 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1243,7 +1243,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          }
>          case SMMU_CMD_TLBI_NH_ASID:
>          {
> -            uint16_t asid = CMD_ASID(&cmd);
> +            int asid = CMD_ASID(&cmd);
>  
>              if (!STAGE1_SUPPORTED(s)) {
>                  cmd_error = SMMU_CERROR_ILL;
> @@ -1276,7 +1276,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              break;
>          case SMMU_CMD_TLBI_S12_VMALL:
>          {
> -            uint16_t vmid = CMD_VMID(&cmd);
> +            int vmid = CMD_VMID(&cmd);
>  
>              if (!STAGE2_SUPPORTED(s)) {
>                  cmd_error = SMMU_CERROR_ILL;
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index cc12924a84..09ccd39548 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -11,13 +11,13 @@ smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint6
>  smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
>  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
>  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
> -smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
> -smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
> -smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
> +smmu_iotlb_inv_asid(int asid) "IOTLB invalidate asid=%d"
> +smmu_iotlb_inv_vmid(int vmid) "IOTLB invalidate vmid=%d"
> +smmu_iotlb_inv_iova(int asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
>  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
> -smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> -smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> -smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
> +smmu_iotlb_lookup_hit(int asid, int vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> +smmu_iotlb_lookup_miss(int asid, int vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> +smmu_iotlb_insert(int asid, int vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
>  
>  # smmuv3.c
>  smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
> @@ -48,12 +48,12 @@ smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t p
>  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
>  smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
>  smmuv3_cmdq_tlbi_nh(void) ""
> -smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
> -smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
> +smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=%d"
> +smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
>  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
> -smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
> +smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
>  
>  # strongarm.c
>  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 5944735632..96eb017e50 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -84,7 +84,7 @@ typedef struct SMMUS2Cfg {
>      bool record_faults;     /* Record fault events (S2R) */
>      uint8_t granule_sz;     /* Granule page shift (based on S2TG) */
>      uint8_t eff_ps;         /* Effective PA output range (based on S2PS) */
> -    uint16_t vmid;          /* Virtual Machine ID (S2VMID) */
> +    int vmid;               /* Virtual Machine ID (S2VMID) */
>      uint64_t vttb;          /* Address of translation table base (S2TTB) */
>  } SMMUS2Cfg;
>  
> @@ -108,7 +108,7 @@ typedef struct SMMUTransCfg {
>      uint64_t ttb;              /* TT base address */
>      uint8_t oas;               /* output address width */
>      uint8_t tbi;               /* Top Byte Ignore */
> -    uint16_t asid;
> +    int asid;
>      SMMUTransTableInfo tt[2];
>      /* Used by stage-2 only. */
>      struct SMMUS2Cfg s2cfg;
> @@ -132,8 +132,8 @@ typedef struct SMMUPciBus {
>  
>  typedef struct SMMUIOTLBKey {
>      uint64_t iova;
> -    uint16_t asid;
> -    uint16_t vmid;
> +    int asid;
> +    int vmid;
>      uint8_t tg;
>      uint8_t level;
>  } SMMUIOTLBKey;
> @@ -205,11 +205,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
>  SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>                                  SMMUTransTableInfo *tt, hwaddr iova);
>  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
> -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> +SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
>  void smmu_iotlb_inv_all(SMMUState *s);
> -void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> -void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
> +void smmu_iotlb_inv_asid(SMMUState *s, int asid);
> +void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>  
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
