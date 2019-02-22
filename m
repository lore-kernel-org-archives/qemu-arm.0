Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6652958wrx;
        Thu, 21 Feb 2019 23:41:44 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZZkrg7ujeEEQSEe01rbM74VJoljfEothqcBxokpcNC0QvzgVToxH0M3sEjNCgHZGh3soDb
X-Received: by 2002:a0d:dd4e:: with SMTP id g75mr246940ywe.441.1550821304730;
        Thu, 21 Feb 2019 23:41:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550821304; cv=none;
        d=google.com; s=arc-20160816;
        b=rc49ukmIsijM+uVOSnUNRvrFf6eY4fk2+yzBnjTmVNWYJncvHUpQo9qvm8fP3CtJDs
         qOEWRzxWeRaeMwqgYP5QLTm3y5qymXlNUyNlWPttGKXaZd5YHvO/gAqOmvECA9BfBtAg
         7siZBapmfIMI8C9uSE0387kJQ9I9YbbFC2YOrTnodpemKhZxV5MxRY0LVcTtR/w2adKt
         FADtaNpScZwZKnEhZd8QgHfd8LdQTIob4BJX6GxeteWTlJudCNFPTAFiWT/FCVhDosab
         IXJJBxF2ER4AixF4K6r+h53cUo3MhRM7EypvesDO3bu8bdzatg9W7GsTbcyh8TZx6J/H
         WByw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=3XGZcgkmAsV0pYy/PETiZsTP41vITNNkNGYYGvsQyF0=;
        b=VFlYfyfKyeaxMmFDijRL6UaPZ52S3e25b9T/UfjEiY4ajzWzcnwUeCn9LKbYHxEaQp
         7JFBvy/TIAguQ2ot20l5S5zPUw+QIVd/oH5mzDj+U9huLQmumDJxvG/72lG+Kr8IZGVy
         0kZKDMSEFH6QtslwmJSWhZUr7XEikwK3LgibUB6uKuMQWZNNL5T8lsS1ISVCNaSKEhX9
         71uxzpBujuloBVXvdL017P/3vqNEVr2DU2K4zpouFvXcLrVBXnEx/lPuDe5jZE5FvKbH
         mN3m9Nl1th38YJZutAcFCNrKAn3hffgVU/a4grYtmwOdYni3HaD6wVF2ChHZ5n4oo4k1
         A8JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191si396040ybf.257.2019.02.21.23.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 23:41:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:45736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gx5Sq-0003dX-3Z
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 02:41:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1gx5R6-0002vv-SZ
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 02:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1gx5Ms-0003yi-SV
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 02:35:36 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:43378 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1gx5MY-00039o-1x; Fri, 22 Feb 2019 02:35:15 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 59F32553946539619A55;
	Fri, 22 Feb 2019 15:34:20 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.408.0; Fri, 22 Feb 2019
	15:34:09 +0800
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
	<peter.maydell@linaro.org>, 
	<shameerali.kolothum.thodi@huawei.com>, <imammedo@redhat.com>,
	<david@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-4-eric.auger@redhat.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <fff2d35e-6aab-aed3-0088-f0c23e31bf76@huawei.com>
Date: Fri, 22 Feb 2019 15:34:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190220224003.4420-4-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-devel] [PATCH v7 03/17] hw/arm/virt: Split the memory map
 description
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4oS3ZRceIDo2

Hi Eric,

Can't we still use one single memory map and update the base of every entry following VIRT_MEM? So that we don't need to split memory map or the enumeration definition, neither do we need to copy a15memmap into the extended memmap.

Thanks,

Heyi


