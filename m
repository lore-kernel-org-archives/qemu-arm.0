Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3118914njb;
        Tue, 9 Jul 2024 00:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHVxCkKmf7y8yc2pjP27N8J93QAhqOo/L8uKV8TBsjehsplJVqUyrT6TlsL4NlXcfogPKFGslBjn/GqR/AgLfMDkrRGyQS
X-Received: by 2002:a05:6512:239b:b0:52b:79d6:5c28 with SMTP id 2adb3069b0e04-52eb99cc619mr1113624e87.52.1720509264570;
        Tue, 09 Jul 2024 00:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720509264; cv=none;
        d=google.com; s=arc-20160816;
        b=MiXew3yHjXZF+7AW3MElQp6e/CRdY2tGNy6hHWIrNrBO1ybpX5e+qAmC+H/cEH/uLe
         DCQIEP2GH0ynVe8n7hIEjsYOcpKburVY9tIsHg6n4GdHeifEDw+obRFaIqHKaDzUgk22
         GKC6KelPetiS00GfPnPbmAdanO8qYPtihHQnoi0WiSHiVsEjJl4gekUPbzvBf+p9rjmW
         YQ6VcHkQZnJyI1hw0Zr+okdkVJ0EX4+SU1qm7W6Tj6Y1DUr52wC08ICXccfzGgHa353N
         RezKwnPdNr0JmKAqbiX/GQuz7FBmJRjnP5Tt3YiRq1zWu8/93dyeSkvJ5g6Emf7Kv1ER
         NJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=3sKwju1f78C/prHBclW/s70RYAmRYQ/oOkEShhP5EGg=;
        fh=DANjHO2m7872gRBQzDVej54hA0xyAQKHwOp8aBHuvfE=;
        b=ZurB+tTwADZfVPjcFVaxgBbMOeT/6dH9Oo2HoQKltPy1dBr5z0fKYolRVAKKXh0X1D
         H0xrz9gDUWCABBq5ndpdGXpARJhlESyi6xLbEIeTPiIvABpUKy7SR6RGbQjDMNO10fKP
         YfG71H4ThOngCKeFY4S0flMSJgW5sJWswi6+3PJlhfz8zvoTP/oZ2k7uc80+/GSD5Ef2
         N3XdNLUTCX6K1EB+mhkLqtLfNIHU43x7zH9157y/ITtLnsFa0jTwweWaMMqn2xFtyliB
         6PAD/GjkyqG+gqx1w06B46j6scf+JSV1b4jh2+s6qpDqVvW/xG3KsW49TmmWZmbNz0BI
         H1yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=VoAttxVw;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42673ee89absor302055e9.3.2024.07.09.00.14.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 00:14:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=VoAttxVw;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720509264; x=1721114064; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3sKwju1f78C/prHBclW/s70RYAmRYQ/oOkEShhP5EGg=;
        b=VoAttxVwM1YRPoyyFehwElKS9bDGAUZeed8GpX9lZRV/shhbo4ct2IjpveXOrHN0e8
         2e/AbETbwCHv7YMIHZDuFRGnralO7CApQJX0giahfNPGW06eSTJpAZViUSFaRyEEFud6
         UKCtAizgP3cyLXJa71F2S7ufPVEr8oq53UTsSPi07XIitegHacJaucew3w1QUcRgYBnu
         3RBprjTV3DGpYkvhQWN1tT5aO1MgsH/kfAj+THe6b2dHHzk5JyJk+W2Qz3oSTSchTf0K
         LJfsonnfiv91EwXuUpn++gPO6rVzdjUWfjeobltJuYM1n5FIJ4KSrV5Z5UAx7emAdopy
         d/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509264; x=1721114064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3sKwju1f78C/prHBclW/s70RYAmRYQ/oOkEShhP5EGg=;
        b=JrrbZxYJaz4aY5nNNC76/E5u7rr6LNRU2sjKUD4Itq+hsrvjEhTflwU8NcIyB5Xbzv
         apb0e2RyBXDhGadnfYmpR89l4qft8b6sJWey9gGg8Z5J+Ea7sWyT+IlXt5Gohfwmw3y9
         4TLI24g4auoMfqbysS6PVla3FoXusxDS5e8xUklkTVDcW4N0K3syvnwdcc5PaNJXFeYE
         cXTk5jThSecGDPJSOIyJ1rs0CmYd30F7FrXwnJjShjQ4OcNkAAU6Cxow1oXuGnZUAMuQ
         qHCVEVdtCFdJtA4A2QMwjcMBf61fKlxwljMiNgEXvOOsSD0jExsKx7zwQWg1zqSgN8C0
         7jlg==
