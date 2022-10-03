Received: by 2002:a8a:84:0:0:0:0:0 with SMTP id s4csp379838ocq;
        Mon, 3 Oct 2022 01:47:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5yFl9YPQpkalUHLrsrZ60dQQBmCitViPtmB3rVEwVnV8YdFbS7Sri74GiXVakBJhdr5wbW
X-Received: by 2002:a05:622a:14d0:b0:35c:c205:7d25 with SMTP id u16-20020a05622a14d000b0035cc2057d25mr15101678qtx.5.1664786850792;
        Mon, 03 Oct 2022 01:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664786850; cv=none;
        d=google.com; s=arc-20160816;
        b=Z03kOhv0DF80EhJdyARXGAEtinfMCzSexA4Tkq/Ii5tAWvUYtzPuSyVxY741xriRRf
         55p1adz6HViKZuYEx+Ay9W7SYeUX971BAgindsKEx6Qjvzx+EWPViaBLqFDEjmM7Esvg
         a55yhH3flBk/96loBJTQ7MUqSfnJ7ZB6NaQsOf/zdOxdcsSFg0l2UAoZUfVkjk3QNnW9
         KFus/PFrzaUay9Xo3tbx1WpUAdYnLs134Emu+yzRBmigVxNY5s6lax/N3+tVTY2b3zy5
         mnkSlTvA7yfVZ9D5/g2gCoyBwelfhHVjgdp0EYK+3sN70dmPZpqIYMgRKyZY9FTPDjwZ
         jCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4V/i+l9/sq/mF1tL9S2pIjImKoIeYL66SPoerZSUsMg=;
        b=jRqHPpzYw+BshFjaTCZs8TSbiiCg6FCYZeTi/vaXH5gTJrSDNJ+zBNGmGe00NtjGed
         s2JBzK1rTmWc1OvdjsbqDx4vEXBJL/HRmrEhUcgyJGASSAXTtbHUusluJCMDE3pUbbzj
         XW8zESNBN7zccmXBfXk6Nue+V0bwUUxR3bZD/pysDc5XmI/QPz7XhSqtIuLTa18Z4an7
         1VYvYVrMdJ7xWCvOlokW4Lfvqxm68FQ1nz1kswBwkr0g3+1KpZgPvzBuuswu07CSX6qk
         SxVXnTBpTe6EvsP4EUqKLGiykG+e9dYVnotq2H/HR2CdDBFVe3StO0w7JCgmSednrDxR
         EMMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Be3OTycz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020a0562141d2500b004afa1446195si3995222qvd.243.2022.10.03.01.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 01:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Be3OTycz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofH6o-0007GA-96
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 04:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofH4W-0007Db-RW
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 04:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofH4U-0002oZ-NW
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 04:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664786706;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4V/i+l9/sq/mF1tL9S2pIjImKoIeYL66SPoerZSUsMg=;
 b=Be3OTyczmpgAZqttr/suczBqmBEogIRRyh79mYXDUKFjTjdYw27/r2J6/iHvPRIIKGwhx7
 3RV2LMzENvPT5mVpXlRBIgWR01zNHpnpbYytOehX3pdPkUnGttKMC0JvUiS8/XcMRJaqwd
 cVptkkdkeAUY5whmgf+NEtB3dx8ndX4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-qh8xrzXkNAite9cRMVB2sQ-1; Mon, 03 Oct 2022 04:45:04 -0400
