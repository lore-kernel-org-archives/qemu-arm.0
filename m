Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1443556ejl;
        Thu, 16 May 2024 08:20:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX45PfKVAqyLTeJO+Iah8UGgctGcT1BkV3F+z1EvqJPjkLe4zy0NHDc8OfrVcaGFX8pAiuKRuWgvp8veoV8myFMeXThF5Jk
X-Received: by 2002:a05:600c:3b86:b0:41c:2313:da8d with SMTP id 5b1f17b1804b1-41fea539615mr188220855e9.0.1715872850861;
        Thu, 16 May 2024 08:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715872850; cv=none;
        d=google.com; s=arc-20160816;
        b=wyCVweWgxt1tLdqy+pUDRt7UvtN+dMqTOZ/6FIpv1znWv784HTaKu/YaB1AEAf1G6E
         c0m7utNiJ86RY84z+lZMpj/V+XAZ1k5tq1uwz83N6cpqUFm9fDYo26p3hWZqukEpWVP6
         CMEeEMe/NZJ9ICpziSLBPXrBJ5pqwukbeAvAvKI++va4C/tr1hHnyssCoUwpp/IXcVe5
         6nKRKiKasCrhdm426Lp3VyurUoPItk/EIsINkf+ZzDBBtkFCOVZ+SFrzG2KhEpLIUaad
         nxVooswDpu1ji/irQf85pjAuvE02xQSuzPiH3B0avxeAqK4ED8ruAEFVZR81mXt2HGLX
         AxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=rKBkDfuu4ovIlFS5i9OYlDEjCa+HYlUUd2BNYILbC1I=;
        fh=fsGKiDiMsgj+BlCKUsVbbgLFISXUGCNN2bDMNMNhm0E=;
        b=D92Dgke7JEwaNylDf6sHMzitPBujeYa0TYtP75yon4ZQPwKFthkDaOAmC27BbCJwaV
         XSDlyy5YPd09ni51fohtO+cEwnvT+e3zC2nStKfc4eOP6sY951K8P+oprNQDIpRf6XFz
         QvI/jNY7SEJttRRfD61Roe5x/C3Q2Gsljdn0H9Y8ZRgT4WdZY+E/DTLbEO5TOx8HKUCv
         EbnqgSv6rjL0+LvTQmNA6WdoJ4A+4mChT6BL5XaKJkZd5ca0BOGb/cQ9fany2Jf939Cx
         pZagjScqu2XS9ChK5KLkSgFGP2Bh9+oCg/2KClS0mHw2PFRbzIUYJr3kiXAFLF4sqEiT
         8p2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=20xvfMTq;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-41fc2f7fbf2sor6118845e9.7.2024.05.16.08.20.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 May 2024 08:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=20xvfMTq;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715872850; x=1716477650; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKBkDfuu4ovIlFS5i9OYlDEjCa+HYlUUd2BNYILbC1I=;
        b=20xvfMTqWNNANo/rvxgRrbdp/D7kyODUP7ZEXGo235YhNDHt5oY4GdCmIHt5FIZuFE
         OoCYmu3lg55xVIEPe81/6sggNPkaEkqmTxDApSBQc480nDPXc/ZapClnsRkvUFku3ihO
         4EXB02KjLLo01H7cgHtkG38hhNRMAheVAGQd7jCRQApMOOZ9McInluRQGar3OLIiI+BO
         XYGE8xgxQSoAOmXbLVDO7UD2wg/vgSLFaS/6bvpB7I6uUC/DKRfkYAyHrOfJW8eBQ2Sv
         Be2hd2nSYy4CncnMNGcX9elh5CvvaHmRAvIlB2rk4wPvQQjD5yQG1/0rlslWOP05awTT
         ETPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872850; x=1716477650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKBkDfuu4ovIlFS5i9OYlDEjCa+HYlUUd2BNYILbC1I=;
        b=seiM0D+Elf8AUqnio5extyRmOMzYcv3q63wYIC7bysrToR+uM059w8N3WaiWWOb7/c
         FBAbtQwYkMXJcvVLQkKNAYaf6FCpDvhbHhMvo/TT3O9Bi0IxQy6So3oKsb/jmL2WQTUO
         QC4oRzMcxeU1ruXYXRkQud2LcHpbgM24Pt2HdCTkwNPfnkZn7ZoMqqDDt8k9lZRGIbTm
         z0dxmFy5fG+OBuSGs8wTjV/nM9i0J2mGZNCJ5Awz33sft+SgEKPEbyueAhO7bZ8928vP
         +QYpiZdB/hcb3sMd9HzFYjoVtG/0AfVunTeAUQXLMm1YgK+55CZ59VNywT/q9dxYfVnA
         2n5w==
