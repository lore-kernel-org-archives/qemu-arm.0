Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3120760njb;
        Tue, 9 Jul 2024 00:19:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXayfY/p1SkkfrUWsZp76njy666D7m0LkkLsVyGVDfsIl5xd+nqy1WIfTVLuXR9banDUae8rlHkOj89usxS55cvebRJ2A48
X-Received: by 2002:a05:6512:114d:b0:52c:dbee:bdb0 with SMTP id 2adb3069b0e04-52eb99d4e86mr1062742e87.59.1720509580969;
        Tue, 09 Jul 2024 00:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720509580; cv=none;
        d=google.com; s=arc-20160816;
        b=NPTeMrF/qf0Vj8Dis+WUYCTh7ED1UYWzCQ3d8eIpsmgQUsQwXzRrUpSEXnzVUlGhf4
         gVzvLklVC0Cq+cAM7nutv1ySFsDJvLfUkrRJiHjuUBZwqllYSV+1Ajhx2vklXRyJaIGj
         8x9CoUORQCGRwxLQVhk3fv8my40KTGibTZ3NR+mMJqKusLfOnghY20N65v+cr4KqErVq
         ATpiLdTYxVM6WHFF1oPylQ2UFrf83dibQhm9R6yJgLo7GrHQvG2OUscRTrHHphfhbyJ5
         cm/zZXt7ZPNRux/O3nS6goBUUlyup+VziJNBwUekOwh787Ckm+TKLfuN1iLKP2PVTyCI
         Ys2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=tsq4U+37Tl7NlZkMyh/LfriJsyfCLzRpcj9KqI175jE=;
        fh=fmCy0shjSgGODPgbJ/uaUIUWyD9a5pR9EYxxtYunreU=;
        b=vplv6xuOcetQhlUgqNb52pbRry3GxOxNTO/9VYeqB80o/e3fALpIypjWMUvBzwjUAx
         Lv0UqP1RQ/AU3iOfadvo92ZpxwU21CB7TYh0Fb80vcfRXSJOymV/aDnRYgeAxoPcnhG1
         3SVp3u+OBs67V8ScxbEp7mTALBR1Tndx/biKuMVvIa549P+YyaGBkE9t8A/TOiu5D2ii
         NdhRZwsLQX7WlRdonbpVRQ/d7ripZSbHJtN+HOXuF/ZJjnYJ525NoFei1qnvJYj0tDTg
         elCCBePfD+Ii6oss2PnYA4vWTXIT3Euw0O8lWKgqxAUrfitYwUqEPk1brvr6Cwr2F3BS
         0ZEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1cyR9Bfl;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4267263af21sor419625e9.6.2024.07.09.00.19.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 00:19:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1cyR9Bfl;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720509580; x=1721114380; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tsq4U+37Tl7NlZkMyh/LfriJsyfCLzRpcj9KqI175jE=;
        b=1cyR9BflRgVoOji92l+aFF8OU9X0Fc+d+vJbUTxXPE608m+yM2i9uBIYiJ2ejfj+l7
         HX+T1I0fUMYW/b+nUxNd3V67iipsFKljEjDEu/sAlCpe2zGZekMEBBMSnmY82K69hQJV
         LoO789KMGtQGKM2PqCv4hgEBOgoWknunX0sVNlNZVvW0ItJCrKdRdU8meONSlrV32WBm
         Dnaies0KVSoTHIoQrrVbZq6spkIk/9cGMOhCwRL9B/DcnIz8GWBwTC0dQK13/DTUE+qh
         XfoiEbEMMKeKItYVKs7I11YdtQz8ssQURgK/k6er2ZeJzG2DymApNJuNXzC0DjSSA6Qg
         JWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509580; x=1721114380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsq4U+37Tl7NlZkMyh/LfriJsyfCLzRpcj9KqI175jE=;
        b=GG03rKD2FLoS+H9/cHH1O1B/WnJ3tDjMnYjj3QGfn7gmyFehuDLDP5+tGP4PUTygQ4
         dUwSu6YoV+3gSIYAxrwT9Mc+6uA4I7MSyf7gutljnL8fweO/ztNKcWzR2IT6LmAcIR5u
         3xyoWnc/0q/aG2tM645p3SnsOHUQm+s7Ga/bAiKL6SQokyA8/HVcWijXZ35LiiKf5HgZ
         6psHVzqRJPb2+OAqBvyTeFDAWzb23OkbNZRmEsZgiOb4oL1bQ1PGBcV5sWplCyQX9ejD
         qeTiIv32/MYRqU8S8/ekQqak6VHU1c/yYX29nh+XKOuHOSjNK5G+IAZKAbT8BvuMcdQQ
         aVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHns27ucTenazZUL+A2x41hKYX5MAiCOLSpTivo3tg3PyNyTs6uOnP09BZr2hXhdl5WneP9HVC9mQniDQlVO41ThjYwg/Y
