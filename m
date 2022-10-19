Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp712466ejn;
        Wed, 19 Oct 2022 15:59:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5JUdF5OGQwUQ6zR2mCydO+AhdLLppaahxL6G/N9OuYOfQo9qcBqnqg3u4u0MPqjPlJ3OKT
X-Received: by 2002:a05:620a:bcd:b0:6ef:350:db45 with SMTP id s13-20020a05620a0bcd00b006ef0350db45mr138637qki.365.1666220366797;
        Wed, 19 Oct 2022 15:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666220366; cv=none;
        d=google.com; s=arc-20160816;
        b=U+rzUYuy2NeG27UgdjrxX+XKpwEmxinRF5soeni1WIs9cxiK9RWMRrDVZzy352hDR2
         F/MR+2kNw+fhejgVVa+fNoorhigTTgP+oXiwT5KZH7cNwokRE4dVN6uPr0fIFuZfnTRP
         W6lgcHdfGh0jjut1BVVZzBJJQzFPK11gLxcViE2Hy1p+QQIAvnd4zj6vdUKMnw8NK0Qo
         7hnZbF8QpmVLfa2PWI828AwjH4VLh2C36GbPfUq9ar4T0N360RrUYKAH2keZwF3fF3+B
         ERfO+1IDMPVE0XPmHOo7GHu41ZMfnEFU7dq0XOQnBgqsdOgtVZPiZwQyXUJinBgH+P83
         JXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=gDsYHxpn4vI6uXvzOx8x1hrM82leFIjji4u/R8LZ/uU=;
        b=uDeGwS5y6wn/euDD4VWBDc/c3dn3IgVMgGs0oc1poS73ORy/OztnCQbmn5AUl1f/Pj
         RzHZX8fhlxuNLzFpxJHbqisQwPOL15bBkmFkiL36HvesQEAbX3urc9lfe7yEL95JQ6P3
         bKUvnfiCPP8wTklrsPqqm63tuAv9dV1ua9w/mUIr5B/VC12hRn6a+rCHcMa2ZZrZQKCl
         gBz0gzE9IcEyGeYfDxS+SXoxKalQmW0vpSJhMbi1gB6BUa5NFwRBU0tUlzpXw8aWe+Bt
         MmDSorej/1nCtaRrZDPXF1J1abhPdcNGH2yBMk82DSEj+kSkLSlEVhfaDXjEAyUxsxWH
         5Vsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Cnqb/LwR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z188-20020a3765c5000000b006cf22d71dc9si8692077qkb.490.2022.10.19.15.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 15:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Cnqb/LwR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olI22-0000mO-9N
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 18:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olI1P-0000l2-N6
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 18:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1olI1N-000855-L8
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 18:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666220321;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDsYHxpn4vI6uXvzOx8x1hrM82leFIjji4u/R8LZ/uU=;
 b=Cnqb/LwRnpB/Z4CHTgLCLrvMSAS41mc4xr7/CcVODloMccXmMBEjmPydpakEwM29Lck555
 pd/x22DDgMruqmZ1hxa2TuhhWVpm+/Pv/sMOfK7Gm0nK1P0pAizAsbMCgyxKt4iQhsT9oC
 rSphrRpFLYTjI2Zf7CG295fK8xcLkP4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-0QHn9OGIP_6QGU8CQehA3w-1; Wed, 19 Oct 2022 18:58:37 -0400
X-MC-Unique: 0QHn9OGIP_6QGU8CQehA3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 367DD185A78B;
 Wed, 19 Oct 2022 22:58:37 +0000 (UTC)
