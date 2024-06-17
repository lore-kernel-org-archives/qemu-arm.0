Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp276601ejb;
        Mon, 17 Jun 2024 07:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnV0iURl7yOJ5Tgevnj9WV7B2ieq+R28BBFaFcpmSuGBzzK0fA7tYEm5FLMikusWjSjWpNWYNFwE16IkoqRvPMH8wRY3g8
X-Received: by 2002:a05:600c:17d0:b0:423:b5f9:203f with SMTP id 5b1f17b1804b1-423b5f92170mr51042135e9.5.1718636136887;
        Mon, 17 Jun 2024 07:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718636136; cv=none;
        d=google.com; s=arc-20160816;
        b=bn0EmbjMQbd61yvOhMe1CJkGhQRNcPv8eI3pc2lzLw2P1LbHVbiW8WK3a2WxeE1qQH
         6yblrZi9H25yROxEfsG7t+OTmJSaZh3xfXSSMvZ8eH4OgIjePSg6MFA3u9I+koxW6tQ6
         aEq2g2hkTN+VNTKmfs6xzC+4Ri2I3uby5MeSfRiv79IZrGIOPwTGGjd+5/JDYMIQRHZ1
         tA6GPGzfNhONv/ZwwLlct1Zfzy1azboHLBYdaaWM9PtJo4akb1/R1GhqszDbKF/yUrKx
         CTGVC8R09+Ff1QrUefDWZLSsRlXirPD500J4WrGd4r5Mq1MCEIunpoE9q6ueDGHeo7e6
         fvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=YW8LPdrw//MdeQil/DozMxJbu8Hmu55sYoSzVF76hVA=;
        fh=EIQ2yNVkY6YcN2VlUcrj/lTAeGHNUJXt7SPv0bDv3uo=;
        b=FUGgfHGflKp2NiD6f9ehFe8t358MT23Is9pwVFahyq6e0seIQuaVVh5wvaYZhcD3Od
         xlIMS4Nl/YzxZw4prwxQjICtJIHR+zoZykgDA7mKdfSUOSQFbyzuvV9Tal+FD4306rb5
         80fRsNeVUZxb/JPhVjLi8BJuOEBRTyzOcKsdnLRxLpvO1TOLdexUGKB9Epl/hnqT1sYX
         AEMf0P/CVnvjizvPd75lDdrGXjnVUYEAnUKfE39ri4/CG/Gws4Ys0w1Gc49tMaW03nOY
         L6xUAOuSv1t2mDG7RMH/RHeOl5XPi33iGMNIomLByXOLp9ZmLW/CcN85jsB3ovqA7fAt
         t5wA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4Tweb8aB;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4226069c5basor4390205e9.4.2024.06.17.07.55.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2024 07:55:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4Tweb8aB;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718636136; x=1719240936; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YW8LPdrw//MdeQil/DozMxJbu8Hmu55sYoSzVF76hVA=;
        b=4Tweb8aBII7ZQn1rekLC177rJgo/34xi4d2YIH+jsqesrc4qLF+MIZlEN9BvvV4AFA
         zUCJ0MfhzVT1dBNR8CJsgwR/SQKoF89++3WSkO0Ab74PWdsHM0PlRrPt0gYErx+g2h4O
         xBlL+AE5lZQ3rKXvlz1lm8nAM4RBSzRiZOy23+9xR8BN/RkVhEhPeWj93NybPPBng+AT
         Go8rSdWsUMeN6HCIkp6wJbLdcqw5kT/RbFLVYjIqQnDQLsza5YtEmdWCft/Op64NTJ1a
         HRL1dmHAN4Cr+BuR7A2W46jD+2V1aK6MljlOLpAjNQCObr920MpPFrQs7LqPHtz+vUI4
         6/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636136; x=1719240936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YW8LPdrw//MdeQil/DozMxJbu8Hmu55sYoSzVF76hVA=;
        b=MQXl6tMzXWgv8Nm7s4A8QpfYbhLXiRHW9apqSVZAiXFaVkfaZCXZ+DMiV/7Ti1Xyd/
         HZhyeT1R32B4Ef/vndZhCR3AVWH1q27CiQWkqierqJQQiJftwloBxS2yLSdH3cKsSkDo
         XxyO568BK7O+rZ3/N+HqxchbZ5S9w5ep5A0y6pintva5PHPecFB1yYiphBiGTn0nr+VP
         zMto7qi/LgfJFra0oxG1kH3nCOeAe1WIGX6Ld/iyFT47zqs2zT3Fs03DF22EObmKYPr3
         JO4o6zOHCnSmNmr2dFL62LkrAl9GfT2lHutPUcIYYBwzbBAJ7C+ndnt0Ytl6MP/OwKiY
         4QFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWv6gA2PAr6NbpIAwc1ZZFSj47Fg4PssFzZP3FHBbqyzrtcNCgR6+r4JsaKCmlcHaUo2vmk6/lp7HbZjhkMdSKBnfiyV0W
