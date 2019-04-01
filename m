Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp405295wrx;
        Mon, 1 Apr 2019 06:34:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmrLLgL2TYVje4UGPlUmODhzlvw50tnmXQ8U8OGL9zAgkGlETRb9mRA4ka602OnN+ehTnC
X-Received: by 2002:a0d:dd4c:: with SMTP id g73mr54517562ywe.145.1554125695201;
        Mon, 01 Apr 2019 06:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554125695; cv=none;
        d=google.com; s=arc-20160816;
        b=O4hsceWFMB1dJXkOcx4kEoGO8z7fQo/QRDFXcrIEG5IQ7Zy/JE4pgp2Rv5LUF2+eM+
         FYnVkXqKjB3idRyMbIyt+X2rhlApUkKGEKrTGgUz3cGN+0TQZIwFYk5584o1ggMvOLRZ
         JmdQCnSWU/T11hVofgcCtirIdOuCIh2ED1MtbroshlpoC53rZHfTLtErtSwBzvZlNAux
         wLRoaAJ/cDWbjpv9vxy64Xy+PH4MVdVYx2oBKvtIS6eOsu88uvgbcVoVjRb0obW99hwP
         zRUJg8T7pmq5ydKLsjn4bxiZJaW0btFjodIcZMYq+oAVkbiYtNFNCQ4H1RrSaXsPZMsO
         CNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=b/poZPZB5DJ1iHo58dTAlHxsVVlovmmVj1Ij4o/l2MQ=;
        b=Uqa1Yq3hkYn4B18Fx3yi09+rgcXqNl1zNwleDv/p7ooPHW6FKbZk6yokqB9I5MAHs+
         QY464hiwzUnAxFDSZ7P971SRy/F4wKSCan7x7EZshgt97Kb9a3Oct/6OeuNYS5AzfpQb
         0RPFsoFcd3A7V/RN0gs5Ks34gbA58TKqAPy8KGg6QlOqayC8mK4iyy9hW43Tb4ZPQ2Ph
         Kz+z8BhISI5fAD4HRNGkBKwoKxq+S5hlmmDzGW3Z939AQLOYQ7n+1pJxHSB1LDVFHUT8
         2xKM1pngSNs/psU2ehgzjVKUz2riPAJ8Y1fP5bUAbYthQsVHMFoWN3lkmjYDnrerr9nr
         Prpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si5861982ywm.58.2019.04.01.06.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Apr 2019 06:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAx5S-0006kk-Js
	for alex.bennee@linaro.org; Mon, 01 Apr 2019 09:34:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hAx5F-0006jY-QZ
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 09:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hAx5E-0003sY-Dv
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 09:34:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50274)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hAx5E-0003sI-1O; Mon, 01 Apr 2019 09:34:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33428308402A;
	Mon,  1 Apr 2019 13:34:38 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3665608E1;
	Mon,  1 Apr 2019 13:34:29 +0000 (UTC)
Date: Mon, 1 Apr 2019 15:34:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190401153425.5d9bd5da@redhat.com>
In-Reply-To: <20190321104745.28068-6-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-6-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 01 Apr 2019 13:34:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 05/10] hw/arm/virt: Add ACPI support for
 device memory cold-plug
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
	qemu-devel@nongnu.org, xuwei5@hisilicon.com, linuxarm@huawei.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, sebastien.boeuf@intel.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G90onuiWKlMp

