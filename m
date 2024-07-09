Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3119385njb;
        Tue, 9 Jul 2024 00:15:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFDZB7W/ifxKSJA0KufmgqkeC0y5YQ3YaiYqMsLIgHkiDZdaKt3nz1hr+E7JfnaGvxQ8tnIzg8jT56dOr0CsD7uNq30Tct
X-Received: by 2002:a05:600c:4baa:b0:426:5e1c:1ac2 with SMTP id 5b1f17b1804b1-426706c656bmr14476365e9.8.1720509343135;
        Tue, 09 Jul 2024 00:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720509343; cv=none;
        d=google.com; s=arc-20160816;
        b=eCvU0lYVLXk6Xa/Ayt1VSuUfcn2ZfDN26I1yycSViq5p+jBLVq2vgjaX6A91Q8Sxby
         i8RXsZ48lKUF+omoR6gsUv8PL2vOm5EdRYPihAUfv8J2DzMTl8PBzam7px1sUT8fpkoN
         FxPe23pPMdPDntzw/y42Fl+fXhuBbM6Sp0KVdZmM4o1KGXQ1o0ET5iUWz27yqU3bpLtw
         4cKCzZRV8ZnXCMvwtauI62o1NqMkf09nlB0fZ/DTwcsWC0/7G6Rw4bUvsO7LaiVHCFLv
         sgOOUXQn9c9MilNEngiDvaq6hbF7r/esXpCIRw7SGT2x8I07FHPHcWN3cF3SMWFNi4IJ
         i+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ceKsXZzQxORr8UWHBarU6dV06z8zBsqvjsSzDv+Qvk4=;
        fh=zcG2nuVVHqEN9/bsmul6gbe6dmtymTFP4+MjZAOg+84=;
        b=jMa4ulnjaD1VqAFcmt4ZnI+S3CoMttTCAmFscy68o3QHJuRsf7kCNwwxLxFxGHfwFk
         hFAo8iQ6KTL0EKjesrHYuybS9T2v8538kslSsgjh2e0h6Na4rOS+MdNV2aKTaFYej8K+
         k9Ad7AdZsgS3JOpluSJmdPNlD9+wmfxWoEb2OYiMG/YBh1oIwz+gssw7BEdSXSm9uTOW
         SueqU0UApGxu5Ct2z3hI3FRxx9ZRJAl8s8jyJKFNwnxeDkwKpQbfbvtw9bCM89GW74rt
         kPP07aqtqENidtr/zQw7+cSc++F+Jpnw62BxR32dZcBSL03CghDOr5u9v/enLGVqJCuQ
         8hNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=LqcTE2qA;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-426725e9775sor429115e9.2.2024.07.09.00.15.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 00:15:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=LqcTE2qA;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720509342; x=1721114142; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ceKsXZzQxORr8UWHBarU6dV06z8zBsqvjsSzDv+Qvk4=;
        b=LqcTE2qAokX5BUtFaQ/UjzVy3eXsjpL3G1dvjyS8aRJfT1R8GGKNpUBpSziOakXLXP
         BQgdtKQZ5Y6qWgBfUfEw+rC4Za3nElkABFbLj64PNSGK61STiMiZxsNeR6pIURLGBaCT
         VXho6ApT39/h4x1YCcfkPlBFZAKcmknZXNBTYwvIE+y45rMGcb2uU2QHdJwOLeDWn7JS
         UVUZ9gt7fCqp3qCI28MHVyO4JjRf2iiigmQC3r4GcKWKVtbj1tz2jjHyMClpbgYs0kWe
         T/JhzWXwwuaXZvr0BtvbWJhFOtj5BYPpJaSNzIhwGDZqcHl1i4Xia9gr2QEGvUbmERoN
         Fqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509342; x=1721114142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceKsXZzQxORr8UWHBarU6dV06z8zBsqvjsSzDv+Qvk4=;
        b=mYWB/nl5ZIsEalTBhyOsVisZ1yLT46QzqVFOm7GHEsbSlohTB0XM/tP5/g3ZoK2HPY
         a+Eem4BxsG+VccofV1x4kQNn+lK7rIw7r6CoNpJznOuLoacFJc87H44cT4Y2XDylDT2X
         3oy4OpUiX30QWmNePeN6xVWPiKZ55XnU5XpD1J310aSV7oXAYd2YSBnzRjqr9Ys9cyxZ
         +4GU+1PZdmT3GJoFf9bX/VGF00JoMRpbtza9Ro0jqzn9kcLAZmjCDxsT3f1+iOIIDorc
         zx0NC5NNHeNNM3tHHX2Cba+MvaLzpB0CRrOESGImFG2o5Vys8x4jdLy0nPCBidBlqgf/
         H6zw==