X-Forwarded-Encrypted: i=1; AJvYcCULkv7Az01LptDOSz9rNEKGYPhKRvbZ752WwlaLG1z5po1x5A0ibquUdTe9qsdMyehTSPiUC64fGHKkID4Xwnyq//4xbmxZ
X-Gm-Message-State: AOJu0Yw2dpMD6TWVfG+Tvx17K9I/TfoILHNoE6cJ6PrR6+jaP/UmGJG3
	UgMZ4H/lsg2WeX3UQxLh7YB+9jPgbD0ZdjJopU50JhFHYdWeaDi2h7B+KNNUAA==
X-Google-Smtp-Source: AGHT+IFfdxc5fJP0OkW3IExzFHyKme2aWPFwVXaZ4SvkPW5D7CXlOhtgNDzkUXrpoZD89+M9efdieQ==
X-Received: by 2002:a05:600c:3b16:b0:426:5ef2:cd97 with SMTP id 5b1f17b1804b1-42671a88f7dmr1428805e9.2.1720509263754;
        Tue, 09 Jul 2024 00:14:23 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab0b4sm1643325f8f.90.2024.07.09.00.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:14:23 -0700 (PDT)
Date: Tue, 9 Jul 2024 07:14:19 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 09/19] hw/arm/smmu-common: Rework TLB lookup for
 nesting
Message-ID: <ZozjS59a4aluqUju@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-10-smostafa@google.com>
 <20240704181235.GF1693268@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704181235.GF1693268@myrica>
X-TUID: Y3muc6aldjdl

Hi Jean,

On Thu, Jul 04, 2024 at 07:12:35PM +0100, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:31AM +0000, Mostafa Saleh wrote:
> > In the next patch, combine_tlb() will be added which combines 2 TLB
> > entries into one for nested translations, which chooses the granule
> > and level from the smallest entry.
> > 
> > This means that with nested translation, an entry can be cached with
> > the granule of stage-2 and not stage-1.
> > 
> > However, currently, the lookup for an IOVA is done with input stage
> > granule, which is stage-1 for nested configuration, which will not
> > work with the above logic.
> > This patch reworks lookup in that case, so it falls back to stage-2
> > granule if no entry is found using stage-1 granule.
> 
> Why not initialize tt_combined to the minimum granule of stages 1 and 2?
> It looks like you introduced it for this. I'm wondering if we lookup the
> wrong IOVA if changing the granule size after the address is masked in
> smmu_translate()

I am not sure I fully understand, but I don’t think that would work as it is
not guaranteed that the minimum granule is the one that would be cached,
as we might hit block mappings.

The IOVA at first is masked with the first stage mask for the expected page
address, and the lookup logic would mask the address for each level look up,
so It should match the alignment of the cached page of that granule and level,
and as the combine logic is done with the aligned_addr it is guaranteed by
construction that it has to be aligned with stage-1.

Thanks,
Mostafa

> 
> Thanks,
> Jean
> 
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c | 36 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 21982621c0..0840b5cffd 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -66,8 +66,10 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
> >      return key;
> >  }
> >  
> > -SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > -                                SMMUTransTableInfo *tt, hwaddr iova)
> > +static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
> > +                                                  SMMUTransCfg *cfg,
> > +                                                  SMMUTransTableInfo *tt,
> > +                                                  hwaddr iova)
> >  {
> >      uint8_t tg = (tt->granule_sz - 10) / 2;
> >      uint8_t inputsize = 64 - tt->tsz;
> > @@ -88,6 +90,36 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> >          }
> >          level++;
> >      }
> > +    return entry;
> > +}
> > +
> > +/**
> > + * smmu_iotlb_lookup - Look up for a TLB entry.
> > + * @bs: SMMU state which includes the TLB instance
> > + * @cfg: Configuration of the translation
> > + * @tt: Translation table info (granule and tsz)
> > + * @iova: IOVA address to lookup
> > + *
> > + * returns a valid entry on success, otherwise NULL.
> > + * In case of nested translation, tt can be updated to include
> > + * the granule of the found entry as it might different from
> > + * the IOVA granule.
> > + */
> > +SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > +                                SMMUTransTableInfo *tt, hwaddr iova)
> > +{
> > +    SMMUTLBEntry *entry = NULL;
> > +
> > +    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> > +    /*
> > +     * For nested translation also try the s2 granule, as the TLB will insert
> > +     * it if the size of s2 tlb entry was smaller.
> > +     */
> > +    if (!entry && (cfg->stage == SMMU_NESTED) &&
> > +        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
> > +        tt->granule_sz = cfg->s2cfg.granule_sz;
> > +        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> > +    }
> >  
> >      if (entry) {
> >          cfg->iotlb_hits++;
> > -- 
> > 2.45.2.803.g4e1b14247a-goog
> > 
