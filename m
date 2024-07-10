Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp221080njb;
        Wed, 10 Jul 2024 01:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+jV/7I8qL1eB1txq9dOfLj434DePC/KuToWhCEwzAPi3LmvMsmSOprMJGlhWo29yGgMC8jv0Ewh1QSWF+0fPh1pQrqDix
X-Received: by 2002:a05:600c:4850:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-426707f8563mr39865925e9.29.1720600778548;
        Wed, 10 Jul 2024 01:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720600778; cv=none;
        d=google.com; s=arc-20160816;
        b=RFEb0cU5yiE8imfEqfZcaudKNOnsyaO+oyD9kbIsNLVfus2J3lM3GwY+JyB+vbRdxS
         QVR/NKPMlmdkAHd6nl+Ouewg2DieyJs7NewTcYfoyA/Hr7pblaGf4AHnGWAJ/XhBzUVo
         bftw4h29oppblRbINDue3woXLNbZoEB4w0t/TrLPxBg+FyoQc3pfsnNT5GILlKwZG+oH
         jQ4nIyKctKglVkGuwS+KpMbPs5iGqxLl4bYGecZq2qjZ0GZIdAJmHBQanF3Oi+iOowWZ
         /hDFBBhsh84jR/0FkWrjVGYdDI7sDhLxDatH1pUuUZnSd0mAiHyO4lxuciqQ6Lwj+Ef7
         o5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jFmHJfmTGTP47K9khZ7rP9ll6eIMo1T/N9shnRIEclU=;
        fh=FcvqJvfIleKqQUyArAyNlal2RLiMcVwEwGpFtFL37V4=;
        b=xEVGidxGP17xZQ7awDO/Q/GdVOxKET9Q2O7NseNrtIos9VytoDixakdYvR+k5S8s+Z
         JxwUqvm+yW9FHXr+3zkrFrwd2KvVDR+vAg4CkfciSptQBREoYPctslgt1XjbyfZGvMF+
         BIpBrT3fKpC5BMBfX0lC8lac9jMUfqqL+8WFENbDZ36xum+/G6gvqgM9V7K2IoFrQ9wV
         F64wg93XKZIHWet1DtfAIIQhScL4c0pi3ZKQjyo2b7UOeMRc0Rk0N4wF3dy2Y3IFNUl9
         PduV7Dsvx7DeAWScgGpf79khlYHrJQpXuPQ/UGsyLdLiud0AFTqodvid3ZUS6OTMDkPI
         aOXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wTkCrg9M;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-426725e1e1esor1337405e9.4.2024.07.10.01.39.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jul 2024 01:39:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wTkCrg9M;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720600778; x=1721205578; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jFmHJfmTGTP47K9khZ7rP9ll6eIMo1T/N9shnRIEclU=;
        b=wTkCrg9MYjDskV7GSlGDw2hx6gJvV8IRmz7i0aSVLxXr7tujv2cJAWXG6MHOl8NSH4
         yLI+jPKjiBgj8LuBHAcyd2qrg1kcrdjgZOXeO4nvjI5cseWX60EOeguJ4dYSfPqUSl4P
         UpNUJd7f0x2toj45GXcGznao0sXkibOG1K9RTZXHm1nerkqaoGQz7Zmud0xgP0DNV4dI
         uNW3UOXJC2V4eQm8yBf1ovv/lkpZBkPKx6J2C3dZdYJJyhEV9p1rSBfnavsidM5vGThO
         fiPnyhtEM3WwlaEiwCca+KUlCIdtrGU0HLqKNZGaa8LAg1eEVma2kW9tN9sySz7rCOfn
         8xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720600778; x=1721205578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFmHJfmTGTP47K9khZ7rP9ll6eIMo1T/N9shnRIEclU=;
        b=Xo4X2gTe6cAa6CKUDreTRLBxEAsH0CaYV1C7npD+YHMAL4yOYV8TdvfZKZ08kf25Od
         yMFJhvxc8tHrQJug8egMgj6iCTp1BXD/Turk7ZBJnShxfYtwyLXOdZuNQgXj2RFZFRGR
         pL3NpLG7JJ862jZPXoCoMVnHc+KuzOv8iWIJKBbfBK6kFrppmGO+RWQ/JAHL276KD/1n
         ang3tfV3EdWCTAyHnNLZ0mzTMkoMHPIWiGywggD9YaDf++hA3qe9EWg4TF8ANPuOsliR
         G94NGY6qiMn7Z0NpYqcbYbdWBszM06a+d8AqDhhUJNc6P88lhqijdZ/ILF8PWAq7nyXK
         V6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoFDTxDDra+nfxOwjg8qsdF5kh7TJ5d68wXaMmgcMM70bCgwEeyuPe9ah36yywfItrBy63K2iEf7kYRvgLgYvLA2sbNQNv
