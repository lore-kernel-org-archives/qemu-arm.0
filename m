Received: by 10.223.153.116 with SMTP id x107csp398208wrb;
        Mon, 20 Nov 2017 01:55:38 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaNdNvfKWvu4l1DanHQv94dxKitz9qtJ2mkJ9PqboagS69UYswixel0zxjFFa07FfobJddC
X-Received: by 10.13.217.145 with SMTP id b139mr8400488ywe.310.1511171738635;
        Mon, 20 Nov 2017 01:55:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511171738; cv=none;
        d=google.com; s=arc-20160816;
        b=vHvmCIqAONQTcytszk2Z5JhTT3OgiRgvxFkiSA5+PC/4aVN98wIircHmPjBm9RLd65
         3Qaw84evM5LudE6qE/osldM6SRL4WGKb1FR01WS/zUvFaAWdpHAsg/DYlpLzNfsNxyCk
         vhdxG1thQtFewfy2dO4k7IzzAqbh500RitVcrBc9hiGsA06E1eoxihxRazU22LifBiUd
         E7oEVvNvZeqcaXsKkSc1pbiCFX9LbauSYSkA+HAgZ9GJKqwRsZLxX2FE9q7o7LI7yxSo
         GR2q4JwhkBte6suUY4JrKcDfLXVwA/T3o1I66k95tLFyDpi0o2oAxbaWZYb5OI2s/Cof
         slqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=9CDlK0sVATmK2Bo7InF9WK3I8UzIY9kYlBBz00xPfe4=;
        b=GHLBCfyyLdKdQjKZ6rEKc0Ts31Zkli+qrGyKB4sLqv6k1ZtS+kOFAMcegIpMjIeqgh
         YJBfMW2bGhPirO8IynL086wzXfG0+yotJyp4fUf8y6BLMDG1suldEsrEvGK1N4Iris02
         LhksmEGbj0nrOH/YEQwiKa+V7i4mEVUR8zcofH5EQmSUmzJksBqT32tupj/D8aMvy3O6
         tyOp6Gn+a4GTrEFLQDyhbVUhZaATVXnaMLBNzVame1TKtcL3ZdvcH0tRLboTPI77z7g0
         /QRoaSfTpPdAphU5zOSP5OFFVUlDgysfUvOwy+VfW/7xz5FGFb+CuHjwfYYmZyUixP35
         cg/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si2133380ybh.57.2017.11.20.01.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Nov 2017 01:55:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eGini-0003Em-3W
	for alex.bennee@linaro.org; Mon, 20 Nov 2017 04:55:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eGinW-0003Ca-0t
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 04:55:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eGinU-00059z-D3
	for qemu-arm@nongnu.org; Mon, 20 Nov 2017 04:55:26 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eGinN-00050S-7V; Mon, 20 Nov 2017 04:55:18 -0500
Received: from 172.30.72.60 (EHLO DGGEMS406-HUB.china.huawei.com)
	([172.30.72.60])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DLE74524; Mon, 20 Nov 2017 17:55:06 +0800 (CST)
Received: from [127.0.0.1] (10.177.27.25) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.361.1; Mon, 20 Nov 2017
	17:54:40 +0800
Message-ID: <5A12A65A.5060202@huawei.com>
Date: Mon, 20 Nov 2017 17:54:34 +0800
From: Zhu Yijun <zhuyijun@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-4-git-send-email-zhuyijun@huawei.com>
	<20171114145002.jbrw7k4n2m2rfwes@kamzik.brq.redhat.com>
In-Reply-To: <20171114145002.jbrw7k4n2m2rfwes@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.5A12A67B.005C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 12876f196ad0cbeb31153f37b084f5f4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 3/5] hw/arm: add scattered RAM
 memory region support
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QejFwHMWjG+5

On 2017/11/14 22:50, Andrew Jones wrote:
> On Tue, Nov 14, 2017 at 09:15:52AM +0800, zhuyijun@huawei.com wrote:
>> From: Zhu Yijun <zhuyijun@huawei.com>
>>
>> Dig out reserved memory holes and collect scattered RAM memory
>> regions by adding mem_list member in arm_boot_info struct.
>>
>> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
>> ---
>>  hw/arm/boot.c        |   8 ++++
>>  hw/arm/virt.c        | 101 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>>  include/hw/arm/arm.h |   1 +
>>  3 files changed, 108 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index c2720c8..30438f4 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -836,6 +836,14 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>>       */
>>      assert(!(info->secure_board_setup && kvm_enabled()));
>>  
>> +    /* If machine is not virt, the mem_list will empty. */
>> +    if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
>> +        RAMRegion *new = g_new(RAMRegion, 1);
>> +        new->base = info->loader_start;
>> +        new->size = info->ram_size;
>> +        QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
>> +    }
>> +
>>      info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
>>  
>>      /* Load the kernel.  */
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index ddde5e1..ff334c1 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -56,6 +56,7 @@
>>  #include "hw/smbios/smbios.h"
>>  #include "qapi/visitor.h"
>>  #include "standard-headers/linux/input.h"
>> +#include "hw/vfio/vfio-common.h"
>>  
>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -1225,6 +1226,98 @@ void virt_machine_done(Notifier *notifier, void *data)
>>      virt_build_smbios(vms);
>>  }
>>  
>> +static void handle_reserved_ram_region_overlap(void)
>> +{
>> +    hwaddr cur_end, next_end;
>> +    RAMRegion *reg, *next_reg, *tmp_reg;
>> +
>> +    QLIST_FOREACH(reg, &reserved_ram_regions, next) {
>> +        next_reg = QLIST_NEXT(reg, next);
>> +
>> +        while (next_reg && next_reg->base <= (reg->base + reg->size)) {
>> +            next_end = next_reg->base + next_reg->size;
>> +            cur_end = reg->base + reg->size;
>> +            if (next_end > cur_end) {
>> +                reg->size += (next_end - cur_end);
>> +            }
>> +
>> +            tmp_reg = QLIST_NEXT(next_reg, next);
>> +            QLIST_REMOVE(next_reg, next);
>> +            g_free(next_reg);
>> +            next_reg = tmp_reg;
>> +        }
>> +    }
>> +}
> Why isn't the above integrated into the reserved ram region insertion?

