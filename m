Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp385727wrx;
        Thu, 28 Feb 2019 01:58:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbFfq4OgjyndWPCnIQHYiY1IHTFGQHQndbDGwzmS2b4yGLSsDP9xp7NQhRVT48My998hrKz
X-Received: by 2002:a25:23c7:: with SMTP id j190mr5961309ybj.434.1551347938373;
        Thu, 28 Feb 2019 01:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551347938; cv=none;
        d=google.com; s=arc-20160816;
        b=sZp0GM80b6yhkpc9DfjgUhbpIn10GBLl7mnCYBLSPLmEiKErLDfPzwRjKZk9f68pAh
         +h7i3JRoUv30cht8AQYkcMhUutQoXsCg9vGX8Xia6lxBnInIex6Ypn8oPS7OzTwa74TX
         THpy7CV1p6UoHuckkvhVMXJfhYrGEYCbzGiSNtNcPYWR232qIKAstcS7FPOrHZXBI/9n
         2GCwI2IkI7e1ULkkdZWpoHix3D8rr4D3cO1YI9QjufIfVPd0kTTuHqdDNhn0Vh3sab4L
         biaI/YJ5uxPgiyLxu2MMlDUs5cP4zvp91cCOuG7tuGoFoqtwUbY+zL5zwCq5EyHvwhnl
         M39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=c3D0s2QsxrXDHg8lu4Kvj8CB//lhyh1eITr3y3YQQN4=;
        b=vPp8mTh/OZDseqYxU1yD/MR8p9kHYCy3w6JJGbSZ4ZDbdjDBuphyGYa1dTOj6h15q5
         px8WIjbXMAiVSHLZ6nwir0UTXjRRIZs9EjXK4WcBses2FXPzZN33vZi3kh0V7DmVujNG
         D4kYLvzys/Ug0h6Gm0qKi7jMyODb2GRsdhk4JSkE9MczsUmW9JzSXbUzrRPeqqbrDVDE
         UFsu02LBQ4ngwB70n3oIs4s6Jatj/L38NnvCV1HwWMcyM7j/avOe5orznoiQVA6B5LV1
         vga7CL9fHTZXDtKXM1R6ozLlmQexiO1VOkgz+JZ5a1ZQn982MI7wKzD7t9XqOuJw1se2
         SQIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k126si4274824yba.357.2019.02.28.01.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 01:58:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzISs-0007Fm-Bq
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 04:58:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzISg-0007Er-Sy
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 04:58:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzIS2-0004rX-0a
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 04:58:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38741)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzIRz-0004pd-Cz; Thu, 28 Feb 2019 04:58:00 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62B61315FB5;
	Thu, 28 Feb 2019 09:57:45 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E68B718012;
	Thu, 28 Feb 2019 09:57:42 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<20190128110545.20644-4-shameerali.kolothum.thodi@huawei.com>
	<20190227181412.2a69a926@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <61d04463-c237-eabb-18f1-3c8e49a87885@redhat.com>
Date: Thu, 28 Feb 2019 10:57:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190227181412.2a69a926@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 28 Feb 2019 09:57:45 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, linuxarm@huawei.com, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, xuwei5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KEF/UhSSkdG2

Hi Igor,