X-Forwarded-Encrypted: i=1; AJvYcCUEXEkxr0j+CDCyPGdNDjLUoAuObHxR8EOEZSaXAAnrkcNIAzb59tUECwfivqCOYshXDhiLA2SlrwnetncVMu1Y9YBPucbl
X-Gm-Message-State: AOJu0YxdUsP6dk2+aBSyQuKYOEiuEZe+mRdYE7XtyUmIKvk2GvrbsxE1
	Up26CJv8pDVQlxTPPfO9oGFTWhhm1OzQjFyEFdgZ7RJnIdPFCIqvI0W7I/2yyg==
X-Google-Smtp-Source: AGHT+IG3DMnFJjtxqkCBLCVbSVQFXZsMDyPt+vTKtslQwi5FyD2Km3SczSl5xVdz+eD5SuNGtxPNWQ==
X-Received: by 2002:a05:600c:1d1f:b0:41a:444b:e1d9 with SMTP id 5b1f17b1804b1-42671c0a692mr1287645e9.4.1720509342294;
        Tue, 09 Jul 2024 00:15:42 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7416dbsm26508955e9.39.2024.07.09.00.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:15:41 -0700 (PDT)
Date: Tue, 9 Jul 2024 07:15:37 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 11/19] hw/arm/smmu-common: Support nested translation
Message-ID: <ZozjmZ1ZodrUBT5s@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-12-smostafa@google.com>
 <20240704183110.GH1693268@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704183110.GH1693268@myrica>
X-TUID: 04ZZ8G/MKJ9n

Hi Jean,

On Thu, Jul 04, 2024 at 07:31:10PM +0100, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:33AM +0000, Mostafa Saleh wrote:
> > When nested translation is requested, do the following:
> > 
> > - Translate stage-1 table address IPA into PA through stage-2.
> > - Translate stage-1 table walk output (IPA) through stage-2.
> > - Create a single TLB entry from stage-1 and stage-2 translations
> >   using logic introduced before.
> > 
> > For stage-1 table translation, the spec (ARM IHI 0070 F.b) says in:
> >     7.3.12 F_WALK_EABT:
> >         Translation of an IPA for Stage 1 descriptor fetch:
> > 	S2 == 1 (stage 2), CLASS == T
> > So, F_WALK_EABT is used which propagtes to CLASS == TT.
> 
> I don't think the text applies to this case, the context is:
> 
> 	A stage 2 table walk can encounter EABT accessing the physical
> 	address of a stage 2 descriptor, because of a:
> 	[...]
> 	* Translation of an IPA for Stage 1 descriptor fetch
> 
> So EABT is when failing to load the stage 2 descriptor. I can't find
> exact text for this case but looking at the flowchart 15.5, I think
> this should be F_TRANSLATION/F_ADDR_SIZE/F_PERMISSION/F_ACCESS with
> CLASS=TT and S2.

I see, thanks for clarifying, I guess that would be another argument that
we propagate more info in SMMUPTWEventInfo so we can set the fault CLASS.

Thanks,
Mostafa

