Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp433601wru;
        Wed, 18 Jul 2018 06:05:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcT+hAHoB27MHtc9UE4wSry/mO8+mLejJBQ4VXH4RdpRFxRGpF4E6dE46R9Hze9jmukO8Wp
X-Received: by 2002:a0c:adf8:: with SMTP id x53-v6mr6330378qvc.19.1531919140200;
        Wed, 18 Jul 2018 06:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531919140; cv=none;
        d=google.com; s=arc-20160816;
        b=MjR60YxnmjWE2JTqsBfo7RaBPiw+y2nk9ETXkdXnyWIk79hgdKdtig+GlAakjeArPk
         +XZORZBzHuh68B3ETvZqPF8ny3uNoDlLLpuOdVV4iBb4MaoWGPN22Rln2B0ibDQ2bMIA
         x4mkWnaE20xTXybo/4PnFBQDS67UeJnxmHxUSTOiZYKwgqgUSnmIpP02qa3gY7ub6Qfk
         jmnOLAbeC8cLjGB9O9aTvHE4hS4OmK5p/erL6Jk1wR+4znAhIiwOFp7RiHX/pZIx/r+q
         WOTHvt66lsDMsT24v+HPsEwRmaXk1qCcqdzu02D/ppkpLAjhDhZgTf1QF/jaL4aXju5N
         Qy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=SqcigxFl+bKzTCwanhpzQJsgYC5uVAKR0ZOoYbikTak=;
        b=VG6iV384q5WjdQZKbjZrjYiCCVs9J8idg7hc96O8rJeTFm9iikR91esUeh+1sV6v/N
         h1myMuchJIy3nI+DBLtaIA83eu5DapJXJBBhm3N6YHhBy/LPRrAIzF/ENlJIM8d5i1QX
         7yOJdqTjDfQHK+59Xy00anOJz2e04l7EgWNs2+B/iYU7QOKIfXVs+pqjcqCMHboiGuQC
         e5tk7cns7ubMctcwxgh71PNK2ur/1usMahssC8Mg6wc6uuvnJXHdP+S/ZT7qPqYMxa+9
         dPQnirOcJJZUHNo3kbpeymj6m2ws1IUShG5j4VztOvwbGBB8dWBu45iWAnugrp5LvujZ
         OjMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j67-v6si333418qkh.114.2018.07.18.06.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Jul 2018 06:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffm9D-0003Ds-P1
	for alex.bennee@linaro.org; Wed, 18 Jul 2018 09:05:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ffm92-0003BP-9z
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 09:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ffm8x-0002jB-1P
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 09:05:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59838 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ffm8w-0002iQ-Pc; Wed, 18 Jul 2018 09:05:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48894401EF07;
	Wed, 18 Jul 2018 13:05:22 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC4C2026D69;
	Wed, 18 Jul 2018 13:05:20 +0000 (UTC)
Date: Wed, 18 Jul 2018 15:05:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180718150519.697d815d@redhat.com>
In-Reply-To: <1530602398-16127-7-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-7-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 18 Jul 2018 13:05:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 18 Jul 2018 13:05:22 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, agraf@suse.de, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gF1ka5QO6uMJ

On Tue,  3 Jul 2018 09:19:49 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> We define a new hotpluggable RAM region (aka. device memory).
> Its base is 2TB GPA. This obviously requires 42b IPA support
> in KVM/ARM, FW and guest kernel. At the moment the device
> memory region is max 2TB.
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
why do we need duplicate it in bootinfo?
(I'd try avoid using bootinfo and use original source instead
where it's needed)


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

