Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp773380njb;
        Thu, 4 Jul 2024 11:08:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWc8B79fd+A/c2jwoKlNlcdsITdllKqEWnGnEzyc5mjITcxqo4sIuttJB6+WHP/SMjRSBa64/VJjjgKxH0YxeVW2kNMvTX
X-Received: by 2002:a2e:7d07:0:b0:2ec:5a85:66f9 with SMTP id 38308e7fff4ca-2ee8ee1b10emr14934861fa.51.1720116511073;
        Thu, 04 Jul 2024 11:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720116511; cv=none;
        d=google.com; s=arc-20160816;
        b=kJKQICOm/xurFxJApkGKBTledwKCmfDbUmI743z35gvLkMiG3PnnUFTTQWNIdcOAYp
         eH/opLaK65JgccDcgAYpkX206QFfegvDVv0T0T6C/rxbAE6ceJpGSESwm7CAIf1SpqC+
         L42JLHPXKkFvhHvy1L4jfgUfWpwk9Hiu82JtNar7ppVRMxUFqTv0ZnjyvU/SI7ZNw3rZ
         SFnkOB74iJiR/v0bwpcGRG5yAdUzAfL1E80c9w1cQZHP30jCOMVVDFjlZ35z7KD2v2oz
         iN28m8j+K0Ww/F/pX01ve9uYA7ldgFe0EQckd5qJDBKhseNwqvyP2+cFLyZrvBdYCAyj
         CBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=tzgyf9A1Taw5ulsQof2vD8qwZ2xu8UjoUPYYj9ywsDE=;
        fh=0hlQ8CJxeToD/2eryx7zfCl5R0ssY+mULcsVBxes/Uw=;
        b=AzMTtwoaFMqszhWCicfoBf4nO7gNuB9X94u2FVVdMNYxekftJeJWnmz14WU9ge/KeC
         AV74gtussDGaAjRwiybvTz4xMgZCcKFMC3GeKqG6zt55OyFmatu1f7gu2CU2NXwkkqO7
         tL7Wu+07M8SowGEFJsu0L8bjwapUMexKRZ/VsBmcpMiF3iPI+XSgJMWZ+2hVr1M9XwzA
         j3YueDMx8KBnguH1W3irS7ldIk9rLNQgZc/kpWES6OBvtU7k2lL/mY7J+kSHLZDyBrZ7
         57+znG8Ub1l9ckOhA79md79+qXZJd0ZiS5fZp7QdwuE5jHSTv3IZU3qFRVajn+A/jMuM
         thtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nqMz4TQv;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ee9236cf2bsor2028491fa.8.2024.07.04.11.08.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:08:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nqMz4TQv;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720116510; x=1720721310; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzgyf9A1Taw5ulsQof2vD8qwZ2xu8UjoUPYYj9ywsDE=;
        b=nqMz4TQvj4Ytlreof2I2uYk+sIIeeG0i7YC1aIfpvfOBsIilsbH2/ear9INDQoqI7c
         99nbAr18egu1Ve1uqGt2lntbPfcgysI3qpSRsn3gaN7eLuuyf4+i0fOQEe8XS4kHxq3D
         I/lqo5Vw79kA36LZ2vIrIMtIKwnyXJFz0IjtXRz+0A1yAWshTyulvRorRkCnAKaBnlGg
         MNARrdExNHTsRIQfSJZCVJWEvG7QinFoQId8piQg/1MbE6zO4CRT4hv8utV66TOtU/FL
         j53MAHynGlgCQzSARvrHzTxBaMIIyfBpbdxE+Gu0Y03hxGPRu6xAEJElamLiC0qhu4L7
         oRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720116510; x=1720721310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzgyf9A1Taw5ulsQof2vD8qwZ2xu8UjoUPYYj9ywsDE=;
        b=PowkjVb4FXC22igM68+89dtCwzzwaF7dS+HH1z5gY9c/8rFH5Npv/whN8tKCTXWMfC
         YvWmaZv55JEEU/ddwsi5FNB7Eb1qTcAORGSbol0golIE5/fUp7yGC1cWw95sdf4Wa6gt
         /THX/uzgJqAYWfgBE/8BQYO5n+B0JD0TRAzE+dmBQBwBeraszUJx4fBUBdFFWItxfohM
         TjoSlR22HJAt1474q1Dz1E7aBtxXaQ/p8zG8LbY4V4YceL6wUfOBApixzqWoEkw3P7k1
         ogiKVIlTfoNHT3VQxsts0OW5BKNlp05A9IHYjgwSmW2y5hw30vDgV/OjDzOhqLe/seaP
         fSyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtSBx9hvFzmpvFs+0ghjOOmyU4fSDErMTDZuVoBHzmRis+oQXQVYmNwiW+jxY3kYZoEBI+cIi1GyzgZWxHhMImnc5DRBDB
