Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp732098wrx;
        Thu, 28 Feb 2019 07:52:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwisBv6Xxx8v7+/pLqWIQmCpULsGMgsjYTCdqXsj1dqdF8ZbN5MXfSR1myEhfmPahDBNIr/
X-Received: by 2002:a25:9808:: with SMTP id a8mr3894ybo.219.1551369175521;
        Thu, 28 Feb 2019 07:52:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551369175; cv=none;
        d=google.com; s=arc-20160816;
        b=u1t7MdyKBUzZjRZkaA7mwuQI3cTv9PTNyXH1aN/i3OP3Ct0BMfDQMfnqfFuE4Gelj6
         WJPuiewLW1NFNAA1KLoSsVWAtYUSaCYBkHZOCJ+5Pt+ncwapgVDoO3klZXkZX9BDs/QC
         fQ3Z7LGEL4haVMgQTjE/UoOn13kLotgy+0F8eLpcHWc31eTB91hEH/mkMl7VieqUFhMV
         td2uVO8xjvA3mWQzbIgWPo9abTL4grzggtL62bNnB1LHn9/e8LeIMLVfMZzKosV6zZ2r
         0ODM/sCkBngL+ayoI9hSFZdF5h1zUIUd7Puntvucy61WvsbJ0e9Wcsg9u1SrIp63KEiC
         eUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=O+Opi/iHIvMVZCcfoLZ2q2xOF+Ndg0wRjekDJnxRcmg=;
        b=vuW8LRb8rOgVRiWbAG2OI8gZFLSjwD5WFZmNL4ept6ojiCZPLmntIduJQFckegcL2v
         SlfQcWuXVV/v8IEmKRsh9Y1ir3zmpARlIvTZgSdFZpneufSf8zS1wdND1ZPfdUtYHRpO
         Zn5ZCqF39P4tx6e3VReGnjo8xi00oeSMx+ar3uGSovKh/Oro4GUYa/UKoMOszNVeqaWM
         levZeKwinsaW8gOVoD+WYU7UI7DoHtcdaflDDFwBdq8kqPO8U1vWwKcIuxsSCVhvWeD8
         Hdhqqo+ihcJVxJ/9nSbJ7vZBsXP8m6D2IU7nucqJ3XVcqc4lYoyIsWaxHeyN7rNa2hAZ
         eHLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si10468237ywc.204.2019.02.28.07.52.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:52:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNzS-0003kc-SV
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:52:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzNzE-0003ir-U0
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:52:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzNzA-0007Kf-PW
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:52:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50784)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzNz8-000722-Ou; Thu, 28 Feb 2019 10:52:35 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48AF7CFEC7;
	Thu, 28 Feb 2019 15:51:52 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9323813ACF;
	Thu, 28 Feb 2019 15:51:41 +0000 (UTC)
Date: Thu, 28 Feb 2019 16:51:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190228165139.7c4b827d@redhat.com>
In-Reply-To: <20190228150324.25973-4-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
	<20190228150324.25973-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 28 Feb 2019 15:51:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v10 03/10] hw/arm/virt: Split the memory map
 description
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
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rt03axADnEj5

