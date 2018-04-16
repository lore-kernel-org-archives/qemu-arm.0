Received: by 10.28.4.212 with SMTP id 203csp2389257wme;
        Mon, 16 Apr 2018 01:19:51 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49HOhsEi4YKr06r34iKOH+/z5FQKRIV4mE6SdQ+yXV6FkJyGkbR71PyCbSXU4mnO3yKx6q2
X-Received: by 10.200.44.67 with SMTP id e3mr14566835qta.21.1523866790927;
        Mon, 16 Apr 2018 01:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523866790; cv=none;
        d=google.com; s=arc-20160816;
        b=NlFH8amk1o/iD3E+3ye4uBopGH+Xj5Co5hrwH3AWg6g//qoAX7kKhdYtK1LRk5Lfg2
         nMP2hX8+rqdmnrSL/e0R30RKODxDHiwIofdFimcDSXL6ntPn6l83nZZlqbP0BCyTQvcX
         l/UFeSlhPjDxJ+R0bkdqWz1vDY5/Qyuw45JtT4Sp74nvHNP292IH8vuzgvOx/P4eTj0Z
         +rrDL2zJT+5+moR+F+P5iXyA99qXA14dq3GueWb8wNmX0Kd2y/sgjqX3gbI2q7ut3Zvg
         pk00ercaEk89X9zbdwwtUzOVRIe20yVsLdQtmZQBi+vK2kg+PTicUEQUTUVsiNSTDB16
         SofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=t/q9njNFr8GuXDs3SLVNfjbwpA1IptMnk/GyBMQ8NeE=;
        b=orR28RN+TekptVZTNmWWhfZZiU9HSM5GYZV1lv26Za3ST65ZVq9p15AQtpMLcwXca9
         C38WSGaVn991onl4saW8Rphbd90ZFRA7xqaxEzpsL2OcB+G46CDG+hDRif4VSwMBYmTF
         aB+YnLbBqX252BKOI3pioIz+In/8MynVVmxQYSBBQsPcipqbXlDmVWhAUEyJ+Ps+KXF6
         Xs9zQB991dkoU3RahCK6NMtn/VMx1sDDAoC+EpoEKlG/4KycQ3yX5ehMf/cVfIdFdjuQ
         yV2ISRLyEvTao27aSTF60j7jwg0bYsg565f+5/b/W184nMCmQNb8yj1ycA2Ll4iwWzpf
         bxLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q91si1453302qtd.371.2018.04.16.01.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 01:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f7zMZ-0001rw-95
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 04:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f7zMN-0001qN-B7
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 04:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f7zMK-0006kV-Js
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 04:19:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54954 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f7zMK-0006kF-CM; Mon, 16 Apr 2018 04:19:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B43F84257;
	Mon, 16 Apr 2018 08:19:22 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 106E72024CA9;
	Mon, 16 Apr 2018 08:19:15 +0000 (UTC)
Date: Mon, 16 Apr 2018 10:19:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20180416101914.1184e90e@redhat.com>
In-Reply-To: <20180416024355.GA20551@umbus.fritz.box>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
	<1523551221-11612-3-git-send-email-imammedo@redhat.com>
	<20180416024355.GA20551@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 16 Apr 2018 08:19:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 16 Apr 2018 08:19:22 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-2.13 2/4] platform-bus-device: use device
 plug callback instead of machine_done notifier
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
Cc: peter.maydell@linaro.org, agraf@suse.de, qemu-devel@nongnu.org,
	eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /mYt2tnTzEwh