On 2019/2/21 6:39, Eric Auger wrote:
> In the prospect to introduce an extended memory map supporting more
> RAM, let's split the memory map array into two parts:
>
> - the former a15memmap contains regions below and including the RAM
> - extended_memmap, only initialized with entries located after the RAM.
>    Only the size of the region is initialized there since their base
>    address will be dynamically computed, depending on the top of the
>    RAM (initial RAM at the moment), with same alignment as their size.
>
> This new split will allow to grow the RAM size without changing the
> description of the high regions.
>
> The patch also moves the memory map setup into machvirt_init().
> The rationale is the memory map will be soon affected by the
> kvm_type() call that happens after virt_instance_init() and
> before machvirt_init().
>
> The memory map is unchanged (the top of the initial RAM still is
> 256GiB). Then come the high IO regions with same layout as before.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> ---
> v6 -> v7:
> - s/a15memmap/base_memmap
> - slight rewording of the commit message
> - add "if there is less than 256GiB of RAM then the floating area
>    starts at the 256GiB mark" in the comment associated to the floating
>    memory map
> - Added Peter's R-b
>
> v5 -> v6
> - removal of many macros in units.h
> - introduce the virt_set_memmap helper
> - new computation for offsets of high IO regions
> - add comments
> ---
>   hw/arm/virt.c         | 48 +++++++++++++++++++++++++++++++++++++------
>   include/hw/arm/virt.h | 14 +++++++++----
>   2 files changed, 52 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a1955e7764..12039a0367 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -29,6 +29,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
>   #include "qapi/error.h"
>   #include "hw/sysbus.h"
>   #include "hw/arm/arm.h"
> @@ -121,7 +122,7 @@
>    * Note that devices should generally be placed at multiples of 0x10000,
>    * to accommodate guests using 64K pages.
>    */
> -static const MemMapEntry a15memmap[] = {
> +static const MemMapEntry base_memmap[] = {
>       /* Space up to 0x8000000 is reserved for a boot ROM */
>       [VIRT_FLASH] =              {          0, 0x08000000 },
>       [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
> @@ -149,11 +150,21 @@ static const MemMapEntry a15memmap[] = {
>       [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>       [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>       [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
> +};
> +
> +/*
> + * Highmem IO Regions: This memory map is floating, located after the RAM.
> + * Each IO region offset will be dynamically computed, depending on the
> + * top of the RAM, so that its base get the same alignment as the size,
> + * ie. a 512GiB region will be aligned on a 512GiB boundary. If there is
> + * less than 256GiB of RAM, the floating area starts at the 256GiB mark.
> + */
> +static MemMapEntry extended_memmap[] = {
>       /* Additional 64 MB redist region (can contain up to 512 redistributors) */
> -    [VIRT_HIGH_GIC_REDIST2] =   { 0x4000000000ULL, 0x4000000 },
> -    [VIRT_HIGH_PCIE_ECAM] =     { 0x4010000000ULL, 0x10000000 },
> -    /* Second PCIe window, 512GB wide at the 512GB boundary */
> -    [VIRT_HIGH_PCIE_MMIO] =     { 0x8000000000ULL, 0x8000000000ULL },
> +    [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
> +    [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
> +    /* Second PCIe window */
> +    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
>   };
>   
>   static const int a15irqmap[] = {
> @@ -1354,6 +1365,30 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>       return arm_cpu_mp_affinity(idx, clustersz);
>   }
>   
> +static void virt_set_memmap(VirtMachineState *vms)
> +{
> +    hwaddr base;
> +    int i;
> +
> +    vms->memmap = extended_memmap;
> +
> +    for (i = 0; i < ARRAY_SIZE(base_memmap); i++) {
> +        vms->memmap[i] = base_memmap[i];
> +    }
> +
> +    vms->high_io_base = 256 * GiB; /* Top of the legacy initial RAM region */
> +    base = vms->high_io_base;
> +
> +    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> +        hwaddr size = extended_memmap[i].size;
> +
> +        base = ROUND_UP(base, size);
> +        vms->memmap[i].base = base;
> +        vms->memmap[i].size = size;
> +        base += size;
> +    }
> +}
> +
>   static void machvirt_init(MachineState *machine)
>   {
>       VirtMachineState *vms = VIRT_MACHINE(machine);
> @@ -1368,6 +1403,8 @@ static void machvirt_init(MachineState *machine)
>       bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>       bool aarch64 = true;
>   
> +    virt_set_memmap(vms);
> +
>       /* We can probe only here because during property set
>        * KVM is not available yet
>        */
> @@ -1843,7 +1880,6 @@ static void virt_instance_init(Object *obj)
>                                       "Valid values are none and smmuv3",
>                                       NULL);
>   
> -    vms->memmap = a15memmap;
>       vms->irqmap = a15irqmap;
>   }
>   
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index a27086d524..3dc7a6c5d5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -64,7 +64,6 @@ enum {
>       VIRT_GIC_VCPU,
>       VIRT_GIC_ITS,
>       VIRT_GIC_REDIST,
> -    VIRT_HIGH_GIC_REDIST2,
>       VIRT_SMMU,
>       VIRT_UART,
>       VIRT_MMIO,
> @@ -74,12 +73,18 @@ enum {
>       VIRT_PCIE_MMIO,
>       VIRT_PCIE_PIO,
>       VIRT_PCIE_ECAM,
> -    VIRT_HIGH_PCIE_ECAM,
>       VIRT_PLATFORM_BUS,
> -    VIRT_HIGH_PCIE_MMIO,
>       VIRT_GPIO,
>       VIRT_SECURE_UART,
>       VIRT_SECURE_MEM,
> +    VIRT_LOWMEMMAP_LAST,
> +};
> +
> +/* indices of IO regions located after the RAM */
> +enum {
> +    VIRT_HIGH_GIC_REDIST2 =  VIRT_LOWMEMMAP_LAST,
> +    VIRT_HIGH_PCIE_ECAM,
> +    VIRT_HIGH_PCIE_MMIO,
>   };
>   
>   typedef enum VirtIOMMUType {
> @@ -116,7 +121,7 @@ typedef struct {
>       int32_t gic_version;
>       VirtIOMMUType iommu;
>       struct arm_boot_info bootinfo;
> -    const MemMapEntry *memmap;
> +    MemMapEntry *memmap;
>       const int *irqmap;
>       int smp_cpus;
>       void *fdt;
> @@ -126,6 +131,7 @@ typedef struct {
>       uint32_t msi_phandle;
>       uint32_t iommu_phandle;
>       int psci_conduit;
> +    hwaddr high_io_base;
>   } VirtMachineState;
>   
>   #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)


