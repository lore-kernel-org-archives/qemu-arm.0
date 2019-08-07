Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6291031wrv;
        Wed, 7 Aug 2019 02:15:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKvkuOqCn1aS4Fxr+tHH5zN1ovoRw/ZED/yFUBoiqgZjlpZCvtZp1R5EHm3ra2nh4nZynO
X-Received: by 2002:a0c:8910:: with SMTP id 16mr7064180qvp.55.1565169344053;
        Wed, 07 Aug 2019 02:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565169344; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcNeXM3PupEC7/sxzWO/j4SCsPXox5WspTlOtpvzISIJJ5zlcwO/DEjEW5nC5Iwya0
         9YzAWsG1dp8WMZ+oHRTMxF/PdJOqIiQMRCXug0rJen1YahBGa+ZV9PNtKX3enNLLBADR
         aZK+QumoGvWtmk58oBXaIGLuTrHH2sfJzJbWvgq0i4jIPxD/8+K/fu8ehWXh4gVnU1EM
         T+2iHGzVzAeCTepw/NuKdMTloT5vpnBiXXY9+kUTOVyHX7CwijIGxwNO7bA1ySbO9k4L
         2zOMwjYiMIWguH4995TFuUg1JZrDkeZLfhXu/U0Y0ndATlvnC48zm38IGlNxnfJ8o/Gb
         jG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=zRTzGgoDsL3sjovyqC0GsRwkPVJl2OQ3vW8BEfML3To=;
        b=ROkf4/H+2pkRRAmX+XipqZRPRr5WjIfNgEnDzqG84L9MJeaZocpEtcPAqW4NRxLnKT
         Se6PuCiVB0eyAZzk1zpCpQ5fFgpnh6WQcB9+c6n5hC0ZoBRLebMUG6rEZoXTJHGzVtZD
         +M6IlrUBaSNtplS2QI+F1lRP0IeK6REINIWt6lTw4D99H0zuN3qPFqWXavTnF9KONPVu
         b7uF6/7fYJ48vCAAqkA/LW9ljAJfcbZVHxQWZTdYv7FTVbJJ3E/KQGeoJgWqoDnZ2B1Y
         Mq18ZPYhZpg3434JxvSaf6KD76eJGD0yUmzHgYUW4yN5wpQyBSauUhUf0ht2g/QMbP3M
         DH4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si46301089qkc.61.2019.08.07.02.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 02:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvI2o-0000rr-Hu
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 05:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52468)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hvI2c-0000rT-Ap
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 05:15:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hvI2a-0005CI-S7
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 05:15:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53256)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hvI2a-0005Bk-J7; Wed, 07 Aug 2019 05:15:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DCD4030BEBE8;
 Wed,  7 Aug 2019 09:15:26 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBBAA600C6;
 Wed,  7 Aug 2019 09:15:21 +0000 (UTC)
Date: Wed, 7 Aug 2019 11:15:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190807111520.40592817@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83F347054@lhreml524-mbs.china.huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-7-shameerali.kolothum.thodi@huawei.com>
 <20190806150839.350a5add@redhat.com>
 <5FC3163CFD30C246ABAA99954A238FA83F347054@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 07 Aug 2019 09:15:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-TUID: q0ywnmDnSyH9

