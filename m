Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp562733wrs;
        Tue, 12 Mar 2019 07:36:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQ68iqy3WQaJTP6qETkPoAwDPp4IpTiEuaH26rfzt80G3qwpgWrSv9J3ht7fuh1iUoCFoy
X-Received: by 2002:a25:14c1:: with SMTP id 184mr7385167ybu.403.1552401376926;
        Tue, 12 Mar 2019 07:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552401376; cv=none;
        d=google.com; s=arc-20160816;
        b=aqrpRv3kjALhxsQuYW/QLLgUZxUGT36fg6QncFhiJxe9ALcASMuXIHxRZaaGU6uSh/
         eGqLrEORpKel+DwEE6jloyrsj44d/dE7zt3ok9HVQj/zPrdBV2nClPttLu3wEKdKnbNe
         vVdvD2r+4kmlkRH1SG85sHmIeQBKXQnyGH1dnzYHr7d6b4W8fE5Jo6lGEVEWb/GDw1YU
         hYKxHjPt1CgkH5m8apemyMLRUA3ls+p5C6CvBirTDhjrl4GNDF8HE4hCQagVnjrckxAl
         gwc9osYZ3ZI7n8kD9cmUUdtnaHHd9Vg84ZLG+Sgivtv6djevR0NjdMey1nBZaBuo9XxW
         QIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=O1ffliI6JEqBc4koXSaFh4ugAmEABiCgf1RyY15msuQ=;
        b=NKsCINZnelVhkyeqtOj91UhSs6OiOEeMfG+GHMjos3nTDQ/oeDhcJEvjpODf25pSkw
         JagkVVPDOPIuJtil1BnJTp2dZH3LUijdw2h5Cn7LEPL+0s0VmhKIcaAHcWq7YAI+zfSs
         bdOsLAONpG105X3mgJdHlB5FpVWEeEGHqCisr2TdfCRveyNiyG57UXPCHTvZEBnXQ/um
         bFNuZ+Ju6rQND1kORj5Nv4mV6RXjMl2eQIuiAfA6hw4jTra6wXu4L/NhmkTswJcD+6ui
         hwO7j9CCT5AZKAlNorDoqF5OlWUwl935YKxOf/I4cdoFKzI/OlJCoDHjs3Jwjq09i0id
         sShg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i204si5304747ybg.266.2019.03.12.07.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 07:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3iVs-0001lG-Cv
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 10:36:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3iUY-0000k5-Mw
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 10:34:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3iUX-00014v-6T
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 10:34:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h3iUW-00013w-RS; Tue, 12 Mar 2019 10:34:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49AB730820E4;
	Tue, 12 Mar 2019 14:34:51 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 375955DD9B;
	Tue, 12 Mar 2019 14:34:46 +0000 (UTC)
Date: Tue, 12 Mar 2019 15:34:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190312153445.18384f74@redhat.com>
In-Reply-To: <5b73e82c-8fb3-6968-0c1b-5ec4378c0143@redhat.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-7-shameerali.kolothum.thodi@huawei.com>
	<3c656ef1-a58e-6461-254e-140976b01d4e@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839304E27@lhreml524-mbb.china.huawei.com>
	<5b73e82c-8fb3-6968-0c1b-5ec4378c0143@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 12 Mar 2019 14:34:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 06/11] hw/arm/virt: Add ACPI support for
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7UwpMBopxoFw

On Mon, 11 Mar 2019 18:58:14 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Shameer,
> On 3/11/19 6:37 PM, Shameerali Kolothum Thodi wrote:
> >=20
> >  =20
> >> -----Original Message-----
> >> From: Auger Eric [mailto:eric.auger@redhat.com]
> >> Sent: 11 March 2019 13:32
> >> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> >> qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com;
> >> peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> >> sameo@linux.intel.com; sebastien.boeuf@intel.com
> >> Cc: Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>
> >> Subject: Re: [PATCH v2 06/11] hw/arm/virt: Add ACPI support for device
> >> memory cold-plug
> >>
> >> Hi Shameer,
> >>
> >> On 3/8/19 12:42 PM, Shameer Kolothum wrote: =20
> >>> This adds support to build the aml code so that Guest can see the =20
> >> s/Guest/the guest =20
> >>> cold-plugged device memory. =20
> >>
> >> Isn't the colplug part only related to acpi_dsdt_add_memory_hotplug()?=
 I
> >> understand the patch also adds some hotplug infra? =20
> >=20
> > Hmm..build_memory_hotplug_aml() doesn=E2=80=99t do much if io_base addr=
ess
> > Is not initialized. So we need the acpi_memory_hotplug_init(). =20
> Yes that's correct, we need it for cold-plug.
> >=20
> > Also, I think acpi_memory_plug_cb() needs to be called for cold-plugged=
 dimm
