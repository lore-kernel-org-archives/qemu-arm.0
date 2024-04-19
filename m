Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2290106ejd;
        Fri, 19 Apr 2024 03:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXr4Z1r80hWWXFX5D7ztfMvA4MaubNdMlG3AThcQKuF2BSkOgq3FiIIQ3h9PSgvEMeYnymBUl5f2V6aa2vLokOeYES1C3M/
X-Received: by 2002:a05:600c:444c:b0:418:ee30:3f92 with SMTP id v12-20020a05600c444c00b00418ee303f92mr947822wmn.25.1713522209636;
        Fri, 19 Apr 2024 03:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713522209; cv=none;
        d=google.com; s=arc-20160816;
        b=ky5lu4vwWjhv1Qxwet9+IaIDNGJ9lbctar6Ai6kdI81RSnMwqoAEid/xEOQkl5asf9
         5Ez6RekC2kRGeFfULI4qOCYWHplfwK/oC+kRSu/R69tRraAv6UkelCXJja8BjYfLszv7
         ZxqkabKXCeVDsk4LM7mB3S/3/0Ekqxx8/FNnpqtxqO3N5SPNXfWODBbQV2xmdLyfkLPT
         xSj0rZRu6W4Bip9HOHSNzLWNNwqXY7/BqjLen2Fj/aogk/22Q+ixQWq6uDAMHkAP0CrO
         kNVF1PbOTNzG9f4dgo6kfnZsBw5sngqZizQGGsJTzlI6IUay9Iq7sm0+fHjwPUhUwt+p
         6FPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=1EgeUPAo0ZhaNzUj3VLilqEyJQlw7wVrDzZhHO0kCoE=;
        fh=koQSE5SPvCJT/7HpIvvB+Q/02SjzbwCxx/+8Njjl/K8=;
        b=be3WoWK42/bhk2noK/I/Og8UWP0dMVTpul2vSTNLs/JpChKWnPoAUkneb8mf/szPFa
         Ka1i5YHTxlyexIEVd5bXvu9baukCmi0+0PP+KdMxkxBKRKTsm0RDv7EA2Juf1e7V3d6x
         hl6FuIS2Tbb0Mv1jApNVQysTPOcJhKhZEwb+zLDIRG3yIxbF3sl2ZkyIs7jTrZztXQcp
         11HRGxlAo0x0BdUJDOUJV1aQUHdOUpHAHfX0nc+3n19ms8hCl4dLPNa/mHaHipXWD63L
         BMPhuZgLRre81jlAvg0RBvJrW/88S7T0/f6+16LmdNsTUBrHJO9AWuHSkmBXw/vqWxHk
         oLVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WfOcYQak;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m37-20020a05600c3b2500b00418d423a384sor199650wms.2.2024.04.19.03.23.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 03:23:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WfOcYQak;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713522209; x=1714127009; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EgeUPAo0ZhaNzUj3VLilqEyJQlw7wVrDzZhHO0kCoE=;
        b=WfOcYQakH35rrH3LJ5qnifh9fyh/wSxZUT5aUvZYlMif7yFWRrNhOS+Kie8lOtOvTl
         mV5olB6Ucc1hI1QrKWsO0fQQe344/suh2IOd9D3Y/PgN0a80dYrALUgTWDzmljo7GYai
         kpAuSNIkpYyRshwjjfINBG7XVgEfItAUxL+YdM5POhRFZzaJahcy6HWz2tLY8abSjM6m
         uktK9J9uXSxxNcb/qcMJEKRSzbz7G9mDQKtd0hEm7CG7Dwvd54VL4JTVkZ7bpQK67QDk
         aYxasKYv8njVNX7n8qkIyUh03eoSSMbH7hvq5GNrPa1CoWYX8IVh82bzt4Ld+MVdwXBV
         Vzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713522209; x=1714127009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1EgeUPAo0ZhaNzUj3VLilqEyJQlw7wVrDzZhHO0kCoE=;
        b=q6/LookfxaQ+DC70NglsmmXowmd02AEbX+rXdk9wBfCDMNZr3vxniUdFyi5d2ui125
         n+kQwVqFd5kt9VmKU0dAsOxZZARkB4pDVsjco9thosYnEULFr4hman2oh7motvxlgbAk
         UC0XXOoExESuFbw1ue0/GVEePR54NMzRN51VgcsPqKK4Kkp4XXZnvNKHHVFqlr3AsVnD
         oROB+bgDy8+CO53u4OyBoFtqw1TTbjZLk2zd91z1VanY1fjW3QLu/0hjNNg/oC5HdHOR
         bApI1T8/wmKg/Yc4jgYcC04rUOp8+5Zfup4tPkf/qBkbQfgLNByH4YoF2zEefRbh9PLR
         1moQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEotDUUykPxH0RDKVUh2aqaPhBetZRZHJTKR6ocjHdhFY01kaVTnhiGHoXL6Gn+Tv4o43i4lNyHPB9O37nZ2K5temqY1G4
