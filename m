Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp641431ejl;
        Wed, 15 May 2024 06:15:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/S4M2d96ZfT4pPvMXADeHGsv3j1J0p0D01R6YzGa8hOgXY2fX9St+XpD1xnlekWBCvGZYTMNSoRzJLdJXxln4P5kX67tW
X-Google-Smtp-Source: AGHT+IFNvQLut4g6DI2uJHJE+ifqxPnXpw/zqHjsU9v1T8HAOzai/lqcRgUh8CT5IVG7TnBMxdMc
X-Received: by 2002:a05:622a:109:b0:43a:3502:8446 with SMTP id d75a77b69052e-43dec39be29mr328904551cf.28.1715778909096;
        Wed, 15 May 2024 06:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715778909; cv=none;
        d=google.com; s=arc-20160816;
        b=IDyxwpjiZ76kTA/uRhpbWWCIRJnvSlPx4Hj+aGacAYXu6OaIWN6aS2Xf4oqoZA86c+
         vYjgly9oQJLpNsWI9+yswrB1YdbS/ZmObG6L/zV8P59VDP67QvCa8RylYj98m33+y7Eu
         caDzYvLV98ujOOMDo6PblAxKQa61rxvmMlMsV3IhtG010R3bGB2C9hYVgMHo2Wc0XGRQ
         ag51PzlaTTl8oVsIEmld1dw/sdDV7Pxwz1MBghfuJ7x1pzZyaEUb4gmrNIGlah/2cSG8
         eCQT5hB864eFcY2ReAXiaiOyp6bT1I28ZPSDOv4yxw/T/jY3FfAhFkRxiMe9w/jOfP5G
         xLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=IgCFc7fE91kXvNd/fojsUcnKocwaxuIhKG/VnIt+jz4=;
        fh=BJ2mxJKWJhnfuXoFRi2HFmd3x3tGfVvEXYKY4XofPTI=;
        b=pDJFQZuOIR3rGpLMzlzRQ3FC3Hr3xF2HdInyR8GLSfMrAJKBNbVQ9ShQGNv98KSAI9
         XMzAp5FjPIRrttdv/KR1Gjn+QWnTexJ14YuwQXjtQJZJ1hu0/3WWr4NwfZgYPbG8qqOo
         KatKcyJi9P0CKw0NLN5B5gSAGo13iWmlqmrjAopvTaKAbD03SHQieRPG7MKPZgBWxLWW
         stF74gWSeUcxyyXwYZgHoWVM+xMSh2NvHkTRc8sKucvwR6+/gAIvkT/kYS2VWYNf4z8J
         qqXMw1p3gl/fvLHD9bEFqMI218s0mggHgVjLcS0szcdZm+BsIG04rJPFrfI7mZQRtuwi
         IoHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VC6/jdd+";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-43df56d4a5asi5729641cf.683.2024.05.15.06.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VC6/jdd+";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715778908;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgCFc7fE91kXvNd/fojsUcnKocwaxuIhKG/VnIt+jz4=;
	b=VC6/jdd+PUCqyS1bPo/7smxALQnpHf06KgL3QS9A/jzftCRgceQykIMzN+nGZlsYh2LYzK
	FAWQJwIr/IwjglFR2Z4B0jafob6nSMClvKx4BHbA2zmhl91T9XRhmrBulzOQWF+B+y134G
	wzLufLFD44N6e4v2IKlWmU8bK7f3l/4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-CP3LyCGGOn-VzVgnjfpeTQ-1; Wed, 15 May 2024 09:15:07 -0400
