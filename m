Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3120272njb;
        Tue, 9 Jul 2024 00:18:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9YAJEYjzz5UkkN1OjZ1CjUDOrvH9CtDHX0ePY7jA7lTEKaYIUABwzRQo6we4kD4YvSokorg5gZxhugYqttQAyS+SCVhB2
X-Received: by 2002:a2e:9693:0:b0:2ec:eee:f197 with SMTP id 38308e7fff4ca-2eeb30b9a8bmr13711581fa.9.1720509494246;
        Tue, 09 Jul 2024 00:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720509494; cv=none;
        d=google.com; s=arc-20160816;
        b=gkHaNQzbUel71BtjLHfFBIff6vFWhl+HRRdj5MtcTRwrvKfC8/aZptWO6pNnO3fpe9
         9QNyjmgoIAviVhJBSsfkXnmN55Q1vLvtSwGiKZFI6ULzbX+ByEKOeDx8dbs2D/zPFLDn
         rHu4gZeMAfIk5wI+pFaG9g4BI4A7wj4cibHicFTsEfYkg+Id97cvoROzVMXtYonLGy8R
         FMgxWKSOkDXlzreiN7R+zaAiVcjKHcVovgNsfsLHpbXSztVYpGQ3KrLK6dsEDXn0v2pZ
         7Y6zEbCKkhNq74haSoUZ7DHF1T3Nu9uNnlt7ThH+Xd8mgTcxY0nm0UfhEJPmoiithmtw
         3QEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Musi4DnUVQiysf3Si/fZahewrumXdr82z0dzErgcTnM=;
        fh=t0zrkCgi7TozAFX7sa30vUN5CwBcTK8YjyrATD+Sp5g=;
        b=OCJCRo3SEZM2nDxWrZZwnL55ouulrgXOmrRR6atWdMwP1/rw5qkacj2CfW0/1vWlI6
         RtPbQOBBqFWVZDB8xyV23Rs1GDCwiAJHF4ZM9ieenwRGHC8uCg7tH7tEQlYPsE+AW89q
         uOTz/O0MxqJe664jDLNndEzYjwxIKA8gIVRC0cFtBIYKwCtjxQEa61Trrw8TQLt7GP51
         j+uQU5JYIYRiGcuakQaH7bUyru0RC1icgSLhjbKv1iCxBxlkAHG59mx2XXlpqpTNHs2u
         UpRoxO8BFNVUa2FHxpXG68y5il+LBQP2OKJ47w/rFTQv6Kx9sev2YAnnDxIFkfMhz1fG
         hFaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tUfLVJ31;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-426740ef542sor303825e9.11.2024.07.09.00.18.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 00:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tUfLVJ31;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720509494; x=1721114294; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Musi4DnUVQiysf3Si/fZahewrumXdr82z0dzErgcTnM=;
        b=tUfLVJ31qFYSadA23TZuOpA8JBO4Eafnz4dnzNWs6y9i8eXf3e0K0+3YAwZZ0chM/y
         tNNoIQxQ1W12uJa6nwJ40vbcwytt2e4wy9imVVXzZ0zycVeUbHUzsVjS6wmi7AWOo2wm
         Y3wojs0phWl6Tft8zAHIXwxtCK9p6ZsNm8SnRcOi7yPSQw5OyRuh1Vq+qAF0ACSUQPDv
         tSCTLmw1pjWLJOgwKSX9RlywwA3VELQtOktlGJm1FI6VgATX9+IEZZc2e5VRE4NnUhwF
         ycWo6TkwpCKGlQjhSl/1xaNKzmwO7vmrK/OQR4PGiFNKZAcMthfG5duvDqY/7YyaV8VM
         MOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509494; x=1721114294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Musi4DnUVQiysf3Si/fZahewrumXdr82z0dzErgcTnM=;
        b=l2/yPRSWyMnLfxaHO4e5QRvql5itUZyZhkklhT1cE5ek58ARKmWWtA1K3xe5uZAsLd
         P7Iw163JyfgL5wvo3Og+pm8umiXPcl5wj9TsMITwhFce/9ebDE7kzHsjO75w3O8bmoTG
         DWqOW9KOD8iC7PwCcd92gg9WeYU3g+Y2SesqMOsax1y675BITzgYsCCfPmmRK8u+5egy
         tGqNhNrau7dJkqfNmADnTKGfIH8B3N91Ktq3kptfTDXOO7669mZQB5zwbOLE/zaPMCGU
         QlyBL4GgC5+FeQ/HnpZ7CUIPO8u+rUa0DhpjFvvzyH2ooepLdA0ZzXSvfhoUg51me88E
         5HpA==
X-Forwarded-Encrypted: i=1; AJvYcCX9NZLMIO+kDwMCr7C2ujmAAIcArJnSnaPHU1/Gyx6zg+Vh/aCTt6GqkJWsgWYLj704HtG7ax8xAPShDEDEG/4Isxnk7lhq
X-Gm-Message-State: AOJu0YwFAyQEA2F8GSRx8fVHZfzTzethae6iqI6nULDqUhh0PVqoxXUB
	Y36YQ7jh2fTmhEBOfRvjL1W0zLILgoQXI01d3YWgTXUFWR49yyIjvAr7KMZ+QA==
X-Google-Smtp-Source: AGHT+IGp4At/VP2RpsC7Be5pUQN3L8Rl28VlLihB9a4ZAUkZ/jUVIwlwvTTLYSqlz59kJ8ALA2PiEw==
X-Received: by 2002:a05:600c:1d1f:b0:424:898b:522b with SMTP id 5b1f17b1804b1-42673175a65mr945905e9.1.1720509493343;
        Tue, 09 Jul 2024 00:18:13 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f74159csm26491475e9.42.2024.07.09.00.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:18:12 -0700 (PDT)
Date: Tue, 9 Jul 2024 07:18:08 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 11/19] hw/arm/smmu-common: Support nested translation
Message-ID: <ZozkMGIq9VHE3HXS@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-12-smostafa@google.com>
 <86fc9221-f24e-4a7f-8a0d-b19102f981f0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86fc9221-f24e-4a7f-8a0d-b19102f981f0@redhat.com>
X-TUID: FTOCPj/Iqf4V

Hi Eric,

On Mon, Jul 08, 2024 at 05:19:59PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 7/1/24 13:02, Mostafa Saleh wrote:
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
> Nit: in general the SMMUState if the 1st arg, as the most global state.
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
> so I guess also here the recorded address should be the IOVA (Jean's
> previous comment)?

This address maps to FetchAddr and not InputAddr, which is set from the
calling function, so that should be correct. (besides event type as Jean
mentioned it needs be fixed).

Thanks,
Mostafa

> 
> Eric
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
> 