X-Gm-Message-State: AOJu0YxdvFFnyKEG8CDfyZSbPyTum2SM+UYhXe0v312o6RreQM9GQZOA
	wcj2+oCDG08pSuyTpLZZKjJgmo/dFexJYEQrmcjXuD7kczSt9wZkH8YQsYhWFg==
X-Google-Smtp-Source: AGHT+IHFF/Rtg8GLpIvyfIDHqdYoTZMRnd9JlTuPatZJ3YSm/RdWIjIIPJZpNIvdk//xJqvALURP4A==
X-Received: by 2002:a05:600c:2145:b0:426:5d89:896d with SMTP id 5b1f17b1804b1-426731798e5mr876635e9.1.1720509580046;
        Tue, 09 Jul 2024 00:19:40 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266d0185d9sm50516605e9.3.2024.07.09.00.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:19:39 -0700 (PDT)
Date: Tue, 9 Jul 2024 07:19:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 12/19] hw/arm/smmu: Support nesting in
 smmuv3_range_inval()
Message-ID: <Zozkh8yY1GFaFz0r@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-13-smostafa@google.com>
 <20240704183236.GI1693268@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704183236.GI1693268@myrica>
X-TUID: ygcbXG8fZARW

Hi Jean,

On Thu, Jul 04, 2024 at 07:32:36PM +0100, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:34AM +0000, Mostafa Saleh wrote:
> > With nesting, we would need to invalidate IPAs without
> > over-invalidating stage-1 IOVAs. This can be done by
> > distinguishing IPAs in the TLBs by having ASID=-1.
> > To achieve that, rework the invalidation for IPAs to have a
> > separate function, while for IOVA invalidation ASID=-1 means
> > invalidate for all ASIDs.
> > 
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c         | 47 ++++++++++++++++++++++++++++++++++++
> >  hw/arm/smmuv3.c              | 23 ++++++++++++------
> >  hw/arm/trace-events          |  2 +-
> >  include/hw/arm/smmu-common.h |  3 ++-
> >  4 files changed, 66 insertions(+), 9 deletions(-)
> > 
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 71afd486ba..5bf9eadeff 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -195,6 +195,25 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
> >             ((entry->iova & ~info->mask) == info->iova);
> >  }
> >  
> > +static gboolean smmu_hash_remove_by_vmid_ipa(gpointer key, gpointer value,
> > +                                             gpointer user_data)
> > +{
> > +    SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
> > +    IOMMUTLBEntry *entry = &iter->entry;
> > +    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
> > +    SMMUIOTLBKey iotlb_key = *(SMMUIOTLBKey *)key;
> > +
> > +    if (info->asid >= 0) {
> 
> Should this test SMMU_IOTLB_ASID(iotlb_key) instead?
> 
Yes, nice catch!

> > +        /* This is a stage-1 address. */
> > +        return false;
> > +    }
> > +    if (info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
> > +        return false;
> > +    }
> > +    return ((info->iova & ~entry->addr_mask) == entry->iova) ||
> > +           ((entry->iova & ~info->mask) == info->iova);
> > +}
> > +
> >  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >                           uint8_t tg, uint64_t num_pages, uint8_t ttl)
> >  {
> > @@ -223,6 +242,34 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >                                  &info);
> >  }
> >  
> > +/*
> > + * Similar to smmu_iotlb_inv_iova(), but for Stage-2, ASID is always -1,
> > + * in Stage-1 invalidation ASID = -1, means don't care.
> > + */
> > +void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
> > +                        uint64_t num_pages, uint8_t ttl)
> > +{
> > +    uint8_t granule = tg ? tg * 2 + 10 : 12;
> > +    int asid = -1;
> > +
> > +   if (ttl && (num_pages == 1)) {
> > +        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, ipa, tg, ttl);
> > +
> > +        if (g_hash_table_remove(s->iotlb, &key)) {
> > +            return;
> > +        }
> > +    }
> > +
> > +    SMMUIOTLBPageInvInfo info = {
> > +        .iova = ipa,
> > +        .vmid = vmid,
> > +        .mask = (num_pages * 1 << granule) - 1};
> 
> Since multiplication takes precedence over shift this looks strange.
> We could just remove "* 1" here and in smmu_iotlb_inv_iova() to avoid the
> confusion?

