Received: by 10.28.4.212 with SMTP id 203csp420765wme;
        Thu, 19 Apr 2018 02:08:22 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrq6pMkvmzj5zFPCj1jagk89AL0AItIeoGkU90ql+l1gGDQwqSLMhSmy2X1L9j6ocbroP2Y
X-Received: by 2002:aed:2ba3:: with SMTP id e32-v6mr5324768qtd.272.1524128902841;
        Thu, 19 Apr 2018 02:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524128902; cv=none;
        d=google.com; s=arc-20160816;
        b=qj+1Awy/mo3pXkwepS/GDAeafPVfLkvpf/kpJfQPaVj2vgNzj9SisyolbgplbD3Vh1
         X1jeWwVKYH+5YEKbJ9p38iOqEth13gpbqDEgUTZVuHeFGJ+GWO6S1YaZkzcpo73hS6TM
         UDigYpN47crCTEHUH56adLJC3jHx1W1uQnBWNtvFXMBo5m78EkKthdq0kYyMvHJH62P6
         yIs7H/PoiGVS8tZRXjpyPZM6Y0dPgRiS2ZIvQSgVIj0y3y/8tr3roC8oR7eCq5UzltNP
         5szIKyge3GK7YI6UHagSPhSFK8PmSs45gAnXBztPbK/M23F9OAzyVQJjzqVOLn/mqBtA
         S8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=6gvW4+Ky6y/voIpBpchg0smSWLQvJHYfO05I5d5ASn4=;
        b=j3zDETHK6+omtt/lNopoCNKbGdxRn9JroaPyTKMwC2ejzvdmjKpw+E2xsgRI3W92iv
         g0WIoeIk4b/q3plF4vh/ZuU2KTor791705SpDath0EKvCIHIzTxf0obV17A/ld2AaI73
         dBp9ZLTq4oT4E/fFRXZileKjSRg8pYcNoYU8DzW5HeNvwK8HQvCM0TQeqprRxjfDOFka
         6ufDJ5fb0G14Jo3+Aa+tb8Qho3yfm3SVMpjstbZoh683hP5e/FOJWfeSCz9HpDJoSBiF
         5rItEcV/CcDOJ2vHbYtfQ5PJzPnV8cWkCLhgZipsvz+UnLn5vFNj0jyx8vSFvsDnPAbz
         bMLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o62si4240973qka.155.2018.04.19.02.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 02:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f95YE-0002pO-Ad
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 05:08:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1f95Wv-0001zS-J8
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 05:07:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1f95Wc-0001mT-EW
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 05:07:01 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:59981 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1f95Wc-0001gx-1w; Thu, 19 Apr 2018 05:06:42 -0400
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 686A0494B9761;
	Thu, 19 Apr 2018 10:06:35 +0100 (IST)
Received: from FRAEMA708-CHM.china.huawei.com (10.206.14.57) by
	lhreml704-cah.china.huawei.com (10.201.108.45) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Thu, 19 Apr 2018 10:06:36 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.156]) by
	FRAEMA708-CHM.china.huawei.com ([169.254.8.190]) with mapi id
	14.03.0382.000; Thu, 19 Apr 2018 11:06:30 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Thread-Topic: [Qemu-devel] [RFC 3/5] hw/arm: add scattered RAM memory region
	support
Thread-Index: AQHTXOYlQiE9hVh570Cux4XapwClL6MT5SMAgPTPhXA=
Date: Thu, 19 Apr 2018 09:06:30 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83868CA39@FRAEML521-MBX.china.huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-4-git-send-email-zhuyijun@huawei.com>
	<20171114145002.jbrw7k4n2m2rfwes@kamzik.brq.redhat.com>
In-Reply-To: <20171114145002.jbrw7k4n2m2rfwes@kamzik.brq.redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.213.3.17
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>, Zhaoshenglong <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VQyhSMTYxYU7

Hi Andrew,

