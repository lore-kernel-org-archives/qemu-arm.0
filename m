Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp621695wrq;
        Tue, 5 Jun 2018 00:50:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKICTYVaclddAZMZ0rXHj7oAj3Zlo1+Cj8tQc/uLFfG0X1qgn1q9q5b98ezW5dPFO8eJifhl
X-Received: by 2002:ae9:e118:: with SMTP id g24-v6mr20849826qkm.99.1528185014914;
        Tue, 05 Jun 2018 00:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528185014; cv=none;
        d=google.com; s=arc-20160816;
        b=O2/NLRaQcFWx9KNTDcJQNHU+ekmv7Ndo/E//QQJUWZPY1OYRI1kDQabYZTg6jw1KXd
         mzOkxPPeX38eHU/unpVJYn0/CUqrCPkB6oKOaNYnFSF8KsyaF7E1kwyNSJxYtbxsD7P+
         H6EIxf124rp9gc/fJOdmNso7WaNvHAQ7xB1xy/vxyvMTmKg9TAoHA1DU0pjQetOsB7p5
         VKZsaZbD57ryZcM19g85OoKFSpb0eXvLlOXzOKocpkDG+M5V9T1UCU/QZsZOQv0bdfNM
         hoS0eRVdN5WOZacKZYVndS7lyLmTR1LjIVmbagjDZVNdiAjOgn2ufv+tWqQCbT1fNSlS
         KagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :references:message-id:date:thread-index:thread-topic:to:from
         :arc-authentication-results;
        bh=m0fJNXpkheQaPOMeGrvuIfpISdB9v+vf1qoKqFAdVW8=;
        b=X+yZsrU+rYNLzLN2zJXVfqkj7ieH01BCnLWeXOXhDYQtHH2/THYNXB5z0QiBA1aW2H
         jeJYGRyJH2zwxW+22DsJ9UGCXWloixniEEa5pfdK9VyMzUIbeSw7G2ZmZ4ZsXcc2tqjy
         61mC6lTcgey7Vl0gXGUplLuvE653TMnJpJf2mZn6Ff3DHEBjXdleZXCBADWo1xxCvI+L
         3ZB12R+Q12ZiyslFAdID3X7h8WFq+9q6iod76KMVEGg851+4iL57q0C80tynLq4AsS9k
         pm/Z7btW1aEg+/Fsp5/XP+pPbSGMvh1slKlsfEFZZvVApjw09NzvkzuNVSEiRe+ue/eZ
         RJtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i7-v6si3477208qvg.131.2018.06.05.00.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 00:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQ6jO-0003ox-Ct
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 03:50:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fQ6jA-0003kk-6K
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 03:50:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fQ6j6-0000Uk-Sx
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 03:50:00 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4245 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fQ6j6-0000T8-GF; Tue, 05 Jun 2018 03:49:56 -0400
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id B14448A0BDA50;
	Tue,  5 Jun 2018 08:49:48 +0100 (IST)
Received: from FRAEMA708-CHM.china.huawei.com (10.206.14.57) by
	lhreml705-cah.china.huawei.com (10.201.108.46) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Tue, 5 Jun 2018 08:49:50 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	FRAEMA708-CHM.china.huawei.com ([169.254.8.193]) with mapi id
	14.03.0382.000; Tue, 5 Jun 2018 09:49:44 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [RFC v2 6/6] hw/arm: Populate non-contiguous memory regions
Thread-Index: AQHT7Smp6QHgsUaqbU6E/UX/WhtxEaRFIoCAgAMh+zCACSM+IA==
Date: Tue, 5 Jun 2018 07:49:44 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8386F6E04@FRAEML521-MBX.china.huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-7-shameerali.kolothum.thodi@huawei.com>
	<bd67ed40-81d6-58dc-ccaf-efd8a40ca96f@redhat.com> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.226.52]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.213.3.17
Subject: Re: [Qemu-arm] [RFC v2 6/6] hw/arm: Populate non-contiguous memory
 regions
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
	"drjones@redhat.com" <drjones@redhat.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8auQDY3WJImS

Hi Drew,

