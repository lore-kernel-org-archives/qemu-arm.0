Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2305394ejd;
        Fri, 19 Apr 2024 03:56:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXizzj+yOu2I/mFyCtcuePYj5yUQjE1N/SU4ZeC9eaLITA2fJJ8bJWdmUHz+Aw8xvDFWkCvlhvcn0lgM39Kgba8GD/5yFZR
X-Received: by 2002:a05:600c:4448:b0:419:c823:80e7 with SMTP id v8-20020a05600c444800b00419c82380e7mr128572wmn.14.1713524200958;
        Fri, 19 Apr 2024 03:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713524200; cv=none;
        d=google.com; s=arc-20160816;
        b=DQPPwUvnxoVuZpv98oQpNI3qhYbW0aWciT08AosGd8hEE15BswbDY2QggDJiNLtIXp
         f6IE9p6yY4eYeFxf9rPVwO6i4H0sQEmNRKnoZn8hnh4TV+2n3N5M2yFysWRzdcwiecjI
         WQFNWt8VnBT2lzNANuXBKCVtwZaGGiDjmB+uvbksyeKxxfxs/NMYLOXNCYGqH0v1MqZs
         YE6kMYMV7LN0wYhnE+/JidRh572yM/VIol+PLC1JWjSisdVi0UjDp0Yva05ETC4t8AmE
         0itNuj9WYUo35AV/TVtEDcAOtYI1kzeVfg7V0AqkjzIAivbQYj6VK1wx4/91pXjbPMno
         s1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Vn6JiMl4zrHUKjgNBj59H2lkepqikhr5ZPOEGsYcT9A=;
        fh=plGZwRwhYvsW+fF511Q8Xhff3I0Dck57p0IAXr+reXc=;
        b=eGN5lMxjOzmvwtblhZ4l+D9fPR08CGtz3yzFRH7ihK+rZj2bLAxDvGxO5JXqHnZ4Nn
         W+AGI9yxzHBuQs2E+pMkXkPMgZczceXr4i5X/nolSoUbBJjgk8V8f5do9sVP2NLZsvMj
         8SQ0d3kBWXHYi0yIoc4lcwALGahWWSB5QNQOsj6DNTfo7beSNSkSZQ8+hom21U6l21Uq
         v/b4BSjmrcPRgm3tj/jRaDZl0/h6iEDaLZlFrZrVB5E6VX0vQbXD8YuDuSIvWNjbPIfC
         I8EjqNLWoG4P94uwLFHbsDc+A7eL2BYtiGjCOWgscNmyEbK9w7nWqZQSHkWkNigMQ+P1
         OJYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0V82qM0z;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jn21-20020a05600c6b1500b0041868ee437esor350165wmb.1.2024.04.19.03.56.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 03:56:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0V82qM0z;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713524200; x=1714129000; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vn6JiMl4zrHUKjgNBj59H2lkepqikhr5ZPOEGsYcT9A=;
        b=0V82qM0z8i3QrAP0xqsX3+TKyfrcH01V93sF6vMakTcGz79AiamBsZr32BdsY/pnd/
         pO+JAa/XUyKn+hFKpfZM01eSG5JSu8u7LQ04vH0dk4w0PJlhXgIkoFeSp2sIr4LQlkOe
         jq+4U7IvAdHB/VLQ1dokhPgQXwzY4UbPMhFh4yEe5qwdNhDrBdPVdQ+ap4vjUQTH269j
         5uCCrNHFCLCzPWDA0O59/MVEYCztTAfPE9TXEMRNFjIHmSl4wFQJpgCu7Nf+qVlMmmF2
         pYxPaVH3ADQnFyE/YYJaKCPZKZN0yqUS2cEtEnTlzWEXyu6USVCRcMf3wioccvg4kI5o
         IARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524200; x=1714129000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vn6JiMl4zrHUKjgNBj59H2lkepqikhr5ZPOEGsYcT9A=;
        b=mrCCY4NUQRMEdtlZV+2Ty/IG3bM3gVKxyWQiQjaaL/Ddl1md5rnOb4jIpLUHeDFJaa
         2OSw6mPbivsOQ7jZOIDqf3fni+wX89YFaE1T+IMAdaSVGKyYAV3lAYYfzohjMYyIr2fa
         nx5vwK1kuFRkcEhO33p8V/TQvSb0WS6/qxWs2tqJnmyu7zVo+CI9SsrDitfUdBQTY/7+
         9TExbV9Hk8QxB/fnY7I/cok0Y+74FUQs4VU6CJ215MVqhR8YGVEzSb6S01nlMiQqltvU
         ZRi/T+x9w4VUUB2UQxnb0CIwq2n34oQWLDPQw7GB9oEhJa4lfE/jYYB50MzWtI5Ujna7
         yZvA==