X-Gm-Message-State: AOJu0YywpayCd4eOozRCoUOyTiCA5354UjNujtaGmXozrccBlaXbxvxc
	Oy1LytCXm5MnBj8/mVkmrTvCyauhI5ea669X+OJzwckkS9qzWHJ/tyjdGK+ETw==
X-Google-Smtp-Source: AGHT+IEONpRIjGxgcWGaMYOktbD16oWQacf+RJ4S6rKqwyV84a86i0izLtqZBdKEdNoUt6XgwCV6+g==
X-Received: by 2002:a05:600c:354e:b0:426:66a0:6df6 with SMTP id 5b1f17b1804b1-427937a580dmr1239115e9.0.1720600777705;
        Wed, 10 Jul 2024 01:39:37 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427270238a6sm39968375e9.20.2024.07.10.01.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:39:37 -0700 (PDT)
Date: Wed, 10 Jul 2024 08:39:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 09/19] hw/arm/smmu-common: Rework TLB lookup for
 nesting
Message-ID: <Zo5Ixb3Li81fZPvQ@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-10-smostafa@google.com>
 <20240704181235.GF1693268@myrica>
 <ZozjS59a4aluqUju@google.com>
 <20240709171345.GC2189727@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709171345.GC2189727@myrica>
X-TUID: vtj6gBJMGnyc

Hi Jean,

On Tue, Jul 09, 2024 at 06:13:45PM +0100, Jean-Philippe Brucker wrote:
> On Tue, Jul 09, 2024 at 07:14:19AM +0000, Mostafa Saleh wrote:
> > Hi Jean,
> > 
> > On Thu, Jul 04, 2024 at 07:12:35PM +0100, Jean-Philippe Brucker wrote:
> > > On Mon, Jul 01, 2024 at 11:02:31AM +0000, Mostafa Saleh wrote:
> > > > In the next patch, combine_tlb() will be added which combines 2 TLB
> > > > entries into one for nested translations, which chooses the granule
> > > > and level from the smallest entry.
> > > > 
> > > > This means that with nested translation, an entry can be cached with
> > > > the granule of stage-2 and not stage-1.
> > > > 
> > > > However, currently, the lookup for an IOVA is done with input stage
> > > > granule, which is stage-1 for nested configuration, which will not
> > > > work with the above logic.
> > > > This patch reworks lookup in that case, so it falls back to stage-2
> > > > granule if no entry is found using stage-1 granule.
> > > 
> > > Why not initialize tt_combined to the minimum granule of stages 1 and 2?
> > > It looks like you introduced it for this. I'm wondering if we lookup the
> > > wrong IOVA if changing the granule size after the address is masked in
> > > smmu_translate()
> > 
> > I am not sure I fully understand, but I don’t think that would work as it is
> > not guaranteed that the minimum granule is the one that would be cached,
> > as we might hit block mappings.
> > 
> > The IOVA at first is masked with the first stage mask for the expected page
> > address, and the lookup logic would mask the address for each level look up,
> > so It should match the alignment of the cached page of that granule and level,
> > and as the combine logic is done with the aligned_addr it is guaranteed by
> > construction that it has to be aligned with stage-1.
> 
> I missed something, this is what I had in mind initially:
> 
> * s1 granule is 64k, s2 granule is 4k
> * the tlb already contains a translations for IOVA 0x30000, tg=4k
> * now we lookup IOVA 0x31000. Masked with the s1 granule, aligned_addr is
>   0x30000. Not found at first because lookup is with tg=64k, but then we
>   call smmu_iotlb_lookup_all_levels() again with the s2 granule and the
>   same IOVA, which returns the wrong translation

If the granules are s1=64k, s2=4k, the only way we get a cached entry as
(IOVA 0x30000, tg=4k) would be for s2 and level-3 as for level-2 it has
to be aligned with 0x200000

So when we look up for 0x31000, there is no entry for it anyway.

