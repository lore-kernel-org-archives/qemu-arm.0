Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7036160wrx;
        Fri, 22 Feb 2019 06:49:13 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY78kHLb7Z2eltNBlf8kEFsQctnq4qbAiPIBYU3NZujOffXDm7v3UTAani+zrEgSD2ktRtJ
X-Received: by 2002:a25:9946:: with SMTP id n6mr3598993ybo.76.1550846953367;
        Fri, 22 Feb 2019 06:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550846953; cv=none;
        d=google.com; s=arc-20160816;
        b=QsnqT2LfaxUT7wC8+5+TiHeIPr96Sc0bXKfQ1+xfohGjzG/zdv9s62aClpzq60Odu1
         Xk6RIQryCK/ZroFUaormHA310g0YR/07srONVbhry2LruDakku3GPjd4aLSwM7wpyF++
         wMAgWyg1/MajdrhkLoiqGtslEkW+HC2kz4uz3Vg9ViP7X0Ewl/VBYlbxufGMKSa0vgLa
         hPv754WVnCgDRuaAi9GX2zW3pmgmdIIkY0/0sTIpz6o5yOEN6O4DOBP9tT+BDrkFTc/v
         WdpWNBpEsH4e8tr8+ZdikOl3GMlU/Io87MG1auusZc9TB5KqI3vcDf2/2qCXeekh+OfA
         PMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=TPKhMK3P8eU4448RK47JcuWpNSEv7OfvBvBriLSX4RU=;
        b=js+yWoYhbi5x8tmd3/xopbN8Aq2KwLnDBEBdQk02CQ/x6KhxuXzvy5+2XxHVOVpWt6
         ulEuhxwmNHv4seszU72e4ctGnVFy9FmgJPEgh0FX80MPCWud9XdYK/Ammk8+jio4P8fd
         KRfzEhownB/WPry5sroZ00lmVJ16TumeGZdB7gCjcRijCxPRxCfML0PsGruWdSk7Qrjv
         nOQZhsIbeLE7Go2agIMOf+aPFBRX4RJ70Eiwy8L3OWdjlmuxBVNwy/4ZoVGQbF+NKV0p
         x6bXb8w5J0VCP+04Sc51ge4ApnuRLCKxZhFysfLPC7s/sFtou+rz1DNcnlHpuWliCHhi
         /FpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e185si948890ybe.390.2019.02.22.06.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 06:49:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxC8W-00011m-Na
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 09:49:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxBcA-0000LO-T7
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 09:15:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxBc9-0006WG-OE
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 09:15:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51620)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gxBc9-0006UK-41; Fri, 22 Feb 2019 09:15:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D2C2550CF;
	Fri, 22 Feb 2019 14:15:44 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27FD95DA24;
	Fri, 22 Feb 2019 14:15:37 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-14-eric.auger@redhat.com>
	<20190222144846.0a891948@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7e584e86-1099-a014-c23c-bd2feb4e50ba@redhat.com>
Date: Fri, 22 Feb 2019 15:15:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190222144846.0a891948@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 22 Feb 2019 14:15:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 13/17] hw/arm/virt: Allocate device_memory
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
X-TUID: msD7rNpOLBOD

Hi Igor,

On 2/22/19 2:48 PM, Igor Mammedov wrote:
> On Wed, 20 Feb 2019 23:39:59 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> The device memory region is located after the initial RAM.
>> its start/size are 1GB aligned.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>>
>> ---
>> v6 -> v7:
>> - check the device memory top does not wrap
>> - check the device memory can fit the slots
>>
>> v4 -> v5:
>> - device memory set after the initial RAM
>>
>> v3 -> v4:
>> - remove bootinfo.device_memory_start/device_memory_size
>> - rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
>> ---
>>  hw/arm/virt.c | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 470ca0ce2d..33ad9b3f63 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -62,6 +62,7 @@
>>  #include "target/arm/internals.h"
>>  #include "hw/mem/pc-dimm.h"
>>  #include "hw/mem/nvdimm.h"
>> +#include "hw/acpi/acpi.h"
>>  
>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -1263,6 +1264,34 @@ static void create_secure_ram(VirtMachineState *vms,
>>      g_free(nodename);
>>  }
>>  
>> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
>> +{
>> +    MachineState *ms = MACHINE(vms);
>> +
>> +    if (!vms->device_memory_size) {
> having vms->device_memory_size seems like duplicate, why not to reuse
> memory_region_size(MachineState::device_memory::mr) like we do elsewhere.
OK so you mean allocating the ms->device_memory in virt_setmmap? In that
case, I wonder if all that code shouldn't land in set_memmap directly?
> 
> Also it would be better to all device_memory allocation/initialization
> compact and close to each other like it's done in pc/spapr.
I am not sure I get your point here. alloc & init are done in this
function. Or do you mean I should rather move that into set_memmap?

Thanks

Eric
> 
>> +        return;
>> +    }
>> +
>> +    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
>> +        error_report("unsupported number of memory slots: %"PRIu64,
>> +                     ms->ram_slots);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +    if (QEMU_ALIGN_UP(ms->maxram_size, GiB) != ms->maxram_size) {
>> +        error_report("maximum memory size must be GiB aligned");
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>> +    ms->device_memory->base = vms->device_memory_base;
>> +
>> +    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
>> +                       "device-memory", vms->device_memory_size);
>> +    memory_region_add_subregion(sysmem, ms->device_memory->base,
>> +                                &ms->device_memory->mr);
>> +}
>> +
>>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>>  {
>>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
>> @@ -1610,6 +1639,10 @@ static void machvirt_init(MachineState *machine)
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