X-Gm-Message-State: AOJu0YzEMeNWp4qZ3YcHZiYUOwDusH2DO3X+zta6cKRAnOeN69xIVUlI
	HIThiQvt+dHr9hbiXUv7jtZBMYWSgRizLnkOb+j1WXHjr+MOn1tCWgbO2aMAHU/uZg7dRQb8dCc
	4yQ==
X-Google-Smtp-Source: AGHT+IENpfzfghQkhnr5Nd/8VRHlrRgBh9Lm0w43tANieO/cebb8oS41BzuAm+eGDGM/6EUb5qh8xA==
X-Received: by 2002:a05:600c:3b15:b0:418:f770:3215 with SMTP id m21-20020a05600c3b1500b00418f7703215mr119153wms.5.1713522209045;
        Fri, 19 Apr 2024 03:23:29 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000050c00b00349ac818326sm4058707wrf.43.2024.04.19.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 03:23:28 -0700 (PDT)
Date: Fri, 19 Apr 2024 10:23:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v2 04/13] hw/arm/smmuv3: Translate CD and TT using
 stage-2 table
Message-ID: <ZiJGGScryLmYf6yQ@google.com>
References: <20240408140818.3799590-1-smostafa@google.com>
 <20240408140818.3799590-5-smostafa@google.com>
 <34b66166-9343-4c4e-836a-dbc605572ad3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34b66166-9343-4c4e-836a-dbc605572ad3@redhat.com>
X-TUID: Swais1UbSDgN

Hi Eric,

On Thu, Apr 18, 2024 at 02:51:59PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/8/24 16:08, Mostafa Saleh wrote:
> > According to the user manual (ARM IHI 0070 F.b),
> s/user manual/ARM SMMU architecture specification
> > In "5.2 Stream Table Entry":
> >  [51:6] S1ContextPtr
> >  If Config[1] == 1 (stage 2 enabled), this pointer is an IPA translated by
> >  stage 2 and the programmed value must be within the range of the IAS.
> >
> > In "5.4.1 CD notes":
> >  The translation table walks performed from TTB0 or TTB1 are always performed
> >  in IPA space if stage 2 translations are enabled.
> >
> > So translate both the CD and the TTBx in this patch if nested
> translate the S1 context descriptor pointer and TTBx base addresses
> through the S2 stage (IPA -> PA)
> 
> You may describe what you put in place to do the translation in the
> commit msg, new functions, macro, ...

Will do.

