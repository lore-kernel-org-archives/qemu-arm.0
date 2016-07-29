Received: by 10.25.21.156 with SMTP id 28csp1470517lfv;
        Fri, 29 Jul 2016 11:10:42 -0700 (PDT)
X-Received: by 10.37.65.204 with SMTP id o195mr33916186yba.87.1469815842219;
        Fri, 29 Jul 2016 11:10:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s1si12973240qkd.6.2016.07.29.11.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 11:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bTCF7-0004My-HY
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 14:10:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bTCF1-0004MN-6f
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 14:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bTCEy-0008MW-LW
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 14:10:34 -0400
Received: from mail-ua0-x22a.google.com ([2607:f8b0:400c:c08::22a]:36023)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bTCEy-0008Lv-GS
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 14:10:32 -0400
Received: by mail-ua0-x22a.google.com with SMTP id j59so67255953uaj.3
	for <qemu-arm@nongnu.org>; Fri, 29 Jul 2016 11:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CC+x3G2CxpSfYX974brS7AavEmvUBs+xph2K9BFgsUo=;
	b=CP99U0KcGaRcMqbuXM747umIPfgAXFVBRI+Uf1Y0mJ2T+UhU9Gq/TeS118CucXUg7d
	ayAp2S4sZmA5XHppmKQdQTbGTIV8q86UjkWFzzBlFfbbmgfxVGkHrf4SFhxutR779GOB
	v41p5W2+XnivEUvf7URIJS6/RROwrJDloPcQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CC+x3G2CxpSfYX974brS7AavEmvUBs+xph2K9BFgsUo=;
	b=LK2NcyDMrUL1ZcYOTrrVEgCxJogHdP3NtY705XUqzYs2QSv/75y0XIryTsTkLk21bR
	rv+MSILbEpyS71y8o7Yd9Vt9M3wIPMIOY4Rzr88GlEKP2dEhCHF03JbnyFjx15yTvKg5
	TRZ1EF7a4uLdpKvf6VwKHDdKJzEtCISJlDD0BmT+pkKWUvs/84jr3acA/aWpzRGo8cy7
	S+xXsIywAXDu2H+hCaSjR6gxPa9YeRUnLhxI9EsHHn82QSzykB6yWjOpbcaJh+4WKB6a
	GZN+9z2/yD1WYIFYiWi6dpAhf90/VOm7+aLIHDuZ0eELC8XmbS9FF19ULByt848Ang19
	nMFw==
X-Gm-Message-State: AEkooutkCQ2LGEdHWy7BqaoEq8cVXNRvN/zsvUBSn86TnU0odtG6aqxRFxCA02Ndhf2KmpFuFHQNKhHsPJzjK0rW
X-Received: by 10.176.0.208 with SMTP id 74mr19971008uaj.64.1469815830800;
	Fri, 29 Jul 2016 11:10:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Fri, 29 Jul 2016 11:10:11 -0700 (PDT)
In-Reply-To: <1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2016 19:10:11 +0100
Message-ID: <CAFEAcA_5jngVxajJxdJ0krz0inrkdjTNYYZ+5SNGOipoQo35ZA@mail.gmail.com>
To: Kwangwoo Lee <kwangwoo.lee@sk.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22a
Subject: Re: [Qemu-arm] [RFC PATCH 1/3] hw/arm/virt: add hotplug memory
 support
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Woosuk Chung <woosuk.chung@sk.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Hyunchul Kim <hyunchul3.kim@sk.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o3hRS2PjRu+f