X-MC-Unique: qh8xrzXkNAite9cRMVB2sQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 ly5-20020a0562145c0500b004af8e9c4d94so6531639qvb.0
 for <qemu-arm@nongnu.org>; Mon, 03 Oct 2022 01:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=4V/i+l9/sq/mF1tL9S2pIjImKoIeYL66SPoerZSUsMg=;
 b=qQkDRMkwylLiKCLVbRHhob1M25mfa5nNgdzP3gLYK8CnmGI2fVQ5q/1PjnGu0krGTJ
 r4m7175HXVNbwvMeXwr0CQ0NNVcwF0h0wvsV4lvuoR9dNL5kxQwCGDuf6Qm9pj4cRiRn
 FA4UilpOyKqbluUy5DEJ1UQzmJFsJx3wB8vTuPO6anv5ehoKnAF3hZe6VWncNmWduZQB
 qfCb8QLjecVRgGfk8dzuEDDW7XvKTW9aK8aKnXj1UG/xUrun0fY+XyiW0C9js835D3Wr
 RQKoSD+vOz07m3ET/kzUhrZ1R34ygsu4zcpcZdLrFz530PedEhP/sa3E3CPwQsG2WL4a
 Drmg==
X-Gm-Message-State: ACrzQf3tFqY3EfVTOpmaMfGwTWT+qSwOoUuaQSEXr5vDomXXtGq3rWJa
 twSf0zNzSJq8ARiCrNDdWzucN0GWuXd9w6ByuNxhXWCb9EHC3RxEs6af88asc4cQXK6iGCF1mVJ
 J1GrR5fuzCLZy
X-Received: by 2002:a05:622a:28e:b0:35d:498f:583a with SMTP id
 z14-20020a05622a028e00b0035d498f583amr15392765qtw.176.1664786703949; 
 Mon, 03 Oct 2022 01:45:03 -0700 (PDT)
X-Received: by 2002:a05:622a:28e:b0:35d:498f:583a with SMTP id
 z14-20020a05622a028e00b0035d498f583amr15392755qtw.176.1664786703696; 
 Mon, 03 Oct 2022 01:45:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a05620a440300b006a6ab259261sm11553290qkp.29.2022.10.03.01.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 01:45:03 -0700 (PDT)
Message-ID: <8ff4a537-3050-7c28-4f2d-8e1771e1e3a4@redhat.com>
Date: Mon, 3 Oct 2022 10:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] hw/arm/virt: Improve high memory region address
 assignment
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-5-gshan@redhat.com>
 <6c9a644a-6add-af29-8463-eddb101c1c99@redhat.com>
 <580f5f69-d794-3792-2c99-5cb367a5e8c0@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <580f5f69-d794-3792-2c99-5cb367a5e8c0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.086, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3fxMiE//qFUu

Hi Gavin,