> > translation is requested.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3.c              | 49 ++++++++++++++++++++++++++++++------
> >  include/hw/arm/smmu-common.h | 17 +++++++++++++
> >  2 files changed, 59 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 897f8fe085..a7cf543acc 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -337,14 +337,36 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
> >  
> >  }
> >  
> > +static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> > +                                                 SMMUTransCfg *cfg,
> > +                                                 SMMUEventInfo *event,
> > +                                                 IOMMUAccessFlags flag,
> > +                                                 SMMUTLBEntry **out_entry);
> >  /* @ssid > 0 not supported yet */
> > -static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
> > -                       CD *buf, SMMUEventInfo *event)
> > +static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
> > +                       uint32_t ssid, CD *buf, SMMUEventInfo *event)
> >  {
> >      dma_addr_t addr = STE_CTXPTR(ste);
> >      int ret, i;
> > +    SMMUTranslationStatus status;
> > +    SMMUTLBEntry *entry;
> >  
> >      trace_smmuv3_get_cd(addr);
> > +
> > +    if (cfg->stage == SMMU_NESTED) {
> > +        CALL_FUNC_CFG_S2(cfg, status, smmuv3_do_translate, s, addr,
> > +                         cfg, event, IOMMU_RO, &entry);
> the fact we pass 2 times cfg looks pretty weird from a caller pov. See
> my comment below.

Yes, I don’t like it also as I mentioned in the cover letter,
(see me comment below also)

> 
> do we somewhere check addr is within the proper addr range, IAS if S2,
> OAS if S1. This was missing for S1 but I think it is worth improving now.
> see 3.4.3
Yes, this was added in the next patch.

> > +        /*
> > +         * It is not clear what should happen if this fails, so we return here
> > +         * which gets propagated as a translation error.
> but the error event might be different, no?

But the event is passed to the translate function so the right translation
error will be in the event (addr size, permission…).
It isn't clear to me from the specs if this should be a translation error
or some F_CD_FETCH/C_BAD_CD, and hence the comment, but I though the
translation error info would be more useful for SW that's why I used it.

> > +         */
> > +        if (status != SMMU_TRANS_SUCCESS) {
> > +            return -EINVAL;
> > +        }
> > +
> > +        addr = CACHED_ENTRY_TO_ADDR(entry, addr);
> > +    }
> > +
> >      /* TODO: guarantee 64-bit single-copy atomicity */
> >      ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
> >                            MEMTXATTRS_UNSPECIFIED);
> > @@ -659,10 +681,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
> >      return 0;
> >  }
> >  
> > -static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
> > +static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
> > +                     CD *cd, SMMUEventInfo *event)
> >  {
> >      int ret = -EINVAL;
> >      int i;
> > +    SMMUTranslationStatus status;
> > +    SMMUTLBEntry *entry;
> >  
> >      if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
> >          goto bad_cd;
> > @@ -713,6 +738,17 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
> >  
> >          tt->tsz = tsz;
> >          tt->ttb = CD_TTB(cd, i);
> > +
> > +        /* Translate the TTBx, from IPA to PA if nesting is enabled. */
> > +        if (cfg->stage == SMMU_NESTED) {
> > +            CALL_FUNC_CFG_S2(cfg, status, smmuv3_do_translate, s,
> > +                             tt->ttb, cfg, event, IOMMU_RO, &entry);
> > +            /* See smmu_get_cd(). */
> ditto
> > +            if (status != SMMU_TRANS_SUCCESS) {
> > +                return -EINVAL;
> > +            }
> > +            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
> > +        }
> >          if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
> >              goto bad_cd;
> >          }
> > @@ -767,12 +803,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
> >          return 0;
> >      }
> >  
> > -    ret = smmu_get_cd(s, &ste, 0 /* ssid */, &cd, event);
> > +    ret = smmu_get_cd(s, &ste, cfg, 0 /* ssid */, &cd, event);
> >      if (ret) {
> >          return ret;
> >      }
> >  
> > -    return decode_cd(cfg, &cd, event);
> > +    return decode_cd(s, cfg, &cd, event);
> >  }
> >  
> >  /**
> > @@ -942,8 +978,7 @@ epilogue:
> >      switch (status) {
> >      case SMMU_TRANS_SUCCESS:
> >          entry.perm = cached_entry->entry.perm;
> > -        entry.translated_addr = cached_entry->entry.translated_addr +
> > -                                    (addr & cached_entry->entry.addr_mask);
> > +        entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
> >          entry.addr_mask = cached_entry->entry.addr_mask;
> >          trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
> >                                         entry.translated_addr, entry.perm,
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index 96eb017e50..2772175115 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -37,6 +37,23 @@
> >  #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
> >                                               VMSA_BIT_LVL(isz, strd, lvl)) - 1)
> >  
> > +#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
> > +                                             ((addr) & (ent)->entry.addr_mask);
> > +
> > +/*
> > + * From nested context, some functions might need to translate IPA addresses.
> > + * As cfg has SMMU_NESTED, this won't work, this macro calls a function with
> > + * making it a stage-2 cfg and then restore it after.
> > + */
> > +#define CALL_FUNC_CFG_S2(cfg, ret, fn, ...)  ({ \
> > +                                                   int asid = cfg->asid; \
> > +                                                   cfg->stage = SMMU_STAGE_2; \
> > +                                                   cfg->asid = -1; \
> > +                                                   ret = fn(__VA_ARGS__); \
> At this stage of the reading this is not obvious why you need fn()
> parameter, can't you simply call
> 
> smmuv3_do_translate(). If this is useful at some point in the series, you shall document that in the commit msg. 
> Also I think I would prefer a proper function instead of this macro.
> 
> Besides, can't we add an extra parameter to the translate function forcing the S2_only translation although the cfg is a nested one. I think this would make things clearer
> 
This macro is reused with “smmu_translate” in the next patches, I had a
look with adding a a separate arg and I didn’t like it either, I can try
again or may be have a clear separate wrapper for this.


Thanks,
Mostafa
> > +                                                   cfg->asid = asid; \
> > +                                                   cfg->stage = SMMU_NESTED; \
> > +                                              })
> > +
> >  /*
> >   * Page table walk error types
> >   */
> Thanks
> 
> Eric
> 
