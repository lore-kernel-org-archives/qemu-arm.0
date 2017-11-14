Received: by 10.223.150.237 with SMTP id u100csp3686667wrb;
        Tue, 14 Nov 2017 06:50:39 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaP3O4vsjLmZWl6DnbjAdaxJYMsMMujijfwGkkhJ02IGCwRiw+JneZ3hdqk4uaaRLj5a0ts
X-Received: by 10.37.38.148 with SMTP id m142mr7768505ybm.87.1510671039796;
        Tue, 14 Nov 2017 06:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510671039; cv=none;
        d=google.com; s=arc-20160816;
        b=J5m2RYKTAupiA/3AhrxYew1DjJopXKuXeaIzr0pp0aMHhG/ke9TGPMo5oGikwSaX2I
         edHfCyCUJjcyrhK2vLR61IgzrecqnQC2LRaXbR/rrtT6kiY2IgOIc9urwBTWclJk4t2t
         JK9duHOUd/jIm78CrUe1E5qyhywGFR0AcS2vjgWpQ0rWB0uht8VxqR4yRkpPj/JSX8J+
         gFA7BlGzeDa6HU6XM3cZgJ1aUnS1yCa+Ha6x9fV5AQX0clSsx1QYe8Lm5Jt9zHxLhGHD
         V6W5a4fSTdKesLWDgAJzXSW7w0w6Xm1GwZlg4eBlz2wQWcfKID6FjlKgtUafuz66rpbH
         n3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=aM245d2qofoRRW3GEj+/H0DPvFyO5y6+vuP2trJvDt8=;
        b=gMrmPuAyw2V7QdAUu5xCyXkBPsPVKBx7+3Zi1p427RR6cqK6lz+W3wUamY1S2frsme
         nhBM9ZNy/FUJ7aM3nmWFnyiSC44LOmFU0C0FtB+yum8OV147A9c5jDfkpE9/U3/y6MHk
         MPGBe/dz3+nCg3ud9apQzlP5rMpd4F5ufHVOSuQ1pTtKkT5GsPghN/fQIDlnbaGZJlt0
         yXSjglkR/nskcgn5BxdrBmqOiNybmNse9XknNOXH9MOXAzF9RvlrAFUV9BVKndq59WqV
         ax/Za/2bcRZ59ITuGKpV9W0wsINyYVQt54OH4ThoyK2v6uAh3kvF4xTSEmCpZkNN9sG7
         dkQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b19si1242131ybg.86.2017.11.14.06.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Nov 2017 06:50:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEcXv-0003rx-9G
	for alex.bennee@linaro.org; Tue, 14 Nov 2017 09:50:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eEcXk-0003qM-NW
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 09:50:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eEcXg-0007Xb-0f
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 09:50:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:2950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eEcXf-0007Wr-GP; Tue, 14 Nov 2017 09:50:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4194F81DEC;
	Tue, 14 Nov 2017 14:50:22 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F4D3D7695;
	Tue, 14 Nov 2017 14:50:05 +0000 (UTC)
Date: Tue, 14 Nov 2017 15:50:02 +0100
From: Andrew Jones <drjones@redhat.com>
To: zhuyijun@huawei.com
Message-ID: <20171114145002.jbrw7k4n2m2rfwes@kamzik.brq.redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-4-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510622154-17224-4-git-send-email-zhuyijun@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 14 Nov 2017 14:50:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: Ipru6Ph06osh

On Tue, Nov 14, 2017 at 09:15:52AM +0800, zhuyijun@huawei.com wrote:
> From: Zhu Yijun <zhuyijun@huawei.com>
> 
> Dig out reserved memory holes and collect scattered RAM memory
> regions by adding mem_list member in arm_boot_info struct.
> 
> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> ---
>  hw/arm/boot.c        |   8 ++++
>  hw/arm/virt.c        | 101 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/arm.h |   1 +
>  3 files changed, 108 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index c2720c8..30438f4 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -836,6 +836,14 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>       */
>      assert(!(info->secure_board_setup && kvm_enabled()));
>  
> +    /* If machine is not virt, the mem_list will empty. */
> +    if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
> +        RAMRegion *new = g_new(RAMRegion, 1);
> +        new->base = info->loader_start;
> +        new->size = info->ram_size;
> +        QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
> +    }
> +
>      info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
>  
>      /* Load the kernel.  */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ddde5e1..ff334c1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -56,6 +56,7 @@
>  #include "hw/smbios/smbios.h"
>  #include "qapi/visitor.h"
>  #include "standard-headers/linux/input.h"
> +#include "hw/vfio/vfio-common.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -1225,6 +1226,98 @@ void virt_machine_done(Notifier *notifier, void *data)
>      virt_build_smbios(vms);
>  }
>  
> +static void handle_reserved_ram_region_overlap(void)
> +{
> +    hwaddr cur_end, next_end;
> +    RAMRegion *reg, *next_reg, *tmp_reg;
> +
> +    QLIST_FOREACH(reg, &reserved_ram_regions, next) {
> +        next_reg = QLIST_NEXT(reg, next);
> +
> +        while (next_reg && next_reg->base <= (reg->base + reg->size)) {
> +            next_end = next_reg->base + next_reg->size;
> +            cur_end = reg->base + reg->size;
> +            if (next_end > cur_end) {
> +                reg->size += (next_end - cur_end);
> +            }
> +
> +            tmp_reg = QLIST_NEXT(next_reg, next);
> +            QLIST_REMOVE(next_reg, next);
> +            g_free(next_reg);
> +            next_reg = tmp_reg;
> +        }
> +    }
> +}

