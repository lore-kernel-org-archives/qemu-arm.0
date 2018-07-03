Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1489303ivh;
        Tue, 3 Jul 2018 11:25:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf99v3e85xqMAQbukijXEFk8ko3/X2xXckBEcg1PRDKRXp2NA1bUjc0TjqmWWlPek/6fPqq
X-Received: by 2002:a37:2966:: with SMTP id p99-v6mr26319926qkh.390.1530642318835;
        Tue, 03 Jul 2018 11:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530642318; cv=none;
        d=google.com; s=arc-20160816;
        b=awRAtoAYVZpehZ5TiBuXzsQxXb8KrouELayo+CKsMZClpx3Vie+sk+R+tmRSFfa2ZL
         ZAT4it7WQTVGhlGCkOM3HI66/jJjvYDGS51meoVfG9Sg4oYdcONg7S0jCyTtwQf9G7+0
         8/s1gXpYAtUmobKf+qk1ERFPu6E9vWXce12/ApV9aKenCWTOw3ELf+oeMeo1C9gD4I1K
         d6yEHKWG5ZtVnnSPaqlIfm9OFe+dPRasf7Sefw5Ef/0XUqo3NlOdwfDF2xwUGTbqVRGC
         7KaVCAHmevI/k9kj7xV75k9TsrI3BSAy1aOBvaSUEyO58B0n7KQ9KQodPLGw4wdczCYR
         pedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to:arc-authentication-results;
        bh=9HVE7UJpJd9MUmJg55/UZjEQm9flsa9BQcUf7HznbaE=;
        b=SBI7OAJ2mZjnTRLLY1rEsyJSvSz7IhYBqTsI9yLk2EWb9vNwojalpaLlgBbVzZ4Tpz
         Rq5370V80XOxk9DpqYGDhjy4wD2m6i71IRbskJnJQ8wd/BQjzHzw38jWS5BdhFJaZxP9
         lFREi83buwxPNrd0DLv+aC/63oMB3h8ATj2dCbF1MhFFIv2HJ+wrzR8UDnVDXd/T17Zh
         YvreARu/1O2ajIiw1RTHwAi6vKH3oEumk66K4i6OodW0z7gWH6UqGAj/TfdBaFmV0aw+
         Dw6KfzTBSwORBX66xpJ5pCK4OkGapn8ZjKuaEv0FC35fjrhEh01cJv65s7oWdCuiVqAc
         y1Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8-v6si531178qtj.61.2018.07.03.11.25.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 11:25:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faPzK-0003ln-6g
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 14:25:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1faPzE-0003kA-0Q
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 14:25:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1faPz8-00078a-Pm
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 14:25:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45292 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1faPz8-00078G-He; Tue, 03 Jul 2018 14:25:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3015FC326;
	Tue,  3 Jul 2018 18:25:05 +0000 (UTC)
