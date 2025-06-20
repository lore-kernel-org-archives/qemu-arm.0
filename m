Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp698968njc;
        Thu, 19 Jun 2025 23:52:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRbTpNgzhjBlfGaBL5/y3bK5L6OHmSwb+8pf18l1T231UUnQP+qUpEpj16+ARgliJ8k8sc8EecOAVWig==@linaro.org
X-Google-Smtp-Source: AGHT+IESlVnLBLqy1HBCOssD+arMIYKNMywDOUIxlQhk8OjO8gPx/Gi/HfgCJz6zT60pBB3F+A1D
X-Received: by 2002:a05:620a:7009:b0:7d3:8b7a:39c2 with SMTP id af79cd13be357-7d3f9923fadmr323267285a.36.1750402341373;
        Thu, 19 Jun 2025 23:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750402341; cv=none;
        d=google.com; s=arc-20240605;
        b=kbq2zrldTrLeMQgdaP5kDNpgYVWhd5+LNKTVGwsk+94uxBUUVzB2SNbOz93/+dNxla
         Tsn7J4KiUfRT86LoHyILBin1E5cCK2hfzOFJV8jacOutuFy1PHBxbverkvKunF3E/xEJ
         G3DgclhVEr6yfpWDaL5Sj+N+8EHsiBIt5Jp3EdawAn5oMaktUcftxpnFEWoUVSOyz+Js
         kHBo3K0zZYZz/FZBh6klrh8HS3RF10/AKJoryK51gvZpeoDvWwZIxq62LNbvvz+sjxSK
         vOmJ1JDFjk3lHLNmUvMYh5gaKgWL5WptDhS7ISW8liPpw3/CXIKDiFHcQ6soZ6Qi4Z0u
         8pjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=cNd8pxyRKBYHOOxHPV6siKNUfLozEByTZ8WWKyQJIow=;
        fh=oCiNuiJg7r82TE+YgSWVzSaI81b/f1v8/eONbGzlriE=;
        b=dzzyRHGBl/Eqj5sumyd+dgxsZcBrJmm0IdpuYCuZbNNeqSh4Ji1e3elQQftndsmDby
         3jJGTeUVg+NVoxlrO+YvctxSUfMzT7WyEj3wzLjovte6oBWpv9Lj62MSDW20U3ISuaJi
         WWefey0AYNCXcOWrmB8HnPeKFgqysRLp+z8FK2beFvZ5USByiI9+rhm6LG1qcIv0Z+D8
         lP/9DwAvE8BC+KPMjTxMREmYIHnfRime8jS17BoWUQABa3tbuMqKAUh2yfktKB2v5daL
         QoxgFKjEOtGbiuqiwhMnHN9ZVpAQkZsOlE4MfFXOE3wLhddRBmUwcW+N+KjeSFjbyT/W
         N1ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=inCcF0kk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f99fbe8asi111393285a.330.2025.06.19.23.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=inCcF0kk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750402341;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNd8pxyRKBYHOOxHPV6siKNUfLozEByTZ8WWKyQJIow=;
	b=inCcF0kkYoUo5/e9rMDeiqnmmqM+Fdj5Dg/8cFybasnfGx0/vB+sHQkVeBvyNDLfLfydcr
	3+JzvWx32BIqBCkp08wctNfVJyQZNMMGfY/PvoAEIXSf0cdnLzwVju5QZsXV5/wilsnlqf
	6yi4f6NyW9ovfcgRL7flFcGM/hfe/I4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-gR5A_bUPOq6GlkDZiYTCFQ-1; Fri, 20 Jun 2025 02:52:19 -0400
X-MC-Unique: gR5A_bUPOq6GlkDZiYTCFQ-1
X-Mimecast-MFC-AGG-ID: gR5A_bUPOq6GlkDZiYTCFQ_1750402338
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450df53d461so12901725e9.1
        for <alex.bennee@linaro.org>; Thu, 19 Jun 2025 23:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402338; x=1751007138;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNd8pxyRKBYHOOxHPV6siKNUfLozEByTZ8WWKyQJIow=;
        b=j2ZLWNabtU7Ax1b1kw2/DqioaHUqPwLrzKeSEfZV8VWUXg6KkKs1kBzn3g65S46keN
         FdxKSTcgdbYDRevpRwe1YaaoADl5yLQdQgcybdpa+MRKhYdXYpAjmH078XqYVWlo5iRJ
         6uJdk2/ZjsMcN8F13ZfbllIlzp0xUZhZdXukc6afX/l2WLre4hHrziGM2q8HR5SCiyRt
         z8wzARP4ZRzSfme9BGSVSk5koulMEfAEv/WokR0nu3e72IWxdkPILO5Q+oZGqHXW9qxS
         RuSAdLqa2fhsd2l1d02YFFQE22UAGTCIMB35KGEZJQio0Uuva+YeU+h0ZVsajZRNBPAs
         n4bw==
