Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1705723ejd;
        Thu, 18 Apr 2024 05:52:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXH85IvNfJFbHI85EgjmGooNU4p81rOMIIMojgmguiTzUFxB3tRYTIPWvFgXT8Hkdnami+QnD9k2qWEl2sbnkScs5RJtJ6D
X-Google-Smtp-Source: AGHT+IHMH5xGHdSbReltNHcKiRVfurRfxiqxLFWrj+hNwrJriX+natJadEOjNDW881xXBl81EtBZ
X-Received: by 2002:a05:620a:b05:b0:78d:671c:ecd with SMTP id t5-20020a05620a0b0500b0078d671c0ecdmr2635376qkg.45.1713444725994;
        Thu, 18 Apr 2024 05:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713444725; cv=none;
        d=google.com; s=arc-20160816;
        b=i4XY0JxLWc+MFngmQjqai4RgzeM0JRkriawQTDHvdZKldZMrHmdrlx/gqh5kAod3bc
         eKmePYsbh3tHdWC2TJqsueBtMhvDgcBDKLmBfC4zd17WCAYTz3Jg+r9hn2y0rICN5gek
         OfQKRv0n6m3wH2YVLF0KIHhGeDYn1d53xXNIBLalO4EQCVpwM7TLCuJWOtURUoxDdsUA
         gnjajOlYFivED3Rcpf1Lhq1Zphln4mdouyCUpW5EjekSwFe2fn4pEfeL7Q8HytqGlGqf
         MFyWaD8hcKpe6b9uOgqUXSTdaJe6LD5i7J/+CIjGNPB/wbiq/XNMbXYXJyDHNWiCF5xt
         hH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=A41FhCSxupmqIC7HJofH8JMJ/ww9mWA6JtBS9LbA+rs=;
        fh=XUrOL3MBnl4FQcnvpq+uFTJO5aZqIDZwYT9x3CB521I=;
        b=XB9fbNJ0Gzl9yTI474nKOlM3o4KudIoo+JSJgZ7WZ+JD+Fb0US/jAGb3kPMU4hW5Xg
         nc5W7TppPfG4hVy2miaWR9TWTM+sNCTXbJQTXgileUmIkY+jYPfGckuKBARmeWjOTLsJ
         yAk9lF4rUpJXij+yUt3NBq48HgfonHwlGyABhGiPXu1yHzix5LUaHRyamo/658G+faku
         kVGjvvNHdvUuS0v0Vvs3TWTALqmMu1UA3fftdK+KsNTopmEsHbuH7XZYtMKaR4a/TZ8M
         6p+Sc1QPkZW0l9Ytkjzz34yiTDK5Clu4QbgeB7VX77fuD0g40PgXgDwcXImMXCw9+Dyx
         LVGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GzYmVZeJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y21-20020a37e315000000b0078d6fc7a882si1306446qki.783.2024.04.18.05.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GzYmVZeJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713444725;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A41FhCSxupmqIC7HJofH8JMJ/ww9mWA6JtBS9LbA+rs=;
	b=GzYmVZeJWNM/BkJi0jB6f5bkZn1ccYhpcZs33UdQLPEVEvczeIXa8FB/7z1ZmuNsV/6ug7
	NL5FLW09ixUi6liHcymtF/Jl19/cEdWTHZgQnbG69OBeWJ+iFCHZxJLA+acbtYXLddTdaV
	FpcCRFi3K3sMCAY6u8NwLq0jDyT48uY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-OAMkUfFgOkWzPkeSXtZ9mQ-1; Thu, 18 Apr 2024 08:52:04 -0400
X-MC-Unique: OAMkUfFgOkWzPkeSXtZ9mQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-51970eb4b9bso289493e87.0
        for <alex.bennee@linaro.org>; Thu, 18 Apr 2024 05:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444722; x=1714049522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A41FhCSxupmqIC7HJofH8JMJ/ww9mWA6JtBS9LbA+rs=;
        b=u7C2Ryt4+W5CIMBd3cYVQaJi9zPs4kDVssilE6x+d1GdMd6GcoJusayfGQIn9HCO6x
         luOWln/pAC1o9MNrOUFpTgkaAqL7OpCRmxCPbn6p2pZySejI+TALu/nVKwcRM+qn9vMF
         7rf+T+ZZPFUY9w/4VK61R+QEFK5tsc0Tb6p7dMezok5W1Xu6PILvZHSOO586biPDiocl
         tyOnf6RYl7B6KQhLDsm/u/Dri0ZA6DmpVB/p+yYSwsDz7IZzeUd/+RtAftanVeBcZ5jX
         GHBL1Qy9VUxWGUbWQxRzf7YRiaepXYNlpsq0nmiZoi6PkYAiq8T8vQDdtIz9Lu9btQYt
         6VPg==
X-Forwarded-Encrypted: i=1; AJvYcCXkdKOm8wErUybEVsLddwn+hvl7HYmGKFm4nBLeB6DUxUG04wlQQPGNC4+kK6cpJXSy6uQYgi0VWTuqvsAxIZjfX7zm43xl
X-Gm-Message-State: AOJu0Yz/OEG+8UU1mUJT/e/f+9CDoKqOAnCR0xVv3GpJtKze3DevP4wm
	kLH1M++MhwXOPIzINpLifHCSEK6CUyi3/gNqIbQDqYUsyupBEkLeQlpc9xg9oD3O/8j7GeIJ8ep
	m6GjReQXr9AhFfrkf9L/D48RHGKQmOmeqUWc/SwSpOGthlXUWislzOw==
X-Received: by 2002:a05:6512:368e:b0:516:ce34:e4fc with SMTP id d14-20020a056512368e00b00516ce34e4fcmr598955lfs.31.1713444722423;
        Thu, 18 Apr 2024 05:52:02 -0700 (PDT)
