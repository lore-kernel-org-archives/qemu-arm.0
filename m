Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4072516ejv;
        Tue, 2 Apr 2024 09:33:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfvfvxitih+OCt5AMkBJRgrtWHb8+v+Zvohm+lZdhJkvR2W0llc7+TuftepyCVZhGmzU2n+zUiY9cTooC477S/YRiwqlxM
X-Google-Smtp-Source: AGHT+IENFMVQZuBH8Ayida6lrE8zkwrhwyhqv2dhorby0zwry9zGss2WOz+VgzW9OqOIV8zBP8yV
X-Received: by 2002:a05:6830:11cd:b0:6e6:7c37:9b3a with SMTP id v13-20020a05683011cd00b006e67c379b3amr14416779otq.23.1712075581012;
        Tue, 02 Apr 2024 09:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712075580; cv=none;
        d=google.com; s=arc-20160816;
        b=wqvTA/4d6doQbglVLSBs9gwP2vDrs9KK9BqFJfsUh/WGP4LatkFskYWummKwMIawPv
         a+xI9VL64v0c4etsJgD5f3W7Rx8N7ORVAs3WS9XHMwKTdctk4D5RpkoTzdOaBZTBOtel
         /a8KD3BqZ5Jk4LXR2lTHMeLQ1hHJaHYKgybBx0mpFno7ByB4RL/TfgZYZVT9wDhWafh9
         +4ioNSb7+Kneqmt1IE74H8CEzrMVrsZH7XoqXotcRNnvG85Jd054T+mFGxJ1F1OP0wEz
         uXf2KEsXA+/s3y60I21xgK/jMfx6ImD61UaBXfBNX+gurRZmXH5fUZjQ9xmnAkCqKoxx
         EJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=0Gp+AYX+B6a3r3r9M6DCYa1jM7O40RntXsTDxZxHxz8=;
        fh=LlwxhtMdIcTrOQ06IB/XaKGL0ABuYuZYbWcy+an7uY4=;
        b=Vg/D/hEnTrIEf+9iDRirDU4bZJX7aeY4i2rRfSHkw0h60cHi3rreh/GXX4zTM30KLx
         J93LTCpfwjL3iFH7N6LHT+SGqcAhxsOnTQMJruUMd4U3nbVJFp6XfHjnUI4+lSfxMRv/
         5aSIWHpAmJq10Y4ZZTpRPbFgF+lkGQCanwZNkiWR88InzBK86tJYGZdQMfLW2usLkVWd
         7G4ThQupvg0USsyTJVNJtk09injIrDkswRnkBQ96gPliEBQkgDXF53gUme5bPaSQIQk1
         Bn/pBSX+ACHvV/Pbz+J5qXwgT1bXTGRn0CR3yIAhT4NFd/XNs0NdPxyM4DO/xcmeYdBe
         tFNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IVZGETkC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n12-20020a0cee6c000000b0069187856d2bsi3094663qvs.527.2024.04.02.09.33.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 09:33:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IVZGETkC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712075580;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Gp+AYX+B6a3r3r9M6DCYa1jM7O40RntXsTDxZxHxz8=;
	b=IVZGETkCq+OvJGHMRCyOq+fNzpMcup2xG3sIuqIR056i9wui+eCOTPe0TIOufrlPgfDiiZ
	lao30oQ8tCpI1pjkjM9lOE2xZsxPHjnf4r52YeBejqO1NyoqOLDR42g3COtnwTbepvkLUr
	K5omqiro1DOme8TyR1ovO0rYPi5XLAk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-5gF_Y5NNNgmYbsHAl5cGfg-1; Tue, 02 Apr 2024 12:32:59 -0400
X-MC-Unique: 5gF_Y5NNNgmYbsHAl5cGfg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-34386849dbcso17447f8f.0
        for <alex.bennee@linaro.org>; Tue, 02 Apr 2024 09:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712075578; x=1712680378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Gp+AYX+B6a3r3r9M6DCYa1jM7O40RntXsTDxZxHxz8=;
        b=kgWwASijsJz11CkxsXg4hm1wnj9aanGZyuBH/NCdJGoPxBc6HAjc47qyWkLzkm8+Cl
         0PYUEzp1Ew1EFzfN3xmUaLJuEXCRxc0iLBWswpFd0QPt0Y3LGtRu2yftu5P1nBlB0kKS
         xwn2QQcbDEsJCsSu7BnPqFo6i3+AtVUyQntZJxOkylrFsRtubQ8zrsoV/e0Bte8efzk5
         kH8J4KTi5+mndPZVV9G2uCxuulWo90SP4SCJ6g6HmH7pNmcWIymfSno5ZwnEs+VxMfvQ
         8OFpo+3abRJtJ8RJp2xzh6el2bGRLYPNIWYBo/7S9NHYBcecBGDCz/vsRCKQ6jVe6Y9Y
         tDyg==
