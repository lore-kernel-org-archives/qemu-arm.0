Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1532678wrq;
        Thu, 5 Jul 2018 05:12:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdtkKTS6XoxzjlbPhnuZ1OISsxMVFnZN82Lb3QSMbIUAGTaRvjBPrQ1RyrHMhzqnb++W1eL
X-Received: by 2002:ac8:32b9:: with SMTP id z54-v6mr5187854qta.268.1530792729912;
        Thu, 05 Jul 2018 05:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530792729; cv=none;
        d=google.com; s=arc-20160816;
        b=lcjodP7Sjxih9FZuHTozjqf1u2IdFjGD8KNy3RG/pw8eW87MaYftApdfRBOATGZP3n
         961CiGbM83MmEUYWaW9bO4K2Kfw6h0BYsobMUH2/Zv45v7jqAxtKoAKgWYOPQNxkBKn2
         vYpfBfq4ipcHeQhWKlIWENi1aZMTGkf7PJWfdoVxRXQ/WcNcH1RqxF9Tu5bOb5FJz8dj
         n+GxhGfXBgi6di3MzxRLbmhm+xzfL5GKNU6vb0Ow+RArmNq6t+XWdSh+fpdpZ/jJiWuo
         ZhprYM5bSO0Js9427kZddYx8WYtAEVsSMmf5c6pKO3T7VLzBnxN7H8EIyaGVA6BCh5Ua
         J1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to:arc-authentication-results;
        bh=Pz/MZIcgsJ01GgLDd1CSxrmP7mbwXRmlsGT9pBgQNq0=;
        b=TvMkUzKKHwOuZgsUBxZt7iNQiiuMVWE57KBG93pxXm1ECj9IcLad9DWGbggjXbPnT2
         kOKiV4E1pi58RlUvMuIHzflSuZEEanktMKkFd98V85nelISfwNN0WheoCnBSLNL9pw+b
         HmcHTVICz1oFW//SlZMmdlQ4+NnkhBYjrKHLCk2f1gnn6awNqu5aVGuWiD0diE1hrDzo
         7pxRGrwTVdGCWM0RKSk9BPuk+yV8jnJSAp1iE58M/+XrnPxuEqb9NKmazeup/S7r08BD
         RxU86WWvWlntkIcqYpK0hIrVywxrT4w46aNI7DOenz/4itoE9fFBWZI5lOVq1hIkGNM3
         5R8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j26-v6si5635380qvj.26.2018.07.05.05.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 05:12:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb37J-0002Fx-95
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 08:12:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fb34x-0000LA-6i
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 08:09:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fb34v-0001Y2-OM
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 08:09:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46852 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1fb34v-0001X7-Hm; Thu, 05 Jul 2018 08:09:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A62E401DE6D;
	Thu,  5 Jul 2018 12:09:41 +0000 (UTC)
Received: from [10.36.116.172] (ovpn-116-172.ams2.redhat.com [10.36.116.172])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF7147C3F;
	Thu,  5 Jul 2018 12:09:34 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-7-git-send-email-eric.auger@redhat.com>
	<a856ba3a-c211-5f35-4023-97ef73eb5c31@redhat.com>
	<df091f31-6f85-64d8-0c3b-7fd463d31c63@redhat.com>
	<43c1349e-1ca6-4890-07c0-7bfa35ab914d@redhat.com>
	<5311fed5-7f13-a177-b967-db6e3ed028b9@redhat.com>
	<405e3f2b-3044-d7fc-8df4-b07a8487470f@redhat.com>
	<f2d61062-21df-4478-bc61-c32e92329cf8@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <57030c9f-c3d1-49a8-090e-d6b316e7a818@redhat.com>
Date: Thu, 5 Jul 2018 14:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <f2d61062-21df-4478-bc61-c32e92329cf8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 05 Jul 2018 12:09:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 05 Jul 2018 12:09:41 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'david@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
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
X-TUID: gffc/uWDe4Ln

