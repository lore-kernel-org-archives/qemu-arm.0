Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1480238ejl;
        Thu, 16 May 2024 09:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXr+QNf0qWL24FS58BRLhxcQy9IRySiHoRnKE+vMxIN/pWs3bQBPU+O9YpoMe2ySYbkGX1GsozP4UlgaoP09p9IUp7uEhYN
X-Received: by 2002:a50:d4d4:0:b0:572:4761:1947 with SMTP id 4fb4d7f45d1cf-5734d703619mr12160937a12.36.1715875916302;
        Thu, 16 May 2024 09:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715875916; cv=none;
        d=google.com; s=arc-20160816;
        b=0j4K3FBeDxbHRyUCauIItvhfcChjtpAfmiHtLoKd2ctCXUbL5ExacCHVsS/LOkSg9k
         lENdtp8Pk4hJvmSOtmpWWxrBtjQNSb2C187JnQuF+KNnXWUuGQ64KBF+vd4oJmBkAbnG
         7LU0VeRY4MGJ5po339ELEol9ulZZbK1gri9p/1+o5+Ui8q/Xg7kd+WViVGkxlzGzc0Dy
         Qk/zUFsRFWuJo7wE1q4QyD8mZdjW2vqsDRXF9dg2Eutkp7x9AZrz20OlNl4YTl0TIr6P
         aUZdtdY2FZiWdBnzgR68/ty9eL7/XHioBMQWHm5IGgwSN8S1WFRhOMkK6P3ag2jbzZH5
         eklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=HBq674saoFEEAoKSou+e+8DdajwlH6jfYyW5XuVaTyg=;
        fh=ccDSyb1N3OCUPJf5Lp9iYcmExi1KZ0pzqL2oIg0eoYI=;
        b=VKBQzBqmURgo4gq+iBTW9K8PgqNSPfts3l3TM81Jz4d8O1lpTifbq0+EUlEsczMDXB
         HfSoNgpswXKDzNkG6tKKO+hPcjb6a8ZIwGwIHmapy0154OmEmth4fALFcR2bhqDX9da3
         GxW/JsCZ0wooHITM9FWq7WEQFh55Z5GPGZbO+KujZdQfzW/Nat9iHeqlDLak1nMqixVj
         0Jn6uUNIQtI1DlCJ8j3INZgdFgaqVPBhSMZXfD0v+ZEEJWBaClF3wT8slDlfiCprjajX
         gA7FR3EBWyVDG9j32wk6+q2MPu/V8yXpQzQppblcI85OStlJa38EfWaL4FoSYJfjJDMU
         H2uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=lx6WE9o5;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5750a7e53c7sor74708a12.1.2024.05.16.09.11.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 May 2024 09:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=lx6WE9o5;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715875916; x=1716480716; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HBq674saoFEEAoKSou+e+8DdajwlH6jfYyW5XuVaTyg=;
        b=lx6WE9o5fP4Uvc3k9KZKmjRP1JZbWaaeSKvz+x5z04VCIcSfEyE8tx+ztwNO1lN07F
         S7Emhikjz9h5deeNjLY68Qcc3C+TYgvVg02ZWo+elIERAx2RM2ObJTj1/hhv7CpBRW9y
         TTV9Nkpam/w5ls2Mpee7XSMvgRSwkOt4aIPIRlPODQd+R/qWZlS9GkQY9i5TEqK5QcPO
         B9XQnrOX4obNKMEA8qzr+ZDtLfHIXCohitiMRzjMlc6gkM7VTLjpBP5pS198vJDcycr7
         BDiW/bnrMVMiJ5UQmeiH98pAbLJO4YiTO+88A7eaN755+0CP2rY8G5omnR5kddj5CqXY
         ToSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715875916; x=1716480716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBq674saoFEEAoKSou+e+8DdajwlH6jfYyW5XuVaTyg=;
        b=r7tEL3JBBStGkL6XAQzM9EVothmva13Vendf8R3sQzZs4M3J5IWwkmYQnn5CCQSLvp
         dACtFujetiq/uiASnMxJOMO7Hr0n3SbyS6N5MCgJBQNEMf7xtsZThwy0OUrIUMJ0MKll
         UcNgp0/pwl+2lWVpKSKcSF3DX8O2sHHISJHgErkJca3N+TaDpSWjVm7UEE7DUD+OeMYU
         ALjq7MF342z+x7ca8r+NxHLhYNePVC3c2Bcli/Iyou2+JxX0n6ieMqu5uKS1Uxc88ykh
         l21SyqWGWHloke/Pw1bF/UBKsyocEHtITKU4GFS1pzLBhzktrmXzJ8PYtCL2NrOVQEvm
         q4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw/84IXxBiwEsTNzWgsiypCKaCCoK4DB49QqFKhHXB+nSeYPkDh2Kzwz1+lY5t0bCAayMhg0lATand7KeFKWlNzd9UejCa
X-Gm-Message-State: AOJu0YwSw/9Q+ieZLZktGn/DLC+Q3cCwR7bNfG0P8y+q3a77h41hL1qj
	nAv2glydV9t6SBv7zX9qTOJtwD3pftIRTwv/UdbqrUJ35ISqXgkv4zVWwwZlqA==
X-Google-Smtp-Source: AGHT+IHtuWd67aPiImbdrg/fX9Lh1bX41vMJm/NdbdOil7RS0PoeDB/JkP9V5ZwtEkFfw4fL6hus+w==
X-Received: by 2002:a05:600c:c0c:b0:419:fa3c:fb46 with SMTP id 5b1f17b1804b1-4200f8c08eemr11635495e9.5.1715875915527;
        Thu, 16 May 2024 09:11:55 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42018b5e1e8sm138846215e9.5.2024.05.16.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:11:55 -0700 (PDT)
