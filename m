Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3554599wrx;
        Tue, 19 Feb 2019 07:53:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZK3sR2IEJu/iYlUKVK4jkU/9QfBMrd8254ub+DHAMJf+ak6xuBZJ3OTcnC5JNiv1LiRQJE
X-Received: by 2002:a25:8008:: with SMTP id m8mr24788648ybk.35.1550591638594;
        Tue, 19 Feb 2019 07:53:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550591638; cv=none;
        d=google.com; s=arc-20160816;
        b=eMoTtxSwwxFdyKrUW5TAZJL7A81e96LKCOF2y/6f/D2l/dIgh1qEUhOUmLkRB/XvbU
         vBxDsssiLxUmA4XEnJU/QHe5VORnGmld1KR6luESEXeyXTxCdyuLpclCz+sLyVkoh0Zb
         8SbhrhWxDsgXoiAhlD6GIOaky771r7Al3ZYeK1mkVtmICLrtAQPRPSR6aS6d/OzOGwEL
         HNqSXxxBEmRYLTXD5/BoxfdtAg+Ue2mm+lSRrCSj5/Ays8IY6kQjyf8yvWsvgToYyYyn
         0WgcJ10LSbzOMmdCLHH9wp0mmwGy4o6g0n38buTnGQlsFvE5t8Af6BEpFWAliyjwwgbE
         LlTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=0ry9BaRqctL/Ru8+avA8hiwNsUktMpfMp6qhpONIYIE=;
        b=gP8Eb/F/SH5BRIEI8I6xj86SzrWnh5O6bDb1J9ZNw9TvSKr0KExPpaM4TyoNwwmjtV
         35+SHBDlFHtLMVpNeVuPaJkNttCJMJUFrcFzWBcLbGqikYu7vWiCYzF13RDcMkW+VEcp
         AKftics01vWZKEKbQJHWCX0QSy49D8r36eiw38vjU75ZcoNy9d53iTal/9rLYtfgzfkz
         8ReSdtNVacwfYZJcAyiWy2gho3BKw5WTWVDAujgJGIysEb3gxNv3IAMEcIeOCCYBoEDZ
         04WLSNSiRgjJ6AxuTnw/+6MGNT2AQK6OEEv7j69laT/XP+t4q1FB3FHWgmJSBH4ZlafK
         2g/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135si9156586ybc.97.2019.02.19.07.53.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 07:53:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw7iY-0000rD-1K
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 10:53:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gw7iG-0000pR-1J
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 10:53:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gw7iE-0008AK-Ao
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 10:53:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gw7iD-00082N-U1; Tue, 19 Feb 2019 10:53:38 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 346939FDC4;
	Tue, 19 Feb 2019 15:53:27 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD65F6013C;
	Tue, 19 Feb 2019 15:53:24 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-15-eric.auger@redhat.com>
	<20190218103155.2b74e0a2@Igors-MacBook-Pro.local>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <852c526c-42fd-4ff4-d00e-1a44e1561e67@redhat.com>
Date: Tue, 19 Feb 2019 16:53:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190218103155.2b74e0a2@Igors-MacBook-Pro.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 19 Feb 2019 15:53:27 +0000 (UTC)
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
X-TUID: 3SOU0wvsz7UC

Hi Igor,

On 2/18/19 10:31 AM, Igor Mammedov wrote:
> On Tue,  5 Feb 2019 18:33:02 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> The device memory region is located after the initial RAM.
>> its start/size are 1GB aligned.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>
>> ---
>> v4 -> v5:
>> - device memory set after the initial RAM
>>
>> v3 -> v4:
>> - remove bootinfo.device_memory_start/device_memory_size
>> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
>> ---
>>  hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 783468ba77..b683902991 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -61,6 +61,7 @@
>>  #include "hw/arm/smmuv3.h"
>>  #include "hw/mem/pc-dimm.h"
>>  #include "hw/mem/nvdimm.h"
>> +#include "hw/acpi/acpi.h"
>>  
>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -1260,6 +1261,37 @@ static void create_secure_ram(VirtMachineState *vms,
>>      g_free(nodename);
>>  }
>>  
>> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
>> +{
>> +    MachineState *ms = MACHINE(vms);
>> +    uint64_t device_memory_size = ms->maxram_size - ms->ram_size;
> should size it with 1Gb alignment per slot from the start (to avoid x86 mistakes),
> see enforce_aligned_dimm usage and associated commit for more details
I don't understand the computation done in pc machine. eventually we are
likely to have more device memory than requested by the user. Why don't
we check (machine->maxram_size - machine->ram_size) >=
machine->ram_slots * GiB
instead of adding 1GiB/slot to the initial user requirements?

Also machine->maxram_size - machine->ram_size is checked to be aligned
with TARGET_PAGE_SIZE. Is TARGET_PAGE_SIZE representative of the guest
PAGE in accelerated mode? Is it valid ro require an alignment on 1GB
boundary as I do in this patch?

> 
>> +    uint64_t align = GiB;
>> +
>> +    if (!device_memory_size) {
>> +        return;
>> +    }
>> +
>> +    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
>> +        error_report("unsupported number of memory slots: %"PRIu64,
>> +                     ms->ram_slots);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +    if (QEMU_ALIGN_UP(ms->maxram_size, align) != ms->maxram_size) {
>> +        error_report("maximum memory size must be aligned to multiple of 0x%"
>> +                     PRIx64, align);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>> +    ms->device_memory->base = QEMU_ALIGN_UP(GiB + ms->ram_size, GiB);
>                                                ^^^ where does this come from?
OK, introduced RAMBASE macro

Thanks

Eric
> 
> 
>> +
>> +    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
>> +                       "device-memory", device_memory_size);
>> +    memory_region_add_subregion(sysmem, ms->device_memory->base,
>> +                                &ms->device_memory->mr);
>> +}
>> +
>>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>>  {
>>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
>> @@ -1569,6 +1601,10 @@ static void machvirt_init(MachineState *machine)
>>                                           machine->ram_size);
>>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
>>  
>> +    if (vms->extended_memmap) {
>> +        create_device_memory(vms, sysmem);
>> +    }
>> +
>>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>>  
>>      create_gic(vms, pic);
> 
