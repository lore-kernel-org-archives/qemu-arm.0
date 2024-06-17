Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp277674ejb;
        Mon, 17 Jun 2024 07:58:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0HI+GTHIZHdtUn+4QGsVUio5liMY6FEQWGLJhItHoCCIm9x7zah1QlWspM+YfMCvcs7wq597W5yDSLbJaLUZNreZh+qlh
X-Received: by 2002:a50:96c3:0:b0:57c:7302:8d2e with SMTP id 4fb4d7f45d1cf-57cbd67edb0mr6719136a12.22.1718636281607;
        Mon, 17 Jun 2024 07:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718636281; cv=none;
        d=google.com; s=arc-20160816;
        b=J1QAVeL5TFnbu1w/kiWNEBW2sBxkiQxT6y23V2o1nGmxM4muo7Ipi46U5STpqWELbw
         dTeIbSwpRCiuim0XY/eCCZhUyC2FSUpN6/HpN+R6f0TU6e+iz4Wilvq7XuPg/ao2351I
         s6OasrntxAgqBE0JoStXQqLBSdwAEHmdgQrpUELSO9Wd93/i8419lEnSkWBp42wcJD4e
         0PJ/4+5QkBTjmF4AZ5Gdv5BxPWpNkU2hGk1s1yYC5BPZbpJvRVJ20rdumAxNFcz9ownW
         ngL5ERMf02sRzjdqh6umnRrL8wr/U+p9DgNIwZOAK81wwjgnrjsTGWRD9uaZVihnGeOm
         0hgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=LClY+ytfGOwlAzSQulAJXPrfM8v3DyO3USmlzR5XHgA=;
        fh=ZMnBWvlcKES9kiycUYN7HQMarFvG5ioK/4BLHRrckaQ=;
        b=XWK/KDv0BrtwHfIt6owbuRtTclc7j9171YxKaNuflkvKIwPz45W58HL2Og0hNXokmb
         AA9XUOxJNKacfHcnW0tL7EbBqtkLBLdnW9CIQBAHvsA9wusMtKHdLlE5ezOvIClsUPCU
         7WQlcmikG3puqdVV6kKXZrVVWN4Y5SyVkoA4kcuzWfRh/nzyk4GLLFLMIj/BODq/uJw+
         Tc6YWI+TmeCr4D1ueO/35vvmMUO0hLlOAbERdx3wyJkz1R/JW2RM1zPurCxZqoxv3LYv
         MDW4KegBQ/rmI/XmGVrObORYLiw5Pj1665qyqYqc/1zaDSrO9ehrqW45tUAtndiNFAco
         YE3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YYoYbDKW;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-57c9516bce3sor602861a12.3.2024.06.17.07.58.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2024 07:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YYoYbDKW;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718636281; x=1719241081; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LClY+ytfGOwlAzSQulAJXPrfM8v3DyO3USmlzR5XHgA=;
        b=YYoYbDKW8ysL0vtIQkxjvO+Po4CLqfw7XYtzxBd/98yFoA4I587oIX6Y47Qs0fSjSl
         fB5Fu/+Z4TqhRZ7G8v399M9cP4eNov0bF9yI3WNg0hMsjh+8LEyMunmXNgjpZaNObAWF
         BySXb0LtnBZZD2LeJE4L4N0SjX0I2SoVh/HlVSMK6aUzwdHKXMGm0wUUnEhOxIcCSA4/
         FfuBJwRBNcJqjRw5VaQz7GKgaq/Uhj9wZOH364Lj1HUyuIQrKz0zmLaE4HmSqUssxM5z
         tNIuSFboLEpCaxLEVNFG+IjpogAQeIahdB4sNXWZqhz2ORX5bLquMVp5QH8JSsfPSi3e
         3nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636281; x=1719241081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LClY+ytfGOwlAzSQulAJXPrfM8v3DyO3USmlzR5XHgA=;
        b=HBFayUf6nUQzo2LCHexRLT7Rp0GOZbYPQ6ueaNZRb0oRWiL0cL16zJXF3nMsXkEYYp
         a34cKihX/JdvdsMVs0LLODlhyhvM3waTSSQR4o4i86AEz3ARviyMI3zGgoxpY1AS4LUe
         lEqnllV2nGlb9Xyn241kCKaarAF0h40LlqcSUKrJlQdvCOZREo0fZLQn1etg+3rHhc+x
         2z4f6bY1oNVkKwyrlg2mrvAeKH191I0Kyj7C8KmyDyVRDmywLfIu7nxd1DifzFvRoia9
         2og4IkgRsmgwVk1IzFw75xwSkkcSS1wWuwUAT4u6fSnrYfQa16PBt4uQVhgaXh0nS6CS
         MoOA==
