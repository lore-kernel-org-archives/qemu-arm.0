Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1430620wrq;
        Thu, 12 Jul 2018 07:22:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe1odrF8gHGUOJKozFhI31vlbeuo7JhI2Q6gmKpFwwQhlyKH2bfniqCNoZ8CqIyNQ49z9RH
X-Received: by 2002:a37:c404:: with SMTP id d4-v6mr1932195qki.289.1531405372926;
        Thu, 12 Jul 2018 07:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531405372; cv=none;
        d=google.com; s=arc-20160816;
        b=EDjEKCiCSZIDaJa2lTDMM60sE1WloBnd7gQ5AIZRUVXs7jMyPJNBi8uMO1r2PqX60c
         Q9dgrmnpUi1AaJshpmrjUc98Ggs/YNGwt1fZawrsETX5XdKfr1udGJpyoqnzAQEzIfeo
         s7isWJib89R8zYYSzf3rA0zPI3bBYPXVvXRArGd4aK2t/MsRyTAogt4aaHBgukV8TvvI
         RFa2vS93IJauCevHSHNEHMlN5GB8OW6cQDo03yIc2uBe6uhhFWV1pxkidtJ+6oKuWG/k
         RxTdHx1BXhf5KoricR8GTwnSypgKBcJ4eT1uHUFlurKamx8Iecv52dCUhXOtZPDdYSnx
         3+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=yswoI0QEvANqCsP1Fc2nphtxHCG688S3F6b2ymjjzSY=;
        b=0tnfWLwW/qApabgj7iKi+r/bTERloQM8t/4LkoogyS4Yoq06sscsrXod4EiL+JZPZj
         RBNDGWVZsa4/PDb2iBLamtkNRF/b84areiCm0h/j+STV9ZjhDi9GDwPPFhnBwd8qE5ZA
         wC41MRpi56WH6/h5yyhgtdIIotBfe4+E5q4NLwnzAhhADQBHH89GYdCcXkd3dTxRGD9B
         q7oVbiZ9sYsarRC0ZxSEV8Qn5+LI0YUQG3SRVnuikrtW38ofdVnSxFRuwN3M/d8k98Vk
         D07DjbvDfzRq/Rl4DNS+TRH1+htAJW1TxlN8/kVq7GtGGX1+HdoXbNwAYK1xHViwIBbK
         Cztw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j8-v6si17950515qkm.293.2018.07.12.07.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 07:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdcUd-0006iG-Es
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 10:22:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fdcUA-0006fi-At
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 10:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fdcU8-0003O6-1q
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 10:22:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53338 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fdcU1-0003Ij-Ih; Thu, 12 Jul 2018 10:22:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 336F44074452;
	Thu, 12 Jul 2018 14:22:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-118.ams2.redhat.com
	[10.36.116.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE73D1C665;
	Thu, 12 Jul 2018 14:22:06 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-7-git-send-email-eric.auger@redhat.com>
	<a856ba3a-c211-5f35-4023-97ef73eb5c31@redhat.com>
	<df091f31-6f85-64d8-0c3b-7fd463d31c63@redhat.com>
	<43c1349e-1ca6-4890-07c0-7bfa35ab914d@redhat.com>
	<5311fed5-7f13-a177-b967-db6e3ed028b9@redhat.com>
	<405e3f2b-3044-d7fc-8df4-b07a8487470f@redhat.com>
	<f2d61062-21df-4478-bc61-c32e92329cf8@redhat.com>
	<57030c9f-c3d1-49a8-090e-d6b316e7a818@redhat.com>
	<fc6a29d4-1094-8d29-d415-fc30d5e30c31@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA838712003@FRAEML521-MBX.china.huawei.com>
	<fd7e2831-86a8-c2a1-fe0c-d9784bc2d3cb@redhat.com>
	<20180711151740.3d119e95@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5e65f669-69f6-53aa-0337-2825ce353b5e@redhat.com>
Date: Thu, 12 Jul 2018 16:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180711151740.3d119e95@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 12 Jul 2018 14:22:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 12 Jul 2018 14:22:12 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [RFC v3 06/15] hw/arm/virt: Allocate device_memory
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "wei@redhat.com" <wei@redhat.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"drjones@redhat.com" <drjones@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"agraf@suse.de" <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6t63s5sDs0IJ

Hi Igor,

On 07/11/2018 03:17 PM, Igor Mammedov wrote:
> On Thu, 5 Jul 2018 16:27:05 +0200
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Shameer,
>>
>> On 07/05/2018 03:19 PM, Shameerali Kolothum Thodi wrote:
>>>   
>>>> -----Original Message-----
>>>> From: Auger Eric [mailto:eric.auger@redhat.com]
>>>> Sent: 05 July 2018 13:18
>>>> To: David Hildenbrand <david@redhat.com>; eric.auger.pro@gmail.com;
>>>> qemu-devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
>>>> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>>>> imammedo@redhat.com
>>>> Cc: wei@redhat.com; drjones@redhat.com; david@gibson.dropbear.id.au;
>>>> dgilbert@redhat.com; agraf@suse.de
>>>> Subject: Re: [Qemu-devel] [RFC v3 06/15] hw/arm/virt: Allocate
>>>> device_memory
>>>>
>>>> Hi David,
>>>>
>>>> On 07/05/2018 02:09 PM, David Hildenbrand wrote:  
>>>>> On 05.07.2018 14:00, Auger Eric wrote:  
>>>>>> Hi David,
>>>>>>
>>>>>> On 07/05/2018 01:54 PM, David Hildenbrand wrote:  
>>>>>>> On 05.07.2018 13:42, Auger Eric wrote:  
>>>>>>>> Hi David,
>>>>>>>>
>>>>>>>> On 07/04/2018 02:05 PM, David Hildenbrand wrote:  
>>>>>>>>> On 03.07.2018 21:27, Auger Eric wrote:  
>>>>>>>>>> Hi David,
>>>>>>>>>> On 07/03/2018 08:25 PM, David Hildenbrand wrote:  
>>>>>>>>>>> On 03.07.2018 09:19, Eric Auger wrote:  
>>>>>>>>>>>> We define a new hotpluggable RAM region (aka. device memory).
>>>>>>>>>>>> Its base is 2TB GPA. This obviously requires 42b IPA support
>>>>>>>>>>>> in KVM/ARM, FW and guest kernel. At the moment the device
>>>>>>>>>>>> memory region is max 2TB.  
>>>>>>>>>>>
>>>>>>>>>>> Maybe a stupid question, but why exactly does it have to start at 2TB
>>>>>>>>>>> (and not e.g. at 1TB)?  
>>>>>>>>>> not a stupid question. See tentative answer below.  
>>>>>>>>>>>  
>>>>>>>>>>>>
>>>>>>>>>>>> This is largely inspired of device memory initialization in
>>>>>>>>>>>> pc machine code.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>>>>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>  hw/arm/virt.c         | 104  
>>>> ++++++++++++++++++++++++++++++++++++--------------  
>>>>>>>>>>>>  include/hw/arm/arm.h  |   2 +
>>>>>>>>>>>>  include/hw/arm/virt.h |   1 +
>>>>>>>>>>>>  3 files changed, 79 insertions(+), 28 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>>>>>>> index 5a4d0bf..6fefb78 100644
>>>>>>>>>>>> --- a/hw/arm/virt.c
>>>>>>>>>>>> +++ b/hw/arm/virt.c
>>>>>>>>>>>> @@ -59,6 +59,7 @@
>>>>>>>>>>>>  #include "qapi/visitor.h"
>>>>>>>>>>>>  #include "standard-headers/linux/input.h"
>>>>>>>>>>>>  #include "hw/arm/smmuv3.h"
>>>>>>>>>>>> +#include "hw/acpi/acpi.h"
>>>>>>>>>>>>
>>>>>>>>>>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>>>>>>>>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc,  
>>>> \  
>>>>>>>>>>>> @@ -94,34 +95,25 @@
>>>>>>>>>>>>
>>>>>>>>>>>>  #define PLATFORM_BUS_NUM_IRQS 64
>>>>>>>>>>>>
>>>>>>>>>>>> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this  
>>>> means  
>>>>>>>>>>>> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
>>>>>>>>>>>> - * address space unallocated and free for future use between 256G  
>>>> and 512G.  
>>>>>>>>>>>> - * If we need to provide more RAM to VMs in the future then we  
>>>> need to:  
>>>>>>>>>>>> - *  * allocate a second bank of RAM starting at 2TB and working up  
>>>>>>>>>> I acknowledge this comment was the main justification. Now if you look  
>>>> at  
>>>>>>>>>>
>>>>>>>>>> Principles of ARM Memory Maps
>>>>>>>>>>  
>>>> http://infocenter.arm.com/help/topic/com.arm.doc.den0001c/DEN0001C_princ
>>>> iples_of_arm_memory_maps.pdf  
>>>>>>>>>> chapter 2.3 you will find that when adding PA bits, you always leave
>>>>>>>>>> space for reserved space and mapped IO.  
>>>>>>>>>
>>>>>>>>> Thanks for the pointer!
>>>>>>>>>
>>>>>>>>> So ... we can fit
>>>>>>>>>
>>>>>>>>> a) 2GB at 2GB
>>>>>>>>> b) 32GB at 32GB
>>>>>>>>> c) 512GB at 512GB
>>>>>>>>> d) 8TB at 8TB
>>>>>>>>> e) 128TB at 128TB
>>>>>>>>>
>>>>>>>>> (this is a nice rule of thumb if I understand it correctly :) )
>>>>>>>>>
>>>>>>>>> We should strive for device memory (maxram_size - ram_size) to fit
>>>>>>>>> exactly into one of these slots (otherwise things get nasty).
>>>>>>>>>
>>>>>>>>> Depending on the ram_size, we might have simpler setups and can  
>>>> support  
>>>>>>>>> more configurations, no?
>>>>>>>>>
>>>>>>>>> E.g. ram_size <= 34GB, device_memory <= 512GB  
>>>>>>>>> -> move ram into a) and b)
>>>>>>>>> -> move device memory into c)  
>>>>>>>>
>>>>>>>> The issue is machvirt doesn't comply with that document.
>>>>>>>> At the moment we have
>>>>>>>> 0 -> 1GB MMIO
>>>>>>>> 1GB -> 256GB RAM
>>>>>>>> 256GB -> 512GB is theoretically reserved for IO but most is free.
>>>>>>>> 512GB -> 1T is reserved for ECAM MMIO range. This is the top of our
>>>>>>>> existing 40b GPA space.
>>>>>>>>
>>>>>>>> We don't want to change this address map due to legacy reasons.
>>>>>>>>  
>>>>>>>
>>>>>>> Thanks, good to know!
>>>>>>>  
>>>>>>>> Another question! do you know if it would be possible to have
>>>>>>>> device_memory region split into several discontinuous segments?  
>>>>>>>
>>>>>>> It can be implemented for sure, but I would try to avoid that, as it
>>>>>>> makes certain configurations impossible (and very end user unfriendly).
>>>>>>>
>>>>>>> E.g. (numbers completely made up, but it should show what I mean)
>>>>>>>
>>>>>>> -m 20G,maxmem=120G:  
>>>>>>> -> Try to add a DIMM with 100G -> error.
>>>>>>> -> But we can add e.g. two DIMMs with 40G and 60G.  
>>>>>>>
>>>>>>> This exposes internal details to the end user. And the end user has no
>>>>>>> idea what is going on.
>>>>>>>
>>>>>>> So I think we should try our best to keep that area consecutive.  
>>>>>>
>>>>>> Actually I didn't sufficiently detail the context. I would like
>>>>>> 1) 1 segment to be exposed to the end-user through slot|maxmem stuff
>>>>>> (what this series targets) and
>>>>>> 2) another segment used to instantiate PC-DIMM for internal needs as
>>>>>> replacement of part of the 1GB -> 256GB static RAM. This was the purpose
>>>>>> of Shameer's original series  
>>>>>
>>>>> I am not sure if PC-DIMMs are exactly what you want for internal purposes.
>>>>>  
>>>>>>
>>>>>> [1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
>>>>>> http://patchwork.ozlabs.org/cover/914694/
>>>>>> This approach is not yet validated though.
>>>>>>
>>>>>> The rationale is sometimes you must have "holes" in RAM as some GPAs
>>>>>> match reserved IOVAs for assigned devices.  
>>>>>
>>>>> So if I understand it correctly, all you want is some memory region that
>>>>> a) contains only initially defined memory
>>>>> b) can have some holes in it
>>>>>
>>>>> This is exactly what x86 already does (pc_memory_init): Simply construct
>>>>> your own memory region leaving holes in it.
>>>>>
>>>>>
>>>>> memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", ram,
>>>>>                          0, pcms->below_4g_mem_size);
>>>>> memory_region_add_subregion(system_memory, 0, ram_below_4g);
>>>>> ...
>>>>> if (pcms->above_4g_mem_size > 0)
>>>>>     memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g", ram,
>>>>>     ...
>>>>>     memory_region_add_subregion(system_memory, 0x100000000ULL,
>>>>>     ...
>>>>>
>>>>> They "indicate" these different GPA areas using the e820 map to the guest.
>>>>>
>>>>> Would that also work for you?  
>>>>
>>>> I would tentatively say yes. Effectively I am not sure that if we were
>>>> to actually put holes in the 1G-256GB RAM segment, PC-DIMM would be the
>>>> natural choice. Also the reserved IOVA issue impacts the device_memory
>>>> region area I think. I am skeptical about the fact we can put holes in
>>>> static RAM and device_memory regions like that.
> Could we just use a single device_memory region for both initial+hotpluggable
> RAM if we make base RAM address dynamic?
This assumes FW does support dynamic RAM base. If I understand correctly
this is not the case. Also there is the problematic of migration. How
would you migrate between guests whose RAM is not laid out at the same
place? I understood hotplug memory relied on a specific device_memory
region. So do you mean we would have 2 contiguous regions?
> In this case RAM could start wherever there is a free space for maxmem
> (if there is free space in lowmem, put device_memory there, otherwise put
> it somewhere in high mem) and we won't care if there is IOVA or not.
> 
> *I don't have a clue about iommus, so here goes a stupid question*
> I agree with Peter that whole IOVA thing looks broken, when host
> layout dictates the guest's one.
> Shouldn't be there somewhere an iommu that would remap host map into
> guest specific one? (so guest would model board we need and be migrate-able
> instead of mimicking host hw)
The issue is related to IOVAs programmed by the guest in the host
assigned devices. DMA requests issued by the assigned devices using
those IOVAs are supposed to reach the guest RAM. But due to the host
topology they won't (host PCI host bridge windows or MSI reserved
regions). Adding a vIOMMU on guest side effectively allows to use IOVAs
!= GPAs but guest is exposed to that change. Adding this extra
translation stage adds a huge performance penalty. And eventually the
IOVA allocator used in the guest should theoretically be aware of host
reserved regions as well.

