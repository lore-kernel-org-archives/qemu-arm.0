Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp201121wrq;
        Wed, 11 Jul 2018 06:18:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcP37QsfbkuDLtLnCjDO8XVIUYT7UkCdwKUDl19i6zpDujH8o8LURU9DpKdpBVsMZjqsSXU
X-Received: by 2002:ac8:6c3:: with SMTP id j3-v6mr27427620qth.138.1531315083688;
        Wed, 11 Jul 2018 06:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531315083; cv=none;
        d=google.com; s=arc-20160816;
        b=Nuly1Z7XpZCY7Fq9LOQ0Sm9h2LtorKAru0Q8+InaiH4huwkpVOdbfeIL9M64GBXhpJ
         NgMAnAlNtufWoTlQW76CL7mZMKDPmvXJoQxtZ6XxW4VWtCA+UL39MoI4r4W9Xh14ZcU8
         usV6NiuGhvqdVK5tWyd/cuvrIDgfP658dppooW95EpfEzmGM/yeb/fvLg/dm8cNPPEZT
         o+jY1dp6q5yhi3jPrMpXRxPUwvdI//EcALYTbu5Zh2DtUkzVJTCdKfMzKnWXxhSYzamK
         KkxdXjPA7xdE4C4cFwWy51O5eX0pgIFY199aJWd1psWtxILKcQXszjCOXp0b/b1WArmB
         4jMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=s+z4u0PP7cSILZDr9U+I88PduxlwcYhIvkjG6PQcJSk=;
        b=qXPsEN+KCAP9TBLk1gEAzbNqyJgdPFPp/DPxHdeyxqM5xdS5oUGg5NpI9GrZHFcE/f
         VAA5ZAJHjg5lfOycGwIH5y1jfCsTfbBs/77aeHAtcSsroaOtVyPnK4CetoFgYYap4B0O
         pqVJ0MpioxbegVRyH/aHy1rSNM696fWWZbf07SkeSQzhIGyf5Q8mXSyGVAZcMbfWVRHH
         mMoyYjOhtCdRmU4Xnx+5T8qP9GHA3qifcgiA0/1lbErWl2Uh0aEwtsNBDyoQ9iOwzInP
         +/Ysg4DAxEFFF/KQUyPJr04soy8rtt207f6Lh9s6v9fswqk3REImb3vP1GklpybTEMzs
         01pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e36-v6si96055qtc.139.2018.07.11.06.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 06:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdF0N-0004MI-7q
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 09:18:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fdF0F-0004KU-P2
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 09:17:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fdF0C-0001Rs-2d
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 09:17:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40916 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fdF0B-0001Rg-SW; Wed, 11 Jul 2018 09:17:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7420400B45A;
	Wed, 11 Jul 2018 13:17:50 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87CCA1C581;
	Wed, 11 Jul 2018 13:17:41 +0000 (UTC)
Date: Wed, 11 Jul 2018 15:17:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180711151740.3d119e95@redhat.com>
In-Reply-To: <fd7e2831-86a8-c2a1-fe0c-d9784bc2d3cb@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 11 Jul 2018 13:17:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 11 Jul 2018 13:17:50 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"drjones@redhat.com" <drjones@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"agraf@suse.de" <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4wYFpYm8yWr1

