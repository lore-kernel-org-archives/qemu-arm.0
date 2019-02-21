Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5720543wrx;
        Thu, 21 Feb 2019 04:44:53 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZxbKFCXs4LjGBuNvrWLJNGSrls/gOedfbR1Fdq9h56FRny3o6ghEaWTba3JSzf0e//ooYd
X-Received: by 2002:a25:fc1c:: with SMTP id v28mr33117216ybd.396.1550753093538;
        Thu, 21 Feb 2019 04:44:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550753093; cv=none;
        d=google.com; s=arc-20160816;
        b=tPTm1yHicvk2WBpfxmUukrno7P5RE7E4jTq28YYTHU3MpRvGNDAz3s01OrwsddLJ06
         8QOrsy3Kz16Et9cQ9t16TGs1dRlt8ZfC51JhsdGR5m8Z2VhXndBgufBAT097mhmqtCog
         pksUOHQUX45m4eAYiyO+FIZ/gsc1cTucDu4f/C19S0BjALVemIUy2PgogIgkW0bzLobJ
         wysWZHMBzwz1RgZmc1LAtnO72wWe5LEa9j4yrJ8veFBUzeWfuHXL14gDez8kjPL7cgfZ
         MbWux4h4LRWRBcMdMRrccNUsX6pL4L1gPpj0r9aUTd1woi4v5F+e+JTrapMD+wC3/iZ7
         Tngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=Mdm9BtPtI2wCxASqNs/ibE9G2ofwfpH77qaEUukgs08=;
        b=DdbRgV9DYIWfT4ueYdHd3QT6ft7UqEa6KhskbM8BUq9lc7hXe8x7mnJ8Z7J+Nsrq4M
         o40ZSxpntKk58DqW+RrRVH/KKrzP4qmHTOvpYX3GFq1Liql5yHnvZeYomBGltd6QKMn9
         HBH8rUC+iiLhnGrk7Qv7Ovt7hQf7t/xfSxeDg6L8PyRLttuhcIsXVW6y63EeKkxSb3JV
         rTLGxuKMbHt7c1k1qK4EoD25j+99RwzrV0Af9gsOjQqRKQzYP1sNkU1waqSaJS3oZGG7
         tHQGLfeZq12YQfbmT99isizt7W0pQef4OCOQ76hZBq0Lb1Cy3QchqGL5gpdvsMzafGCd
         a8qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o126si12662675ybb.80.2019.02.21.04.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 04:44:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwnie-0002nr-Rd
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 07:44:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1gwniR-0002mX-Pg
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 07:44:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1gwniQ-0003Sq-LV
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 07:44:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39644)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1gwniQ-0003QJ-9u; Thu, 21 Feb 2019 07:44:38 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A12843001952;
	Thu, 21 Feb 2019 12:44:32 +0000 (UTC)
Received: from [10.36.116.222] (ovpn-116-222.ams2.redhat.com [10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 677A427BB6;
	Thu, 21 Feb 2019 12:44:28 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-15-eric.auger@redhat.com>
	<20190218103155.2b74e0a2@Igors-MacBook-Pro.local>
	<852c526c-42fd-4ff4-d00e-1a44e1561e67@redhat.com>
	<20190221103610.0c2add1c@redhat.com>
	<e264b964-baa6-11e2-8e45-3238d412ca32@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <4a921c15-43b8-e7dd-2a76-6b9e0fc7f084@redhat.com>
Date: Thu, 21 Feb 2019 13:44:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <e264b964-baa6-11e2-8e45-3238d412ca32@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 21 Feb 2019 12:44:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 14/18] hw/arm/virt: Allocate
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, dgilbert@redhat.com,
	shameerali.kolothum.thodi@huawei.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OJ5lPZ7Uxt4/

On 21.02.19 13:37, Auger Eric wrote:
> Hi Igor,
> 
> On 2/21/19 10:36 AM, Igor Mammedov wrote:
>> On Tue, 19 Feb 2019 16:53:22 +0100
>> Auger Eric <eric.auger@redhat.com> wrote:
>>
>>> Hi Igor,
>>>
>>> On 2/18/19 10:31 AM, Igor Mammedov wrote:
>>>> On Tue,  5 Feb 2019 18:33:02 +0100
>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>   
>>>>> The device memory region is located after the initial RAM.
>>>>> its start/size are 1GB aligned.
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>>>
>>>>> ---
>>>>> v4 -> v5:
>>>>> - device memory set after the initial RAM
>>>>>
>>>>> v3 -> v4:
>>>>> - remove bootinfo.device_memory_start/device_memory_size
>>>>> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
>>>>> ---
>>>>>  hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 36 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>> index 783468ba77..b683902991 100644
>>>>> --- a/hw/arm/virt.c
>>>>> +++ b/hw/arm/virt.c
>>>>> @@ -61,6 +61,7 @@
>>>>>  #include "hw/arm/smmuv3.h"
>>>>>  #include "hw/mem/pc-dimm.h"
>>>>>  #include "hw/mem/nvdimm.h"
>>>>> +#include "hw/acpi/acpi.h"
>>>>>  
>>>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>>>>> @@ -1260,6 +1261,37 @@ static void create_secure_ram(VirtMachineState *vms,
>>>>>      g_free(nodename);
>>>>>  }
>>>>>  
>>>>> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
>>>>> +{
>>>>> +    MachineState *ms = MACHINE(vms);
>>>>> +    uint64_t device_memory_size = ms->maxram_size - ms->ram_size;  
>>>> should size it with 1Gb alignment per slot from the start (to avoid x86 mistakes),
>>>> see enforce_aligned_dimm usage and associated commit for more details  
>>> I don't understand the computation done in pc machine. eventually we are
>>> likely to have more device memory than requested by the user. Why don't
>>> we check (machine->maxram_size - machine->ram_size) >=
>>> machine->ram_slots * GiB
>>> instead of adding 1GiB/slot to the initial user requirements?
>>>
>>> Also machine->maxram_size - machine->ram_size is checked to be aligned
>>> with TARGET_PAGE_SIZE. Is TARGET_PAGE_SIZE representative of the guest
>>> PAGE in accelerated mode? Is it valid ro require an alignment on 1GB
>>> boundary as I do in this patch?
>> See commit 085f8e88b for explanation,
>> What we are basically are doing there is sizing hotpluggbale address space
>> to allow max possible huge page aligned DIMM to be successfully plugged in
>> even if address space if fragmented.
> In v7, I also added ram_slots * GiB to (maxram_size - ram_size).
> 

Depending on the way the system handles it, this might be confusing for
the end user and has to be documented somewhere.

E.g. if there are certain memory limits (say 2TB) and the user specifies
something like "maxmem=2TB,slots=20" it might be confusing if he gets an
error like "more than 2TB are not supported".

> Thanks
> 
> Eric
-- 

Thanks,

David / dhildenb