X-Forwarded-Encrypted: i=1; AJvYcCUVCw1HDpHcnaoBo0wE1zZWgHuEIyJVAzZnI34mFi9tGvg/3xwsODqHaLl/E8eEGw7CyWQwihh9umsncDODOeZ89MxxB6q5
X-Gm-Message-State: AOJu0YxeuoWN4Ej/LTYH6OlsQf0KJcjt4UyyCcj3KGmV07h2OxEG+KUL
	YhOTbg/dbMdLSHUMu6SwB3vQNpmL2oe/WJZTmbvpR90Gf9UtTwEs3WX36npPeg==
X-Google-Smtp-Source: AGHT+IFgMAeYxnuW2uFNhhf9/gQCKbo+IFo2Sh8OwOx+8HLGqZeVaM874LWFf5HJC24SZz1TR2oTCA==
X-Received: by 2002:a05:600c:3d0c:b0:41c:ab7:f9af with SMTP id 5b1f17b1804b1-4200f8ac9c8mr11310135e9.3.1715872850174;
        Thu, 16 May 2024 08:20:50 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79be1dsm19430571f8f.10.2024.05.16.08.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:20:49 -0700 (PDT)
Date: Thu, 16 May 2024 15:20:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 08/18] hw/arm/smmu-common: Add support for nested
 TLB
Message-ID: <ZkYkTgDztEyX6GT_@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-9-smostafa@google.com>
 <dc8d52ac-68af-4426-9a60-07ad909c86b0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc8d52ac-68af-4426-9a60-07ad909c86b0@redhat.com>
X-TUID: yp3SmePpwOaL

Hi Eric,

On Wed, May 15, 2024 at 03:48:05PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/29/24 05:23, Mostafa Saleh wrote:
> > This patch adds support for nested(combined) TLB entries.
> space between nested and (.
Will do.
> > The main function combine_tlb() is not used here but in the next
> > patches, but to simplify the patches it is introduced first.
> >
> > Main changes:
> > 1) New entry added in the TLB, parent_perm, for nested TLB, holds the
> s/entry/field, s/TLB/SMMUTLBEntry struct
Will do.
> >    stage-2 permission, this can be used to know the origin of a
> >    permission fault from a cached entry as caching the “and” of the
> >    permissions loses this information.
> >
> >    SMMUPTWEventInfo is used to hold information about PTW faults so
> >    the event can be populated, the value of stage (which maps to S2
> >    in the event) used to be set based on the current stage for TLB
> I don't understand "(which maps to S2 in the event)". What do you mean?
> This could be S1 or S2 depending on the active stage, no?

Not really, if the IPA size is larger than S2 input size, this is
considered stage-1 fault.

For TLB permission fault, yes, that is how it is decided.
However, with nesting, a permission fault from a cached entry can be
from a stage-1 or stage-2, that’s why we now cache both and not just
the combined permission, and the logic to set fault stage is modified
accordingly.

> >    permission faults, however with the parent_perm, it is now set
> >    based on which perm has the missing permission
> >
> >    When nesting is not enabled it has the same value as perm which
> >    doesn't change the logic.
> >
> > 2) As combined TLB implementation is used, the combination logic
> >    chooses:
> >    - tg and level from the entry which has the smallest addr_mask.
> tbh I am scared bout swapping s1/s2 tg and level. In smmu_iotlb_lookup()
> I see tt->granule_sz being used which is s1 data. I mean it is not
> obvious to me this is correct. Could you maybe give more explanations
> detailing why/how this is guaranted to work.

