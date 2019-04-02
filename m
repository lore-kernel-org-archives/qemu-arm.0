Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1292467wrx;
        Tue, 2 Apr 2019 00:35:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+dRLZCfy4Z5mvg2ESrLVMZBbwCIcTSGrHVDYuHkLw7kXv/+xkNZQdzxUZHugxzfeUHEKW
X-Received: by 2002:a81:5510:: with SMTP id j16mr54309271ywb.321.1554190515130;
        Tue, 02 Apr 2019 00:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554190515; cv=none;
        d=google.com; s=arc-20160816;
        b=JDEd3aksF/4BBy5PkLjXyoAvxqQG5i6vt81TJRZ/ZdjNlWq4Vvv9HVv3AF8WAyag8Z
         rKkTxZwP1AALsyor0CU0oJqRo5A4PVtKYK3RfwD4xjnUM7t/aBDOxswOcp7sFsDq4clh
         Rbv5eGtQ0yL/qzM3Edf1sedHBgOSo4NYMJNbYJJYTgrrrZGnaVjD1F5YrLXwnbvl0GAd
         6ukpmTUOkNtUWvfrfJSLMYPZPlFBbby1uj3qV8RBULkQDIGYbNqy7XhuUmidO0BF6kmn
         TzQl0hNk7FNQiFx5sYtMaAR0Mv96ha56m5SMJsQNlYgrRfviHZWwlJjheCw7H54T8+EF
         +9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=PqXYnqMCUQHpyf79KE0D6dxVeGgE35xOJLppRQukMDg=;
        b=mfvCnB93oA8UC/W9edUdY5pjof9P2w3N07Un6a6c+4XR0LB3xEqxhHsgAuOKId0HlH
         9PCr/GUN4FO6y1cwCbTsGV7Jo0UNrHL0yW845pjhisgQKErI6vlRbjZhe0zFYNL+BU/D
         BcMTcnMx0E00ULpvlR7mqDJTmBDnWaUqJowDYm5xG5mW//gbHl0V3LcnvJTdzH8CA9L7
         yCp3T5a3Aiz2OvTGbx9a/dus914gK38tU2BDSWt1qRiq+mfsa3tzI77naklQ+iZF4Vum
         rTbIUzSDOlSeRVU7bBNnXAGJGyZJvk4o6nTbitjcfCVMqxGBLZ+omaGnn7lzqEm6ssCE
         P0dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d63si7047162ybf.382.2019.04.02.00.35.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Apr 2019 00:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBDww-0006ky-Dq
	for alex.bennee@linaro.org; Tue, 02 Apr 2019 03:35:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hBDu2-0004py-Br
	for qemu-devel@nongnu.org; Tue, 02 Apr 2019 03:32:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hBDkY-0007en-HI
	for qemu-devel@nongnu.org; Tue, 02 Apr 2019 03:22:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34436)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hBDkR-0007QA-7s; Tue, 02 Apr 2019 03:22:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63FD53081252;
	Tue,  2 Apr 2019 07:22:15 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09D0D61B9B;
	Tue,  2 Apr 2019 07:22:10 +0000 (UTC)
Date: Tue, 2 Apr 2019 09:22:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190402092206.2c3188a6@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8393477CA@lhreml524-mbb.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-6-shameerali.kolothum.thodi@huawei.com>
	<20190401153425.5d9bd5da@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8393477CA@lhreml524-mbb.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 02 Apr 2019 07:22:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 05/10] hw/arm/virt: Add ACPI support for
 device memory cold-plug
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d7Tf3+K7SQy7

