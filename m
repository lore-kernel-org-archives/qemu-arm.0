Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3561372wrx;
        Tue, 19 Feb 2019 08:01:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib/0bPzykWF8JAWGyaTFm0eOBn+YjwLHvZeE3xi0HX5sndRuKwYwc2wqrUEcv6d/SSs0dW5
X-Received: by 2002:ac8:23a6:: with SMTP id q35mr23321204qtq.322.1550592084642;
        Tue, 19 Feb 2019 08:01:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550592084; cv=none;
        d=google.com; s=arc-20160816;
        b=dUIy2ir4ytDun6lHvjDpyWOY4dWZOSlKfRfeU97qk8wKj9N63LdjUVjVlsURe252JS
         mhVludfNT5DlM3PTnigbs1a2RHo88xJmCltWlroNQHPPAHld3KkFfvja5ZshCpWBI5KR
         IyNFg6nFtv7/h1z2cppi/TSmjhlIahIeWir+BOltmBRvqnR5VJsgJRzjT1nBhpDs5hhB
         1/HhBJmlrWKwyNLX1a1LtglgvZzR9HW8kEwJHDdGKmY8t+db0HKjuSwTmSJ1mUH6kR8q
         7VBcX/Hp9IWNPSUL7Oq2rnoOoFL7Kv7m4LgExz3rmUYJDoMFXNGe5clwUpYPhlp6GQC8
         MtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=XOAjaCfhTR3/fiaoZ2pNtxVfkJvMgwksDpXJAdIkRLM=;
        b=DzCIv0fQBNEcW5T+BrFaxkLJjzOTvjA2dsvmgmEr+F+JGfncJNVoaPpuljZX2dxlrm
         RpVMrVbyHiMMMkATAuB9bh7e78V/KxEfg/5SVB0J+M6xBSgATB4uqT9wAjK9GzopqQ6J
         VZJXuC+u/yhAYmWeIPGvoageVEyZp3MLovnPxUZFWQ0n/54q6FrC+coMjB45eZ+5sT0k
         lkMCIAOO1d5JPGEsNIY2vv3flivE1d3Jyz2OGojqLdjY6YmypgYZBjfRGXPJxSpf5/Yu
         sxYA0dVMD17OSHWZ1IyA0TYi2oHSCbKW4KgHmcNtk4K53I0Cx/6nwBW0IcA8VoiJOTs1
         KChA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 190si3820666ybm.481.2019.02.19.08.01.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 08:01:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw7pk-0006uw-30
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 11:01:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1gw7la-0003RR-9H
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 10:57:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1gw7lZ-0002ad-BZ
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 10:57:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1gw7lZ-0002a7-0b; Tue, 19 Feb 2019 10:57:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A45F85363;
	Tue, 19 Feb 2019 15:57:04 +0000 (UTC)
Received: from [10.36.117.212] (ovpn-117-212.ams2.redhat.com [10.36.117.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 301BD60856;
	Tue, 19 Feb 2019 15:56:59 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-15-eric.auger@redhat.com>
	<20190218103155.2b74e0a2@Igors-MacBook-Pro.local>
	<852c526c-42fd-4ff4-d00e-1a44e1561e67@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <f635f102-7aaf-db1d-fc17-b1d8cb5b01b6@redhat.com>
Date: Tue, 19 Feb 2019 16:56:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <852c526c-42fd-4ff4-d00e-1a44e1561e67@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 19 Feb 2019 15:57:04 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, dgilbert@redhat.com,
	qemu-arm@nongnu.org, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hGUMqdsUtweR

On 19.02.19 16:53, Auger Eric wrote:
> Hi Igor,
> 
> On 2/18/19 10:31 AM, Igor Mammedov wrote:
>> On Tue,  5 Feb 2019 18:33:02 +0100
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> The device memory region is located after the initial RAM.
>>> its start/size are 1GB aligned.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>
>>> ---
>>> v4 -> v5:
>>> - device memory set after the initial RAM
>>>
>>> v3 -> v4:
>>> - remove bootinfo.device_memory_start/device_memory_size
>>> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
>>> ---
>>>  hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 36 insertions(+)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 783468ba77..b683902991 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -61,6 +61,7 @@
>>>  #include "hw/arm/smmuv3.h"
>>>  #include "hw/mem/pc-dimm.h"
>>>  #include "hw/mem/nvdimm.h"
>>> +#include "hw/acpi/acpi.h"
>>>  
>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>>> @@ -1260,6 +1261,37 @@ static void create_secure_ram(VirtMachineState *vms,
>>>      g_free(nodename);
>>>  }
>>>  
>>> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
>>> +{
>>> +    MachineState *ms = MACHINE(vms);
>>> +    uint64_t device_memory_size = ms->maxram_size - ms->ram_size;
>> should size it with 1Gb alignment per slot from the start (to avoid x86 mistakes),
>> see enforce_aligned_dimm usage and associated commit for more details
> I don't understand the computation done in pc machine. eventually we are
> likely to have more device memory than requested by the user. Why don't
> we check (machine->maxram_size - machine->ram_size) >=
> machine->ram_slots * GiB
> instead of adding 1GiB/slot to the initial user requirements?

This is to be able to potentially align each slot as far as I know, so
the "memory device address space" cannot that easily be fragmented.

E.g. Linux requires a certain alignment to make full use of a DIMM.

> 
> Also machine->maxram_size - machine->ram_size is checked to be aligned
> with TARGET_PAGE_SIZE. Is TARGET_PAGE_SIZE representative of the guest
> PAGE in accelerated mode? Is it valid ro require an alignment on 1GB
> boundary as I do in this patch?

I guess the alignment check is only done because for that target,
anything having sub-page granularity cannot be used either way.

-- 

Thanks,

David / dhildenb
