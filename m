Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp209651lfg;
        Wed, 3 Aug 2022 01:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v9Aqw3driAgD+CHvDJHVB9+ubW0B5Vpi81Zte5iV1bmdE4LCX2UpKP/vyMpnPnKDPR6T8W
X-Received: by 2002:ac8:7f10:0:b0:31f:13c6:1694 with SMTP id f16-20020ac87f10000000b0031f13c61694mr20517027qtk.137.1659516398354;
        Wed, 03 Aug 2022 01:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659516398; cv=none;
        d=google.com; s=arc-20160816;
        b=m1JpAYzVQpZOf8aS9hrl8GHBKB6KZs4CnuyGLxN5ISQWLAQS3BSMmrT/Pn03gt+01k
         9yrDzzURNjoQtbGrhIzo7t0UxPWKKJss/aGQu3k6KwQnfZgH3mrnrbRgfAGXHbY4wXoh
         dCJQUyhg0iWYFnTZNHK7Rr8k+dqd+7t9fgl+t8gce6UeYbHi7rL+XeigY40cR4EYE02v
         nKPl9zsF2HJbz7+Afa5svBI9X18PibFYEywtW0jnqH6Kbi6+J6h3eI+jOg3sIIX76wFk
         i+MRJPdDl3+fH+fyVtHCa6vKLJl/Q/R9nBC4AITyC34O3D3PTXU7o14nZMDPb+Q2Ga/4
         bpDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0UdVWeIFGGS7zSoqVlveA45svPiOW3ZaMZDtR3sYifs=;
        b=vTi512E+VjpK3Tt3fIhL6pFUdIyJ51Kcyk/R5T+M36OAIQJpLwbMLgjzBnN+qO2FBU
         3/twRkd2ENVqSF+QvTrV8Xr2YZz+YABIhJx93dl1rTN5BcPS2axtBlHuFxXU8NRWt9G3
         WHUp4vbk6+l+HFNrr54uc68pkKSC4yC1GOWLSVdf4hwNsxZ62cR0BtRSp11hmZqPPfrS
         AsqxruJLRu0/2yUXvkcD/cCEELf/2LUXUqtt3ddoUU5wHTFYKbilLFmSFgf8QbAmqkwT
         zLLkRTpK/SgeB4bIsDR3iDpXigy6dHNkT0FKvA3c7mt+FyWvzZe625bgF5Mrt5alwckf
         5KRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VfwAY/Tv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ok28-20020a0562143c9c00b004736b0bd377si7748933qvb.561.2022.08.03.01.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Aug 2022 01:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VfwAY/Tv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJA1V-00040D-Ps
	for alex.bennee@linaro.org; Wed, 03 Aug 2022 04:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oJ9zv-0003yi-DB
 for qemu-arm@nongnu.org; Wed, 03 Aug 2022 04:45:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oJ9zs-0000gD-0r
 for qemu-arm@nongnu.org; Wed, 03 Aug 2022 04:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659516295;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0UdVWeIFGGS7zSoqVlveA45svPiOW3ZaMZDtR3sYifs=;
 b=VfwAY/Tv3nILQDm1BrhmCPd6wQ7NGtJyQ8lQBW8ToBTNi8ZFcpkfVUDtZ19A8vgQuc9TDo
 PNdvajr3uGXsU7BIoCKO9Mg0g6ZuwHJ6y+v24b/3pmATOCZ/t5K0BtLLqX+snSPpu7Uxy6
 nlOtt/dkmbFaJSdEAFvhFrFS3SRoLNY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-dycf6cZDO163uZ8ti7EUXA-1; Wed, 03 Aug 2022 04:44:51 -0400
X-MC-Unique: dycf6cZDO163uZ8ti7EUXA-1
Received: by mail-qk1-f197.google.com with SMTP id
 f20-20020a05620a409400b006b5fc740485so13124901qko.12
 for <qemu-arm@nongnu.org>; Wed, 03 Aug 2022 01:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=0UdVWeIFGGS7zSoqVlveA45svPiOW3ZaMZDtR3sYifs=;
 b=lbkik7Ct9xmoX1Aeyu6s4PK+9/RhkX8XByfraR3VSL/wyYjd/IXpB8JGIxQMkO6WEi
 WoOHmLL9ScKpDTFnC1yX0OajoM6mJ68JUQw5XxYK/Pl9pBf4VVwwRL4rzCGEFQC1i8Ip
 bKhSuruhohDCWKMkqrtMKljW8TB6x+HTZaNjMY8u4RkExizHb/f6pOzKQk032udPBDXQ
 IQD6XWffagWFYQPp3a4bxomac784kUw7UOAHDZNdXeBPCdJ8WZ5jSWQPrlseWJxTF3wr
 p0HsvQgvBy4scCyD70FpdP79Yt+tk0ORtKMBR5MhlVGtn69yE5Z2UzGmLD7viNn0umzP
 Kr0w==
