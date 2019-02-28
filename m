Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp536015wrx;
        Thu, 28 Feb 2019 04:45:00 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbHLTfQ+DcVHUnWEyi6xNam1BcM/6CpS5WsnKXiQL3V6M0OAwd3CoJA3XEnTjnwvkMyQz0m
X-Received: by 2002:a25:c886:: with SMTP id y128mr6423408ybf.250.1551357900168;
        Thu, 28 Feb 2019 04:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551357900; cv=none;
        d=google.com; s=arc-20160816;
        b=DYddE1bWh3EsTPiVCWQ1HHf+QDnbFAqE9063mFB+AbfhS4oWJL1huJ9XfLCnoETQOn
         /Z+b0vOVFlJ7Uc5uaPUk/PiihSzc2hvsXLb88Z/i1ELq/i40HcknkoVZrpjizpuCiWsp
         99F1EVgyVh1C4kj7cphY425JUI2EicGgXWupTaVTJOlItstTBPEDKu+Q60HLbGYVvVvO
         EkDBd7oADT+7kOKcbDnaknQuPSunTD2qBHS3pFPAW6IPf3r72RgaxmAVqnOc5fRb0eXv
         iPkUlIkU4imO4xPFNteUiVnTEaQvIsqQ2XTSy/mXYL7Odxm9w54ZJgqbMrbhx8NUkwwQ
         d+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=tfNxPVF23F4D4UhuSTYPd6Oz7e9wRlrqkvKjOg08gU4=;
        b=WaY3KBtYwVDIxVYBaoDlk0FUl4MJvRyKNST/TOocD/3NM1MfFBVf5MnuLiK5YYktvr
         VRmhx4D2IAqDUAVuBb7wERZk+sekXGrusLlYK0pY+yYIlScU8rggifLRXC1oGN3alyVY
         a5CS43wvUrK31K7jYHIf6Ow6vP4ng3vt/Mn8cMnkIWLAXFakAaGf04Iw37BsufM5sCW/
         ZxQjDL2wBgf/wgO/NURYhvT7DW8WgNw8PSFWg4iz0cyxfsolR6BhLgXoCa7SZ5sXUW/0
         QRfWTuSoYU4XO6mylFEZ1ITVtYdNIC0yZs3wvvIcRXD/78MPsfh9VV2Uk5oMevbv8hCO
         GW4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14si10760425ywa.187.2019.02.28.04.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 04:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzL3b-0006AE-J8
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 07:44:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzL3N-00068V-92
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 07:44:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzL3L-0008R3-8t
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 07:44:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzL3K-0008OU-UQ; Thu, 28 Feb 2019 07:44:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6CDAC0842D1;
	Thu, 28 Feb 2019 12:44:34 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E69445D707;
	Thu, 28 Feb 2019 12:44:30 +0000 (UTC)
Date: Thu, 28 Feb 2019 13:44:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190228134429.5b804533@redhat.com>
In-Reply-To: <61d04463-c237-eabb-18f1-3c8e49a87885@redhat.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-4-shameerali.kolothum.thodi@huawei.com>
	<20190227181412.2a69a926@redhat.com>
	<61d04463-c237-eabb-18f1-3c8e49a87885@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 28 Feb 2019 12:44:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/4] hw/arm/virt: Enable
 pc-dimm hotplug support
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
Cc: peter.maydell@linaro.org, linuxarm@huawei.com,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, xuwei5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9snHJnaiExf3

