Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp775408njb;
        Thu, 4 Jul 2024 11:12:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVih0RwOLwLjcA8qfxWNizU4t2iCriVs2ZKdfHskvOxBQtrY0qgdqoCCbh1a6tOjIPIlTT4AU2+vn6bOkVJVtNyt1GycQvr
X-Received: by 2002:a05:600c:4f92:b0:421:811b:b83e with SMTP id 5b1f17b1804b1-4264b190342mr23955505e9.13.1720116743546;
        Thu, 04 Jul 2024 11:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720116743; cv=none;
        d=google.com; s=arc-20160816;
        b=NO6S5tA9maJTNaxCc03xqaN7lJVZqWP3NDd39t8PrIS26cSOHbCF9rhvgV2PZTmbND
         gGpdjucqi3WRkQHyXDMxRlTiV6JHcsfIrMOKXOWCW/RaRJH84T2hUrtTDObecG+f9Gtr
         1/L+rJpwTY+L/s+bhdeCZdShhbJkTswVVsCiaI5KcNRAx1WwrzYQPv2dbQBiF/Xfyj5z
         4P5ZbvNMB8p5pm62SoLrDvfBrlBICNtCk+9+nwac+hnwAxUHTuPRPIRhIMkbfB6tsmD5
         hn2jVrOd2Oe3CKY+H6gQhYeZjev1zMJeWN5wHIQ07jnthA56StfBO/pj5j1irB1H1Taj
         oprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=TXesRPbPkumApHoZmaR24s0c1P7vUuR8yECnDIGAfTE=;
        fh=89a0gq55Rtuod03uol6KS1J5Od44jadyR+t0YFe7N7Y=;
        b=k1Ek3dKMCxrG8FLWNqxvE8f1KQGxqk98qG+hkT+75SAhpNeWCoMAKUcPRdmpDMshoU
         N/CzLRwT6cS2SonGKU0HSaL9n9CHYgO2ofPykZbVsWTdl7zpcap1GzbCC0B7xGa2thg6
         1WDTtAAnMtr3pmqQDDKyVhUNHGWoD2KgSKVeO5MA2WIxxUGhsADZrZT7+dOCxc2k2dWR
         BuDLM+5PEO6CVSemIilpUDbbb4ZXiCfPcPiP9yuupFirG/fyV8RLFhzVV4jG5BT1IGKj
         /7JUKS4rdSPcntM2mBAP9x2dGd/5oRtCG6hCLKbCyvOFwOwaXyH/0NRvKg0/05BSZOfI
         8nbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XReXLPak;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4264a1844e4sor5292695e9.0.2024.07.04.11.12.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XReXLPak;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720116743; x=1720721543; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXesRPbPkumApHoZmaR24s0c1P7vUuR8yECnDIGAfTE=;
        b=XReXLPakOrW1WxssGnnYEcDhK3zzyDVOME+RUBsjsukOMoqnHR2XcDsVbc8yr3xY2s
         aKx0UOJUKP7sOKcwEyotmDm96MDqFUpN07qNKcK+mfpG/z6UpdwWapUy04RQCEYZTL6Y
         oxVKCWi1hrxbqMw7PL3fqutpYB95QLRSU/lQC2T7AenXUe9wMs3tnz4VmxCimHAxHw7G
         TSWMzu0VQjtQgcYiZ7ZaUssHafTUDP5LXAyq2B5kGNCem61swTa+Ku//72SeM2A8SuzY
         16p0ojKPhOJRdL9YBmjVTegHpZnbh5UpTTLrU3xhPTpNzn5C0CRORp54n6mDdoeaYVdK
         DaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720116743; x=1720721543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXesRPbPkumApHoZmaR24s0c1P7vUuR8yECnDIGAfTE=;
        b=IKfagUAIDTdexZCoSza24LOsES5R6Q8ychpvqRh8iWL/DXZvrHEU0/qRfgpcg047Td
         9raNflGXOjkS+BM5oTxZjuFgCC5ZX86gm3zyHmM2Kt/esKwzXZrMi2W/SFgS6rrVLmyR
         fljrT920uZe0GKAMjMyvTPr2JMnMbmw+yH9J+opQG6lMzDnjSsmi0PB6fMeZpigW3g57
         HpSTOYGZzkIM1vyJAoJTFRkJG5q+R4rn2GHAiHKgOXBVKIWAUMHKMLtARmy1nj5bgPXw
         peGJclbcvRCFSrJJEx9ZdNK/VM020/AnlunP2Vh2+0S2/hlZQ0fZPdyG7AhHVxM/aVwJ
         t2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRkKapuIAfa+jBzWYu23FdtZDW4gGTUUy0IFf9fG9NT7/1PtCB7I5rbzfjdYUlp9JB9JH835S/nUJeSfq7KSPdtuPXzf92