X-Gm-Message-State: ACgBeo1Cz1CBEUvXVIvsIff1s63cwSG5mRi5hW+1OJVG5Q38Lq7qec+A
 lhTMfn31IkdaEqADHQLMJR5AAck9u4fWhQklD1vE/IVTPo0yurb1MDG+GXTVR0MInrN1n+TI3gc
 qm4P0BTqTIrrW
X-Received: by 2002:a0c:9022:0:b0:473:5be3:321 with SMTP id
 o31-20020a0c9022000000b004735be30321mr21161176qvo.79.1659516291170; 
 Wed, 03 Aug 2022 01:44:51 -0700 (PDT)
X-Received: by 2002:a0c:9022:0:b0:473:5be3:321 with SMTP id
 o31-20020a0c9022000000b004735be30321mr21161158qvo.79.1659516290889; 
 Wed, 03 Aug 2022 01:44:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p22-20020ac84616000000b0031ea864d3b2sm10496340qtn.30.2022.08.03.01.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 01:44:50 -0700 (PDT)
Message-ID: <3db8b274-dfe6-7b68-0ef3-d72c3597dd10@redhat.com>
Date: Wed, 3 Aug 2022 10:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com, Marc Zyngier <maz@kernel.org>
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
 <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Me2htA/zEosM

Hi Gavin,

On 8/3/22 05:01, Gavin Shan wrote:
> Hi Eric,
>
> On 8/2/22 7:41 PM, Eric Auger wrote:
>> On 8/2/22 08:45, Gavin Shan wrote:
>>> There are 3 highmem IO regions as below. They can be disabled in
>>> two situations: (a) The specific region is disabled by user. (b)
>>> The specific region doesn't fit in the PA space. However, the base
>>> address and highest_gpa are still updated no matter if the region
>>> is enabled or disabled. It's incorrectly incurring waste in the PA
>>> space.
>> If I am not wrong highmem_redists and highmem_mmio are not user
>> selectable
>>
>> Only highmem ecam depends on machine type & ACPI setup. But I would say
>> that in server use case it is always set. So is that optimization really
>> needed?
>
> There are two other cases you missed.
>
> - highmem_ecam is enabled after virt-2.12, meaning it stays disabled
>   before that.
Yes that's what I meant above by 'depends on machine type'
>
> - The high memory region can be disabled if user is asking large
>   (normal) memory space through 'maxmem=' option. When the requested
>   memory by 'maxmem=' is large enough, the high memory regions are
>   disabled. It means the normal memory has higher priority than those
>   high memory regions. This is the case I provided in (b) of the
>   commit log.
yes but in such a case you don't "waste" IPA as you mention in the
commit log because you only ask for a VM dimensionned for the highest_gpa.
The only case where you would "waste" IPA is for high ecam which can
disabled by option combination but it is marginal.