On Mon, 1 Apr 2019 16:24:40 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: 01 April 2019 14:34
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org;
> > shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> > sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> > <xuwei5@huawei.com>
> > Subject: Re: [PATCH v3 05/10] hw/arm/virt: Add ACPI support for device
> > memory cold-plug
> > 
> > On Thu, 21 Mar 2019 10:47:40 +0000
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >   
> > > This adds support to build the aml code so that Guest(ACPI boot)
> > > can see the cold-plugged device memory. Memory cold plug support
> > > with DT boot is not yet enabled.
> > >
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > >  default-configs/arm-softmmu.mak        |  2 ++
> > >  hw/acpi/generic_event_device.c         | 23  
> > +++++++++++++++++++++++  
> > >  hw/arm/virt-acpi-build.c               |  9 +++++++++
> > >  hw/arm/virt.c                          | 23  
> > +++++++++++++++++++++++  
> > >  include/hw/acpi/generic_event_device.h |  5 +++++
> > >  include/hw/arm/virt.h                  |  2 ++
> > >  6 files changed, 64 insertions(+)
> > >
> > > diff --git a/default-configs/arm-softmmu.mak  
> > b/default-configs/arm-softmmu.mak  
> > > index 795cb89..6db444e 100644
> > > --- a/default-configs/arm-softmmu.mak
> > > +++ b/default-configs/arm-softmmu.mak
> > > @@ -162,3 +162,5 @@ CONFIG_LSI_SCSI_PCI=y
> > >
> > >  CONFIG_MEM_DEVICE=y
> > >  CONFIG_DIMM=y
> > > +CONFIG_ACPI_MEMORY_HOTPLUG=y
> > > +CONFIG_ACPI_HW_REDUCED=y
> > > diff --git a/hw/acpi/generic_event_device.c  
> > b/hw/acpi/generic_event_device.c  
> > > index b21a551..0b32fc9 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -16,13 +16,26 @@
> > >   */
> > >
> > >  #include "qemu/osdep.h"
> > > +#include "qapi/error.h"
> > > +#include "exec/address-spaces.h"
> > >  #include "hw/sysbus.h"
> > >  #include "hw/acpi/acpi.h"
> > >  #include "hw/acpi/generic_event_device.h"
> > > +#include "hw/mem/pc-dimm.h"
> > >
> > >  static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> > >                                  DeviceState *dev, Error **errp)
> > >  {
> > > +    VirtAcpiState *s = VIRT_ACPI(hotplug_dev);
> > > +
> > > +    if (s->memhp_state.is_enabled &&
> > > +        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > > +            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state,
> > > +                                dev, errp);
> > > +    } else {
> > > +        error_setg(errp, "virt: device plug request for unsupported  
> > device"  
> > > +                   " type: %s", object_get_typename(OBJECT(dev)));
> > > +    }
> > >  }
> > >
> > >  static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > > @@ -31,9 +44,19 @@ static void virt_send_ged(AcpiDeviceIf *adev,  
> > AcpiEventStatusBits ev)  
> > >
> > >  static void virt_device_realize(DeviceState *dev, Error **errp)
> > >  {
> > > +    VirtAcpiState *s = VIRT_ACPI(dev);
> > > +
> > > +    if (s->memhp_state.is_enabled) {
> > > +        acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
> > > +                                 &s->memhp_state,
> > > +                                 s->memhp_base);
> > > +    }
> > >  }
> > >
> > >  static Property virt_acpi_properties[] = {
> > > +    DEFINE_PROP_UINT64("memhp_base", VirtAcpiState, memhp_base,  
> > 0),
> > 
> > it's preferred to use '-' in property names  
> 
> Ok.
> 
> > > +    DEFINE_PROP_BOOL("memory-hotplug-support", VirtAcpiState,
> > > +                     memhp_state.is_enabled, true),
> > >      DEFINE_PROP_END_OF_LIST(),
> > >  };
> > >
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index bf9c0bc..20d3c83 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -40,6 +40,7 @@
> > >  #include "hw/loader.h"
> > >  #include "hw/hw.h"
> > >  #include "hw/acpi/aml-build.h"
> > > +#include "hw/acpi/memory_hotplug.h"
> > >  #include "hw/pci/pcie_host.h"
> > >  #include "hw/pci/pci.h"
> > >  #include "hw/arm/virt.h"
> > > @@ -49,6 +50,13 @@
> > >  #define ARM_SPI_BASE 32
> > >  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> > >
> > > +static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState  
> > *ms)  
> > > +{  
> > it's dummy wrapper that never will be reused,
> > I suggest to just inline contents at call site and drop wrapper.  
> 
> Ok. I will move it then.
> 
> >   
> > > +    uint32_t nr_mem = ms->ram_slots;
> > > +
> > > +    build_memory_hotplug_aml(scope, nr_mem, "\\_SB", NULL,  
> > AML_SYSTEM_MEMORY);  
> > > +}
> > > +
> > >  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
> > >  {
> > >      uint16_t i;
> > > @@ -740,6 +748,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,  
> > VirtMachineState *vms)  
> > >       * the RTC ACPI device at all when using UEFI.
> > >       */
> > >      scope = aml_scope("\\_SB");
> > > +    acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
> > >      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> > >      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
> > >                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index d0ff20d..13db0e9 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -133,6 +133,7 @@ static const MemMapEntry base_memmap[] = {
> > >      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> > >      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> > >      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> > > +    [VIRT_PCDIMM_ACPI] =        { 0x09070000, 0x00010000 },  
> >                                                  ^^^^^^^^^^^
> > where from this magic number comes?  
> 
> I think the only requirement for size is >= MEMORY_HOTPLUG_IO_LEN(24).
> So may be 64K is bit too much, 4K might as well do the job.
> 
> Or is it best to just use MEMORY_HOTPLUG_IO_LEN directly here?
4K is a waste for handling a handful bytes, so I'd go with
MEMORY_HOTPLUG_IO_LEN unless there is compelling reason for using
page size granularity.

>  
> >   
> > >      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> > >      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that  
> > size */  
> > >      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> > > @@ -516,6 +517,18 @@ static void fdt_add_pmu_nodes(const  
> > VirtMachineState *vms)  
> > >      }
> > >  }
> > >
> > > +static DeviceState *create_virt_acpi(VirtMachineState *vms)
> > > +{
> > > +    DeviceState *dev;
> > > +
> > > +    dev = qdev_create(NULL, "virt-acpi");
> > > +    qdev_prop_set_uint64(dev, "memhp_base",
> > > +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
> > > +    qdev_init_nofail(dev);
> > > +
> > > +    return dev;  
> > 
> > Probably no worth a wrapper either, since code is trivial and isn't reused
> > elsewhere.  
> 
> Ok, I will make it an inline then.
> 
> Thanks,
> Shameer
>  
> > > +}
> > > +
> > >  static void create_its(VirtMachineState *vms, DeviceState *gicdev)
> > >  {
> > >      const char *itsclass = its_class_name();
> > > @@ -1644,6 +1657,8 @@ static void machvirt_init(MachineState *machine)
> > >
> > >      create_platform_bus(vms, pic);
> > >
> > > +    vms->acpi = create_virt_acpi(vms);
> > > +
> > >      vms->bootinfo.ram_size = machine->ram_size;
> > >      vms->bootinfo.kernel_filename = machine->kernel_filename;
> > >      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
> > > @@ -1828,11 +1843,19 @@ static void  
> > virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,  
> > >  static void virt_memory_plug(HotplugHandler *hotplug_dev,
> > >                               DeviceState *dev, Error **errp)
> > >  {
> > > +    HotplugHandlerClass *hhc;
> > >      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> > >      Error *local_err = NULL;
> > >
> > >      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
> > > +    if (local_err) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi);
> > > +    hhc->plug(HOTPLUG_HANDLER(vms->acpi), dev, &error_abort);
> > >
> > > +out:
> > >      error_propagate(errp, local_err);
> > >  }
> > >
> > > diff --git a/include/hw/acpi/generic_event_device.h  
> > b/include/hw/acpi/generic_event_device.h  
> > > index f314515..262ca7d 100644
> > > --- a/include/hw/acpi/generic_event_device.h
> > > +++ b/include/hw/acpi/generic_event_device.h
> > > @@ -18,12 +18,17 @@
> > >  #ifndef HW_ACPI_GED_H
> > >  #define HW_ACPI_GED_H
> > >
> > > +#include "hw/acpi/memory_hotplug.h"
> > > +
> > >  #define TYPE_VIRT_ACPI "virt-acpi"
> > >  #define VIRT_ACPI(obj) \
> > >      OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
> > >
> > >  typedef struct VirtAcpiState {
> > >      SysBusDevice parent_obj;
> > > +    MemHotplugState memhp_state;
> > > +    hwaddr memhp_base;
> > >  } VirtAcpiState;
> > >
> > > +
> > >  #endif
> > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > index 507517c..c5e4c96 100644
> > > --- a/include/hw/arm/virt.h
> > > +++ b/include/hw/arm/virt.h
> > > @@ -77,6 +77,7 @@ enum {
> > >      VIRT_GPIO,
> > >      VIRT_SECURE_UART,
> > >      VIRT_SECURE_MEM,
> > > +    VIRT_PCDIMM_ACPI,
> > >      VIRT_LOWMEMMAP_LAST,
> > >  };
> > >
> > > @@ -132,6 +133,7 @@ typedef struct {
> > >      uint32_t iommu_phandle;
> > >      int psci_conduit;
> > >      hwaddr highest_gpa;
> > > +    DeviceState *acpi;
> > >  } VirtMachineState;
> > >
> > >  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM :  
> > VIRT_PCIE_ECAM)  
> 

