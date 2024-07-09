Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3118455njb;
        Tue, 9 Jul 2024 00:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjh0V6aMKbftVZn69X++960uFewmvFBuoUpiAvDy/FvgYNcfikTFF0XEYbFGqCWWMjnRQxdDeL0M95+p/c4j1AmY/762iD
X-Received: by 2002:a05:600c:4487:b0:426:5cc7:82f with SMTP id 5b1f17b1804b1-42672305c06mr9932685e9.13.1720509185078;
        Tue, 09 Jul 2024 00:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720509185; cv=none;
        d=google.com; s=arc-20160816;
        b=bWIlhkNctp/uiQavMQGMnFNRqSlmuYwyTG0GtpzIjjiHKYENrRpLO+PDAdxJ7n/hH2
         F4erEVcRe+Yats/H5yDWo1Mb6dzx6T+Fgjy+1LqfviGCUf3VCWKuebb2L8O6KT3MZEDI
         +ifWyoxoc1d+7AAs9XVl9qC5GJ977JLIS+1w1FJ5RYZ5eR8KLmcIJWrGhSGF44c0+oFv
         LMThMH/+eZ1EeNIM977+Q6MAgGc6szisSCzfE9LJ3+69aLu5khFVutwt8uXn3A6UqTie
         Z1VrB3IvK6j+TljYP5TNg16my0g27ldar1W08eiyP8FqE27Fc/v8/pkKiVSZpXChH6z7
         zSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=oFXoVYF97gkK4z0tIrcIPhzZWtS9yIZ3RjPleT5nSI0=;
        fh=1zE6YRmsqD7Kw6rHwwjolZ4RjjqHrQgJgv0lf5eBY68=;
        b=Zdol2sBwWhZEvePXCwygCM/qGS40Uole0iCUV/ZF3hjI3VBW0050i1hquKVdV+t8g/
         vUisIwskDsKaGrQVhYFJV8Tg5QUvikiGi87bmb5NGM4h5Zk7px3aQ1jacZYra/hYJqLc
         NOJc34rZcEvgUSpOsOjdaEaz8pX/3O1sHbSka5Zez1jDBK+74NWI5u6TeqHkBcfw3Z1I
         gqZpmxH5fHHxCaqduZjEFKumR1VuFIiRscg1m6ps+qpq6+Xq6LWlmRUn1eD2AQSCuFQl
         E2ZDAQoW7S3SrMXkmbCSmfX1lUEwwNaxzPYmLY98UPLpUdCuzc22dnOzRfIm4PPydWPh
         1Tag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pbJLo6p4;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-426740f011fsor272045e9.9.2024.07.09.00.13.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 00:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pbJLo6p4;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720509184; x=1721113984; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFXoVYF97gkK4z0tIrcIPhzZWtS9yIZ3RjPleT5nSI0=;
        b=pbJLo6p4w+igcHtN65LK6XP1eb/M8C+eya6UoAUBGTFeJHWdlIH0cbsX5NL+r0Id3G
         Cvcp3SxWncRKARWjUpbGVnPMFneXXXmrNgaYS5sDiti3QQSHxdS+GsZjABUk3b5qdbue
         o0OpjwX1uxDnjNMrS0rmY+y1UDDTwwi0N9Ez27TGsbEAMs0PPJ4ApYCuT9MPElTSLJO9
         9tTv50lA+rlKwNZ4axiVly/+jrufQmv0S457Kr3LVaZf2CPnpGjzzKB8nb2UR2cVrVti
         wc8QM9qXxmDhBIY0sdr7BdKmLUofthOnT9pgEyHWgGqrRGCqwofW1ph2HpZDTI2r5mEo
         76Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509184; x=1721113984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFXoVYF97gkK4z0tIrcIPhzZWtS9yIZ3RjPleT5nSI0=;
        b=HCkaHNBMaBYhu7CLpWB2SZOppClgA82tZzuhe3ifuTbp3tHNYHAxeyYMgBwgJDp3s/
         K6WUGw1kxQecpLGI9/H/nbFafgf+3rO2w7xTEDwlzOJkH7u75JmYvFRECzOYCs/uAfvS
         atx60kj12x6CAXXdXRXp2TJqwjn7+vnuZXyZ6KqpzD4P6Gj1u6AJbrhes/hOkJBRb82o
         PQ+MxBirmZ/MbGPImgIQzn9HBEA4nCYzK1rwf494QJwlsaKVlTeevNzNLbFvIa2kIz7l
         ialXkjB8stCSSYGmDk4//AhOOH4NsKm/1UyXEWBQxUpzf+4xhjr7HZNrSZHK6x3kDiV0
         2pRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUfHNLCbs22xcr6/ByxNl28IBbblmtEf7tHJI44+RbIxfEhhxeDNhWtnkkP8sGiOe/4V1wp8Ny9neMudaE3yo6iuhVSn3+
