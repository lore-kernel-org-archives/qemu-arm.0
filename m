Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1671307wrq;
        Thu, 5 Jul 2018 07:27:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfwCEQkaegyptMNNJQUfAb/qT/KLsYC52wpYpsvbj4NXElbHEsD1y5g7eojaOGvCA20Bs8i
X-Received: by 2002:a37:15aa:: with SMTP id 42-v6mr5321480qkv.428.1530800850918;
        Thu, 05 Jul 2018 07:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530800850; cv=none;
        d=google.com; s=arc-20160816;
        b=0qnUAG/CSqcEuuH0SL9/49+JNyYfPnTOSW5yyNAZv+PejYCCh5fqnxjKGpmysSISoL
         iqNdY5ZF+YD9a2yiI7qXvx+WruQREvC/7KYfpGTKHoHTuxfvL/MAJ6gBzxfDrLJF3WsR
         18LDUtOzB7jH/9Cut/MvFdyxc9wig/JMZkwvq7S1nvXY1045vaH4Q4nDEBzk49C3Ract
         3MVhn9W2ygn94nVCIxLkeCwtTBB7G3gaviGu32RHBmz5DrBY4BzwJ/9Gb0oYmEt2sBfw
         7QmGjIIqw0ZWQxOBduLaSK2dr/a2DuHzOMRSyIDOTrODAi+GFwEDFQznvrzo/lcSh5na
         kf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=tWRleMZfTck0iwPnHj0fDmtnyT3Hk/7zBw7aS+CGAbk=;
        b=0xb6M/ntEU/YoYVyJHI7w279jjZuoUHswrt1PldnLnkji+82IHlBEbdwI1hSYNk9CO
         e4bhwWCcAnnJtsriE4fhRC5ydEqUJEgKo5h3CCJnB7NtsLoevb3IhE5PmGpMiyjX78te
         /mxtShk6tjn0tPob8lVlN5nYJuxqTI77I66nhz7kvcafBnTK2vBX3r7PK8de4XGFKoE6
         e/G1bNW5u4WJH/RjAvboVwJnOBEbJ0qX4qYEoZNdrYtEdqCoY556bi3ggeJXK95aeizX
         DOeSlAehDNFUK0fo0mp1cqAPMIkGymHSDquvtkhg0/wjXuawedCmGWj1rNvSAW/q9Met
         KmAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3-v6si5233232qvo.55.2018.07.05.07.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 07:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb5EI-0003kO-Ef
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 10:27:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fb5E6-0003iR-1s
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 10:27:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fb5E2-0002Cg-DU
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 10:27:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50650 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fb5E2-0002BB-6s; Thu, 05 Jul 2018 10:27:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B949987928;
	Thu,  5 Jul 2018 14:27:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-118.ams2.redhat.com
	[10.36.116.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 168E8111E418;
	Thu,  5 Jul 2018 14:27:06 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>
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
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fd7e2831-86a8-c2a1-fe0c-d9784bc2d3cb@redhat.com>
Date: Thu, 5 Jul 2018 16:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA838712003@FRAEML521-MBX.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 05 Jul 2018 14:27:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 05 Jul 2018 14:27:13 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 06/15] hw/arm/virt: Allocate
 device_memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "drjones@redhat.com" <drjones@redhat.com>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
	"agraf@suse.de" <agraf@suse.de>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jMns/KA5FoXC

Hi Shameer,

