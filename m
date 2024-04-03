Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4472391ejv;
        Wed, 3 Apr 2024 02:55:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOqv6v7U9w87utNJ07zsq0fBDtDKouVOWqZ0k+NbxwWupFtuTpjEm+xLElOUEAbf43XZ/oXSiSn7vg4hxqcx/aJFLyIInS
X-Received: by 2002:a2e:9d0b:0:b0:2d6:b413:87ce with SMTP id t11-20020a2e9d0b000000b002d6b41387cemr9349079lji.49.1712138115477;
        Wed, 03 Apr 2024 02:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712138115; cv=none;
        d=google.com; s=arc-20160816;
        b=BrnCGBOBq/LDl0jTVpeOcmP9UuW310Skqh1wywWPFaiI3YXRrEYSzCZng9uphvI2J2
         0XX6dSdDS0o+rMJO1RUGD3UNGGoM0kHQQY9uqijxrrUrTEoDHT5jdqs7lZgwmPiCMAxn
         c4+O9Ea3gPUAwe9eanTgg9EFqabQf8JleLnOkqZKFQB8WCIRgn+AXFD2/NAey4EdDFKD
         d1TUiIGSkU0AmyTiLVq5UqLCml6Vs7+tm9h7QlCbe4A8H5HtzKkmmQvj3gf4r2qZIoFK
         gMi6WC/LRkAOvIApn6eINN9daq6hxtFvqXMuXigbQpu/Wd5ixRnfSQRTUS/sDCeIm428
         B2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=086VbEH9Ymt3do3GK9NK93tI4tMl5SVd0Mb7jAbl81E=;
        fh=aaDClFmX12PHWgNqylpQp8AqFSKj7DWQ9M/8yiAnpUc=;
        b=JRZu8mUzJBVHWSG/rJMLU6wadMIgXgXW0kCHLiHEkg22jPSauFhCYo1NrdHf0FaweB
         WIgN1dH4e6Yg26Muj6wdP4c6OyVKD92uT6owiGak3SL3HcsB3uOoJEh216CaBMQlhLRA
         LlJxWTeo9UYm3cvv8NvtgiECniMh9A1jVu3eaItKU7U7isNELbzSUd+KSGkXIanTypnd
         If0BFtA4qinW04OWJdj4qzD61xT99e40dM2CiOjVtfhxjVOdy2jZ0O39BJC6rM3vFvet
         R+2CB1hTSHyiR7im2Wm79n5DcOAzA9bN8u0N2y+G6ga3BbC1JpPdtfKmC8KgfKe0ZCqp
         qehw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=cYt8Si7w;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m18-20020a05600c4f5200b0041494fb2647sor70073wmq.6.2024.04.03.02.55.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Apr 2024 02:55:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=cYt8Si7w;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712138115; x=1712742915; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=086VbEH9Ymt3do3GK9NK93tI4tMl5SVd0Mb7jAbl81E=;
        b=cYt8Si7wpsAnf8BpiaPnzwpXXYRWaILGsNjx9CJ3ATyimfDaKXSJxXyuPY7c2ud08a
         9oCDzK1xFqjqE1LMqQeIKNH+k4ZXbKrup0vfWDAIQDxLyMXTKg9Gr0EcWHlmPEbPx3Ow
         KEGcmjcV9IdphVObUUQiX2wEvmn3h26/t/7z+1MkYroRA0KYyVJdl6ThpZQK/mjcZkBc
         01OQTvX4k+culB4Q9jRjFkyQN1QOg8XK5j4hxPevzR+t3fY5MjerYafjlWo7sO4Ub6sa
         s7mICRXaNOSYNjKax4Yb6mU4WFFtD330TaShmCJzsJCPztsjnPiPJoEB2zIgEK7uHwEG
         2m7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712138115; x=1712742915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=086VbEH9Ymt3do3GK9NK93tI4tMl5SVd0Mb7jAbl81E=;
        b=IFPjFxqf7RnmRLPuLaBEKfS/LM+RKbqGyprFCxtguPVySaThlyJDRF0RQQ2NfUBcZs
         4fVK0FFOALAqXFr+1pkn/WCMXQpccGeMyRQC8+eVxf+lgQGC7X9so79KANL6GC9HuaJF
         /yN0ZgugA8oerW4OMRCQvbTCWdHq1zID8S6cyOMSD5cgEDLNTiKcFC9c4lvwsWs/GvrB
         WCaPrztwWgvHqzE57YlPk8gwOq/AjkXIsogShb1xaZBSul7dq9BhQ6qxr+o+D/XHK/uO
         OUiklqNR7LwRQGroK+PmjBveQB/3csP5qX4AFiccqh7Edv3nURt7NhXYJvvujaD8NdRE
         Q8dA==