As you mentioned the next patch reworks the lookup logic, I can reorder
the 2 patches if that is better, please let me know what you think?

> 
> Can you give additional details about what s1+s2 combinations were tested?

I tested with S1 and S2 4K pages
S1 level = 3 and S2 level = 3
S1 level = 2 and S2 level = 3
S1 level = 3 and S2 level = 2
S1 level = 1 and S2 level = 2

And also tested with with S1 64K granule and S2 4K.

> >    - Based on that the iova that would be cached is recalculated.
> >    - Translated_addr is chosen from stage-2.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c         | 32 ++++++++++++++++++++++++++++----
> >  include/hw/arm/smmu-common.h |  1 +
> >  2 files changed, 29 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 21982621c0..0d6945fa54 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -394,7 +394,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> >          tlbe->entry.translated_addr = gpa;
> >          tlbe->entry.iova = iova & ~mask;
> >          tlbe->entry.addr_mask = mask;
> > -        tlbe->entry.perm = PTE_AP_TO_PERM(ap);
> > +        tlbe->parent_perm = tlbe->entry.perm = PTE_AP_TO_PERM(ap);
> nit: I would prefer on separate lines.
Will do.

> >          tlbe->level = level;
> >          tlbe->granule = granule_sz;
> >          return 0;
> > @@ -515,7 +515,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> >          tlbe->entry.translated_addr = gpa;
> >          tlbe->entry.iova = ipa & ~mask;
> >          tlbe->entry.addr_mask = mask;
> > -        tlbe->entry.perm = s2ap;
> > +        tlbe->parent_perm = tlbe->entry.perm = s2ap;
> >          tlbe->level = level;
> >          tlbe->granule = granule_sz;
> >          return 0;
> > @@ -530,6 +530,27 @@ error:
> >      return -EINVAL;
> >  }
> >  
> > +/* combine 2 TLB entries and return in tlbe in nested config. */
> suggestion: combine S1 and S2 TLB entries into a single entry. As a
> result the S1 entry is overriden with combined data.
Will do.

> > +static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
> > +                                                SMMUTLBEntry *tlbe_s2,
> > +                                                dma_addr_t iova,
> > +                                                SMMUTransCfg *cfg)
> > +{
> > +    if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
> > +        tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
> > +        tlbe->granule = tlbe_s2->granule;
> > +        tlbe->level = tlbe_s2->level;
> > +    }
> > +
> > +    tlbe->entry.translated_addr = CACHED_ENTRY_TO_ADDR(tlbe_s2,
> > +                                    tlbe->entry.translated_addr);
> > +
> > +    tlbe->entry.iova = iova & ~tlbe->entry.addr_mask;
> > +    /* parent_perm has s2 perm while perm has s1 perm. */
> 
>  suggestion: while perm keeps s1 perm.
> 
Will do.

Thanks,
Mostafa
> > +    tlbe->parent_perm = tlbe_s2->entry.perm;
> > +    return;
> > +}
> > +
> >  /**
> >   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
> >   *
> > @@ -607,9 +628,12 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> >  
> >      cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
> >      if (cached_entry) {
> > -        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
> > +        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm &
> > +            cached_entry->parent_perm & IOMMU_WO)) {
> >              info->type = SMMU_PTW_ERR_PERMISSION;
> > -            info->stage = cfg->stage;
> > +            info->stage = !(cached_entry->entry.perm & IOMMU_WO) ?
> > +                          SMMU_STAGE_1 :
> > +                          SMMU_STAGE_2;
> >              return NULL;
> >          }
> >          return cached_entry;
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index 09d3b9e734..1db566d451 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -77,6 +77,7 @@ typedef struct SMMUTLBEntry {
> >      IOMMUTLBEntry entry;
> >      uint8_t level;
> >      uint8_t granule;
> > +    IOMMUAccessFlags parent_perm;
> >  } SMMUTLBEntry;
> >  
> >  /* Stage-2 configuration. */
> Thanks
> 
> Eric
> 
