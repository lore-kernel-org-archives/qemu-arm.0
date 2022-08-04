Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp194793lfg;
        Thu, 4 Aug 2022 00:20:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5gqnYnGUKKiOcyKIgrXbyFNe70RwkNP2NBpY0BPQ8qwzzssH62D/rIUD5blJ/7zHKMIdNr
X-Received: by 2002:a05:6214:f2d:b0:476:f37f:b844 with SMTP id iw13-20020a0562140f2d00b00476f37fb844mr343232qvb.122.1659597633475;
        Thu, 04 Aug 2022 00:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659597633; cv=none;
        d=google.com; s=arc-20160816;
        b=PuMA5rd66A4Qpa9MBifigU/OW7Igoc8SCJ0nbNMYf/L7xgTHkiWKotCtwuY6yHJpPJ
         U+A5/ardOdCGe6MF5Osj3F/lyC0ItKaqpNs3eAesVtFWM0SqWxZ+EczzpSelBFgtr1sZ
         1/GC6pYjbAPTuqS4WuQTnR5xRwLtZVHG1XA0wGoNyHUM6w9yhbTElPIClCa+TS5bgr7C
         7Qa4aA86j3BtgxJ5hQtcjKrIdiQwcO499NLwZUTLX1WTzJV4xWxDpHNT+U643H0yXuhF
         Ts66iwtX4iZ/RMNZvIw9095FkIbYv/mhSh8XWDry0d2dd4rb9jXzBW8Uao52mqftEBT6
         Uk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pSuF5Ew78kXhj0Gpx1Pdc2AA5FnzO3HOHxLD9ZLVLoo=;
        b=eUrGldgzFW1YnF2oyv0blrcPX38fKhh0KTggxCLBKuIDxFBf5hxW9lToii1s04Ocmu
         xsuvCb5VSfW2gC7//sDFTaeFtSpQLV6wmBFr9FlSC0ux+S1wM176+Y4HObREhHirM9Js
         yz5njFdFwnzgRiiR/LaDRJ0X6Rd1tEORn03zbmFPO2dLF+UX2cMiEriUglMIUFx7vIiA
         xbizXAaTiw45Hq/MC0c294w5ydMPRjgablYcCOM5e+ml+WkowHNHvOlYFJTsH70djFuu
         4DA9R1XeyFtjB6KelOxuouPcGTIq8KVIYI0RDcxrip4y3vCTfLkimsJgWjDms6xrhEnD
         X7bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V0jpUBUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a0562140d4200b0047316c8fc14si36529qvr.231.2022.08.04.00.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Aug 2022 00:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V0jpUBUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJV9k-0002uF-Nt
	for alex.bennee@linaro.org; Thu, 04 Aug 2022 03:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oJV8m-0002tb-DL
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 03:19:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oJV8i-0001aJ-O2
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 03:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659597567;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pSuF5Ew78kXhj0Gpx1Pdc2AA5FnzO3HOHxLD9ZLVLoo=;
 b=V0jpUBUVDica4VwhU4Fm+sh1xIizjygGQmz3ivGWDY9LbukQgubghTEmMuKQtCA5mYFDcx
 d1L2Wlt/qjDhyezrnr2PZDx40ZecIbkINZcpDEcQO6y5Tf+aNL4a7ZTZuhgkAz5LqLPie2
 ytNoo1xdwMQLnYUS/q5wLJ7xHDJ2/ZI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-fjv2L8eEOKmWhpKX_j4H4g-1; Thu, 04 Aug 2022 03:19:26 -0400
X-MC-Unique: fjv2L8eEOKmWhpKX_j4H4g-1
Received: by mail-qv1-f70.google.com with SMTP id
 p14-20020a0cfd8e000000b004747f93486bso11381193qvr.13
 for <qemu-arm@nongnu.org>; Thu, 04 Aug 2022 00:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=pSuF5Ew78kXhj0Gpx1Pdc2AA5FnzO3HOHxLD9ZLVLoo=;
 b=Lm6iOmRfge3PanFFDfSGnfB4XiDyQV9vX1A5YSMqIdulHwcCxfKGnHtS97UM7qmDvt
 yK38tsgWQxvggBW2q/zPduW+mbWdTIHCCRJlOXSzkFLVXiEtZCk3fPdFAb15dppzNhbn
 XK1Ih79jH6TCQdXPPIlMmZTgXdJG1ztWOVJBH3+w2jWzRBtPA/HiFsHI1+tR9J1i7U4W
 GXx8FNvXU6TndHh3IO6wzJH7WPvOvX2Nl5dtoLPkuTW39fbcaXXiVP/IX8caTYMg/TcU
 FwkeXoM6DA4zgBcx+zsZ5+IvNvWzFhJj0AbHNA/1Lx5Ua5uyUsSPtgr4wzUGhzNEicAI
 I23w==