X-Gm-Message-State: AOJu0YwDLgRg0rW3jGg9yKz6WRHlhAnnD8nuOl/EwdEg+YrE2AQQB6Lq
	QLeG9Smcgau6aJhJbOEUInv5sx6TDh5tapsan506PoLK0QCtLpEaMTxMRh2WJA==
X-Google-Smtp-Source: AGHT+IFXzmOtwaD5F2r7tIXTXTMYDoLPmdgX02huuLQ5xw3CYNo9vYHY3+sGEtltIxPD8lJmIykM0w==
X-Received: by 2002:a05:600c:3d0d:b0:422:ffac:f8c0 with SMTP id 5b1f17b1804b1-423b669a19bmr3492795e9.7.1718636136170;
        Mon, 17 Jun 2024 07:55:36 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f602feb0sm158291435e9.20.2024.06.17.07.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:55:34 -0700 (PDT)
Date: Mon, 17 Jun 2024 14:55:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 06/18] hw/arm/smmu: Consolidate ASID and VMID types
Message-ID: <ZnBOYvlm-bnbQMjV@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-7-smostafa@google.com>
 <195e906c-d263-4736-91aa-69274fa85180@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <195e906c-d263-4736-91aa-69274fa85180@redhat.com>
X-TUID: DR4ECBOs3ZQr

Hi Eric,

Sorry no updates for a while, I have been away for some time,
but I am now back to working on this.

On Wed, May 15, 2024 at 02:41:42PM +0200, Eric Auger wrote:
> Hi Mostafa,
> On 4/29/24 05:23, Mostafa Saleh wrote:
> > ASID and VMID used to be uint16_t in the translation config, however,
> > in other contexts they can be int as -1 in case of TLB invalidation,
> other contexts = TLB invalidation, right?

Yes, although I was thinking this can be used for global entries lookup also
in case we would support it in the future.