X-Forwarded-Encrypted: i=1; AJvYcCWvGd3kbpXTNwB3TKfIjKCm4UzqsJs0MlJ6uIzzu0a6+4glCMKZfUUr7IOzc7Ggk2wnX48Lx/0qB8hoWg==@linaro.org
X-Gm-Message-State: AOJu0YzhhUU7cSQv8YZWHn6r9R8i/S+t7a4QiDa1LTN3HgFcPNqRjDBw
	nduPmqTqUT136GxBkgPCIGU0ECJN2RJM0TY7f/lcOey8uxcWRHgHlsQABz5lA5ZTTHD1e/ltRAW
	MVjG76p+eZT6OvdT5lPtLWlVWJvpNO5ByiOdDFhOTgM68RmxslcbVY+zOXA==
X-Gm-Gg: ASbGnctOr6kEIRq73ng3e8GkA864ffjJ62FoKe3rV1o9ZYC5IWm5fAgPAUo9nIWu3xJ
	2UjoS2icB6xFI98hKo8A7gh2XZK5Bmg2rkokilHhYbkopMdiQM8h8MkI+X3Khwa7aeLc1nKh+Sh
	fhw/5FM40beKAafazWdLlgeVcWCqWS8XOuAb1xiPihxyJ8Nhdb4bfVcp4orAptr1wCLj+s6V9F6
	e3/rt245wspwaW310SxuNmgmP8m26qhEbxX0zolsF6h9PkSYW4iOn8cEdzNmUossaTBf36K5nTd
	0CMN6g3BAX+zhB9knGYnxRWDceagPY0QOBBdlRi+mEHSRnYTxqJGM8TEMe3ivTsjg7Xbbw==
X-Received: by 2002:a05:600c:1c83:b0:453:5c30:a2c2 with SMTP id 5b1f17b1804b1-453659ca60fmr11824035e9.8.1750402338345;
        Thu, 19 Jun 2025 23:52:18 -0700 (PDT)
X-Received: by 2002:a05:600c:1c83:b0:453:5c30:a2c2 with SMTP id 5b1f17b1804b1-453659ca60fmr11823825e9.8.1750402337887;
        Thu, 19 Jun 2025 23:52:17 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d11920ebsm1213118f8f.94.2025.06.19.23.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 23:52:17 -0700 (PDT)
Message-ID: <34f801fd-2439-4042-baa0-3bc060104ec9@redhat.com>
Date: Fri, 20 Jun 2025 08:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 4/8] hw/arm/virt-acpi-build: Fix comment in build_iort
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-5-gustavo.romero@linaro.org>
 <db5aa1ab-cec7-4de1-b14f-bba978e7d7f7@redhat.com>
 <53c901c4-f408-43f6-a9aa-49f8fed59e98@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <53c901c4-f408-43f6-a9aa-49f8fed59e98@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IWxnW433o4vxiBHO3YmOqs0pQLcIjEJAI78k9nf7Jn0_1750402338
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jNw3ufOcv9X9

Hi Gustavo,

