Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp269123lfg;
        Wed, 3 Aug 2022 04:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1su8AAHh5oIrdgDGeRwgvRVuQURg4Hz/KdGNW7J0o5npBx7vPcrAosxSbfDQ01QsvkO1l6i
X-Received: by 2002:a05:620a:25c8:b0:6ae:bf82:8f36 with SMTP id y8-20020a05620a25c800b006aebf828f36mr18153503qko.354.1659524550351;
        Wed, 03 Aug 2022 04:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659524550; cv=none;
        d=google.com; s=arc-20160816;
        b=mo3yJ4QGKR08q37BefgyiDv8H9YMwjvJqNPAaFkp9plmbShzMTQ0keOZvyWg0JhRtS
         cHDZZoBty8T50O/ch6a+5K+4onyYWp8sJUsED49OQJ4iyvEZG1oA4mt0IF61ndNhEnhu
         iBu3oZir2MHsZoAxjeQA+YiL6WHyYj8IOniKgX3JP7ANWYkWsem2+o+DQZiOCGWthPkr
         dTGBwNLccWmO6CY1Vq77o5OmxWrfxy43nv+wRvmXv9hxoYapMRIbKZ+19yLR72aGuI5F
         LXjH8d7yB1i/RJCTKtTXjzi+tqGuVjP27H6cx5ut4dYXEsAjRTqhDzMFsn9CEZdN9Rna
         gR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=LAqLHhyWwia4fP5ogQi/6xMc2d4GYCv6QVXEnkMeaIM=;
        b=oPYv00M4HuXua5D1vbhnYRnxx1JaIEWbl1JIuWPpCXhLRhyWtcCMcehFh6/awnggbM
         0TC3lttltxab1MlWoknjB06GIcq4Z9M3Ay3vZSrVj1Q1W+K8qbbJ9E9H6hcX71oi4dwi
         B45c8/RAs5RdWDPdrM61Jlt3QX3m+X6voIgz47o+W+zFxNOUmumqMcQzul87D3RUJLjc
         0UsHRmqmbSS1c0TUidk2xpQkn+kFKazSmsdaY4rcQt0zkU21QZWXLSXOxvbg41HYL35i
         18Db2pzGVCh9MifpYuBPT2Tt/AmrQ6VT6ulzbnIwlJT3M99+25m73DCheVDeXmyWmQZJ
         nTAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSqgLd4q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a0562141c0800b004746b447356si9994383qvc.496.2022.08.03.04.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Aug 2022 04:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSqgLd4q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJC8z-0000Xy-S8
	for alex.bennee@linaro.org; Wed, 03 Aug 2022 07:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJC87-0000XB-G5
 for qemu-arm@nongnu.org; Wed, 03 Aug 2022 07:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJC84-0001ZH-Ux
 for qemu-arm@nongnu.org; Wed, 03 Aug 2022 07:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659524491;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAqLHhyWwia4fP5ogQi/6xMc2d4GYCv6QVXEnkMeaIM=;
 b=FSqgLd4qcsA/254CR+4KCZnqJtNyb1Hx/no2LZpVT1NgRvGk2sPNuk6ds6JSzrR0qEWW1w
 Dwd0xJGZ3i47knjIwaxkPerckGuDGAQDUfv0fJJhdx364Io9MaqeZlBR0NsxFi1kx0eWDF
 Su/PW0/np3Xf1JGEAFqUa77Ijfqgiag=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-2OvTyjz0PouX1MwvEyRe6Q-1; Wed, 03 Aug 2022 07:01:28 -0400
X-MC-Unique: 2OvTyjz0PouX1MwvEyRe6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31BE1185A7B2;
 Wed,  3 Aug 2022 11:01:28 +0000 (UTC)
