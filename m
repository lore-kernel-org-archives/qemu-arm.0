Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3133955njb;
        Tue, 9 Jul 2024 00:58:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWpoh7DH68XtiAXfoSHVLpOx74CPbyOcPA502OAnXDi5KF7yXpPj20AWOGWQLUQEjh9/tyXQ2k6Dtc9l+Jj+KF5OQL9L65
X-Google-Smtp-Source: AGHT+IFTp4a1BIeArWiyrOY6tNlYXMy7kZkyq8yndzKhJiXn74EwLluIsZt2f9hu7QeoLKd47zSy
X-Received: by 2002:a05:620a:4114:b0:79d:79cb:2a68 with SMTP id af79cd13be357-79f19aba0e4mr231324785a.57.1720511885873;
        Tue, 09 Jul 2024 00:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720511885; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVc/Awr7da/1+vaF3rW7bc6Z4OKRZBwk4K6mb6CcYW+s5V/59BAiHYP4f61h/41slx
         mvXOUQGrIhIM99LjAs5MBzPsVWCLA9Yg/8Sr5mJorX8p2vBdsDEl/I0X5y47UiDoH6DH
         4JIphaAGT1ZJnDVIsVhF7qyBy2WG5KKCUEfVWLuu6sCRu32biyR0a3eLjkGiIOGUI3aY
         aEJ2CnumPDQ7+TOpBR//wAqtoB2qyd+WumRJMVEc+2d2qhNzTERWEsjoiQ7+vzO3OuSC
         BfYeQBunwxZv0920EHpFgc1qNvuMsk2qiIaZh34gIHG37xsb48VHFeNzmPW+c5G7jM3B
         B1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=c6J+z0Ci5pTyFQJVT66jGF0m2Wt8JtchuNNRk9yGDFg=;
        fh=a33BthdYJbPqsZwwMj7EgouRhp2JYJfot+SzVf8Kev8=;
        b=kP1PFcjA6GOxRS7Qx5fZZDNFBvmvqECZS/x+ZR9EcHhFEoJp1xzOmCmWEFzFqLBR5P
         L2EZF9Ltg/dpU0mbF8rTmk02rGPxcqqlrWCPIng/mUqqwqJEXfnNd7H0KEe08Scg214N
         O2OuIqsu64m3/IV8kePRyEHiXsj0YxvwF6DJ7oSK2AQxbLBsiw28nBzCUg6V+iMKXeFH
         9+XMME83t6a2LCFBj+lYy8PV4L9j54ANEv3F2CKrlbwgEXg2Vk8SMct+wG4Pfayu2Ej8
         0GnrUc0u9Q8AATvzXrLWMKtv3viu3SHvR4FeCi+Vh/FDsqY1AfNVLWeH9yKDWGXRYEPJ
         Rd0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OGJFXlpU;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-79f190d7146si158377785a.554.2024.07.09.00.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OGJFXlpU;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720511885;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6J+z0Ci5pTyFQJVT66jGF0m2Wt8JtchuNNRk9yGDFg=;
	b=OGJFXlpU8wTALAs9O/xTGd+wAxs/SP8MH3+x3i92G1Gku84etSgQ+xm0T5UdnbLa7gAZaT
	SZizAEU0obMRic4nyJ5nIFPi41c2K2fkCtLCh496rlya7jOxo/k8ptYRsk6vLHA5ei4pws
	auJT6MMrFh2O64JZohIUbEzBj3Qtp30=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-_JaH617LOQSx-7HTOLtFow-1; Tue, 09 Jul 2024 03:58:04 -0400
X-MC-Unique: _JaH617LOQSx-7HTOLtFow-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-4f2e6b30167so1861543e0c.1
        for <alex.bennee@linaro.org>; Tue, 09 Jul 2024 00:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720511883; x=1721116683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6J+z0Ci5pTyFQJVT66jGF0m2Wt8JtchuNNRk9yGDFg=;
        b=rus14psxuCxSQoPopDUQhbvSCgxjJaBJg2I4hKGjkCiaHKVOa2fd6AGRIMVHhxBaWS
         c2xBpQ9yNHd0BIT1h6oNJdGtd0xm4B6lX2v/7shW9wWAbJHztBS+W3XsKwnJB/eZVcad
         nqMv73g8q4wAvzRf4Bi1jCndI2X4i+oCIQQkuPJDMUp/8CSYZIlgZLxXxO9PmpxzEP8O
         yiwLsWlTd2L7ZD3o3z6jeIK7NVmARBuptRBmA80pUgK7HPVTUOrCsUweuKjYDMUDKB4P
         pHu1ecRYqCfP5+mkq5pWAZYef5V79MmDgxSx06bqc78rR9Ia7J0HO2LX3yUacok9EIL3
         +x8A==
