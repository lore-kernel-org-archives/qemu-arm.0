Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4146209ejv;
        Tue, 2 Apr 2024 11:47:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhlT5t3jqaPmK/8JHsywFcCtJRBM5o4WeHP8GRicBTanUOqWYBuGRgsrO41iWG1wOZHhM9fakk2hUSsEsNYTLUM4AMIeV/
X-Received: by 2002:a05:6000:186b:b0:343:5e64:a1dd with SMTP id d11-20020a056000186b00b003435e64a1ddmr2516878wri.71.1712083632422;
        Tue, 02 Apr 2024 11:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712083632; cv=none;
        d=google.com; s=arc-20160816;
        b=XTY+rzVZwBd3cYf2kfpSSgQftEsWbt5Y+QAdrM4KFnq/tk8gttG/sK2m1Lybz6i37E
         ylNmUCY1NUnsB3Zljmqo/V9FLTzHenD2chauh3gtu+ux7RiEsLMiR3UJAlcZX09UFbRA
         6wkHchxLw+5aKQN5Q5q1ebbb6pAsyJ1eUVS5NTzBwp4y6id7+3BCx56nkJ9jJxovVtK+
         PLByfJRCh4XKCFPUB47S5IY1R70BAjPEGXBrPX414FLX4/xjUcG1kE0Ff4YGO3yyEYYo
         Me9cIpfQspyihiiFxfDqVuXowJHdRL+IJXTlIBxJtYmA1+rSdAUnZr8V08Vu8XF7cJMa
         dhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=n+I88cwOPYzLAuneqq9pnjT46KYCt8NVG+O4st++aqg=;
        fh=PLNYdYJBgZj1saZtvIKKuELkQ0mzPjyJ7R8csOuuX7w=;
        b=cmiJ5LCrbvfrhv5O8dXte9d4mZp2hX7brTitmenMW2xIJY8n7aISB6GFm2whzdkY7S
         6yC6FpjSlxddhGcLEVbrx2sE0FUdaN4SOhTUJrSeKasOsxuMSfHcwI03Pfgp/yFj2hzB
         hSZNGdyIoO3QzOCkmDeP4Ul4BMPwt1lR8+UpeGQYBaVDsj26Ep9WDBwLeiXpFzfNb1rL
         HYo4kppVELJltIEUI5DGrNCGHMqy8AD2hvRfD7F2bM+/6aDn9mWNG2n3FHNew5aJW7Ub
         EgD8Ap/I9VGwEwKfTI7CZej/lfwiwADZe/QJJQW1OXvW6KXugjNtmp2S+mksBZsIk5P3
         Uw9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=UCItUYUW;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l8-20020a05600c1d0800b00415537b4f90sor11462wms.9.2024.04.02.11.47.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Apr 2024 11:47:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=UCItUYUW;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712083632; x=1712688432; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n+I88cwOPYzLAuneqq9pnjT46KYCt8NVG+O4st++aqg=;
        b=UCItUYUWnXvKIArg8AFwE0E5yHD1lJ4v4m69zr6KjPuPgrAsD1bNBz7TK7J+Xixnko
         a5u2dqi0jm3RAx1LKaajBzzzvfb7yghFDv80IpzI0MYpKBOT8otFJKf1MUcndhBT7F9c
         ZsxH2/F2813ZFqNymqx9DQXTfTEFFerlHR2l/fz4mijZSSX6+fZCF/x6zQtzqRPnVPn/
         ACwxVcHayTcA9SNJnfnmZv36VQovM+H7yPZddWyAHwdI6aA3heZ7Fwb/nBe7BXLaMMMv
         tVUNY1gRjDOqpDJwHZlccF8SFMY6YHf84V/7eafX7cALk6UsZ+6B6nsiMWhUDC9JFYUg
         YzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712083632; x=1712688432;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+I88cwOPYzLAuneqq9pnjT46KYCt8NVG+O4st++aqg=;
        b=uij6Ij6dywFqVhmefDUAFWDm6p492zfW/HmE4KeMNhMkRcn1+Hk1q8U9bala5HE8b4
         VDxIrE/E/wpafjYRRvzrnFtsaRzhVWoODWoitpr6/wcJhIuRe/u3XNz2cHOjqc5BbRIv
         Q6PsO1TH+CHTFKjX0S14FHIL6WF8gos0GjQPhIpVmFmx5vhOKCLaVGZ3DC8Jj9XNejbs
         ULJcku3KlN6MJLS9k5GJufr8Eicz2TCfKrbjIs8Z9/8oJcEbqvSTFTuxPb6/TkNB+YdX
         buuzOK6hCN2o1IRSIKjTQkRaVWMgic1VQiJsLPurfa0hIUY4Ok6Il5NILjMN7YSEy8xt
         ZaKg==
