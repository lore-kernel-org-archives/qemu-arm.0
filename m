Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1346926ejb;
        Mon, 20 May 2024 03:24:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXomRCwCB+1NnkRfhR6BobsRG/hnJLJGjsIk6JAVU5pBlODuRScK6yXhlNDuylhRyu8WVREcz6igxHGtdwXZalDEqmSUKt7
X-Google-Smtp-Source: AGHT+IERpQZz38N7ovIVYPVu0YbCUShGrrJA/BNsdXijcOZseFqEgcFaViWv+Exg8jsS2paib9rF
X-Received: by 2002:a05:620a:12e1:b0:792:8c59:f56d with SMTP id af79cd13be357-79470efc950mr967182985a.30.1716200670909;
        Mon, 20 May 2024 03:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716200670; cv=none;
        d=google.com; s=arc-20160816;
        b=I6IJUqMZ+ZjzxRW1zL3nhv9lGvjgXow3FQqgoFihoQcfC73b8AcGvA8d/OjlK/0EWB
         VMdrI4xSrfeN111EAMuSEBdvbuDRVHy9e+ZMkmi+EV05knF5wD16Yz+P9v/kXiwfyVMw
         HA7N3Rek/NYw/X2nILMN0rtnRT9NDyCJPNU+ayAH1dIiPsqSDyvxrc50tFCfzSEbAHD+
         Z42ltWH3AGG/pofUt4scuPizebH+AGTBNmZ2IjTTmCXIS7+Pc7pS1OxKpmQnWEJf3ia9
         tOFy8yWcBADpMfMM6gpRsMS4HaoZSwOpDFCi1tXXwzzOirPLJ4XwnKFcJMK23JoXQRJz
         6LqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=v2mXU+YKbYxFyn3jzKIXGXEm6bgFua14bYaQ5Tp6/l8=;
        fh=M63QtxbhfRvCS22jfQu7j8V7uBLmra9GvSOEYHn3Zn0=;
        b=oPw8ymz9NjbDYBCtCp/hXLCemBcizcERlkVfNhoN+LezFAJUH3NLYfRJwyrGXq0Ta7
         t3L3R5C5FIPRTS21Yl3WQQwbtmhmtxeCuJMluZ0b5P8VI3OX7a32rvRMj5FU6puR9CaG
         1i3Fk/k5y5gltaUiW/CGQqA3WLvB+3zW+Ds+wRQcYY8g7UeGi9c41b+t7uy8V42pvQnt
         Q88409fa4I+RRzT73cFob1A4XAJJAuh54YsWWz6553ZjILQqZsAt7LhkQtyzPpZ7J+6x
         h0s1axY4UHsxSWCTfoFg+iE6d8NK4wjXPUY8wc49wmW+TuW96cIHhQiHciibNrrd8ZCJ
         OCTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hFSC5YH8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-792bf30b5fcsi885955185a.355.2024.05.20.03.24.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 03:24:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hFSC5YH8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716200670;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v2mXU+YKbYxFyn3jzKIXGXEm6bgFua14bYaQ5Tp6/l8=;
	b=hFSC5YH8licNbumrGhaRsVwx0eW+QLV4LI1nNdZyJL/9aS6BjfEO8RC4kRZHDKq6swMpnZ
	PaL57zmN9r8+P6mfWPMpzZ8OqrmSp/D1sOjrxHmeCGCS12W7kzy4Ic4IIU2XCs2oCdYNP6
	LRrdM400+lJ1fq6M8Vrkn+E851U+CQs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-CZ7r7TODN8SFeZcvQPTiuQ-1; Mon, 20 May 2024 06:24:27 -0400
