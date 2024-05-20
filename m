Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1298804ejb;
        Mon, 20 May 2024 01:20:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLfQkUFy6a1UC7asO/5wYWwA7/5FsP4ARFl+RsmDwnMrAig9X7Hb3JXYiesoQOLAbKTSEntXpdq61g+yxhkoPLmDsiTFgp
X-Google-Smtp-Source: AGHT+IF90HHaud+VhmLsBGIFXFi3wSJjMzpqKozti9eyjD/bfBIpOJ8iixhpoyPDri4q5OsJ8hbv
X-Received: by 2002:a05:622a:c4:b0:43d:fd2b:30a1 with SMTP id d75a77b69052e-43dfdb1eb48mr366872181cf.7.1716193251702;
        Mon, 20 May 2024 01:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716193251; cv=none;
        d=google.com; s=arc-20160816;
        b=Zj2xSIkGodYnZXh+LX0V5psOk13Zjd48f4tjm1dATw/blzqg1En1XO3YGI4hvPyQVa
         PnuBVZGUHzb1Sq61sQLyjJN26hOkTut/MCtOa70MaBqbIXbiB+YNFowFY4XDmhuY8ofr
         I8asQUoYBZ+wM0AApfI19ksZA1CKVLph7oWv1mi8PNE/86y98Wiv4Vf7pW5QIyhFULMN
         c8Lv12WjBlWmc4jxFDeU7oWBXxnAlc39dznImXC6UqVq9hcjZmyY13QsoUsFGmBWkHfc
         0DcPRPVaaBDMV3H8I7FR4Bk5tI7bogEJMm/wYx69a8xV0E1sl3w8rF5zIxLjO1c8sVZu
         ZaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Cr8VAKzTFUmlB9QS202+Ns4uqgwSfbIvEtGycUMDgjs=;
        fh=/D7hXkfGkH9YbSYwUGUAug1gp5pkoxyK1p4GAI1JfGQ=;
        b=GerbrcQz5dX2me489Ak2xMcSgi60FDIeUoH5S/ghXdp50JTwM7RNihFH0Z/KREQHc8
         HFr3MzKgs0fXHYD/Mt6PL8xzsIVYjmIgxx87YSU+T6ADUwvGsWM4XvvBHFRg44hd+VET
         B8/zhPFSUiyrAV3vl6MR8cPbwCHgzJH7IzZKv0PNlQz/GfAkDv6O3E++fMKgKUjrYknA
         8CZEbVxmqyvbmSTks+JhzoyfUFKZmXF2DuUSzM+cn/oUq7apH7WsjXf+1kSTWV7au8zx
         IT4RXy3mF2Gz9BFHZ7Vp/1+OA2IurSKGUf+YOsclXIrKCFW4X/apI60WF91jEPvCKX+7
         aigg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OeKiBDWI;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-43df56c97f4si78871641cf.632.2024.05.20.01.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 01:20:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OeKiBDWI;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716193251;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cr8VAKzTFUmlB9QS202+Ns4uqgwSfbIvEtGycUMDgjs=;
	b=OeKiBDWIuuKMOUwTEr5C0kYnnExBJZ8hjX6tBT7PskKdaRmvVJ3vpq5XYjLIGPtm9Oc52m
	jKQlrDTI8a7aSVxxGhgBb2eH0ja6w3koaWhilcGnJusaVULg4ZGd3JKe0Jwl7wpxnlIHxA
	tWz8nCavfGWTdfsXG+3IGMJEOy48NLY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-02rS3xgPOp-EQN8qgzlXXg-1; Mon, 20 May 2024 04:20:48 -0400
X-MC-Unique: 02rS3xgPOp-EQN8qgzlXXg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6a9fb6a3c70so9955336d6.3
        for <alex.bennee@linaro.org>; Mon, 20 May 2024 01:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716193247; x=1716798047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cr8VAKzTFUmlB9QS202+Ns4uqgwSfbIvEtGycUMDgjs=;
        b=a5gAErfHekaDCSOX6K5BJgiX4Y64NcK2/hJ14kR1qjwhY78apq+p7dvHyP7G73/wJz
         gG8tOTlU/BLwoJztqwzJjFdLC3LHZE0LM6GWWE3z8rbzVn3gpcDSzn8hyJS6mZBjmCmj
         /LG1rPYds3fapbOr1sUlONc6q6sI9EbitginbX+G6fyH/BZtGm27BFfKDBqP735xhHfq
         SDzPXl+R1X7PkE8Pfvjoc+ZhLMv1fj1GDIBSFMvUrEAMVZrjCM4/5ajVh5PTT/ZH8j32
         30coSppMGQpXWf8c3nle3+P3/mfKzj1WXScGU0zkDupa0txlax4F1+8h8DSwbgeNh25f
         4v5w==