Thanks,
Mostafa
> > to represent all(don’t care).
> add space bewteen all and (.
> > When stage-2 was added asid was set to -1 in stage-2 and vmid to -1
> > in stage-1 configs. However, that meant they were set as (65536),
> > this was not an issue as nesting was not supported and no
> > commands/lookup targets both.
> s/targets/uses
> >
> > With nesting, it’s critical to get this right as translation must be
> > tagged correctly with ASID/VMID, and with ASID=-1 meaning stage-2.
> > Represent ASID/VMID everywhere as int.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c         | 10 +++++-----
> >  hw/arm/smmuv3.c              |  4 ++--
> >  hw/arm/trace-events          | 18 +++++++++---------
> >  include/hw/arm/smmu-common.h | 14 +++++++-------
> >  4 files changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index d94db6b34f..21982621c0 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -57,7 +57,7 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
> >             (k1->vmid == k2->vmid);
> >  }
> >  
> > -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> > +SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
> >                                  uint8_t tg, uint8_t level)
> >  {
> >      SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
> > @@ -130,7 +130,7 @@ void smmu_iotlb_inv_all(SMMUState *s)
> >  static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
> >                                           gpointer user_data)
> >  {
> > -    uint16_t asid = *(uint16_t *)user_data;
> > +    int asid = *(int *)user_data;
> >      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
> >  
> >      return SMMU_IOTLB_ASID(*iotlb_key) == asid;
> > @@ -139,7 +139,7 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
> >  static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
> >                                           gpointer user_data)
> >  {
> > -    uint16_t vmid = *(uint16_t *)user_data;
> > +    int vmid = *(int *)user_data;
> >      SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
> >  
> >      return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
> > @@ -191,13 +191,13 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >                                  &info);
> >  }
> >  
> > -void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
> > +void smmu_iotlb_inv_asid(SMMUState *s, int asid)
> >  {
> >      trace_smmu_iotlb_inv_asid(asid);
> >      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
> >  }
> >  
> > -void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
> > +void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
> >  {
> >      trace_smmu_iotlb_inv_vmid(vmid);
> >      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index f98c157221..cc61708160 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -1243,7 +1243,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
> >          }
> >          case SMMU_CMD_TLBI_NH_ASID:
> >          {
> > -            uint16_t asid = CMD_ASID(&cmd);
> > +            int asid = CMD_ASID(&cmd);
> >  
> >              if (!STAGE1_SUPPORTED(s)) {
> >                  cmd_error = SMMU_CERROR_ILL;
> > @@ -1276,7 +1276,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
> >              break;
> >          case SMMU_CMD_TLBI_S12_VMALL:
> >          {
> > -            uint16_t vmid = CMD_VMID(&cmd);
> > +            int vmid = CMD_VMID(&cmd);
> >  
> >              if (!STAGE2_SUPPORTED(s)) {
> >                  cmd_error = SMMU_CERROR_ILL;
> > diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> > index cc12924a84..09ccd39548 100644
> > --- a/hw/arm/trace-events
> > +++ b/hw/arm/trace-events
> > @@ -11,13 +11,13 @@ smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint6
> >  smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
> >  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
> >  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
> > -smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
> > -smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
> > -smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
> > +smmu_iotlb_inv_asid(int asid) "IOTLB invalidate asid=%d"
> > +smmu_iotlb_inv_vmid(int vmid) "IOTLB invalidate vmid=%d"
> > +smmu_iotlb_inv_iova(int asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
> >  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
> > -smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> > -smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> > -smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
> > +smmu_iotlb_lookup_hit(int asid, int vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> > +smmu_iotlb_lookup_miss(int asid, int vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> > +smmu_iotlb_insert(int asid, int vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
> >  
> >  # smmuv3.c
> >  smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
> > @@ -48,12 +48,12 @@ smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t p
> >  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> >  smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
> >  smmuv3_cmdq_tlbi_nh(void) ""
> > -smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
> > -smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
> > +smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=%d"
> > +smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
> >  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
> >  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
> >  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
> > -smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
> > +smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
> >  
> >  # strongarm.c
> >  strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index 5944735632..96eb017e50 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -84,7 +84,7 @@ typedef struct SMMUS2Cfg {
> >      bool record_faults;     /* Record fault events (S2R) */
> >      uint8_t granule_sz;     /* Granule page shift (based on S2TG) */
> >      uint8_t eff_ps;         /* Effective PA output range (based on S2PS) */
> > -    uint16_t vmid;          /* Virtual Machine ID (S2VMID) */
> > +    int vmid;               /* Virtual Machine ID (S2VMID) */
> >      uint64_t vttb;          /* Address of translation table base (S2TTB) */
> >  } SMMUS2Cfg;
> >  
> > @@ -108,7 +108,7 @@ typedef struct SMMUTransCfg {
> >      uint64_t ttb;              /* TT base address */
> >      uint8_t oas;               /* output address width */
> >      uint8_t tbi;               /* Top Byte Ignore */
> > -    uint16_t asid;
> > +    int asid;
> >      SMMUTransTableInfo tt[2];
> >      /* Used by stage-2 only. */
> >      struct SMMUS2Cfg s2cfg;
> > @@ -132,8 +132,8 @@ typedef struct SMMUPciBus {
> >  
> >  typedef struct SMMUIOTLBKey {
> >      uint64_t iova;
> > -    uint16_t asid;
> > -    uint16_t vmid;
> > +    int asid;
> > +    int vmid;
> >      uint8_t tg;
> >      uint8_t level;
> >  } SMMUIOTLBKey;
> > @@ -205,11 +205,11 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
> >  SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> >                                  SMMUTransTableInfo *tt, hwaddr iova);
> >  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
> > -SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> > +SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
> >                                  uint8_t tg, uint8_t level);
> >  void smmu_iotlb_inv_all(SMMUState *s);
> > -void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> > -void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
> > +void smmu_iotlb_inv_asid(SMMUState *s, int asid);
> > +void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
> >  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
> >  
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric
> 
