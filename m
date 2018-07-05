Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1504995wrq;
        Thu, 5 Jul 2018 04:42:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfeWgZ2UzUQSR/l9cbQNbVcJF+4noRdYEfO1TZLRGsDo8w4+8sq+LFUbPLsrAmtQJHZ7oq2
X-Received: by 2002:a37:484a:: with SMTP id v71-v6mr4551262qka.38.1530790953172;
        Thu, 05 Jul 2018 04:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530790953; cv=none;
        d=google.com; s=arc-20160816;
        b=N6Zb+4v/vSaOgRtOQEw7m01952eLhZzqYPUrr5dCxi4BZqTcQmuWtyzoiELHlZZCtm
         9m1FCTjk++Sg7hIndWPpib7+/R7YzbdSkPnnePeUivWIn5CD1b7wxJozfyci/zhgs+z1
         MVIAVniYjOYoOITMubQO7o8RhBcwzp/+Qs9jRXe1HkOc9MperYqB0g3WB1My4nZuDQo0
         sWkdnZXRQ8/11Rx79B6BgkcqWCiib/7GySwco705Dwgpq/318VGpmjaoI97Ff5NDoRP7
         4WnAhdaLJPLy/y7PNkgyxmAIFx8+NqoLXmDV9QZkTdV906djRpXpp79jFc1+pO77BztK
         i7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=VxBQ5A2u6+G7cM0a4MMYsWGIVS1aUnIJbiOKzDPHpF8=;
        b=k6kCFmLA5UP4n0g4qrPJLaU4DYl1DUzky9y8BI8bxZGG/Pj1XNPrtvuWd5eChWlfVZ
         CAkbb5edLPUdHjg0QxO3G/7iz+jcj7AgPydbP/U7G25zUUBLR27kVyIabStC8p7yL8gA
         Bh0UBNSCuBikLN1i/FIQpLTofjdwmXZz5Ksea/5QXYlnbJ/hJRrx1NTAxxUZTtGiPsuO
         ee867Y8CRaOmvYZz74oyVi7EHAOawCekSpT03qpaTo503PV557sF7XxggW9hO9LrrY62
         DSK5B42J98b19slYCZRPrz/hq6TNQV/fL6UYRDy/HQSgjZsR1+lgj9I6mw0XsfVKma5W
         zXng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u52-v6si5546200qtc.365.2018.07.05.04.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 04:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb2ee-0002xy-Lu
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 07:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fb2eP-0002uo-9H
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 07:42:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fb2eN-00076a-RR
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 07:42:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45756 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fb2eN-00075g-Kx; Thu, 05 Jul 2018 07:42:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13F7D406E8CD;
	Thu,  5 Jul 2018 11:42:15 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-118.ams2.redhat.com
	[10.36.116.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 458C57C33;
	Thu,  5 Jul 2018 11:42:09 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-7-git-send-email-eric.auger@redhat.com>
	<a856ba3a-c211-5f35-4023-97ef73eb5c31@redhat.com>
	<df091f31-6f85-64d8-0c3b-7fd463d31c63@redhat.com>
	<43c1349e-1ca6-4890-07c0-7bfa35ab914d@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5311fed5-7f13-a177-b967-db6e3ed028b9@redhat.com>
Date: Thu, 5 Jul 2018 13:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <43c1349e-1ca6-4890-07c0-7bfa35ab914d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 05 Jul 2018 11:42:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 05 Jul 2018 11:42:15 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
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
Cc: agraf@suse.de, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vSWjGHRQcv6Q

Hi David,

On 07/04/2018 02:05 PM, David Hildenbrand wrote:
> On 03.07.2018 21:27, Auger Eric wrote:
>> Hi David,
>> On 07/03/2018 08:25 PM, David Hildenbrand wrote:
>>> On 03.07.2018 09:19, Eric Auger wrote:
>>>> We define a new hotpluggable RAM region (aka. device memory).
>>>> Its base is 2TB GPA. This obviously requires 42b IPA support
>>>> in KVM/ARM, FW and guest kernel. At the moment the device
>>>> memory region is max 2TB.
>>>
>>> Maybe a stupid question, but why exactly does it have to start at 2TB
>>> (and not e.g. at 1TB)?
>> not a stupid question. See tentative answer below.
>>>
>>>>
>>>> This is largely inspired of device memory initialization in
>>>> pc machine code.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>> ---
>>>>  hw/arm/virt.c         | 104 ++++++++++++++++++++++++++++++++++++--------------
>>>>  include/hw/arm/arm.h  |   2 +
>>>>  include/hw/arm/virt.h |   1 +
>>>>  3 files changed, 79 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 5a4d0bf..6fefb78 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -59,6 +59,7 @@
>>>>  #include "qapi/visitor.h"
>>>>  #include "standard-headers/linux/input.h"
>>>>  #include "hw/arm/smmuv3.h"
>>>> +#include "hw/acpi/acpi.h"
>>>>  
>>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>>>> @@ -94,34 +95,25 @@
>>>>  
>>>>  #define PLATFORM_BUS_NUM_IRQS 64
>>>>  
>>>> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
>>>> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
>>>> - * address space unallocated and free for future use between 256G and 512G.
>>>> - * If we need to provide more RAM to VMs in the future then we need to:
>>>> - *  * allocate a second bank of RAM starting at 2TB and working up
>> I acknowledge this comment was the main justification. Now if you look at
>>
>> Principles of ARM Memory Maps
>> http://infocenter.arm.com/help/topic/com.arm.doc.den0001c/DEN0001C_principles_of_arm_memory_maps.pdf
>> chapter 2.3 you will find that when adding PA bits, you always leave
>> space for reserved space and mapped IO.
> 
> Thanks for the pointer!
> 
> So ... we can fit
> 
> a) 2GB at 2GB
> b) 32GB at 32GB
> c) 512GB at 512GB
> d) 8TB at 8TB
> e) 128TB at 128TB
> 
> (this is a nice rule of thumb if I understand it correctly :) )
> 
> We should strive for device memory (maxram_size - ram_size) to fit
> exactly into one of these slots (otherwise things get nasty).
> 
> Depending on the ram_size, we might have simpler setups and can support
> more configurations, no?
> 
> E.g. ram_size <= 34GB, device_memory <= 512GB
> -> move ram into a) and b)
> -> move device memory into c)

The issue is machvirt doesn't comply with that document.
At the moment we have
0 -> 1GB MMIO
1GB -> 256GB RAM
256GB -> 512GB is theoretically reserved for IO but most is free.
512GB -> 1T is reserved for ECAM MMIO range. This is the top of our
existing 40b GPA space.

We don't want to change this address map due to legacy reasons.

Another question! do you know if it would be possible to have
device_memory region split into several discontinuous segments?

Thanks

Eric
> 
> We should make up our mind right from the beginning how our setup will
> look, so we can avoid (possibly complicated) compatibility handling
> later on.
> 
>>
>> On the other hand, if you look at chapter 5, "Proposed 44-bit and 48bit
>> Address Maps", we should logically put the additional RAM at 8TB if we
>> want to comply with that doc.
> 
> I agree, 2TB es in the reserved area.
> 
>>
>> Peter, was there any other justification why we should put the RAM at 2TB?
>>
>> Thanks
>>
>> Eric
> 
> 
