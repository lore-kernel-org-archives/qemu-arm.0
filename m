Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7067932wrx;
        Fri, 22 Feb 2019 07:19:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3IahtzyTK9alCdK6QuFpLDmOrBLNRDIGhThpYe+zkQ397NcZIzuRFuK4IB8ppjT4/SqMNRSn
X-Received: by 2002:a5b:40b:: with SMTP id m11mr3663436ybp.133.1550848764631;
        Fri, 22 Feb 2019 07:19:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550848764; cv=none;
        d=google.com; s=arc-20160816;
        b=O0mvOPFkVPaXZDVryjjId01es4SlTLkyMs4dZONrIex7o8qJ3agycmxXoepBVRQ1jt
         UR3pSBhxZNZjhXyWcaSJgphJG6j41tfGlEDLo5r1fp9kq/dWWdZ7CGZM8kFRP+2aL9LV
         CA0JTxlKj3F3LtXIUYRZ+3dYT73jg7lf3IBU1FiiaL8sbAj7HSR9ZNC1HQwZSNlH5uo2
         stc0gc8lJ+fdpBvDaLy+aMxERi11HvjyjG/zeXMbyigdGypGI35HKWNx+FG8qrb3djla
         OZvyltrTfSGukzUDWku2aRKzqP0lBD77nXvO7EkYFz8Ar8VQBZC58dbWGXRDR4LhOPCX
         YH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=o8IUgCBczzboH41Qk8QWTnV6MkT23NOiaMyzcpXqc9I=;
        b=QnnfLTrvHgkjzN1K/nSHAF8Bxap/HhSbkyupnpdpXCRPeC/DDBFJgWsDG2qn5ECRE1
         TrrN9sRoNmebSweWvfCAhgeE0IMVqC0NX7X58FGmXjQAlqQP0rxjwrn7ozfGQNzJzNjD
         viPL7ToR3Z8ICtZtMwYTs2vXVCzLz3Gaj5xgeUrP+Wxom9vvcSTQM/ipEJG+VZf3uEQi
         HDS2mmthc/8J4LhUUkFd658clzNkJbmECjO9UqE5BvxfW6B9eRmXx98DD3d5oRlS+p8f
         tXvQFDvOzLg81PKRPPT8cDWSTRu1hZFnk5RuCv14k295uY63aEnrmY5mkO6BXO8PVYqR
         Ehaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o129si1009201ywo.228.2019.02.22.07.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 07:19:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxCbj-00015N-Vo
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 10:19:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxBoe-0002GE-QW
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 09:28:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxBoc-0001Q3-VR
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 09:28:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41258)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gxBoc-0001HI-Li; Fri, 22 Feb 2019 09:28:38 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76FCFAC2E3;
	Fri, 22 Feb 2019 14:28:29 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAE5601B7;
	Fri, 22 Feb 2019 14:28:22 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-4-eric.auger@redhat.com>
	<20190221171944.1cc65a33@redhat.com>
	<f0e9fb0e-6c76-9de7-2d0b-79f0c44d6398@redhat.com>
	<20190222111500.29e1d1b6@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <20119e8b-e094-d9f9-7e0c-17079329c2b1@redhat.com>
Date: Fri, 22 Feb 2019 15:28:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190222111500.29e1d1b6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 22 Feb 2019 14:28:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 03/17] hw/arm/virt: Split the
 memory map description
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
X-TUID: KshWsOpGD63M

Hi Igor,