On Thu, 28 Feb 2019 16:03:17 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> In the prospect to introduce an extended memory map supporting more
> RAM, let's split the memory map array into two parts:
> 
> - the former a15memmap, renamed base_memmap, contains regions below
>   and including the RAM. MemMapEntries initialized in this array
>   have a static size and base address.
> - extended_memmap, only initialized with entries located after the
>   RAM. MemMapEntries initialized in this array only get their size
>   initialized. Their base address is dynamically computed depending
>   on the the top of the RAM, with same alignment as their size.
> 
> Eventually base_memmap entries are copied into the extended_memmap
> array. Using two separate arrays however clarifies which entries
> are statically allocated and those which are dynamically allocated.
> 
> This new split will allow to grow the RAM size without changing the
> description of the high IO entries.
> 
> We introduce a new virt_set_memmap() helper function which
> "freezes" the memory map. We call it in machvirt_init as
> memory attributes of the machine are not yet set when
> virt_instance_init() gets called.
> 
> The memory map is unchanged (the top of the initial RAM still is
> 256GiB). Then come the high IO regions with same layout as before.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v8 -> v9:
> - restore virt_set_memmap call in machvirt_init as otherwise it does
>   not work in TCG mode
> 
> v7 -> v8:
> - removed Peter's R-b due to the changes induced by Igor's comments
> - call set_memmap back in virt_instance_init
> - add comments about sizing of extended_memmap
> - s/region/entries as suggested by Igor
> - rewording of the commit message
> 
> v6 -> v7:
> - s/a15memmap/base_memmap
> - slight rewording of the commit message
> - add "if there is less than 256GiB of RAM then the floating area
>   starts at the 256GiB mark" in the comment associated to the floating
>   memory map
> - Added Peter's R-b
> 
> v5 -> v6
> - removal of many macros in units.h
> - introduce the virt_set_memmap helper
> - new computation for offsets of high IO regions
> - add comments
> ---
>  hw/arm/virt.c         | 51 ++++++++++++++++++++++++++++++++++++++-----
>  include/hw/arm/virt.h | 14 ++++++++----
>  2 files changed, 55 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 892bae4f3a..8a23608d3e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -29,6 +29,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/arm.h"
> @@ -121,7 +122,7 @@
>   * Note that devices should generally be placed at multiples of 0x10000,
>   * to accommodate guests using 64K pages.
>   */
> -static const MemMapEntry a15memmap[] = {
> +static const MemMapEntry base_memmap[] = {
>      /* Space up to 0x8000000 is reserved for a boot ROM */
>      [VIRT_FLASH] =              {          0, 0x08000000 },
>      [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
> @@ -149,11 +150,24 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
> +};
> +
> +/*
> + * Highmem IO Regions: This memory map is floating, located after the RAM.
> + * Each MemMapEntry base (GPA) will be dynamically computed, depending on the
> + * top of the RAM, so that its base get the same alignment as the size,
> + * ie. a 512GiB entry will be aligned on a 512GiB boundary. If there is
> + * less than 256GiB of RAM, the floating area starts at the 256GiB mark.
> + * Note the extended_memmap is sized so that it eventually also includes the
> + * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
> + * index of base_memmap).
> + */
> +static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
> -    [VIRT_HIGH_GIC_REDIST2] =   { 0x4000000000ULL, 0x4000000 },
> -    [VIRT_HIGH_PCIE_ECAM] =     { 0x4010000000ULL, 0x10000000 },
> -    /* Second PCIe window, 512GB wide at the 512GB boundary */
> -    [VIRT_HIGH_PCIE_MMIO] =     { 0x8000000000ULL, 0x8000000000ULL },
> +    [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
> +    [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
> +    /* Second PCIe window */
> +    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
>  };
>  
>  static const int a15irqmap[] = {
> @@ -1354,6 +1368,30 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
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
Why do we need to carry this state in vms?
it looks like it is used as local variable

and then it's possible to access that memmap[VIRT_HIGH_GIC_REDIST2]
outside of this function, hence it rises duplication alarm

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
>  static void machvirt_init(MachineState *machine)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(machine);
> @@ -1368,6 +1406,8 @@ static void machvirt_init(MachineState *machine)
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>      bool aarch64 = true;
>  
> +    virt_set_memmap(vms);
> +
>      /* We can probe only here because during property set
>       * KVM is not available yet
>       */
> @@ -1845,7 +1885,6 @@ static void virt_instance_init(Object *obj)
>                                      "Valid values are none and smmuv3",
>                                      NULL);
>  
> -    vms->memmap = a15memmap;
>      vms->irqmap = a15irqmap;
>  }
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index a27086d524..3dc7a6c5d5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -64,7 +64,6 @@ enum {
>      VIRT_GIC_VCPU,
>      VIRT_GIC_ITS,
>      VIRT_GIC_REDIST,
> -    VIRT_HIGH_GIC_REDIST2,
>      VIRT_SMMU,
>      VIRT_UART,
>      VIRT_MMIO,
> @@ -74,12 +73,18 @@ enum {
>      VIRT_PCIE_MMIO,
>      VIRT_PCIE_PIO,
>      VIRT_PCIE_ECAM,
> -    VIRT_HIGH_PCIE_ECAM,
>      VIRT_PLATFORM_BUS,
> -    VIRT_HIGH_PCIE_MMIO,
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_LOWMEMMAP_LAST,
> +};
> +
> +/* indices of IO regions located after the RAM */
> +enum {
> +    VIRT_HIGH_GIC_REDIST2 =  VIRT_LOWMEMMAP_LAST,
> +    VIRT_HIGH_PCIE_ECAM,
> +    VIRT_HIGH_PCIE_MMIO,
>  };
>  
>  typedef enum VirtIOMMUType {
> @@ -116,7 +121,7 @@ typedef struct {
>      int32_t gic_version;
>      VirtIOMMUType iommu;
>      struct arm_boot_info bootinfo;
> -    const MemMapEntry *memmap;
> +    MemMapEntry *memmap;
>      const int *irqmap;
>      int smp_cpus;
>      void *fdt;
> @@ -126,6 +131,7 @@ typedef struct {
>      uint32_t msi_phandle;
>      uint32_t iommu_phandle;
>      int psci_conduit;
> +    hwaddr high_io_base;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