> -----Original Message-----
> From: Shameerali Kolothum Thodi
> Sent: 30 May 2018 15:49
> To: 'Auger Eric' <eric.auger@redhat.com>; qemu-devel@nongnu.org; qemu-
> arm@nongnu.org
> Cc: drjones@redhat.com; imammedo@redhat.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; Zhaoshenglong <zhaoshenglong@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>; Linuxarm
> <linuxarm@huawei.com>
> Subject: RE: [RFC v2 6/6] hw/arm: Populate non-contiguous memory regions
>=20
>=20
>=20
> > -----Original Message-----
> > From: Auger Eric [mailto:eric.auger@redhat.com]
> > Sent: Monday, May 28, 2018 3:22 PM
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> > qemu-devel@nongnu.org; qemu-arm@nongnu.org
> > Cc: drjones@redhat.com; imammedo@redhat.com;
> peter.maydell@linaro.org;
> > alex.williamson@redhat.com; Zhaoshenglong
> <zhaoshenglong@huawei.com>;
> > Jonathan Cameron <jonathan.cameron@huawei.com>; Linuxarm
> > <linuxarm@huawei.com>
> > Subject: Re: [RFC v2 6/6] hw/arm: Populate non-contiguous memory region=
s
> >
> > Hi Shameer,
> >
> > On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> > > In case valid iova regions are non-contiguous, split the
> > > RAM mem into a 1GB non-pluggable dimm and remaining as a
> > > single pc-dimm mem.
> >
> > Please can you explain where does this split come from? Currently we
> > have 254 GB non pluggable RAM. I read the discussion started with Drew
> > on RFC v1 where he explained we cannot change the RAM base without
> > crashing the FW. However we should at least document this  1GB split.
>=20
> The comments were mainly to use the pc-dimm model instead of "mem alias"
> method used on RFC v1 as this will help to add the mem hot-plug support
> in future.
>=20
> I am not sure about the motive behind Drew's idea of splitting the first
> 1GB as non-plug and remaining as a pc-dimm(cold). May it is to attempt a
> best effort scenario, but as I mentioned in reply to 0/6, the current sol=
ution
> will end up changing the base address if the 0x4000000 falls under a rese=
rved
> region.
>=20
> Again, not sure whether we should enforce a strict check on base address
> start or just warn the user that it will fail on Guest with UEFI boot[1].
>=20
> Hi Drew,
>=20
> Please let me know your thoughts on this.

Could you please take a look at the above discussion and let us
know your thoughts on the split of mem regions as 1GB non-pluggable
and rest as pc-dimm.

Thanks,
Shameer
=20
> > > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > >  hw/arm/virt.c | 261
> > ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 256 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index be3ad14..562e389 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -58,6 +58,12 @@
> > >  #include "hw/smbios/smbios.h"
> > >  #include "qapi/visitor.h"
> > >  #include "standard-headers/linux/input.h"
> > > +#include "hw/vfio/vfio-common.h"
> > > +#include "qemu/config-file.h"
> > > +#include "monitor/qdev.h"
> > > +#include "qom/object_interfaces.h"
> > > +#include "qapi/qmp/qdict.h"
> > > +#include "qemu/option.h"
> >
> > The comment at the beginning of virt.c would need to be reworked with
> > your changes.
>=20
> Ok.
>=20
> > >  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> > >      static void virt_##major##_##minor##_class_init(ObjectClass *oc,=
 \