X-Forwarded-Encrypted: i=1; AJvYcCU067wr8EWQdEPCZ1f+4yokiLmESooeZJ3Edlvx1ZLZno/5HTBDkaswR1BkDIc7Wd2L33CNgDArOA2ZkJJgUa7zp3gzIYpR
X-Gm-Message-State: AOJu0YxA2um6Iex1iayUuo5kHq+JzM8DFEBPSje4jCqW04Agf5kvAyc0
	jeVG1ZA0dgQWzc/8y/IUgbucnvC6J5cS0C9TnSL3eJn022mSdZbPjnLQcUvsUAlav6jzfkvcV3C
	aqg==
X-Google-Smtp-Source: AGHT+IEExGVRPnQLjJi4jYbVSqdpM5by59bS570RPwLR/+HBg1+MV6yVt4BanzsSyCObw6kyO8eq7g==
X-Received: by 2002:a05:600c:1d13:b0:418:5aaa:7db1 with SMTP id l19-20020a05600c1d1300b004185aaa7db1mr127384wms.1.1713524200382;
        Fri, 19 Apr 2024 03:56:40 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id f18-20020adff592000000b00343a0e2375esm4114611wro.27.2024.04.19.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 03:56:39 -0700 (PDT)
Date: Fri, 19 Apr 2024 10:56:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v2 07/13] hw/arm/smmu: Support nesting in the rest of
 commands
Message-ID: <ZiJN5AG4lgOU8Mg4@google.com>
References: <20240408140818.3799590-1-smostafa@google.com>
 <20240408140818.3799590-8-smostafa@google.com>
 <cfb5e002-26d4-437a-91d5-7c2eb49a75b6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfb5e002-26d4-437a-91d5-7c2eb49a75b6@redhat.com>
X-TUID: K/C7sDS2rmgf

Hi Eric,

On Thu, Apr 18, 2024 at 04:48:39PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/8/24 16:08, Mostafa Saleh wrote:
> > Some commands need rework for nesting, as they used to assume S1
> > and S2 are mutually exclusive:
> >
> > - CMD_TLBI_NH_ASID: Consider VMID if stage-2 is supported
> > - CMD_TLBI_NH_ALL: Consider VMID if stage-2 is supported, otherwise
> >   invalidate everything, this required a new vmid invalidation
> >   function for stage-1 only (ASID >= 0)
> >
> > Also, rework trace events to reflect the new implementation.
> 
> This does not apply for me. Could you share a branch or respin?

Oh, Sorry about that. I will address the previous comments and respin.

Thanks,
Mostafa

