Received: by 10.25.21.156 with SMTP id 28csp2493946lfv;
        Mon, 1 Aug 2016 00:46:27 -0700 (PDT)
X-Received: by 10.200.54.185 with SMTP id a54mr90246282qtc.63.1470037587120;
        Mon, 01 Aug 2016 00:46:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si19335080qte.3.2016.08.01.00.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 00:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bU7ve-0006VY-JO
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 03:46:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bU7vZ-0006VH-Ak
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 03:46:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bU7vT-0003ON-9o
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 03:46:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bU7vT-0003OA-2C; Mon, 01 Aug 2016 03:46:15 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04A964E03C;
	Mon,  1 Aug 2016 07:46:13 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u717k8j2012545; Mon, 1 Aug 2016 03:46:09 -0400
Date: Mon, 1 Aug 2016 09:46:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>
Message-ID: <20160801094607.057cef2f@nial.brq.redhat.com>
In-Reply-To: <79b91f02b26441be993e372cef44002d@nmail01.hynixad.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA_5jngVxajJxdJ0krz0inrkdjTNYYZ+5SNGOipoQo35ZA@mail.gmail.com>
	<79b91f02b26441be993e372cef44002d@nmail01.hynixad.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 01 Aug 2016 07:46:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DaKDL7Qs8Cf5

On Mon, 1 Aug 2016 00:35:35 +0000
"kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com> wrote:

