Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1053803wrq;
        Tue, 3 Jul 2018 12:28:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe4VTin2EDPye2rZHkoeGM2YBaVKBqGP7Sl8HJiCV6g1t3VvJ1ZmLcg1jR8Z1CUSnAjs3tP
X-Received: by 2002:a37:aa86:: with SMTP id t128-v6mr20622042qke.135.1530646082352;
        Tue, 03 Jul 2018 12:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530646082; cv=none;
        d=google.com; s=arc-20160816;
        b=qYbzOnZyW+DBMZ4J3A7WcoKZSaGbM+XxlKAGDhP6pUS9Pe9RknkAwz9sim/hTuZlbM
         y/xJ9onpm+EMBqayKQwI2wHmTKLzzPYfVSWCYyfgFyzrs+5oAxKmKkkwoJ/u6y008XPm
         uq5seihI42P3HJkgFpk8ZJv9ht4LXQX7xfDmDeueyGK/D3cKfjjSpWrrspZCbq19AG3y
         gl4agmxt40MdXohah7Bxnk6tfO0mP0wEjbJ27zIJb5ouyPS6/0d2QWz3j7EdUBH4wdMH
         DA/c4zgYVpucI1jJfahy2/g00xHph2tzZvtdLHj/bonVs12chuNcOa1zmgYhRmpVGoqS
         +Eig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=DntGq6zlOkIuo49R6eZiYVJMjidLlLfrgm9TvkUTwzE=;
        b=TXb3DhB/wrpSy5aU9lirEruwN8ujjokKi1dGPuM/ruIwhduj4lvbFT6JjVPIuUvYy4
         5XmtGqYF8llJST0UqldLsE0+EvdwK3dnI+BhexQHa1zWEkR8ey8ZYnSHXlcSl1kqus22
         b0F1abLAOa6HkcCWWeMTx1t5V9vHh1y9t/Zls7LX1KnyzfyRoEtseoFsd3XjZKQ5Iri5
         6WskvIHYgM3Bqpv5JOoE2kibnyysG7ChMFJ5iXFXkWxtRI77D0rwax/Nj5Mk9y8OHbOy
         3o0zmmT9ckdtStjb0t2/PZEDx79AaLSmKqJzMogw4dYyMn86fDeZ9mbztDHrL/hWD05b
         PQiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w16-v6si1805416qvf.232.2018.07.03.12.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 12:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42297 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faQxz-0005B0-Gc
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 15:27:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faQxn-0005Ap-8W
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 15:27:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faQxi-0000L8-Jg
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 15:27:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47390 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faQxi-0000L4-Cc; Tue, 03 Jul 2018 15:27:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6FE5BB43B;
	Tue,  3 Jul 2018 19:27:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14529111AF3F;
	Tue,  3 Jul 2018 19:27:34 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-7-git-send-email-eric.auger@redhat.com>
	<a856ba3a-c211-5f35-4023-97ef73eb5c31@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <df091f31-6f85-64d8-0c3b-7fd463d31c63@redhat.com>
Date: Tue, 3 Jul 2018 21:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a856ba3a-c211-5f35-4023-97ef73eb5c31@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 03 Jul 2018 19:27:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 03 Jul 2018 19:27:41 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v3 06/15] hw/arm/virt: Allocate device_memory
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MbCk7m5jl/CS

Hi David,
On 07/03/2018 08:25 PM, David Hildenbrand wrote:
> On 03.07.2018 09:19, Eric Auger wrote:
>> We define a new hotpluggable RAM region (aka. device memory).
>> Its base is 2TB GPA. This obviously requires 42b IPA support
>> in KVM/ARM, FW and guest kernel. At the moment the device
>> memory region is max 2TB.
> 
> Maybe a stupid question, but why exactly does it have to start at 2TB
> (and not e.g. at 1TB)?
not a stupid question. See tentative answer below.
> 
>>
>> This is largely inspired of device memory initialization in
>> pc machine code.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
>> ---
>>  hw/arm/virt.c         | 104 ++++++++++++++++++++++++++++++++++++--------------
>>  include/hw/arm/arm.h  |   2 +
>>  include/hw/arm/virt.h |   1 +
>>  3 files changed, 79 insertions(+), 28 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 5a4d0bf..6fefb78 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -59,6 +59,7 @@
>>  #include "qapi/visitor.h"
>>  #include "standard-headers/linux/input.h"
>>  #include "hw/arm/smmuv3.h"
>> +#include "hw/acpi/acpi.h"
>>  
>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -94,34 +95,25 @@
>>  
>>  #define PLATFORM_BUS_NUM_IRQS 64
>>  
>> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
>> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
>> - * address space unallocated and free for future use between 256G and 512G.
>> - * If we need to provide more RAM to VMs in the future then we need to:
>> - *  * allocate a second bank of RAM starting at 2TB and working up
I acknowledge this comment was the main justification. Now if you look at

Principles of ARM Memory Maps
http://infocenter.arm.com/help/topic/com.arm.doc.den0001c/DEN0001C_principles_of_arm_memory_maps.pdf
chapter 2.3 you will find that when adding PA bits, you always leave
space for reserved space and mapped IO.

On the other hand, if you look at chapter 5, "Proposed 44-bit and 48bit
Address Maps", we should logically put the additional RAM at 8TB if we
want to comply with that doc.

Peter, was there any other justification why we should put the RAM at 2TB?

Thanks

Eric