We can do it once all the reserved regions are captured and then update the list once for any overlaps.

>> +
>> +static void update_memory_regions(VirtMachineState *vms, hwaddr ram_size)
>> +{
>> +
>> +    RAMRegion *new, *reg, *last = NULL;
>> +    hwaddr virt_start, virt_end;
> Either need a blank line here, or to initialize virt_start/end on the
> declaration lines.

OK

>> +    virt_start = vms->memmap[VIRT_MEM].base;
>> +    virt_end = virt_start + ram_size - 1;
>> +
>> +    handle_reserved_ram_region_overlap();
>> +
>> +    QLIST_FOREACH(reg, &reserved_ram_regions, next) {
>> +        if (reg->base >= virt_start && reg->base < virt_end) {
> What about the case where reg->base + reg->size > virt_start?

I will add the case next version.

>> +            if (reg->base == virt_start) {
>> +                virt_start += reg->size;
> We can't move virt_start without breaking AAVMF.

But it may exist reserved memory region which begins at 0x40000000 in theory.
>
>> +                virt_end += reg->size;
> We can't increase virt_end without checking it against RAMLIMIT.
>
>> +                continue;
>> +            } else {
>> +                new = g_new(RAMRegion, 1);
>> +                new->base = virt_start;
>> +                new->size = reg->base - virt_start;
>> +                virt_start = reg->base + reg->size;
>> +            }
>> +
>> +            if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
>> +                QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
>> +            } else {
>> +                QLIST_INSERT_AFTER(last, new, next);
>> +            }
>> +
>> +            last = new;
>> +            ram_size -= new->size;
>> +            virt_end += reg->size;
>> +        }
>> +    }
>> +
>> +    if (ram_size > 0) {
>> +        new = g_new(RAMRegion, 1);
>> +        new->base = virt_start;
>> +        new->size = ram_size;
>> +
>> +        if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
>> +            QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
>> +        } else {
>> +            QLIST_INSERT_AFTER(last, new, next);
>> +        }
>> +    }
> Where's the else? ram_size <= 0 is not likely something we should ignore.

ok, will add it.

>> +}
>> +
>> +static void create_ram_alias(VirtMachineState *vms,
>> +                             MemoryRegion *sysmem,
>> +                             MemoryRegion *ram)
>> +{
>> +    RAMRegion *reg;
>> +    MemoryRegion *ram_memory;
>> +    char *nodename;
>> +    hwaddr sz = 0;
>> +
>> +    QLIST_FOREACH(reg, &vms->bootinfo.mem_list, next) {
>> +        nodename = g_strdup_printf("ram@%" PRIx64, reg->base);
>> +        ram_memory = g_new(MemoryRegion, 1);
>> +        memory_region_init_alias(ram_memory, NULL, nodename, ram, sz,
>> +                                 reg->size);
>> +        memory_region_add_subregion(sysmem, reg->base, ram_memory);
>> +        sz += reg->size;
>> +
>> +        g_free(nodename);
>> +    }
>> +}
> Instead of using memory region aliases, it would be best if each RAM
> region was modeled with pc-dimms, as that would move us towards supporting
> memory hotplug and allow the regions to be explicitly identified
> (start/size) on the command line - supporting migration. Actually, how
> does this series address migration? What if the host we migrate to doesn't
> have the same reserved regions in sysfs?

I  did not consider memory hotplug and migration before, thinks for pointing it out to me.

>> +
>>  static void virt_ram_memory_region_init(Notifier *notifier, void *data)
>>  {
>>      MachineState *machine = MACHINE(qdev_get_machine());
>> @@ -1232,10 +1325,15 @@ static void virt_ram_memory_region_init(Notifier *notifier, void *data)
>>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>>      VirtMachineState *vms = container_of(notifier, VirtMachineState,
>>                                           ram_memory_region_init);
>> +    RAMRegion *first_mem_reg;
>>  
>>      memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
>>                                           machine->ram_size);
>> -    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
>> +    update_memory_regions(vms, machine->ram_size);
>> +    create_ram_alias(vms, sysmem, ram);
>> +
>> +    first_mem_reg = QLIST_FIRST(&vms->bootinfo.mem_list);
>> +    vms->bootinfo.loader_start = first_mem_reg->base;
>>  }
>>  
>>  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>> @@ -1458,7 +1556,6 @@ static void machvirt_init(MachineState *machine)
>>      vms->bootinfo.initrd_filename = machine->initrd_filename;
>>      vms->bootinfo.nb_cpus = smp_cpus;
>>      vms->bootinfo.board_id = -1;
>> -    vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
>>      vms->bootinfo.get_dtb = machvirt_dtb;
>>      vms->bootinfo.firmware_loaded = firmware_loaded;
>>      arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
>> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
>> index ce769bd..d953026 100644
>> --- a/include/hw/arm/arm.h
>> +++ b/include/hw/arm/arm.h
>> @@ -124,6 +124,7 @@ struct arm_boot_info {
>>      bool secure_board_setup;
>>  
>>      arm_endianness endianness;
>> +    QLIST_HEAD(, RAMRegion) mem_list;
>>  };
>>  
>>  /**
>> -- 
>> 1.8.3.1
>>
>>
>>
> Thanks,
> drew
>
> .
>