X-Forwarded-Encrypted: i=1; AJvYcCV96SKnAstPnelHie440vmJYDvTq8/DB5dN79oOsDgorLF3Sfm5Np12gHbrDuG5OBfmJ5FthWlOOAz6HUvDz4LH1mQkZUrY
X-Gm-Message-State: AOJu0YzgIqS7aLWPTPS08v2jT8TtFss10OdWDtzsF5O8+ThjLZU7eXCS
	KnhigZ6l3fxi0AOufsKCtXej6PSFT5MeaC5qAPq0S/5rxIPmVopaGfKuQahaXg==
X-Google-Smtp-Source: AGHT+IF9+n0BLfR18MlETjA+PSYQTgOWDw5tx43myfu3vScVpCY8wgzD0WIMfxwRPDm20mjgen2FCg==
X-Received: by 2002:a05:600c:1d86:b0:414:866e:4437 with SMTP id p6-20020a05600c1d8600b00414866e4437mr128891wms.1.1712138114835;
        Wed, 03 Apr 2024 02:55:14 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c1d9300b0041624db414esm708108wms.35.2024.04.03.02.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 02:55:14 -0700 (PDT)
Date: Wed, 3 Apr 2024 09:55:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org
Subject: Re: [RFC PATCH 03/12] hw/arm/smmu: Add stage to TLB
Message-ID: <Zg0nfmnLFRcDgF4x@google.com>
References: <20240325101442.1306300-1-smostafa@google.com>
 <20240325101442.1306300-4-smostafa@google.com>
 <b2588763-1fc3-4259-8666-f1a663ef2937@redhat.com>
 <ZgxSqi9G_WxGYJj-@google.com>
 <b7e46df1-5c4b-4cbe-86b3-03a57c138076@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7e46df1-5c4b-4cbe-86b3-03a57c138076@redhat.com>
X-TUID: wpKKEtCbTx0n