X-MC-Unique: CZ7r7TODN8SFeZcvQPTiuQ-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-43e3948ab75so77645801cf.1
        for <alex.bennee@linaro.org>; Mon, 20 May 2024 03:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716200666; x=1716805466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2mXU+YKbYxFyn3jzKIXGXEm6bgFua14bYaQ5Tp6/l8=;
        b=hi7lt0s8mSQGEeTQWx5dR9ze7gC7ZmNmrdLn0eRGpQIVtHSDQnM0IGpiXg4z0uW3a5
         A2em7L+YD+lfFxIK8e9AZqFzSW2ZjkO8RUg93oFXD8L9eMav/l7nYawccYrZOG/g1rc2
         hf4Dn+39MaiugW7j3RvGY5dBZcS23pOb63SWUHM+dpZTV/f10hyt/grZpN1RXxrjl4eB
         hEd5e5W1pH0q+ctVSdGTDRXSKrNFaltMI5X+C+zdbToQTJY8gafxadD8XDKyaNLFN3W/
         T1kW3jCU2U0j/Xssc6jGpDQ/AnJNo6MtNL4z7C6c92tyz/XTK3SyXN63SRCTg4lZEdMG
         crWA==
X-Forwarded-Encrypted: i=1; AJvYcCUvdi1bBjbPemjycbMg+4sjHSrs+yVycXSN4kOn5a/8hL1DJM6CFUK3aQV+ncYabbFwLkybskZar0JGR7VaevvWr8YLVUDe
X-Gm-Message-State: AOJu0YxuKhviKHXCfYWbisOJb3PVTpTBnml3IiqlcZzbMVAlRGjgTLxW
	Y/9q1658bPLrT9CLsAw6OQWxq1E1PEFNIso6CEhaVtITlwuHLbyDe0ARapwXBD2Lk8ts2nIMjmW
	cP2qualRP/QQedxKjN3pGIoB9YBGh885lA3nliM5QYkSqyuB5fXEOng==
X-Received: by 2002:ac8:5dc6:0:b0:43e:26f5:7e5d with SMTP id d75a77b69052e-43f7a2a487bmr85230851cf.12.1716200666402;
        Mon, 20 May 2024 03:24:26 -0700 (PDT)
X-Received: by 2002:ac8:5dc6:0:b0:43e:26f5:7e5d with SMTP id d75a77b69052e-43f7a2a487bmr85230701cf.12.1716200665967;
        Mon, 20 May 2024 03:24:25 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e3a57b396sm62248221cf.24.2024.05.20.03.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 03:24:25 -0700 (PDT)
Message-ID: <27ca2ea6-94b6-4839-b127-6ac6bc1c7808@redhat.com>
Date: Mon, 20 May 2024 12:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 12/18] hw/arm/smmu: Support nesting in the rest of
 commands
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-13-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-13-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: UeGKuPS4pz6i

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
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
> ---
>  hw/arm/smmu-common.c         | 36 +++++++++++++++++++++++++++++-------
>  hw/arm/smmuv3.c              | 31 +++++++++++++++++++++++++++++--
>  hw/arm/trace-events          |  6 ++++--
>  include/hw/arm/smmu-common.h |  3 ++-
>  4 files changed, 64 insertions(+), 12 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index fa2460cf64..3ed0be05ef 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -147,13 +147,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
>      g_hash_table_remove_all(s->iotlb);
>  }
>  
> -static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
> -                                         gpointer user_data)
> +static gboolean smmu_hash_remove_by_asid_vmid(gpointer key, gpointer value,
> +                                              gpointer user_data)
Can't you introduce

smmu_hash_remove_by_asid_vmid() separately and replace the smmu_iotlb_inv_asid() call in SMMU_CMD_TLBI_NH_ASID.
Then you could focus on "if stage2 is supported" enhancements in this patch.

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
> @@ -165,6 +166,16 @@ static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
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
> @@ -258,10 +269,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
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
>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
> @@ -270,6 +286,12 @@ void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
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
> index 82d918d9b5..e0fd494646 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1303,25 +1303,52 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
> index de032fdfd1..361e639630 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -212,8 +212,9 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
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
Otherwise looks good to me

Eric