X-Gm-Message-State: AOJu0Yyd5Ow/4ptBtsR6bHYjZKQtco6EVw1V8bL99yKi7of3sOCasro3
	e2/9zarTRveR7TpIn2xN3QvPFMfPrzCvfbbJxepHzoQumudG524Fv/zfiLhq5n9rxw==
X-Google-Smtp-Source: AGHT+IFYn4vnLHdVAn7FnuKiuNyGQ5bQeBO4lnrY4ZusylpN+4fuUE4l9ZDRZpS0PUv3jNnE4wrsaQ==
X-Received: by 2002:a2e:9a89:0:b0:2ee:8171:8e13 with SMTP id 38308e7fff4ca-2ee8ee13eebmr17662841fa.44.1720116510356;
        Thu, 04 Jul 2024 11:08:30 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23c1sm32732125e9.28.2024.07.04.11.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:08:30 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:08:43 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 08/19] hw/arm/smmuv3: Translate CD and TT using
 stage-2 table
Message-ID: <20240704180843.GE1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-9-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-9-smostafa@google.com>
X-TUID: gKPzaRvezXCO

On Mon, Jul 01, 2024 at 11:02:30AM +0000, Mostafa Saleh wrote:
> According to ARM SMMU architecture specification (ARM IHI 0070 F.b),
> In "5.2 Stream Table Entry":
>  [51:6] S1ContextPtr
>  If Config[1] == 1 (stage 2 enabled), this pointer is an IPA translated by
>  stage 2 and the programmed value must be within the range of the IAS.
> 
> In "5.4.1 CD notes":
>  The translation table walks performed from TTB0 or TTB1 are always performed
>  in IPA space if stage 2 translations are enabled.
> 
> This patch implements translation of the S1 context descriptor pointer and
> TTBx base addresses through the S2 stage (IPA -> PA)
> 
> smmuv3_do_translate() is updated to have one arg which is translation
> class, this is useful to:
>  - Decide wether a translation is stage-2 only or use the STE config.
>  - Populate the class in case of faults, WALK_EABT is left unchanged,
>    as it is always triggered from TT access so no need to use the
>    input class.
> 
> In case for stage-2 only translation, used in the context of nested
> translation, the stage and asid are saved and restored before and
> after calling smmu_translate().
> 
> Translating CD or TTBx can fail for the following reasons:
> 1) Large address size: This is described in
>    (3.4.3 Address sizes of SMMU-originated accesses)
>    - For CD ptr larger than IAS, for SMMUv3.1, it can trigger either
>      C_BAD_STE or Translation fault, we implement the latter as it
>      requires no extra code.
>    - For TTBx, if larger than the effective stage 1 output address size, it
>      triggers C_BAD_CD.
> 
> 2) Faults from PTWs (7.3 Event records)
>    - F_ADDR_SIZE: large address size after first level causes stage 2 Address
>      Size fault (Also in 3.4.3 Address sizes of SMMU-originated accesses)
>    - F_PERMISSION: Same as an address translation. However, when
>      CLASS == CD, the access is implicitly Data and a read.
>    - F_ACCESS: Same as an address translation.
>    - F_TRANSLATION: Same as an address translation.
>    - F_WALK_EABT: Same as an address translation.
>   These are already implemented in the PTW logic, so no extra handling
>   required.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c | 91 +++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 80 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 229b3c388c..86f95c1e40 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -337,14 +337,35 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
>  
>  }
>  
> +static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> +                                                 SMMUTransCfg *cfg,
> +                                                 SMMUEventInfo *event,
> +                                                 IOMMUAccessFlags flag,
> +                                                 SMMUTLBEntry **out_entry,
> +                                                 SMMUTranslationClass class);
>  /* @ssid > 0 not supported yet */
> -static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
> -                       CD *buf, SMMUEventInfo *event)
> +static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
> +                       uint32_t ssid, CD *buf, SMMUEventInfo *event)
>  {
>      dma_addr_t addr = STE_CTXPTR(ste);
>      int ret, i;
> +    SMMUTranslationStatus status;
> +    SMMUTLBEntry *entry;
>  
>      trace_smmuv3_get_cd(addr);
> +
> +    if (cfg->stage == SMMU_NESTED) {
> +        status = smmuv3_do_translate(s, addr, cfg, event,
> +                                     IOMMU_RO, &entry, SMMU_CLASS_CD);
> +
> +        /* Same PTW faults are reported but with CLASS = CD. */
> +        if (status != SMMU_TRANS_SUCCESS) {

In this case I think we're reporting InputAddr as the CD address, but it
should be the IOVA

> +            return -EINVAL;
> +        }
> +
> +        addr = CACHED_ENTRY_TO_ADDR(entry, addr);
> +    }
> +
>      /* TODO: guarantee 64-bit single-copy atomicity */
>      ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
>                            MEMTXATTRS_UNSPECIFIED);
> @@ -659,10 +680,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>      return 0;
>  }
>  
> -static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
> +static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
> +                     CD *cd, SMMUEventInfo *event)
>  {
>      int ret = -EINVAL;
>      int i;
> +    SMMUTranslationStatus status;
> +    SMMUTLBEntry *entry;
>  
>      if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
>          goto bad_cd;
> @@ -713,9 +737,26 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>  
>          tt->tsz = tsz;
>          tt->ttb = CD_TTB(cd, i);
> +
>          if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
>              goto bad_cd;
>          }
> +
> +        /* Translate the TTBx, from IPA to PA if nesting is enabled. */
> +        if (cfg->stage == SMMU_NESTED) {
> +            status = smmuv3_do_translate(s, tt->ttb, cfg, event, IOMMU_RO,
> +                                         &entry, SMMU_CLASS_TT);
> +            /*
> +             * Same PTW faults are reported but with CLASS = TT.
> +             * If TTBx is larger than the effective stage 1 output addres
> +             * size, it reports C_BAD_CD, which is handled by the above case.
> +             */
> +            if (status != SMMU_TRANS_SUCCESS) {

Here too, we should report InputAddr as the IOVA

> +                return -EINVAL;
> +            }
> +            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
> +        }
> +
>          tt->had = CD_HAD(cd, i);
>          trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
>      }
> @@ -767,12 +808,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return 0;
>      }
>  
> -    ret = smmu_get_cd(s, &ste, 0 /* ssid */, &cd, event);
> +    ret = smmu_get_cd(s, &ste, cfg, 0 /* ssid */, &cd, event);
>      if (ret) {
>          return ret;
>      }
>  
> -    return decode_cd(cfg, &cd, event);
> +    return decode_cd(s, cfg, &cd, event);
>  }
>  
>  /**
> @@ -832,13 +873,40 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                                                   SMMUTransCfg *cfg,
>                                                   SMMUEventInfo *event,
>                                                   IOMMUAccessFlags flag,
> -                                                 SMMUTLBEntry **out_entry)
> +                                                 SMMUTLBEntry **out_entry,
> +                                                 SMMUTranslationClass class)
>  {
>      SMMUPTWEventInfo ptw_info = {};
>      SMMUState *bs = ARM_SMMU(s);
>      SMMUTLBEntry *cached_entry = NULL;
> +    int asid, stage;
> +    bool S2_only = class != SMMU_CLASS_IN;
> +
> +    /*
> +     * The function uses the argument class to indentify which stage is used:

identify

> +     * - CLASS = IN: Means an input translation, determine the stage from STE.
> +     * - CLASS = CD: Means the addr is an IPA of the CD, and it would be
> +     *   tranlsated using the stage-2.

translated

> +     * - CLASS = TT: Means the addr is an IPA of the stage-1 translation table
> +     *   and it would be tranlsated using the stage-2.

translated

> +     * For the last 2 cases instead of having intrusive changes in the common
> +     * logic, we modify the cfg to be a stage-2 translation only in case of
> +     * nested, and then restore it after.
> +     */
> +    if (S2_only) {

"S2_only" seems a bit confusing because in the spec "stage 2-only" means
absence of nesting, which is the opposite of what we're handling here.
I don't have a good alternative though, maybe "desc_s2_translation"

Thanks,
Jean

> +        asid = cfg->asid;
> +        stage = cfg->stage;
> +        cfg->asid = -1;
> +        cfg->stage = SMMU_STAGE_2;
> +    }
>  
>      cached_entry = smmu_translate(bs, cfg, addr, flag, &ptw_info);
> +
> +    if (S2_only) {
> +        cfg->asid = asid;
> +        cfg->stage = stage;
> +    }
> +
>      if (!cached_entry) {
>          /* All faults from PTW has S2 field. */
>          event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
> @@ -855,7 +923,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                  event->type = SMMU_EVT_F_TRANSLATION;
>                  event->u.f_translation.addr = addr;
>                  event->u.f_translation.addr2 = ptw_info.addr;
> -                event->u.f_translation.class = SMMU_CLASS_IN;
> +                event->u.f_translation.class = class;
>                  event->u.f_translation.rnw = flag & 0x1;
>              }
>              break;
> @@ -864,7 +932,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                  event->type = SMMU_EVT_F_ADDR_SIZE;
>                  event->u.f_addr_size.addr = addr;
>                  event->u.f_addr_size.addr2 = ptw_info.addr;
> -                event->u.f_addr_size.class = SMMU_CLASS_IN;
> +                event->u.f_addr_size.class = class;
>                  event->u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
> @@ -873,7 +941,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                  event->type = SMMU_EVT_F_ACCESS;
>                  event->u.f_access.addr = addr;
>                  event->u.f_access.addr2 = ptw_info.addr;
> -                event->u.f_access.class = SMMU_CLASS_IN;
> +                event->u.f_access.class = class;
>                  event->u.f_access.rnw = flag & 0x1;
>              }
>              break;
> @@ -882,7 +950,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                  event->type = SMMU_EVT_F_PERMISSION;
>                  event->u.f_permission.addr = addr;
>                  event->u.f_permission.addr2 = ptw_info.addr;
> -                event->u.f_permission.class = SMMU_CLASS_IN;
> +                event->u.f_permission.class = class;
>                  event->u.f_permission.rnw = flag & 0x1;
>              }
>              break;
> @@ -943,7 +1011,8 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto epilogue;
>      }
>  
> -    status = smmuv3_do_translate(s, addr, cfg, &event, flag, &cached_entry);
> +    status = smmuv3_do_translate(s, addr, cfg, &event, flag,
> +                                 &cached_entry, SMMU_CLASS_IN);
>  
>  epilogue:
>      qemu_mutex_unlock(&s->mutex);
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