> Hi Peter,
>=20
> Thanks a lot for your comments! I answered in line below.
>=20
> > -----Original Message-----
> > From: Peter Maydell [mailto:peter.maydell@linaro.org]
> > Sent: Saturday, July 30, 2016 3:10 AM
> > To: =EC=9D=B4=EA=B4=91=EC=9A=B0(LEE KWANGWOO) MS SW
> > Cc: Xiao Guangrong; Michael S. Tsirkin; Igor Mammedov; Paolo Bonzini; R=
ichard Henderson; Eduardo
> > Habkost; Shannon Zhao; Shannon Zhao; QEMU Developers; qemu-arm; =EC=A0=
=95=EC=9A=B0=EC=84=9D(CHUNG WOO SUK) MS SW; =EA=B9=80=ED=98=84=EC=B2=A0(KIM
> > HYUNCHUL) MS SW
> > Subject: Re: [RFC PATCH 1/3] hw/arm/virt: add hotplug memory support
> >=20
> > On 20 July 2016 at 01:49, Kwangwoo Lee <kwangwoo.lee@sk.com> wrote: =20
> > > Add hotplug memory feature on aarch64 virt platfom. This patch is
> > > required to emulate a DIMM type memory like NVDIMM.
> > >
> > > Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> > > ---
> > >  default-configs/aarch64-softmmu.mak |   1 +
> > >  hw/arm/virt.c                       | 110 ++++++++++++++++++++++++++=
++++++++++
> > >  include/hw/arm/virt.h               |   3 +
> > >  3 files changed, 114 insertions(+)
> > >
> > > diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aa=
rch64-softmmu.mak
> > > index 2449483..5790cd2 100644
> > > --- a/default-configs/aarch64-softmmu.mak
> > > +++ b/default-configs/aarch64-softmmu.mak
> > > @@ -7,3 +7,4 @@ CONFIG_AUX=3Dy
> > >  CONFIG_DDC=3Dy
> > >  CONFIG_DPCD=3Dy
> > >  CONFIG_XLNX_ZYNQMP=3Dy
> > > +CONFIG_MEM_HOTPLUG=3Dy
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index a193b5a..f7ff411 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -58,6 +58,8 @@
> > >  #include "hw/smbios/smbios.h"
> > >  #include "qapi/visitor.h"
> > >  #include "standard-headers/linux/input.h"
> > > +#include "hw/mem/pc-dimm.h"
> > > +#include "hw/acpi/acpi.h"
> > >
> > >  /* Number of external interrupt lines to configure the GIC with */
> > >  #define NUM_IRQS 256
> > > @@ -91,6 +93,7 @@ typedef struct {
> > >      bool secure;
> > >      bool highmem;
> > >      int32_t gic_version;
> > > +    MemoryHotplugState hotplug_memory;
> > >  } VirtMachineState;
> > >
> > >  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> > > @@ -1376,6 +1379,40 @@ static void machvirt_init(MachineState *machin=
e)
> > >      guest_info_state->machine_done.notify =3D virt_guest_info_machin=
e_done;
> > >      qemu_add_machine_init_done_notifier(&guest_info_state->machine_d=
one);
> > >
> > > +    /* initialize hotplug memory address space */
> > > +    if (machine->ram_size < machine->maxram_size) {
> > > +        ram_addr_t hotplug_mem_size =3D machine->maxram_size - machi=
ne->ram_size;
> > > +
> > > +        if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
> > > +            error_report("unsupported amount of memory slots: %"PRIu=
64, =20
> >=20
> > "number of" =20
>=20
> OK. I'll fix this.
>=20
> > > +                     machine->ram_slots);
> > > +            exit(EXIT_FAILURE);
> > > +        }
> > > +
> > > +        if (QEMU_ALIGN_UP(machine->maxram_size,
> > > +                     TARGET_PAGE_SIZE) !=3D machine->maxram_size) {
> > > +            error_report("maximum memory size must by aligned to mul=
tiple of " =20
> >=20
> > "must be" =20
>=20
> OK. I'll fix this
>=20
> > > +                     "%d bytes", TARGET_PAGE_SIZE);
> > > +            exit(EXIT_FAILURE);
> > > +        }
> > > +
> > > +        vms->hotplug_memory.base =3D
> > > +                     ROUND_UP(vbi->memmap[VIRT_MEM].base + machine->=
ram_size,
> > > +                                              ARCH_VIRT_HOTPLUG_MEM_=
ALIGN);
> > > +
> > > +        if ((vms->hotplug_memory.base + hotplug_mem_size) <
> > > +            hotplug_mem_size) { =20
> >=20
> > This expression is confusing. Is it trying to test for overflow?
> > When can that happen? =20
>=20
> Ah.. you are right. No need to check this. I'll remove this. Thanks!
>=20
> > > +            error_report("unsupported amount of maximum memory: " RA=
M_ADDR_FMT,
> > > +                     machine->maxram_size);
> > > +            exit(EXIT_FAILURE);
> > > +        }
> > > +
> > > +        memory_region_init(&vms->hotplug_memory.mr, OBJECT(vms),
> > > +                           "hotplug-memory", hotplug_mem_size);
> > > +        memory_region_add_subregion(sysmem, vms->hotplug_memory.base,
> > > +                                    &vms->hotplug_memory.mr);
> > > +    }
> > > +
> > >      vbi->bootinfo.ram_size =3D machine->ram_size;
> > >      vbi->bootinfo.kernel_filename =3D machine->kernel_filename;
> > >      vbi->bootinfo.kernel_cmdline =3D machine->kernel_cmdline;
> > > @@ -1448,9 +1485,75 @@ static void virt_set_gic_version(Object *obj, =
const char *value, Error **errp)
> > >      }
> > >  }
> > >
> > > +static void virt_dimm_plug(HotplugHandler *hotplug_dev,
> > > +                         DeviceState *dev, Error **errp)
> > > +{
> > > +    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> > > +    PCDIMMDevice *dimm =3D PC_DIMM(dev);
> > > +    PCDIMMDeviceClass *ddc =3D PC_DIMM_GET_CLASS(dimm);
> > > +    MemoryRegion *mr =3D ddc->get_memory_region(dimm);
> > > +    Error *local_err =3D NULL;
> > > +    uint64_t align =3D memory_region_get_alignment(mr);
> > > +
> > > +    pc_dimm_memory_plug(dev, &vms->hotplug_memory, mr, align, &local=
_err);
> > > +    if (local_err) {
> > > +        goto out;
> > > +    }
> > > +
> > > +out:
> > > +    error_propagate(errp, local_err);
> > > +}
> > > +
> > > +static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
> > > +                           DeviceState *dev, Error **errp)
> > > +{
> > > +    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> > > +    PCDIMMDevice *dimm =3D PC_DIMM(dev);
> > > +    PCDIMMDeviceClass *ddc =3D PC_DIMM_GET_CLASS(dimm);
> > > +    MemoryRegion *mr =3D ddc->get_memory_region(dimm);
> > > +    Error *local_err =3D NULL;
> > > +
> > > +    pc_dimm_memory_unplug(dev, &vms->hotplug_memory, mr);
> > > +    object_unparent(OBJECT(dev));
> > > +
> > > +    error_propagate(errp, local_err);
> > > +}
> > > +
> > > +static void virt_machinedevice_plug_cb(HotplugHandler *hotplug_dev,
> > > +                                      DeviceState *dev, Error **errp)
> > > +{
> > > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > > +        virt_dimm_plug(hotplug_dev, dev, errp);
> > > +    } else {
> > > +        error_setg(errp, "acpi: device plug request for not supporte=
d device" =20
> >=20
> > "unsupported" =20
>=20
> OK. Will fix.
>=20
> > > +                   " type: %s", object_get_typename(OBJECT(dev)));
> > > +    }
> > > +}
> > > +
> > > +static void virt_machinedevice_unplug_cb(HotplugHandler *hotplug_dev,
> > > +                                        DeviceState *dev, Error **er=
rp)
> > > +{
> > > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > > +        virt_dimm_unplug(hotplug_dev, dev, errp);
> > > +    } else {
> > > +        error_setg(errp, "acpi: device unplug for not supported devi=
ce" =20
> >=20
> > "unsupported" =20
>=20
> OK. Will fix.
>=20
> > > +                   " type: %s", object_get_typename(OBJECT(dev)));
> > > +    }
> > > +}
> > > +
> > > +static HotplugHandler *virt_get_hotplug_handler(MachineState *machin=
e,
> > > +                                             DeviceState *dev)
> > > +{
> > > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > > +        return HOTPLUG_HANDLER(machine);
> > > +    }
> > > +    return NULL;
> > > +}
> > > +
> > >  static void virt_machine_class_init(ObjectClass *oc, void *data)
> > >  {
> > >      MachineClass *mc =3D MACHINE_CLASS(oc);
> > > +    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
> > >
> > >      mc->init =3D machvirt_init;
> > >      /* Start max_cpus at the maximum QEMU supports. We'll further re=
strict
> > > @@ -1462,6 +1565,9 @@ static void virt_machine_class_init(ObjectClass=
 *oc, void *data)
> > >      mc->block_default_type =3D IF_VIRTIO;
> > >      mc->no_cdrom =3D 1;
> > >      mc->pci_allow_0_address =3D true;
> > > +    mc->get_hotplug_handler =3D virt_get_hotplug_handler;
> > > +    hc->plug =3D virt_machinedevice_plug_cb;
> > > +    hc->unplug =3D virt_machinedevice_unplug_cb;
> > >  }
> > >
> > >  static const TypeInfo virt_machine_info =3D {
> > > @@ -1471,6 +1577,10 @@ static const TypeInfo virt_machine_info =3D {
> > >      .instance_size =3D sizeof(VirtMachineState),
> > >      .class_size    =3D sizeof(VirtMachineClass),
> > >      .class_init    =3D virt_machine_class_init,
> > > +    .interfaces =3D (InterfaceInfo[]) {
> > > +         { TYPE_HOTPLUG_HANDLER },
> > > +         { }
> > > +    },
> > >  };
> > >
> > >  static void machvirt_machine_init(void)
> > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > index 9650193..35aa3cc 100644
> > > --- a/include/hw/arm/virt.h
> > > +++ b/include/hw/arm/virt.h
> > > @@ -45,6 +45,9 @@
> > >
> > >  #define PPI(irq) ((irq) + 16)
> > >
> > > +/* 1GB alignment for hotplug memory region */
> > > +#define ARCH_VIRT_HOTPLUG_MEM_ALIGN (1ULL << 30) =20
> >=20
> > Where does the 1GB alignment come from? Why do we need 1GB
> > alignment for the base but only 1KB alignment for the size? =20
>=20
> The alignment value of hotplug_memory.base referred from i386 pc.c and pp=
c spapr.c.
> Could you suggest a proper range for this?
Base alignment comes from max supported hugepage size, while
size alignment should depend on backend's page size.

>=20
> > > +
> > >  enum {
> > >      VIRT_FLASH,
> > >      VIRT_MEM,
> > > --
> > > 2.5.0 =20
> >=20
> > thanks
> > -- PMM =20
>=20
> Best Regards,
> Kwangwoo Lee