X-Forwarded-Encrypted: i=1; AJvYcCW+sOTm4EtZW0DsYIsQDsIreYCR+58Bt2TFF9NjF6M2EAISG8c97MwM13lYBKxQ7XVtWibn1AwiUsOTptMv0VhstNzAhEur
X-Gm-Message-State: AOJu0YwCnxLzLAAiDodSPOE0iHTl/3WR3uB0bC37zSp2j9Xy2kcf4swI
	XQQcokuab5xR9WMkZTEbGW4Svz8XrHdmHSl8PUdwnlGNup6/Wh7/WNZsGrY2gw==
X-Google-Smtp-Source: AGHT+IFr8aGbWOuAdX2QRqHLmlfGpPUOen7MKLZczDu+MOZplLrWiCPhaBe26bjjCnTplyz6NZQbAw==
X-Received: by 2002:a05:6402:50d2:b0:57c:cfa9:837b with SMTP id 4fb4d7f45d1cf-57ccfa98704mr201922a12.0.1718636280537;
        Mon, 17 Jun 2024 07:58:00 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f2263sm12184651f8f.83.2024.06.17.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:58:00 -0700 (PDT)
Date: Mon, 17 Jun 2024 14:57:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 10/18] hw/arm/smmu-common: Support nested
 translation
Message-ID: <ZnBO8wuegTVZZBRV@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-11-smostafa@google.com>
 <770312ee-8093-431a-bfdf-b01ca90945cf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <770312ee-8093-431a-bfdf-b01ca90945cf@redhat.com>
X-TUID: 86QdiqslGi5p

Hi Eric,

On Mon, May 20, 2024 at 11:48:18AM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/29/24 05:23, Mostafa Saleh wrote:
> > When nested translation is requested, do the following:
> >
> > - Translate stage-1 IPA using stage-2 to a physical address.
> stage-1 table address IPA into PA through S2 stage
> 
Will do.

> > - Translate stage-1 table walks using stage-2.
> output of S1 stage (IPA) through S2.
Will do.

> > - Combine both to create a single TLB entry using the logic
> >   introduced before.
> this applies to second only. First one is associated with an S2 TLB
> entry, right?
Yes, I will clarify that.

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
> >  hw/arm/smmu-common.c         | 67 ++++++++++++++++++++++++++++++------
> >  include/hw/arm/smmu-common.h |  2 +-
> >  2 files changed, 58 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index c67af3bc6d..d48ec08947 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -306,6 +306,32 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
> >      return NULL;
> >  }
> >  
> > +/* Translate stage-1 table address using stage-2 page table. */
> > +static inline int translate_table_s1(dma_addr_t *table_addr, SMMUTransCfg *cfg,
> > +                                     SMMUPTWEventInfo *info, SMMUState *bs)
> would suggest translate_table_addr_ipa().
Wil do.
> > +{
> > +    dma_addr_t addr = *table_addr;
> > +    SMMUTLBEntry *cached_entry;
> > +    int asid;
> > +
> > +    asid = cfg->asid;
> > +    cfg->stage = SMMU_STAGE_2;
> > +    cfg->asid = -1;
> > +    cached_entry = smmu_translate(bs, cfg, addr, IOMMU_RO, info);
> so this is going to be cached as an S2 entry. Maybe worth adding a comment.

This is part of the IPA space and it is translated using a stage-2 page table,
so it would be cached as an S2, I will add a comment quoting the spec.

Thanks,
Mostafa
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
> > @@ -321,7 +347,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
> >   */
> >  static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> >                            dma_addr_t iova, IOMMUAccessFlags perm,
> > -                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> > +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
> > +                          SMMUState *bs)
> >  {
> >      dma_addr_t baseaddr, indexmask;
> >      SMMUStage stage = cfg->stage;
> > @@ -369,6 +396,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> >                  goto error;
> >              }
> >              baseaddr = get_table_pte_address(pte, granule_sz);
> > +            if (cfg->stage == SMMU_NESTED) {
> > +                if (translate_table_s1(&baseaddr, cfg, info, bs)) {
> > +                    goto error;
> > +                }
> > +            }
> >              level++;
> >              continue;
> >          } else if (is_page_pte(pte, level)) {
> > @@ -551,10 +583,8 @@ error:
> >  }
> >  
> >  /* combine 2 TLB entries and return in tlbe in nested config. */
> > -static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
> > -                                                SMMUTLBEntry *tlbe_s2,
> > -                                                dma_addr_t iova,
> > -                                                SMMUTransCfg *cfg)
> > +static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
> > +                        dma_addr_t iova, SMMUTransCfg *cfg)
> >  {
> >      if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
> >          tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
> > @@ -579,14 +609,19 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
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
> > @@ -600,11 +635,23 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> >              tlbe->entry.perm = IOMMU_NONE;
> >              return -EINVAL;
> >          }
> > -
> spurious line change
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
> > @@ -660,7 +707,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
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
> Thanks
> 
> Eric
> 