X-Forwarded-Encrypted: i=1; AJvYcCWvzDsCMNd2Wq10WfqwQ471C8uoehnBAxDXL/6UY4eKO7OkEIWIi73e9RG0oWnV1khk0+wr21vFE9xfGYyu8d0sWV9r0llT
X-Gm-Message-State: AOJu0YyFkSZw2ZqJVv2xj+lTO5Ho+g0xosHcSgkcZRtcenmJ45Xys+4E
	syjHmL7bixJ2HpmeKUmATN3rB0BF6YWioijclxneB81NhDq6b3AUwOKzyyQuBemquOH2/1uZPV4
	xPqqmfEWB+AyzMA0rm7xF3OCqjSsQMsIQBFPzQk6vJ6sQC2f/aJ2oMQ==
X-Received: by 2002:a05:6122:1797:b0:4e4:ed90:27e6 with SMTP id 71dfb90a1353d-4f33f1e8210mr2452470e0c.5.1720511883577;
        Tue, 09 Jul 2024 00:58:03 -0700 (PDT)
X-Received: by 2002:a05:6122:1797:b0:4e4:ed90:27e6 with SMTP id 71dfb90a1353d-4f33f1e8210mr2452440e0c.5.1720511883191;
        Tue, 09 Jul 2024 00:58:03 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff69ebsm71448185a.22.2024.07.09.00.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 00:58:02 -0700 (PDT)
Message-ID: <d30fe053-cc62-4141-9b50-980f7e0b175b@redhat.com>
Date: Tue, 9 Jul 2024 09:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 11/19] hw/arm/smmu-common: Support nested translation
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-12-smostafa@google.com>
 <86fc9221-f24e-4a7f-8a0d-b19102f981f0@redhat.com>
 <ZozkMGIq9VHE3HXS@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZozkMGIq9VHE3HXS@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: b8HDCv9FynPc

Hi Mostafa,