Received: from [10.36.116.45] (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 320F12156880;
	Tue,  3 Jul 2018 18:25:02 +0000 (UTC)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-7-git-send-email-eric.auger@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <a856ba3a-c211-5f35-4023-97ef73eb5c31@redhat.com>
Date: Tue, 3 Jul 2018 20:25:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1530602398-16127-7-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 03 Jul 2018 18:25:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 03 Jul 2018 18:25:05 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'david@redhat.com' RCPT:''
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
X-TUID: Nfy6m2ldtL26

On 03.07.2018 09:19, Eric Auger wrote:
> We define a new hotpluggable RAM region (aka. device memory).
> Its base is 2TB GPA. This obviously requires 42b IPA support
> in KVM/ARM, FW and guest kernel. At the moment the device
> memory region is max 2TB.

Maybe a stupid question, but why exactly does it have to start at 2TB
(and not e.g. at 1TB)?

> 
> This is largely inspired of device memory initialization in
> pc machine code.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> ---
>  hw/arm/virt.c         | 104 ++++++++++++++++++++++++++++++++++++--------------
>  include/hw/arm/arm.h  |   2 +
>  include/hw/arm/virt.h |   1 +
>  3 files changed, 79 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 5a4d0bf..6fefb78 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -59,6 +59,7 @@
>  #include "qapi/visitor.h"
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
> +#include "hw/acpi/acpi.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -94,34 +95,25 @@
>  
>  #define PLATFORM_BUS_NUM_IRQS 64
>  
> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
> - * address space unallocated and free for future use between 256G and 512G.
> - * If we need to provide more RAM to VMs in the future then we need to:
> - *  * allocate a second bank of RAM starting at 2TB and working up
> - *  * fix the DT and ACPI table generation code in QEMU to correctly
> - *    report two split lumps of RAM to the guest
> - *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
> - * (We don't want to fill all the way up to 512GB with RAM because
> - * we might want it for non-RAM purposes later. Conversely it seems
> - * reasonable to assume that anybody configuring a VM with a quarter
> - * of a terabyte of RAM will be doing it on a host with more than a
> - * terabyte of physical address space.)
> - */
> -#define RAMLIMIT_GB 255
> -#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> +#define SZ_64K 0x10000
> +#define SZ_1G (1024ULL * 1024 * 1024)
>  
>  /* Addresses and sizes of our components.
> - * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
> - * 128MB..256MB is used for miscellaneous device I/O.
> - * 256MB..1GB is reserved for possible future PCI support (ie where the
> - * PCI memory window will go if we add a PCI host controller).
> - * 1GB and up is RAM (which may happily spill over into the
> - * high memory region beyond 4GB).
> - * This represents a compromise between how much RAM can be given to
> - * a 32 bit VM and leaving space for expansion and in particular for PCI.
> - * Note that devices should generally be placed at multiples of 0x10000,
> + * 0..128MB is space for a flash device so we can run bootrom code such as UEFI,
> + * 128MB..256MB is used for miscellaneous device I/O,
> + * 256MB..1GB is used for PCI host controller,
> + * 1GB..256GB is RAM (not hotpluggable),
> + * 256GB..512GB: is left for device I/O (non RAM purpose),
> + * 512GB..1TB: high mem PCI MMIO region,
> + * 2TB..4TB is used for hot-pluggable DIMM (assumes 42b GPA is supported).
> + *
> + * Note that IO devices should generally be placed at multiples of 0x10000,
>   * to accommodate guests using 64K pages.
> + *
> + * Conversely it seems reasonable to assume that anybody configuring a VM
> + * with a quarter of a terabyte of RAM will be doing it on a host with more
> + * than a terabyte of physical address space.)
> + *
>   */
>  static const MemMapEntry a15memmap[] = {
>      /* Space up to 0x8000000 is reserved for a boot ROM */
> @@ -148,12 +140,13 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
> -    [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
> +    [VIRT_MEM] =                { SZ_1G , 255 * SZ_1G },
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>      [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000 },
>      [VIRT_PCIE_ECAM_HIGH] =     { 0x4010000000ULL, 0x10000000 },
>      /* Second PCIe window, 512GB wide at the 512GB boundary */
> -    [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
> +    [VIRT_PCIE_MMIO_HIGH] =     { 512 * SZ_1G, 512 * SZ_1G },
> +    [VIRT_HOTPLUG_MEM] =        { 2048 * SZ_1G, 2048 * SZ_1G },
>  };
>  
>  static const int a15irqmap[] = {
> @@ -1223,6 +1216,58 @@ static void create_secure_ram(VirtMachineState *vms,
>      g_free(nodename);
>  }
>  
> +static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
> +{
> +    MachineState *ms = MACHINE(vms);
> +    uint64_t device_memory_size;
> +    uint64_t align = SZ_64K;
> +
> +    /* always allocate the device memory information */
> +    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
> +
> +    if (vms->max_vm_phys_shift < 42) {
> +        /* device memory starts at 2TB whereas this VM supports less than
> +         * 2TB GPA */
> +        if (ms->maxram_size > ms->ram_size || ms->ram_slots) {
> +            MachineClass *mc = MACHINE_GET_CLASS(ms);
> +
> +            error_report("\"-memory 'slots|maxmem'\" is not supported by %s "
> +                         "since KVM does not support more than 41b IPA",
> +                         mc->name);
> +            exit(EXIT_FAILURE);
> +        }
> +        return;
> +    }
> +
> +    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
> +        error_report("unsupported number of memory slots: %"PRIu64,
> +                     ms->ram_slots);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    if (QEMU_ALIGN_UP(ms->maxram_size, align) != ms->maxram_size) {
> +        error_report("maximum memory size must be aligned to multiple of 0x%"
> +                     PRIx64, align);
> +            exit(EXIT_FAILURE);
> +    }
> +
> +    ms->device_memory->base = vms->memmap[VIRT_HOTPLUG_MEM].base;
> +    device_memory_size = ms->maxram_size - ms->ram_size;
> +
> +    if (device_memory_size > vms->memmap[VIRT_HOTPLUG_MEM].size) {
> +        error_report("unsupported amount of maximum memory: " RAM_ADDR_FMT,
> +                         ms->maxram_size);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
> +                       "device-memory", device_memory_size);
> +    memory_region_add_subregion(sysmem, ms->device_memory->base,
> +                                &ms->device_memory->mr);
> +    vms->bootinfo.device_memory_start = ms->device_memory->base;
> +    vms->bootinfo.device_memory_size = device_memory_size;
> +}
> +
>  static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  {
>      const VirtMachineState *board = container_of(binfo, VirtMachineState,
> @@ -1430,7 +1475,8 @@ static void machvirt_init(MachineState *machine)
>      vms->smp_cpus = smp_cpus;
>  
>      if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
> -        error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
> +        error_report("mach-virt: cannot model more than %dGB RAM",
> +                     (int)(vms->memmap[VIRT_MEM].size / SZ_1G));
>          exit(1);
>      }
>  
> @@ -1525,6 +1571,8 @@ static void machvirt_init(MachineState *machine)
>                                           machine->ram_size);
>      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
>  
> +    create_device_memory(vms, sysmem);
> +
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>  
>      create_gic(vms, pic);
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index ffed392..76269e6 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -116,6 +116,8 @@ struct arm_boot_info {
>      bool secure_board_setup;
>  
>      arm_endianness endianness;
> +    hwaddr device_memory_start;
> +    hwaddr device_memory_size;
>  };
>  
>  /**
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 91f6de2..173938d 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -78,6 +78,7 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_HOTPLUG_MEM,
>  };
>  
>  typedef enum VirtIOMMUType {
> 


-- 

Thanks,

David / dhildenb
