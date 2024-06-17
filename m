Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp278062ejb;
        Mon, 17 Jun 2024 07:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvRYwO1KUiSrNKaZ7rrjsxlCxrpD3fk040yOatXIngqipXuyUdl5PyyVXPGKfruNTdlRcyRFeVBIhWGvTrDS+HR60IpHaw
X-Received: by 2002:a05:600c:5492:b0:421:d8d4:75e3 with SMTP id 5b1f17b1804b1-4230485bac2mr65209205e9.40.1718636328243;
        Mon, 17 Jun 2024 07:58:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718636328; cv=none;
        d=google.com; s=arc-20160816;
        b=eSv4eaXVdK3SBE2gbCQrjE6YpeYxhYMPHN/+i8URzVjegdUrSJ5Y5C4nRQdr2i232b
         hvTjQ/HvUjIjpBVpcPBTildl4ktIGBFtiJZJ75s3ES5C+goNejcuYZVJQsdifsLmorP7
         igfPcVGZjOfVx9vVEB3C6xgm+v0woTSvlEKtjcd+S+C+d6F0eFy4yJk0ca10+g7UhLXH
         scuKAi4gUlGXJV+6AceRoQYaKtmsA7q9JOL+dvoBRptQydz5qD+87kXbvJiDTEXUPjga
         Qmmj1JISiBb8aeTuUB2V5QrQm7Uck8LW97f0hInf/5IkL9ck64sApvY8QIn7Pol31P60
         1beg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=oRKD9la71bCcL7Zd98GHxaANLe1GlvshOPxL6fs3iCs=;
        fh=Y2UuaaMDoy7GRdquiexJSSPv+kgfT5XKxPTVqCCHzlg=;
        b=qHJ/ufazxJzcACzh5ZGUhzRQ4f4dtSYsS0Vf4NZQANrB3CppL3q8RNqkuVyZ/b3oha
         xTBWXnePZB3BCuv8/IPodiqTXFxBJna9JC7t/TWnmytjobJEivWhnPuXBgM0TSU89dNH
         G7EP7ejqOg5RkbaxUtt/5xDGTTJMS/roWn9gwD/TokZ1o0dwSd6kGE3IsnYqN5t9Qx6g
         y/0cGYh30P077d45AcMf8c3YBY6EXH8GIuLFHurDccvVLkl4itDSJYluc6n7lGROF0QR
         2XqPpJDoq45gfmOQaFB/BDttZoeu7L/sMyRCXK9u1PlVZm595whfCVRqCIe3+h83Eiw2
         wZcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ht4cpT5m;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-422606859b0sor4394105e9.1.2024.06.17.07.58.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2024 07:58:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ht4cpT5m;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718636328; x=1719241128; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRKD9la71bCcL7Zd98GHxaANLe1GlvshOPxL6fs3iCs=;
        b=Ht4cpT5m2TFE7IIvUxGy+AlEkA8oThcbxX1ybN5H/uDfRLAXHIRJPqphvl560rtx29
         yziszw/VLJ7om7PgDfqXAIF+EuikFOoUX+hEBP17aDyPdcFkLgnjdkE5oCSayZZK7Hw1
         in/0idzePF+WZ2KgotFPmrgEVAcq0FeWEW6a4QO9MeGFGiqQp+b3R24d7AWvapcKZK+7
         ClUbK3t1OevAp/PIK2JIz6ZyFMbnVZM0UUxNGyKW8UWT48UL7YrAJfAEnD22TRG9yGcy
         X4RHjlXRgKRvlhO1MpD7YPsPjx9jKjCFl7YfXEk3f2KF3CieE4i8B/LMN4IfE6xG0FFa
         yDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636328; x=1719241128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRKD9la71bCcL7Zd98GHxaANLe1GlvshOPxL6fs3iCs=;
        b=HcBmSTUCTre+Apo4AgTQ4NABn+f9WF6llEchhWwYDDuidDsETnvNMRy9uBfZn88xVf
         +0xbH2ze2HnPmvU8I5CLKnLxSl6SiKj3hJuxgVG8TPFlH0pLX1NKqD4c2/U/lEyhwVk2
         G3RkV4qn32svzv16nQYW3dTp8NGu92JbGBDO/4IvEYlDQ5xsiWid6nKawJxrz7dGerFc
         cVnF8JzSFRWwtk3M4YtR3UuxPvNE/5HKn2POavriDPLjox+LaYy/l7Hbh1BZxuBX0zef
         EkjhifJCiiHqlzQVGSXyGC4EMAFKYRmljgc4mw6sL97bc1iMrjm0HL+av4zSVYTUhprX
         uTmw==