On Wed, Apr 03, 2024 at 09:22:03AM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/2/24 20:47, Mostafa Saleh wrote:
> > Hi Eric,
> >
> > On Tue, Apr 02, 2024 at 07:15:20PM +0200, Eric Auger wrote:
> >> Hi Mostafa,
> >>
> >> On 3/25/24 11:13, Mostafa Saleh wrote:
> >>> TLBs for nesting will be extended to be combined, a new index is added
> >>> "stage", with 2 valid values:
> >>>  - SMMU_STAGE_1: Meaning this translates VA to PADDR, this entry can
> >>>    be cached from fully nested configuration or from stage-1 only.
> >>>    We don't support separate cached entries (VA to IPA)
> >>>
> >>>  - SMMU_STAGE_2: Meaning this translates IPA to PADDR, cached from
> >>>    stage-2 only configuration.
> >>>
> >>> For TLB invalidation:
> >>>  - by VA: Invalidate TLBs tagged with SMMU_STAGE_1
> >>>  - by IPA: Invalidate TLBs tagged with SMMU_STAGE_2
> >>>  - All: Will invalidate both, this is communicated to the TLB as
> >>>    SMMU_NESTED which is (SMMU_STAGE_1 | SMMU_STAGE_2) which uses
> >>>    it as a mask.
> >> I don't really get why you need this extra stage field in the key. Why
> >> aren't the asid and vmid tags enough?
> >>
> > Looking again, I think we can do it with ASID and VMID only, but that
> > requires some rework in the invalidation path.
> >
> > With nested SMMUs, we can cache entries from:
> > - Stage-1 (or nested): Tagged with VMID and ASID
> > - Stage-2: Tagged with VMID only (ASID = -1)
> >
> > That should be enough for caching/lookup, but for invalidation, we
> > should be able to invalidate IPAs which are cached from stage-2.
> >
> > At the moment, we represent ASIDs with < 0 as a wildcard for
> > invalidation or stage-2 and they were mutually exclusive.
> >
> > An example is:
> > - CMD_TLBI_NH_VAA: Invalidate stage-1 for a VMID, all ASIDs (we use ASID = -1)
> > - CMD_TLBI_NH_VA: Invalidate stage-1 for a VMID, an ASID  ( > 0)
> > - CMD_TLBI_S2_IPA: Invalidate stage-2 for a VMID (we use ASID = -1)
> >
> > We need to distinguish between case 1) and 3) otherwise we over invalidate.
> OK I see your point when passing the asid param to smmuv3_range_inval()
> in smmuv3_range_inval().
> Well if you can have separate functions for handling S1 and S2 cases
> while keeping the current key that may be interesting. It may be clearer
> now we have extended support. This can also help in debugging/tracing.
> >
> > Similarly, CMD_TLBI_NH_ALL(invalidate all stage-1 by VMID) and
> > CMD_TLBI_S12_VMALL(invalidate both stages by VMID).
> >
> > I guess we can add variants of these functions that operate on ASIDs
> > (>= 0) or (< 0) which is basically stage-1 or stage-2.
> worth to try indeed.

I will switch to that in V2.

Thanks,
Mostafa