Received: from [10.64.54.20] (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACA48C27D95;
 Wed,  3 Aug 2022 11:01:24 +0000 (UTC)
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
To: Marc Zyngier <maz@kernel.org>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, cohuck@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
 <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
 <87tu6tbyk9.wl-maz@kernel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <0ed2ebc7-8d6e-7555-3af4-31eb071a584b@redhat.com>
Date: Wed, 3 Aug 2022 23:02:04 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87tu6tbyk9.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UpG5hZxYg2Cr

Hi Marc,

On 8/3/22 5:01 PM, Marc Zyngier wrote:
> On Wed, 03 Aug 2022 04:01:04 +0100,
> Gavin Shan <gshan@redhat.com> wrote:
>> On 8/2/22 7:41 PM, Eric Auger wrote:
>>> On 8/2/22 08:45, Gavin Shan wrote:
>>>> There are 3 highmem IO regions as below. They can be disabled in
>>>> two situations: (a) The specific region is disabled by user. (b)
>>>> The specific region doesn't fit in the PA space. However, the base
>>>> address and highest_gpa are still updated no matter if the region
>>>> is enabled or disabled. It's incorrectly incurring waste in the PA
>>>> space.
>>> If I am not wrong highmem_redists and highmem_mmio are not user selectable
>>>
>>> Only highmem ecam depends on machine type & ACPI setup. But I would say
>>> that in server use case it is always set. So is that optimization really
>>> needed?
>>
>> There are two other cases you missed.
>>
>> - highmem_ecam is enabled after virt-2.12, meaning it stays disabled
>>    before that.
> 
> I don't get this. The current behaviour is to disable highmem_ecam if
> it doesn't fit in the PA space. I can't see anything that enables it
> if it was disabled the first place.
> 

There are several places or conditions where vms->highmem_ecam can be
disabled:

- virt_instance_init() where vms->highmem_ecam is inherited from
   !vmc->no_highmem_ecam. The option is set to true after virt-2.12
   in virt_machine_2_12_options().

- machvirt_init() where vms->highmem_ecam can be disable if we have
   32-bits vCPUs and failure on loading firmware.

- Another place is where we're talking about. It's address assignment
   to fit the PA space.

>>
>> - The high memory region can be disabled if user is asking large
>>    (normal) memory space through 'maxmem=' option. When the requested
>>    memory by 'maxmem=' is large enough, the high memory regions are
>>    disabled. It means the normal memory has higher priority than those
>>    high memory regions. This is the case I provided in (b) of the
>>    commit log.
> 
> Why is that a problem? It matches the expected behaviour, as the
> highmem IO region is floating and is pushed up by the memory region.
> 

Eric thought that VIRT_HIGH_GIC_REDIST2 and VIRT_HIGH_PCIE_MMIO regions
aren't user selectable. I tended to explain why it's not true. 'maxmem='
can affect the outcome. When 'maxmem=' value is big enough, there will be
no free area in the PA space to hold those two regions.

>>
>> In the commit log, I was supposed to say something like below for
>> (a):
>>
>> - The specific high memory region can be disabled through changing
>>    the code by user or developer. For example, 'vms->highmem_mmio'
>>    is changed from true to false in virt_instance_init().
> 
> Huh. By this principle, the user can change anything. Why is it
> important?
> 

Still like above. I was explaining the possible cases where those
3 switches can be turned on/off by users or developers. Our code
needs to be consistent and comprehensive.

   vms->highmem_redists
   vms->highmem_ecam
   vms->mmio

>>
>>>>
>>>> Improve address assignment for highmem IO regions to avoid the waste
>>>> in the PA space by putting the logic into virt_memmap_fits().
> 
> I guess that this is what I understand the least. What do you mean by
> "wasted PA space"? Either the regions fit in the PA space, and
> computing their addresses in relevant, or they fall outside of it and
> what we stick in memap[index].base is completely irrelevant.
> 

It's possible that we run into the following combination. we should
have enough PA space to enable VIRT_HIGH_PCIE_MMIO region. However,
the region is disabled in the original implementation because
VIRT_HIGH_{GIC_REDIST2, PCIE_ECAM} regions consumed 1GB, which is
unecessary and waste in the PA space.

     static MemMapEntry extended_memmap[] = {
         [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
         [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
         [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
     };

     IPA_LIMIT           = (1UL << 40)
     '-maxmem'           = 511GB              /* Memory starts from 1GB */
     '-slots'            = 0
     vms->highmem_rdist2 = false
     vms->highmem_ecam   = false
     vms->highmem_mmio   = true

>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/arm/virt.c | 54 +++++++++++++++++++++++++++++----------------------
>>>>    1 file changed, 31 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 9633f822f3..bc0cd218f9 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -1688,6 +1688,34 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>>        return arm_cpu_mp_affinity(idx, clustersz);
>>>>    }
>>>>    +static void virt_memmap_fits(VirtMachineState *vms, int index,
>>>> +                             bool *enabled, hwaddr *base, int pa_bits)
>>>> +{
>>>> +    hwaddr size = extended_memmap[index].size;
>>>> +
>>>> +    /* The region will be disabled if its size isn't given */
>>>> +    if (!*enabled || !size) {
>>> In which case do you have !size?
>>
>> Yeah, we don't have !size and the condition should be removed.
>>
>>>> +        *enabled = false;
>>>> +        vms->memmap[index].base = 0;
>>>> +        vms->memmap[index].size = 0;
>>> It looks dangerous to me to reset the region's base and size like that.
>>> for instance fdt_add_gic_node() will add dummy data in the dt.
>>
>> I would guess you missed that the high memory regions won't be exported
>> through device-tree if they have been disabled. We have a check there,
>> which is "if (nb_redist_regions == 1)"
>>
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Check if the memory region fits in the PA space. The memory map
>>>> +     * and highest_gpa are updated if it fits. Otherwise, it's disabled.
>>>> +     */
>>>> +    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>> using a 'fits' local variable would make the code more obvious I think
>>
>> Lets confirm if you're suggesting something like below?
>>
>>          bool fits;
>>
>>          fits = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>
>>          if (fits) {
>>             /* update *base, memory mapping, highest_gpa */
>>          } else {
>>             *enabled = false;
>>          }
>>
>> I guess we can simply do
>>
>>          if (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits)) {
>>             /* update *base, memory mapping, highest_gpa */
>>          } else {
>>             *enabled = false;
>>          }
>>
>> Please let me know which one looks best to you.
> 
> Why should the 'enabled' flag be updated by this function, instead of
> returning the value and keeping it as an assignment in the caller
> function? It is purely stylistic though.
> 

The idea to put the logic, address assignment for those 3 high memory
regions or updating the flags (vms->high_redist2/ecam/mmio), to the
newly introduced function, to make virt_set_memmap() a bit simplified.
Eric tends to agree the changes with minor adjustments. So I'm going
to keep it as of being, which doesn't mean the stylistic thought is
a bad one :)

Lastly, I need to rewrite the comit log completely because it seems
causing confusions to Eric and you.

Thanks,
Gavin