On 05.07.2018 14:00, Auger Eric wrote:
> Hi David,
>=20
> On 07/05/2018 01:54 PM, David Hildenbrand wrote:
>> On 05.07.2018 13:42, Auger Eric wrote:
>>> Hi David,
>>>
>>> On 07/04/2018 02:05 PM, David Hildenbrand wrote:
>>>> On 03.07.2018 21:27, Auger Eric wrote:
>>>>> Hi David,
>>>>> On 07/03/2018 08:25 PM, David Hildenbrand wrote:
>>>>>> On 03.07.2018 09:19, Eric Auger wrote:
>>>>>>> We define a new hotpluggable RAM region (aka. device memory).
>>>>>>> Its base is 2TB GPA. This obviously requires 42b IPA support
>>>>>>> in KVM/ARM, FW and guest kernel. At the moment the device
>>>>>>> memory region is max 2TB.
>>>>>>
>>>>>> Maybe a stupid question, but why exactly does it have to start at =
2TB
>>>>>> (and not e.g. at 1TB)?
>>>>> not a stupid question. See tentative answer below.
>>>>>>
>>>>>>>
>>>>>>> This is largely inspired of device memory initialization in
>>>>>>> pc machine code.
>>>>>>>
>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>>>>> ---
>>>>>>>  hw/arm/virt.c         | 104 ++++++++++++++++++++++++++++++++++++=
--------------
>>>>>>>  include/hw/arm/arm.h  |   2 +
>>>>>>>  include/hw/arm/virt.h |   1 +
>>>>>>>  3 files changed, 79 insertions(+), 28 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>> index 5a4d0bf..6fefb78 100644
>>>>>>> --- a/hw/arm/virt.c
>>>>>>> +++ b/hw/arm/virt.c
>>>>>>> @@ -59,6 +59,7 @@
>>>>>>>  #include "qapi/visitor.h"
>>>>>>>  #include "standard-headers/linux/input.h"
>>>>>>>  #include "hw/arm/smmuv3.h"
>>>>>>> +#include "hw/acpi/acpi.h"
>>>>>>> =20
>>>>>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>>>>>      static void virt_##major##_##minor##_class_init(ObjectClass =
*oc, \
>>>>>>> @@ -94,34 +95,25 @@
>>>>>>> =20
>>>>>>>  #define PLATFORM_BUS_NUM_IRQS 64
>>>>>>> =20
>>>>>>> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this =
means
>>>>>>> - * RAM can go up to the 256GB mark, leaving 256GB of the physica=
l
>>>>>>> - * address space unallocated and free for future use between 256=
G and 512G.
>>>>>>> - * If we need to provide more RAM to VMs in the future then we n=
eed to:
>>>>>>> - *  * allocate a second bank of RAM starting at 2TB and working =
up
>>>>> I acknowledge this comment was the main justification. Now if you l=
ook at
>>>>>
>>>>> Principles of ARM Memory Maps
>>>>> http://infocenter.arm.com/help/topic/com.arm.doc.den0001c/DEN0001C_=
principles_of_arm_memory_maps.pdf
>>>>> chapter 2.3 you will find that when adding PA bits, you always leav=
e
>>>>> space for reserved space and mapped IO.
>>>>
>>>> Thanks for the pointer!
>>>>
>>>> So ... we can fit
>>>>
>>>> a) 2GB at 2GB
>>>> b) 32GB at 32GB
>>>> c) 512GB at 512GB
>>>> d) 8TB at 8TB
>>>> e) 128TB at 128TB
>>>>
>>>> (this is a nice rule of thumb if I understand it correctly :) )
>>>>
>>>> We should strive for device memory (maxram_size - ram_size) to fit
>>>> exactly into one of these slots (otherwise things get nasty).
>>>>
>>>> Depending on the ram_size, we might have simpler setups and can supp=
ort
>>>> more configurations, no?
>>>>
>>>> E.g. ram_size <=3D 34GB, device_memory <=3D 512GB
>>>> -> move ram into a) and b)
>>>> -> move device memory into c)
>>>
>>> The issue is machvirt doesn't comply with that document.
>>> At the moment we have
>>> 0 -> 1GB MMIO
>>> 1GB -> 256GB RAM
>>> 256GB -> 512GB is theoretically reserved for IO but most is free.
>>> 512GB -> 1T is reserved for ECAM MMIO range. This is the top of our
>>> existing 40b GPA space.
>>>
>>> We don't want to change this address map due to legacy reasons.
>>>
>>
>> Thanks, good to know!
>>
>>> Another question! do you know if it would be possible to have
>>> device_memory region split into several discontinuous segments?
>>
>> It can be implemented for sure, but I would try to avoid that, as it
>> makes certain configurations impossible (and very end user unfriendly)=
.
>>
>> E.g. (numbers completely made up, but it should show what I mean)
>>
>> -m 20G,maxmem=3D120G:
>> -> Try to add a DIMM with 100G -> error.
>> -> But we can add e.g. two DIMMs with 40G and 60G.
>>
>> This exposes internal details to the end user. And the end user has no
>> idea what is going on.
>>
>> So I think we should try our best to keep that area consecutive.
>=20
> Actually I didn't sufficiently detail the context. I would like
> 1) 1 segment to be exposed to the end-user through slot|maxmem stuff
> (what this series targets) and
> 2) another segment used to instantiate PC-DIMM for internal needs as
> replacement of part of the 1GB -> 256GB static RAM. This was the purpos=
e
> of Shameer's original series

I am not sure if PC-DIMMs are exactly what you want for internal purposes=
.

>=20
> [1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
> http://patchwork.ozlabs.org/cover/914694/
> This approach is not yet validated though.
>=20
> The rationale is sometimes you must have "holes" in RAM as some GPAs
> match reserved IOVAs for assigned devices.

So if I understand it correctly, all you want is some memory region that
a) contains only initially defined memory
b) can have some holes in it

This is exactly what x86 already does (pc_memory_init): Simply construct
your own memory region leaving holes in it.


memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", ram,
                         0, pcms->below_4g_mem_size);
memory_region_add_subregion(system_memory, 0, ram_below_4g);
...
if (pcms->above_4g_mem_size > 0)
    memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g", ram,
    ...
    memory_region_add_subregion(system_memory, 0x100000000ULL,
    ...

They "indicate" these different GPA areas using the e820 map to the guest=
.

Would that also work for you?

>=20
> Thanks
>=20
> Eric
>=20
>>
>>>
>>> Thanks
>>>
>>> Eric
>>
>>


--=20

Thanks,

David / dhildenb