>> - *  * fix the DT and ACPI table generation code in QEMU to correctly
>> - *    report two split lumps of RAM to the guest
>> - *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
>> - * (We don't want to fill all the way up to 512GB with RAM because
>> - * we might want it for non-RAM purposes later. Conversely it seems
>> - * reasonable to assume that anybody configuring a VM with a quarter
>> - * of a terabyte of RAM will be doing it on a host with more than a
>> - * terabyte of physical address space.)
>> - */
>> -#define RAMLIMIT_GB 255
>> -#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
>> +#define SZ_64K 0x10000
>> +#define SZ_1G (1024ULL * 1024 * 1024)
>>  
>>  /* Addresses and sizes of our components.
>> - * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
>> - * 128MB..256MB is used for miscellaneous device I/O.
>> - * 256MB..1GB is reserved for possible future PCI support (ie where the
>> - * PCI memory window will go if we add a PCI host controller).
>> - * 1GB and up is RAM (which may happily spill over into the
>> - * high memory region beyond 4GB).
>> - * This represents a compromise between how much RAM can be given to
>> - * a 32 bit VM and leaving space for expansion and in particular for PCI.
>> - * Note that devices should generally be placed at multiples of 0x10000,
>> + * 0..128MB is space for a flash device so we can run bootrom code such as UEFI,
>> + * 128MB..256MB is used for miscellaneous device I/O,
>> + * 256MB..1GB is used for PCI host controller,
>> + * 1GB..256GB is RAM (not hotpluggable),
>> + * 256GB..512GB: is left for device I/O (non RAM purpose),
>> + * 512GB..1TB: high mem PCI MMIO region,
>> + * 2TB..4TB is used for hot-pluggable DIMM (assumes 42b GPA is supported).
>> + *
>> + * Note that IO devices should generally be placed at multiples of 0x10000,
>>   * to accommodate guests using 64K pages.
>> + *
>> + * Conversely it seems reasonable to assume that anybody configuring a VM
>> + * with a quarter of a terabyte of RAM will be doing it on a host with more
>> + * than a terabyte of physical address space.)
>> + *
>>   */
>>  static const MemMapEntry a15memmap[] = {
>>      /* Space up to 0x8000000 is reserved for a boot ROM */
>> @@ -148,12 +140,13 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
>>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>> -    [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>> +    [VIRT_MEM] =                { SZ_1G , 255 * SZ_1G },
>>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>>      [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000 },
>>      [VIRT_PCIE_ECAM_HIGH] =     { 0x4010000000ULL, 0x10000000 },
>>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>> -    [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>> +    [VIRT_PCIE_MMIO_HIGH] =     { 512 * SZ_1G, 512 * SZ_1G },
>> +    [VIRT_HOTPLUG_MEM] =        { 2048 * SZ_1G, 2048 * SZ_1G },
>>  };
>>  
>>  static const int a15irqmap[] = {
>> @@ -1223,6 +1216,58 @@ static void create_secure_ram(VirtMachineState *vms,
>>      g_free(nodename);
>>  }
>>  
>> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
>> +{
>> +    MachineState *ms = MACHINE(vms);
>> +    uint64_t device_memory_size;
>> +    uint64_t align = SZ_64K;
>> +
>> +    /* always allocate the device memory information */
>> +    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>> +
>> +    if (vms->max_vm_phys_shift < 42) {
>> +        /* device memory starts at 2TB whereas this VM supports less than
>> +         * 2TB GPA */
>> +        if (ms->maxram_size > ms->ram_size || ms->ram_slots) {
>> +            MachineClass *mc = MACHINE_GET_CLASS(ms);
>> +
>> +            error_report("\"-memory 'slots|maxmem'\" is not supported by %s "
>> +                         "since KVM does not support more than 41b IPA",
>> +                         mc->name);
>> +            exit(EXIT_FAILURE);
>> +        }
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
>> +            exit(EXIT_FAILURE);
>> +    }
>> +
>> +    ms->device_memory->base = vms->memmap[VIRT_HOTPLUG_MEM].base;
>> +    device_memory_size = ms->maxram_size - ms->ram_size;
>> +
>> +    if (device_memory_size > vms->memmap[VIRT_HOTPLUG_MEM].size) {
>> +        error_report("unsupported amount of maximum memory: " RAM_ADDR_FMT,
>> +                         ms->maxram_size);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
>> +                       "device-memory", device_memory_size);
>> +    memory_region_add_subregion(sysmem, ms->device_memory->base,
>> +                                &ms->device_memory->mr);
>> +    vms->bootinfo.device_memory_start = ms->device_memory->base;
>> +    vms->bootinfo.device_memory_size = device_memory_size;
>> +}
>> +
>>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>>  {
>>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
>> @@ -1430,7 +1475,8 @@ static void machvirt_init(MachineState *machine)
>>      vms->smp_cpus = smp_cpus;
>>  
>>      if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
>> -        error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
>> +        error_report("mach-virt: cannot model more than %dGB RAM",
>> +                     (int)(vms->memmap[VIRT_MEM].size / SZ_1G));
>>          exit(1);
>>      }
>>  
>> @@ -1525,6 +1571,8 @@ static void machvirt_init(MachineState *machine)
>>                                           machine->ram_size);
>>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
>>  
>> +    create_device_memory(vms, sysmem);
>> +
>>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>>  
>>      create_gic(vms, pic);
>> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
>> index ffed392..76269e6 100644
>> --- a/include/hw/arm/arm.h
>> +++ b/include/hw/arm/arm.h
>> @@ -116,6 +116,8 @@ struct arm_boot_info {
>>      bool secure_board_setup;
>>  
>>      arm_endianness endianness;
>> +    hwaddr device_memory_start;
>> +    hwaddr device_memory_size;
>>  };
>>  
>>  /**
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 91f6de2..173938d 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -78,6 +78,7 @@ enum {
>>      VIRT_GPIO,
>>      VIRT_SECURE_UART,
>>      VIRT_SECURE_MEM,
>> +    VIRT_HOTPLUG_MEM,
>>  };
>>  
>>  typedef enum VirtIOMMUType {
>>
> 
> 