Date: Thu, 16 May 2024 16:11:51 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 07/18] hw/arm/smmuv3: Translate CD and TT using
 stage-2 table
Message-ID: <ZkYwR0JeHGhwLm6c@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-8-smostafa@google.com>
 <b5808f6e-cead-4291-8274-079ad11a922d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5808f6e-cead-4291-8274-079ad11a922d@redhat.com>
X-TUID: KFMMV4Y/dSCS

Hi Eric,

On Wed, May 15, 2024 at 03:15:02PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/29/24 05:23, Mostafa Saleh wrote:
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
> > class, this is useful for:
> s/for/to?
Will do.
> >  - Decide wether a translation is stage-2 only or use the STE config.
> >  - Populate the class in case of faults, WALK_EABT is lefat as it as
> left unchanged?
Yup, that's a typo.
> >    it is always triggered from TT access so no need to use the input
> >    class.
> >
> > In case for stage-2 only translation, which only used in nesting, the
> in case of S2 translation used in the contexted of a nested translation, ...
Will do.
> > stage and asid are saved and restored before and after calling
> > smmu_translate().
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
> > As, there is multiple locations where the address is calculated from
> > cached entry, a new macro is introduced CACHED_ENTRY_TO_ADDR.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3.c              | 76 ++++++++++++++++++++++++++++++------
> >  include/hw/arm/smmu-common.h |  3 ++
> >  2 files changed, 66 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index cc61708160..cc61c82321 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -337,14 +337,33 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
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
> > +        if (status != SMMU_TRANS_SUCCESS) {
> So I guess you rely on event being populated by above CD S2 translate().
> it does not need to be patched, correct?
> May be worth a comment.
Yes, only the class is different, I will add a comment.
> > +            return -EINVAL;
> > +        }
> > +
> > +        addr = CACHED_ENTRY_TO_ADDR(entry, addr);
> > +    }
> > +
> >      /* TODO: guarantee 64-bit single-copy atomicity */
> >      ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
> >                            MEMTXATTRS_UNSPECIFIED);
> > @@ -659,10 +678,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
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
> > @@ -713,9 +735,21 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
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
> > +            if (status != SMMU_TRANS_SUCCESS) {
> same here.
> > +                return -EINVAL;
> > +            }
> > +            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
> > +        }
> > +
> >          tt->had = CD_HAD(cd, i);
> >          trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
> >      }
> > @@ -767,12 +801,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
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
> > @@ -832,13 +866,29 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
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
> > +    if (S2_only) {
> Please add a comment explaining that class value is used to identify
> S2-only forced translation in the context of a nested translation.
> In that case we hackily override the original config to reach our goal
> and then restore the original config.
> That's pretty hacky. Let's see if any other reviewer has a better idea
> ;-) on my end I understand it and I can bear the trick :)
> 
Indeed, this is unclear, I will add a comment.
I thought about this case a lot, I found this to be the least intrusive
way while having tolerable readability, it'd be great if someone has a
better idea.

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
> > @@ -855,7 +905,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> >                  event->type = SMMU_EVT_F_TRANSLATION;
> >                  event->u.f_translation.addr = addr;
> >                  event->u.f_translation.addr2 = ptw_info.addr;
> > -                event->u.f_translation.class = SMMU_CLASS_IN;
> > +                event->u.f_translation.class = class;
> >                  event->u.f_translation.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -864,7 +914,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> >                  event->type = SMMU_EVT_F_ADDR_SIZE;
> >                  event->u.f_addr_size.addr = addr;
> >                  event->u.f_addr_size.addr2 = ptw_info.addr;
> > -                event->u.f_addr_size.class = SMMU_CLASS_IN;
> > +                event->u.f_addr_size.class = class;
> >                  event->u.f_addr_size.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -873,7 +923,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> >                  event->type = SMMU_EVT_F_ACCESS;
> >                  event->u.f_access.addr = addr;
> >                  event->u.f_access.addr2 = ptw_info.addr;
> > -                event->u.f_access.class = SMMU_CLASS_IN;
> > +                event->u.f_access.class = class;
> >                  event->u.f_access.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -882,7 +932,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> >                  event->type = SMMU_EVT_F_PERMISSION;
> >                  event->u.f_permission.addr = addr;
> >                  event->u.f_permission.addr2 = ptw_info.addr;
> > -                event->u.f_permission.class = SMMU_CLASS_IN;
> > +                event->u.f_permission.class = class;
> >                  event->u.f_permission.rnw = flag & 0x1;
> >              }
> >              break;
> > @@ -943,15 +993,15 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >          goto epilogue;
> >      }
> >  
> > -    status = smmuv3_do_translate(s, addr, cfg, &event, flag, &cached_entry);
> > +    status = smmuv3_do_translate(s, addr, cfg, &event, flag,
> > +                                 &cached_entry, SMMU_CLASS_IN);
> >  
> >  epilogue:
> >      qemu_mutex_unlock(&s->mutex);
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
> > index 96eb017e50..09d3b9e734 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -37,6 +37,9 @@
> >  #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
> >                                               VMSA_BIT_LVL(isz, strd, lvl)) - 1)
> >  
> > +#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
> > +                                             ((addr) & (ent)->entry.addr_mask);
> > +
> nit; this could be introduced in a separate patch since you have a
> caller in smmuv3_translate(). This may help the reviewer to focus on the
> most important class related changes.

Sure, I can introduce a small patch before this one with this macro.

Thanks,
Mostafa

> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric
> 
> >  /*
> >   * Page table walk error types
> >   */
> 