> 
> Thanks,
> Jean
> 
> > 
> > smmu_ptw() has a new argument SMMUState which include the TLB as
> > stage-1 table address can be cached in there.
> > 
> > Also in smmu_ptw() a separate path used for nesting to simplify the
> > code, although some logic can be combined.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c         | 72 +++++++++++++++++++++++++++++++-----
> >  include/hw/arm/smmu-common.h |  2 +-
> >  2 files changed, 64 insertions(+), 10 deletions(-)
> > 
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 24b7d09e2b..71afd486ba 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -318,6 +318,38 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
> >      return NULL;
> >  }
> >  
> > +/* Translate stage-1 table address using stage-2 page table. */
> > +static inline int translate_table_addr_ipa(dma_addr_t *table_addr,
> > +                                           SMMUTransCfg *cfg,
> > +                                           SMMUPTWEventInfo *info,
> > +                                           SMMUState *bs)
> > +{
> > +    dma_addr_t addr = *table_addr;
> > +    SMMUTLBEntry *cached_entry;
> > +    int asid;
> > +
> > +    /*
> > +     * The translation table walks performed from TTB0 or TTB1 are always
> > +     * performed in IPA space if stage 2 translations are enabled.
> > +     */
> > +    asid = cfg->asid;
> > +    cfg->stage = SMMU_STAGE_2;
> > +    cfg->asid = -1;
> > +    cached_entry = smmu_translate(bs, cfg, addr, IOMMU_RO, info);
> > +    cfg->asid = asid;
> > +    cfg->stage = SMMU_NESTED;
> > +
> > +    if (cached_entry) {
> > +        *table_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
> > +        return 0;
> > +    }
> > +
> > +    info->stage = SMMU_STAGE_2;
> > +    info->type = SMMU_PTW_ERR_WALK_EABT;
> > +    info->addr = addr;
> > +    return -EINVAL;
> > +}
> > +
> >  /**
> >   * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
> >   * @cfg: translation config
> > @@ -333,7 +365,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
> >   */
> >  static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> >                            dma_addr_t iova, IOMMUAccessFlags perm,
> > -                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> > +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
> > +                          SMMUState *bs)
> >  {
> >      dma_addr_t baseaddr, indexmask;
> >      SMMUStage stage = cfg->stage;
> > @@ -381,6 +414,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> >                  goto error;
> >              }
> >              baseaddr = get_table_pte_address(pte, granule_sz);
> > +            if (cfg->stage == SMMU_NESTED) {
> > +                if (translate_table_addr_ipa(&baseaddr, cfg, info, bs)) {
> > +                    goto error;
> > +                }
> > +            }
> >              level++;
> >              continue;
> >          } else if (is_page_pte(pte, level)) {
> > @@ -568,10 +606,8 @@ error:
> >   * combine S1 and S2 TLB entries into a single entry.
> >   * As a result the S1 entry is overriden with combined data.
> >   */
> > -static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
> > -                                                SMMUTLBEntry *tlbe_s2,
> > -                                                dma_addr_t iova,
> > -                                                SMMUTransCfg *cfg)
> > +static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
> > +                        dma_addr_t iova, SMMUTransCfg *cfg)
> >  {
> >      if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
> >          tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
> > @@ -596,14 +632,19 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
> >   * @perm: tentative access type
> >   * @tlbe: returned entry
> >   * @info: ptw event handle
> > + * @bs: smmu state which includes TLB instance
> >   *
> >   * return 0 on success
> >   */
> >  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> > -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> > +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs)
> >  {
> > +    int ret;
> > +    SMMUTLBEntry tlbe_s2;
> > +    dma_addr_t ipa;
> > +
> >      if (cfg->stage == SMMU_STAGE_1) {
> > -        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> > +        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
> >      } else if (cfg->stage == SMMU_STAGE_2) {
> >          /*
> >           * If bypassing stage 1(or unimplemented), the input address is passed
> > @@ -621,7 +662,20 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> >          return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
> >      }
> >  
> > -    g_assert_not_reached();
> > +    /* SMMU_NESTED. */
> > +    ret = smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    ipa = CACHED_ENTRY_TO_ADDR(tlbe, iova);
> > +    ret = smmu_ptw_64_s2(cfg, ipa, perm, &tlbe_s2, info);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    combine_tlb(tlbe, &tlbe_s2, iova, cfg);
> > +    return 0;
> >  }
> >  
> >  SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> > @@ -677,7 +731,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> >      }
> >  
> >      cached_entry = g_new0(SMMUTLBEntry, 1);
> > -    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info);
> > +    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info, bs);
> >      if (status) {
> >              g_free(cached_entry);
> >              return NULL;
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index 1db566d451..cf0fd3ec74 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -185,7 +185,7 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
> >   * pair, according to @cfg translation config
> >   */
> >  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> > -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
> > +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs);
> >  
> >  
> >  /*
> > -- 
> > 2.45.2.803.g4e1b14247a-goog
> > 