On 7/9/24 09:18, Mostafa Saleh wrote:
> Hi Eric,
>
> On Mon, Jul 08, 2024 at 05:19:59PM +0200, Eric Auger wrote:
>> Hi Mostafa,
>>
>> On 7/1/24 13:02, Mostafa Saleh wrote:
>>> When nested translation is requested, do the following:
>>>
>>> - Translate stage-1 table address IPA into PA through stage-2.
>>> - Translate stage-1 table walk output (IPA) through stage-2.
>>> - Create a single TLB entry from stage-1 and stage-2 translations
>>>   using logic introduced before.
>>>
>>> For stage-1 table translation, the spec (ARM IHI 0070 F.b) says in:
>>>     7.3.12 F_WALK_EABT:
>>>         Translation of an IPA for Stage 1 descriptor fetch:
>>> 	S2 == 1 (stage 2), CLASS == T
>>> So, F_WALK_EABT is used which propagtes to CLASS == TT.
>>>
>>> smmu_ptw() has a new argument SMMUState which include the TLB as
>>> stage-1 table address can be cached in there.
>>>
>>> Also in smmu_ptw() a separate path used for nesting to simplify the
>>> code, although some logic can be combined.
>>>
>>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>>> ---
>>>  hw/arm/smmu-common.c         | 72 +++++++++++++++++++++++++++++++-----
>>>  include/hw/arm/smmu-common.h |  2 +-
>>>  2 files changed, 64 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>> index 24b7d09e2b..71afd486ba 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -318,6 +318,38 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>>>      return NULL;
>>>  }
>>>  
>>> +/* Translate stage-1 table address using stage-2 page table. */
>>> +static inline int translate_table_addr_ipa(dma_addr_t *table_addr,
>>> +                                           SMMUTransCfg *cfg,
>>> +                                           SMMUPTWEventInfo *info,
>>> +                                           SMMUState *bs)
>> Nit: in general the SMMUState if the 1st arg, as the most global state.
>>> +{
>>> +    dma_addr_t addr = *table_addr;
>>> +    SMMUTLBEntry *cached_entry;
>>> +    int asid;
>>> +
>>> +    /*
>>> +     * The translation table walks performed from TTB0 or TTB1 are always
>>> +     * performed in IPA space if stage 2 translations are enabled.
>>> +     */
>>> +    asid = cfg->asid;
>>> +    cfg->stage = SMMU_STAGE_2;
>>> +    cfg->asid = -1;
>>> +    cached_entry = smmu_translate(bs, cfg, addr, IOMMU_RO, info);
>>> +    cfg->asid = asid;
>>> +    cfg->stage = SMMU_NESTED;
>>> +
>>> +    if (cached_entry) {
>>> +        *table_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
>>> +        return 0;
>>> +    }
>>> +
>>> +    info->stage = SMMU_STAGE_2;
>>> +    info->type = SMMU_PTW_ERR_WALK_EABT;
>>> +    info->addr = addr;
>> so I guess also here the recorded address should be the IOVA (Jean's
>> previous comment)?
> This address maps to FetchAddr and not InputAddr, which is set from the
> calling function, so that should be correct. (besides event type as Jean
> mentioned it needs be fixed).
Ah OK I mixed them up. Sorry for the noise then

Eric
>
> Thanks,
> Mostafa
>
>> Eric
>>> +    return -EINVAL;
>>> +}
>>> +
>>>  /**
>>>   * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
>>>   * @cfg: translation config
>>> @@ -333,7 +365,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>>>   */
>>>  static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>>>                            dma_addr_t iova, IOMMUAccessFlags perm,
>>> -                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>>> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
>>> +                          SMMUState *bs)
>>>  {
>>>      dma_addr_t baseaddr, indexmask;
>>>      SMMUStage stage = cfg->stage;
>>> @@ -381,6 +414,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>>>                  goto error;
>>>              }
>>>              baseaddr = get_table_pte_address(pte, granule_sz);
>>> +            if (cfg->stage == SMMU_NESTED) {
>>> +                if (translate_table_addr_ipa(&baseaddr, cfg, info, bs)) {
>>> +                    goto error;
>>> +                }
>>> +            }
>>>              level++;
>>>              continue;
>>>          } else if (is_page_pte(pte, level)) {
>>> @@ -568,10 +606,8 @@ error:
>>>   * combine S1 and S2 TLB entries into a single entry.
>>>   * As a result the S1 entry is overriden with combined data.
>>>   */
>>> -static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
>>> -                                                SMMUTLBEntry *tlbe_s2,
>>> -                                                dma_addr_t iova,
>>> -                                                SMMUTransCfg *cfg)
>>> +static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
>>> +                        dma_addr_t iova, SMMUTransCfg *cfg)
>>>  {
>>>      if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
>>>          tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
>>> @@ -596,14 +632,19 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
>>>   * @perm: tentative access type
>>>   * @tlbe: returned entry
>>>   * @info: ptw event handle
>>> + * @bs: smmu state which includes TLB instance
>>>   *
>>>   * return 0 on success
>>>   */
>>>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>>> -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>>> +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs)
>>>  {
>>> +    int ret;
>>> +    SMMUTLBEntry tlbe_s2;
>>> +    dma_addr_t ipa;
>>> +
>>>      if (cfg->stage == SMMU_STAGE_1) {
>>> -        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
>>> +        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
>>>      } else if (cfg->stage == SMMU_STAGE_2) {
>>>          /*
>>>           * If bypassing stage 1(or unimplemented), the input address is passed
>>> @@ -621,7 +662,20 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>>>          return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
>>>      }
>>>  
>>> -    g_assert_not_reached();
>>> +    /* SMMU_NESTED. */
>>> +    ret = smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
>>> +    if (ret) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    ipa = CACHED_ENTRY_TO_ADDR(tlbe, iova);
>>> +    ret = smmu_ptw_64_s2(cfg, ipa, perm, &tlbe_s2, info);
>>> +    if (ret) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    combine_tlb(tlbe, &tlbe_s2, iova, cfg);
>>> +    return 0;
>>>  }
>>>  
>>>  SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>>> @@ -677,7 +731,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>>>      }
>>>  
>>>      cached_entry = g_new0(SMMUTLBEntry, 1);
>>> -    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info);
>>> +    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info, bs);
>>>      if (status) {
>>>              g_free(cached_entry);
>>>              return NULL;
>>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>>> index 1db566d451..cf0fd3ec74 100644
>>> --- a/include/hw/arm/smmu-common.h
>>> +++ b/include/hw/arm/smmu-common.h
>>> @@ -185,7 +185,7 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>>>   * pair, according to @cfg translation config
>>>   */
>>>  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>>> -             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
>>> +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs);
>>>  
>>>  
>>>  /*
