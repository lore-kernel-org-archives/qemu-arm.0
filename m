Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp591752wrx;
        Mon, 1 Apr 2019 09:25:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw46tFVEZK/nYnAOA4B176WAy0RmOwy0CBLEDWi2UqKe6d+xYNdVAVnwzWI0P8tcTQConkk
X-Received: by 2002:a0d:f344:: with SMTP id c65mr53603982ywf.77.1554135901802;
        Mon, 01 Apr 2019 09:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554135901; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8XBHqjZyLl5dRQb6ANpSkbz2TlUDRXtEYAyM5NN6rRkTQgBugcgitDqseyCQlSOdw
         BECj5e+RVbn2hsZbycdo9TEz005DsJCVjyEtHUeAfxDjyR4bmQLiB050XIdEYzDhji8Z
         O/HiTg1/8g9ituG5kL3wUqeu+DKcTsXb3HIeTAnwtyVzqpEiBLOdfO4nDOVakHQ7qhDd
         1ejsrLsCtCp5JRWyeAM9WuK+i/3WYtqz5h+gJbqegKlFVaXPdkl9Vt//sPTNAFRJO45v
         Y+cHs8ORF+MnQeeFP8pbh9/Txno/EstmMWT5NncjiENR943EVU2jUyzjjHC0uLhZr9pp
         jn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=uZ7c2WuKJhFR/YOPIKXqsbqAu6KpQcnFjxu78VwC+SI=;
        b=AJzU/cn8tEnmGGFPGJk1JJrQm883chDLiJEYkIHArSvmRzEqKnRIds5hFG5TtBtQZh
         qYMG1ula3ES0LK62bF6ctrNo+IAb5nCDQ/Sb+qT8+3dzixw16gWPi92MzxziWUD5rwM/
         nyEpfqmefoFkto2HamaUADv2ZDQ1VISrAAPDcM9DxDwkmTkKG96kkx3280HjZ9qquff2
         fB5XvkjRnp6EtejDb59OVlYK+mwLlIY1gO9t5lAYUZ06OFQ2EHSezbszUXCjX1483rJJ
         LZVijTU/8Fz5yupXdoFMw7eTuDHhv4dzcXyyM74Q8xiv8YDYJle+b3WS5h2D4CJEk/qT
         QTkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c184si6104754ybh.429.2019.04.01.09.25.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Apr 2019 09:25:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAzk5-0005Ni-8i
	for alex.bennee@linaro.org; Mon, 01 Apr 2019 12:25:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hAzjv-0005LK-Mw
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 12:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hAzju-0007iT-3k
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 12:24:51 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45384 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hAzjt-0007hy-Ns; Mon, 01 Apr 2019 12:24:50 -0400
Received: from lhreml705-cah.china.huawei.com (unknown [10.201.108.46])
	by Forcepoint Email with ESMTP id 7AF867CADBB06B62B156;
	Mon,  1 Apr 2019 17:24:46 +0100 (IST)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.113]) by
	lhreml705-cah.china.huawei.com ([10.201.108.46]) with mapi id
	14.03.0415.000; Mon, 1 Apr 2019 17:24:41 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v3 05/10] hw/arm/virt: Add ACPI support for device
	memory cold-plug
Thread-Index: AQHU6I+5Kh8wKhm6ikaHDHuU4eY4k6Ynd99w
Date: Mon, 1 Apr 2019 16:24:40 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8393477CA@lhreml524-mbb.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-6-shameerali.kolothum.thodi@huawei.com>
	<20190401153425.5d9bd5da@redhat.com>
