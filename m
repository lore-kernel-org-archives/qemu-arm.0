Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp641110ocs;
        Wed, 28 Sep 2022 16:38:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4EoGtZFAWfrjsenL9MwojQLDDBADZKXf+GKtOU7U4r0vVuNk/CpmALeLFogExaGMIQmwDh
X-Received: by 2002:a05:6214:76d:b0:4ac:a40a:a5c9 with SMTP id f13-20020a056214076d00b004aca40aa5c9mr461073qvz.118.1664408305962;
        Wed, 28 Sep 2022 16:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664408305; cv=none;
        d=google.com; s=arc-20160816;
        b=hNNW5zuDpesezaH4OkM3JQgAafMe2hgleOA40oU8ICwc3yTDqxHjjJfMKIH+rYaR86
         2oogm9jFIrZNRJiYV6aiQB5ox1x8SWed7A3JdKQc2GqYojZIIOE4aXqjQ5ZtE0S0j6wC
         YP1Wwx9x5SE2UfykC/yCq4lc0LZDclsiQ2LHdmO3S/k5Bely7sCdJQdOE/uyKWzHDOgn
         lkBzFauOQvninrf9H4rcQXb4UnO4rdAOGOc1ZCGmvFROAorMrCFigcCtEROzYhw6BuOT
         l2qkMpVnC6OBnq//BA/tCIwtBQDqwUm0IHdwrQTClq21FrD1nd6CJ6Y36ZL8ujuv5J0c
         SFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=lapJ13xQyXWjVW+b+BLgO3UNxEdHHe+9PvkX6MCIbjE=;
        b=dJdyUIoZ13RldJcqRjbM+znFEvYPmJZ+kFniYmabbF8BadB8G5ynPrkQTD6QJoWiju
         CCDW1DjFZ7zkAwKozRjjKxmyuKlvy5gmSn8RhJeb+qZKWCCs64PZ+Js7zuU4p/QU3rwq
         H4vgrY7LihW7LSGFktRPeOa8fzlW6hymRSyYd/7p/yp6GRPUjvVo2Zm2uftYISpiRdr8
         vccZQqDD9uYqm7UEPQx1ZlnlkMCENMuum7bzplFbGpvPkigfqz8jQXt3SGTaqtcTfPv4
         DT7h0TIifWeVcoEZojCqKbs2lofuI/kiEOpEmzziimlqTpi0n+eYJWnYfp2p+EGXLEgZ
         u9Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eIYTT2sZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a0cc391000000b004ad70bad071si2819080qvi.416.2022.09.28.16.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 16:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eIYTT2sZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odgdF-0000ps-Gj
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 19:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1odgd1-0000ov-Ji
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 19:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1odgcx-0003Ng-9z
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 19:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664408286;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lapJ13xQyXWjVW+b+BLgO3UNxEdHHe+9PvkX6MCIbjE=;
 b=eIYTT2sZZBX18raS43eLy03u7t8GLb7p+OtW8kzO97K2SEOgUi4DI7peS7V6FVyd11jtQ0
 PlnlycGUejjCdE4lEpSD28ZCqDu0ykPaaQO6wjt3dFJUtJ4+ybt5T/3vCb2Ge7KD1fqd5n
 +A16U5xmrZALFvwGXIycEZ1KGpOnqcg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-9DJAd7MjNqScZW95YsGz4g-1; Wed, 28 Sep 2022 19:38:03 -0400
X-MC-Unique: 9DJAd7MjNqScZW95YsGz4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 761F7802801;
 Wed, 28 Sep 2022 23:38:03 +0000 (UTC)
