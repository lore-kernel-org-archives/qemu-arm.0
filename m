Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6243470wrv;
        Wed, 7 Aug 2019 01:19:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4R+CWvOkG8kEFb71dTI93cWGKMrYcquPC1TXNIO9we272i/S2SB3ads35yexmFOa2VP5h
X-Received: by 2002:ac8:66c5:: with SMTP id m5mr3116768qtp.71.1565165978416;
        Wed, 07 Aug 2019 01:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565165978; cv=none;
        d=google.com; s=arc-20160816;
        b=uGCYvY2ddjY1OspRJ1kpE0auzECQlKUyCDllPS4cyZOP6y+lt57sQY+f/M1SWIBXrK
         xx6yHhaEo1FGDsX3bj/rmzqiWmJLIdyMNyGeo11zq6s2WRmzFiCwdQ+BqxupKxiKzG2q
         38lmwQF+EMQ4tmoBeDZFAb1zVRMNjR8uXCM1fbk3+UIdTu2/ypoC2S/AQLcn2pcBT8VK
         zNN2zQncFiIugxVH3ddMtZCnvTJfJhQ152QGKn+NhpeIadfk9vxiQNfL7mwDb5eNH/nW
         GPDIcU83MclnJJJyILM7NeVGLfhtiohI2Pk/Tv9uCbhNGf0mWHms3Ue1qJnItXuoRSo8
         8TKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=SD5bRsd7W4ayml0/yKU+yH1ql1rFpAq2CG0UXTij2rw=;
        b=s3AeU0TRBnmmaZ+dVC+4i1FgGRvUUwkz48jeXnrshTSOVPSrB9gKDusVtGM5jBKOG5
         VHYLpHw24k2hbDdTmWaIY3vdI5yfvi58IUXtfBGHbIVfNIDg+smbLX99M0LZCei/7f3N
         Zyg7VHmMMTV/Hq/KmMCE9+qkHtyxiSSU5FgaH/tlBy/FqoVMOghietgAVaETBW4u0ioT
         LIYRg00nxr7byzIfiITcOjacfOORiTErAH+E2bTYCTbUsw7Yn4PsDr1Adny7OLPucgpE
         yc+TJ1PrXsIkyow1liyK9hcDrQtPXqL1g1rKveap/8kilTepSmbama+3mVtAT7uDd4Qf
         aG5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si55262128qvf.122.2019.08.07.01.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 01:19:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvHAY-0001h1-03
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 04:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hvHAR-0001gn-Kk
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hvHAP-0004ev-St
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:19:31 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45431 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hvHAP-0004dY-KC; Wed, 07 Aug 2019 04:19:29 -0400
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 2D21074BF81C43DD61CA;
 Wed,  7 Aug 2019 09:19:24 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.132]) by
 lhreml704-cah.china.huawei.com ([10.201.108.45]) with mapi id 14.03.0415.000; 
 Wed, 7 Aug 2019 09:19:16 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH-for-4.2 v8 6/9] hw/arm/virt: Enable device
 memory cold/hot plug with ACPI boot
Thread-Index: AQHVTFgcgZAsgDGlxk2I68tSjBvK8KbvVrTQ
Date: Wed, 7 Aug 2019 08:19:16 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F347054@lhreml524-mbs.china.huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-7-shameerali.kolothum.thodi@huawei.com>
 <20190806150839.350a5add@redhat.com>
In-Reply-To: <20190806150839.350a5add@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v8 6/9] hw/arm/virt:
 Enable device memory cold/hot plug with ACPI boot
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LjOunsuzr53t

Hi Igor,

> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 06 August 2019 14:09
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; sameo@linux.intel.com;
> ard.biesheuvel@linaro.org; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>; shannon.zhaosl@gmail.com;
> sebastien.boeuf@intel.com; lersek@redhat.com
> Subject: Re: [Qemu-devel] [PATCH-for-4.2 v8 6/9] hw/arm/virt: Enable devi=
ce
> memory cold/hot plug with ACPI boot
=20
[...]