On 20 July 2016 at 01:49, Kwangwoo Lee <kwangwoo.lee@sk.com> wrote:
> Add hotplug memory feature on aarch64 virt platfom. This patch is
> required to emulate a DIMM type memory like NVDIMM.
>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> ---
>  default-configs/aarch64-softmmu.mak |   1 +
>  hw/arm/virt.c                       | 110 ++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h               |   3 +
>  3 files changed, 114 insertions(+)
>
> diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
> index 2449483..5790cd2 100644
> --- a/default-configs/aarch64-softmmu.mak
> +++ b/default-configs/aarch64-softmmu.mak
> @@ -7,3 +7,4 @@ CONFIG_AUX=y
>  CONFIG_DDC=y
>  CONFIG_DPCD=y
>  CONFIG_XLNX_ZYNQMP=y
> +CONFIG_MEM_HOTPLUG=y
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a193b5a..f7ff411 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -58,6 +58,8 @@
>  #include "hw/smbios/smbios.h"
>  #include "qapi/visitor.h"
>  #include "standard-headers/linux/input.h"
> +#include "hw/mem/pc-dimm.h"
> +#include "hw/acpi/acpi.h"
>
>  /* Number of external interrupt lines to configure the GIC with */
>  #define NUM_IRQS 256
> @@ -91,6 +93,7 @@ typedef struct {
>      bool secure;
>      bool highmem;
>      int32_t gic_version;
> +    MemoryHotplugState hotplug_memory;
>  } VirtMachineState;
>
>  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> @@ -1376,6 +1379,40 @@ static void machvirt_init(MachineState *machine)
>      guest_info_state->machine_done.notify = virt_guest_info_machine_done;
>      qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);
>
> +    /* initialize hotplug memory address space */
> +    if (machine->ram_size < machine->maxram_size) {
> +        ram_addr_t hotplug_mem_size = machine->maxram_size - machine->ram_size;
> +
> +        if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
> +            error_report("unsupported amount of memory slots: %"PRIu64,

"number of"

> +                     machine->ram_slots);
> +            exit(EXIT_FAILURE);
> +        }
> +
> +        if (QEMU_ALIGN_UP(machine->maxram_size,
> +                     TARGET_PAGE_SIZE) != machine->maxram_size) {
> +            error_report("maximum memory size must by aligned to multiple of "

"must be"

> +                     "%d bytes", TARGET_PAGE_SIZE);
> +            exit(EXIT_FAILURE);
> +        }
> +
> +        vms->hotplug_memory.base =
> +                     ROUND_UP(vbi->memmap[VIRT_MEM].base + machine->ram_size,
> +                                              ARCH_VIRT_HOTPLUG_MEM_ALIGN);
> +
> +        if ((vms->hotplug_memory.base + hotplug_mem_size) <
> +            hotplug_mem_size) {

This expression is confusing. Is it trying to test for overflow?
When can that happen?

> +            error_report("unsupported amount of maximum memory: " RAM_ADDR_FMT,
> +                     machine->maxram_size);
> +            exit(EXIT_FAILURE);
> +        }
> +
> +        memory_region_init(&vms->hotplug_memory.mr, OBJECT(vms),
> +                           "hotplug-memory", hotplug_mem_size);
> +        memory_region_add_subregion(sysmem, vms->hotplug_memory.base,
> +                                    &vms->hotplug_memory.mr);
> +    }
> +
>      vbi->bootinfo.ram_size = machine->ram_size;
>      vbi->bootinfo.kernel_filename = machine->kernel_filename;
>      vbi->bootinfo.kernel_cmdline = machine->kernel_cmdline;
> @@ -1448,9 +1485,75 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>      }
>  }
>
> +static void virt_dimm_plug(HotplugHandler *hotplug_dev,
> +                         DeviceState *dev, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    PCDIMMDevice *dimm = PC_DIMM(dev);
> +    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
> +    MemoryRegion *mr = ddc->get_memory_region(dimm);
> +    Error *local_err = NULL;
> +    uint64_t align = memory_region_get_alignment(mr);
> +
> +    pc_dimm_memory_plug(dev, &vms->hotplug_memory, mr, align, &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
> +
> +out:
> +    error_propagate(errp, local_err);
> +}
> +
> +static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
> +                           DeviceState *dev, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    PCDIMMDevice *dimm = PC_DIMM(dev);
> +    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
> +    MemoryRegion *mr = ddc->get_memory_region(dimm);
> +    Error *local_err = NULL;
> +
> +    pc_dimm_memory_unplug(dev, &vms->hotplug_memory, mr);
> +    object_unparent(OBJECT(dev));
> +
> +    error_propagate(errp, local_err);
> +}
> +
> +static void virt_machinedevice_plug_cb(HotplugHandler *hotplug_dev,
> +                                      DeviceState *dev, Error **errp)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_dimm_plug(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "acpi: device plug request for not supported device"

"unsupported"

> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
> +static void virt_machinedevice_unplug_cb(HotplugHandler *hotplug_dev,
> +                                        DeviceState *dev, Error **errp)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_dimm_unplug(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "acpi: device unplug for not supported device"

"unsupported"

> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
> +static HotplugHandler *virt_get_hotplug_handler(MachineState *machine,
> +                                             DeviceState *dev)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        return HOTPLUG_HANDLER(machine);
> +    }
> +    return NULL;
> +}
> +
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
>
>      mc->init = machvirt_init;
>      /* Start max_cpus at the maximum QEMU supports. We'll further restrict
> @@ -1462,6 +1565,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
>      mc->pci_allow_0_address = true;
> +    mc->get_hotplug_handler = virt_get_hotplug_handler;
> +    hc->plug = virt_machinedevice_plug_cb;
> +    hc->unplug = virt_machinedevice_unplug_cb;
>  }
>
>  static const TypeInfo virt_machine_info = {
> @@ -1471,6 +1577,10 @@ static const TypeInfo virt_machine_info = {
>      .instance_size = sizeof(VirtMachineState),
>      .class_size    = sizeof(VirtMachineClass),
>      .class_init    = virt_machine_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +         { TYPE_HOTPLUG_HANDLER },
> +         { }
> +    },
>  };
>
>  static void machvirt_machine_init(void)
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9650193..35aa3cc 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -45,6 +45,9 @@
>
>  #define PPI(irq) ((irq) + 16)
>
> +/* 1GB alignment for hotplug memory region */
> +#define ARCH_VIRT_HOTPLUG_MEM_ALIGN (1ULL << 30)

Where does the 1GB alignment come from? Why do we need 1GB
alignment for the base but only 1KB alignment for the size?

> +
>  enum {
>      VIRT_FLASH,
>      VIRT_MEM,
> --
> 2.5.0

thanks
-- PMM