X-Gm-Message-State: ACgBeo10qTfxh5Uxz1b9S6qQICCSilUxNtSV3auangtXuzovqMOHtrCK
 ACUGFWVc5Yt6nMLdhBiM+YH+BOfPI66Rc8xt2YiSlOOHH16oqlz9YDv4Xn2yf3Bi6H68LnMUCjq
 v4jhwZSoowVW7
X-Received: by 2002:a05:620a:270d:b0:6b5:d076:1c55 with SMTP id
 b13-20020a05620a270d00b006b5d0761c55mr359618qkp.43.1659597565522; 
 Thu, 04 Aug 2022 00:19:25 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:6b5:d076:1c55 with SMTP id
 b13-20020a05620a270d00b006b5d0761c55mr359600qkp.43.1659597565146; 
 Thu, 04 Aug 2022 00:19:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c25-20020ac84e19000000b00338ae1f5421sm217856qtw.0.2022.08.04.00.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 00:19:24 -0700 (PDT)
Message-ID: <2018984d-68d6-3a7e-7ee8-28cdbab8fe86@redhat.com>
Date: Thu, 4 Aug 2022 09:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
To: Gavin Shan <gshan@redhat.com>, Marc Zyngier <maz@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
 <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
 <87tu6tbyk9.wl-maz@kernel.org>
 <0ed2ebc7-8d6e-7555-3af4-31eb071a584b@redhat.com>
 <bf8fd91c-2bac-35b4-1d17-78ba582760f0@redhat.com>
 <4c0e49f5-a7cc-9742-d473-e8453ab1c3e6@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <4c0e49f5-a7cc-9742-d473-e8453ab1c3e6@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zmcskp8FYjeg