X-Forwarded-Encrypted: i=1; AJvYcCVyEPDB+QSlx9WCTs3ODa6E4dAhKI6lxiNiTkM3A5+kMY+aFHIF69fYLniQcqDmieS08wNTNtZIO2mEuVY6wjRRNLru5R++
X-Gm-Message-State: AOJu0YxaVxPQwjZUfsF0XzHiMn5LeslDL0Me5k9CSX52UOlaenndrANC
	VqtFSUs/PW0o+lOiPyiUJkvYLbg4x103TL02FGvGZwknTzTuITA8XyHFBledTniurJaokN6gAzg
	EU90V5JUrnTVIaXn9y2uD0YL9LKVR5ba0Rc7FtQtV5ZpNAEb8edgRgA==
X-Received: by 2002:a5d:6741:0:b0:33e:bf11:a007 with SMTP id l1-20020a5d6741000000b0033ebf11a007mr196190wrw.31.1712075577716;
        Tue, 02 Apr 2024 09:32:57 -0700 (PDT)
X-Received: by 2002:a5d:6741:0:b0:33e:bf11:a007 with SMTP id l1-20020a5d6741000000b0033ebf11a007mr196178wrw.31.1712075577416;
        Tue, 02 Apr 2024 09:32:57 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id bt30-20020a056000081e00b0034183537986sm14882027wrb.23.2024.04.02.09.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 09:32:55 -0700 (PDT)
Message-ID: <bdc6bcf5-a937-4320-ac6e-6476523712e8@redhat.com>
Date: Tue, 2 Apr 2024 18:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH 01/12] hw/arm/smmu: Use enum for SMMU stage
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org
References: <20240325101442.1306300-1-smostafa@google.com>
 <20240325101442.1306300-2-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240325101442.1306300-2-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: pwLei/ppTYb1

Hi Mostafa,