X-Gm-Message-State: AOJu0YxayLJX34nvZrcewZ/1UMZkaesqOwxInUJq9Z1CNm9mss2GdmV/
	QppfQZnBbeelOSAb35DjpWpPyzQljqBkncatcy/PJrUw/p/qqAx2MyA8eUBQ9olFEwea4qc8yRq
	G2Ys=
X-Google-Smtp-Source: AGHT+IGirTrbqLd+pfV1OysBTuGjDi1zFi5uEmNsa8X/0BB4iUhkXhsVYvNyH1HQJCOj40UXBoRCPg==
X-Received: by 2002:a05:600c:218e:b0:424:acbf:c068 with SMTP id 5b1f17b1804b1-4264b162dcamr25056965e9.16.1720116743001;
        Thu, 04 Jul 2024 11:12:23 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264d5101ffsm19102105e9.16.2024.07.04.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:12:22 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:12:35 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 09/19] hw/arm/smmu-common: Rework TLB lookup for
 nesting
Message-ID: <20240704181235.GF1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-10-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-10-smostafa@google.com>
X-TUID: eXzGgPG85Ibz

On Mon, Jul 01, 2024 at 11:02:31AM +0000, Mostafa Saleh wrote:
> In the next patch, combine_tlb() will be added which combines 2 TLB
> entries into one for nested translations, which chooses the granule
> and level from the smallest entry.
> 
> This means that with nested translation, an entry can be cached with
> the granule of stage-2 and not stage-1.
> 
> However, currently, the lookup for an IOVA is done with input stage
> granule, which is stage-1 for nested configuration, which will not
> work with the above logic.
> This patch reworks lookup in that case, so it falls back to stage-2
> granule if no entry is found using stage-1 granule.

Why not initialize tt_combined to the minimum granule of stages 1 and 2?
It looks like you introduced it for this. I'm wondering if we lookup the
wrong IOVA if changing the granule size after the address is masked in
smmu_translate()

Thanks,
Jean

> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 21982621c0..0840b5cffd 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -66,8 +66,10 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>      return key;
>  }
>  
> -SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> -                                SMMUTransTableInfo *tt, hwaddr iova)
> +static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
> +                                                  SMMUTransCfg *cfg,
> +                                                  SMMUTransTableInfo *tt,
> +                                                  hwaddr iova)
>  {
>      uint8_t tg = (tt->granule_sz - 10) / 2;
>      uint8_t inputsize = 64 - tt->tsz;
> @@ -88,6 +90,36 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>          }
>          level++;
>      }
> +    return entry;
> +}
> +
> +/**
> + * smmu_iotlb_lookup - Look up for a TLB entry.
> + * @bs: SMMU state which includes the TLB instance
> + * @cfg: Configuration of the translation
> + * @tt: Translation table info (granule and tsz)
> + * @iova: IOVA address to lookup
> + *
> + * returns a valid entry on success, otherwise NULL.
> + * In case of nested translation, tt can be updated to include
> + * the granule of the found entry as it might different from
> + * the IOVA granule.
> + */
> +SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> +                                SMMUTransTableInfo *tt, hwaddr iova)
> +{
> +    SMMUTLBEntry *entry = NULL;
> +
> +    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> +    /*
> +     * For nested translation also try the s2 granule, as the TLB will insert
> +     * it if the size of s2 tlb entry was smaller.
> +     */
> +    if (!entry && (cfg->stage == SMMU_NESTED) &&
> +        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
> +        tt->granule_sz = cfg->s2cfg.granule_sz;
> +        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
> +    }
>  
>      if (entry) {
>          cfg->iotlb_hits++;
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