> 
> Thank you in advance
> 
> Eric
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c         | 36 +++++++++++++++++++++++++++++-------
> >  hw/arm/smmuv3.c              | 31 +++++++++++++++++++++++++++++--
> >  hw/arm/trace-events          |  6 ++++--
> >  include/hw/arm/smmu-common.h |  3 ++-
> >  4 files changed, 64 insertions(+), 12 deletions(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 8b9e59b24b..b1cf1303c6 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -148,13 +148,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
> >      g_hash_table_remove_all(s->iotlb);
> >  }
> >  
> > -static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
> > -                                         gpointer user_data)
> > +static gboolean smmu_hash_remove_by_asid_vmid(gpointer key, gpointer value,
> > +                                              gpointer user_data)
> >  {
> > -    int asid = *(int *)user_data;
> > +    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
> >      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
> >  
> > -    return SMMU_IOTLB_ASID(*iotlb_key) == asid;
> > +    return (SMMU_IOTLB_ASID(*iotlb_key) == info->asid) &&
> > +           (SMMU_IOTLB_VMID(*iotlb_key) == info->vmid);
> >  }
> >  
> >  static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
> > @@ -166,6 +167,16 @@ static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
> >      return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
> >  }
> >  
> > +static gboolean smmu_hash_remove_by_vmid_s1(gpointer key, gpointer value,
> > +                                            gpointer user_data)
> > +{
> > +    int vmid = *(int *)user_data;
> > +    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
> > +
> > +    return (SMMU_IOTLB_VMID(*iotlb_key) == vmid) &&
> > +           (SMMU_IOTLB_ASID(*iotlb_key) >= 0);
> > +}
> > +
> >  static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
> >                                                gpointer user_data)
> >  {
> > @@ -259,10 +270,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
> >                                  &info);
> >  }
> >  
> > -void smmu_iotlb_inv_asid(SMMUState *s, int asid)
> > +void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid)
> >  {
> > -    trace_smmu_iotlb_inv_asid(asid);
> > -    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
> > +    SMMUIOTLBPageInvInfo info = {
> > +        .asid = asid,
> > +        .vmid = vmid,
> > +    };
> > +
> > +    trace_smmu_iotlb_inv_asid_vmid(asid, vmid);
> > +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid_vmid, &info);
> >  }
> >  
> >  inline void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
> > @@ -271,6 +287,12 @@ inline void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
> >      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
> >  }
> >  
> > +inline void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid)
> > +{
> > +    trace_smmu_iotlb_inv_vmid_s1(vmid);
> > +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid_s1, &vmid);
> > +}
> > +
> >  /* VMSAv8-64 Translation */
> >  
> >  /**
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 17bbd43c13..ece647b8bf 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -1280,25 +1280,52 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
> >          case SMMU_CMD_TLBI_NH_ASID:
> >          {
> >              int asid = CMD_ASID(&cmd);
> > +            int vmid = -1;
> >  
> >              if (!STAGE1_SUPPORTED(s)) {
> >                  cmd_error = SMMU_CERROR_ILL;
> >                  break;
> >              }
> >  
> > +            /*
> > +             * VMID is only matched when stage 2 is supported for the Security
> > +             * state corresponding to the command queue that the command was
> > +             * issued in.
> > +             * QEMU ignores the field by setting to -1, similarly to what STE
> > +             * decoding does. And invalidation commands ignore VMID < 0.
> > +             */
> > +            if (STAGE2_SUPPORTED(s)) {
> > +                vmid = CMD_VMID(&cmd);
> > +            }
> > +
> >              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
> >              smmu_inv_notifiers_all(&s->smmu_state);
> > -            smmu_iotlb_inv_asid(bs, asid);
> > +            smmu_iotlb_inv_asid_vmid(bs, asid, vmid);
> >              break;
> >          }
> >          case SMMU_CMD_TLBI_NH_ALL:
> > +        {
> > +            int vmid = -1;
> > +
> >              if (!STAGE1_SUPPORTED(s)) {
> >                  cmd_error = SMMU_CERROR_ILL;
> >                  break;
> >              }
> > +
> > +            /*
> > +             * If stage-2 is supported, invalidate for this VMID only, otherwise
> > +             * invalidate the whole thing, see SMMU_CMD_TLBI_NH_ASID()
> > +             */
> > +            if (STAGE2_SUPPORTED(s)) {
> > +                vmid = CMD_VMID(&cmd);
> > +                trace_smmuv3_cmdq_tlbi_nh(vmid);
> > +                smmu_iotlb_inv_vmid_s1(bs, vmid);
> > +                break;
> > +            }
> >              QEMU_FALLTHROUGH;
> > +        }
> >          case SMMU_CMD_TLBI_NSNH_ALL:
> > -            trace_smmuv3_cmdq_tlbi_nh();
> > +            trace_smmuv3_cmdq_tlbi_nsnh();
> >              smmu_inv_notifiers_all(&s->smmu_state);
> >              smmu_iotlb_inv_all(bs);
> >              break;
> > diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> > index f5c361d96e..2556f4721a 100644
> > --- a/hw/arm/trace-events
> > +++ b/hw/arm/trace-events
> > @@ -11,8 +11,9 @@ smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint6
> >  smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
> >  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
> >  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
> > -smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
> > +smmu_iotlb_inv_asid_vmid(int asid, uint16_t vmid) "IOTLB invalidate asid=%d vmid=%d"
> >  smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
> > +smmu_iotlb_inv_vmid_s1(uint16_t vmid) "IOTLB invalidate vmid=%d"
> >  smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
> >  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
> >  smmu_iotlb_lookup_hit(int asid, uint16_t vmid, uint64_t addr, uint64_t mask, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" mask=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> > @@ -47,7 +48,8 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
> >  smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> >  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> >  smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
> > -smmuv3_cmdq_tlbi_nh(void) ""
> > +smmuv3_cmdq_tlbi_nh(int vmid) "vmid=%d"
> > +smmuv3_cmdq_tlbi_nsnh(void) ""
> >  smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
> >  smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
> >  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index df166d8477..67db30e85b 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -226,8 +226,9 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
> >  SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
> >                                  uint8_t tg, uint8_t level);
> >  void smmu_iotlb_inv_all(SMMUState *s);
> > -void smmu_iotlb_inv_asid(SMMUState *s, int asid);
> > +void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
> >  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
> > +void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid);
> >  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
> >  void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
> 