> > +static inline DeviceState *create_acpi_ged(VirtMachineState *vms,
> qemu_irq *pic)
> > +{
> > +    DeviceState *dev;
> > +    int irq =3D vms->irqmap[VIRT_ACPI_GED];
> > +    uint32_t event =3D ACPI_GED_MEM_HOTPLUG_EVT;
> > +
> > +    dev =3D DEVICE(object_new(TYPE_ACPI_GED));
> > +    qdev_prop_set_uint64(dev, "memhp-base",
> > +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
> > +    qdev_prop_set_uint64(dev, "ged-base",
> vms->memmap[VIRT_ACPI_GED].base);
> > +    qdev_prop_set_uint32(dev, "ged-event", event);
> > +    object_property_add_child(qdev_get_machine(), "acpi-ged",
> > +                              OBJECT(dev), NULL);
> > +    qdev_init_nofail(dev);
> > +    qdev_connect_gpio_out_named(dev, "ged-irq", 0, pic[irq]);
> > +
> > +    object_unref(OBJECT(dev));
> > +
> > +    return dev;
> > +}
>=20
> this function will need changes to accommodate for sysbus device
> init sequence [3/9].

Yes. I think we are proposing to use sysbus_mmio_map() here for "ged-base".
But what about " memhp-base"? Is it ok to invoke
acpi_memory_hotplug_init(get_system_memoty(), ...) from ged device?

Or go with _set_link() function to pass the address space ?

Thanks,
Shameer

=20
> > +
> >  static void create_its(VirtMachineState *vms, DeviceState *gicdev)
> >  {
> >      const char *itsclass =3D its_class_name();
> > @@ -1483,6 +1508,7 @@ static void machvirt_init(MachineState *machine)
> >      MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> >      bool firmware_loaded;
> >      bool aarch64 =3D true;
> > +    bool has_ged =3D !vmc->no_ged;
> >      unsigned int smp_cpus =3D machine->smp.cpus;
> >      unsigned int max_cpus =3D machine->smp.max_cpus;
> >
> > @@ -1697,6 +1723,10 @@ static void machvirt_init(MachineState
> *machine)
> >
> >      create_gpio(vms, pic);
> >
> > +    if (has_ged && aarch64 && firmware_loaded && acpi_enabled) {
> > +        vms->acpi_dev =3D create_acpi_ged(vms, pic);
> > +    }
> > +
> >      /* Create mmio transports, so the user can create virtio backends
> >       * (which will be automatically plugged in to the transports). If
> >       * no backend is created the transport will just sit harmlessly id=
le.
> > @@ -1876,27 +1906,34 @@ static const CPUArchIdList
> *virt_possible_cpu_arch_ids(MachineState *ms)
> >  static void virt_memory_pre_plug(HotplugHandler *hotplug_dev,
> DeviceState *dev,
> >                                   Error **errp)
> >  {
> > +    VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> > +    const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev),
> TYPE_NVDIMM);
> >
> > -    /*
> > -     * The device memory is not yet exposed to the Guest either throug=
h
> > -     * DT or ACPI and hence both cold/hot plug of memory is explicitly
> > -     * disabled for now.
> > -     */
> > -    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > -        error_setg(errp, "memory cold/hot plug is not yet supported");
> > +    if (is_nvdimm) {
> > +        error_setg(errp, "nvdimm is not yet supported");
> >          return;
> >      }
> >
> > +    if (!vms->acpi_dev) {
> > +        error_setg(errp, "memory hotplug is not enabled: missing acpi
> device");
> > +        return;
> > +    }
> > +
> > +    hotplug_handler_pre_plug(HOTPLUG_HANDLER(vms->acpi_dev), dev,
> errp);
> use local_error and check for error condition here. see pc_memory_pre_plu=
g()
>=20
> > +
> >      pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL,
> errp);
> >  }
> >
> >  static void virt_memory_plug(HotplugHandler *hotplug_dev,
> >                               DeviceState *dev, Error **errp)
> >  {
> > +    HotplugHandlerClass *hhc;
> >      VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
> >
> >      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), NULL);
>                                                 ^^^^
> >
> > +    hhc =3D HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
> > +    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, NULL);
>                                                       ^^^^
> why errors are ignored here, pls check for errors and propagate
> them to the caller.
>=20
> >  }
> >
> >  static void virt_machine_device_pre_plug_cb(HotplugHandler
> *hotplug_dev,
> > @@ -2102,8 +2139,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 2)
> >
> >  static void virt_machine_4_1_options(MachineClass *mc)
> >  {
> > +    VirtMachineClass *vmc =3D VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> > +
> >      virt_machine_4_2_options(mc);
> >      compat_props_add(mc->compat_props, hw_compat_4_1,
> hw_compat_4_1_len);
> > +    vmc->no_ged =3D true;
> >  }
> >  DEFINE_VIRT_MACHINE(4, 1)
> >
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index a72094204e..577ee49b4b 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -77,6 +77,8 @@ enum {
> >      VIRT_GPIO,
> >      VIRT_SECURE_UART,
> >      VIRT_SECURE_MEM,
> > +    VIRT_PCDIMM_ACPI,
> > +    VIRT_ACPI_GED,
> >      VIRT_LOWMEMMAP_LAST,
> >  };
> >
> > @@ -106,6 +108,7 @@ typedef struct {
> >      bool claim_edge_triggered_timers;
> >      bool smbios_old_sys_ver;
> >      bool no_highmem_ecam;
> > +    bool no_ged;   /* Machines < 4.2 has no support for ACPI GED devic=
e
> */
> >  } VirtMachineClass;
> >
> >  typedef struct {
> > @@ -133,6 +136,7 @@ typedef struct {
> >      uint32_t iommu_phandle;
> >      int psci_conduit;
> >      hwaddr highest_gpa;
> > +    DeviceState *acpi_dev;
> >  } VirtMachineState;
> >
> >  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM :
> VIRT_PCIE_ECAM)
> > diff --git a/tests/bios-tables-test-allowed-diff.h
> b/tests/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..7b4adbc822 100644
> > --- a/tests/bios-tables-test-allowed-diff.h
> > +++ b/tests/bios-tables-test-allowed-diff.h
> > @@ -1 +1,2 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/virt/DSDT",