Why isn't the above integrated into the reserved ram region insertion?

> +
> +static void update_memory_regions(VirtMachineState *vms, hwaddr ram_size)
> +{
> +
> +    RAMRegion *new, *reg, *last = NULL;
> +    hwaddr virt_start, virt_end;

Either need a blank line here, or to initialize virt_start/end on the
declaration lines.

> +    virt_start = vms->memmap[VIRT_MEM].base;
> +    virt_end = virt_start + ram_size - 1;
> +
> +    handle_reserved_ram_region_overlap();
> +
> +    QLIST_FOREACH(reg, &reserved_ram_regions, next) {
> +        if (reg->base >= virt_start && reg->base < virt_end) {

What about the case where reg->base + reg->size > virt_start?

> +            if (reg->base == virt_start) {
> +                virt_start += reg->size;

We can't move virt_start without breaking AAVMF.

> +                virt_end += reg->size;

We can't increase virt_end without checking it against RAMLIMIT.

> +                continue;
> +            } else {
> +                new = g_new(RAMRegion, 1);
> +                new->base = virt_start;
> +                new->size = reg->base - virt_start;
> +                virt_start = reg->base + reg->size;
> +            }
> +
> +            if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
> +                QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
> +            } else {
> +                QLIST_INSERT_AFTER(last, new, next);
> +            }
> +
> +            last = new;
> +            ram_size -= new->size;
> +            virt_end += reg->size;
> +        }
> +    }
> +
> +    if (ram_size > 0) {
> +        new = g_new(RAMRegion, 1);
> +        new->base = virt_start;
> +        new->size = ram_size;
> +
> +        if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
> +            QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
> +        } else {
> +            QLIST_INSERT_AFTER(last, new, next);
> +        }
> +    }

Where's the else? ram_size <= 0 is not likely something we should ignore.

> +}
> +
> +static void create_ram_alias(VirtMachineState *vms,
> +                             MemoryRegion *sysmem,
> +                             MemoryRegion *ram)
> +{
> +    RAMRegion *reg;
> +    MemoryRegion *ram_memory;
> +    char *nodename;
> +    hwaddr sz = 0;
> +
> +    QLIST_FOREACH(reg, &vms->bootinfo.mem_list, next) {
> +        nodename = g_strdup_printf("ram@%" PRIx64, reg->base);
> +        ram_memory = g_new(MemoryRegion, 1);
> +        memory_region_init_alias(ram_memory, NULL, nodename, ram, sz,
> +                                 reg->size);
> +        memory_region_add_subregion(sysmem, reg->base, ram_memory);
> +        sz += reg->size;
> +
> +        g_free(nodename);
> +    }
> +}

Instead of using memory region aliases, it would be best if each RAM
region was modeled with pc-dimms, as that would move us towards supporting
memory hotplug and allow the regions to be explicitly identified
(start/size) on the command line - supporting migration. Actually, how
does this series address migration? What if the host we migrate to doesn't
have the same reserved regions in sysfs?

> +
>  static void virt_ram_memory_region_init(Notifier *notifier, void *data)
>  {
>      MachineState *machine = MACHINE(qdev_get_machine());
> @@ -1232,10 +1325,15 @@ static void virt_ram_memory_region_init(Notifier *notifier, void *data)
>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>      VirtMachineState *vms = container_of(notifier, VirtMachineState,
>                                           ram_memory_region_init);
> +    RAMRegion *first_mem_reg;
>  
>      memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
>                                           machine->ram_size);
> -    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
> +    update_memory_regions(vms, machine->ram_size);
> +    create_ram_alias(vms, sysmem, ram);
> +
> +    first_mem_reg = QLIST_FIRST(&vms->bootinfo.mem_list);
> +    vms->bootinfo.loader_start = first_mem_reg->base;
>  }
>  
>  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
> @@ -1458,7 +1556,6 @@ static void machvirt_init(MachineState *machine)
>      vms->bootinfo.initrd_filename = machine->initrd_filename;
>      vms->bootinfo.nb_cpus = smp_cpus;
>      vms->bootinfo.board_id = -1;
> -    vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
>      vms->bootinfo.get_dtb = machvirt_dtb;
>      vms->bootinfo.firmware_loaded = firmware_loaded;
>      arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index ce769bd..d953026 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -124,6 +124,7 @@ struct arm_boot_info {
>      bool secure_board_setup;
>  
>      arm_endianness endianness;
> +    QLIST_HEAD(, RAMRegion) mem_list;
>  };
>  
>  /**
> -- 
> 1.8.3.1
> 
> 
>

Thanks,
drew