In-Reply-To: <20190401153425.5d9bd5da@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I56BJM61bf6Z



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 01 April 2019 14:34
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>
> Subject: Re: [PATCH v3 05/10] hw/arm/virt: Add ACPI support for device
> memory cold-plug
>=20
> On Thu, 21 Mar 2019 10:47:40 +0000
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > This adds support to build the aml code so that Guest(ACPI boot)
> > can see the cold-plugged device memory. Memory cold plug support
> > with DT boot is not yet enabled.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  default-configs/arm-softmmu.mak        |  2 ++
> >  hw/acpi/generic_event_device.c         | 23
> +++++++++++++++++++++++
> >  hw/arm/virt-acpi-build.c               |  9 +++++++++
> >  hw/arm/virt.c                          | 23
> +++++++++++++++++++++++
> >  include/hw/acpi/generic_event_device.h |  5 +++++
> >  include/hw/arm/virt.h                  |  2 ++
> >  6 files changed, 64 insertions(+)
> >
> > diff --git a/default-configs/arm-softmmu.mak
> b/default-configs/arm-softmmu.mak
> > index 795cb89..6db444e 100644
> > --- a/default-configs/arm-softmmu.mak
> > +++ b/default-configs/arm-softmmu.mak
> > @@ -162,3 +162,5 @@ CONFIG_LSI_SCSI_PCI=3Dy
> >
> >  CONFIG_MEM_DEVICE=3Dy
> >  CONFIG_DIMM=3Dy
> > +CONFIG_ACPI_MEMORY_HOTPLUG=3Dy
> > +CONFIG_ACPI_HW_REDUCED=3Dy
> > diff --git a/hw/acpi/generic_event_device.c
> b/hw/acpi/generic_event_device.c
> > index b21a551..0b32fc9 100644
> > --- a/hw/acpi/generic_event_device.c
> > +++ b/hw/acpi/generic_event_device.c
> > @@ -16,13 +16,26 @@
> >   */
> >
> >  #include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "exec/address-spaces.h"
> >  #include "hw/sysbus.h"
> >  #include "hw/acpi/acpi.h"
> >  #include "hw/acpi/generic_event_device.h"
> > +#include "hw/mem/pc-dimm.h"
> >
> >  static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> >                                  DeviceState *dev, Error **errp)
> >  {
> > +    VirtAcpiState *s =3D VIRT_ACPI(hotplug_dev);
> > +
> > +    if (s->memhp_state.is_enabled &&
> > +        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > +            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state,
> > +                                dev, errp);
> > +    } else {
> > +        error_setg(errp, "virt: device plug request for unsupported
> device"
> > +                   " type: %s", object_get_typename(OBJECT(dev)));
> > +    }
> >  }
> >
> >  static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > @@ -31,9 +44,19 @@ static void virt_send_ged(AcpiDeviceIf *adev,
> AcpiEventStatusBits ev)
> >
> >  static void virt_device_realize(DeviceState *dev, Error **errp)
> >  {
> > +    VirtAcpiState *s =3D VIRT_ACPI(dev);
> > +
> > +    if (s->memhp_state.is_enabled) {
> > +        acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
> > +                                 &s->memhp_state,
> > +                                 s->memhp_base);
> > +    }
> >  }
> >
> >  static Property virt_acpi_properties[] =3D {
> > +    DEFINE_PROP_UINT64("memhp_base", VirtAcpiState, memhp_base,
> 0),
>=20
> it's preferred to use '-' in property names

Ok.

> > +    DEFINE_PROP_BOOL("memory-hotplug-support", VirtAcpiState,
> > +                     memhp_state.is_enabled, true),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index bf9c0bc..20d3c83 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -40,6 +40,7 @@
> >  #include "hw/loader.h"
> >  #include "hw/hw.h"
> >  #include "hw/acpi/aml-build.h"
> > +#include "hw/acpi/memory_hotplug.h"
> >  #include "hw/pci/pcie_host.h"
> >  #include "hw/pci/pci.h"
> >  #include "hw/arm/virt.h"
> > @@ -49,6 +50,13 @@
> >  #define ARM_SPI_BASE 32
> >  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> >
> > +static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState
> *ms)
> > +{
> it's dummy wrapper that never will be reused,
> I suggest to just inline contents at call site and drop wrapper.

Ok. I will move it then.

>=20
> > +    uint32_t nr_mem =3D ms->ram_slots;
> > +
> > +    build_memory_hotplug_aml(scope, nr_mem, "\\_SB", NULL,
> AML_SYSTEM_MEMORY);
> > +}
> > +
> >  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
> >  {
> >      uint16_t i;
> > @@ -740,6 +748,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
> >       * the RTC ACPI device at all when using UEFI.
> >       */
> >      scope =3D aml_scope("\\_SB");
> > +    acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
> >      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> >      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
> >                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index d0ff20d..13db0e9 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -133,6 +133,7 @@ static const MemMapEntry base_memmap[] =3D {
> >      [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
> >      [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
> >      [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
> > +    [VIRT_PCDIMM_ACPI] =3D        { 0x09070000, 0x00010000 },
>                                                  ^^^^^^^^^^^
> where from this magic number comes?

I think the only requirement for size is >=3D MEMORY_HOTPLUG_IO_LEN(24).
So may be 64K is bit too much, 4K might as well do the job.

Or is it best to just use MEMORY_HOTPLUG_IO_LEN directly here?
=20
>=20
> >      [VIRT_MMIO] =3D               { 0x0a000000, 0x00000200 },
> >      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that
> size */
> >      [VIRT_PLATFORM_BUS] =3D       { 0x0c000000, 0x02000000 },
> > @@ -516,6 +517,18 @@ static void fdt_add_pmu_nodes(const
> VirtMachineState *vms)
> >      }
> >  }
> >
> > +static DeviceState *create_virt_acpi(VirtMachineState *vms)
> > +{
> > +    DeviceState *dev;
> > +
> > +    dev =3D qdev_create(NULL, "virt-acpi");
> > +    qdev_prop_set_uint64(dev, "memhp_base",
> > +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
> > +    qdev_init_nofail(dev);
> > +
> > +    return dev;
>=20
> Probably no worth a wrapper either, since code is trivial and isn't reuse=
d
> elsewhere.

Ok, I will make it an inline then.

Thanks,
Shameer
=20
> > +}
> > +
> >  static void create_its(VirtMachineState *vms, DeviceState *gicdev)
> >  {
> >      const char *itsclass =3D its_class_name();
> > @@ -1644,6 +1657,8 @@ static void machvirt_init(MachineState *machine)
> >
> >      create_platform_bus(vms, pic);
> >
> > +    vms->acpi =3D create_virt_acpi(vms);
> > +
> >      vms->bootinfo.ram_size =3D machine->ram_size;
> >      vms->bootinfo.kernel_filename =3D machine->kernel_filename;
> >      vms->bootinfo.kernel_cmdline =3D machine->kernel_cmdline;
> > @@ -1828,11 +1843,19 @@ static void
> virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >  static void virt_memory_plug(HotplugHandler *hotplug_dev,
> >                               DeviceState *dev, Error **errp)
> >  {
> > +    HotplugHandlerClass *hhc;
> >      VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> >      Error *local_err =3D NULL;
> >
> >      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
> > +    if (local_err) {
> > +        goto out;
> > +    }
> > +
> > +    hhc =3D HOTPLUG_HANDLER_GET_CLASS(vms->acpi);
> > +    hhc->plug(HOTPLUG_HANDLER(vms->acpi), dev, &error_abort);
> >
> > +out:
> >      error_propagate(errp, local_err);
> >  }
> >
> > diff --git a/include/hw/acpi/generic_event_device.h
> b/include/hw/acpi/generic_event_device.h
> > index f314515..262ca7d 100644
> > --- a/include/hw/acpi/generic_event_device.h
> > +++ b/include/hw/acpi/generic_event_device.h
> > @@ -18,12 +18,17 @@
> >  #ifndef HW_ACPI_GED_H
> >  #define HW_ACPI_GED_H
> >
> > +#include "hw/acpi/memory_hotplug.h"
> > +
> >  #define TYPE_VIRT_ACPI "virt-acpi"
> >  #define VIRT_ACPI(obj) \
> >      OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
> >
> >  typedef struct VirtAcpiState {
> >      SysBusDevice parent_obj;
> > +    MemHotplugState memhp_state;
> > +    hwaddr memhp_base;
> >  } VirtAcpiState;
> >
> > +
> >  #endif
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index 507517c..c5e4c96 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -77,6 +77,7 @@ enum {
> >      VIRT_GPIO,
> >      VIRT_SECURE_UART,
> >      VIRT_SECURE_MEM,
> > +    VIRT_PCDIMM_ACPI,
> >      VIRT_LOWMEMMAP_LAST,
> >  };
> >
> > @@ -132,6 +133,7 @@ typedef struct {
> >      uint32_t iommu_phandle;
> >      int psci_conduit;
> >      hwaddr highest_gpa;
> > +    DeviceState *acpi;
> >  } VirtMachineState;
> >
> >  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM :
> VIRT_PCIE_ECAM)