On 07/05/2018 03:19 PM, Shameerali Kolothum Thodi wrote:
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: 05 July 2018 13:18
>> To: David Hildenbrand <david@redhat.com>; eric.auger.pro@gmail.com;
>> qemu-devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
>> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> imammedo@redhat.com
>> Cc: wei@redhat.com; drjones@redhat.com; david@gibson.dropbear.id.au;
>> dgilbert@redhat.com; agraf@suse.de
>> Subject: Re: [Qemu-devel] [RFC v3 06/15] hw/arm/virt: Allocate
>> device_memory
>>
>> Hi David,
>>
>> On 07/05/2018 02:09 PM, David Hildenbrand wrote:
>>> On 05.07.2018 14:00, Auger Eric wrote:
>>>> Hi David,
>>>>
>>>> On 07/05/2018 01:54 PM, David Hildenbrand wrote:
>>>>> On 05.07.2018 13:42, Auger Eric wrote:
>>>>>> Hi David,
>>>>>>
>>>>>> On 07/04/2018 02:05 PM, David Hildenbrand wrote:
>>>>>>> On 03.07.2018 21:27, Auger Eric wrote:
>>>>>>>> Hi David,
>>>>>>>> On 07/03/2018 08:25 PM, David Hildenbrand wrote:
>>>>>>>>> On 03.07.2018 09:19, Eric Auger wrote:
>>>>>>>>>> We define a new hotpluggable RAM region (aka. device memory).
>>>>>>>>>> Its base is 2TB GPA. This obviously requires 42b IPA support
>>>>>>>>>> in KVM/ARM, FW and guest kernel. At the moment the device
>>>>>>>>>> memory region is max 2TB.
>>>>>>>>>
>>>>>>>>> Maybe a stupid question, but why exactly does it have to start at 2TB
>>>>>>>>> (and not e.g. at 1TB)?
>>>>>>>> not a stupid question. See tentative answer below.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> This is largely inspired of device memory initialization in
>>>>>>>>>> pc machine code.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>>>>>>>> ---
>>>>>>>>>>  hw/arm/virt.c         | 104
>> ++++++++++++++++++++++++++++++++++++--------------
>>>>>>>>>>  include/hw/arm/arm.h  |   2 +
>>>>>>>>>>  include/hw/arm/virt.h |   1 +
>>>>>>>>>>  3 files changed, 79 insertions(+), 28 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>>>>> index 5a4d0bf..6fefb78 100644
>>>>>>>>>> --- a/hw/arm/virt.c
>>>>>>>>>> +++ b/hw/arm/virt.c
>>>>>>>>>> @@ -59,6 +59,7 @@
>>>>>>>>>>  #include "qapi/visitor.h"
>>>>>>>>>>  #include "standard-headers/linux/input.h"
>>>>>>>>>>  #include "hw/arm/smmuv3.h"
>>>>>>>>>> +#include "hw/acpi/acpi.h"
>>>>>>>>>>
>>>>>>>>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>>>>>>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc,
>> \
>>>>>>>>>> @@ -94,34 +95,25 @@
>>>>>>>>>>
>>>>>>>>>>  #define PLATFORM_BUS_NUM_IRQS 64
>>>>>>>>>>
>>>>>>>>>> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this
>> means
>>>>>>>>>> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
>>>>>>>>>> - * address space unallocated and free for future use between 256G
>> and 512G.
>>>>>>>>>> - * If we need to provide more RAM to VMs in the future then we
>> need to:
>>>>>>>>>> - *  * allocate a second bank of RAM starting at 2TB and working up
>>>>>>>> I acknowledge this comment was the main justification. Now if you look
>> at
>>>>>>>>
>>>>>>>> Principles of ARM Memory Maps
>>>>>>>>
>> http://infocenter.arm.com/help/topic/com.arm.doc.den0001c/DEN0001C_princ
>> iples_of_arm_memory_maps.pdf
>>>>>>>> chapter 2.3 you will find that when adding PA bits, you always leave
>>>>>>>> space for reserved space and mapped IO.
>>>>>>>
>>>>>>> Thanks for the pointer!
>>>>>>>
>>>>>>> So ... we can fit
>>>>>>>
>>>>>>> a) 2GB at 2GB
>>>>>>> b) 32GB at 32GB
>>>>>>> c) 512GB at 512GB
>>>>>>> d) 8TB at 8TB
>>>>>>> e) 128TB at 128TB
>>>>>>>
>>>>>>> (this is a nice rule of thumb if I understand it correctly :) )
>>>>>>>
>>>>>>> We should strive for device memory (maxram_size - ram_size) to fit
>>>>>>> exactly into one of these slots (otherwise things get nasty).
>>>>>>>
>>>>>>> Depending on the ram_size, we might have simpler setups and can
>> support
>>>>>>> more configurations, no?
>>>>>>>
>>>>>>> E.g. ram_size <= 34GB, device_memory <= 512GB
>>>>>>> -> move ram into a) and b)
>>>>>>> -> move device memory into c)
>>>>>>
>>>>>> The issue is machvirt doesn't comply with that document.
>>>>>> At the moment we have
>>>>>> 0 -> 1GB MMIO
>>>>>> 1GB -> 256GB RAM
>>>>>> 256GB -> 512GB is theoretically reserved for IO but most is free.
>>>>>> 512GB -> 1T is reserved for ECAM MMIO range. This is the top of our
>>>>>> existing 40b GPA space.
>>>>>>
>>>>>> We don't want to change this address map due to legacy reasons.
>>>>>>
>>>>>
>>>>> Thanks, good to know!
>>>>>
>>>>>> Another question! do you know if it would be possible to have
>>>>>> device_memory region split into several discontinuous segments?
>>>>>
>>>>> It can be implemented for sure, but I would try to avoid that, as it
>>>>> makes certain configurations impossible (and very end user unfriendly).
>>>>>
>>>>> E.g. (numbers completely made up, but it should show what I mean)
>>>>>
>>>>> -m 20G,maxmem=120G:
>>>>> -> Try to add a DIMM with 100G -> error.
>>>>> -> But we can add e.g. two DIMMs with 40G and 60G.
>>>>>
>>>>> This exposes internal details to the end user. And the end user has no
>>>>> idea what is going on.
>>>>>
>>>>> So I think we should try our best to keep that area consecutive.
>>>>
>>>> Actually I didn't sufficiently detail the context. I would like
>>>> 1) 1 segment to be exposed to the end-user through slot|maxmem stuff
>>>> (what this series targets) and
>>>> 2) another segment used to instantiate PC-DIMM for internal needs as
>>>> replacement of part of the 1GB -> 256GB static RAM. This was the purpose
>>>> of Shameer's original series
>>>
>>> I am not sure if PC-DIMMs are exactly what you want for internal purposes.
>>>
>>>>
>>>> [1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
>>>> http://patchwork.ozlabs.org/cover/914694/
>>>> This approach is not yet validated though.
>>>>
>>>> The rationale is sometimes you must have "holes" in RAM as some GPAs
>>>> match reserved IOVAs for assigned devices.
>>>
>>> So if I understand it correctly, all you want is some memory region that
>>> a) contains only initially defined memory
>>> b) can have some holes in it
>>>
>>> This is exactly what x86 already does (pc_memory_init): Simply construct
>>> your own memory region leaving holes in it.
>>>
>>>
>>> memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", ram,
>>>                          0, pcms->below_4g_mem_size);
>>> memory_region_add_subregion(system_memory, 0, ram_below_4g);
>>> ...
>>> if (pcms->above_4g_mem_size > 0)
>>>     memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g", ram,
>>>     ...
>>>     memory_region_add_subregion(system_memory, 0x100000000ULL,
>>>     ...
>>>
>>> They "indicate" these different GPA areas using the e820 map to the guest.
>>>
>>> Would that also work for you?
>>
>> I would tentatively say yes. Effectively I am not sure that if we were
>> to actually put holes in the 1G-256GB RAM segment, PC-DIMM would be the
>> natural choice. Also the reserved IOVA issue impacts the device_memory
>> region area I think. I am skeptical about the fact we can put holes in
>> static RAM and device_memory regions like that.
> 
> The first approach[1] we had to address the holes in memory was using
> the memory alias way mentioned above.  And based on Drew's review, the
> pc-dimm way of handling was introduced. I think the main argument was that
> it will be useful when we eventually support hotplug.

That's my understanding too.

 But since that is added
> anyway as part of this series, I am not sure we have any other benefit in
> modeling it as pc-dimm. May be I am missing something here.

I tentatively agree with you. I was trying to understand if the
device_memory region was fitting the original needs too but I think
standard alias approach is more adapted to hole creation.

Thanks

Eric
> 
> Thanks,
> Shameer
> 
> [1]. https://lists.gnu.org/archive/html/qemu-arm/2018-04/msg00243.html
> 
> 
>> Thanks!
>>
>> Eric
>>>
>>>>
>>>> Thanks
>>>>
>>>> Eric
>>>>
>>>>>
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>> Eric
>>>>>
>>>>>
>>>
>>>