> 
> 
>>> The first approach[1] we had to address the holes in memory was using
>>> the memory alias way mentioned above.  And based on Drew's review, the
>>> pc-dimm way of handling was introduced. I think the main argument was that
>>> it will be useful when we eventually support hotplug.  
>>
>> That's my understanding too.
> not only hotplug,
> 
>   a RAM memory region that's split by aliases is difficult to handle
>   as it creates nonlinear GPA<->HVA mapping instead of
>   1:1 mapping of pc-dimm,
>   so if one needs to build HVA<->GPA map for a given MemoryRegion
>   in case of aliases one would have to get list of MemorySections
>   that belong to it and build map from that vs (addr + offset) in
>   case of simple 1:1 mapping.
> 
>   complicated machine specific SRAT/e820 code due to holes
>   /grep 'the memory map is a bit tricky'/
> 
>>  But since that is added
>>> anyway as part of this series, I am not sure we have any other benefit in
>>> modeling it as pc-dimm. May be I am missing something here.  
>>
>> I tentatively agree with you. I was trying to understand if the
>> device_memory region was fitting the original needs too but I think
>> standard alias approach is more adapted to hole creation.
> Aliases are easy way to start with, but as compat knobs grow
> (based on PC experience,  grep 'Calculate ram split')
> It's quite a pain to maintain manual implicit aliases layout
> without breaking it by accident.
> We probably won't be able to get rid of aliases on PC for legacy
> reasons but why introduce the same pain to virt board.
> 
> Well, magical conversion from -m X to 2..y memory regions (aliases or not)
> aren't going to be easy in both cases, especially if one would take into
> account "-numa memdev|mem".
> I'd rather use a single pc-dimm approach for both /initial and hotpluggble RAM/
> and then use device_memory framework to enumerate RAM wherever needed (ACPI/DT)
> in inform way.
We have 2 problematics:
- support more RAM. This can be achieved by adding a single memory
region based on DIMMs
- manage IOVA reserved regions. I don't think we have a consensus on the
solution at the moment. What about migration between 2 guests having a
different memory topogy?

Thanks

Eric
> 
> 
>> Thanks
>>
>> Eric
>>>
>>> Thanks,
>>> Shameer
>>>
>>> [1]. https://lists.gnu.org/archive/html/qemu-arm/2018-04/msg00243.html
>>>
>>>   
>>>> Thanks!
>>>>
>>>> Eric  
>>>>>  
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>> Eric
>>>>>>  
>>>>>>>  
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>>
>>>>>>>> Eric  
>>>>>>>
>>>>>>>  
>>>>>
>>>>>  
> 
> 