Agh, I just copied this and didn’t notice, that makes sense, I will fix it
here for smmu_iotlb_inv_ipa and maybe iova can be fixed separately?

Thanks,
Mostafa

> 
> Thanks,
> Jean
> 
> > +
> > +    g_hash_table_foreach_remove(s->iotlb,
> > +                                smmu_hash_remove_by_vmid_ipa,
> > +                                &info);
> > +}
> > +
> >  void smmu_iotlb_inv_asid(SMMUState *s, int asid)
> >  {
> >      trace_smmu_iotlb_inv_asid(asid);
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 86f95c1e40..e5ecd93258 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -1136,7 +1136,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
> >      }
> >  }
> >  
> > -static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
> > +static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
> >  {
> >      dma_addr_t end, addr = CMD_ADDR(cmd);
> >      uint8_t type = CMD_TYPE(cmd);
> > @@ -1161,9 +1161,13 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
> >      }
> >  
> >      if (!tg) {
> > -        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
> > +        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
> >          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
> > -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
> > +        if (stage == SMMU_STAGE_1) {
> > +            smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
> > +        } else {
> > +            smmu_iotlb_inv_ipa(s, vmid, addr, tg, 1, ttl);
> > +        }
> >          return;
> >      }
> >  
> > @@ -1179,9 +1183,14 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
> >          uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
> >  
> >          num_pages = (mask + 1) >> granule;
> > -        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> > +        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages,
> > +                                 ttl, leaf, stage);
> >          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
> > -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
> > +        if (stage == SMMU_STAGE_1) {
> > +            smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
> > +        } else {
> > +            smmu_iotlb_inv_ipa(s, vmid, addr, tg, num_pages, ttl);
> > +        }
> >          addr += mask + 1;
> >      }
> >  }
> > @@ -1340,7 +1349,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
> >                  cmd_error = SMMU_CERROR_ILL;
> >                  break;
> >              }
> > -            smmuv3_range_inval(bs, &cmd);
> > +            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
> >              break;
> >          case SMMU_CMD_TLBI_S12_VMALL:
> >          {
> > @@ -1365,7 +1374,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
> >               * As currently only either s1 or s2 are supported
> >               * we can reuse same function for s2.
> >               */
> > -            smmuv3_range_inval(bs, &cmd);
> > +            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_2);
> >              break;
> >          case SMMU_CMD_TLBI_EL3_ALL:
> >          case SMMU_CMD_TLBI_EL3_VA:
> > diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> > index 09ccd39548..7d9c1703da 100644
> > --- a/hw/arm/trace-events
> > +++ b/hw/arm/trace-events
> > @@ -46,7 +46,7 @@ smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
> >  smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
> >  smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> >  smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
> > -smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
> > +smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
> >  smmuv3_cmdq_tlbi_nh(void) ""
> >  smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=%d"
> >  smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index cf0fd3ec74..de032fdfd1 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -216,7 +216,8 @@ void smmu_iotlb_inv_asid(SMMUState *s, int asid);
> >  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
> >  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
> > -
> > +void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
> > +                        uint64_t num_pages, uint8_t ttl);
> >  /* Unmap the range of all the notifiers registered to any IOMMU mr */
> >  void smmu_inv_notifiers_all(SMMUState *s);
> >  
> > -- 
> > 2.45.2.803.g4e1b14247a-goog
> > 