>
> In the commit log, I was supposed to say something like below for
> (a):
>
> - The specific high memory region can be disabled through changing
>   the code by user or developer. For example, 'vms->highmem_mmio'
>   is changed from true to false in virt_instance_init().
>
>>>
>>> Improve address assignment for highmem IO regions to avoid the waste
>>> in the PA space by putting the logic into virt_memmap_fits().
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/arm/virt.c | 54
>>> +++++++++++++++++++++++++++++----------------------
>>>   1 file changed, 31 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 9633f822f3..bc0cd218f9 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1688,6 +1688,34 @@ static uint64_t
>>> virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>       return arm_cpu_mp_affinity(idx, clustersz);
>>>   }
>>>   +static void virt_memmap_fits(VirtMachineState *vms, int index,
>>> +                             bool *enabled, hwaddr *base, int pa_bits)
>>> +{
>>> +    hwaddr size = extended_memmap[index].size;
>>> +
>>> +    /* The region will be disabled if its size isn't given */
>>> +    if (!*enabled || !size) {
>> In which case do you have !size?
>
> Yeah, we don't have !size and the condition should be removed.
>
>>> +        *enabled = false;
>>> +        vms->memmap[index].base = 0;
>>> +        vms->memmap[index].size = 0;
>> It looks dangerous to me to reset the region's base and size like that.
>> for instance fdt_add_gic_node() will add dummy data in the dt.
>
> I would guess you missed that the high memory regions won't be exported
> through device-tree if they have been disabled. We have a check there,
> which is "if (nb_redist_regions == 1)"
OK I missed a check was added in virt_gicv3_redist_region_count.
Nevertheless, your comment "The region will be disabled if its size
isn't given */ is not obvious to me. To me the region is disabled if the
corresponding flag is not set. From your comment I have the impression
the size is checked to see if the region is exposed, it does not look
obvious.
>
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * Check if the memory region fits in the PA space. The memory map
>>> +     * and highest_gpa are updated if it fits. Otherwise, it's
>>> disabled.
>>> +     */
>>> +    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>> using a 'fits' local variable would make the code more obvious I think
>
> Lets confirm if you're suggesting something like below?
>
>         bool fits;
>
>         fits = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>
>         if (fits) {
>            /* update *base, memory mapping, highest_gpa */
>         } else {
>            *enabled = false;
>         }
yes that's what I suggested.
>
> I guess we can simply do
>
>         if (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits)) {
>            /* update *base, memory mapping, highest_gpa */
>         } else {
>            *enabled = false;
>         }
>
> Please let me know which one looks best to you.
>
>>> +    if (*enabled) {
>>> +        *base = ROUND_UP(*base, size);
>>> +        vms->memmap[index].base = *base;
>>> +        vms->memmap[index].size = size;
>>> +        vms->highest_gpa = *base + size - 1;
>>> +
>>> +    *base = *base + size;
>>> +    }
>>> +}
>>> +
>>>   static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>>>   {
>>>       MachineState *ms = MACHINE(vms);
>>> @@ -1744,37 +1772,17 @@ static void virt_set_memmap(VirtMachineState
>>> *vms, int pa_bits)
>>>       vms->highest_gpa = memtop - 1;
>>>         for (i = VIRT_LOWMEMMAP_LAST; i <
>>> ARRAY_SIZE(extended_memmap); i++) {
>>> -        hwaddr size = extended_memmap[i].size;
>>> -        bool fits;
>>> -
>>> -        base = ROUND_UP(base, size);
>>> -        vms->memmap[i].base = base;
>>> -        vms->memmap[i].size = size;
>>> -
>>> -        /*
>>> -         * Check each device to see if they fit in the PA space,
>>> -         * moving highest_gpa as we go.
>>> -         *
>>> -         * For each device that doesn't fit, disable it.
>>> -         */
>>> -        fits = (base + size) <= BIT_ULL(pa_bits);
>>> -        if (fits) {
>>> -            vms->highest_gpa = base + size - 1;
>>> -        }
>>> -
>>
>> we could avoid running the code below in case highmem is not set. We
>> would need to reset that flags though.
>>
>
> Yeah, I think it's not a big deal. My though is to update the flag in
> virt_memmap_fits().

Eric
>
>>>           switch (i) {
>>>           case VIRT_HIGH_GIC_REDIST2:
>>> -            vms->highmem_redists &= fits;
>>> +            virt_memmap_fits(vms, i, &vms->highmem_redists, &base,
>>> pa_bits);
>>>               break;
>>>           case VIRT_HIGH_PCIE_ECAM:
>>> -            vms->highmem_ecam &= fits;
>>> +            virt_memmap_fits(vms, i, &vms->highmem_ecam, &base,
>>> pa_bits);
>>>               break;
>>>           case VIRT_HIGH_PCIE_MMIO:
>>> -            vms->highmem_mmio &= fits;
>>> +            virt_memmap_fits(vms, i, &vms->highmem_mmio, &base,
>>> pa_bits);
>>>               break;
>>>           }
>>> -
>>> -        base += size;
>>>       }
>>>         if (device_memory_size > 0) {
>
> Thanks,
> Gavin
>