X-Gm-Message-State: AOJu0YyaCJIkBC5dKKLu4idywGSGFq8y8O9AEn2R27YZ6CSq1l/7VtDy
	G5qYtFUxYB+6xl8Enf2KaZZDNhFRIV2NoZcW4bQHFE4UgxTbRThsighw73nC2g==
X-Google-Smtp-Source: AGHT+IGSP43LpO2H9B2whYs4eTaqbJY0ejS6Zaaax4RaWahW1pZX+v0UA3SFFtmHZscG37h7Mv+rIA==
X-Received: by 2002:a7b:c84d:0:b0:426:66fd:5fac with SMTP id 5b1f17b1804b1-42671a81595mr1323005e9.2.1720509184200;
        Tue, 09 Jul 2024 00:13:04 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab199sm1640939f8f.106.2024.07.09.00.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:13:03 -0700 (PDT)
Date: Tue, 9 Jul 2024 07:12:59 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 08/19] hw/arm/smmuv3: Translate CD and TT using
 stage-2 table
Message-ID: <Zozi-87pVHOdwJGN@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-9-smostafa@google.com>
 <20240704180843.GE1693268@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704180843.GE1693268@myrica>
X-TUID: hQKpCnqcnQQd

Hi Jean,

On Thu, Jul 04, 2024 at 07:08:43PM +0100, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:30AM +0000, Mostafa Saleh wrote:
> > According to ARM SMMU architecture specification (ARM IHI 0070 F.b),
> > In "5.2 Stream Table Entry":
> >  [51:6] S1ContextPtr
> >  If Config[1] == 1 (stage 2 enabled), this pointer is an IPA translated by
> >  stage 2 and the programmed value must be within the range of the IAS.
> > 
> > In "5.4.1 CD notes":
> >  The translation table walks performed from TTB0 or TTB1 are always performed
> >  in IPA space if stage 2 translations are enabled.
> > 
> > This patch implements translation of the S1 context descriptor pointer and
> > TTBx base addresses through the S2 stage (IPA -> PA)
> > 
> > smmuv3_do_translate() is updated to have one arg which is translation
> > class, this is useful to:
> >  - Decide wether a translation is stage-2 only or use the STE config.
> >  - Populate the class in case of faults, WALK_EABT is left unchanged,
> >    as it is always triggered from TT access so no need to use the
> >    input class.
> > 
> > In case for stage-2 only translation, used in the context of nested
> > translation, the stage and asid are saved and restored before and
> > after calling smmu_translate().
> > 
> > Translating CD or TTBx can fail for the following reasons:
> > 1) Large address size: This is described in
> >    (3.4.3 Address sizes of SMMU-originated accesses)
> >    - For CD ptr larger than IAS, for SMMUv3.1, it can trigger either
> >      C_BAD_STE or Translation fault, we implement the latter as it
> >      requires no extra code.
> >    - For TTBx, if larger than the effective stage 1 output address size, it
> >      triggers C_BAD_CD.
> > 
> > 2) Faults from PTWs (7.3 Event records)
> >    - F_ADDR_SIZE: large address size after first level causes stage 2 Address
> >      Size fault (Also in 3.4.3 Address sizes of SMMU-originated accesses)
> >    - F_PERMISSION: Same as an address translation. However, when
> >      CLASS == CD, the access is implicitly Data and a read.
> >    - F_ACCESS: Same as an address translation.
> >    - F_TRANSLATION: Same as an address translation.
> >    - F_WALK_EABT: Same as an address translation.
> >   These are already implemented in the PTW logic, so no extra handling
> >   required.
> > 
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3.c | 91 +++++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 80 insertions(+), 11 deletions(-)
> > 
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 229b3c388c..86f95c1e40 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -337,14 +337,35 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
> >  
> >  }
> >  
> > +static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> > +                                                 SMMUTransCfg *cfg,
> > +                                                 SMMUEventInfo *event,
> > +                                                 IOMMUAccessFlags flag,
> > +                                                 SMMUTLBEntry **out_entry,
> > +                                                 SMMUTranslationClass class);
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
> > +        status = smmuv3_do_translate(s, addr, cfg, event,
> > +                                     IOMMU_RO, &entry, SMMU_CLASS_CD);
> > +
> > +        /* Same PTW faults are reported but with CLASS = CD. */
> > +        if (status != SMMU_TRANS_SUCCESS) {
> 
> In this case I think we're reporting InputAddr as the CD address, but it
> should be the IOVA

As Eric mentioned this would require some rework to propagate the iova,
but what I am more worried about is the readability in that case, may be we
can just fixup the event after smmuv3_get_config() in case of errors,
something like:

/*
 * smmuv3_get_config() Only return translation faults in case of
 * nested translation, otherwise it can only return C_BAD_CD,
 * C_BAD_STE, C_BAD_STREAMID or F_STE_FETCH.
 * But in case of translation fault, we need to fixup the
 * InputAddr to be the IOVA of the translation as the decode
 * functions don't know about it.
 */
static void smmuv3_config_fixup_event(SMMUEventInfo *event, hwaddr iova)
{
   switch (event->type) {
   case SMMU_EVT_F_WALK_EABT:
   case SMMU_EVT_F_TRANSLATION:
   case SMMU_EVT_F_ADDR_SIZE:
   case SMMU_EVT_F_ACCESS:
   case SMMU_EVT_F_PERMISSION:
       event->u.f_walk_eabt.addr = iova;
       break;
   default:
       break;
   }
}

What do you think?

Thanks,
Mostafa

> 
> > +            return -EINVAL;
> > +        }
> > +
> > +        addr = CACHED_ENTRY_TO_ADDR(entry, addr);
> > +    }
> > +
> >      /* TODO: guarantee 64-bit single-copy atomicity */
> >      ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
> >                            MEMTXATTRS_UNSPECIFIED);
> > @@ -659,10 +680,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
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
> > @@ -713,9 +737,26 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
> >  
> >          tt->tsz = tsz;
> >          tt->ttb = CD_TTB(cd, i);
> > +
> >          if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
> >              goto bad_cd;
> >          }
> > +
> > +        /* Translate the TTBx, from IPA to PA if nesting is enabled. */
> > +        if (cfg->stage == SMMU_NESTED) {
> > +            status = smmuv3_do_translate(s, tt->ttb, cfg, event, IOMMU_RO,
> > +                                         &entry, SMMU_CLASS_TT);
> > +            /*
> > +             * Same PTW faults are reported but with CLASS = TT.
> > +             * If TTBx is larger than the effective stage 1 output addres
> > +             * size, it reports C_BAD_CD, which is handled by the above case.
> > +             */
> > +            if (status != SMMU_TRANS_SUCCESS) {
> 
> Here too, we should report InputAddr as the IOVA
> 
> > +                return -EINVAL;
> > +            }
> > +            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
> > +        }
> > +
> >          tt->had = CD_HAD(cd, i);
> >          trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
> >      }
> > @@ -767,12 +808,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
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
> > @@ -832,13 +873,40 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> >                                                   SMMUTransCfg *cfg,
> >                                                   SMMUEventInfo *event,
> >                                                   IOMMUAccessFlags flag,
> > -                                                 SMMUTLBEntry **out_entry)
> > +                                                 SMMUTLBEntry **out_entry,
> > +                                                 SMMUTranslationClass class)
> >  {
> >      SMMUPTWEventInfo ptw_info = {};
> >      SMMUState *bs = ARM_SMMU(s);
> >      SMMUTLBEntry *cached_entry = NULL;
> > +    int asid, stage;
> > +    bool S2_only = class != SMMU_CLASS_IN;
> > +
> > +    /*
> > +     * The function uses the argument class to indentify which stage is used:
> 
> identify
> 
> > +     * - CLASS = IN: Means an input translation, determine the stage from STE.
> > +     * - CLASS = CD: Means the addr is an IPA of the CD, and it would be
> > +     *   tranlsated using the stage-2.
> 
> translated
> 
> > +     * - CLASS = TT: Means the addr is an IPA of the stage-1 translation table
> > +     *   and it would be tranlsated using the stage-2.
> 
> translated
> 
> > +     * For the last 2 cases instead of having intrusive changes in the common
> > +     * logic, we modify the cfg to be a stage-2 translation only in case of
> > +     * nested, and then restore it after.
> > +     */
> > +    if (S2_only) {
> 
> "S2_only" seems a bit confusing because in the spec "stage 2-only" means
> absence of nesting, which is the opposite of what we're handling here.
> I don't have a good alternative though, maybe "desc_s2_translation"
> 
> Thanks,
> Jean
> 
> > +        asid = cfg->asid;
> > +        stage = cfg->stage;
> > +        cfg->asid = -1;
> > +        cfg->stage = SMMU_STAGE_2;
> > +    }
> >  
> >      cached_entry = smmu_translate(bs, cfg, addr, flag, &ptw_info);
> > +
> > +    if (S2_only) {
> > +        cfg->asid = asid;
> > +        cfg->stage = stage;
> > +    }
> > +
> >      if (!cached_entry) {
> >          /* All faults from PTW has S2 field. */
> >          event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
> > @@ -855,7 +923,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> >                  event->type = SMMU_EVT_F_TRANSLATION;
> >                  event->u.f_translation.addr = addr;
> >                  event->u.f_translation.addr2 = ptw_info.addr;
> > -                event->u.f_translation.class = SMMU_CLASS_IN;
> > +                event->u.f_translation.class = class;
> >                  event->u.f_translation.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -864,7 +932,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> >                  event->type = SMMU_EVT_F_ADDR_SIZE;
> >                  event->u.f_addr_size.addr = addr;
> >                  event->u.f_addr_size.addr2 = ptw_info.addr;
> > -                event->u.f_addr_size.class = SMMU_CLASS_IN;
> > +                event->u.f_addr_size.class = class;
> >                  event->u.f_addr_size.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -873,7 +941,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> >                  event->type = SMMU_EVT_F_ACCESS;
> >                  event->u.f_access.addr = addr;
> >                  event->u.f_access.addr2 = ptw_info.addr;
> > -                event->u.f_access.class = SMMU_CLASS_IN;
> > +                event->u.f_access.class = class;
> >                  event->u.f_access.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -882,7 +950,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> >                  event->type = SMMU_EVT_F_PERMISSION;
> >                  event->u.f_permission.addr = addr;
> >                  event->u.f_permission.addr2 = ptw_info.addr;
> > -                event->u.f_permission.class = SMMU_CLASS_IN;
> > +                event->u.f_permission.class = class;
> >                  event->u.f_permission.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -943,7 +1011,8 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >          goto epilogue;
> >      }
> >  
> > -    status = smmuv3_do_translate(s, addr, cfg, &event, flag, &cached_entry);
> > +    status = smmuv3_do_translate(s, addr, cfg, &event, flag,
> > +                                 &cached_entry, SMMU_CLASS_IN);
> >  
> >  epilogue:
> >      qemu_mutex_unlock(&s->mutex);
> > -- 
> > 2.45.2.803.g4e1b14247a-goog
> > 
