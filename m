Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4416103ejv;
        Wed, 3 Apr 2024 00:22:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzojtt+iPgmKMO7WLiAyXE1dW+mGts9Cmd+bfZ+xHr42mBOwnnpnNL3lFpetjFfClK9W0miA1G+i9+Cazrs1PYcv/uBWxC
X-Google-Smtp-Source: AGHT+IEgMDjwLu+bcZ+a+L09rDCNfmxI/wvaKKGKXgIRu7N5+8NBJNG1pXnDNPVR2/E5d4DISBo/
X-Received: by 2002:a05:620a:a59:b0:78d:3a10:e580 with SMTP id j25-20020a05620a0a5900b0078d3a10e580mr352340qka.5.1712128928633;
        Wed, 03 Apr 2024 00:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712128928; cv=none;
        d=google.com; s=arc-20160816;
        b=0SFIskfu3ieRbZJz2DHHhN/CAcLun/18VMR61tGaxDA9dFMgCN7QAFMPUNJ4a3K/T7
         TfFapH0YttZ2HM5Pe6ZNM/6evWrIP0TG/3wUQchXcb75YP4vcqZAyPha+WTgFXaD2kLU
         XtLHhwIrlCqaQz1pb/9YGm9LdJQa7U72fCzNDz/Ii8aQlkfhomm5IQqoovjRr0h6wfO7
         xcVMm2Lj8wolz+QGTSPBObGtFndkxwN2Fiho3qWA4mLonBHAqzFYNr/GofzIGAM5gTnO
         P50oF2NHrva2zrv/3svV8l+x6fmEhKFJ7tiX7HJ7yoWgHDnBPHJCXrm22/IJtg2i/hNn
         XyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=TQMAPqdBr/7tnh1nh05R9iTAilwmxSV62hdh4PxEnU0=;
        fh=dilde3VQyfrBGVTzgITRMzmCWQEc+GyU8gLQUKhyAbU=;
        b=VHd6Mq2lv7Wtcsku+psL7lqzsJ4WMSXrSJugF8ckejWFOE2Fst/jCWGszsW0eEEVUo
         IbI+0ffLvlxuqsTU9Lk8p9SDh84KM9KtGHa34RI1NtqB/GfJwq3CJkR9R99z91zPGx1B
         cleO2hOsjIwIcz+adSSPp54RWslqChqX82z/adSsERSXeYhadQyjlVrxU3Yyfumv6dLp
         zzmpRdMvbbbKA+b1XEW/G2j+dt1sb5yqZK9ZzU37Y5b5qLG3lZsQRpU7QNgVGU8VL6zP
         m7NZlRWIhx5ViSmHiAFFCw0rL88aVyWljulwIVhm84wpP+J6Eft2xW6iNm1aBUDHuamT
         12qQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cbFGQ6ua;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w6-20020a05620a444600b0078d37c59c72si1030172qkp.379.2024.04.03.00.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cbFGQ6ua;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712128928;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TQMAPqdBr/7tnh1nh05R9iTAilwmxSV62hdh4PxEnU0=;
	b=cbFGQ6ua8RX62h9UG1vwITKKIcq/YH2SLo1MEbWnocANP5RJkUcCDPXpr1S16bsqcaJ8+Y
	D0yWtImOVnhs2Tw63+k+Qr3wYz8jPtiVrg/tV5geojJzw3UllnW05awG26YUKO7UqD5Qj9
	LdpIbH7ImAvjZMaio6QnibatRJPGSWQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-U30GvxVENDSJmqsnd1kjIw-1; Wed, 03 Apr 2024 03:22:06 -0400
X-MC-Unique: U30GvxVENDSJmqsnd1kjIw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3436714e286so1002327f8f.0
        for <alex.bennee@linaro.org>; Wed, 03 Apr 2024 00:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712128925; x=1712733725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQMAPqdBr/7tnh1nh05R9iTAilwmxSV62hdh4PxEnU0=;
        b=WIogLR90liB1zLVxp23a0WrPJ1UW7RqHQmN45y2P69EHjofw9gnOmROm4OmwYHLd2i
         REBN8LY+dZZn0oXw0N5M8QiRpMmVEXDRCxBHAS+bo/2yVRE51OwpHRs9fVfj4P46E/IP
         /E2VZ9o6UxW6h+1VD3DVY0KQTtLoDL0qMx8JgDtCCwvQd+9UmZ3hUiQSejcBHZOVaRw2
         xyKHzT/ZVKR4vvMe4JScYswAkgDvV0nF/t8HASunEMo5IAO7SELXocMmkjYpNRJTKIWA
         /yKn/JytDgHdOLgPZMCriV3gSGNpt5795FQgBDBCP8di5mHchYxe3JdXok/GMpA9Kd9B
         3YZw==