But I can see some problems here:
In case also s1 granule is 64k, s2 granule is 4k
- Translation A: 0x31000
- TLB is empty => PTW, entry s1 =  64k 0x30000, s2 = 4k, 0x30000 and
  the cached entry would be 0x30000,tg=4k as the combine logic also
  uses the aligned address
- Translation B: 0x31000 => also misses as the only cached entry
  is 0x30000, 4k

I think this is actually a bug and not just a TLB inefficiency, I need
to think more about it, but my initial thought is not to align the
iova until it’s used by a stage so it can use its granule.

> 
> But it's not actually possible, because if cfg->stage == SMMU_NESTED, then
> in smmu_translate() we end up with
> 
>     } else {
>         /* Stage2. */
>         tt_combined.granule_sz = cfg->s2cfg.granule_sz;
> 
> So I think the condition
> 
> 	(cfg->stage == SMMU_NESTED) && (cfg->s2cfg.granule_sz != tt->granule_sz)
> 
> in this patch is never true?
> 

Ah, that’s a bug, I will fix it, NESTED should use stage-1 granule.

> 
> Then the following scenario:
> 
> * s1 granule is 4k, s2 granule is 64k
> * we lookup IOVA A, miss. The translation gets cached with granule 4k
> * we lookup IOVA A again, but with tt->granule_sz = 64k so we'll
>   never find the entry?
> 
> 
> I guess we want to start the lookup with the smallest granule, and then if
> the s1 and s2 granules differ, retry with the other one. Or with
> SMMU_NESTED, start with the s1 granule and keep this patch to fallback to
> s2 granule, but without masking the IOVA in smmu_translate() (it will be
> masked correctly by smmu_iotlb_lookup_all_levels()).

Thanks for pointing that out, I will think more about it but I sense
that we would need to modify where we align the iova, for translation
and lookup.


Thanks,
Mostafa

> 
> Thanks,
> Jean
> 
> > 
> > Thanks,
> > Mostafa
> > 
> > > 
> > > Thanks,
> > > Jean
> > > 
> > > > 
> > > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > > ---
> > > >  hw/arm/smmu-common.c | 36 ++++++++++++++++++++++++++++++++++--
> > > >  1 file changed, 34 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > > > index 21982621c0..0840b5cffd 100644
> > > > --- a/hw/arm/smmu-common.c
> > > > +++ b/hw/arm/smmu-common.c
> > > > @@ -66,8 +66,10 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
> > > >      return key;
> > > >  }
> > > >  
> > > > -SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > > > -                                SMMUTransTableInfo *tt, hwaddr iova)
> > > > +static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
> > > > +                                                  SMMUTransCfg *cfg,
> > > > +                                                  SMMUTransTableInfo *tt,
> > > > +                                                  hwaddr iova)
> > > >  {
> > > >      uint8_t tg = (tt->granule_sz - 10) / 2;
> > > >      uint8_t inputsize = 64 - tt->tsz;
> > > > @@ -88,6 +90,36 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > > >          }
> > > >          level++;
> > > >      }
> > > > +    return entry;
> > > > +}
> > > > +
> > > > +/**
> > > > + * smmu_iotlb_lookup - Look up for a TLB entry.
> > > > + * @bs: SMMU state which includes the TLB instance
> > > > + * @cfg: Configuration of the translation
> > > > + * @tt: Translation table info (granule and tsz)
> > > > + * @iova: IOVA address to lookup
> > > > + *
> > > > + * returns a valid entry on success, otherwise NULL.
> > > > + * In case of nested translation, tt can be updated to include
> > > > + * the granule of the found entry as it might different from
> > > > + * the IOVA granule.
> > > > + */
> > > > +SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > > > +                                SMMUTransTableInfo *tt, hwaddr iova)
> > > > +{
> > > > +    SMMUTLBEntry *entry = NULL;
> > > > +
> > > > +    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> > > > +    /*
> > > > +     * For nested translation also try the s2 granule, as the TLB will insert
> > > > +     * it if the size of s2 tlb entry was smaller.
> > > > +     */
> > > > +    if (!entry && (cfg->stage == SMMU_NESTED) &&
> > > > +        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
> > > > +        tt->granule_sz = cfg->s2cfg.granule_sz;
> > > > +        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> > > > +    }
> > > >  
> > > >      if (entry) {
> > > >          cfg->iotlb_hits++;
> > > > -- 
> > > > 2.45.2.803.g4e1b14247a-goog
> > > > 