On Thu, 21 Mar 2019 10:47:40 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This adds support to build the aml code so that Guest(ACPI boot)
> can see the cold-plugged device memory. Memory cold plug support
> with DT boot is not yet enabled.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  default-configs/arm-softmmu.mak        |  2 ++
>  hw/acpi/generic_event_device.c         | 23 +++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c               |  9 +++++++++
>  hw/arm/virt.c                          | 23 +++++++++++++++++++++++
>  include/hw/acpi/generic_event_device.h |  5 +++++
>  include/hw/arm/virt.h                  |  2 ++
>  6 files changed, 64 insertions(+)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 795cb89..6db444e 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -162,3 +162,5 @@ CONFIG_LSI_SCSI_PCI=y
>  
>  CONFIG_MEM_DEVICE=y
>  CONFIG_DIMM=y
> +CONFIG_ACPI_MEMORY_HOTPLUG=y
> +CONFIG_ACPI_HW_REDUCED=y
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index b21a551..0b32fc9 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -16,13 +16,26 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "exec/address-spaces.h"
>  #include "hw/sysbus.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/generic_event_device.h"
> +#include "hw/mem/pc-dimm.h"
>  
>  static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
>                                  DeviceState *dev, Error **errp)
>  {
> +    VirtAcpiState *s = VIRT_ACPI(hotplug_dev);
> +
> +    if (s->memhp_state.is_enabled &&
> +        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state,
> +                                dev, errp);
> +    } else {
> +        error_setg(errp, "virt: device plug request for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
>  }
>  
>  static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> @@ -31,9 +44,19 @@ static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>  static void virt_device_realize(DeviceState *dev, Error **errp)
>  {
> +    VirtAcpiState *s = VIRT_ACPI(dev);
> +
> +    if (s->memhp_state.is_enabled) {
> +        acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
> +                                 &s->memhp_state,
> +                                 s->memhp_base);
> +    }
>  }
>  
>  static Property virt_acpi_properties[] = {
> +    DEFINE_PROP_UINT64("memhp_base", VirtAcpiState, memhp_base, 0),

it's preferred to use '-' in property names

> +    DEFINE_PROP_BOOL("memory-hotplug-support", VirtAcpiState,
> +                     memhp_state.is_enabled, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bf9c0bc..20d3c83 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -40,6 +40,7 @@
>  #include "hw/loader.h"
>  #include "hw/hw.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/memory_hotplug.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
> @@ -49,6 +50,13 @@
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  
> +static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState *ms)
> +{
it's dummy wrapper that never will be reused,
I suggest to just inline contents at call site and drop wrapper.

> +    uint32_t nr_mem = ms->ram_slots;
> +
> +    build_memory_hotplug_aml(scope, nr_mem, "\\_SB", NULL, AML_SYSTEM_MEMORY);
> +}
> +
>  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>  {
>      uint16_t i;
> @@ -740,6 +748,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       * the RTC ACPI device at all when using UEFI.
>       */
>      scope = aml_scope("\\_SB");
> +    acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d0ff20d..13db0e9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -133,6 +133,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> +    [VIRT_PCDIMM_ACPI] =        { 0x09070000, 0x00010000 },
                                                 ^^^^^^^^^^^
where from this magic number comes?

>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -516,6 +517,18 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>      }
>  }
>  
> +static DeviceState *create_virt_acpi(VirtMachineState *vms)
> +{
> +    DeviceState *dev;
> +
> +    dev = qdev_create(NULL, "virt-acpi");
> +    qdev_prop_set_uint64(dev, "memhp_base",
> +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
> +    qdev_init_nofail(dev);
> +
> +    return dev;

Probably no worth a wrapper either, since code is trivial and isn't reused elsewhere.

> +}
> +
>  static void create_its(VirtMachineState *vms, DeviceState *gicdev)
>  {
>      const char *itsclass = its_class_name();
> @@ -1644,6 +1657,8 @@ static void machvirt_init(MachineState *machine)
>  
>      create_platform_bus(vms, pic);
>  
> +    vms->acpi = create_virt_acpi(vms);
> +
>      vms->bootinfo.ram_size = machine->ram_size;
>      vms->bootinfo.kernel_filename = machine->kernel_filename;
>      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
> @@ -1828,11 +1843,19 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>  static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                               DeviceState *dev, Error **errp)
>  {
> +    HotplugHandlerClass *hhc;
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>      Error *local_err = NULL;
>  
>      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
> +
> +    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi);
> +    hhc->plug(HOTPLUG_HANDLER(vms->acpi), dev, &error_abort);
>  
> +out:
>      error_propagate(errp, local_err);
>  }
>  
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index f314515..262ca7d 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -18,12 +18,17 @@
>  #ifndef HW_ACPI_GED_H
>  #define HW_ACPI_GED_H
>  
> +#include "hw/acpi/memory_hotplug.h"
> +
>  #define TYPE_VIRT_ACPI "virt-acpi"
>  #define VIRT_ACPI(obj) \
>      OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
>  
>  typedef struct VirtAcpiState {
>      SysBusDevice parent_obj;
> +    MemHotplugState memhp_state;
> +    hwaddr memhp_base;
>  } VirtAcpiState;
>  
> +
>  #endif
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 507517c..c5e4c96 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -77,6 +77,7 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_PCDIMM_ACPI,
>      VIRT_LOWMEMMAP_LAST,
>  };
>  
> @@ -132,6 +133,7 @@ typedef struct {
>      uint32_t iommu_phandle;
>      int psci_conduit;
>      hwaddr highest_gpa;
> +    DeviceState *acpi;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

