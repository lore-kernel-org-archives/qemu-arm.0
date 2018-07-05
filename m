Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1528946wrq;
        Thu, 5 Jul 2018 05:08:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpedWxlTdVPhQIqETN4DrZvDiJ10g/9WIDm5QU7V9+ST4YuyUIU+19vOH429w0Tfbu6Jg1ZU
X-Received: by 2002:ac8:34b2:: with SMTP id w47-v6mr4883171qtb.172.1530792509581;
        Thu, 05 Jul 2018 05:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530792509; cv=none;
        d=google.com; s=arc-20160816;
        b=x1sdcS5EcMKCHJKw7mFgip/2azFt/pw5Oq2EL7bl+/NTEalGzCTVs/SmjlZbrrxO4q
         HuSftjzVh5cPvWhHWMqudFimHdBP4KLjmfNS3ez9dEcYCk2fkyS/wWsgPg7ehRXIujlL
         sc4Kcii522QInI9XeFPbHyfU/nVuI4Pclfe/gfc61GdFHifNCafFOYyPgtpz6B26mCVF
         AX80C3YSFd5eUg2Kps0omSH/L8U3uwKY32jw9pYobGfNLLABxuTVwX3fAUSBbEx7R/3b
         AvLanV6/Py9pQ3kivuZ1JEkdasVZDBtbsi4bp4LBl+iFF9YWDZguWq3H2UtHpgrBzgx2
         BaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=sXtvku4AjiiXwjg98hXXfmZ33WcgMEw/lt6QPfC1xEM=;
        b=w1KESot9mRurBvh6phgwzgxD4G9ZvFSfrHONHDhIxDm4S3wZgnFpljonGeMGF8IuUy
         KSfjMq6czwmTsTHEuT0WwGyV81+nMxx5R2qxgOBqxCQj2DotUCGjawH7VNv0m3RfyYXy
         v7AMbAtxl54+h1VY6SHdJdiX3oF8hhRbdH1ZjiQfCHQayvkk7+l1kL66lEN5yYZAqAAW
         TbwzpQFnR4RIpthzuk7dD7m+D04L8BXDL0H2cMqSVSlmVM/dVGM/37JZAY0qGsdj562L
         Uoc5DAC9Ah7fN5C0tAQt11+d1OaGlPbq28U7WIw6f06GPhbpkiweSzrSPEkG7hmVnk3N
         aukg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2-v6si5223772qtb.345.2018.07.05.05.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 05:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb33k-0007AB-Vq
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 08:08:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fb2wf-0001mw-9h
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 08:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fb2wY-0006Oz-UZ
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 08:01:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44312 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fb2wT-00063Z-29; Thu, 05 Jul 2018 08:00:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79B6D87A72;
	Thu,  5 Jul 2018 12:00:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-118.ams2.redhat.com
	[10.36.116.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D4C32156700;
	Thu,  5 Jul 2018 12:00:54 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-7-git-send-email-eric.auger@redhat.com>
	<a856ba3a-c211-5f35-4023-97ef73eb5c31@redhat.com>
	<df091f31-6f85-64d8-0c3b-7fd463d31c63@redhat.com>
	<43c1349e-1ca6-4890-07c0-7bfa35ab914d@redhat.com>
	<5311fed5-7f13-a177-b967-db6e3ed028b9@redhat.com>
	<405e3f2b-3044-d7fc-8df4-b07a8487470f@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f2d61062-21df-4478-bc61-c32e92329cf8@redhat.com>
Date: Thu, 5 Jul 2018 14:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <405e3f2b-3044-d7fc-8df4-b07a8487470f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 05 Jul 2018 12:00:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 05 Jul 2018 12:00:56 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
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
Cc: wei@redhat.com, agraf@suse.de, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hHQ77uQMDwKL

Hi David,

On 07/05/2018 01:54 PM, David Hildenbrand wrote:
> On 05.07.2018 13:42, Auger Eric wrote:
>> Hi David,
>>
>> On 07/04/2018 02:05 PM, David Hildenbrand wrote:
>>> On 03.07.2018 21:27, Auger Eric wrote:
>>>> Hi David,
>>>> On 07/03/2018 08:25 PM, David Hildenbrand wrote:
>>>>> On 03.07.2018 09:19, Eric Auger wrote:
>>>>>> We define a new hotpluggable RAM region (aka. device memory).
>>>>>> Its base is 2TB GPA. This obviously requires 42b IPA support
>>>>>> in KVM/ARM, FW and guest kernel. At the moment the device
>>>>>> memory region is max 2TB.
>>>>>
>>>>> Maybe a stupid question, but why exactly does it have to start at 2TB
>>>>> (and not e.g. at 1TB)?
>>>> not a stupid question. See tentative answer below.
>>>>>
>>>>>>
>>>>>> This is largely inspired of device memory initialization in
>>>>>> pc machine code.
>>>>>>
>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>>>> ---
>>>>>>  hw/arm/virt.c         | 104 ++++++++++++++++++++++++++++++++++++--------------
>>>>>>  include/hw/arm/arm.h  |   2 +
>>>>>>  include/hw/arm/virt.h |   1 +
>>>>>>  3 files changed, 79 insertions(+), 28 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>> index 5a4d0bf..6fefb78 100644
>>>>>> --- a/hw/arm/virt.c
>>>>>> +++ b/hw/arm/virt.c
>>>>>> @@ -59,6 +59,7 @@
>>>>>>  #include "qapi/visitor.h"
>>>>>>  #include "standard-headers/linux/input.h"
>>>>>>  #include "hw/arm/smmuv3.h"
>>>>>> +#include "hw/acpi/acpi.h"
>>>>>>  
>>>>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>>>>>> @@ -94,34 +95,25 @@
>>>>>>  
>>>>>>  #define PLATFORM_BUS_NUM_IRQS 64
>>>>>>  
>>>>>> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
>>>>>> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
>>>>>> - * address space unallocated and free for future use between 256G and 512G.
>>>>>> - * If we need to provide more RAM to VMs in the future then we need to:
>>>>>> - *  * allocate a second bank of RAM starting at 2TB and working up
>>>> I acknowledge this comment was the main justification. Now if you look at
>>>>
>>>> Principles of ARM Memory Maps
>>>> http://infocenter.arm.com/help/topic/com.arm.doc.den0001c/DEN0001C_principles_of_arm_memory_maps.pdf
>>>> chapter 2.3 you will find that when adding PA bits, you always leave
>>>> space for reserved space and mapped IO.
>>>
>>> Thanks for the pointer!
>>>
>>> So ... we can fit
>>>
>>> a) 2GB at 2GB
>>> b) 32GB at 32GB
>>> c) 512GB at 512GB
>>> d) 8TB at 8TB
>>> e) 128TB at 128TB
>>>
>>> (this is a nice rule of thumb if I understand it correctly :) )
>>>
>>> We should strive for device memory (maxram_size - ram_size) to fit
>>> exactly into one of these slots (otherwise things get nasty).
>>>
>>> Depending on the ram_size, we might have simpler setups and can support
>>> more configurations, no?
>>>
>>> E.g. ram_size <= 34GB, device_memory <= 512GB
>>> -> move ram into a) and b)
>>> -> move device memory into c)
>>
>> The issue is machvirt doesn't comply with that document.
>> At the moment we have
>> 0 -> 1GB MMIO
>> 1GB -> 256GB RAM
>> 256GB -> 512GB is theoretically reserved for IO but most is free.
>> 512GB -> 1T is reserved for ECAM MMIO range. This is the top of our
>> existing 40b GPA space.
>>
>> We don't want to change this address map due to legacy reasons.
>>
> 
> Thanks, good to know!
> 
>> Another question! do you know if it would be possible to have
>> device_memory region split into several discontinuous segments?
> 
> It can be implemented for sure, but I would try to avoid that, as it
> makes certain configurations impossible (and very end user unfriendly).
> 
> E.g. (numbers completely made up, but it should show what I mean)
> 
> -m 20G,maxmem=120G:
> -> Try to add a DIMM with 100G -> error.
> -> But we can add e.g. two DIMMs with 40G and 60G.
> 
> This exposes internal details to the end user. And the end user has no
> idea what is going on.
> 
> So I think we should try our best to keep that area consecutive.

Actually I didn't sufficiently detail the context. I would like
1) 1 segment to be exposed to the end-user through slot|maxmem stuff
(what this series targets) and
2) another segment used to instantiate PC-DIMM for internal needs as
replacement of part of the 1GB -> 256GB static RAM. This was the purpose
of Shameer's original series

[1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
http://patchwork.ozlabs.org/cover/914694/
This approach is not yet validated though.

The rationale is sometimes you must have "holes" in RAM as some GPAs
match reserved IOVAs for assigned devices.

Thanks

Eric

> 
>>
>> Thanks
>>
>> Eric
> 
> 