On 6/19/25 7:07 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 6/17/25 10:22, Eric Auger wrote:
>> Hi Gustavo,
>>
>> On 6/16/25 3:18 PM, Gustavo Romero wrote:
>>> The comment about the mapping from SMMU to ITS is incorrect and it
>>> reads
>>> "RC -> ITS". The code in question actually maps SMMU -> ITS, so the
>>> mapping in question is not direct. The direct mapping, i.e., RC -> ITS,
>>> is handled a bit further down in the code, in the else block, and we
>>> take the opportunity to update that as well, adding "RC -> ITS" to the
>>> text so it's easier to see it's the direct map to the ITS Group node.
>>>
>>> Signed-off-by Gustavo Romero <gustavo.romero@linaro.org>
>>> ---
>>>   hw/arm/virt-acpi-build.c | 14 +++++++++-----
>>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 9eee284c80..6990bce3bb 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -407,23 +407,27 @@ build_iort(GArray *table_data, BIOSLinker
>>> *linker, VirtMachineState *vms)
>>>       if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>>           AcpiIortIdMapping *range;
>>>   -        /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3
>>> -> ITS */
>>> +        /* Map RIDs (input) from RC to SMMUv3 nodes: RC -> SMMUv3. */
>> yes this is what the code builds at this location.
>>>           for (i = 0; i < smmu_idmaps->len; i++) {
>>>               range = &g_array_index(smmu_idmaps, AcpiIortIdMapping,
>>> i);
>>> -            /* output IORT node is the smmuv3 node */
>>> +            /* Output IORT node is the SMMUv3 node. */
>>>               build_iort_id_mapping(table_data, range->input_base,
>>>                                     range->id_count, smmu_offset);
>>>           }
>>>   -        /* bypassed RIDs connect to ITS group node directly: RC
>>> -> ITS */
>>> +        /* Map DeviceIDs (input) from SMMUv3 to ITS Group nodes:
>>> SMMU -> ITS. */
>> But here I am confused. To me the its_idmaps matches the idmap between
>> RC and ITS. I understand this is built from holes left by bypassed
>> buses. See the build_iort() implementation. The comment at
>
> ah, thanks! I see. Indeed, it's mapping the RC -> ITS, not the SMMU ->
> ITS.
> I'll fix it in v5.
>
> One thing that confused me, which I think is actually ok, is that the
> output ID range from SMMU 0x000-0xFFFF) overlaps the output ID range
> from the RC (e.g. 0x100-0xFFFF) because the SMMU output range is
> defined as
> always taking the whole 16-bit range in:

Agreed. However I think it is fine because those are ID mappings between
different input/output space pairs.
RC ->          ITS
      SMMU ->  ITS
>
> [...]
>    366         build_append_int_noprefix(table_data, irq + 1, 4); /*
> PRI */
>    367         build_append_int_noprefix(table_data, irq + 3, 4); /*
> GERR */
>    368         build_append_int_noprefix(table_data, irq + 2, 4); /*
> Sync */
>    369         build_append_int_noprefix(table_data, 0, 4); /*
> Proximity domain */
>    370         /* DeviceID mapping index (ignored since interrupts are
> GSIV based) */
>    371         build_append_int_noprefix(table_data, 0, 4);
>    372
>    373         /* output IORT node is the ITS group node (the first
> node) */
>    374         build_iort_id_mapping(table_data, 0, 0x10000,
> IORT_NODE_OFFSET); <=========== HERE
>    375     }
>    376
>    377     /* Table 17 Root Complex Node */
>
>
> I think that's ok since ITS can disambiguate the Device IDs from SMMU
> and from RC.
>
>
>>          /*
>>           * Split the whole RIDs by mapping from RC to SMMU,
>>           * build the ID mapping from RC to ITS directly.
>>           */
>>          for (i = 0; i < smmu_idmaps->len; i++) {
>>              idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>>
>>              if (next_range.input_base < idmap->input_base) {
>>                  next_range.id_count = idmap->input_base -
>> next_range.input_base;
>>                  g_array_append_val(its_idmaps, next_range);
>>              }
>>
>>              next_range.input_base = idmap->input_base +
>> idmap->id_count;
>>          }
>>
>> is not crystal clear but it looks like filling the holes into its_idmap.
>
> k, I'll create a helper as you suggested in 7/8 to populate the
> its_idmaps.
>
>  > Besides there is another "Its group" instance to be replaced by ITS
> Group
>
> Pardon, what do you mean? Another text to be replaced or it's just a
> comment
> about the "else" block when smmu is off?
sorry, I meant another string to be replaced in the file

Cheers

Eric
>
> Thanks!
>
>
> Cheers,
> Gustavo
>
>> Eric
>>
>>>           for (i = 0; i < its_idmaps->len; i++) {
>>>               range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
>>> -            /* output IORT node is the ITS group node (the first
>>> node) */
>>> +            /* Output IORT node is the ITS Group node (the first
>>> node). */
>>>               build_iort_id_mapping(table_data, range->input_base,
>>>                                     range->id_count, IORT_NODE_OFFSET);
>>>           }
>>>       } else {
>>> -        /* output IORT node is the ITS group node (the first node) */
>>> +        /*
>>> +         * Map bypassed RIDs (input) (don't go through the SMMU) to
>>> ITS Group
>>> +         * nodes: RC -> ITS.
>>> +         * Output IORT node is the ITS Group node (the first node).
>>> +         */
>>>           build_iort_id_mapping(table_data, 0, 0x10000,
>>> IORT_NODE_OFFSET);
>>>       }
>>>   
>>
>