> -----Original Message-----
> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Tuesday, November 14, 2017 2:50 PM
> To: Zhuyijun <zhuyijun@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; Shameerali Kolothum
> Thodi <shameerali.kolothum.thodi@huawei.com>; Zhaoshenglong
> <zhaoshenglong@huawei.com>
> Subject: Re: [Qemu-devel] [RFC 3/5] hw/arm: add scattered RAM memory
> region support
>=20
> On Tue, Nov 14, 2017 at 09:15:52AM +0800, zhuyijun@huawei.com wrote:
> > From: Zhu Yijun <zhuyijun@huawei.com>
> >
> > Dig out reserved memory holes and collect scattered RAM memory
> > regions by adding mem_list member in arm_boot_info struct.
> >
> > Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> > ---
> >  hw/arm/boot.c        |   8 ++++
> >  hw/arm/virt.c        | 101
> ++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  include/hw/arm/arm.h |   1 +
> >  3 files changed, 108 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index c2720c8..30438f4 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -836,6 +836,14 @@ static void arm_load_kernel_notify(Notifier
> *notifier, void *data)
> >       */
> >      assert(!(info->secure_board_setup && kvm_enabled()));
> >
> > +    /* If machine is not virt, the mem_list will empty. */
> > +    if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
> > +        RAMRegion *new =3D g_new(RAMRegion, 1);
> > +        new->base =3D info->loader_start;
> > +        new->size =3D info->ram_size;
> > +        QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
> > +    }
> > +
> >      info->dtb_filename =3D qemu_opt_get(qemu_get_machine_opts(), "dtb"=
);
> >
> >      /* Load the kernel.  */
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index ddde5e1..ff334c1 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -56,6 +56,7 @@
> >  #include "hw/smbios/smbios.h"
> >  #include "qapi/visitor.h"
> >  #include "standard-headers/linux/input.h"
> > +#include "hw/vfio/vfio-common.h"
> >
> >  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> >      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> > @@ -1225,6 +1226,98 @@ void virt_machine_done(Notifier *notifier, void
> *data)
> >      virt_build_smbios(vms);
> >  }
> >
> > +static void handle_reserved_ram_region_overlap(void)
> > +{
> > +    hwaddr cur_end, next_end;
> > +    RAMRegion *reg, *next_reg, *tmp_reg;
> > +
> > +    QLIST_FOREACH(reg, &reserved_ram_regions, next) {
> > +        next_reg =3D QLIST_NEXT(reg, next);
> > +
> > +        while (next_reg && next_reg->base <=3D (reg->base + reg->size)=
) {
> > +            next_end =3D next_reg->base + next_reg->size;
> > +            cur_end =3D reg->base + reg->size;
> > +            if (next_end > cur_end) {
> > +                reg->size +=3D (next_end - cur_end);
> > +            }
> > +
> > +            tmp_reg =3D QLIST_NEXT(next_reg, next);
> > +            QLIST_REMOVE(next_reg, next);
> > +            g_free(next_reg);
> > +            next_reg =3D tmp_reg;
> > +        }
> > +    }
> > +}
>=20
> Why isn't the above integrated into the reserved ram region insertion?
>=20
> > +
> > +static void update_memory_regions(VirtMachineState *vms, hwaddr
> ram_size)
> > +{
> > +
> > +    RAMRegion *new, *reg, *last =3D NULL;
> > +    hwaddr virt_start, virt_end;
>=20
> Either need a blank line here, or to initialize virt_start/end on the
> declaration lines.
>=20
> > +    virt_start =3D vms->memmap[VIRT_MEM].base;
> > +    virt_end =3D virt_start + ram_size - 1;
> > +
> > +    handle_reserved_ram_region_overlap();
> > +
> > +    QLIST_FOREACH(reg, &reserved_ram_regions, next) {
> > +        if (reg->base >=3D virt_start && reg->base < virt_end) {
>=20
> What about the case where reg->base + reg->size > virt_start?
>=20
> > +            if (reg->base =3D=3D virt_start) {
> > +                virt_start +=3D reg->size;
>=20
> We can't move virt_start without breaking AAVMF.
>=20
> > +                virt_end +=3D reg->size;
>=20
> We can't increase virt_end without checking it against RAMLIMIT.
>=20
> > +                continue;
> > +            } else {
> > +                new =3D g_new(RAMRegion, 1);
> > +                new->base =3D virt_start;
> > +                new->size =3D reg->base - virt_start;
> > +                virt_start =3D reg->base + reg->size;
> > +            }
> > +
> > +            if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
> > +                QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
> > +            } else {
> > +                QLIST_INSERT_AFTER(last, new, next);
> > +            }
> > +
> > +            last =3D new;
> > +            ram_size -=3D new->size;
> > +            virt_end +=3D reg->size;
> > +        }
> > +    }
> > +
> > +    if (ram_size > 0) {
> > +        new =3D g_new(RAMRegion, 1);
> > +        new->base =3D virt_start;
> > +        new->size =3D ram_size;
> > +
> > +        if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
> > +            QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
> > +        } else {
> > +            QLIST_INSERT_AFTER(last, new, next);
> > +        }
> > +    }
>=20
> Where's the else? ram_size <=3D 0 is not likely something we should ignor=
e.
>=20
> > +}
> > +
> > +static void create_ram_alias(VirtMachineState *vms,
> > +                             MemoryRegion *sysmem,
> > +                             MemoryRegion *ram)
> > +{
> > +    RAMRegion *reg;
> > +    MemoryRegion *ram_memory;
> > +    char *nodename;
> > +    hwaddr sz =3D 0;
> > +
> > +    QLIST_FOREACH(reg, &vms->bootinfo.mem_list, next) {
> > +        nodename =3D g_strdup_printf("ram@%" PRIx64, reg->base);
> > +        ram_memory =3D g_new(MemoryRegion, 1);
> > +        memory_region_init_alias(ram_memory, NULL, nodename, ram, sz,
> > +                                 reg->size);
> > +        memory_region_add_subregion(sysmem, reg->base, ram_memory);
> > +        sz +=3D reg->size;
> > +
> > +        g_free(nodename);
> > +    }
> > +}
>=20
> Instead of using memory region aliases, it would be best if each RAM
> region was modeled with pc-dimms, as that would move us towards supportin=
g
> memory hotplug and allow the regions to be explicitly identified
> (start/size) on the command line - supporting migration. Actually, how
> does this series address migration? What if the host we migrate to doesn'=
t
> have the same reserved regions in sysfs?