> > > @@ -110,7 +116,10 @@ static ARMPlatformBusSystemParams
> > platform_bus_params;
> > >   * terabyte of physical address space.)
> > >   */
> > >  #define RAMLIMIT_GB 255
> > > -#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> > > +#define SZ_1G (1024ULL * 1024 * 1024)
> > > +#define RAMLIMIT_BYTES (RAMLIMIT_GB * SZ_1G)
> > > +
> > > +#define ALIGN_1G (1ULL << 30)
> > >
> > >  /* Addresses and sizes of our components.
> > >   * 0..128MB is space for a flash device so we can run bootrom code s=
uch as
> > UEFI.
> > > @@ -1171,6 +1180,236 @@ void virt_machine_done(Notifier *notifier,
> void
> > *data)
> > >      virt_build_smbios(vms);
> > >  }
> > >
> > > +static void free_iova_copy(struct vfio_iova_head *iova_copy)
> > > +{
> > > +    VFIOIovaRange *iova, *tmp;
> > > +
> > > +    QLIST_FOREACH_SAFE(iova, iova_copy, next, tmp) {
> > > +        QLIST_REMOVE(iova, next);
> > > +        g_free(iova);
> > > +    }
> > > +}
> > > +
> > > +static void get_iova_copy(struct vfio_iova_head *iova_copy)
> > > +{
> > > +    VFIOIovaRange *iova, *new, *prev_iova =3D NULL;
> > > +
> > > +    QLIST_FOREACH(iova, &vfio_iova_regions, next) {
> > > +        new =3D g_malloc0(sizeof(*iova));
> > > +        new->start =3D iova->start;
> > > +        new->end =3D iova->end;
> > > +
> > > +        if (prev_iova) {
> > > +            QLIST_INSERT_AFTER(prev_iova, new, next);
> > > +        } else {
> > > +            QLIST_INSERT_HEAD(iova_copy, new, next);
> > > +        }
> > > +        prev_iova =3D new;
> > > +    }
> > > +}
> > > +
> > > +static hwaddr find_memory_chunk(VirtMachineState *vms,
> > > +                   struct vfio_iova_head *iova_copy,
> > > +                   hwaddr req_size, bool pcdimm)
> > > +{
> > > +    VFIOIovaRange *iova, *tmp;
> > > +    hwaddr new_start, new_size, sz_align;
> > > +    hwaddr virt_start =3D vms->memmap[VIRT_MEM].base;
> > > +    hwaddr addr_align =3D ALIGN_1G; /* Set to max ARM64 hugepage siz=
e */
> > > +
> > > +    /* Size alignment */
> > > +    sz_align =3D (pcdimm) ? MAX(TARGET_PAGE_SIZE,
> > QEMU_VMALLOC_ALIGN) :
> > > +                                                      TARGET_PAGE_SI=
ZE;
> > > +
> > > +    QLIST_FOREACH_SAFE(iova, iova_copy, next, tmp) {
> > > +        if (virt_start >=3D iova->end) {
> > > +            continue;
> > > +        }
> > > +
> > > +        /* Align addr */
> > > +        new_start =3D ROUND_UP(MAX(virt_start, iova->start), addr_al=
ign);
> > > +        if (new_start >=3D iova->end) {
> > > +            continue;
> > > +        }
> > > +
> > > +        if (req_size > iova->end - new_start + 1) {
> > > +            continue;
> > > +        }
> > don't you want to check directly with new_size?
>=20
> Yes. I think that should do.
>=20
> > > +
> > > +        /*
> > > +         * Check the region can hold any size alignment requirement.
> > > +         */
> > > +        new_size =3D QEMU_ALIGN_UP(req_size, sz_align);
> > > +
> > > +        if ((new_start + new_size - 1 > iova->end) ||
> > > +                 (new_start + new_size >=3D virt_start + RAMLIMIT_BY=
TES)) {
> > > +            continue;
> > > +        }
> > > +
> > > +        /*
> > > +         * Modify the iova list entry for non pc-dimm case so that i=
t
> > > +         * is not used again for pc-dimm allocation.
> > > +         */
> > > +        if (!pcdimm) {
> > > +            if (new_size - req_size) {
> > I don't get this check, Don't you want to check the node's range is
> > fully consumed and in the positive remove the node?
> >
> > (new_size !=3D iova->end - iova-> start + 1)
>=20
> Hmm..looks like I missed that.
>=20
> > > +                iova->start =3D new_start + new_size;
> > > +            } else {
> > > +                QLIST_REMOVE(iova, next);
> > > +            }
> > > +        }
> > > +        return new_start;
> > > +    }
> > > +
> > > +    return -1;
> > > +}
> > > +
> > > +static void update_memory_regions(VirtMachineState *vms)
> > > +{
> > > +    hwaddr addr;
> > > +    VFIOIovaRange *iova;
> > > +    MachineState *machine =3D MACHINE(vms);
> > > +    hwaddr virt_start =3D vms->memmap[VIRT_MEM].base;
> > > +    hwaddr req_size, ram_size =3D machine->ram_size;
> > > +    struct vfio_iova_head iova_copy =3D QLIST_HEAD_INITIALIZER(iova_=
copy);
> > > +
> > > +    /* No valid iova regions, use default */
> > > +    if (QLIST_EMPTY(&vfio_iova_regions)) {
> > > +        vms->bootinfo.loader_start =3D vms->memmap[VIRT_MEM].base;
> > > +        vms->bootinfo.ram_size =3D ram_size;
> > > +        return;
> > > +    }
> > > +
> > > +    /*
> > > +     * If valid iovas has only one entry, check the req size fits in
> > > +     * and can have the loader start < 4GB. This will make sure plat=
forms
> > > +     * with no holes in mem will have the same mem model as before.
> > > +     */
> > > +    req_size =3D ram_size;
> > > +    iova =3D QLIST_NEXT(QLIST_FIRST(&vfio_iova_regions), next);
> > > +    if (!iova) {
> > > +        iova =3D QLIST_FIRST(&vfio_iova_regions);
> > > +        addr =3D ROUND_UP(MAX(virt_start, iova->start), ALIGN_1G);
> > > +        if ((addr < 4 * SZ_1G) && (ram_size <=3D iova->end - addr + =
1) &&
> > > +                  (addr + ram_size < virt_start + RAMLIMIT_BYTES)) {
> > > +            vms->bootinfo.loader_start =3D addr;
> > > +            vms->bootinfo.ram_size =3D ram_size;
> > > +            return;
> > > +        }
> > > +    }
> > > +
> > > +    /* Get a copy of valid iovas and work on it */
> > > +    get_iova_copy(&iova_copy);
> > > +
> > > +    /* Split the mem as first 1GB non-pluggable and rest as pc-dimm =
*/
> > > +    req_size =3D MIN(ram_size, SZ_1G);
> > > +    addr =3D find_memory_chunk(vms, &iova_copy, req_size, false);
> > According to what Drew reported, the base address of the cold-plug RAM
> > must stay at 1GB otherwise the FW will be lost. So I think you must
> > check the addr =3D 1GB
>=20
> Please see my above comment on the base address.
>=20
> > > +    if (addr =3D=3D -1 || addr >=3D 4 * SZ_1G) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    /*Update non-pluggable mem details */
> > > +    machine->ram_size =3D req_size;
> > > +    vms->bootinfo.loader_start =3D addr;
> > > +    vms->bootinfo.ram_size =3D machine->ram_size;
> > > +
> > > +    req_size =3D ram_size - req_size;
> > > +    if (!req_size) {
> > > +        goto done;
> > > +    }
> > > +
> > > +    /* Remaining memory is modeled as a pc-dimm. */
> > > +    addr =3D find_memory_chunk(vms, &iova_copy, req_size, true);
> > > +    if (addr =3D=3D -1) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    /*Update pc-dimm mem details */
> > > +    vms->bootinfo.dimm_mem =3D g_new(struct dimm_mem_info, 1);
> > > +    vms->bootinfo.dimm_mem->base =3D addr;
> > > +    vms->bootinfo.dimm_mem->size =3D req_size;
> > > +    machine->maxram_size =3D machine->ram_size + req_size;
> > > +    machine->ram_slots +=3D 1;
> > > +
> > > +done:
> > > +    free_iova_copy(&iova_copy);
> > > +    return;
> > > +
> > > +out:
> > > +    free_iova_copy(&iova_copy);
> > > +    error_report("mach-virt: Not enough contiguous memory to model
> ram");
> > Output the requested size would help debug (and maybe the available IOV=
A
> > ranges)
>=20
> Agree. I will change that.
>=20
> Thanks,
> Shameer
>=20
> [1]
> https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/ArmVirtQemu.dsc
> #L133
>=20
> > Thanks
> >
> > Eric
> > > +    exit(1);
> > > +}
> > > +
> > > +static void create_pcdimms(VirtMachineState *vms,
> > > +                             MemoryRegion *sysmem,
> > > +                             MemoryRegion *ram)
> > > +{
> > > +    hwaddr addr, size;
> > > +    Error *local_err =3D NULL;
> > > +    QDict *qdict;
> > > +    QemuOpts *opts;
> > > +    char *tmp;
> > > +
> > > +    if (!vms->bootinfo.dimm_mem) {
> > > +        return;
> > > +    }
> > > +
> > > +    addr =3D vms->bootinfo.dimm_mem->base;
> > > +    size =3D vms->bootinfo.dimm_mem->size;
> > > +
> > > +    /*Create hotplug address space */
> > > +    vms->hotplug_memory.base =3D ROUND_UP(addr, ALIGN_1G);
> > > +    size =3D ROUND_UP(size, MAX(TARGET_PAGE_SIZE,
> > QEMU_VMALLOC_ALIGN));
> > > +
> > > +    memory_region_init(&vms->hotplug_memory.mr, OBJECT(vms),
> > > +                                      "hotplug-memory", size);
> > > +    memory_region_add_subregion(sysmem, vms->hotplug_memory.base,
> > > +                                        &vms->hotplug_memory.mr);
> > > +    /* Create backend mem object */
> > > +    qdict =3D qdict_new();
> > > +    qdict_put_str(qdict, "qom-type", "memory-backend-ram");
> > > +    qdict_put_str(qdict, "id", "mem1");
> > > +    tmp =3D g_strdup_printf("%"PRIu64 "M", size / (1024 * 1024));
> > > +    qdict_put_str(qdict, "size", tmp);
> > > +    g_free(tmp);
> > > +
> > > +    opts =3D qemu_opts_from_qdict(qemu_find_opts("object"), qdict,
> > &local_err);
> > > +    if (local_err) {
> > > +        goto err;
> > > +    }
> > > +
> > > +    user_creatable_add_opts(opts, &local_err);
> > > +    qemu_opts_del(opts);
> > > +    QDECREF(qdict);
> > > +    if (local_err) {
> > > +        goto err;
> > > +    }
> > > +
> > > +    /* Create pc-dimm dev*/
> > > +    qdict =3D qdict_new();
> > > +    qdict_put_str(qdict, "driver", "pc-dimm");
> > > +    qdict_put_str(qdict, "id", "dimm1");
> > > +    qdict_put_str(qdict, "memdev", "mem1");
> > > +
> > > +    opts =3D qemu_opts_from_qdict(qemu_find_opts("device"), qdict,
> > &local_err);
> > > +    if (local_err) {
> > > +        goto err;
> > > +    }
> > > +
> > > +    qdev_device_add(opts, &local_err);
> > > +    qemu_opts_del(opts);
> > > +    QDECREF(qdict);
> > > +    if (local_err) {
> > > +        goto err;
> > > +    }
> > > +
> > > +    return;
> > > +
> > > +err:
> > > +    error_report_err(local_err);
> > > +    exit(1);
> > > +}
> > > +
> > >  static void virt_ram_memory_region_init(Notifier *notifier, void *da=
ta)
> > >  {
> > >      MemoryRegion *sysmem =3D get_system_memory();
> > > @@ -1179,9 +1418,14 @@ static void
> virt_ram_memory_region_init(Notifier
> > *notifier, void *data)
> > >                                           ram_memory_region_init);
> > >      MachineState *machine =3D MACHINE(vms);
> > >
> > > +    update_memory_regions(vms);
> > >      memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
> > >                                           machine->ram_size);
> > > -    memory_region_add_subregion(sysmem, vms-
> > >memmap[VIRT_MEM].base, ram);
> > > +    memory_region_add_subregion(sysmem, vms->bootinfo.loader_start,
> > ram);
> > > +
> > > +    if (vms->bootinfo.dimm_mem) {
> > > +        create_pcdimms(vms, sysmem, ram);
> > > +    }
> > >  }
> > >
> > >  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
> > > @@ -1404,13 +1648,11 @@ static void machvirt_init(MachineState
> > *machine)
> > >      vms->machine_done.notify =3D virt_machine_done;
> > >      qemu_add_machine_init_done_notifier(&vms->machine_done);
> > >
> > > -    vms->bootinfo.ram_size =3D machine->ram_size;
> > >      vms->bootinfo.kernel_filename =3D machine->kernel_filename;
> > >      vms->bootinfo.kernel_cmdline =3D machine->kernel_cmdline;
> > >      vms->bootinfo.initrd_filename =3D machine->initrd_filename;
> > >      vms->bootinfo.nb_cpus =3D smp_cpus;
> > >      vms->bootinfo.board_id =3D -1;
> > > -    vms->bootinfo.loader_start =3D vms->memmap[VIRT_MEM].base;
> > >      vms->bootinfo.get_dtb =3D machvirt_dtb;
> > >      vms->bootinfo.firmware_loaded =3D firmware_loaded;
> > >
> > > @@ -1559,7 +1801,7 @@ static void virt_dimm_plug(HotplugHandler
> > *hotplug_dev,
> > >      PCDIMMDevice *dimm =3D PC_DIMM(dev);
> > >      PCDIMMDeviceClass *ddc =3D PC_DIMM_GET_CLASS(dimm);
> > >      MemoryRegion *mr;
> > > -    uint64_t align;
> > > +    uint64_t align, addr;
> > >      Error *local_err =3D NULL;
> > >
> > >      mr =3D ddc->get_memory_region(dimm, &local_err);
> > > @@ -1573,6 +1815,15 @@ static void virt_dimm_plug(HotplugHandler
> > *hotplug_dev,
> > >          goto out;
> > >      }
> > >
> > > +    addr =3D object_property_get_uint(OBJECT(dimm),
> > PC_DIMM_ADDR_PROP,
> > > +                                                       &error_fatal)=
;
> > > +    /* Assign the node for pc-dimm initial ram */
> > > +    if (vms->bootinfo.dimm_mem && (addr =3D=3D vms->bootinfo.dimm_me=
m-
> > >base)
> > > +                                                 && (nb_numa_nodes >=
 0)) {
> > > +        vms->bootinfo.dimm_mem->node =3D
> > object_property_get_uint(OBJECT(dev),
> > > +                                           PC_DIMM_NODE_PROP, &error=
_fatal);
> > > +    }
> > > +
> > >  out:
> > >      error_propagate(errp, local_err);
> > >  }
> > >