> > otherwise the scan wont detect it. =20
> You may be right as some MemStatus fields are updated also in coldplug ca=
se.
>=20
> Worth to double check the bare minimal to make cold-plug OK in ACPI mode
> (without the dt node generation in ACPI mode as suggested by Igor), and
> augment the commit message with more details.
from ACPI pov cold- and hot-plug are the the same (at least currently) with
difference that there is no GPE (GED) event in coldplug case, MMIO interface
is used tha same way or both.

> Thanks
>=20
> Eric
>=20
> >   =20
> >> Can't you just keerp the dsdt additions here, move the virt-acpi chang=
es
> >> in the original patch and move the virt-acpi instantiation in a
> >> subsequent patch? =20
> >=20
> > Ok, will take look if there is any scope for reordering this.
> >=20
> > Thanks,
> > Shameer
> >   =20
> >> Thanks
> >>
> >> Eric =20
> >>>
> >>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> >>> ---
> >>>  default-configs/arm-softmmu.mak |  1 +
> >>>  hw/arm/virt-acpi-build.c        |  9 +++++++++
> >>>  hw/arm/virt-acpi.c              | 23 +++++++++++++++++++++++
> >>>  hw/arm/virt.c                   | 11 +++++++++++
> >>>  include/hw/arm/virt.h           |  2 ++
> >>>  5 files changed, 46 insertions(+)
> >>>
> >>> diff --git a/default-configs/arm-softmmu.mak =20
> >> b/default-configs/arm-softmmu.mak =20
> >>> index fbc4564..b3bac25 100644
> >>> --- a/default-configs/arm-softmmu.mak
> >>> +++ b/default-configs/arm-softmmu.mak
> >>> @@ -167,3 +167,4 @@ CONFIG_HIGHBANK=3Dy
> >>>  CONFIG_MUSICPAL=3Dy
> >>>  CONFIG_MEM_DEVICE=3Dy
> >>>  CONFIG_DIMM=3Dy
> >>> +CONFIG_ACPI_MEMORY_HOTPLUG=3Dy
> >>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >>> index d7e2e48..87d66da 100644
> >>> --- a/hw/arm/virt-acpi-build.c
> >>> +++ b/hw/arm/virt-acpi-build.c
> >>> @@ -40,6 +40,7 @@
> >>>  #include "hw/loader.h"
> >>>  #include "hw/hw.h"
> >>>  #include "hw/acpi/aml-build.h"
> >>> +#include "hw/acpi/memory_hotplug.h"
> >>>  #include "hw/pci/pcie_host.h"
> >>>  #include "hw/pci/pci.h"
> >>>  #include "hw/arm/virt.h"
> >>> @@ -49,6 +50,13 @@
> >>>  #define ARM_SPI_BASE 32
> >>>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
> >>>
> >>> +static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState =20
> >> *ms) =20
> >>> +{
> >>> +    uint32_t nr_mem =3D ms->ram_slots;
> >>> +
> >>> +    build_memory_hotplug_aml(scope, nr_mem, "\\_SB", NULL, =20
> >> AML_SYSTEM_MEMORY); =20
> >>> +}
> >>> +
> >>>  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
> >>>  {
> >>>      uint16_t i;
> >>> @@ -740,6 +748,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
, =20
> >> VirtMachineState *vms) =20
> >>>       * the RTC ACPI device at all when using UEFI.
> >>>       */
> >>>      scope =3D aml_scope("\\_SB");
> >>> +    acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
> >>>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> >>>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
> >>>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> >>> diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
> >>> index df8a02b..18ebe94 100644
> >>> --- a/hw/arm/virt-acpi.c
> >>> +++ b/hw/arm/virt-acpi.c
> >>> @@ -26,9 +26,11 @@
> >>>  #include "hw/arm/virt.h"
> >>>
> >>>  #include "hw/acpi/acpi.h"
> >>> +#include "hw/acpi/memory_hotplug.h"
> >>>
> >>>  typedef struct VirtAcpiState {
> >>>      SysBusDevice parent_obj;
> >>> +    MemHotplugState memhp_state;
> >>>  } VirtAcpiState;
> >>>
> >>>  #define TYPE_VIRT_ACPI "virt-acpi"
> >>> @@ -44,6 +46,16 @@ static const VMStateDescription vmstate_acpi =3D {
> >>>  static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
> >>>                                  DeviceState *dev, Error **errp)
> >>>  {
> >>> +    VirtAcpiState *s =3D VIRT_ACPI(hotplug_dev);
> >>> +
> >>> +    if (s->memhp_state.is_enabled &&
> >>> +        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> >>> +            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state,
> >>> +                                dev, errp);
> >>> +    } else {
> >>> +        error_setg(errp, "virt: device plug request for unsupported =
=20
> >> device" =20
> >>> +                   " type: %s", object_get_typename(OBJECT(dev)));
> >>> +    }
> >>>  }
> >>>
> >>>  static void virt_device_unplug_request_cb(HotplugHandler *hotplug_de=
v,
> >>> @@ -62,6 +74,15 @@ static void virt_send_ged(AcpiDeviceIf *adev, =20
> >> AcpiEventStatusBits ev) =20
> >>>
> >>>  static void virt_device_realize(DeviceState *dev, Error **errp)
> >>>  {
> >>> +    VirtMachineState *vms =3D VIRT_MACHINE(qdev_get_machine());
> >>> +    const MemMapEntry *memmap =3D vms->memmap;
> >>> +    VirtAcpiState *s =3D VIRT_ACPI(dev);
> >>> +
> >>> +    if (s->memhp_state.is_enabled) {
> >>> +        acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
> >>> +                                 &s->memhp_state,
> >>> + =20
> >> memmap[VIRT_PCDIMM_ACPI].base); =20
> >>> +    }
> >>>  }
> >>>
> >>>  DeviceState *virt_acpi_init(void)
> >>> @@ -70,6 +91,8 @@ DeviceState *virt_acpi_init(void)
> >>>  }
> >>>
> >>>  static Property virt_acpi_properties[] =3D {
> >>> +    DEFINE_PROP_BOOL("memory-hotplug-support", VirtAcpiState,
> >>> +                     memhp_state.is_enabled, true),
> >>>      DEFINE_PROP_END_OF_LIST(),
> >>>  };
> >>>
> >>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>> index 40a1273..9427f4f 100644
> >>> --- a/hw/arm/virt.c
> >>> +++ b/hw/arm/virt.c
> >>> @@ -133,6 +133,7 @@ static const MemMapEntry base_memmap[] =3D {
> >>>      [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
> >>>      [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
> >>>      [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
> >>> +    [VIRT_PCDIMM_ACPI] =3D        { 0x09070000, 0x00010000 },
> >>>      [VIRT_MMIO] =3D               { 0x0a000000, 0x00000200 },
> >>>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of th=
at =20
> >> size */ =20
> >>>      [VIRT_PLATFORM_BUS] =3D       { 0x0c000000, 0x02000000 },
> >>> @@ -1648,6 +1649,8 @@ static void machvirt_init(MachineState *machine)
> >>>
> >>>      create_platform_bus(vms, pic);
> >>>
> >>> +    vms->acpi =3D virt_acpi_init();
> >>> +
> >>>      vms->bootinfo.ram_size =3D machine->ram_size;
> >>>      vms->bootinfo.kernel_filename =3D machine->kernel_filename;
> >>>      vms->bootinfo.kernel_cmdline =3D machine->kernel_cmdline;
> >>> @@ -1832,11 +1835,19 @@ static void =20
> >> virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev, =20
> >>>  static void virt_memory_plug(HotplugHandler *hotplug_dev,
> >>>                               DeviceState *dev, Error **errp)
> >>>  {
> >>> +    HotplugHandlerClass *hhc;
> >>>      VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> >>>      Error *local_err =3D NULL;
> >>>
> >>>      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
> >>> +    if (local_err) {
> >>> +        goto out;
> >>> +    }
> >>> +
> >>> +    hhc =3D HOTPLUG_HANDLER_GET_CLASS(vms->acpi);
> >>> +    hhc->plug(HOTPLUG_HANDLER(vms->acpi), dev, &error_abort);
> >>>
> >>> +out:
> >>>      error_propagate(errp, local_err);
> >>>  }
> >>>
> >>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >>> index 6076167..e46a051 100644
> >>> --- a/include/hw/arm/virt.h
> >>> +++ b/include/hw/arm/virt.h
> >>> @@ -77,6 +77,7 @@ enum {
> >>>      VIRT_GPIO,
> >>>      VIRT_SECURE_UART,
> >>>      VIRT_SECURE_MEM,
> >>> +    VIRT_PCDIMM_ACPI,
> >>>      VIRT_LOWMEMMAP_LAST,
> >>>  };
> >>>
> >>> @@ -132,6 +133,7 @@ typedef struct {
> >>>      uint32_t iommu_phandle;
> >>>      int psci_conduit;
> >>>      hwaddr highest_gpa;
> >>> +    DeviceState *acpi;
> >>>  } VirtMachineState;
> >>>
> >>>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : =20
> >> VIRT_PCIE_ECAM) =20
> >>> =20

