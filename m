Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp369434ejb;
        Wed, 22 May 2024 05:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxTRCfJp6ipy6I712xaDNYdNJCne1nEBqtATA9ow++BgUTShZ/eSNpkis9G3udc26pqbvAHWhgOk6QDs7GguG4YkpocVst
X-Received: by 2002:a05:600c:2294:b0:41a:1b3f:b465 with SMTP id 5b1f17b1804b1-420fd33ab42mr15220885e9.26.1716382030620;
        Wed, 22 May 2024 05:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716382030; cv=none;
        d=google.com; s=arc-20160816;
        b=epfaH0xj6S2YnpqEfd39CsrX0HC9qF3hEb0+DXKCJ0JTeuiH7d6Yn1iINLF1XKm8Fj
         jpjKVpIfjH1qYzPBsESKT3quN6mHZ9kiQ+PbuSBhrEIHDGzlbQrZ3e2Nt6XjqdYVvPKJ
         LCfUB8GdrMdBygWRkNGJu+zLLJYaKL8iS/qyeZzCfptpfb6f5CPsVfEqs3inxcITu0xT
         2D2gPD1mE30wVAPfApCHu1SH8dOaEGn6dN7xFNU8+DVICYz7nTSTVwoHDKBG0BRFOWjt
         vFv4E8SznKOuK/3e8Z4B7QJy/agIjx0S10H86GSfGTR9FBK/vLwKmeBofHvvXbsn54TD
         GuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=CxAZSVLZ56+EW157G/uXZntKJFAn9KrC9pysQzHkGHQ=;
        fh=yZuCF/9gOOvCEXlbpxUddr4pYT52BC1xSmKixGnlUuQ=;
        b=o+HCjS+XByge8Lm25Ey7bYSgJSIP6njOb+r3m7jPNMvBX4ABoJE05BMXHb2xsZpOfV
         /i5cSgmGZPTIM94FI+6aO++bsXcOM9t7DzVPFV2iTrU543QhQ381g/Asb0WbFiXPs/0P
         Fpo//hKzYggTFrPjQ6R6i1G+0Ls7oosPOITdb5sbFkgIpDyFgdeBJRczuRygliJA5aTL
         BMO078sPOLqeDJNX5SzcizbNUcKhOcqnZW4s0fc1XoAvYNZQ6KSlCCkJZEBCYDiSBJNd
         oLgrOScOia4Z5SpaBk5VgvaOcKR6GMf5CCZbDUJILezeSF4hO/u3I4OuC1Fn0dJImz0g
         QvpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="BgJhGmq/";
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-420fd30e192sor568605e9.5.2024.05.22.05.47.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 May 2024 05:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="BgJhGmq/";
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716382030; x=1716986830; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CxAZSVLZ56+EW157G/uXZntKJFAn9KrC9pysQzHkGHQ=;
        b=BgJhGmq/B0RgTuypwB3qyd022/cKAScoDunRaNCa3Jc5ppohHiz0XYDq+Pvef6rYdc
         wUMEqvf59YQGUcBQ0YQ3xGMht9gcMiBYqMwKC0NfrKGpzyommPhtTfEsgMKrWoUb4Pi5
         6dDBckiXu6dgFpOId9oIrVYhOtQcifXfGNcO4fxVZzGnYB8yve+ZcO3Ng7liHFPnFT10
         1NATgEjgC2lGNPWvBL3J7fcr9geJy2vyy1Ork89FKDyS9hPBY/AQn0mbVvAkueOBTRH5
         FLzzIQaBOT65v77tL5t/zey6wnitUCE0+UO7HYP27o7/XZu4z/5wtNcSP338fxBpTbqd
         V2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716382030; x=1716986830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxAZSVLZ56+EW157G/uXZntKJFAn9KrC9pysQzHkGHQ=;
        b=CiBa7WkimJcbj+FwSn2DTuahLaRVVwyARO4gWeN95d7+9dwU1s1YYsiUgFqbi+PXU0
         RWh7vZGjoeb+5BfmCXSp65baIDFixMECXa+4NA1n1VmGTMTAROIJ43T1XCnoUxCDGEdh
         HhUliUW3rJyUDjCobtc+y0BspWEIY2BIiRln4hKYLUO0hJNOusgUjqMQ6SQL3VZ/DWxV
         uc+f42CjRR86l1FTkm7ITnvII4dSKK2Vw1kSwiOAX8RPgorQeQIP+Wvy4f6aKU/qqHyT
         A/1fisTH2MrakXo2KKgFJxml5hHESe1AOM6ZtM+0StXNAuv3bggTv+brRG1MUtEWesET
         Yk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5wK8a3SpvzFDLhFEASxZ81iQVV34A2jAqcA8sFKqoW68OGZYBi7r2pPZ7aT4hSBTVJ5fTCOChA0gtQEEDbyfc/x8fNVEQ
X-Gm-Message-State: AOJu0YzCNJ/He7TnCDmW2CzhGCMx78pP5zaluTVIjbXcpk39F85h/9Lx
	eIjF6+DvBbF3M08ZpznbcSZ+HhBCw/DZq+ySDRZs2ZeK6/d6px1ENhHgUANJ3A==
X-Google-Smtp-Source: AGHT+IETwOHkJouFP3GeZBUOh4yMU/26CxPH0F0XnwPjR7//YfmE6yXJ5jk4WBzmrcA8pKYnjg2zKQ==
X-Received: by 2002:a05:600c:3d05:b0:41b:8715:1158 with SMTP id 5b1f17b1804b1-420fc8142admr1806955e9.6.1716382029990;
        Wed, 22 May 2024 05:47:09 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbc077sm34177034f8f.104.2024.05.22.05.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 05:47:09 -0700 (PDT)
Date: Wed, 22 May 2024 12:47:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 09/18] hw/arm/smmu-common: Rework TLB lookup for
 nesting
Message-ID: <Zk3pSdhym_mLak_L@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-10-smostafa@google.com>
 <c22b04a2-c15c-4d9e-bfff-8d9922a83122@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c22b04a2-c15c-4d9e-bfff-8d9922a83122@redhat.com>
X-TUID: lhCaPdkuZcMR

Hi Eric,

On Mon, May 20, 2024 at 10:27:50AM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/29/24 05:23, Mostafa Saleh wrote:
> > In the previous patch, comine_tlb() was added which combines 2 TLB
> > entries into one, which chooses the granule and level from the
> > smallest entry.
> >
> > This means that a nested translation, an entry can be cached with the
> > granule of stage-2 and not stage-1.
> >
> > However, the lookup for an IOVA in nested configuration is done with
> > stage-1 granule, this patch reworks lookup in that case, so it falls
> > back to stage-2 granule if no entry is found using stage-1 granule.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmu-common.c | 24 ++++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 0d6945fa54..c67af3bc6d 100644
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
> > @@ -88,6 +90,24 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> >          }
> >          level++;
> >      }
> > +    return entry;
> > +}
> > +
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
> is it safe to alter the tt->granule_sz without restoring it? In the
> positive I think this would deserve a comment.

It should be safe in the current usage, I will add a comment to
clarify how the function behaves (something as the the granule_sz
would be updated to the entry tg if found)

Thanks,
Mostafa
> 
> Eric
> > +        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> > +    }
> >  
> >      if (entry) {
> >          cfg->iotlb_hits++;
> 