X-Forwarded-Encrypted: i=1; AJvYcCUPQiErWCOX90e9PgGEGkkL0l0VYgv1tnHRot1s+iyoe1C4EDpPZ55VPRcRm3BFD9bD1EQA7E56puWBEKnLBFpSPbuzuIOP
X-Gm-Message-State: AOJu0YxkvZwSIisqdKOvQn4eLCY0zWUDpKyAeS0XAa+Hy3GzMHRJIUVm
	MNMJd3VpTSY0j/e1nHxve37ZcpVk7wR8CyS8jiqqIrhXEe0e765twHZB7UGjy2dkI8nbCZeSSpA
	X6iNFX5KDAaP+6AUp6YDTQZO3/RnnGDBUdr/E5Tv3SvZyeQ3e9Sep2g==
X-Received: by 2002:a5d:6487:0:b0:343:77d3:5ee2 with SMTP id o7-20020a5d6487000000b0034377d35ee2mr2593931wri.35.1712128925557;
        Wed, 03 Apr 2024 00:22:05 -0700 (PDT)
X-Received: by 2002:a5d:6487:0:b0:343:77d3:5ee2 with SMTP id o7-20020a5d6487000000b0034377d35ee2mr2593905wri.35.1712128925007;
        Wed, 03 Apr 2024 00:22:05 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id bp29-20020a5d5a9d000000b00341d28586afsm16561933wrb.2.2024.04.03.00.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:22:04 -0700 (PDT)
Message-ID: <b7e46df1-5c4b-4cbe-86b3-03a57c138076@redhat.com>
Date: Wed, 3 Apr 2024 09:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH 03/12] hw/arm/smmu: Add stage to TLB
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org
References: <20240325101442.1306300-1-smostafa@google.com>
 <20240325101442.1306300-4-smostafa@google.com>
 <b2588763-1fc3-4259-8666-f1a663ef2937@redhat.com>
 <ZgxSqi9G_WxGYJj-@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZgxSqi9G_WxGYJj-@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cTAdgu0dfl87

Hi Mostafa,

On 4/2/24 20:47, Mostafa Saleh wrote:
> Hi Eric,
>
> On Tue, Apr 02, 2024 at 07:15:20PM +0200, Eric Auger wrote:
>> Hi Mostafa,
>>
>> On 3/25/24 11:13, Mostafa Saleh wrote:
>>> TLBs for nesting will be extended to be combined, a new index is added
>>> "stage", with 2 valid values:
>>>  - SMMU_STAGE_1: Meaning this translates VA to PADDR, this entry can
>>>    be cached from fully nested configuration or from stage-1 only.
>>>    We don't support separate cached entries (VA to IPA)
>>>
>>>  - SMMU_STAGE_2: Meaning this translates IPA to PADDR, cached from
>>>    stage-2 only configuration.
>>>
>>> For TLB invalidation:
>>>  - by VA: Invalidate TLBs tagged with SMMU_STAGE_1
>>>  - by IPA: Invalidate TLBs tagged with SMMU_STAGE_2
>>>  - All: Will invalidate both, this is communicated to the TLB as
>>>    SMMU_NESTED which is (SMMU_STAGE_1 | SMMU_STAGE_2) which uses
>>>    it as a mask.
>> I don't really get why you need this extra stage field in the key. Why
>> aren't the asid and vmid tags enough?
>>
> Looking again, I think we can do it with ASID and VMID only, but that
> requires some rework in the invalidation path.
>
> With nested SMMUs, we can cache entries from:
> - Stage-1 (or nested): Tagged with VMID and ASID
> - Stage-2: Tagged with VMID only (ASID = -1)
>
> That should be enough for caching/lookup, but for invalidation, we
> should be able to invalidate IPAs which are cached from stage-2.
>
> At the moment, we represent ASIDs with < 0 as a wildcard for
> invalidation or stage-2 and they were mutually exclusive.
>
> An example is:
> - CMD_TLBI_NH_VAA: Invalidate stage-1 for a VMID, all ASIDs (we use ASID = -1)
> - CMD_TLBI_NH_VA: Invalidate stage-1 for a VMID, an ASID  ( > 0)
> - CMD_TLBI_S2_IPA: Invalidate stage-2 for a VMID (we use ASID = -1)
>
> We need to distinguish between case 1) and 3) otherwise we over invalidate.
OK I see your point when passing the asid param to smmuv3_range_inval()
in smmuv3_range_inval().
Well if you can have separate functions for handling S1 and S2 cases
while keeping the current key that may be interesting. It may be clearer
now we have extended support. This can also help in debugging/tracing.
>
> Similarly, CMD_TLBI_NH_ALL(invalidate all stage-1 by VMID) and
> CMD_TLBI_S12_VMALL(invalidate both stages by VMID).
>
> I guess we can add variants of these functions that operate on ASIDs
> (>= 0) or (< 0) which is basically stage-1 or stage-2.
worth to try indeed.