X-MC-Unique: CP3LyCGGOn-VzVgnjfpeTQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43df64b7bd6so113923861cf.0
        for <alex.bennee@linaro.org>; Wed, 15 May 2024 06:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715778907; x=1716383707;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgCFc7fE91kXvNd/fojsUcnKocwaxuIhKG/VnIt+jz4=;
        b=AyfUYt1tYvw25HAe7P3wDl3jhoVbrntGH82DJSiJq7HmI/kJH2/rmSyhJk+4mterQ+
         s7FPsE2INmtdmLT8hxib2+fROX2eGzx2HOYtRWSANa9P6+SFO3S6Rs/xxx1r6LzPjp7l
         DPJYJn23ri77vAabbg6lt0pSowaRJ8NiolOdkePI7H4pQj4PiSyOmxhcWeN0gVMJWDis
         bszbeemRo22mydRPS22M91R5L9GComw8fhG6x2UX90tE90AhaxNUfvNA2gxDSszkZNGd
         UewcxU8EUR2IyyhHRA/dX3cIQYftnYouuiN4EGjDz8kqaQxSlpGReiHe5GFZJGtqA0l0
         fZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCWH6j3dUeYi6u35qxkSaH71WPGOPwiYeTIEe2CUc38WuSL5uMpb+UgsTzNYJqYGwJOpi/9ECNNQBm4MqWP38IVhu0Vu2euz
X-Gm-Message-State: AOJu0Yzul6iKZb1AcEz579p65FW5lCRUqSjGGGHY5ykwnIGFjlGH5VY9
	ElELn81VoyQugGHevCA9FWvbvmNbEb+GSXijo+YRuumrx5/55n4+h3Hg+p0pFXkY2f04h1Nca8d
	ArUhk2NIRX0F0Tj/unoXUpMWc8SmNRSJN1XuD69CSo6MjuW7HZBjTWw==
X-Received: by 2002:a05:622a:296:b0:43e:22d0:d1a6 with SMTP id d75a77b69052e-43e22d0d39cmr100715081cf.13.1715778906654;
        Wed, 15 May 2024 06:15:06 -0700 (PDT)
X-Received: by 2002:a05:622a:296:b0:43e:22d0:d1a6 with SMTP id d75a77b69052e-43e22d0d39cmr100714741cf.13.1715778906183;
        Wed, 15 May 2024 06:15:06 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54f216esm83510711cf.31.2024.05.15.06.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 06:15:05 -0700 (PDT)