On 8/4/22 04:47, Gavin Shan wrote:
> Hi Eric,
>
> On 8/3/22 10:52 PM, Eric Auger wrote:
>> On 8/3/22 15:02, Gavin Shan wrote:
>>> On 8/3/22 5:01 PM, Marc Zyngier wrote:
>>>> On Wed, 03 Aug 2022 04:01:04 +0100,
>>>> Gavin Shan <gshan@redhat.com> wrote:
>>>>> On 8/2/22 7:41 PM, Eric Auger wrote:
>>>>>> On 8/2/22 08:45, Gavin Shan wrote:
>>>>>>> There are 3 highmem IO regions as below. They can be disabled in
>>>>>>> two situations: (a) The specific region is disabled by user. (b)
>>>>>>> The specific region doesn't fit in the PA space. However, the base
>>>>>>> address and highest_gpa are still updated no matter if the region
>>>>>>> is enabled or disabled. It's incorrectly incurring waste in the PA
>>>>>>> space.
>>>>>> If I am not wrong highmem_redists and highmem_mmio are not user
>>>>>> selectable
>>>>>>
>>>>>> Only highmem ecam depends on machine type & ACPI setup. But I would
>>>>>> say
>>>>>> that in server use case it is always set. So is that optimization
>>>>>> really
>>>>>> needed?
>>>>>
>>>>> There are two other cases you missed.
>>>>>
>>>>> - highmem_ecam is enabled after virt-2.12, meaning it stays disabled
>>>>>     before that.
>>>>
>>>> I don't get this. The current behaviour is to disable highmem_ecam if
>>>> it doesn't fit in the PA space. I can't see anything that enables it
>>>> if it was disabled the first place.
>>>>
>>>
>>> There are several places or conditions where vms->highmem_ecam can be
>>> disabled:
>>>
>>> - virt_instance_init() where vms->highmem_ecam is inherited from
>>>    !vmc->no_highmem_ecam. The option is set to true after virt-2.12
>>>    in virt_machine_2_12_options().
>>>
>>> - machvirt_init() where vms->highmem_ecam can be disable if we have
>>>    32-bits vCPUs and failure on loading firmware.
>>>
>>> - Another place is where we're talking about. It's address assignment
>>>    to fit the PA space.
>>>
>>>>>
>>>>> - The high memory region can be disabled if user is asking large
>>>>>     (normal) memory space through 'maxmem=' option. When the
>>>>> requested
>>>>>     memory by 'maxmem=' is large enough, the high memory regions are
>>>>>     disabled. It means the normal memory has higher priority than
>>>>> those
>>>>>     high memory regions. This is the case I provided in (b) of the
>>>>>     commit log.
>>>>
>>>> Why is that a problem? It matches the expected behaviour, as the
>>>> highmem IO region is floating and is pushed up by the memory region.
>>>>
>>>
>>> Eric thought that VIRT_HIGH_GIC_REDIST2 and VIRT_HIGH_PCIE_MMIO regions
>>> aren't user selectable. I tended to explain why it's not true.
>>> 'maxmem='
>>> can affect the outcome. When 'maxmem=' value is big enough, there
>>> will be
>>> no free area in the PA space to hold those two regions.
>>>
>>>>>
>>>>> In the commit log, I was supposed to say something like below for
>>>>> (a):
>>>>>
>>>>> - The specific high memory region can be disabled through changing
>>>>>     the code by user or developer. For example, 'vms->highmem_mmio'
>>>>>     is changed from true to false in virt_instance_init().
>>>>
>>>> Huh. By this principle, the user can change anything. Why is it
>>>> important?
>>>>
>>>
>>> Still like above. I was explaining the possible cases where those
>>> 3 switches can be turned on/off by users or developers. Our code
>>> needs to be consistent and comprehensive.
>>>
>>>    vms->highmem_redists
>>>    vms->highmem_ecam
>>>    vms->mmio
>>>
>>>>>
>>>>>>>
>>>>>>> Improve address assignment for highmem IO regions to avoid the
>>>>>>> waste
>>>>>>> in the PA space by putting the logic into virt_memmap_fits().
>>>>
>>>> I guess that this is what I understand the least. What do you mean by
>>>> "wasted PA space"? Either the regions fit in the PA space, and
>>>> computing their addresses in relevant, or they fall outside of it and
>>>> what we stick in memap[index].base is completely irrelevant.
>>>>
>>>
>>> It's possible that we run into the following combination. we should
>>> have enough PA space to enable VIRT_HIGH_PCIE_MMIO region. However,
>>> the region is disabled in the original implementation because
>>> VIRT_HIGH_{GIC_REDIST2, PCIE_ECAM} regions consumed 1GB, which is
>>> unecessary and waste in the PA space.
>> each region's base is aligned on its size.
>
> Yes.
>
>>>
>>>      static MemMapEntry extended_memmap[] = {
>>>          [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
>>>          [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>>>          [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
>> so anyway MMIO is at least at 512GB. Having a 1TB IPA space does not
>> imply any amount of RAM. This depends on the address space.
>> I    };
>
> Yes. Prior to the start of system memory, there is 1GB used by
> various regions either.
yes
>
>>>
>>>      IPA_LIMIT           = (1UL << 40)
>>>      '-maxmem'           = 511GB              /* Memory starts from
>>> 1GB */
>>>      '-slots'            = 0
>>>      vms->highmem_rdist2 = false
>> How can this happen? the only reason for highmem_redists to be reset is
>> if it does not fit into map_ipa. So if mmio fits, highmem_redists does
>> too. What do I miss?
>
> The example is having "vms->highmem_rdist2 = flase" BEFORE the address
> assignment, it's possible that developer changes the code to disable
> it intentionally. The point is the original implementation isn't
> comprehensive
> because it has the wrong assumption that vms->highmem_{rdist2, ecam,
> mmio} all
> true before the address assignment. With the wrong assumption, the
> base address
> is always increased, even the previous region is disabled, during the
> address assignment in virt_set_memmap().
Yes we currently always provision space for those functionalities,
independently on whether they are used. But that's true for many other
regions in the address map (although smaller) ;-)
>
>
>>>      vms->highmem_ecam   = false
>>      vms->highmem_mmio   = true
>> I am still skeptic about the relevance of such optim. Isn't it sensible
>> to expect the host to support large IPA if you want to use such amount
>> of memory.
>> I think we should rather better document the memory map from a user
>> point of view.
>> Besides if you change the memory map, you need to introduce yet another
>> option to avoid breaking migration, no?
>>
>
> These 3 high memory regions consumes 513GB with alignment considered when
> all of them are enabled. The point is those 3 high memory regions, or
> part
> of them can be squeezed or smashed to accommodate '-maxmem' by design. I
> think there are two options I can think of. I personally prefer to keep
> the capability. With this, users gain broader range for their '-maxmem'.
> Please let me know your preference.
>
> - Revert the capability of squeezing or smashing those high memory
> regions
>   to accommodate '-maxmem'. It means vms->high_{redist2, ecam, mmio}
> can't
>   be disable on conflicts to the PA space.
>
> - Keep the capability, with this optimization applied to make the
> implementation
>   comprehensive.
>
> I think it's worthy to add something about this limitation in
> doc/system/arm/virt.rst.
indeed that's worth in any case.
>
> I don't think I need introduce another option to avoid migration
> breakage.
> Could you explain why I need the extra option?
I think you do. Before and after this patch the QEMU memory regions
associated to those devices won't be a the same location in the memory
so if you migrate from an old version to a newer one, the guest won't be
able to access them

OK I have given my own opinion about those potential changes. Let's wait
for others' ;-)

Eric
>
>>>
>>>>>>>
>>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>>> ---
>>>>>>>     hw/arm/virt.c | 54
>>>>>>> +++++++++++++++++++++++++++++----------------------
>>>>>>>     1 file changed, 31 insertions(+), 23 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>> index 9633f822f3..bc0cd218f9 100644
>>>>>>> --- a/hw/arm/virt.c
>>>>>>> +++ b/hw/arm/virt.c
>>>>>>> @@ -1688,6 +1688,34 @@ static uint64_t
>>>>>>> virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>>>>>         return arm_cpu_mp_affinity(idx, clustersz);
>>>>>>>     }
>>>>>>>     +static void virt_memmap_fits(VirtMachineState *vms, int index,
>>>>>>> +                             bool *enabled, hwaddr *base, int
>>>>>>> pa_bits)
>>>>>>> +{
>>>>>>> +    hwaddr size = extended_memmap[index].size;
>>>>>>> +
>>>>>>> +    /* The region will be disabled if its size isn't given */
>>>>>>> +    if (!*enabled || !size) {
>>>>>> In which case do you have !size?
>>>>>
>>>>> Yeah, we don't have !size and the condition should be removed.
>>>>>
>>>>>>> +        *enabled = false;
>>>>>>> +        vms->memmap[index].base = 0;
>>>>>>> +        vms->memmap[index].size = 0;
>>>>>> It looks dangerous to me to reset the region's base and size like
>>>>>> that.
>>>>>> for instance fdt_add_gic_node() will add dummy data in the dt.
>>>>>
>>>>> I would guess you missed that the high memory regions won't be
>>>>> exported
>>>>> through device-tree if they have been disabled. We have a check
>>>>> there,
>>>>> which is "if (nb_redist_regions == 1)"
>>>>>
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Check if the memory region fits in the PA space. The
>>>>>>> memory map
>>>>>>> +     * and highest_gpa are updated if it fits. Otherwise, it's
>>>>>>> disabled.
>>>>>>> +     */
>>>>>>> +    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>>>>> using a 'fits' local variable would make the code more obvious I
>>>>>> think
>>>>>
>>>>> Lets confirm if you're suggesting something like below?
>>>>>
>>>>>           bool fits;
>>>>>
>>>>>           fits = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>>>>
>>>>>           if (fits) {
>>>>>              /* update *base, memory mapping, highest_gpa */
>>>>>           } else {
>>>>>              *enabled = false;
>>>>>           }
>>>>>
>>>>> I guess we can simply do
>>>>>
>>>>>           if (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits)) {
>>>>>              /* update *base, memory mapping, highest_gpa */
>>>>>           } else {
>>>>>              *enabled = false;
>>>>>           }
>>>>>
>>>>> Please let me know which one looks best to you.
>>>>
>>>> Why should the 'enabled' flag be updated by this function, instead of
>>>> returning the value and keeping it as an assignment in the caller
>>>> function? It is purely stylistic though.
>>>>
>>>
>>> The idea to put the logic, address assignment for those 3 high memory
>>> regions or updating the flags (vms->high_redist2/ecam/mmio), to the
>>> newly introduced function, to make virt_set_memmap() a bit simplified.
>>> Eric tends to agree the changes with minor adjustments. So I'm going
>>> to keep it as of being, which doesn't mean the stylistic thought is
>>> a bad one :)
>>>
>>> Lastly, I need to rewrite the comit log completely because it seems
>>> causing confusions to Eric and you.
>>>
>
> Thanks,
> Gavin
>