On Thu, 28 Feb 2019 10:57:41 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 2/27/19 6:14 PM, Igor Mammedov wrote:
> > On Mon, 28 Jan 2019 11:05:45 +0000
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >   
> >> pc-dimm memory hotplug is enabled using GPIO(Pin 2) based ACPI
> >> event. Hot removal functionality is not yet supported.
> >>
> >> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> >> ---
> >>  hw/arm/virt.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 55 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 884960d..cf64554 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -62,6 +62,7 @@
> >>  #include "hw/mem/pc-dimm.h"
> >>  #include "hw/mem/nvdimm.h"
> >>  #include "hw/acpi/acpi.h"
> >> +#include "hw/acpi/pc-hotplug.h"
> >>  
> >>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> >>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> >> @@ -1651,7 +1652,14 @@ static void machvirt_init(MachineState *machine)
> >>          nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
> >>                                 vms->fw_cfg, OBJECT(vms));
> >>      }
> >> +    if (vms->acpi_memhp_state.is_enabled) {
> >> +        MemHotplugState *state =  &vms->acpi_memhp_state;
> >> +        hwaddr base;
> >>  
> >> +        state->hw_reduced_acpi = true;
> >> +        base = vms->memmap[VIRT_ACPI_IO].base + ACPI_MEMORY_HOTPLUG_BASE;
> >> +        acpi_memory_hotplug_init(sysmem, OBJECT(vms), state, base);
> >> +    }  
> > this hunk should be a part of 'acpi' device that owns respective interrupts and mmio regions.
> > (something like we do in x86)
> > In this case I'd suggest to make 'base' its property and the board will set it during
> > device creation.
> >   
> >>      vms->bootinfo.ram_size = machine->ram_size;
> >>      vms->bootinfo.kernel_filename = machine->kernel_filename;
> >>      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
> >> @@ -1819,6 +1827,20 @@ static void virt_set_nvdimm_persistence(Object *obj, const char *value,
> >>      nvdimm_state->persistence_string = g_strdup(value);
> >>  }
> >>  
> >> +static bool virt_get_memhp_support(Object *obj, Error **errp)
> >> +{
> >> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >> +
> >> +    return vms->acpi_memhp_state.is_enabled;
> >> +}
> >> +
> >> +static void virt_set_memhp_support(Object *obj, bool value, Error **errp)
> >> +{
> >> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> >> +
> >> +    vms->acpi_memhp_state.is_enabled = value;
> >> +}
> >> +
> >>  static CpuInstanceProperties
> >>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> >>  {
> >> @@ -1863,8 +1885,8 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >>      const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
> >>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> >>  
> >> -    if (dev->hotplugged) {
> >> -        error_setg(errp, "memory hotplug is not supported");
> >> +    if (dev->hotplugged && is_nvdimm) {
> >> +        error_setg(errp, "nvdimm hotplug is not supported");
> >>      }
> >>  
> >>      if (is_nvdimm && !vms->acpi_nvdimm_state.is_enabled) {
> >> @@ -1875,6 +1897,22 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >>      pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
> >>  }
> >>  
> >> +static void virt_memhp_send_event(HotplugHandler *hotplug_dev, DeviceState *dev,
> >> +                                  Error **errp)
> >> +{
> >> +    DeviceState *gpio_dev;
> >> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> >> +
> >> +    gpio_dev = virt_get_gpio_dev(GPIO_PCDIMM);
> >> +    if (!gpio_dev) {
> >> +        error_setg(errp, "No dev interface to send hotplug event");  
> >                              ^^^^^^ confusing  
> >> +        return;
> >> +    }
> >> +    acpi_memory_plug_cb(hotplug_dev, &vms->acpi_memhp_state,
> >> +                        dev, errp);
> >> +    qemu_set_irq(qdev_get_gpio_in(gpio_dev, 0), 1);
> >> +}
> >> +
> >>  static void virt_memory_plug(HotplugHandler *hotplug_dev,
> >>                               DeviceState *dev, Error **errp)
> >>  {
> >> @@ -1891,6 +1929,10 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
> >>          nvdimm_plug(&vms->acpi_nvdimm_state);
> >>      }
> >>  
> >> +    if (dev->hotplugged && !is_nvdimm) {
> >> +        virt_memhp_send_event(hotplug_dev, dev, errp);  
> > ...
> >   acpi_memory_plug_cb();
> >   hotplug_handler_plug(HOTPLUG_HANDLER(pcms->gpio_dev), dev, &error_abort);
> >   ^^^^ forward snd process hotplug notification event in gpio_dev,
> >        machine should not care about which and how to deal with random IRQs
> >   
> >> +    }
> >> +
> >>  out:
> >>      error_propagate(errp, local_err);
> >>  }
> >> @@ -1898,6 +1940,11 @@ out:
> >>  static void virt_memory_unplug(HotplugHandler *hotplug_dev,
> >>                                 DeviceState *dev, Error **errp)
> >>  {
> >> +    if (dev->hotplugged) {
> >> +        error_setg(errp, "memory hot unplug is not supported");
> >> +        return;
> >> +    }  
> > what if unplug is called on cold-plugged device?
> > 
> > Better way to disable mgmt initiated unplug is to forbid it in unplug_request()
> > For guest initiated one ('unplug' handler), the best we can do is log error
> > and ignore it (provided guest won't get in confused). it's also possible 
> > to hide _EJ method and then it would be even fine to abort if it gets here,
> > since guest is not supposed to interface with MMIO interface without using AML.  
> I don't understand the guest initiated unplug handling. How does it
> differ from x86 handling as we are using the same dynamic methods?
The only differences I'm aware of, should be event delivery mechanism and
using MMIO vs IO. Otherwise it's the same as described in
docs/specs/acpi_mem_hotplug.txt

> Besides In ARM case I checked
> /sys/devices/system/memory/memoryX/removable state for cold-plugged and
> hot-plugged DIMMs and it is equal to 0. I don't know if it is a
> limitation of the guest or a bug in our ACPI description somewhere. I
> would not be surprised if hot-unplug is not supported at kernel leve
> though.
enabling mhp_acpi_foo trace events might help to check what's going on,
and a dump of ACPI tables too (SRAT + DSDT).

It's quite possible that kernel doesn't support unplug yet, all I care at
the moment is to make sure that we won't have cross-version compatibility
issues when kernel gets there so we won't have to add and support compat
knobs later on.

> Thanks
> 
> Eric
> >   
> >> +
> >>      pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
> >>      object_unparent(OBJECT(dev));
> >>  }
> >> @@ -2085,6 +2132,12 @@ static void virt_instance_init(Object *obj)
> >>                                      "Set NVDIMM persistence"
> >>                                      "Valid values are cpu and mem-ctrl", NULL);
> >>  
> >> +    vms->acpi_memhp_state.is_enabled = true;
> >> +    object_property_add_bool(obj, "memory-hotplug-support",
> >> +                             virt_get_memhp_support,
> >> +                             virt_set_memhp_support,
> >> +                             NULL);
> >> +
> >>      vms->irqmap = a15irqmap;
> >>  }
> >>    
> >   