Message-ID: <b5808f6e-cead-4291-8274-079ad11a922d@redhat.com>
Date: Wed, 15 May 2024 15:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 07/18] hw/arm/smmuv3: Translate CD and TT using
 stage-2 table
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-8-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-8-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: mI/vUP7hTLfk

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
> According to ARM SMMU architecture specification (ARM IHI 0070 F.b),
> In "5.2 Stream Table Entry":
>  [51:6] S1ContextPtr
>  If Config[1] == 1 (stage 2 enabled), this pointer is an IPA translated by
>  stage 2 and the programmed value must be within the range of the IAS.
>
> In "5.4.1 CD notes":
>  The translation table walks performed from TTB0 or TTB1 are always performed
>  in IPA space if stage 2 translations are enabled.
>
> This patch implements translation of the S1 context descriptor pointer and
> TTBx base addresses through the S2 stage (IPA -> PA)
>
> smmuv3_do_translate() is updated to have one arg which is translation
> class, this is useful for:
s/for/to?
>  - Decide wether a translation is stage-2 only or use the STE config.
>  - Populate the class in case of faults, WALK_EABT is lefat as it as
left unchanged?
>    it is always triggered from TT access so no need to use the input
>    class.
>
> In case for stage-2 only translation, which only used in nesting, the
in case of S2 translation used in the contexted of a nested translation, ...
> stage and asid are saved and restored before and after calling
> smmu_translate().
>
> Translating CD or TTBx can fail for the following reasons:
> 1) Large address size: This is described in
>    (3.4.3 Address sizes of SMMU-originated accesses)
>    - For CD ptr larger than IAS, for SMMUv3.1, it can trigger either
>      C_BAD_STE or Translation fault, we implement the latter as it
>      requires no extra code.
>    - For TTBx, if larger than the effective stage 1 output address size, it
>      triggers C_BAD_CD.
>
> 2) Faults from PTWs (7.3 Event records)
>    - F_ADDR_SIZE: large address size after first level causes stage 2 Address
>      Size fault (Also in 3.4.3 Address sizes of SMMU-originated accesses)
>    - F_PERMISSION: Same as an address translation. However, when
>      CLASS == CD, the access is implicitly Data and a read.
>    - F_ACCESS: Same as an address translation.
>    - F_TRANSLATION: Same as an address translation.
>    - F_WALK_EABT: Same as an address translation.
>   These are already implemented in the PTW logic, so no extra handling
>   required.
>
> As, there is multiple locations where the address is calculated from
> cached entry, a new macro is introduced CACHED_ENTRY_TO_ADDR.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c              | 76 ++++++++++++++++++++++++++++++------
>  include/hw/arm/smmu-common.h |  3 ++
>  2 files changed, 66 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index cc61708160..cc61c82321 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -337,14 +337,33 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
>  
>  }
>  
> +static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> +                                                 SMMUTransCfg *cfg,
> +                                                 SMMUEventInfo *event,
> +                                                 IOMMUAccessFlags flag,
> +                                                 SMMUTLBEntry **out_entry,
> +                                                 SMMUTranslationClass class);
>  /* @ssid > 0 not supported yet */
> -static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
> -                       CD *buf, SMMUEventInfo *event)
> +static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
> +                       uint32_t ssid, CD *buf, SMMUEventInfo *event)
>  {
>      dma_addr_t addr = STE_CTXPTR(ste);
>      int ret, i;
> +    SMMUTranslationStatus status;
> +    SMMUTLBEntry *entry;
>  
>      trace_smmuv3_get_cd(addr);
> +
> +    if (cfg->stage == SMMU_NESTED) {
> +        status = smmuv3_do_translate(s, addr, cfg, event,
> +                                     IOMMU_RO, &entry, SMMU_CLASS_CD);
> +        if (status != SMMU_TRANS_SUCCESS) {
So I guess you rely on event being populated by above CD S2 translate().
it does not need to be patched, correct?
May be worth a comment.
> +            return -EINVAL;
> +        }
> +
> +        addr = CACHED_ENTRY_TO_ADDR(entry, addr);
> +    }
> +
>      /* TODO: guarantee 64-bit single-copy atomicity */
>      ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
>                            MEMTXATTRS_UNSPECIFIED);
> @@ -659,10 +678,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>      return 0;
>  }
>  
> -static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
> +static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
> +                     CD *cd, SMMUEventInfo *event)
>  {
>      int ret = -EINVAL;
>      int i;
> +    SMMUTranslationStatus status;
> +    SMMUTLBEntry *entry;
>  
>      if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
>          goto bad_cd;
> @@ -713,9 +735,21 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>  
>          tt->tsz = tsz;
>          tt->ttb = CD_TTB(cd, i);
> +
>          if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
>              goto bad_cd;
>          }
> +
> +        /* Translate the TTBx, from IPA to PA if nesting is enabled. */
> +        if (cfg->stage == SMMU_NESTED) {
> +            status = smmuv3_do_translate(s, tt->ttb, cfg, event, IOMMU_RO,
> +                                         &entry, SMMU_CLASS_TT);
> +            if (status != SMMU_TRANS_SUCCESS) {
same here.
> +                return -EINVAL;
> +            }
> +            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
> +        }
> +
>          tt->had = CD_HAD(cd, i);
>          trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
>      }
> @@ -767,12 +801,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return 0;
>      }
>  
> -    ret = smmu_get_cd(s, &ste, 0 /* ssid */, &cd, event);
> +    ret = smmu_get_cd(s, &ste, cfg, 0 /* ssid */, &cd, event);
>      if (ret) {
>          return ret;
>      }
>  
> -    return decode_cd(cfg, &cd, event);
> +    return decode_cd(s, cfg, &cd, event);
>  }
>  
>  /**
> @@ -832,13 +866,29 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                                                   SMMUTransCfg *cfg,
>                                                   SMMUEventInfo *event,
>                                                   IOMMUAccessFlags flag,
> -                                                 SMMUTLBEntry **out_entry)
> +                                                 SMMUTLBEntry **out_entry,
> +                                                 SMMUTranslationClass class)
>  {
>      SMMUPTWEventInfo ptw_info = {};
>      SMMUState *bs = ARM_SMMU(s);
>      SMMUTLBEntry *cached_entry = NULL;
> +    int asid, stage;
> +    bool S2_only = class != SMMU_CLASS_IN;
> +
> +    if (S2_only) {
Please add a comment explaining that class value is used to identify
S2-only forced translation in the context of a nested translation.
In that case we hackily override the original config to reach our goal
and then restore the original config.
That's pretty hacky. Let's see if any other reviewer has a better idea
;-) on my end I understand it and I can bear the trick :)


> +        asid = cfg->asid;
> +        stage = cfg->stage;
> +        cfg->asid = -1;
> +        cfg->stage = SMMU_STAGE_2;
> +    }
>  
>      cached_entry = smmu_translate(bs, cfg, addr, flag, &ptw_info);
> +
> +    if (S2_only) {
> +        cfg->asid = asid;
> +        cfg->stage = stage;
> +    }
> +
>      if (!cached_entry) {
>          /* All faults from PTW has S2 field. */
>          event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
> @@ -855,7 +905,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                  event->type = SMMU_EVT_F_TRANSLATION;
>                  event->u.f_translation.addr = addr;
>                  event->u.f_translation.addr2 = ptw_info.addr;
> -                event->u.f_translation.class = SMMU_CLASS_IN;
> +                event->u.f_translation.class = class;
>                  event->u.f_translation.rnw = flag & 0x1;
>              }
>              break;
> @@ -864,7 +914,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                  event->type = SMMU_EVT_F_ADDR_SIZE;
>                  event->u.f_addr_size.addr = addr;
>                  event->u.f_addr_size.addr2 = ptw_info.addr;
> -                event->u.f_addr_size.class = SMMU_CLASS_IN;
> +                event->u.f_addr_size.class = class;
>                  event->u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
> @@ -873,7 +923,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                  event->type = SMMU_EVT_F_ACCESS;
>                  event->u.f_access.addr = addr;
>                  event->u.f_access.addr2 = ptw_info.addr;
> -                event->u.f_access.class = SMMU_CLASS_IN;
> +                event->u.f_access.class = class;
>                  event->u.f_access.rnw = flag & 0x1;
>              }
>              break;
> @@ -882,7 +932,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                  event->type = SMMU_EVT_F_PERMISSION;
>                  event->u.f_permission.addr = addr;
>                  event->u.f_permission.addr2 = ptw_info.addr;
> -                event->u.f_permission.class = SMMU_CLASS_IN;
> +                event->u.f_permission.class = class;
>                  event->u.f_permission.rnw = flag & 0x1;
>              }
>              break;
> @@ -943,15 +993,15 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto epilogue;
>      }
>  
> -    status = smmuv3_do_translate(s, addr, cfg, &event, flag, &cached_entry);
> +    status = smmuv3_do_translate(s, addr, cfg, &event, flag,
> +                                 &cached_entry, SMMU_CLASS_IN);
>  
>  epilogue:
>      qemu_mutex_unlock(&s->mutex);
>      switch (status) {
>      case SMMU_TRANS_SUCCESS:
>          entry.perm = cached_entry->entry.perm;
> -        entry.translated_addr = cached_entry->entry.translated_addr +
> -                                    (addr & cached_entry->entry.addr_mask);
> +        entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
>          entry.addr_mask = cached_entry->entry.addr_mask;
>          trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
>                                         entry.translated_addr, entry.perm,
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 96eb017e50..09d3b9e734 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -37,6 +37,9 @@
>  #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
>                                               VMSA_BIT_LVL(isz, strd, lvl)) - 1)
>  
> +#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
> +                                             ((addr) & (ent)->entry.addr_mask);
> +
nit; this could be introduced in a separate patch since you have a
caller in smmuv3_translate(). This may help the reviewer to focus on the
most important class related changes.

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

>  /*
>   * Page table walk error types
>   */