X-Forwarded-Encrypted: i=1; AJvYcCXcIeb3B2+QhztPceqIZgiSNcRUhSHRzb9+FTLnXIgy34CoeYUIC8Jy6DuxijAE7NAN6URJu3YeuGHt6y5UuHxawsQ6MFH5
X-Gm-Message-State: AOJu0YxVNbvgdE0BKtbhfCNSG1i8ZbWt6XhqsXvstt7RHApXOdUEOUd2
	rtPv6uH8yynrVUr/Z9m1CjdghXB7QC8YkiMUSXIX6czJhpgdgBkVBHid36QExO6A4CJmSTMX5r8
	VsZBXjjSHFSmxCYZvNIdtPjcg0vty6kP0fIOiMEqg7oAFTEfrpedySA==
X-Received: by 2002:a05:6214:5d0f:b0:6a9:69af:83f2 with SMTP id 6a1803df08f44-6a969af8da9mr42996446d6.48.1716193247416;
        Mon, 20 May 2024 01:20:47 -0700 (PDT)
X-Received: by 2002:a05:6214:5d0f:b0:6a9:69af:83f2 with SMTP id 6a1803df08f44-6a969af8da9mr42996286d6.48.1716193246935;
        Mon, 20 May 2024 01:20:46 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f194d2esm109644856d6.68.2024.05.20.01.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 01:20:46 -0700 (PDT)
Message-ID: <6b41c718-7e02-4a3d-adf8-a56306ab68d9@redhat.com>
Date: Mon, 20 May 2024 10:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 08/18] hw/arm/smmu-common: Add support for nested
 TLB
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-9-smostafa@google.com>
 <dc8d52ac-68af-4426-9a60-07ad909c86b0@redhat.com>
 <ZkYkTgDztEyX6GT_@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZkYkTgDztEyX6GT_@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0pIakBPCooAh

Hi Mostafa,
On 5/16/24 17:20, Mostafa Saleh wrote:
> Hi Eric,
>
> On Wed, May 15, 2024 at 03:48:05PM +0200, Eric Auger wrote:
>> Hi Mostafa,
>>
>> On 4/29/24 05:23, Mostafa Saleh wrote:
>>> This patch adds support for nested(combined) TLB entries.
>> space between nested and (.
> Will do.
>>> The main function combine_tlb() is not used here but in the next
>>> patches, but to simplify the patches it is introduced first.
>>>
>>> Main changes:
>>> 1) New entry added in the TLB, parent_perm, for nested TLB, holds the
>> s/entry/field, s/TLB/SMMUTLBEntry struct
> Will do.
>>>    stage-2 permission, this can be used to know the origin of a
>>>    permission fault from a cached entry as caching the “and” of the
>>>    permissions loses this information.
>>>
>>>    SMMUPTWEventInfo is used to hold information about PTW faults so
>>>    the event can be populated, the value of stage (which maps to S2
>>>    in the event) used to be set based on the current stage for TLB
>> I don't understand "(which maps to S2 in the event)". What do you mean?
>> This could be S1 or S2 depending on the active stage, no?
> Not really, if the IPA size is larger than S2 input size, this is
> considered stage-1 fault.
>
> For TLB permission fault, yes, that is how it is decided.
> However, with nesting, a permission fault from a cached entry can be
> from a stage-1 or stage-2, that’s why we now cache both and not just
> the combined permission, and the logic to set fault stage is modified
> accordingly.
I meant in smmu_translate() we initially had for permission fault
info->stage = cfg->stage whcih can be S1 or S2. Hence the fact I do not
understand the sentence

the value of stage (which maps to S2 in the event)

I understand that with nested this computation needs to change because the permission can be linked to either the S1 or S2 stage.
Maybe that's just a matter or rephrasing?


>>>    permission faults, however with the parent_perm, it is now set
>>>    based on which perm has the missing permission
>>>
>>>    When nesting is not enabled it has the same value as perm which
>>>    doesn't change the logic.
>>>
>>> 2) As combined TLB implementation is used, the combination logic
>>>    chooses:
>>>    - tg and level from the entry which has the smallest addr_mask.
>> tbh I am scared bout swapping s1/s2 tg and level. In smmu_iotlb_lookup()
>> I see tt->granule_sz being used which is s1 data. I mean it is not
>> obvious to me this is correct. Could you maybe give more explanations
>> detailing why/how this is guaranted to work.
> As you mentioned the next patch reworks the lookup logic, I can reorder
> the 2 patches if that is better, please let me know what you think?
Yes if you manage to reorder that may be more logical because otherwise
it looks incorrect.
>
>> Can you give additional details about what s1+s2 combinations were tested?
> I tested with S1 and S2 4K pages
> S1 level = 3 and S2 level = 3
> S1 level = 2 and S2 level = 3
> S1 level = 3 and S2 level = 2
> S1 level = 1 and S2 level = 2
>
> And also tested with with S1 64K granule and S2 4K.
OK, I would suggest you mention that in the coverletter because it is
reassuring and the combination is not totally obvious - at least to me ;-) -