On Mon, 16 Apr 2018 12:43:55 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Thu, Apr 12, 2018 at 06:40:19PM +0200, Igor Mammedov wrote:
> > platform-bus were using machine_done notifier to get and map
> > (assign irq/mmio resources) dynamically added sysbus devices
> > after all '-device' options had been processed.
> > That however creates non obvious dependencies on ordering of
> > machine_done notifiers and requires carefull line juggling
> > to keep it working. For example see comment above
> > create_platform_bus() and 'straitforward' arm_load_kernel()
> > had to converted to machine_done notifier and that lead to
> > yet another machine_done notifier to keep it working
> > arm_register_platform_bus_fdt_creator().
> > 
> > Instead of hiding resource assignment in platform-bus-device
> > to magically initialize sysbus devices, use device plug
> > callback and assign resources explicitly at board level
> > at the moment each -device option is being processed.
> > 
> > That adds a bunch of machine declaration boiler plate to
> > e500plat board, similar to ARM/x86 but gets rid of hidden
> > machine_done notifier and would allow to remove the dependent
> > notifiers in ARM code simplifying it and making code flow
> > easier to follow.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: agraf@suse.de
> > CC: david@gibson.dropbear.id.au
> > CC: qemu-ppc@nongnu.org
> > ---
> >  hw/ppc/e500.h             |  3 +++
> >  include/hw/arm/virt.h     |  3 +++
> >  include/hw/platform-bus.h |  4 ++--
> >  hw/arm/sysbus-fdt.c       |  3 ---
> >  hw/arm/virt.c             | 36 ++++++++++++++++++++++++++++
> >  hw/core/platform-bus.c    | 29 ++++-------------------
> >  hw/ppc/e500.c             | 37 +++++++++++++++++------------
> >  hw/ppc/e500plat.c         | 60 +++++++++++++++++++++++++++++++++++++++++++++--
> >  8 files changed, 129 insertions(+), 46 deletions(-)
> > 
> > diff --git a/hw/ppc/e500.h b/hw/ppc/e500.h
> > index 70ba1d8..d0f8ddd 100644
> > --- a/hw/ppc/e500.h
> > +++ b/hw/ppc/e500.h
> > @@ -2,6 +2,7 @@
> >  #define PPCE500_H
> >  
> >  #include "hw/boards.h"
> > +#include "hw/sysbus.h"
> >  
> >  typedef struct PPCE500Params {
> >      int pci_first_slot;
> > @@ -26,6 +27,8 @@ typedef struct PPCE500Params {
> >  
> >  void ppce500_init(MachineState *machine, PPCE500Params *params);
> >  
> > +void ppce500_plug_dynamic_sysbus_device(SysBusDevice *sbdev);
> > +
> >  hwaddr booke206_page_size_to_tlb(uint64_t size);
> >  
> >  #endif
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index ba0c1a4..5535760 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -86,11 +86,14 @@ typedef struct {
> >      bool no_pmu;
> >      bool claim_edge_triggered_timers;
> >      bool smbios_old_sys_ver;
> > +    HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> > +                                           DeviceState *dev);
> >  } VirtMachineClass;
> >  
> >  typedef struct {
> >      MachineState parent;
> >      Notifier machine_done;
> > +    DeviceState *platform_bus_dev;
> >      FWCfgState *fw_cfg;
> >      bool secure;
> >      bool highmem;
> > diff --git a/include/hw/platform-bus.h b/include/hw/platform-bus.h
> > index a00775c..19e20c5 100644
> > --- a/include/hw/platform-bus.h
> > +++ b/include/hw/platform-bus.h
> > @@ -37,8 +37,6 @@ typedef struct PlatformBusDevice PlatformBusDevice;
> >  struct PlatformBusDevice {
> >      /*< private >*/
> >      SysBusDevice parent_obj;
> > -    Notifier notifier;
> > -    bool done_gathering;
> >  
> >      /*< public >*/
> >      uint32_t mmio_size;
> > @@ -54,4 +52,6 @@ int platform_bus_get_irqn(PlatformBusDevice *platform_bus, SysBusDevice *sbdev,
> >  hwaddr platform_bus_get_mmio_addr(PlatformBusDevice *pbus, SysBusDevice *sbdev,
> >                                    int n);
> >  
> > +void platform_bus_link_device(PlatformBusDevice *pbus, SysBusDevice *sbdev);
> > +
> >  #endif /* HW_PLATFORM_BUS_H */
> > diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> > index d68e3dc..80ff70e 100644
> > --- a/hw/arm/sysbus-fdt.c
> > +++ b/hw/arm/sysbus-fdt.c
> > @@ -506,9 +506,6 @@ static void add_all_platform_bus_fdt_nodes(ARMPlatformBusFDTParams *fdt_params)
> >      dev = qdev_find_recursive(sysbus_get_default(), TYPE_PLATFORM_BUS_DEVICE);
> >      pbus = PLATFORM_BUS_DEVICE(dev);
> >  
> > -    /* We can only create dt nodes for dynamic devices when they're ready */
> > -    assert(pbus->done_gathering);
> > -
> >      PlatformBusFDTData data = {
> >          .fdt = fdt,
> >          .irq_start = irq_start,
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 94dcb12..2e10d8b 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1087,6 +1087,7 @@ static void create_platform_bus(VirtMachineState *vms, qemu_irq *pic)
> >      qdev_prop_set_uint32(dev, "mmio_size",
> >          platform_bus_params.platform_bus_size);
> >      qdev_init_nofail(dev);
> > +    vms->platform_bus_dev = dev;
> >      s = SYS_BUS_DEVICE(dev);
> >  
> >      for (i = 0; i < platform_bus_params.platform_bus_num_irqs; i++) {
> > @@ -1536,9 +1537,37 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >      return ms->possible_cpus;
> >  }
> >  
> > +static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> > +                                        DeviceState *dev, Error **errp)
> > +{
> > +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> > +
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> > +        if (vms->platform_bus_dev) {
> > +            platform_bus_link_device(PLATFORM_BUS_DEVICE(vms->platform_bus_dev),
> > +                                     SYS_BUS_DEVICE(dev));
> > +        }
> > +    }
> > +}
> > +
> > +static HotplugHandler *virt_machine_get_hotpug_handler(MachineState *machine,
> > +                                                       DeviceState *dev)
> > +{
> > +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
> > +
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> > +        return HOTPLUG_HANDLER(machine);
> > +    }
> > +
> > +    return vmc->get_hotplug_handler ?
> > +        vmc->get_hotplug_handler(machine, dev) : NULL;
> > +}
> > +
> >  static void virt_machine_class_init(ObjectClass *oc, void *data)
> >  {
> >      MachineClass *mc = MACHINE_CLASS(oc);
> > +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(oc);
> > +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
> >  
> >      mc->init = machvirt_init;
> >      /* Start max_cpus at the maximum QEMU supports. We'll further restrict
> > @@ -1557,6 +1586,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
> >      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
> >      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> >      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> > +    vmc->get_hotplug_handler = mc->get_hotplug_handler;
> > +    mc->get_hotplug_handler = virt_machine_get_hotpug_handler;
> > +    hc->plug = virt_machine_device_plug_cb;
> >  }
> >  
> >  static const TypeInfo virt_machine_info = {
> > @@ -1566,6 +1598,10 @@ static const TypeInfo virt_machine_info = {
> >      .instance_size = sizeof(VirtMachineState),
> >      .class_size    = sizeof(VirtMachineClass),
> >      .class_init    = virt_machine_class_init,
> > +    .interfaces = (InterfaceInfo[]) {
> > +         { TYPE_HOTPLUG_HANDLER },
> > +         { }
> > +    },
> >  };
> >  
> >  static void machvirt_machine_init(void)
> > diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
> > index 33d32fb..807cb5c 100644
> > --- a/hw/core/platform-bus.c
> > +++ b/hw/core/platform-bus.c
> > @@ -103,7 +103,6 @@ static void plaform_bus_refresh_irqs(PlatformBusDevice *pbus)
> >  {
> >      bitmap_zero(pbus->used_irqs, pbus->num_irqs);
> >      foreach_dynamic_sysbus_device(platform_bus_count_irqs, pbus);
> > -    pbus->done_gathering = true;
> >  }
> >  
> >  static void platform_bus_map_irq(PlatformBusDevice *pbus, SysBusDevice *sbdev,
> > @@ -163,12 +162,11 @@ static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
> >  }
> >  
> >  /*
> > - * For each sysbus device, look for unassigned IRQ lines as well as
> > - * unassociated MMIO regions. Connect them to the platform bus if available.
> > + * Look for unassigned IRQ lines as well as unassociated MMIO regions.
> > + * Connect them to the platform bus if available.
> >   */
> > -static void link_sysbus_device(SysBusDevice *sbdev, void *opaque)
> > +void platform_bus_link_device(PlatformBusDevice *pbus, SysBusDevice *sbdev)
> >  {
> > -    PlatformBusDevice *pbus = opaque;
> >      int i;
> >  
> >      for (i = 0; sysbus_has_irq(sbdev, i); i++) {
> > @@ -180,19 +178,6 @@ static void link_sysbus_device(SysBusDevice *sbdev, void *opaque)
> >      }
> >  }
> >  
> > -static void platform_bus_init_notify(Notifier *notifier, void *data)
> > -{
> > -    PlatformBusDevice *pb = container_of(notifier, PlatformBusDevice, notifier);
> > -
> > -    /*
> > -     * Generate a bitmap of used IRQ lines, as the user might have specified
> > -     * them on the command line.
> > -     */
> > -    plaform_bus_refresh_irqs(pb);
> > -
> > -    foreach_dynamic_sysbus_device(link_sysbus_device, pb);
> > -}
> > -
> >  static void platform_bus_realize(DeviceState *dev, Error **errp)
> >  {
> >      PlatformBusDevice *pbus;
> > @@ -211,12 +196,8 @@ static void platform_bus_realize(DeviceState *dev, Error **errp)
> >          sysbus_init_irq(d, &pbus->irqs[i]);
> >      }
> >  
> > -    /*
> > -     * Register notifier that allows us to gather dangling devices once the
> > -     * machine is completely assembled
> > -     */
> > -    pbus->notifier.notify = platform_bus_init_notify;
> > -    qemu_add_machine_init_done_notifier(&pbus->notifier);
> > +    /* some devices might be initialized before so update used IRQs map */
> > +    plaform_bus_refresh_irqs(pbus);
> >  }
> >  
> >  static Property platform_bus_properties[] = {
> > diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> > index 9a85a41..e2829db 100644
> > --- a/hw/ppc/e500.c
> > +++ b/hw/ppc/e500.c
> > @@ -64,6 +64,8 @@
> >  #define MPC8XXX_GPIO_OFFSET        0x000FF000ULL
> >  #define MPC8XXX_GPIO_IRQ           47
> >  
> > +static SysBusDevice *pbus_dev;  
> 
> I'm not thrilled about adding a new global for information that really
> belongs in the machine state.  Although I do recognize that adding an
> actual MachineState subtype that didn't previously exist is a bit of a pain.
yep, adding MachineState seemed too much for the task that's why I've used global.
I can switch to actual MachineState here if you'd prefer it.


> >  struct boot_info
> >  {
> >      uint32_t dt_base;
> > @@ -248,23 +250,28 @@ static void platform_bus_create_devtree(PPCE500Params *params, void *fdt,
> >      dev = qdev_find_recursive(sysbus_get_default(), TYPE_PLATFORM_BUS_DEVICE);
> >      pbus = PLATFORM_BUS_DEVICE(dev);
> >  
> > -    /* We can only create dt nodes for dynamic devices when they're ready */
> > -    if (pbus->done_gathering) {
> > -        PlatformDevtreeData data = {
> > -            .fdt = fdt,
> > -            .mpic = mpic,
> > -            .irq_start = irq_start,
> > -            .node = node,
> > -            .pbus = pbus,
> > -        };
> > +    /* Create dt nodes for dynamic devices */
> > +    PlatformDevtreeData data = {
> > +        .fdt = fdt,
> > +        .mpic = mpic,
> > +        .irq_start = irq_start,
> > +        .node = node,
> > +        .pbus = pbus,
> > +    };
> >  
> > -        /* Loop through all dynamic sysbus devices and create nodes for them */
> > -        foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data);
> > -    }
> > +    /* Loop through all dynamic sysbus devices and create nodes for them */
> > +    foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data);
> >  
> >      g_free(node);
> >  }
> >  
> > +void ppce500_plug_dynamic_sysbus_device(SysBusDevice *sbdev)
> > +{
> > +    if (pbus_dev) {
> > +        platform_bus_link_device(PLATFORM_BUS_DEVICE(pbus_dev), sbdev);
> > +    }
> > +}
> > +
> >  static int ppce500_load_device_tree(MachineState *machine,
> >                                      PPCE500Params *params,
> >                                      hwaddr addr,
> > @@ -945,16 +952,16 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
> >          qdev_prop_set_uint32(dev, "num_irqs", params->platform_bus_num_irqs);
> >          qdev_prop_set_uint32(dev, "mmio_size", params->platform_bus_size);
> >          qdev_init_nofail(dev);
> > -        s = SYS_BUS_DEVICE(dev);
> > +        pbus_dev = SYS_BUS_DEVICE(dev);
> >  
> >          for (i = 0; i < params->platform_bus_num_irqs; i++) {
> >              int irqn = params->platform_bus_first_irq + i;
> > -            sysbus_connect_irq(s, i, qdev_get_gpio_in(mpicdev, irqn));
> > +            sysbus_connect_irq(pbus_dev, i, qdev_get_gpio_in(mpicdev, irqn));
> >          }
> >  
> >          memory_region_add_subregion(address_space_mem,
> >                                      params->platform_bus_base,
> > -                                    sysbus_mmio_get_region(s, 0));
> > +                                    sysbus_mmio_get_region(pbus_dev, 0));
> >      }
> >  
> >      /*
> > diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
> > index 81d03e1..2f014cc 100644
> > --- a/hw/ppc/e500plat.c
> > +++ b/hw/ppc/e500plat.c
> > @@ -60,8 +60,49 @@ static void e500plat_init(MachineState *machine)
> >      ppce500_init(machine, &params);
> >  }
> >  
> > -static void e500plat_machine_init(MachineClass *mc)
> > +typedef struct {
> > +    MachineClass parent;
> > +    HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> > +                                           DeviceState *dev);
> > +} E500PlatMachineClass;
> > +
> > +#define TYPE_E500PLAT_MACHINE  MACHINE_TYPE_NAME("ppce500")
> > +#define E500PLAT_MACHINE_GET_CLASS(obj) \
> > +    OBJECT_GET_CLASS(E500PlatMachineClass, obj, TYPE_E500PLAT_MACHINE)
> > +#define E500PLAT_MACHINE_CLASS(klass) \
> > +    OBJECT_CLASS_CHECK(E500PlatMachineClass, klass, TYPE_E500PLAT_MACHINE)
> > +
> > +static void e500plat_machine_device_plug_cb(HotplugHandler *hotplug_dev,
> > +                                            DeviceState *dev, Error **errp)
> >  {
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> > +        ppce500_plug_dynamic_sysbus_device(SYS_BUS_DEVICE(dev));
> > +    }
> > +}
> > +
> > +static
> > +HotplugHandler *e500plat_machine_get_hotpug_handler(MachineState *machine,
> > +                                                    DeviceState *dev)
> > +{
> > +    E500PlatMachineClass *emc = E500PLAT_MACHINE_GET_CLASS(machine);
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
> > +        return HOTPLUG_HANDLER(machine);
> > +    }
> > +
> > +    return emc->get_hotplug_handler ?
> > +        emc->get_hotplug_handler(machine, dev) : NULL;
> > +}
> > +
> > +static void e500plat_machine_class_init(ObjectClass *oc, void *data)
> > +{
> > +    E500PlatMachineClass *emc = E500PLAT_MACHINE_CLASS(oc);
> > +    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
> > +    MachineClass *mc = MACHINE_CLASS(oc);
> > +
> > +    emc->get_hotplug_handler = mc->get_hotplug_handler;
> > +    mc->get_hotplug_handler = e500plat_machine_get_hotpug_handler;  
> 
> I'm pretty sure the parent type will never have a handler, so I'm not
> sure this is really necessary.
It seems that only PC machine handles chain correctly while other
targets /spapr,s390x/ don't.

Perhaps we should just drop caching original
MachineClass::get_hotplug_handler (which is NULL) everywhere
so it will be consistent across boards.
If we ever need chaining here, we could add it then and do
it consistently for every board that uses it.
 
> > +    hc->plug = e500plat_machine_device_plug_cb;
> > +
> >      mc->desc = "generic paravirt e500 platform";
> >      mc->init = e500plat_init;
> >      mc->max_cpus = 32;
> > @@ -69,4 +110,19 @@ static void e500plat_machine_init(MachineClass *mc)
> >      mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
> >  }
> >  
> > -DEFINE_MACHINE("ppce500", e500plat_machine_init)
> > +static const TypeInfo e500plat_info = {
> > +    .name          = TYPE_E500PLAT_MACHINE,
> > +    .parent        = TYPE_MACHINE,
> > +    .class_size    = sizeof(E500PlatMachineClass),
> > +    .class_init    = e500plat_machine_class_init,
> > +    .interfaces    = (InterfaceInfo[]) {
> > +         { TYPE_HOTPLUG_HANDLER },
> > +         { }
> > +    }
> > +};
> > +
> > +static void e500plat_register_types(void)
> > +{
> > +    type_register_static(&e500plat_info);
> > +}
> > +type_init(e500plat_register_types)  
> 