Thanks for going through this series and comments.

I am looking into reviving this series based on the new proposed vfio iova=
=20
interface[1]. The vfio interface will now provide  a list of valid iova ran=
ges.
That means, instead of working on reserved regions to find out the valid
 memory regions, the code here will have the valid regions list directly.

The above comment of yours mentions about modelling the memory regions
with pc-dimms. If I understand that proposal correctly, in case the iova li=
st
has  multiple entries in it(means there are holes in the memory) the extra
regions has to be added as a pc-dimm slot memory. Having gone through
the Qemu source, I am not sure what is the best way to accomplish that.
(of course I am not that familiar with the Qemu source). Is it ok to invoke
qdev_device_add() from here? Any pointers on this is very appreciated.

One more point is, considering the fact that ARM64 linux kernel still doesn=
't
support hotplug memory at the moment, not sure how much we gain
from the pc-dimm model.

Please let me know your thoughts on this.

Thanks,
Shameer

[1]. https://lkml.org/lkml/2018/4/18/293


> > +
> >  static void virt_ram_memory_region_init(Notifier *notifier, void *data=
)
> >  {
> >      MachineState *machine =3D MACHINE(qdev_get_machine());
> > @@ -1232,10 +1325,15 @@ static void
> virt_ram_memory_region_init(Notifier *notifier, void *data)
> >      MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> >      VirtMachineState *vms =3D container_of(notifier, VirtMachineState,
> >                                           ram_memory_region_init);
> > +    RAMRegion *first_mem_reg;
> >
> >      memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
> >                                           machine->ram_size);
> > -    memory_region_add_subregion(sysmem, vms-
> >memmap[VIRT_MEM].base, ram);
> > +    update_memory_regions(vms, machine->ram_size);
> > +    create_ram_alias(vms, sysmem, ram);
> > +
> > +    first_mem_reg =3D QLIST_FIRST(&vms->bootinfo.mem_list);
> > +    vms->bootinfo.loader_start =3D first_mem_reg->base;
> >  }
> >
> >  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
> > @@ -1458,7 +1556,6 @@ static void machvirt_init(MachineState *machine)
> >      vms->bootinfo.initrd_filename =3D machine->initrd_filename;
> >      vms->bootinfo.nb_cpus =3D smp_cpus;
> >      vms->bootinfo.board_id =3D -1;
> > -    vms->bootinfo.loader_start =3D vms->memmap[VIRT_MEM].base;
> >      vms->bootinfo.get_dtb =3D machvirt_dtb;
> >      vms->bootinfo.firmware_loaded =3D firmware_loaded;
> >      arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
> > diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> > index ce769bd..d953026 100644
> > --- a/include/hw/arm/arm.h
> > +++ b/include/hw/arm/arm.h
> > @@ -124,6 +124,7 @@ struct arm_boot_info {
> >      bool secure_board_setup;
> >
> >      arm_endianness endianness;
> > +    QLIST_HEAD(, RAMRegion) mem_list;
> >  };
> >
> >  /**
> > --
> > 1.8.3.1
> >
> >
> >
>=20
> Thanks,
> drew
