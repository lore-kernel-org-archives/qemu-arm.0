Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3427526njb;
        Tue, 9 Jul 2024 10:13:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTTppgpIDSzGAPF9bh6gsJ++kQ+fFtS22rxbwVeIekBud54oJle09+v/EiVytIJJy3TArj2usEMIrQU4hhRVIbqQl4nR6U
X-Received: by 2002:ac2:58d9:0:b0:52e:9481:eaa1 with SMTP id 2adb3069b0e04-52eb9994c3emr1826757e87.23.1720545216533;
        Tue, 09 Jul 2024 10:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720545216; cv=none;
        d=google.com; s=arc-20160816;
        b=Zly5JCikk52qFFZ+DO/Fowt06K3wIp38IK+zSQZVWSnkQDZC0u71r/rAe+GFfzSrHr
         PfLv/w4rVUSkGNlxG+oS++NCH7/2qSD/gjPy6jOEkuW8eCX9tf5D8gVYktPVHfsxiaY/
         vS8dHWW83T/ERWCEOqLfPNbp6C3yEblFSctlgldBC4Kq34muP3V9rcF4fG9jU1f237gH
         ADHVrTTf4RzkbyQqFFMXyIV6tBJ87aMI/xNDSgMwvhJULEQBkMe/2p47Gz4S05q+12B1
         QcX71G0w1TRNy97GVXnYg27ZydJPwUKFXbMmy3ahiTfAWyTJsDa98vg3BazshWebQqef
         4Z/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=M21kN0hAmUgoAhZACpNGCGJZUGoSABCOK98rI/RbKg0=;
        fh=1w1V2MaFb4NtA8rQtgK02p0R1lMzpGzroUqH564OiWE=;
        b=C5itiZKKwDzPKmu8CYDyZ9R8bYXRmWXyxO//aqHXwQeOurqyz5fIwiWmIEt6mUyqep
         fcmDF3giBAAVfpAf3XBBQ16TxlB5t/ey1jc+YxkE6hF9+7rZpCkMRAmT14Fm8FgQONN7
         scBPUfKje0ZkWAf8WfUI6pvEbppv/cOYGrOy4JXVfmrDuveMs+Rc10QwyiEjJEzckIS6
         eY3jd7UDtj0odPOzOIjT8HdJvP6pFgBltpsbCG9hohW2TCNEX3B41g2S8kgdyLtN02RM
         5n8KRtSAsNk7mTAtGsIINNBHhS5i4lqHby24n8v6Qc5DaUPtQZ5YBV1XhQXMUI+otvNX
         bwRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RInDD19J;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4266fb0f9b9sor6128235e9.0.2024.07.09.10.13.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 10:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RInDD19J;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720545216; x=1721150016; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M21kN0hAmUgoAhZACpNGCGJZUGoSABCOK98rI/RbKg0=;
        b=RInDD19J6TtL4j8fP3WTzfwcm3sN6B/FCkJyIjV4XG0Mx4RAmHAJBHiDKabtl3ZXRR
         GCQMfxxzqWMSNBEEFyCF+FqGyJEBigacMzN9Y/kCoRt0hHCPTqTeKlwvhoMqoNVcWo07
         hyJ5iijTnRp6ouQcuMPsRqAqb0OK7XgRAuU1INsyNeWqq36wx6xf3r6R2jeI5MjKE0yU
         JchuYGX51LOjWDC88X9lcw5GJf1bnSyihKj6Z0keaQY80RtrdOcXt32ck550WOYNsRRZ
         J+0WUEFYK1C9PuvILlutBzvi2bqSQrQBFBhOeLHIqehdChbKXqMOYvGDA2zJdvchJvOr
         sE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720545216; x=1721150016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M21kN0hAmUgoAhZACpNGCGJZUGoSABCOK98rI/RbKg0=;
        b=umpXMEHP/z+tW/q5h3Dz9ym6lOHSEy5wUeTDCgCP8CnwaH889sVuZdLHiZ1nD1lF4d
         /bIiSUTCmOZztm23ShTZRnJ6/EH5z9jdFiWjXng8Vu1Wk3rRkOt5axm+fNPN+DVh4Gmk
         YKyOHhMAqq8ETqJo67SouXDr0AnTP2pNzxu52/8TTI8VXCwq5SeHr4b5SOkAWtkSKf7J
         vUQVlIvzDxufNe0M8fr909/zIGCtDi7+2P4auPECGDzneLo73bErmP8CoU48NLBQQou4
         TXBW1JffZUSY/c9Z+0+/36+0x9tagUmOK+puQll4+a9VdQJ1Ktb+EX0hOFXTHVd46Q7+
         ZgsA==
X-Forwarded-Encrypted: i=1; AJvYcCVEmWOByfigMe39N4M9MTCMKCsHSwKOZG+dBICxF/2EDXE8RTz4z1yAz/mmhLSOHPb4QoNWpMgmE/tz2INDJ5Eug6ePMz3m
X-Gm-Message-State: AOJu0YwebNW7bQPIytdjKzRmZ+H/FVJnhgTpkwAKd+MQDQvQXKt0BpET
	SMLpS2CT4U40NaC/oykIVOTPoFolqzY7augT3T04rIR5bx2QetnTHF5q/k56Oyn35w==
X-Google-Smtp-Source: AGHT+IHBLw+TeFdnyPk0Q7oqWqKZJfnh1XGhmKfCEzfaPnBMQMNDxiF6KWHVFkKs9zHK1vjVPHTCdw==
X-Received: by 2002:a05:600c:41c4:b0:426:5ee5:3129 with SMTP id 5b1f17b1804b1-426707ce948mr25035605e9.2.1720545215941;
        Tue, 09 Jul 2024 10:13:35 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266e6478d7sm67474995e9.31.2024.07.09.10.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:13:35 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:13:45 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 09/19] hw/arm/smmu-common: Rework TLB lookup for
 nesting