> 
> Thanks
> 
> Eric
> >
> > Another case I can think of which is not implemented in QEMU is
> > global entries, where we would like to look up entries for all ASIDs
> > (-1), but that’s not a problem for now.
> >
> > I don’t have a strong opinion, I can try to do it this way.
> >
> > Thanks,
> > Mostafa
> >
> >> Eric
> >>> This briefly described in the user manual (ARM IHI 0070 F.b) in
> >>> "16.2.1 Caching combined structures".
> >>>
> >>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> >>> ---
> >>>  hw/arm/smmu-common.c         | 27 +++++++++++++++++----------
> >>>  hw/arm/smmu-internal.h       |  2 ++
> >>>  hw/arm/smmuv3.c              |  5 +++--
> >>>  hw/arm/trace-events          |  3 ++-
> >>>  include/hw/arm/smmu-common.h |  8 ++++++--
> >>>  5 files changed, 30 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> >>> index 20630eb670..677dcf9a13 100644
> >>> --- a/hw/arm/smmu-common.c
> >>> +++ b/hw/arm/smmu-common.c
> >>> @@ -38,7 +38,7 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
> >>>  
> >>>      /* Jenkins hash */
> >>>      a = b = c = JHASH_INITVAL + sizeof(*key);
> >>> -    a += key->asid + key->vmid + key->level + key->tg;
> >>> +    a += key->asid + key->vmid + key->level + key->tg + key->stage;
> >>>      b += extract64(key->iova, 0, 32);
> >>>      c += extract64(key->iova, 32, 32);
> >>>  
> >>> @@ -54,14 +54,14 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
> >>>  
> >>>      return (k1->asid == k2->asid) && (k1->iova == k2->iova) &&
> >>>             (k1->level == k2->level) && (k1->tg == k2->tg) &&
> >>> -           (k1->vmid == k2->vmid);
> >>> +           (k1->vmid == k2->vmid) && (k1->stage == k2->stage);
> >>>  }
> >>>  
> >>>  SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> >>> -                                uint8_t tg, uint8_t level)
> >>> +                                uint8_t tg, uint8_t level, SMMUStage stage)
> >>>  {
> >>>      SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
> >>> -                        .tg = tg, .level = level};
> >>> +                        .tg = tg, .level = level, .stage = stage};
> >>>  
> >>>      return key;
> >>>  }
> >>> @@ -81,7 +81,8 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> >>>          SMMUIOTLBKey key;
> >>>  
> >>>          key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid,
> >>> -                                 iova & ~mask, tg, level);
> >>> +                                 iova & ~mask, tg, level,
> >>> +                                 SMMU_STAGE_TO_TLB_TAG(cfg->stage));
> >>>          entry = g_hash_table_lookup(bs->iotlb, &key);
> >>>          if (entry) {
> >>>              break;
> >>> @@ -109,15 +110,16 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
> >>>  {
> >>>      SMMUIOTLBKey *key = g_new0(SMMUIOTLBKey, 1);
> >>>      uint8_t tg = (new->granule - 10) / 2;
> >>> +    SMMUStage stage_tag = SMMU_STAGE_TO_TLB_TAG(cfg->stage);
> >>>  
> >>>      if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
> >>>          smmu_iotlb_inv_all(bs);
> >>>      }
> >>>  
> >>>      *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
> >>> -                              tg, new->level);
> >>> +                              tg, new->level, stage_tag);
> >>>      trace_smmu_iotlb_insert(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
> >>> -                            tg, new->level);
> >>> +                            tg, new->level, stage_tag);
> >>>      g_hash_table_insert(bs->iotlb, key, new);
> >>>  }
> >>>  
> >>> @@ -159,18 +161,22 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
> >>>      if (info->vmid >= 0 && info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
> >>>          return false;
> >>>      }
> >>> +    if (!(info->stage & SMMU_IOTLB_STAGE(iotlb_key))) {
> >>> +        return false;
> >>> +    }
> >>>      return ((info->iova & ~entry->addr_mask) == entry->iova) ||
> >>>             ((entry->iova & ~info->mask) == info->iova);
> >>>  }
> >>>  
> >>>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >>> -                         uint8_t tg, uint64_t num_pages, uint8_t ttl)
> >>> +                         uint8_t tg, uint64_t num_pages, uint8_t ttl,
> >>> +                         SMMUStage stage)
> >>>  {
> >>>      /* if tg is not set we use 4KB range invalidation */
> >>>      uint8_t granule = tg ? tg * 2 + 10 : 12;
> >>>  
> >>>      if (ttl && (num_pages == 1) && (asid >= 0)) {
> >>> -        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl);
> >>> +        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl, stage);
> >>>  
> >>>          if (g_hash_table_remove(s->iotlb, &key)) {
> >>>              return;
> >>> @@ -184,6 +190,7 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >>>      SMMUIOTLBPageInvInfo info = {
> >>>          .asid = asid, .iova = iova,
> >>>          .vmid = vmid,
> >>> +        .stage = stage,
> >>>          .mask = (num_pages * 1 << granule) - 1};
> >>>  
> >>>      g_hash_table_foreach_remove(s->iotlb,
> >>> @@ -597,7 +604,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> >>>      if (cached_entry) {
> >>>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
> >>>              info->type = SMMU_PTW_ERR_PERMISSION;
> >>> -            info->stage = cfg->stage;
> >>> +            info->stage = SMMU_STAGE_TO_TLB_TAG(cfg->stage);
> >>>              return NULL;
> >>>          }
> >>>          return cached_entry;
> >>> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> >>> index 843bebb185..6caa0ddf21 100644
> >>> --- a/hw/arm/smmu-internal.h
> >>> +++ b/hw/arm/smmu-internal.h
> >>> @@ -133,12 +133,14 @@ static inline int pgd_concat_idx(int start_level, int granule_sz,
> >>>  
> >>>  #define SMMU_IOTLB_ASID(key) ((key).asid)
> >>>  #define SMMU_IOTLB_VMID(key) ((key).vmid)
> >>> +#define SMMU_IOTLB_STAGE(key) ((key).stage)
> >>>  
> >>>  typedef struct SMMUIOTLBPageInvInfo {
> >>>      int asid;
> >>>      int vmid;
> >>>      uint64_t iova;
> >>>      uint64_t mask;
> >>> +    SMMUStage stage;
> >>>  } SMMUIOTLBPageInvInfo;
> >>>  
> >>>  typedef struct SMMUSIDRange {
> >>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> >>> index f081ff0cc4..b27bf297e1 100644
> >>> --- a/hw/arm/smmuv3.c
> >>> +++ b/hw/arm/smmuv3.c
> >>> @@ -1087,7 +1087,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
> >>>      if (!tg) {
> >>>          trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
> >>>          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
> >>> -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
> >>> +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl, SMMU_NESTED);
> >>>          return;
> >>>      }
> >>>  
> >>> @@ -1105,7 +1105,8 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
> >>>          num_pages = (mask + 1) >> granule;
> >>>          trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> >>>          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
> >>> -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
> >>> +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg,
> >>> +                            num_pages, ttl, SMMU_NESTED);
> >>>          addr += mask + 1;
> >>>      }
> >>>  }
> >>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> >>> index cc12924a84..3000c3bf14 100644
> >>> --- a/hw/arm/trace-events
> >>> +++ b/hw/arm/trace-events
> >>> @@ -14,10 +14,11 @@ smmu_iotlb_inv_all(void) "IOTLB invalidate all"
> >>>  smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
> >>>  smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
> >>>  smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
> >>> +smmu_iotlb_inv_stage(int stage) "Stage invalidate stage=%d"
> >>>  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
> >>>  smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> >>>  smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> >>> -smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
> >>> +smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level, int stage) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d stage=%d"
> >>>  
> >>>  # smmuv3.c
> >>>  smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
> >>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> >>> index 876e78975c..695d6d10ad 100644
> >>> --- a/include/hw/arm/smmu-common.h
> >>> +++ b/include/hw/arm/smmu-common.h
> >>> @@ -37,6 +37,8 @@
> >>>  #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
> >>>                                               VMSA_BIT_LVL(isz, strd, lvl)) - 1)
> >>>  
> >>> +#define SMMU_STAGE_TO_TLB_TAG(stage)        (((stage) == SMMU_NESTED) ? \
> >>> +                                             SMMU_STAGE_1 : (stage))
> >>>  /*
> >>>   * Page table walk error types
> >>>   */
> >>> @@ -136,6 +138,7 @@ typedef struct SMMUIOTLBKey {
> >>>      uint16_t vmid;
> >>>      uint8_t tg;
> >>>      uint8_t level;
> >>> +    SMMUStage stage;
> >>>  } SMMUIOTLBKey;
> >>>  
> >>>  struct SMMUState {
> >>> @@ -203,12 +206,13 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> >>>                                  SMMUTransTableInfo *tt, hwaddr iova);
> >>>  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
> >>>  SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
> >>> -                                uint8_t tg, uint8_t level);
> >>> +                                uint8_t tg, uint8_t level, SMMUStage stage);
> >>>  void smmu_iotlb_inv_all(SMMUState *s);
> >>>  void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> >>>  void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
> >>>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
> >>> -                         uint8_t tg, uint64_t num_pages, uint8_t ttl);
> >>> +                         uint8_t tg, uint64_t num_pages, uint8_t ttl,
> >>> +                         SMMUStage stage);
> >>>  
> >>>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
> >>>  void smmu_inv_notifiers_all(SMMUState *s);
> 
