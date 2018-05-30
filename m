Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4828979wre;
        Wed, 30 May 2018 07:47:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKIeOBmDl60/jEc7TcORe3cjJihsB9/7uBlAGWVBdm2Tv8DOovwQynYbMS8CsWwYWeNiDFx
X-Received: by 2002:a0c:bfaa:: with SMTP id s39-v6mr2789040qvj.2.1527691657509;
        Wed, 30 May 2018 07:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527691657; cv=none;
        d=google.com; s=arc-20160816;
        b=j6oLtRNyuA0uWCJvzAf8NRN1YUB6C7a+/RAQXheQ2GYUfmieBg2C1loqyoCoGx9iP2
         BDEMoVs09cp6oD7NwoDMa4vvYIJE72aLCE/dgHjarmTxvbpM7IVaVZaIo+4X/0CLTYCL
         LgnzCokyBotm2UJwEQ5B4NH9pI3y7t+6VW7mC2puQ0ThanV33rOwXzQNoLGPyWsiiXta
         pl3EvRX+o3maAZB8TiTZ9e51FVPltDgrH5dzZXa6toj2SH0bUi9VBx8ceMpZ/upQj4+k
         1YHup3k8cmWDymNEUn1A7z2xdcPPk2oXZjQpsxCrKqhnQ9REnrS+lKNtOCPyzNTrav0d
         F88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=0sNy5GYn6/6f4Y9kOSGeSOkK47Y9h9u1ZY7zcmr48zc=;
        b=nTKAgdl368c0DCWSErG6FFnxA+z5ztO08YfHMxjz5e7F8wjv/B1EN02TCFF757Zf+u
         2LfF70Ugkrw9itMWVn93H0VlUDvOzkxfMv+dqwHU5Kh2RpQ3QGes62k4DtxJ5g+gTt9Q
         L44GvsCd85DqAvWlmcPOY8zFKRNUsqyhOliSV7mf88XRMEE7IeCWrUn/SrUL+hlcSMtV
         nUZObE5nOuxXLRTr2mdyk+VPrgkNpN/QKWiqfVEF+36kJnDebWpljrUR8CKVqgJb8SHm
         r6G9WZVSifSI0/XraNmpRWIiprYML/os9UUIG2+GwBnzbPClR47JLLVuwuy8Iv3oT/Gh
         efDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10-v6si6159588qvj.239.2018.05.30.07.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 07:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO2O0-0007C4-WF
	for alex.bennee@linaro.org; Wed, 30 May 2018 10:47:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2Mh-0006Rl-Vg
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:46:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2Me-00013z-1A
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:46:16 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4228 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2Md-00013W-M3; Wed, 30 May 2018 10:46:11 -0400
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 735AF3C0C19AE;
	Wed, 30 May 2018 15:46:07 +0100 (IST)
Received: from FRAEMA702-CHM.china.huawei.com (10.206.14.51) by
	lhreml703-cah.china.huawei.com (10.201.108.44) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Wed, 30 May 2018 15:46:09 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	FRAEMA702-CHM.china.huawei.com ([169.254.2.111]) with mapi id
	14.03.0382.000; Wed, 30 May 2018 16:46:00 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [RFC v2 3/6] hw/arm/virt: Add pc-dimm mem hotplug framework
Thread-Index: AQHT7SmjT2WlRv77+ka6DLGT7z11zaRFIo4AgAMYAcA=
Date: Wed, 30 May 2018 14:46:00 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8386F17D9@FRAEML521-MBX.china.huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-4-shameerali.kolothum.thodi@huawei.com>
	<1f8e3cd4-1e54-5350-3804-c77bbbfbd3e4@redhat.com>