Message-ID: <20240709171345.GC2189727@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-10-smostafa@google.com>
 <20240704181235.GF1693268@myrica>
 <ZozjS59a4aluqUju@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZozjS59a4aluqUju@google.com>
X-TUID: 7+WEcjBLbzE4

On Tue, Jul 09, 2024 at 07:14:19AM +0000, Mostafa Saleh wrote:
> Hi Jean,
> 
> On Thu, Jul 04, 2024 at 07:12:35PM +0100, Jean-Philippe Brucker wrote:
> > On Mon, Jul 01, 2024 at 11:02:31AM +0000, Mostafa Saleh wrote:
> > > In the next patch, combine_tlb() will be added which combines 2 TLB
> > > entries into one for nested translations, which chooses the granule
> > > and level from the smallest entry.
> > > 
> > > This means that with nested translation, an entry can be cached with
> > > the granule of stage-2 and not stage-1.
> > > 
> > > However, currently, the lookup for an IOVA is done with input stage
> > > granule, which is stage-1 for nested configuration, which will not
> > > work with the above logic.
> > > This patch reworks lookup in that case, so it falls back to stage-2
> > > granule if no entry is found using stage-1 granule.
> > 
> > Why not initialize tt_combined to the minimum granule of stages 1 and 2?
> > It looks like you introduced it for this. I'm wondering if we lookup the
> > wrong IOVA if changing the granule size after the address is masked in
> > smmu_translate()
> 
> I am not sure I fully understand, but I don’t think that would work as it is
> not guaranteed that the minimum granule is the one that would be cached,
> as we might hit block mappings.
> 
> The IOVA at first is masked with the first stage mask for the expected page
> address, and the lookup logic would mask the address for each level look up,
> so It should match the alignment of the cached page of that granule and level,
> and as the combine logic is done with the aligned_addr it is guaranteed by
> construction that it has to be aligned with stage-1.

I missed something, this is what I had in mind initially:

* s1 granule is 64k, s2 granule is 4k
* the tlb already contains a translations for IOVA 0x30000, tg=4k
* now we lookup IOVA 0x31000. Masked with the s1 granule, aligned_addr is
  0x30000. Not found at first because lookup is with tg=64k, but then we
  call smmu_iotlb_lookup_all_levels() again with the s2 granule and the
  same IOVA, which returns the wrong translation

But it's not actually possible, because if cfg->stage == SMMU_NESTED, then
in smmu_translate() we end up with

    } else {
        /* Stage2. */
        tt_combined.granule_sz = cfg->s2cfg.granule_sz;

So I think the condition

	(cfg->stage == SMMU_NESTED) && (cfg->s2cfg.granule_sz != tt->granule_sz)

in this patch is never true?


Then the following scenario:

* s1 granule is 4k, s2 granule is 64k
* we lookup IOVA A, miss. The translation gets cached with granule 4k
* we lookup IOVA A again, but with tt->granule_sz = 64k so we'll
  never find the entry?


I guess we want to start the lookup with the smallest granule, and then if
the s1 and s2 granules differ, retry with the other one. Or with
SMMU_NESTED, start with the s1 granule and keep this patch to fallback to
s2 granule, but without masking the IOVA in smmu_translate() (it will be
masked correctly by smmu_iotlb_lookup_all_levels()).

Thanks,
Jean

> 
> Thanks,
> Mostafa
> 
> > 
> > Thanks,
> > Jean
> > 
> > > 
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  hw/arm/smmu-common.c | 36 ++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 34 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > > index 21982621c0..0840b5cffd 100644
> > > --- a/hw/arm/smmu-common.c
> > > +++ b/hw/arm/smmu-common.c
> > > @@ -66,8 +66,10 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
> > >      return key;
> > >  }
> > >  
> > > -SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > > -                                SMMUTransTableInfo *tt, hwaddr iova)
> > > +static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
> > > +                                                  SMMUTransCfg *cfg,
> > > +                                                  SMMUTransTableInfo *tt,
> > > +                                                  hwaddr iova)
> > >  {
> > >      uint8_t tg = (tt->granule_sz - 10) / 2;
> > >      uint8_t inputsize = 64 - tt->tsz;
> > > @@ -88,6 +90,36 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > >          }
> > >          level++;
> > >      }
> > > +    return entry;
> > > +}
> > > +
> > > +/**
> > > + * smmu_iotlb_lookup - Look up for a TLB entry.
> > > + * @bs: SMMU state which includes the TLB instance
> > > + * @cfg: Configuration of the translation
> > > + * @tt: Translation table info (granule and tsz)
> > > + * @iova: IOVA address to lookup
> > > + *
> > > + * returns a valid entry on success, otherwise NULL.
> > > + * In case of nested translation, tt can be updated to include
> > > + * the granule of the found entry as it might different from
> > > + * the IOVA granule.
> > > + */
> > > +SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> > > +                                SMMUTransTableInfo *tt, hwaddr iova)
> > > +{
> > > +    SMMUTLBEntry *entry = NULL;
> > > +
> > > +    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> > > +    /*
> > > +     * For nested translation also try the s2 granule, as the TLB will insert
> > > +     * it if the size of s2 tlb entry was smaller.
> > > +     */
> > > +    if (!entry && (cfg->stage == SMMU_NESTED) &&
> > > +        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
> > > +        tt->granule_sz = cfg->s2cfg.granule_sz;
> > > +        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> > > +    }
> > >  
> > >      if (entry) {
> > >          cfg->iotlb_hits++;
> > > -- 
> > > 2.45.2.803.g4e1b14247a-goog
> > > 