X-Forwarded-Encrypted: i=1; AJvYcCU9mvoo5N/TdHob6fybi4woNGkjmi62OCw/np3rRCsFvycXZJQOwd1dHGeguHyxBiHaT9/bcSfRMMRJqAarLepF1TQfFRfy
X-Gm-Message-State: AOJu0Yzr0sdnCJfrgKgQb0Sl9QcBPlM2LOoJKwBseRDnmYSqNX7FZZLr
	63IoE27yTpQi02zppfzmRv1dy8FhS9Sv3WrrhE4R3Gb3FMkrNCwN6HLw4HJ+e+Bp3L8kwom1tRD
	0ug==
X-Google-Smtp-Source: AGHT+IGEmSs0H4hyEkUzif4/i7DAQOkklB/i9jz409G9y9k3JaBtWxckp4dpBODT2hAMMyCppO4RNg==
X-Received: by 2002:a05:600c:500f:b0:41b:4c6a:de7a with SMTP id 5b1f17b1804b1-423b668a734mr3475565e9.3.1718636327446;
        Mon, 17 Jun 2024 07:58:47 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c883sm12117069f8f.29.2024.06.17.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:58:46 -0700 (PDT)
Date: Mon, 17 Jun 2024 14:58:42 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 12/18] hw/arm/smmu: Support nesting in the rest of
 commands
Message-ID: <ZnBPIibjKcjktnb1@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-13-smostafa@google.com>
 <27ca2ea6-94b6-4839-b127-6ac6bc1c7808@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27ca2ea6-94b6-4839-b127-6ac6bc1c7808@redhat.com>
X-TUID: 54gjZKRHOCzZ

Hi Eric,

On Mon, May 20, 2024 at 12:24:22PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/29/24 05:23, Mostafa Saleh wrote:
> > Some commands need rework for nesting, as they used to assume S1
> > and S2 are mutually exclusive:
> >
> > - CMD_TLBI_NH_ASID: Consider VMID if stage-2 is supported
> > - CMD_TLBI_NH_ALL: Consider VMID if stage-2 is supported, otherwise
> >   invalidate everything, this required a new vmid invalidation
> >   function for stage-1 only (ASID >= 0)
> >
> > Also, rework trace events to reflect the new implementation.
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
> > index fa2460cf64..3ed0be05ef 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -147,13 +147,14 @@ void smmu_iotlb_inv_all(SMMUState *s)
> >      g_hash_table_remove_all(s->iotlb);
> >  }
> >  
> > -static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
> > -                                         gpointer user_data)
> > +static gboolean smmu_hash_remove_by_asid_vmid(gpointer key, gpointer value,
> > +                                              gpointer user_data)
> Can't you introduce
> 
> smmu_hash_remove_by_asid_vmid() separately and replace the smmu_iotlb_inv_asid() call in SMMU_CMD_TLBI_NH_ASID.
> Then you could focus on "if stage2 is supported" enhancements in this patch.
> 

Sure, will do.

Thanks,
Mostafa
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
> > @@ -165,6 +166,16 @@ static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
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
> > @@ -258,10 +269,15 @@ void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
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
> >  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
> > @@ -270,6 +286,12 @@ void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
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
> > index 82d918d9b5..e0fd494646 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -1303,25 +1303,52 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
> > index 7d9c1703da..593cc571da 100644
> > --- a/hw/arm/trace-events
> > +++ b/hw/arm/trace-events
> > @@ -11,8 +11,9 @@ smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint6
> >  smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
> >  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
> >  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
> > -smmu_iotlb_inv_asid(int asid) "IOTLB invalidate asid=%d"
> > +smmu_iotlb_inv_asid_vmid(int asid, int vmid) "IOTLB invalidate asid=%d vmid=%d"
> >  smmu_iotlb_inv_vmid(int vmid) "IOTLB invalidate vmid=%d"
> > +smmu_iotlb_inv_vmid_s1(int vmid) "IOTLB invalidate vmid=%d"
> >  smmu_iotlb_inv_iova(int asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
> >  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
> >  smmu_iotlb_lookup_hit(int asid, int vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> > @@ -47,7 +48,8 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
> >  smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> >  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> >  smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
> > -smmuv3_cmdq_tlbi_nh(void) ""
> > +smmuv3_cmdq_tlbi_nh(int vmid) "vmid=%d"
> > +smmuv3_cmdq_tlbi_nsnh(void) ""
> >  smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=%d"
> >  smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
> >  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index de032fdfd1..361e639630 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -212,8 +212,9 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
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
> Otherwise looks good to me
> 
> Eric
> 