X-Received: by 2002:a05:6512:368e:b0:516:ce34:e4fc with SMTP id d14-20020a056512368e00b00516ce34e4fcmr598942lfs.31.1713444721974;
        Thu, 18 Apr 2024 05:52:01 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id w1-20020ac254a1000000b00516d264366fsm223809lfk.245.2024.04.18.05.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 05:52:01 -0700 (PDT)
Message-ID: <34b66166-9343-4c4e-836a-dbc605572ad3@redhat.com>
Date: Thu, 18 Apr 2024 14:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v2 04/13] hw/arm/smmuv3: Translate CD and TT using
 stage-2 table
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240408140818.3799590-1-smostafa@google.com>
 <20240408140818.3799590-5-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240408140818.3799590-5-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 2oA1qmZmWK+0

Hi Mostafa,

On 4/8/24 16:08, Mostafa Saleh wrote:
> According to the user manual (ARM IHI 0070 F.b),
s/user manual/ARM SMMU architecture specification
> In "5.2 Stream Table Entry":
>  [51:6] S1ContextPtr
>  If Config[1] == 1 (stage 2 enabled), this pointer is an IPA translated by
>  stage 2 and the programmed value must be within the range of the IAS.
>
> In "5.4.1 CD notes":
>  The translation table walks performed from TTB0 or TTB1 are always performed
>  in IPA space if stage 2 translations are enabled.
>
> So translate both the CD and the TTBx in this patch if nested
translate the S1 context descriptor pointer and TTBx base addresses
through the S2 stage (IPA -> PA)

You may describe what you put in place to do the translation in the
commit msg, new functions, macro, ...
> translation is requested.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c              | 49 ++++++++++++++++++++++++++++++------
>  include/hw/arm/smmu-common.h | 17 +++++++++++++
>  2 files changed, 59 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 897f8fe085..a7cf543acc 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -337,14 +337,36 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
>  
>  }
>  
> +static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
> +                                                 SMMUTransCfg *cfg,
> +                                                 SMMUEventInfo *event,
> +                                                 IOMMUAccessFlags flag,
> +                                                 SMMUTLBEntry **out_entry);
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
> +        CALL_FUNC_CFG_S2(cfg, status, smmuv3_do_translate, s, addr,
> +                         cfg, event, IOMMU_RO, &entry);
the fact we pass 2 times cfg looks pretty weird from a caller pov. See
my comment below.

do we somewhere check addr is within the proper addr range, IAS if S2,
OAS if S1. This was missing for S1 but I think it is worth improving now.
see 3.4.3
> +        /*
> +         * It is not clear what should happen if this fails, so we return here
> +         * which gets propagated as a translation error.
but the error event might be different, no?
> +         */
> +        if (status != SMMU_TRANS_SUCCESS) {
> +            return -EINVAL;
> +        }
> +
> +        addr = CACHED_ENTRY_TO_ADDR(entry, addr);
> +    }
> +
>      /* TODO: guarantee 64-bit single-copy atomicity */
>      ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
>                            MEMTXATTRS_UNSPECIFIED);
> @@ -659,10 +681,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
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
> @@ -713,6 +738,17 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>  
>          tt->tsz = tsz;
>          tt->ttb = CD_TTB(cd, i);
> +
> +        /* Translate the TTBx, from IPA to PA if nesting is enabled. */
> +        if (cfg->stage == SMMU_NESTED) {
> +            CALL_FUNC_CFG_S2(cfg, status, smmuv3_do_translate, s,
> +                             tt->ttb, cfg, event, IOMMU_RO, &entry);
> +            /* See smmu_get_cd(). */
ditto
> +            if (status != SMMU_TRANS_SUCCESS) {
> +                return -EINVAL;
> +            }
> +            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
> +        }
>          if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
>              goto bad_cd;
>          }
> @@ -767,12 +803,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
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
> @@ -942,8 +978,7 @@ epilogue:
>      switch (status) {
>      case SMMU_TRANS_SUCCESS:
>          entry.perm = cached_entry->entry.perm;
> -        entry.translated_addr = cached_entry->entry.translated_addr +
> -                                    (addr & cached_entry->entry.addr_mask);
> +        entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
>          entry.addr_mask = cached_entry->entry.addr_mask;
>          trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
>                                         entry.translated_addr, entry.perm,
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 96eb017e50..2772175115 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -37,6 +37,23 @@
>  #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
>                                               VMSA_BIT_LVL(isz, strd, lvl)) - 1)
>  
> +#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
> +                                             ((addr) & (ent)->entry.addr_mask);
> +
> +/*
> + * From nested context, some functions might need to translate IPA addresses.
> + * As cfg has SMMU_NESTED, this won't work, this macro calls a function with
> + * making it a stage-2 cfg and then restore it after.
> + */
> +#define CALL_FUNC_CFG_S2(cfg, ret, fn, ...)  ({ \
> +                                                   int asid = cfg->asid; \
> +                                                   cfg->stage = SMMU_STAGE_2; \
> +                                                   cfg->asid = -1; \
> +                                                   ret = fn(__VA_ARGS__); \
At this stage of the reading this is not obvious why you need fn()
parameter, can't you simply call

smmuv3_do_translate(). If this is useful at some point in the series, you shall document that in the commit msg. 
Also I think I would prefer a proper function instead of this macro.

Besides, can't we add an extra parameter to the translate function forcing the S2_only translation although the cfg is a nested one. I think this would make things clearer

> +                                                   cfg->asid = asid; \
> +                                                   cfg->stage = SMMU_NESTED; \
> +                                              })
> +
>  /*
>   * Page table walk error types
>   */
Thanks

Eric