Received: from [10.64.54.70] (vpn2-54-70.bne.redhat.com [10.64.54.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83A5E40C6EC2;
 Wed, 19 Oct 2022 22:58:33 +0000 (UTC)
Subject: Re: [PATCH v5 5/6] hw/arm/virt: Improve high memory region address
 assignment
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-6-gshan@redhat.com>
 <73b398c9-52d7-88fa-7e84-f9ed082799b0@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <972791b6-a9ff-9014-28db-ed6554586027@redhat.com>
Date: Thu, 20 Oct 2022 06:58:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <73b398c9-52d7-88fa-7e84-f9ed082799b0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZMy3Rj56HG9r

Hi Eric,

On 10/20/22 4:07 AM, Eric Auger wrote:
> On 10/12/22 01:18, Gavin Shan wrote:
>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>> are floating on highest RAM address. However, they can be disabled
>> in several cases.
>>
>> (1) One specific high memory region is disabled by developer by
>>      toggling vms->highmem_{redists, ecam, mmio}.
> I would replace the above sentence by
> 
> One specific high memory region is likely to be disabled by the code by toggling vms->highmem_{redists, ecam, mmio}:
> 

Ok.

>>
>> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>      'virt-2.12' or ealier than it.
>>
>> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>      on 32-bits system.
>>
>> (4) One specific high memory region is disabled when it breaks the
>>      PA space limit.
>>
>> The current implementation of virt_set_memmap() isn't comprehensive
>> because the space for one specific high memory region is always
>> reserved from the PA space for case (1), (2) and (3).
> I would suggest:
> isn't optimized because the high memory region PA range is always
> 
> reserved whatever the actual state of the corresponding vms->highmem_
> * flag.
> 

Ok. I will have something like below in next revision.

   The current implementation of virt_set_{memmap, high_memmap}() isn't
   optimized because the high memory region's PA space is always reserved,
   regardless of whatever the actual state in the corresponding
   vms->highmem_{redists, ecam, mmio} flag. In the code, ....

>>   In the code,
>> 'base' and 'vms->highest_gpa' are always increased for those three
>> cases. It's unnecessary since the assigned space of the disabled
>> high memory region won't be used afterwards.
>>
>> This improves the address assignment for those three high memory
> s/This improves/Improve

Ok.

>> region by skipping the address assignment for one specific high
>> memory region if it has been disabled in case (1), (2) and (3).
>> 'vms->high_compact' is false for now, meaning that we don't have
> s/hight_compat/highmem_compact
> 
> You also may justify the introduction of this new field.

Thanks. It should be 'highmem_compact'. Yes, it makes sense to
justify the addition of 'vms->highmem_compact'. I will have something
like below in next revision.

   The memory layout may be changed after the improvement is applied, which
   leads to potential migration breakage. So 'vms->highmem_compact' is added
   to control if the improvement should be applied. For now, 'vms->highmem_compact'
   is set to false, meaning that we don't have memory layout change until it
   becomes configurable through property 'compact-highmem' in next patch.

>> any behavior changes until it becomes configurable through property
>> 'compact-highmem' in next patch.
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
>> ---
>>   hw/arm/virt.c         | 23 +++++++++++++++--------
>>   include/hw/arm/virt.h |  1 +
>>   2 files changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index ee98a8a3b6..c05cfb5314 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1717,22 +1717,29 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>>           region_base = ROUND_UP(base, extended_memmap[i].size);
>>           region_size = extended_memmap[i].size;
>>   
>> -        vms->memmap[i].base = region_base;
>> -        vms->memmap[i].size = region_size;
>> -
>>           /*
>>            * Check each device to see if they fit in the PA space,
> while we are at it, you can change s/they fit/it fits

Agreed.

>> -         * moving highest_gpa as we go.
>> +         * moving highest_gpa as we go. For compatibility, move
>> +         * highest_gpa for disabled fitting devices as well, if
>> +         * the compact layout has been disabled.
>>            *
>>            * For each device that doesn't fit, disable it.
>>            */
>>           fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>> -        if (fits) {
>> +        if (*region_enabled && fits) {
>> +            vms->memmap[i].base = region_base;
>> +            vms->memmap[i].size = region_size;
>>               vms->highest_gpa = region_base + region_size - 1;
>> +            base = region_base + region_size;
>> +        } else {
>> +            *region_enabled = false;
>> +            if (!vms->highmem_compact) {
>> +                base = region_base + region_size;
>> +                if (fits) {
>> +                    vms->highest_gpa = region_base + region_size - 1;
>> +                }
>> +            }
>>           }
>> -
>> -        *region_enabled &= fits;
>> -        base = region_base + region_size;
>>       }
>>   }
> This looks quite complicated to me. It is not obvious for instance we
> have the same code as before when highmem_compact is not set. Typically
> 
> vms->memmap[i].base/size are not always set as they were to be and impact on the rest of the code must be double checked.
> 
> Could this be rewritten in that way (pseudocode totally untested).
> 
> 
> static void fit_highmem_slot(vms, *base, i, pa_bits)
> {
>      region_enabled = virt_get_high_memmap_enabled(vms, i);
>      region_base = ROUND_UP(*base, extended_memmap[i].size);
>      region_size = extended_memmap[i].size;
>      fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>      *region_enabled &= fits;
>      vms->memmap[i].base = region_base;
>      vms->memmap[i].size = region_size;
> 
>      /* compact layout only allocates space for the region if this latter
> is enabled & fits*/
>      if (vms->highmem_compact && !region_enabled) {
>          return;
>      }
> 
>      /* account for the region and update the base address/highest_gpa if
> needed*/
>      *base = region_base + region_size;
>      if (fits) {
>          vms->highest_gpa = *base - 1;
>      }
> }
> 
> static void virt_set_high_memmap(VirtMachineState *vms,
>                                   hwaddr base, int pa_bits)
> {
>      hwaddr region_base, region_size;
>      bool *region_enabled, fits;
>      int i;
> 
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
>          /* we do not break in case the region does not fit since
> fit_highmem_slot also updates the enabled status of the region */
>          fit_highmem_slot(vms, &base, i, pa_bits);
>      }
> }
> 
>>   
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 6ec479ca2b..709f623741 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -144,6 +144,7 @@ struct VirtMachineState {
>>       PFlashCFI01 *flash[2];
>>       bool secure;
>>       bool highmem;
>> +    bool highmem_compact;
>>       bool highmem_ecam;
>>       bool highmem_mmio;
>>       bool highmem_redists;

I checked it again. When the corresponding high memory region is disabled, skipping to
setting vms->memmap[i].base/size won't affect the left code.

I would avoid introducing another helper here, meaning I want to squeeze everything
into existing virt_set_high_memmap(). With additional helper, there are too many
function calls in the stack to accomplish this sort of simple task (address assignment
for high memory regions). Without the additional helper, the changes can be simply as
below.

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ee98a8a3b6..da9e23a8ad 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1721,18 +1721,23 @@ static void virt_set_high_memmap(VirtMachineState *vms,
          vms->memmap[i].size = region_size;
  
          /*
-         * Check each device to see if they fit in the PA space,
-         * moving highest_gpa as we go.
+         * Check each device to see if it fits in the PA space,
+         * moving highest_gpa as we go. For compatibility, move
+         * highest_gpa for disabled fitting devices as well, if
+         * the compact layout has been disabled.
           *
           * For each device that doesn't fit, disable it.
           */
          fits = (region_base + region_size) <= BIT_ULL(pa_bits);
-        if (fits) {
-            vms->highest_gpa = region_base + region_size - 1;
+        *region_enabled &= fits;
+        if (vms->highmem_compact && !*region_enabled) {
+            continue;
          }
  
-        *region_enabled &= fits;
          base = region_base + region_size;
+       if (fits) {
+               vms->highest_gpa = region_base + region_size - 1;
+       }
      }
  }

Thanks,
Gavin