On 3/25/24 11:13, Mostafa Saleh wrote:
> Currently, translation stage is represented as an int, where 1 is stage-1 and
> 2 is stage-2, when nested is added, 3 would be confusing to represent nesting,
> so we use an enum instead.
>
> While keeping the same values, this is useful for:
>  - Doing tricks with bit masks, where BIT(0) is stage-1 and BIT(1) is
>    stage-2 and both is nested.
>  - Tracing, as stage is printed as int.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmu-common.c         | 14 +++++++-------
>  hw/arm/smmuv3.c              | 15 ++++++++-------
>  include/hw/arm/smmu-common.h | 11 +++++++++--
>  3 files changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 4caedb4998..3a7c350aca 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -304,7 +304,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>                            SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
>      dma_addr_t baseaddr, indexmask;
> -    int stage = cfg->stage;
> +    SMMUStage stage = cfg->stage;
>      SMMUTransTableInfo *tt = select_tt(cfg, iova);
>      uint8_t level, granule_sz, inputsize, stride;
>  
> @@ -392,7 +392,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>      info->type = SMMU_PTW_ERR_TRANSLATION;
>  
>  error:
> -    info->stage = 1;
> +    info->stage = SMMU_STAGE_1;
>      tlbe->entry.perm = IOMMU_NONE;
>      return -EINVAL;
>  }
> @@ -415,7 +415,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>                            dma_addr_t ipa, IOMMUAccessFlags perm,
>                            SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
> -    const int stage = 2;
> +    const SMMUStage stage = SMMU_STAGE_2;
>      int granule_sz = cfg->s2cfg.granule_sz;
>      /* ARM DDI0487I.a: Table D8-7. */
>      int inputsize = 64 - cfg->s2cfg.tsz;
> @@ -513,7 +513,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>      info->type = SMMU_PTW_ERR_TRANSLATION;
>  
>  error:
> -    info->stage = 2;
> +    info->stage = SMMU_STAGE_2;
>      tlbe->entry.perm = IOMMU_NONE;
>      return -EINVAL;
>  }
> @@ -532,9 +532,9 @@ error:
>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>               SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
> -    if (cfg->stage == 1) {
> +    if (cfg->stage == SMMU_STAGE_1) {
>          return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> -    } else if (cfg->stage == 2) {
> +    } else if (cfg->stage == SMMU_STAGE_2) {
>          /*
>           * If bypassing stage 1(or unimplemented), the input address is passed
>           * directly to stage 2 as IPA. If the input address of a transaction
> @@ -543,7 +543,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>           */
>          if (iova >= (1ULL << cfg->oas)) {
>              info->type = SMMU_PTW_ERR_ADDR_SIZE;
> -            info->stage = 1;
> +            info->stage = SMMU_STAGE_1;
>              tlbe->entry.perm = IOMMU_NONE;
>              return -EINVAL;
>          }
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 9eb56a70f3..50e5a72d54 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -34,7 +34,8 @@
>  #include "smmuv3-internal.h"
>  #include "smmu-internal.h"
>  
> -#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage == 1) ? (cfg)->record_faults : \
> +#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage == SMMU_STAGE_1) ? \
> +                                 (cfg)->record_faults : \
>                                   (cfg)->s2cfg.record_faults)
>  
>  /**
> @@ -402,7 +403,7 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
>  
>  static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
>  {
> -    cfg->stage = 2;
> +    cfg->stage = SMMU_STAGE_2;
>  
>      if (STE_S2AA64(ste) == 0x0) {
>          qemu_log_mask(LOG_UNIMP,
> @@ -678,7 +679,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>  
>      /* we support only those at the moment */
>      cfg->aa64 = true;
> -    cfg->stage = 1;
> +    cfg->stage = SMMU_STAGE_1;
>  
>      cfg->oas = oas2bits(CD_IPS(cd));
>      cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
> @@ -762,7 +763,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return ret;
>      }
>  
> -    if (cfg->aborted || cfg->bypassed || (cfg->stage == 2)) {
> +    if (cfg->aborted || cfg->bypassed || (cfg->stage == SMMU_STAGE_2)) {
>          return 0;
>      }
>  
> @@ -882,7 +883,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto epilogue;
>      }
>  
> -    if (cfg->stage == 1) {
> +    if (cfg->stage == SMMU_STAGE_1) {
>          /* Select stage1 translation table. */
>          tt = select_tt(cfg, addr);
>          if (!tt) {
> @@ -919,7 +920,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>               * nesting is not supported. So it is sufficient to check the
>               * translation stage to know the TLB stage for now.
>               */
> -            event.u.f_walk_eabt.s2 = (cfg->stage == 2);
> +            event.u.f_walk_eabt.s2 = (cfg->stage == SMMU_STAGE_2);
>              if (PTW_RECORD_FAULT(cfg)) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
> @@ -935,7 +936,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>  
>      if (smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info)) {
>          /* All faults from PTW has S2 field. */
> -        event.u.f_walk_eabt.s2 = (ptw_info.stage == 2);
> +        event.u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
>          g_free(cached_entry);
>          switch (ptw_info.type) {
>          case SMMU_PTW_ERR_WALK_EABT:
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 5ec2e6c1a4..b3c881f0ee 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -49,8 +49,15 @@ typedef enum {
>      SMMU_PTW_ERR_PERMISSION,  /* Permission fault */
>  } SMMUPTWEventType;
>  
> +/* SMMU Stage */
> +typedef enum {
> +    SMMU_STAGE_1 = 1,
> +    SMMU_STAGE_2,
> +    SMMU_NESTED,
> +} SMMUStage;
> +
>  typedef struct SMMUPTWEventInfo {
> -    int stage;
> +    SMMUStage stage;
>      SMMUPTWEventType type;
>      dma_addr_t addr; /* fetched address that induced an abort, if any */
>  } SMMUPTWEventInfo;
> @@ -88,7 +95,7 @@ typedef struct SMMUS2Cfg {
>   */
>  typedef struct SMMUTransCfg {
>      /* Shared fields between stage-1 and stage-2. */
> -    int stage;                 /* translation stage */
> +    SMMUStage stage;           /* translation stage */
>      bool disabled;             /* smmu is disabled */
>      bool bypassed;             /* translation is bypassed */
>      bool aborted;              /* translation is aborted */