In-Reply-To: <1f8e3cd4-1e54-5350-3804-c77bbbfbd3e4@redhat.com>
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
Subject: Re: [Qemu-arm] [RFC v2 3/6] hw/arm/virt: Add pc-dimm mem hotplug
 framework
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
X-TUID: iFFr50LN8G9i

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Monday, May 28, 2018 3:22 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> qemu-devel@nongnu.org; qemu-arm@nongnu.org
> Cc: drjones@redhat.com; imammedo@redhat.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; Zhaoshenglong <zhaoshenglong@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>; Linuxarm
> <linuxarm@huawei.com>
> Subject: Re: [RFC v2 3/6] hw/arm/virt: Add pc-dimm mem hotplug framework
>=20
> Hi Shameer,
>=20
> On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> > This will be used in subsequent patches to model a chunk of
> > memory as pc-dimm(cold plug) if the valid iova regions are
> > non-contiguous. This is not yet a full hotplug support.
> Please can you give more details about this restriction?
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  default-configs/aarch64-softmmu.mak |  1 +
> >  hw/arm/virt.c                       | 82
> +++++++++++++++++++++++++++++++++++++
> >  include/hw/arm/virt.h               |  2 +
> >  3 files changed, 85 insertions(+)
> >
> > diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarc=
h64-
> softmmu.mak
> > index 9ddccf8..7a82ed8 100644
> > --- a/default-configs/aarch64-softmmu.mak
> > +++ b/default-configs/aarch64-softmmu.mak
> > @@ -8,3 +8,4 @@ CONFIG_DDC=3Dy
> >  CONFIG_DPCD=3Dy
> >  CONFIG_XLNX_ZYNQMP=3Dy
> >  CONFIG_XLNX_ZYNQMP_ARM=3Dy
> > +CONFIG_MEM_HOTPLUG=3Dy
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 05fcb62..be3ad14 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1552,9 +1552,82 @@ static const CPUArchIdList
> *virt_possible_cpu_arch_ids(MachineState *ms)
> >      return ms->possible_cpus;
> >  }
> >
> > +static void virt_dimm_plug(HotplugHandler *hotplug_dev,
> > +                         DeviceState *dev, Error **errp)
> > +{
> > +    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> > +    PCDIMMDevice *dimm =3D PC_DIMM(dev);
> > +    PCDIMMDeviceClass *ddc =3D PC_DIMM_GET_CLASS(dimm);
> > +    MemoryRegion *mr;
> > +    uint64_t align;
> > +    Error *local_err =3D NULL;
> > +
> > +    mr =3D ddc->get_memory_region(dimm, &local_err);
> > +    if (local_err) {
> > +        goto out;
> > +    }
> > +
> > +    align =3D memory_region_get_alignment(mr);
> I see that on PC machine class they have an "enforce_aligned_dimm"
> option. Also looks memory_region_get_alignment(mr) can return 0.
>=20
> if (memory_region_get_alignment(mr) && pcmc->enforce_aligned_dimm) {

Ok.
=20
>=20
> > +    pc_dimm_memory_plug(dev, &vms->hotplug_memory, mr, align,
> &local_err);
> > +    if (local_err) {
> > +        goto out;
> > +    }
> useless block and error_propagate does nothing if local_err is NULL so
> we are fine.

Ok. I will remove this from this patch.

> > +
> > +out:
> > +    error_propagate(errp, local_err);
> > +}
> > +
> > +static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
> > +                           DeviceState *dev, Error **errp)
> > +{
> > +    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> > +    PCDIMMDevice *dimm =3D PC_DIMM(dev);
> > +    PCDIMMDeviceClass *ddc =3D PC_DIMM_GET_CLASS(dimm);
> > +    MemoryRegion *mr;
> > +    Error *local_err =3D NULL;
> > +
> > +    mr =3D ddc->get_memory_region(dimm, &local_err);
> don't you want to avoid executing the following if local_err?

True.

> > +    pc_dimm_memory_unplug(dev, &vms->hotplug_memory, mr);
> needs a rebase on top of "pc-dimm: no need to pass the memory region"
> in master pc_dimm_memory_unplug we now have
>  MemoryRegion *mr =3D ddc->get_memory_region(dimm, &error_abort);

Right. I will follow that then.

> Thanks
>=20
> Eric
> > +    object_unparent(OBJECT(dev));
> > +
> > +    error_propagate(errp, local_err);
> > +}
> > +
> > +static void virt_machinedevice_plug_cb(HotplugHandler *hotplug_dev,
> > +                                      DeviceState *dev, Error **errp)
> > +{
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > +        virt_dimm_plug(hotplug_dev, dev, errp);
> > +    } else {
> > +        error_setg(errp, "device plug request for not supported device=
"
> > +                   " type: %s", object_get_typename(OBJECT(dev)));
> > +    }
> > +}
> > +
> > +static void virt_machinedevice_unplug_cb(HotplugHandler *hotplug_dev,
> > +                                        DeviceState *dev, Error **errp=
)
> > +{
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > +        virt_dimm_unplug(hotplug_dev, dev, errp);
> > +    } else {
> > +        error_setg(errp, "device unplug for not supported device"
> > +                   " type: %s", object_get_typename(OBJECT(dev)));
> > +    }
> > +}
> > +
> > +static HotplugHandler *virt_get_hotplug_handler(MachineState *machine,
> > +                                             DeviceState *dev)
> > +{
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > +        return HOTPLUG_HANDLER(machine);
> > +    }
> > +    return NULL;
> > +}
> > +
> >  static void virt_machine_class_init(ObjectClass *oc, void *data)
> >  {
> >      MachineClass *mc =3D MACHINE_CLASS(oc);
> > +    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
> >
> >      mc->init =3D machvirt_init;
> >      /* Start max_cpus at the maximum QEMU supports. We'll further rest=
rict
> > @@ -1573,6 +1646,11 @@ static void virt_machine_class_init(ObjectClass
> *oc, void *data)
> >      mc->cpu_index_to_instance_props =3D virt_cpu_index_to_props;
> >      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15");
> >      mc->get_default_cpu_node_id =3D virt_get_default_cpu_node_id;
> > +
> > +    mc->get_hotplug_handler =3D virt_get_hotplug_handler;
> This requires a rebase on top of Igor's  and David's series.
>=20
Sure.

Thanks,
Shameer

> Thanks
>=20
> Eric
> > +    hc->plug =3D virt_machinedevice_plug_cb;
> > +    hc->unplug =3D virt_machinedevice_unplug_cb;
> > +
> >  }
> >
> >  static const TypeInfo virt_machine_info =3D {
> > @@ -1582,6 +1660,10 @@ static const TypeInfo virt_machine_info =3D {
> >      .instance_size =3D sizeof(VirtMachineState),
> >      .class_size    =3D sizeof(VirtMachineClass),
> >      .class_init    =3D virt_machine_class_init,
> > +    .interfaces =3D (InterfaceInfo[]) {
> > +         { TYPE_HOTPLUG_HANDLER },
> > +         { }
> > +    },
> >  };
> >
> >  static void machvirt_machine_init(void)
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index fc24f3a..a39f29e 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -35,6 +35,7 @@
> >  #include "qemu/notify.h"
> >  #include "hw/boards.h"
> >  #include "hw/arm/arm.h"
> > +#include "hw/mem/pc-dimm.h"
> >
> >  #define NUM_GICV2M_SPIS       64
> >  #define NUM_VIRTIO_TRANSPORTS 32
> > @@ -108,6 +109,7 @@ typedef struct {
> >      uint32_t gic_phandle;
> >      uint32_t msi_phandle;
> >      int psci_conduit;
> > +    MemoryHotplugState hotplug_memory;
> >  } VirtMachineState;
> >
> >  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> >
