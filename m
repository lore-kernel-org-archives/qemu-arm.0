Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5717501wrx;
        Thu, 21 Feb 2019 04:41:23 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYwZgXpBtnOWHFI6h3JlndxbuM/sL+fZ5354GQAZcGYndzFOaTwto1BuyH3U0/jVnqqcKz9
X-Received: by 2002:a25:9946:: with SMTP id n6mr21581581ybo.76.1550752883180;
        Thu, 21 Feb 2019 04:41:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550752883; cv=none;
        d=google.com; s=arc-20160816;
        b=RgBP90Iq4xbJSNHRjOovWOwjkvARuoqA7JkiDqhJQzFLpk4FVGGXWNO8kOi13EBvBs
         5JKoWL8Mp8fgu2s46CnP7qhggJZREu8Fxr2r1mQ6xv0HjubmSn4U7NwlBuOxJdHEulEC
         yJ/yTfc36Ho5Jw8wJi+mHpnWDwxeM1+f4HzunYyU8c9ql4bvkwfk7ErIaiGgZBDsG6kK
         E9Opb/2Qemwj7WNnf7D0qipRh+e4tZgGGpFjiGoM5qvv4EiF6DYUQZzEKwUsf3lbCmt+
         2mWZj9MJ15kXF85Qs8V1zC+7Pq9CfWuy4/SjSGTjLO9puPEp134smKP3yi166mprOcKm
         4xQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6baXPo/rWaXvTXkE38VNG8XsVEEp/XV6KWZsT9Ir3Z8=;
        b=JIRYdgbgSh8pk0aP3mFB11Sx6RRclZZNXpqZ5vE6dnyXYr0bcNi91doqxPo/N0Huta
         RJNakeiWe/juhnJk4ZJ9zQwD18yGxu+lKY7ODBcPmy4/Ih2GaPV1QhqhEQqXQIGsRFy0
         y4bjVhYAlMaBSlTs/9tv5HEO5A3M5E0oBGiaMV+5t0vcmPBfHMTGIJlysRVx+/om7q6E
         sK80WO/v22ThI+PcUZf0KhVppyq6+5EjKG0JD3BVOmV36nUv4pjapzFpyD8kePDBVdSo
         kCcFUO7rzy19Z9LufwiX8znk7j50PcU9SFaq0Yg8hklrBp4RpKMqv8mNrIsycSoYahwV
         boEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si12645490ybg.491.2019.02.21.04.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 04:41:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwnfE-0008HX-EM
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 07:41:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwnf0-00080F-BF
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 07:41:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwnbt-0007zi-BC
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 07:37:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45692)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwnbl-0007uL-2U; Thu, 21 Feb 2019 07:37:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6F8680F6B;
	Thu, 21 Feb 2019 12:37:43 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47FE95C204;
	Thu, 21 Feb 2019 12:37:28 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-15-eric.auger@redhat.com>
	<20190218103155.2b74e0a2@Igors-MacBook-Pro.local>
	<852c526c-42fd-4ff4-d00e-1a44e1561e67@redhat.com>
	<20190221103610.0c2add1c@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e264b964-baa6-11e2-8e45-3238d412ca32@redhat.com>
Date: Thu, 21 Feb 2019 13:37:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190221103610.0c2add1c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 21 Feb 2019 12:37:44 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bJ8XzDS7zgeI

Hi Igor,

On 2/21/19 10:36 AM, Igor Mammedov wrote:
> On Tue, 19 Feb 2019 16:53:22 +0100
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> On 2/18/19 10:31 AM, Igor Mammedov wrote:
>>> On Tue,  5 Feb 2019 18:33:02 +0100
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>   
>>>> The device memory region is located after the initial RAM.
>>>> its start/size are 1GB aligned.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>>>
>>>> ---
>>>> v4 -> v5:
>>>> - device memory set after the initial RAM
>>>>
>>>> v3 -> v4:
>>>> - remove bootinfo.device_memory_start/device_memory_size
>>>> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
>>>> ---
>>>>  hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 36 insertions(+)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 783468ba77..b683902991 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -61,6 +61,7 @@
>>>>  #include "hw/arm/smmuv3.h"
>>>>  #include "hw/mem/pc-dimm.h"
>>>>  #include "hw/mem/nvdimm.h"
>>>> +#include "hw/acpi/acpi.h"
>>>>  
>>>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>>>> @@ -1260,6 +1261,37 @@ static void create_secure_ram(VirtMachineState *vms,
>>>>      g_free(nodename);
>>>>  }
>>>>  
>>>> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
>>>> +{
>>>> +    MachineState *ms = MACHINE(vms);
>>>> +    uint64_t device_memory_size = ms->maxram_size - ms->ram_size;  
>>> should size it with 1Gb alignment per slot from the start (to avoid x86 mistakes),
>>> see enforce_aligned_dimm usage and associated commit for more details  
>> I don't understand the computation done in pc machine. eventually we are
>> likely to have more device memory than requested by the user. Why don't
>> we check (machine->maxram_size - machine->ram_size) >=
>> machine->ram_slots * GiB
>> instead of adding 1GiB/slot to the initial user requirements?
>>
>> Also machine->maxram_size - machine->ram_size is checked to be aligned
>> with TARGET_PAGE_SIZE. Is TARGET_PAGE_SIZE representative of the guest
>> PAGE in accelerated mode? Is it valid ro require an alignment on 1GB
>> boundary as I do in this patch?
> See commit 085f8e88b for explanation,
> What we are basically are doing there is sizing hotpluggbale address space
> to allow max possible huge page aligned DIMM to be successfully plugged in
> even if address space if fragmented.
In v7, I also added ram_slots * GiB to (maxram_size - ram_size).

Thanks

Eric
> 
>>
>>>   
>>>> +    uint64_t align = GiB;
>>>> +
>>>> +    if (!device_memory_size) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
>>>> +        error_report("unsupported number of memory slots: %"PRIu64,
>>>> +                     ms->ram_slots);
>>>> +        exit(EXIT_FAILURE);
>>>> +    }
>>>> +
>>>> +    if (QEMU_ALIGN_UP(ms->maxram_size, align) != ms->maxram_size) {
>>>> +        error_report("maximum memory size must be aligned to multiple of 0x%"
>>>> +                     PRIx64, align);
>>>> +        exit(EXIT_FAILURE);
>>>> +    }
>>>> +
>>>> +    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>>>> +    ms->device_memory->base = QEMU_ALIGN_UP(GiB + ms->ram_size, GiB);  
>>>                                                ^^^ where does this come from?  
>> OK, introduced RAMBASE macro
>>
>> Thanks
>>
>> Eric
>>>
>>>   
>>>> +
>>>> +    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
>>>> +                       "device-memory", device_memory_size);
>>>> +    memory_region_add_subregion(sysmem, ms->device_memory->base,
>>>> +                                &ms->device_memory->mr);
>>>> +}
>>>> +
>>>>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>>>>  {
>>>>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
>>>> @@ -1569,6 +1601,10 @@ static void machvirt_init(MachineState *machine)
>>>>                                           machine->ram_size);
>>>>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
>>>>  
>>>> +    if (vms->extended_memmap) {
>>>> +        create_device_memory(vms, sysmem);
>>>> +    }
>>>> +
>>>>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>>>>  
>>>>      create_gic(vms, pic);  
>>>   
>>
> 
> 