Received: from [10.64.54.143] (vpn2-54-143.bne.redhat.com [10.64.54.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D15DA40C206B;
 Wed, 28 Sep 2022 23:37:59 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] hw/arm/virt: Improve high memory region address
 assignment
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-5-gshan@redhat.com>
 <6c9a644a-6add-af29-8463-eddb101c1c99@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <580f5f69-d794-3792-2c99-5cb367a5e8c0@redhat.com>
Date: Thu, 29 Sep 2022 09:37:57 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <6c9a644a-6add-af29-8463-eddb101c1c99@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /1otcOQ7oWRo

Hi Eric,

On 9/28/22 10:51 PM, Eric Auger wrote:
> On 9/22/22 01:13, Gavin Shan wrote:
>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>> are floating on highest RAM address. However, they can be disabled
>> in several cases.
>>
>> (1) One specific high memory region is disabled by developer by
>>      toggling vms->highmem_{redists, ecam, mmio}.
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
>> reserved from the PA space for case (1), (2) and (3). In the code,
>> 'base' and 'vms->highest_gpa' are always increased for those three
>> cases. It's unnecessary since the assigned space of the disabled
>> high memory region won't be used afterwards.
>>
>> This improves the address assignment for those three high memory
>> region by skipping the address assignment for one specific high
>> memory region if it has been disabled in case (1), (2) and (3).
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 44 ++++++++++++++++++++++++++------------------
>>   1 file changed, 26 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b0b679d1f4..b702f8f2b5 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1693,15 +1693,31 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>>                                    hwaddr base, int pa_bits)
>>   {
>>       hwaddr region_base, region_size;
>> -    bool fits;
>> +    bool *region_enabled, fits;
> IDo you really need a pointer? If the region is unknown this is a bug in
> virt code.

The pointer is needed so that we can disable the region by setting 'false'
to it at later point. Yeah, I think you're correct that 'unknown region'
is a bug and we need to do assert(region_enabled), or something like below.

>>       int i;
>>   
>>       for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
>>           region_base = ROUND_UP(base, extended_memmap[i].size);
>>           region_size = extended_memmap[i].size;
>>   
>> -        vms->memmap[i].base = region_base;
>> -        vms->memmap[i].size = region_size;
>> +        switch (i) {
>> +        case VIRT_HIGH_GIC_REDIST2:
>> +            region_enabled = &vms->highmem_redists;
>> +            break;
>> +        case VIRT_HIGH_PCIE_ECAM:
>> +            region_enabled = &vms->highmem_ecam;
>> +            break;
>> +        case VIRT_HIGH_PCIE_MMIO:
>> +            region_enabled = &vms->highmem_mmio;
>> +            break;
> While we are at it I would change the vms fields dealing with those
> highmem regions and turn those fields into an array of bool indexed
> using i - VIRT_LOWMEMMAP_LAST (using a macro or something alike). We
> would not be obliged to have this switch, now duplicated.

It makes sense to me. How about to have something like below in v4?

static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms, int index)
{
     bool *enabled_array[] = {
           &vms->highmem_redists,
           &vms->highmem_ecam,
           &vms->highmem_mmio,
     };

     assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));

     return enabled_array[index - VIRT_LOWMEMMAP_LAST];
}

>> +        default:
>> +            region_enabled = NULL;
>> +        }
>> +
>> +        /* Skip unknown region */
>> +        if (!region_enabled) {
>> +            continue;
>> +        }
>>   
>>           /*
>>            * Check each device to see if they fit in the PA space,
>> @@ -1710,23 +1726,15 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>>            * For each device that doesn't fit, disable it.
>>            */
>>           fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>> -        if (fits) {
>> -            vms->highest_gpa = region_base + region_size - 1;
>> -        }
>> +        if (*region_enabled && fits) {
>> +            vms->memmap[i].base = region_base;
>> +            vms->memmap[i].size = region_size;
>>   
>> -        switch (i) {
>> -        case VIRT_HIGH_GIC_REDIST2:
>> -            vms->highmem_redists &= fits;
>> -            break;
>> -        case VIRT_HIGH_PCIE_ECAM:
>> -            vms->highmem_ecam &= fits;
>> -            break;
>> -        case VIRT_HIGH_PCIE_MMIO:
>> -            vms->highmem_mmio &= fits;
>> -            break;
>> +            vms->highest_gpa = region_base + region_size - 1;
>> +            base = region_base + region_size;
>> +        } else {
>> +            *region_enabled = false;
>>           }
>> -
>> -        base = region_base + region_size;
>>       }
>>   }
>>   

Thanks,
Gavin