On 2/27/19 6:14 PM, Igor Mammedov wrote:
> On Mon, 28 Jan 2019 11:05:45 +0000
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> 
>> pc-dimm memory hotplug is enabled using GPIO(Pin 2) based ACPI
>> event. Hot removal functionality is not yet supported.
>>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> ---
>>  hw/arm/virt.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 55 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 884960d..cf64554 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -62,6 +62,7 @@
>>  #include "hw/mem/pc-dimm.h"
>>  #include "hw/mem/nvdimm.h"
>>  #include "hw/acpi/acpi.h"
>> +#include "hw/acpi/pc-hotplug.h"
>>  
>>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -1651,7 +1652,14 @@ static void machvirt_init(MachineState *machine)
>>          nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
>>                                 vms->fw_cfg, OBJECT(vms));
>>      }
>> +    if (vms->acpi_memhp_state.is_enabled) {
>> +        MemHotplugState *state =  &vms->acpi_memhp_state;
>> +        hwaddr base;
>>  
>> +        state->hw_reduced_acpi = true;
>> +        base = vms->memmap[VIRT_ACPI_IO].base + ACPI_MEMORY_HOTPLUG_BASE;
>> +        acpi_memory_hotplug_init(sysmem, OBJECT(vms), state, base);
>> +    }
> this hunk should be a part of 'acpi' device that owns respective interrupts and mmio regions.
> (something like we do in x86)
> In this case I'd suggest to make 'base' its property and the board will set it during
> device creation.
> 
>>      vms->bootinfo.ram_size = machine->ram_size;
>>      vms->bootinfo.kernel_filename = machine->kernel_filename;
>>      vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
>> @@ -1819,6 +1827,20 @@ static void virt_set_nvdimm_persistence(Object *obj, const char *value,
>>      nvdimm_state->persistence_string = g_strdup(value);
>>  }
>>  
>> +static bool virt_get_memhp_support(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->acpi_memhp_state.is_enabled;
>> +}
>> +
>> +static void virt_set_memhp_support(Object *obj, bool value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->acpi_memhp_state.is_enabled = value;
>> +}
>> +
>>  static CpuInstanceProperties
>>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>  {
>> @@ -1863,8 +1885,8 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>      const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>>  
>> -    if (dev->hotplugged) {
>> -        error_setg(errp, "memory hotplug is not supported");
>> +    if (dev->hotplugged && is_nvdimm) {
>> +        error_setg(errp, "nvdimm hotplug is not supported");
>>      }
>>  
>>      if (is_nvdimm && !vms->acpi_nvdimm_state.is_enabled) {
>> @@ -1875,6 +1897,22 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>      pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
>>  }
>>  
>> +static void virt_memhp_send_event(HotplugHandler *hotplug_dev, DeviceState *dev,
>> +                                  Error **errp)
>> +{
>> +    DeviceState *gpio_dev;
>> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>> +
>> +    gpio_dev = virt_get_gpio_dev(GPIO_PCDIMM);
>> +    if (!gpio_dev) {
>> +        error_setg(errp, "No dev interface to send hotplug event");
>                              ^^^^^^ confusing
>> +        return;
>> +    }
>> +    acpi_memory_plug_cb(hotplug_dev, &vms->acpi_memhp_state,
>> +                        dev, errp);
>> +    qemu_set_irq(qdev_get_gpio_in(gpio_dev, 0), 1);
>> +}
>> +
>>  static void virt_memory_plug(HotplugHandler *hotplug_dev,
>>                               DeviceState *dev, Error **errp)
>>  {
>> @@ -1891,6 +1929,10 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>>          nvdimm_plug(&vms->acpi_nvdimm_state);
>>      }
>>  
>> +    if (dev->hotplugged && !is_nvdimm) {
>> +        virt_memhp_send_event(hotplug_dev, dev, errp);
> ...
>   acpi_memory_plug_cb();
>   hotplug_handler_plug(HOTPLUG_HANDLER(pcms->gpio_dev), dev, &error_abort);
>   ^^^^ forward snd process hotplug notification event in gpio_dev,
>        machine should not care about which and how to deal with random IRQs
> 
>> +    }
>> +
>>  out:
>>      error_propagate(errp, local_err);
>>  }
>> @@ -1898,6 +1940,11 @@ out:
>>  static void virt_memory_unplug(HotplugHandler *hotplug_dev,
>>                                 DeviceState *dev, Error **errp)
>>  {
>> +    if (dev->hotplugged) {
>> +        error_setg(errp, "memory hot unplug is not supported");
>> +        return;
>> +    }
> what if unplug is called on cold-plugged device?
> 
> Better way to disable mgmt initiated unplug is to forbid it in unplug_request()
> For guest initiated one ('unplug' handler), the best we can do is log error
> and ignore it (provided guest won't get in confused). it's also possible 
> to hide _EJ method and then it would be even fine to abort if it gets here,
> since guest is not supposed to interface with MMIO interface without using AML.
I don't understand the guest initiated unplug handling. How does it
differ from x86 handling as we are using the same dynamic methods?

Besides In ARM case I checked
/sys/devices/system/memory/memoryX/removable state for cold-plugged and
hot-plugged DIMMs and it is equal to 0. I don't know if it is a
limitation of the guest or a bug in our ACPI description somewhere. I
would not be surprised if hot-unplug is not supported at kernel leve
though.

Thanks

Eric
> 
>> +
>>      pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
>>      object_unparent(OBJECT(dev));
>>  }
>> @@ -2085,6 +2132,12 @@ static void virt_instance_init(Object *obj)
>>                                      "Set NVDIMM persistence"
>>                                      "Valid values are cpu and mem-ctrl", NULL);
>>  
>> +    vms->acpi_memhp_state.is_enabled = true;
>> +    object_property_add_bool(obj, "memory-hotplug-support",
>> +                             virt_get_memhp_support,
>> +                             virt_set_memhp_support,
>> +                             NULL);
>> +
>>      vms->irqmap = a15irqmap;
>>  }
>>  
> 