X-Forwarded-Encrypted: i=1; AJvYcCUDoPKY6J69DuaEtQkhNMdoqqmscZeNs2ya54W4qKS7/Z7kkYMs1y7AEZAHnqo0+aL5QTZpo+aCzUSt/7kmJhCcOa7Jjjlc
X-Gm-Message-State: AOJu0Yx64tMWWDYYviyDlL81Tlah7mEIXWSJ5qedw5l8uVHMnkttdJOy
	ijRiitYtlRvjg2DbfMnPoAWCfAvD1Mm1r03VPYSfHNfCZTIE+DGmekQ2mNwP0w==
X-Google-Smtp-Source: AGHT+IHmN8afs4tf6dGiW+KSTT7kNKSNbDq6MEIZxboSPtpju0eyDqmEDhkehIpDLyqRNWo0b5HJVQ==
X-Received: by 2002:a05:600c:3d94:b0:414:866e:4437 with SMTP id bi20-20020a05600c3d9400b00414866e4437mr21613wmb.1.1712083631731;
        Tue, 02 Apr 2024 11:47:11 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id jb2-20020a05600c54e200b004155387c08esm14012496wmb.27.2024.04.02.11.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 11:47:10 -0700 (PDT)
Date: Tue, 2 Apr 2024 18:47:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org
Subject: Re: [RFC PATCH 03/12] hw/arm/smmu: Add stage to TLB
Message-ID: <ZgxSqi9G_WxGYJj-@google.com>
References: <20240325101442.1306300-1-smostafa@google.com>
 <20240325101442.1306300-4-smostafa@google.com>
 <b2588763-1fc3-4259-8666-f1a663ef2937@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2588763-1fc3-4259-8666-f1a663ef2937@redhat.com>
X-TUID: ml8+locnjX9u

Hi Eric,

On Tue, Apr 02, 2024 at 07:15:20PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 3/25/24 11:13, Mostafa Saleh wrote:
> > TLBs for nesting will be extended to be combined, a new index is added
> > "stage", with 2 valid values:
> >  - SMMU_STAGE_1: Meaning this translates VA to PADDR, this entry can
> >    be cached from fully nested configuration or from stage-1 only.
> >    We don't support separate cached entries (VA to IPA)
> >
> >  - SMMU_STAGE_2: Meaning this translates IPA to PADDR, cached from
> >    stage-2 only configuration.
> >
> > For TLB invalidation:
> >  - by VA: Invalidate TLBs tagged with SMMU_STAGE_1
> >  - by IPA: Invalidate TLBs tagged with SMMU_STAGE_2
> >  - All: Will invalidate both, this is communicated to the TLB as
> >    SMMU_NESTED which is (SMMU_STAGE_1 | SMMU_STAGE_2) which uses
> >    it as a mask.
> 
> I don't really get why you need this extra stage field in the key. Why
> aren't the asid and vmid tags enough?
> 

Looking again, I think we can do it with ASID and VMID only, but that
requires some rework in the invalidation path.

With nested SMMUs, we can cache entries from:
- Stage-1 (or nested): Tagged with VMID and ASID
- Stage-2: Tagged with VMID only (ASID = -1)

That should be enough for caching/lookup, but for invalidation, we
should be able to invalidate IPAs which are cached from stage-2.

At the moment, we represent ASIDs with < 0 as a wildcard for
invalidation or stage-2 and they were mutually exclusive.

An example is:
- CMD_TLBI_NH_VAA: Invalidate stage-1 for a VMID, all ASIDs (we use ASID = -1)
- CMD_TLBI_NH_VA: Invalidate stage-1 for a VMID, an ASID  ( > 0)
- CMD_TLBI_S2_IPA: Invalidate stage-2 for a VMID (we use ASID = -1)