On Wed, 7 Aug 2019 08:19:16 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi Igor,
> 
> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: 06 August 2019 14:09
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org; sameo@linux.intel.com;
> > ard.biesheuvel@linaro.org; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> > <xuwei5@huawei.com>; shannon.zhaosl@gmail.com;
> > sebastien.boeuf@intel.com; lersek@redhat.com
> > Subject: Re: [Qemu-devel] [PATCH-for-4.2 v8 6/9] hw/arm/virt: Enable device
> > memory cold/hot plug with ACPI boot  
>  
> [...]
> 
> > > +static inline DeviceState *create_acpi_ged(VirtMachineState *vms,  
> > qemu_irq *pic)  
> > > +{
> > > +    DeviceState *dev;
> > > +    int irq = vms->irqmap[VIRT_ACPI_GED];
> > > +    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
> > > +
> > > +    dev = DEVICE(object_new(TYPE_ACPI_GED));
> > > +    qdev_prop_set_uint64(dev, "memhp-base",
> > > +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
> > > +    qdev_prop_set_uint64(dev, "ged-base",  
> > vms->memmap[VIRT_ACPI_GED].base);  
> > > +    qdev_prop_set_uint32(dev, "ged-event", event);
> > > +    object_property_add_child(qdev_get_machine(), "acpi-ged",
> > > +                              OBJECT(dev), NULL);
> > > +    qdev_init_nofail(dev);
> > > +    qdev_connect_gpio_out_named(dev, "ged-irq", 0, pic[irq]);
> > > +
> > > +    object_unref(OBJECT(dev));
> > > +
> > > +    return dev;
> > > +}  
> > 
> > this function will need changes to accommodate for sysbus device
> > init sequence [3/9].  
> 
> Yes. I think we are proposing to use sysbus_mmio_map() here for "ged-base".
> But what about " memhp-base"? Is it ok to invoke
> acpi_memory_hotplug_init(get_system_memoty(), ...) from ged device?
no it's not ok.

One could expose container memory region as sysbus mmio and then put
ged-io and AcpiGedState::memhp_state::io within it.
something like:

        board:
            sysbus_mmio_map(ged, 0 /* io_contaner number */, ged-base)     

        ged_initfn()
            register io_container as sysbus mmio region

        ged_realize()
            memory_region_add_subregion(&ged->io_container, 0, &ged_st->io);
            acpi_memory_hotplug_init(&ged->io_container,, &ged->acpi_memory_hotplug, AFTER_GED_IO_OFFSET)
    
that would make GED's MMIO available to guest at ged-base and memhp IO
will be available at address after it.
You can go even further (more flexible) and register ged_st->io as separate
sysbus mmio and use a container exclusively for memhp, in this case you'd be
able to map memhp io from board independently from ged-base.


> Or go with _set_link() function to pass the address space ?
> 
> Thanks,
> Shameer
> 
>  
> > > +
> > >  static void create_its(VirtMachineState *vms, DeviceState *gicdev)
> > >  {
> > >      const char *itsclass = its_class_name();
> > > @@ -1483,6 +1508,7 @@ static void machvirt_init(MachineState *machine)
> > >      MemoryRegion *ram = g_new(MemoryRegion, 1);
> > >      bool firmware_loaded;
> > >      bool aarch64 = true;
> > > +    bool has_ged = !vmc->no_ged;
> > >      unsigned int smp_cpus = machine->smp.cpus;
> > >      unsigned int max_cpus = machine->smp.max_cpus;
> > >
> > > @@ -1697,6 +1723,10 @@ static void machvirt_init(MachineState  
> > *machine)  
> > >
> > >      create_gpio(vms, pic);
> > >
> > > +    if (has_ged && aarch64 && firmware_loaded && acpi_enabled) {
> > > +        vms->acpi_dev = create_acpi_ged(vms, pic);
> > > +    }
> > > +
> > >      /* Create mmio transports, so the user can create virtio backends
> > >       * (which will be automatically plugged in to the transports). If
> > >       * no backend is created the transport will just sit harmlessly idle.
> > > @@ -1876,27 +1906,34 @@ static const CPUArchIdList  
> > *virt_possible_cpu_arch_ids(MachineState *ms)  
> > >  static void virt_memory_pre_plug(HotplugHandler *hotplug_dev,  
> > DeviceState *dev,  
> > >                                   Error **errp)
> > >  {
> > > +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> > > +    const bool is_nvdimm = object_dynamic_cast(OBJECT(dev),  
> > TYPE_NVDIMM);  
> > >
> > > -    /*
> > > -     * The device memory is not yet exposed to the Guest either through
> > > -     * DT or ACPI and hence both cold/hot plug of memory is explicitly
> > > -     * disabled for now.
> > > -     */
> > > -    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > > -        error_setg(errp, "memory cold/hot plug is not yet supported");
> > > +    if (is_nvdimm) {
> > > +        error_setg(errp, "nvdimm is not yet supported");
> > >          return;
> > >      }
> > >
> > > +    if (!vms->acpi_dev) {
> > > +        error_setg(errp, "memory hotplug is not enabled: missing acpi  
> > device");  
> > > +        return;
> > > +    }
> > > +
> > > +    hotplug_handler_pre_plug(HOTPLUG_HANDLER(vms->acpi_dev), dev,  
> > errp);
> > use local_error and check for error condition here. see pc_memory_pre_plug()
> >   
> > > +
> > >      pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL,  
> > errp);  
> > >  }
> > >
> > >  static void virt_memory_plug(HotplugHandler *hotplug_dev,
> > >                               DeviceState *dev, Error **errp)
> > >  {
> > > +    HotplugHandlerClass *hhc;
> > >      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> > >
> > >      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), NULL);  
> >                                                 ^^^^  
> > >
> > > +    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
> > > +    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, NULL);  
> >                                                       ^^^^
> > why errors are ignored here, pls check for errors and propagate
> > them to the caller.
> >   
> > >  }
> > >
> > >  static void virt_machine_device_pre_plug_cb(HotplugHandler  
> > *hotplug_dev,  
> > > @@ -2102,8 +2139,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 2)
> > >
> > >  static void virt_machine_4_1_options(MachineClass *mc)
> > >  {
> > > +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> > > +
> > >      virt_machine_4_2_options(mc);
> > >      compat_props_add(mc->compat_props, hw_compat_4_1,  
> > hw_compat_4_1_len);  
> > > +    vmc->no_ged = true;
> > >  }
> > >  DEFINE_VIRT_MACHINE(4, 1)
> > >
> > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > index a72094204e..577ee49b4b 100644
> > > --- a/include/hw/arm/virt.h
> > > +++ b/include/hw/arm/virt.h
> > > @@ -77,6 +77,8 @@ enum {
> > >      VIRT_GPIO,
> > >      VIRT_SECURE_UART,
> > >      VIRT_SECURE_MEM,
> > > +    VIRT_PCDIMM_ACPI,
> > > +    VIRT_ACPI_GED,
> > >      VIRT_LOWMEMMAP_LAST,
> > >  };
> > >
> > > @@ -106,6 +108,7 @@ typedef struct {
> > >      bool claim_edge_triggered_timers;
> > >      bool smbios_old_sys_ver;
> > >      bool no_highmem_ecam;
> > > +    bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device  
> > */  
> > >  } VirtMachineClass;
> > >
> > >  typedef struct {
> > > @@ -133,6 +136,7 @@ typedef struct {
> > >      uint32_t iommu_phandle;
> > >      int psci_conduit;
> > >      hwaddr highest_gpa;
> > > +    DeviceState *acpi_dev;
> > >  } VirtMachineState;
> > >
> > >  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM :  
> > VIRT_PCIE_ECAM)  
> > > diff --git a/tests/bios-tables-test-allowed-diff.h  
> > b/tests/bios-tables-test-allowed-diff.h  
> > > index dfb8523c8b..7b4adbc822 100644
> > > --- a/tests/bios-tables-test-allowed-diff.h
> > > +++ b/tests/bios-tables-test-allowed-diff.h
> > > @@ -1 +1,2 @@
> > >  /* List of comma-separated changed AML files to ignore */
> > > +"tests/data/acpi/virt/DSDT",  
> 