On Thu, 5 Jul 2018 16:27:05 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Shameer,
> 
> On 07/05/2018 03:19 PM, Shameerali Kolothum Thodi wrote:
> >   
> >> -----Original Message-----
> >> From: Auger Eric [mailto:eric.auger@redhat.com]
> >> Sent: 05 July 2018 13:18
> >> To: David Hildenbrand <david@redhat.com>; eric.auger.pro@gmail.com;
> >> qemu-devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
> >> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> >> imammedo@redhat.com
> >> Cc: wei@redhat.com; drjones@redhat.com; david@gibson.dropbear.id.au;
> >> dgilbert@redhat.com; agraf@suse.de
> >> Subject: Re: [Qemu-devel] [RFC v3 06/15] hw/arm/virt: Allocate
> >> device_memory
> >>
> >> Hi David,
> >>
> >> On 07/05/2018 02:09 PM, David Hildenbrand wrote:  
> >>> On 05.07.2018 14:00, Auger Eric wrote:  
> >>>> Hi David,
> >>>>
> >>>> On 07/05/2018 01:54 PM, David Hildenbrand wrote:  
> >>>>> On 05.07.2018 13:42, Auger Eric wrote:  
> >>>>>> Hi David,
> >>>>>>
> >>>>>> On 07/04/2018 02:05 PM, David Hildenbrand wrote:  
> >>>>>>> On 03.07.2018 21:27, Auger Eric wrote:  
> >>>>>>>> Hi David,
> >>>>>>>> On 07/03/2018 08:25 PM, David Hildenbrand wrote:  
> >>>>>>>>> On 03.07.2018 09:19, Eric Auger wrote:  
> >>>>>>>>>> We define a new hotpluggable RAM region (aka. device memory).
> >>>>>>>>>> Its base is 2TB GPA. This obviously requires 42b IPA support
> >>>>>>>>>> in KVM/ARM, FW and guest kernel. At the moment the device
> >>>>>>>>>> memory region is max 2TB.  
> >>>>>>>>>
> >>>>>>>>> Maybe a stupid question, but why exactly does it have to start at 2TB
> >>>>>>>>> (and not e.g. at 1TB)?  
> >>>>>>>> not a stupid question. See tentative answer below.  
> >>>>>>>>>  
> >>>>>>>>>>
> >>>>>>>>>> This is largely inspired of device memory initialization in
> >>>>>>>>>> pc machine code.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>>>>>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> >>>>>>>>>> ---
> >>>>>>>>>>  hw/arm/virt.c         | 104  
> >> ++++++++++++++++++++++++++++++++++++--------------  
> >>>>>>>>>>  include/hw/arm/arm.h  |   2 +
> >>>>>>>>>>  include/hw/arm/virt.h |   1 +
> >>>>>>>>>>  3 files changed, 79 insertions(+), 28 deletions(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>>>>>>>> index 5a4d0bf..6fefb78 100644
> >>>>>>>>>> --- a/hw/arm/virt.c
> >>>>>>>>>> +++ b/hw/arm/virt.c
> >>>>>>>>>> @@ -59,6 +59,7 @@
> >>>>>>>>>>  #include "qapi/visitor.h"
> >>>>>>>>>>  #include "standard-headers/linux/input.h"
> >>>>>>>>>>  #include "hw/arm/smmuv3.h"
> >>>>>>>>>> +#include "hw/acpi/acpi.h"
> >>>>>>>>>>
> >>>>>>>>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> >>>>>>>>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc,  
> >> \  
> >>>>>>>>>> @@ -94,34 +95,25 @@
> >>>>>>>>>>
> >>>>>>>>>>  #define PLATFORM_BUS_NUM_IRQS 64
> >>>>>>>>>>
> >>>>>>>>>> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this  
> >> means  
> >>>>>>>>>> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
> >>>>>>>>>> - * address space unallocated and free for future use between 256G  
> >> and 512G.  
> >>>>>>>>>> - * If we need to provide more RAM to VMs in the future then we  
> >> need to:  
> >>>>>>>>>> - *  * allocate a second bank of RAM starting at 2TB and working up  
> >>>>>>>> I acknowledge this comment was the main justification. Now if you look  
> >> at  
> >>>>>>>>
> >>>>>>>> Principles of ARM Memory Maps
> >>>>>>>>  
> >> http://infocenter.arm.com/help/topic/com.arm.doc.den0001c/DEN0001C_princ
> >> iples_of_arm_memory_maps.pdf  
> >>>>>>>> chapter 2.3 you will find that when adding PA bits, you always leave
> >>>>>>>> space for reserved space and mapped IO.  
> >>>>>>>
> >>>>>>> Thanks for the pointer!
> >>>>>>>
> >>>>>>> So ... we can fit
> >>>>>>>
> >>>>>>> a) 2GB at 2GB
> >>>>>>> b) 32GB at 32GB
> >>>>>>> c) 512GB at 512GB
> >>>>>>> d) 8TB at 8TB
> >>>>>>> e) 128TB at 128TB
> >>>>>>>
> >>>>>>> (this is a nice rule of thumb if I understand it correctly :) )
> >>>>>>>
> >>>>>>> We should strive for device memory (maxram_size - ram_size) to fit
> >>>>>>> exactly into one of these slots (otherwise things get nasty).
> >>>>>>>
> >>>>>>> Depending on the ram_size, we might have simpler setups and can  
> >> support  
> >>>>>>> more configurations, no?
> >>>>>>>
> >>>>>>> E.g. ram_size <= 34GB, device_memory <= 512GB  
> >>>>>>> -> move ram into a) and b)
> >>>>>>> -> move device memory into c)  
> >>>>>>
> >>>>>> The issue is machvirt doesn't comply with that document.
> >>>>>> At the moment we have
> >>>>>> 0 -> 1GB MMIO
> >>>>>> 1GB -> 256GB RAM
> >>>>>> 256GB -> 512GB is theoretically reserved for IO but most is free.
> >>>>>> 512GB -> 1T is reserved for ECAM MMIO range. This is the top of our
> >>>>>> existing 40b GPA space.
> >>>>>>
> >>>>>> We don't want to change this address map due to legacy reasons.
> >>>>>>  
> >>>>>
> >>>>> Thanks, good to know!
> >>>>>  
> >>>>>> Another question! do you know if it would be possible to have
> >>>>>> device_memory region split into several discontinuous segments?  
> >>>>>
> >>>>> It can be implemented for sure, but I would try to avoid that, as it
> >>>>> makes certain configurations impossible (and very end user unfriendly).
> >>>>>
> >>>>> E.g. (numbers completely made up, but it should show what I mean)
> >>>>>
> >>>>> -m 20G,maxmem=120G:  
> >>>>> -> Try to add a DIMM with 100G -> error.
> >>>>> -> But we can add e.g. two DIMMs with 40G and 60G.  
> >>>>>
> >>>>> This exposes internal details to the end user. And the end user has no
> >>>>> idea what is going on.
> >>>>>
> >>>>> So I think we should try our best to keep that area consecutive.  
> >>>>
> >>>> Actually I didn't sufficiently detail the context. I would like
> >>>> 1) 1 segment to be exposed to the end-user through slot|maxmem stuff
> >>>> (what this series targets) and
> >>>> 2) another segment used to instantiate PC-DIMM for internal needs as
> >>>> replacement of part of the 1GB -> 256GB static RAM. This was the purpose
> >>>> of Shameer's original series  
> >>>
> >>> I am not sure if PC-DIMMs are exactly what you want for internal purposes.
> >>>  
> >>>>
> >>>> [1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
> >>>> http://patchwork.ozlabs.org/cover/914694/
> >>>> This approach is not yet validated though.
> >>>>
> >>>> The rationale is sometimes you must have "holes" in RAM as some GPAs
> >>>> match reserved IOVAs for assigned devices.  
> >>>
> >>> So if I understand it correctly, all you want is some memory region that
> >>> a) contains only initially defined memory
> >>> b) can have some holes in it
> >>>
> >>> This is exactly what x86 already does (pc_memory_init): Simply construct
> >>> your own memory region leaving holes in it.
> >>>
> >>>
> >>> memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", ram,
> >>>                          0, pcms->below_4g_mem_size);
> >>> memory_region_add_subregion(system_memory, 0, ram_below_4g);
> >>> ...
> >>> if (pcms->above_4g_mem_size > 0)
> >>>     memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g", ram,
> >>>     ...
> >>>     memory_region_add_subregion(system_memory, 0x100000000ULL,
> >>>     ...
> >>>
> >>> They "indicate" these different GPA areas using the e820 map to the guest.
> >>>
> >>> Would that also work for you?  
> >>
> >> I would tentatively say yes. Effectively I am not sure that if we were
> >> to actually put holes in the 1G-256GB RAM segment, PC-DIMM would be the
> >> natural choice. Also the reserved IOVA issue impacts the device_memory
> >> region area I think. I am skeptical about the fact we can put holes in
> >> static RAM and device_memory regions like that.
Could we just use a single device_memory region for both initial+hotpluggable
RAM if we make base RAM address dynamic?
In this case RAM could start wherever there is a free space for maxmem
(if there is free space in lowmem, put device_memory there, otherwise put
it somewhere in high mem) and we won't care if there is IOVA or not.

*I don't have a clue about iommus, so here goes a stupid question*
I agree with Peter that whole IOVA thing looks broken, when host
layout dictates the guest's one.
Shouldn't be there somewhere an iommu that would remap host map into
guest specific one? (so guest would model board we need and be migrate-able
instead of mimicking host hw)


> > The first approach[1] we had to address the holes in memory was using
> > the memory alias way mentioned above.  And based on Drew's review, the
> > pc-dimm way of handling was introduced. I think the main argument was that
> > it will be useful when we eventually support hotplug.  
> 
> That's my understanding too.
not only hotplug,

  a RAM memory region that's split by aliases is difficult to handle
  as it creates nonlinear GPA<->HVA mapping instead of
  1:1 mapping of pc-dimm,
  so if one needs to build HVA<->GPA map for a given MemoryRegion
  in case of aliases one would have to get list of MemorySections
  that belong to it and build map from that vs (addr + offset) in
  case of simple 1:1 mapping.

  complicated machine specific SRAT/e820 code due to holes
  /grep 'the memory map is a bit tricky'/

>  But since that is added
> > anyway as part of this series, I am not sure we have any other benefit in
> > modeling it as pc-dimm. May be I am missing something here.  
> 
> I tentatively agree with you. I was trying to understand if the
> device_memory region was fitting the original needs too but I think
> standard alias approach is more adapted to hole creation.
Aliases are easy way to start with, but as compat knobs grow
(based on PC experience,  grep 'Calculate ram split')
It's quite a pain to maintain manual implicit aliases layout
without breaking it by accident.
We probably won't be able to get rid of aliases on PC for legacy
reasons but why introduce the same pain to virt board.

Well, magical conversion from -m X to 2..y memory regions (aliases or not)
aren't going to be easy in both cases, especially if one would take into
account "-numa memdev|mem".
I'd rather use a single pc-dimm approach for both /initial and hotpluggble RAM/
and then use device_memory framework to enumerate RAM wherever needed (ACPI/DT)
in inform way.


> Thanks
> 
> Eric
> > 
> > Thanks,
> > Shameer
> > 
> > [1]. https://lists.gnu.org/archive/html/qemu-arm/2018-04/msg00243.html
> > 
> >   
> >> Thanks!
> >>
> >> Eric  
> >>>  
> >>>>
> >>>> Thanks
> >>>>
> >>>> Eric
> >>>>  
> >>>>>  
> >>>>>>
> >>>>>> Thanks
> >>>>>>
> >>>>>> Eric  
> >>>>>
> >>>>>  
> >>>
> >>>  