Thanks

Eric
>
> Another case I can think of which is not implemented in QEMU is
> global entries, where we would like to look up entries for all ASIDs
> (-1), but that’s not a problem for now.
>
> I don’t have a strong opinion, I can try to do it this way.
>
> Thanks,
> Mostafa
>
>> Eric
>>> This briefly described in the user manual (ARM IHI 0070 F.b) in
>>> "16.2.1 Caching combined structures".
>>>
>>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>>> ---
>>>  hw/arm/smmu-common.c         | 27 +++++++++++++++++----------
>>>  hw/arm/smmu-internal.h       |  2 ++
>>>  hw/arm/smmuv3.c              |  5 +++--
>>>  hw/arm/trace-events          |  3 ++-
>>>  include/hw/arm/smmu-common.h |  8 ++++++--
>>>  5 files changed, 30 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>> index 20630eb670..677dcf9a13 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -38,7 +38,7 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
>>>  
>>>      /* Jenkins hash */
>>>      a = b = c = JHASH_INITVAL + sizeof(*key);
>>> -    a += key->asid + key->vmid + key->level + key->tg;
>>> +    a += key->asid + key->vmid + key->level + key->tg + key->stage;
>>>      b += extract64(key->iova, 0, 32);
>>>      c += extract64(key->iova, 32, 32);
>>>  
>>> @@ -54,14 +54,14 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>>>  
>>>      return (k1->asid == k2->asid) && (k1->iova == k2->iova) &&
>>>             (k1->level == k2->level) && (k1->tg == k2->tg) &&
>>> -           (k1->vmid == k2->vmid);
>>> +           (k1->vmid == k2->vmid) && (k1->stage == k2->stage);
>>>  }
>>>  
>>>  SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
>>> -                                uint8_t tg, uint8_t level)
>>> +                                uint8_t tg, uint8_t level, SMMUStage stage)
>>>  {
>>>      SMMUIOTLBKey key = {.asid = asid, .vmid = vmid, .iova = iova,
>>> -                        .tg = tg, .level = level};
>>> +                        .tg = tg, .level = level, .stage = stage};
>>>  
>>>      return key;
>>>  }
>>> @@ -81,7 +81,8 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>>>          SMMUIOTLBKey key;
>>>  
>>>          key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid,
>>> -                                 iova & ~mask, tg, level);
>>> +                                 iova & ~mask, tg, level,
>>> +                                 SMMU_STAGE_TO_TLB_TAG(cfg->stage));
>>>          entry = g_hash_table_lookup(bs->iotlb, &key);
>>>          if (entry) {
>>>              break;
>>> @@ -109,15 +110,16 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
>>>  {
>>>      SMMUIOTLBKey *key = g_new0(SMMUIOTLBKey, 1);
>>>      uint8_t tg = (new->granule - 10) / 2;
>>> +    SMMUStage stage_tag = SMMU_STAGE_TO_TLB_TAG(cfg->stage);
>>>  
>>>      if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
>>>          smmu_iotlb_inv_all(bs);
>>>      }
>>>  
>>>      *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
>>> -                              tg, new->level);
>>> +                              tg, new->level, stage_tag);
>>>      trace_smmu_iotlb_insert(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
>>> -                            tg, new->level);
>>> +                            tg, new->level, stage_tag);
>>>      g_hash_table_insert(bs->iotlb, key, new);
>>>  }
>>>  
>>> @@ -159,18 +161,22 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
>>>      if (info->vmid >= 0 && info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
>>>          return false;
>>>      }
>>> +    if (!(info->stage & SMMU_IOTLB_STAGE(iotlb_key))) {
>>> +        return false;
>>> +    }
>>>      return ((info->iova & ~entry->addr_mask) == entry->iova) ||
>>>             ((entry->iova & ~info->mask) == info->iova);
>>>  }
>>>  
>>>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>>> -                         uint8_t tg, uint64_t num_pages, uint8_t ttl)
>>> +                         uint8_t tg, uint64_t num_pages, uint8_t ttl,
>>> +                         SMMUStage stage)
>>>  {
>>>      /* if tg is not set we use 4KB range invalidation */
>>>      uint8_t granule = tg ? tg * 2 + 10 : 12;
>>>  
>>>      if (ttl && (num_pages == 1) && (asid >= 0)) {
>>> -        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl);
>>> +        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, iova, tg, ttl, stage);
>>>  
>>>          if (g_hash_table_remove(s->iotlb, &key)) {
>>>              return;
>>> @@ -184,6 +190,7 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>>>      SMMUIOTLBPageInvInfo info = {
>>>          .asid = asid, .iova = iova,
>>>          .vmid = vmid,
>>> +        .stage = stage,
>>>          .mask = (num_pages * 1 << granule) - 1};
>>>  
>>>      g_hash_table_foreach_remove(s->iotlb,
>>> @@ -597,7 +604,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>>>      if (cached_entry) {
>>>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>>>              info->type = SMMU_PTW_ERR_PERMISSION;
>>> -            info->stage = cfg->stage;
>>> +            info->stage = SMMU_STAGE_TO_TLB_TAG(cfg->stage);
>>>              return NULL;
>>>          }
>>>          return cached_entry;
>>> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
>>> index 843bebb185..6caa0ddf21 100644
>>> --- a/hw/arm/smmu-internal.h
>>> +++ b/hw/arm/smmu-internal.h
>>> @@ -133,12 +133,14 @@ static inline int pgd_concat_idx(int start_level, int granule_sz,
>>>  
>>>  #define SMMU_IOTLB_ASID(key) ((key).asid)
>>>  #define SMMU_IOTLB_VMID(key) ((key).vmid)
>>> +#define SMMU_IOTLB_STAGE(key) ((key).stage)
>>>  
>>>  typedef struct SMMUIOTLBPageInvInfo {
>>>      int asid;
>>>      int vmid;
>>>      uint64_t iova;
>>>      uint64_t mask;
>>> +    SMMUStage stage;
>>>  } SMMUIOTLBPageInvInfo;
>>>  
>>>  typedef struct SMMUSIDRange {
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index f081ff0cc4..b27bf297e1 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -1087,7 +1087,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
>>>      if (!tg) {
>>>          trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
>>>          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
>>> -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
>>> +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl, SMMU_NESTED);
>>>          return;
>>>      }
>>>  
>>> @@ -1105,7 +1105,8 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
>>>          num_pages = (mask + 1) >> granule;
>>>          trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
>>>          smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
>>> -        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
>>> +        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg,
>>> +                            num_pages, ttl, SMMU_NESTED);
>>>          addr += mask + 1;
>>>      }
>>>  }
>>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>>> index cc12924a84..3000c3bf14 100644
>>> --- a/hw/arm/trace-events
>>> +++ b/hw/arm/trace-events
>>> @@ -14,10 +14,11 @@ smmu_iotlb_inv_all(void) "IOTLB invalidate all"
>>>  smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
>>>  smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
>>>  smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
>>> +smmu_iotlb_inv_stage(int stage) "Stage invalidate stage=%d"
>>>  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
>>>  smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
>>>  smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
>>> -smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
>>> +smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level, int stage) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d stage=%d"
>>>  
>>>  # smmuv3.c
>>>  smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
>>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>>> index 876e78975c..695d6d10ad 100644
>>> --- a/include/hw/arm/smmu-common.h
>>> +++ b/include/hw/arm/smmu-common.h
>>> @@ -37,6 +37,8 @@
>>>  #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
>>>                                               VMSA_BIT_LVL(isz, strd, lvl)) - 1)
>>>  
>>> +#define SMMU_STAGE_TO_TLB_TAG(stage)        (((stage) == SMMU_NESTED) ? \
>>> +                                             SMMU_STAGE_1 : (stage))
>>>  /*
>>>   * Page table walk error types
>>>   */
>>> @@ -136,6 +138,7 @@ typedef struct SMMUIOTLBKey {
>>>      uint16_t vmid;
>>>      uint8_t tg;
>>>      uint8_t level;
>>> +    SMMUStage stage;
>>>  } SMMUIOTLBKey;
>>>  
>>>  struct SMMUState {
>>> @@ -203,12 +206,13 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>>>                                  SMMUTransTableInfo *tt, hwaddr iova);
>>>  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
>>>  SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
>>> -                                uint8_t tg, uint8_t level);
>>> +                                uint8_t tg, uint8_t level, SMMUStage stage);
>>>  void smmu_iotlb_inv_all(SMMUState *s);
>>>  void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
>>>  void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
>>>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>>> -                         uint8_t tg, uint64_t num_pages, uint8_t ttl);
>>> +                         uint8_t tg, uint64_t num_pages, uint8_t ttl,
>>> +                         SMMUStage stage);
>>>  
>>>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
>>>  void smmu_inv_notifiers_all(SMMUState *s);
