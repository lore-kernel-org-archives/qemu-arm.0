Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1922894wrx;
        Fri, 29 Mar 2019 07:16:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWryjokvdQRf7+2OUymjKVySzxuPPmSeF3VL4A+rrhvbTFottIvEd65bt7ga1FK+An7uGJ
X-Received: by 2002:a6b:4e09:: with SMTP id c9mr35300950iob.251.1553869006194;
        Fri, 29 Mar 2019 07:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553869006; cv=none;
        d=google.com; s=arc-20160816;
        b=ihyB5XR+/0l2L73KurDu+9nNbrxVBqPl4rtwCOA97zWb5GRnC9fDj1cCzxxtREskH1
         h5y7H1y5SrPQSDpsZQKP8zErYPU98GezclvsIBRG+BSn13oXhutzYFrs2C7k6s8ejNWx
         Gf96IvOelLhO7ciWUUj3zWXaRfyaoRYIqC6kzk1IHN5rcYN8yHEtI0z6wrvG0tbklDNt
         PVXJZgmCN3po9CrV4XuTn+Wd9Ymmm4AD7liSFvV2eApjoy2YB7jAYOX50ZEyprnbX6pp
         ZKOEV2lwslpsn4406y7bkSkszF8kso9T5BNNA/LSLJoJHMRUPiQuhs8FavgrObIs2b87
         KnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=32yfvKlkJeaVGdKs59xrBUKpxBIidvBS7/ppG6q3lNs=;
        b=uaa5udEu+OMto0U08wpymztsVpFKF/naMdpXXUWpS7HHSdZZ9dVVqHYtk7+HxTuJ3W
         vXg3nKaabq8ZEF7m0z1nba1JxMaEvqgWjrjlkVvqDKgEdJw/1mrR8MOE/cBsJXlpeUtT
         LqQOk98YQZbPW7MkBAvbLoP6GM3kbPzH3V3ArN2xZHM4Moa/ekq85UfdtR8LtUGauHfY
         93gqOaSgQXuNsunmGm2z5XIvgim3u2Ulwwu6WH9qtMCzTOvITeX2Opxb7zSGxNaXI3Lm
         d8pRiHSeK9BoAtfyAtKuTNyDPb5fpGycrFrBe4cufthjADYSCGri7+SVzBYXIyI9O2JG
         0vJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w194si1111208ita.73.2019.03.29.07.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 07:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9sJG-0008O7-L5
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 10:16:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9sJ6-0008NP-FN
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 10:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9sJ4-0001Wq-Pn
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 10:16:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35276)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h9sJ4-0001W6-E2; Fri, 29 Mar 2019 10:16:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EAC13002A8E;
	Fri, 29 Mar 2019 14:16:24 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CED26A6BA;
	Fri, 29 Mar 2019 14:16:20 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-11-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <026aae14-d929-c5da-cc4c-50e2bd621d1b@redhat.com>
Date: Fri, 29 Mar 2019 15:16:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190321104745.28068-11-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 29 Mar 2019 14:16:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 10/10] hw/arm/virt: Init GED device and
 enable memory hotplug
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uWJTFaHFnN35

Hi Shameer,
On 3/21/19 11:47 AM, Shameer Kolothum wrote:
> This initializes the GED device with base memory and irq,
> configures ged memory hotplug event and builds the
> corresponding aml code.
> 
> GED irq routing to Guest is also enabled.
I am not clear about why would need gsi and virt_gsi_handler for this patch.

 Memory hotplug
> should now work.
Time to be confident? ;-)
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/acpi/generic_event_device.c | 18 ++++++++++++++++++
>  hw/arm/virt-acpi-build.c       |  9 +++++++++
>  hw/arm/virt.c                  | 30 +++++++++++++++++++++++++-----
>  include/hw/arm/virt.h          |  2 ++
>  4 files changed, 54 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 9deaa33..02d5e66 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -200,6 +200,23 @@ static void acpi_ged_event(GEDState *ged_st, uint32_t ged_irq_sel)
>      qemu_irq_pulse(ged_st->gsi[ged_st->irq]);
>  }
>  
> +static void acpi_ged_init(MemoryRegion *as, DeviceState *dev, GEDState *ged_st)
> +{
> +    VirtAcpiState *s = VIRT_ACPI(dev);
> +
> +    assert(!ged_io_base && !ged_events && !ged_events_size);
> +
> +    ged_io_base = s->ged_base;
> +    ged_events = s->ged_events;
> +    ged_events_size = s->ged_events_size;
Are you obliged to use those global variables? the ged device handle can
be accessed from vms. build_ged_aml could be passed those values through
args, whose value would be extracted from VirtAcpiState?
> +    ged_st->irq = s->ged_irq;
> +    ged_st->gsi = s->gsi;
> +    qemu_mutex_init(&ged_st->lock);
> +    memory_region_init_io(&ged_st->io, OBJECT(dev), &ged_ops, ged_st,
> +                          "acpi-ged-event", ACPI_GED_REG_LEN);
> +    memory_region_add_subregion(as, ged_io_base, &ged_st->io);

This time you are not stuck with the hotplug framework; couldn't you do
here:
    memory_region_init_io(&ged_st->io, OBJECT(dev), &ged_ops, ged_st,
> +                          "acpi-ged-event", ACPI_GED_REG_LEN);
    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &ged_st->io);

and in virt create_ged

sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);

You wouldn't need to use a property for the ged_io_base and use a static
variable?
> +}
> +
>  static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
>                                  DeviceState *dev, Error **errp)
>  {
> @@ -242,6 +259,7 @@ static void virt_device_realize(DeviceState *dev, Error **errp)
>          acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
>                                   &s->memhp_state,
>                                   s->memhp_base);
> +        acpi_ged_init(get_system_memory(), dev, &s->ged_state);
>      }
>  }
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1887531..116e9c9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -41,6 +41,7 @@
>  #include "hw/hw.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/memory_hotplug.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
> @@ -50,6 +51,13 @@
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  
> +static void acpi_dsdt_add_ged(Aml *scope, VirtMachineState *vms)
> +{
> +    int irq =  vms->irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE;
> +
> +    build_ged_aml(scope, "\\_SB."GED_DEVICE, irq, AML_SYSTEM_MEMORY);
> +}
> +
>  static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState *ms)
>  {
>      uint32_t nr_mem = ms->ram_slots;
> @@ -758,6 +766,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       */
>      scope = aml_scope("\\_SB");
>      acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
> +    acpi_dsdt_add_ged(scope, vms);
>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b602151..e3f8aa7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -63,6 +63,7 @@
>  #include "target/arm/internals.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
> +#include "hw/acpi/generic_event_device.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -134,6 +135,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
>      [VIRT_PCDIMM_ACPI] =        { 0x09070000, 0x00010000 },
> +    [VIRT_ACPI_GED] =           { 0x09080000, 0x00010000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -169,6 +171,7 @@ static const int a15irqmap[] = {
>      [VIRT_PCIE] = 3, /* ... to 6 */
>      [VIRT_GPIO] = 7,
>      [VIRT_SECURE_UART] = 8,
> +    [VIRT_ACPI_GED] = 9,
>      [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
>      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>      [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
> @@ -184,6 +187,13 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("max"),
>  };
>  
> +static GedEvent ged_events[] = {
> +    {
> +        .selector = ACPI_GED_IRQ_SEL_MEM,
> +        .event    = GED_MEMORY_HOTPLUG,
> +    },
> +};
> +
>  static bool cpu_type_valid(const char *cpu)
>  {
>      int i;
> @@ -524,6 +534,11 @@ static DeviceState *create_virt_acpi(VirtMachineState *vms)
>      dev = qdev_create(NULL, "virt-acpi");
>      qdev_prop_set_uint64(dev, "memhp_base",
>                           vms->memmap[VIRT_PCDIMM_ACPI].base);
> +    qdev_prop_set_ptr(dev, "gsi", vms->gsi);
> +    qdev_prop_set_uint64(dev, "ged_base", vms->memmap[VIRT_ACPI_GED].base);
> +    qdev_prop_set_uint32(dev, "ged_irq", vms->irqmap[VIRT_ACPI_GED]);
can't you avoid using this ged_irq prop as well? How is it different
from the other sysbus devices which do not rely on those props?
> +    qdev_prop_set_ptr(dev, "ged_events", ged_events);
> +    qdev_prop_set_uint32(dev, "ged_events_size", ARRAY_SIZE(ged_events));
>      qdev_init_nofail(dev);
>  
>      return dev;
> @@ -568,6 +583,12 @@ static void create_v2m(VirtMachineState *vms, qemu_irq *pic)
>      fdt_add_v2m_gic_node(vms);
>  }
>  
> +static void virt_gsi_handler(void *opaque, int n, int level)
> +{
> +    qemu_irq *gic_irq = opaque;
> +    qemu_set_irq(gic_irq[n], level);
> +}
> +
>  static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>  {
>      /* We create a standalone GIC */
> @@ -683,6 +704,8 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>          pic[i] = qdev_get_gpio_in(gicdev, i);
>      }
>  
> +    vms->gsi = qemu_allocate_irqs(virt_gsi_handler, pic, NUM_IRQS);
> +
>      fdt_add_gic_node(vms);
>  
>      if (type == 3 && vms->its) {
> @@ -1431,7 +1454,7 @@ static void machvirt_init(MachineState *machine)
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const CPUArchIdList *possible_cpus;
> -    qemu_irq pic[NUM_IRQS];
> +    qemu_irq *pic;
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *secure_sysmem = NULL;
>      int n, virt_max_cpus;
> @@ -1627,6 +1650,7 @@ static void machvirt_init(MachineState *machine)
>  
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>  
> +    pic = g_new0(qemu_irq, NUM_IRQS);
>      create_gic(vms, pic);
>  
>      fdt_add_pmu_nodes(vms);
> @@ -1842,10 +1866,6 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>  {
>      const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>  
> -    if (dev->hotplugged) {
> -        error_setg(errp, "memory hotplug is not supported");
> -    }
> -
>      if (is_nvdimm) {
>          error_setg(errp, "nvdimm is not yet supported");
>          return;
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 14b2e0a..850296a 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -78,6 +78,7 @@ enum {
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
>      VIRT_PCDIMM_ACPI,
> +    VIRT_ACPI_GED,
>      VIRT_LOWMEMMAP_LAST,
>  };
>  
> @@ -135,6 +136,7 @@ typedef struct {
>      int psci_conduit;
>      hwaddr highest_gpa;
>      DeviceState *acpi;
> +    qemu_irq *gsi;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> 

Thanks

Eric