On 2/22/19 11:15 AM, Igor Mammedov wrote:
> On Thu, 21 Feb 2019 18:21:11 +0100
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Igor,
>> On 2/21/19 5:19 PM, Igor Mammedov wrote:
>>> On Wed, 20 Feb 2019 23:39:49 +0100
>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>   
>>>> In the prospect to introduce an extended memory map supporting more
>>>> RAM, let's split the memory map array into two parts:
>>>>
>>>> - the former a15memmap contains regions below and including the RAM  
>>>   
>>>> - extended_memmap, only initialized with entries located after the RAM.
>>>>   Only the size of the region is initialized there since their base
>>>>   address will be dynamically computed, depending on the top of the
>>>>   RAM (initial RAM at the moment), with same alignment as their size.  
>>> can't parse this part and pinpoint what is 'their', care to rephrase?  
>> Only the size of the High IO region entries is initialized (there are
>> currently 3 entries:  VIRT_HIGH_GIC_REDIST2, VIRT_HIGH_PCIE_ECAM,
>> VIRT_HIGH_PCIE_MMIO). The base address is dynamically computed so it is
>> not initialized.
>>>
>>>   
>>>> This new split will allow to grow the RAM size without changing the
>>>> description of the high regions.
>>>>
>>>> The patch also moves the memory map setup  
>>> s/moves/makes/
>>> s/$/dynamic and moves it/
>>>   
>>>> into machvirt_init().  
>>>   
>>>> The rationale is the memory map will be soon affected by the  
>>>   
>>>> kvm_type() call that happens after virt_instance_init() and  
>>> is dependency on kvm_type() still valid,
>>> shouldn't split memmap work for TCG just fine as well?  
>> See in 08/17: in TCG mode the memory map  will be "frozen" (set_memmap)
>> in machvirt_init. Otherwise set_memmap is called from kvm_type().
>>
>> Split memmap works both in TCG and in accelerated mode.
>>
>> I will rephrase the commit message.
>>>   
>>>> before machvirt_init().
>>>>
>>>> The memory map is unchanged (the top of the initial RAM still is
>>>> 256GiB). Then come the high IO regions with same layout as before.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>
>>>> ---
>>>> v6 -> v7:
>>>> - s/a15memmap/base_memmap
>>>> - slight rewording of the commit message
>>>> - add "if there is less than 256GiB of RAM then the floating area
>>>>   starts at the 256GiB mark" in the comment associated to the floating
>>>>   memory map
>>>> - Added Peter's R-b
>>>>
>>>> v5 -> v6
>>>> - removal of many macros in units.h
>>>> - introduce the virt_set_memmap helper
>>>> - new computation for offsets of high IO regions
>>>> - add comments
>>>> ---
>>>>  hw/arm/virt.c         | 48 +++++++++++++++++++++++++++++++++++++------
>>>>  include/hw/arm/virt.h | 14 +++++++++----
>>>>  2 files changed, 52 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index a1955e7764..12039a0367 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -29,6 +29,7 @@
>>>>   */
>>>>  
>>>>  #include "qemu/osdep.h"
>>>> +#include "qemu/units.h"
>>>>  #include "qapi/error.h"
>>>>  #include "hw/sysbus.h"
>>>>  #include "hw/arm/arm.h"
>>>> @@ -121,7 +122,7 @@
>>>>   * Note that devices should generally be placed at multiples of 0x10000,
>>>>   * to accommodate guests using 64K pages.
>>>>   */
>>>> -static const MemMapEntry a15memmap[] = {
>>>> +static const MemMapEntry base_memmap[] = {
>>>>      /* Space up to 0x8000000 is reserved for a boot ROM */
>>>>      [VIRT_FLASH] =              {          0, 0x08000000 },
>>>>      [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
>>>> @@ -149,11 +150,21 @@ static const MemMapEntry a15memmap[] = {
>>>>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>>>>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>>>>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>>>> +};
>>>> +
>>>> +/*
>>>> + * Highmem IO Regions: This memory map is floating, located after the RAM.
>>>> + * Each IO region offset will be dynamically computed, depending on the  
>>> s/IO region offset/MemMapEntry base (GPA)/  
>>>> + * top of the RAM, so that its base get the same alignment as the size,  
>>>   
>>>> + * ie. a 512GiB region will be aligned on a 512GiB boundary. If there is  
>>> s/region/entry/
>>>   
>>>> + * less than 256GiB of RAM, the floating area starts at the 256GiB mark.
>>>> + */
>>>> +static MemMapEntry extended_memmap[] = {
>>>>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>>>> -    [VIRT_HIGH_GIC_REDIST2] =   { 0x4000000000ULL, 0x4000000 },
>>>> -    [VIRT_HIGH_PCIE_ECAM] =     { 0x4010000000ULL, 0x10000000 },
>>>> -    /* Second PCIe window, 512GB wide at the 512GB boundary */
>>>> -    [VIRT_HIGH_PCIE_MMIO] =     { 0x8000000000ULL, 0x8000000000ULL },
>>>> +    [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
>>>> +    [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>>>> +    /* Second PCIe window */
>>>> +    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
>>>>  };
>>>>  
>>>>  static const int a15irqmap[] = {
>>>> @@ -1354,6 +1365,30 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>>      return arm_cpu_mp_affinity(idx, clustersz);
>>>>  }
>>>>  
>>>> +static void virt_set_memmap(VirtMachineState *vms)
>>>> +{
>>>> +    hwaddr base;
>>>> +    int i;
>>>> +
>>>> +    vms->memmap = extended_memmap;  
>>> I probably don't see something but ...
>>>   
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(base_memmap); i++) {
>>>> +        vms->memmap[i] = base_memmap[i];  
>>>
>>> ARRAY_SIZE(base_memmap) > 3
>>> ARRAY_SIZE(extended_memmap) == 3
>>> as result shouldn't we observe OOB at vms->memmap[i] access
>>> starting from i==3 ?  
>> ARRAY_SIZE(extended_memmap) = ARRAY_SIZE(base_memmap) + 3
>> VIRT_HIGH_GIC_REDIST2 =  VIRT_LOWMEMMAP_LAST is what you miss.
> Yep, that's the trick.
> It is too much subtle for my taste,
> is it possible to make extended_memmap sizing more explicit/trivial,
> so one could see it right away without figuring out how indexes influence array size?
The issue is if we explicitly size the array is will need to change the
size whenever we add a new entry. I don't see any better solution to be
honest. I can definitively add comments in the code about this sizing
aspect. Another solution is to merge the 2 arrays as suggested by Heyi
but I dislike the fact one part is initialized in one way and the other
is initialized another way?

Thanks

Eric

> 
> 
>> /* indices of IO regions located after the RAM */
>> enum {
>>     VIRT_HIGH_GIC_REDIST2 =  VIRT_LOWMEMMAP_LAST,
>>     VIRT_HIGH_PCIE_ECAM,
>>     VIRT_HIGH_PCIE_MMIO,
>> };
>>
>>>   
>>>> +    }
>>>> +
>>>> +    vms->high_io_base = 256 * GiB; /* Top of the legacy initial RAM region */
>>>> +    base = vms->high_io_base;
>>>> +
>>>> +    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {  
>>> not sure why VIRT_LOWMEMMAP_LAST is needed at all, one could just continue
>>> with current 'i' value, provided extended_memmap wasn't corrupted by previous
>>> loop.  
>> Yep maybe. But I think it is less error prone like this if someone later
>> on adds some intermediate manipulation on i.
>>> And does this loop ever executes? VIRT_LOWMEMMAP_LAST > ARRAY_SIZE(extended_memmap)  
>> yes it does
>>
>> Thanks
>>
>> Eric
>>>   
>>>> +        hwaddr size = extended_memmap[i].size;
>>>> +
>>>> +        base = ROUND_UP(base, size);
>>>> +        vms->memmap[i].base = base;
>>>> +        vms->memmap[i].size = size;
>>>> +        base += size;
>>>> +    }
>>>> +}
>>>> +
>>>>  static void machvirt_init(MachineState *machine)
>>>>  {
>>>>      VirtMachineState *vms = VIRT_MACHINE(machine);
>>>> @@ -1368,6 +1403,8 @@ static void machvirt_init(MachineState *machine)
>>>>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>>>>      bool aarch64 = true;
>>>>  
>>>> +    virt_set_memmap(vms);
>>>> +
>>>>      /* We can probe only here because during property set
>>>>       * KVM is not available yet
>>>>       */
>>>> @@ -1843,7 +1880,6 @@ static void virt_instance_init(Object *obj)
>>>>                                      "Valid values are none and smmuv3",
>>>>                                      NULL);
>>>>  
>>>> -    vms->memmap = a15memmap;
>>>>      vms->irqmap = a15irqmap;
>>>>  }
>>>>  
>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>> index a27086d524..3dc7a6c5d5 100644
>>>> --- a/include/hw/arm/virt.h
>>>> +++ b/include/hw/arm/virt.h
>>>> @@ -64,7 +64,6 @@ enum {
>>>>      VIRT_GIC_VCPU,
>>>>      VIRT_GIC_ITS,
>>>>      VIRT_GIC_REDIST,
>>>> -    VIRT_HIGH_GIC_REDIST2,
>>>>      VIRT_SMMU,
>>>>      VIRT_UART,
>>>>      VIRT_MMIO,
>>>> @@ -74,12 +73,18 @@ enum {
>>>>      VIRT_PCIE_MMIO,
>>>>      VIRT_PCIE_PIO,
>>>>      VIRT_PCIE_ECAM,
>>>> -    VIRT_HIGH_PCIE_ECAM,
>>>>      VIRT_PLATFORM_BUS,
>>>> -    VIRT_HIGH_PCIE_MMIO,
>>>>      VIRT_GPIO,
>>>>      VIRT_SECURE_UART,
>>>>      VIRT_SECURE_MEM,
>>>> +    VIRT_LOWMEMMAP_LAST,
>>>> +};
>>>> +
>>>> +/* indices of IO regions located after the RAM */
>>>> +enum {
>>>> +    VIRT_HIGH_GIC_REDIST2 =  VIRT_LOWMEMMAP_LAST,
>>>> +    VIRT_HIGH_PCIE_ECAM,
>>>> +    VIRT_HIGH_PCIE_MMIO,
>>>>  };
>>>>  
>>>>  typedef enum VirtIOMMUType {
>>>> @@ -116,7 +121,7 @@ typedef struct {
>>>>      int32_t gic_version;
>>>>      VirtIOMMUType iommu;
>>>>      struct arm_boot_info bootinfo;
>>>> -    const MemMapEntry *memmap;
>>>> +    MemMapEntry *memmap;
>>>>      const int *irqmap;
>>>>      int smp_cpus;
>>>>      void *fdt;
>>>> @@ -126,6 +131,7 @@ typedef struct {
>>>>      uint32_t msi_phandle;
>>>>      uint32_t iommu_phandle;
>>>>      int psci_conduit;
>>>> +    hwaddr high_io_base;
>>>>  } VirtMachineState;
>>>>  
>>>>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)  
>>>
>>>   
> 
> 