We need to distinguish between case 1) and 3) otherwise we over invalidate.

Similarly, CMD_TLBI_NH_ALL(invalidate all stage-1 by VMID) and
CMD_TLBI_S12_VMALL(invalidate both stages by VMID).

I guess we can add variants of these functions that operate on ASIDs
(>= 0) or (< 0) which is basically stage-1 or stage-2.

Another case I can think of which is not implemented in QEMU is
global entries, where we would like to look up entries for all ASIDs
(-1), but that’s not a problem for now.

I don’t have a strong opinion, I can try to do it this way.

Thanks,
Mostafa

> Eric
> >
> > This briefly described in the user manual (ARM IHI 0070 F.b) in
> > "16.2.1 Caching combined structures".
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c         | 27 +++++++++++++++++----------
> >  hw/arm/smmu-internal.h       |  2 ++
> >  hw/arm/smmuv3.c              |  5 +++--
> >  hw/arm/trace-events          |  3 ++-
> >  include/hw/arm/smmu-common.h |  8 ++++++--
> >  5 files changed, 30 insertions(+), 15 deletions(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 20630eb670..677dcf9a13 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -38,7 +38,7 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
> >  
> >      /* Jenkins hash */
> >      a = b = c = JHASH_INITVAL + sizeof(*key);
> > -    a += key->asid + key->vmid + key->level + key->tg;
> > +    a += key->asid + key->vmid + key->level + key->tg + key->stage;
> >      b += extract64(key->iova, 0, 32);
> >      c += extract64(key->iova, 32, 32);
> >  
> > @@ -54,14 +54,14 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
> >  
> >      return (k1->asid == k2->asid) && (k1->iova == k2->iova) &&
> >             (k1->level == k2->level) && (k1->tg == k2->tg) &&
> > -           (k1->vmid == k2->vmid);
> > +           (k1->vmid == k2->vmid) && (k1->stage == k2->stage);
> >  }
> >  
> >  SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> > -                                uint8_t tg, uint8_t level)
> > +                                uint8_t tg, uint8_t level, SMMUStage stage)
> >  {
> >      SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
> > -                        .tg = tg, .level = level};
> > +                        .tg = tg, .level = level, .stage = stage};
> >  
> >      return key;
> >  }
> > @@ -81,7 +81,8 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> >          SMMUIOTLBKey key;
> >  
> >          key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid,
> > -                                 iova & ~mask, tg, level);
> > +                                 iova & ~mask, tg, level,
> > +                                 SMMU_STAGE_TO_TLB_TAG(cfg->stage));
> >          entry = g_hash_table_lookup(bs->iotlb, &key);
> >          if (entry) {
> >              break;
> > @@ -109,15 +110,16 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
> >  {
> >      SMMUIOTLBKey *key = g_new0(SMMUIOTLBKey, 1);
> >      uint8_t tg = (new->granule - 10) / 2;
> > +    SMMUStage stage_tag = SMMU_STAGE_TO_TLB_TAG(cfg->stage);
> >  
> >      if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
> >          smmu_iotlb_inv_all(bs);
> >      }
> >  
> >      *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
> > -                              tg, new->level);
> > +                              tg, new->level, stage_tag);
> >      trace_smmu_iotlb_insert(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
> > -                            tg, new->level);
> > +                            tg, new->level, stage_tag);
> >      g_hash_table_insert(bs->iotlb, key, new);
> >  }
> >  
> > @@ -159,18 +161,22 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
> >      if (info->vmid >= 0 && info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
> >          return false;
> >      }
> > +    if (!(info->stage & SMMU_IOTLB_STAGE(iotlb_key))) {
> > +        return false;
> > +    }
> >      return ((info->iova & ~entry->addr_mask) == entry->iova) ||
> >             ((entry->iova & ~info->mask) == info->iova);
> >  }
> >  
> >  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> > -                         uint8_t tg, uint64_t num_pages, uint8_t ttl)
> > +                         uint8_t tg, uint64_t num_pages, uint8_t ttl,
> > +                         SMMUStage stage)
> >  {
> >      /* if tg is not set we use 4KB range invalidation */
> >      uint8_t granule = tg ? tg * 2 + 10 : 12;
> >  
> >      if (ttl && (num_pages == 1) && (asid >= 0)) {
> > -        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl);
> > +        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl, stage);
> >  
> >          if (g_hash_table_remove(s->iotlb, &key)) {
> >              return;
> > @@ -184,6 +190,7 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >      SMMUIOTLBPageInvInfo info = {
> >          .asid = asid, .iova = iova,
> >          .vmid = vmid,
> > +        .stage = stage,
> >          .mask = (num_pages * 1 << granule) - 1};
> >  
> >      g_hash_table_foreach_remove(s->iotlb,
> > @@ -597,7 +604,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> >      if (cached_entry) {
> >          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
> >              info->type = SMMU_PTW_ERR_PERMISSION;
> > -            info->stage = cfg->stage;
> > +            info->stage = SMMU_STAGE_TO_TLB_TAG(cfg->stage);
> >              return NULL;
> >          }
> >          return cached_entry;
> > diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> > index 843bebb185..6caa0ddf21 100644
> > --- a/hw/arm/smmu-internal.h
> > +++ b/hw/arm/smmu-internal.h
> > @@ -133,12 +133,14 @@ static inline int pgd_concat_idx(int start_level, int granule_sz,
> >  
> >  #define SMMU_IOTLB_ASID(key) ((key).asid)
> >  #define SMMU_IOTLB_VMID(key) ((key).vmid)
> > +#define SMMU_IOTLB_STAGE(key) ((key).stage)
> >  
> >  typedef struct SMMUIOTLBPageInvInfo {
> >      int asid;
> >      int vmid;
> >      uint64_t iova;
> >      uint64_t mask;
> > +    SMMUStage stage;
> >  } SMMUIOTLBPageInvInfo;
> >  
> >  typedef struct SMMUSIDRange {
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index f081ff0cc4..b27bf297e1 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -1087,7 +1087,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
> >      if (!tg) {
> >          trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
> >          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
> > -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
> > +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl, SMMU_NESTED);
> >          return;
> >      }
> >  
> > @@ -1105,7 +1105,8 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
> >          num_pages = (mask + 1) >> granule;
> >          trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> >          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
> > -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
> > +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg,
> > +                            num_pages, ttl, SMMU_NESTED);
> >          addr += mask + 1;
> >      }
> >  }
> > diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> > index cc12924a84..3000c3bf14 100644
> > --- a/hw/arm/trace-events
> > +++ b/hw/arm/trace-events
> > @@ -14,10 +14,11 @@ smmu_iotlb_inv_all(void) "IOTLB invalidate all"
> >  smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
> >  smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
> >  smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
> > +smmu_iotlb_inv_stage(int stage) "Stage invalidate stage=%d"
> >  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
> >  smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> >  smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> > -smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
> > +smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level, int stage) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d stage=%d"
> >  
> >  # smmuv3.c
> >  smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index 876e78975c..695d6d10ad 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -37,6 +37,8 @@
> >  #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
> >                                               VMSA_BIT_LVL(isz, strd, lvl)) - 1)
> >  
> > +#define SMMU_STAGE_TO_TLB_TAG(stage)        (((stage) == SMMU_NESTED) ? \
> > +                                             SMMU_STAGE_1 : (stage))
> >  /*
> >   * Page table walk error types
> >   */
> > @@ -136,6 +138,7 @@ typedef struct SMMUIOTLBKey {
> >      uint16_t vmid;
> >      uint8_t tg;
> >      uint8_t level;
> > +    SMMUStage stage;
> >  } SMMUIOTLBKey;
> >  
> >  struct SMMUState {
> > @@ -203,12 +206,13 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> >                                  SMMUTransTableInfo *tt, hwaddr iova);
> >  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
> >  SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> > -                                uint8_t tg, uint8_t level);
> > +                                uint8_t tg, uint8_t level, SMMUStage stage);
> >  void smmu_iotlb_inv_all(SMMUState *s);
> >  void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> >  void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
> >  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> > -                         uint8_t tg, uint64_t num_pages, uint8_t ttl);
> > +                         uint8_t tg, uint64_t num_pages, uint8_t ttl,
> > +                         SMMUStage stage);
> >  
> >  /* Unmap the range of all the notifiers registered to any IOMMU mr */
> >  void smmu_inv_notifiers_all(SMMUState *s);
> 