Eric
>
>>>    - Based on that the iova that would be cached is recalculated.
>>>    - Translated_addr is chosen from stage-2.
>>>
>>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>>> ---
>>>  hw/arm/smmu-common.c         | 32 ++++++++++++++++++++++++++++----
>>>  include/hw/arm/smmu-common.h |  1 +
>>>  2 files changed, 29 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>> index 21982621c0..0d6945fa54 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -394,7 +394,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>>>          tlbe->entry.translated_addr = gpa;
>>>          tlbe->entry.iova = iova & ~mask;
>>>          tlbe->entry.addr_mask = mask;
>>> -        tlbe->entry.perm = PTE_AP_TO_PERM(ap);
>>> +        tlbe->parent_perm = tlbe->entry.perm = PTE_AP_TO_PERM(ap);
>> nit: I would prefer on separate lines.
> Will do.
>
>>>          tlbe->level = level;
>>>          tlbe->granule = granule_sz;
>>>          return 0;
>>> @@ -515,7 +515,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>>>          tlbe->entry.translated_addr = gpa;
>>>          tlbe->entry.iova = ipa & ~mask;
>>>          tlbe->entry.addr_mask = mask;
>>> -        tlbe->entry.perm = s2ap;
>>> +        tlbe->parent_perm = tlbe->entry.perm = s2ap;
>>>          tlbe->level = level;
>>>          tlbe->granule = granule_sz;
>>>          return 0;
>>> @@ -530,6 +530,27 @@ error:
>>>      return -EINVAL;
>>>  }
>>>  
>>> +/* combine 2 TLB entries and return in tlbe in nested config. */
>> suggestion: combine S1 and S2 TLB entries into a single entry. As a
>> result the S1 entry is overriden with combined data.
> Will do.
>
>>> +static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
>>> +                                                SMMUTLBEntry *tlbe_s2,
>>> +                                                dma_addr_t iova,
>>> +                                                SMMUTransCfg *cfg)
>>> +{
>>> +    if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
>>> +        tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
>>> +        tlbe->granule = tlbe_s2->granule;
>>> +        tlbe->level = tlbe_s2->level;
>>> +    }
>>> +
>>> +    tlbe->entry.translated_addr = CACHED_ENTRY_TO_ADDR(tlbe_s2,
>>> +                                    tlbe->entry.translated_addr);
>>> +
>>> +    tlbe->entry.iova = iova & ~tlbe->entry.addr_mask;
>>> +    /* parent_perm has s2 perm while perm has s1 perm. */
>>  suggestion: while perm keeps s1 perm.
>>
> Will do.
>
> Thanks,
> Mostafa
>>> +    tlbe->parent_perm = tlbe_s2->entry.perm;
>>> +    return;
>>> +}
>>> +
>>>  /**
>>>   * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
>>>   *
>>> @@ -607,9 +628,12 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>>>  
>>>      cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
>>>      if (cached_entry) {
>>> -        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>>> +        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm &
>>> +            cached_entry->parent_perm & IOMMU_WO)) {
>>>              info->type = SMMU_PTW_ERR_PERMISSION;
>>> -            info->stage = cfg->stage;
>>> +            info->stage = !(cached_entry->entry.perm & IOMMU_WO) ?
>>> +                          SMMU_STAGE_1 :
>>> +                          SMMU_STAGE_2;
>>>              return NULL;
>>>          }
>>>          return cached_entry;
>>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>>> index 09d3b9e734..1db566d451 100644
>>> --- a/include/hw/arm/smmu-common.h
>>> +++ b/include/hw/arm/smmu-common.h
>>> @@ -77,6 +77,7 @@ typedef struct SMMUTLBEntry {
>>>      IOMMUTLBEntry entry;
>>>      uint8_t level;
>>>      uint8_t granule;
>>> +    IOMMUAccessFlags parent_perm;
>>>  } SMMUTLBEntry;
>>>  
>>>  /* Stage-2 configuration. */
>> Thanks
>>
>> Eric
>>