On 9/29/22 01:37, Gavin Shan wrote:
> Hi Eric,
>
> On 9/28/22 10:51 PM, Eric Auger wrote:
>> On 9/22/22 01:13, Gavin Shan wrote:
>>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>>> are floating on highest RAM address. However, they can be disabled
>>> in several cases.
>>>
>>> (1) One specific high memory region is disabled by developer by
>>>      toggling vms->highmem_{redists, ecam, mmio}.
>>>
>>> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>>      'virt-2.12' or ealier than it.
>>>
>>> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>>      on 32-bits system.
>>>
>>> (4) One specific high memory region is disabled when it breaks the
>>>      PA space limit.
>>>
>>> The current implementation of virt_set_memmap() isn't comprehensive
>>> because the space for one specific high memory region is always
>>> reserved from the PA space for case (1), (2) and (3). In the code,
>>> 'base' and 'vms->highest_gpa' are always increased for those three
>>> cases. It's unnecessary since the assigned space of the disabled
>>> high memory region won't be used afterwards.
>>>
>>> This improves the address assignment for those three high memory
>>> region by skipping the address assignment for one specific high
>>> memory region if it has been disabled in case (1), (2) and (3).
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/arm/virt.c | 44 ++++++++++++++++++++++++++------------------
>>>   1 file changed, 26 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index b0b679d1f4..b702f8f2b5 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1693,15 +1693,31 @@ static void
>>> virt_set_high_memmap(VirtMachineState *vms,
>>>                                    hwaddr base, int pa_bits)
>>>   {
>>>       hwaddr region_base, region_size;
>>> -    bool fits;
>>> +    bool *region_enabled, fits;
>> IDo you really need a pointer? If the region is unknown this is a bug in
>> virt code.
>
> The pointer is needed so that we can disable the region by setting
> 'false'
> to it at later point. Yeah, I think you're correct that 'unknown region'
> is a bug and we need to do assert(region_enabled), or something like
> below.
Yeah I don't think using a pointer here is useful.
>
>>>       int i;
>>>         for (i = VIRT_LOWMEMMAP_LAST; i <
>>> ARRAY_SIZE(extended_memmap); i++) {
>>>           region_base = ROUND_UP(base, extended_memmap[i].size);
>>>           region_size = extended_memmap[i].size;
>>>   -        vms->memmap[i].base = region_base;
>>> -        vms->memmap[i].size = region_size;
>>> +        switch (i) {
>>> +        case VIRT_HIGH_GIC_REDIST2:
>>> +            region_enabled = &vms->highmem_redists;
>>> +            break;
>>> +        case VIRT_HIGH_PCIE_ECAM:
>>> +            region_enabled = &vms->highmem_ecam;
>>> +            break;
>>> +        case VIRT_HIGH_PCIE_MMIO:
>>> +            region_enabled = &vms->highmem_mmio;
>>> +            break;
>> While we are at it I would change the vms fields dealing with those
>> highmem regions and turn those fields into an array of bool indexed
>> using i - VIRT_LOWMEMMAP_LAST (using a macro or something alike). We
>> would not be obliged to have this switch, now duplicated.
>
> It makes sense to me. How about to have something like below in v4?
>
> static inline bool *virt_get_high_memmap_enabled(VirtMachineState
> *vms, int index)
> {
>     bool *enabled_array[] = {
>           &vms->highmem_redists,
>           &vms->highmem_ecam,
>           &vms->highmem_mmio,
>     };
>
>     assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));
>
>     return enabled_array[index - VIRT_LOWMEMMAP_LAST];
> } 
I was rather thinking as directly using a vms->highmem_flags[] but your
proposal may work as well.
>
>>> +        default:
>>> +            region_enabled = NULL;
>>> +        }
>>> +
>>> +        /* Skip unknown region */
>>> +        if (!region_enabled) {
>>> +            continue;
>>> +        }
>>>             /*
>>>            * Check each device to see if they fit in the PA space,
>>> @@ -1710,23 +1726,15 @@ static void
>>> virt_set_high_memmap(VirtMachineState *vms,
>>>            * For each device that doesn't fit, disable it.
>>>            */
>>>           fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>>> -        if (fits) {
>>> -            vms->highest_gpa = region_base + region_size - 1;
>>> -        }
>>> +        if (*region_enabled && fits) {
>>> +            vms->memmap[i].base = region_base;
>>> +            vms->memmap[i].size = region_size;
>>>   -        switch (i) {
>>> -        case VIRT_HIGH_GIC_REDIST2:
>>> -            vms->highmem_redists &= fits;
>>> -            break;
>>> -        case VIRT_HIGH_PCIE_ECAM:
>>> -            vms->highmem_ecam &= fits;
>>> -            break;
>>> -        case VIRT_HIGH_PCIE_MMIO:
>>> -            vms->highmem_mmio &= fits;
>>> -            break;
>>> +            vms->highest_gpa = region_base + region_size - 1;
>>> +            base = region_base + region_size;
>>> +        } else {
>>> +            *region_enabled = false;
what's the purpose to update the region_enabled here? Is it used anywhere?

The fact you do not update vms->highmem_* flags may introduce
regressions I think as the resulting flag may be used in some places
such as:
virt_gicv3_redist_region_count().

>>> -
>>> -        base = region_base + region_size;
>>>       }
>>>   }
>>>   
>
> Thanks,
> Gavin
>
Thanks

Eric

