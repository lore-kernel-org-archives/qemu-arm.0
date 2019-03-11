Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp1083011wrt;
        Mon, 11 Mar 2019 14:11:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKcyxytpcDrXBPOQlvLWl67Vt/m/hdlxxsxBTRrKoSuUCfAWv9LFYF1ZDZU7XPbr6dJSsZ
X-Received: by 2002:a25:38c2:: with SMTP id f185mr6274707yba.117.1552338684663;
        Mon, 11 Mar 2019 14:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552338684; cv=none;
        d=google.com; s=arc-20160816;
        b=bsejoCPvLJlkTUotkZL//teRzjelp0tolHR0t5Ng6S/kSg/I0v06V/MMfkuhRZece2
         HwsUwP8vGoSCsOJ8k9pkgHRQFxFmBF3bPY7Ukq4PEwyc2rrwIYdot//M0jt0qsOxyGUt
         gxruxStfrB7H0DqH6r3wjLy2nt8h6nd6PDfjtO6srfDW/DXeBQK50ksQ9N57CMxQ8dlH
         C76oWXFVoEHTqMlaCLI2NSEIlLg4eAhSsS2rfivSnwDbAA6ydJInE7aDZfPPIsP8/EFr
         VZqi+eS3uA3039DDTfDDL9A4GOCFum+86UPbm8lplGHyyLr5w092wiS53if1o9zkCdTk
         0asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=rpsAp4XtN4JD5phbsZIwqYNIegMAzRzr3nUXUM2dmj8=;
        b=hQTHEtfvcJisuZT9PJtwMkmUFSAUO5WL3Vuy+/zU7gaQoEmg2L7ecg2te9GmLVDgEJ
         ez/vHRxvqgeoUqM/As00x0aNPpdbm+URYJ+0xv8pZWSuK0L53P3e6dw9S860jJEt+RCC
         yMq6CEvD4+RlgaYkZGJAul8Bn8fvfq9i48/g6Y0NuNEb/1oXYbXUWK9C4YlW0IDNaRKy
         /KKLcZi4c8K2oHlpMLN9CROI3N3slVSnuqvWIMnGIOUzn0Midz5DIOslTfi50ACHK+r+
         LZ0asmqTfdSwaK/wGvrbS6wHSF0uVwCJnB4hq8WBHA+KVFyKzddoomNlqC/DqWDlF7xr
         IyCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 123si4026505ybd.460.2019.03.11.14.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 14:11:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3SCi-0003LK-2s
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 17:11:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3SCY-0003Kc-MV
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 17:11:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3SCX-0003r6-7Y
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 17:11:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h3SCW-0003iU-5K; Mon, 11 Mar 2019 17:11:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3643A8830B;
	Mon, 11 Mar 2019 21:11:08 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88DB1600CD;
	Mon, 11 Mar 2019 21:11:05 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-11-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f3386b54-ec43-c133-9545-c58ad917a71b@redhat.com>
Date: Mon, 11 Mar 2019 22:11:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190308114218.26692-11-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 11 Mar 2019 21:11:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 10/11] hw/arm/virt: Add GED device
 configuration and build aml
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
X-TUID: MntyeLIHeY/8

Hi Shameer,

On 3/8/19 12:42 PM, Shameer Kolothum wrote:
> This initializes the GED device with base memory and irq.
> It also configures ged memory hotplug event and builds the
> corresponding aml code.
> 
> But ged irq routing to Guest is not enabled and thus hotplug
> is not yet supported.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  default-configs/arm-softmmu.mak |  1 +
>  hw/arm/virt-acpi-build.c        | 13 +++++++++++++
>  hw/arm/virt-acpi.c              |  4 ++++
>  hw/arm/virt.c                   | 22 ++++++++++++++++++++++
>  include/hw/arm/virt.h           |  4 ++++
>  5 files changed, 44 insertions(+)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index b3bac25..7c442fd 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -168,3 +168,4 @@ CONFIG_MUSICPAL=y
>  CONFIG_MEM_DEVICE=y
>  CONFIG_DIMM=y
>  CONFIG_ACPI_MEMORY_HOTPLUG=y
> +CONFIG_ACPI_HW_REDUCED=y
requires a KConfig entry now
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cb7263..86f25ad 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -50,6 +50,18 @@
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  
> +static void acpi_dsdt_add_ged(Aml *scope, VirtMachineState *vms)
> +{
> +    int irq =  vms->irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE;
> +
> +    if (!vms->ged_events || !vms->ged_events_size) {
> +        return;
> +    }
> +
> +    build_ged_aml(scope, "\\_SB."GED_DEVICE, irq, vms->ged_events,
> +                  vms->ged_events_size, AML_SYSTEM_MEMORY);
> +}
> +
>  static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState *ms)
>  {
>      uint32_t nr_mem = ms->ram_slots;
> @@ -758,6 +770,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       */
>      scope = aml_scope("\\_SB");
>      acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
> +    acpi_dsdt_add_ged(scope, vms);
>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
> index 18ebe94..3b55c63 100644
> --- a/hw/arm/virt-acpi.c
> +++ b/hw/arm/virt-acpi.c
> @@ -31,6 +31,7 @@
>  typedef struct VirtAcpiState {
>      SysBusDevice parent_obj;
>      MemHotplugState memhp_state;
> +    GEDState ged_state;
>  } VirtAcpiState;
>  
>  #define TYPE_VIRT_ACPI "virt-acpi"
> @@ -76,12 +77,15 @@ static void virt_device_realize(DeviceState *dev, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
>      const MemMapEntry *memmap = vms->memmap;
> +    const int *irqmap = vms->irqmap;
>      VirtAcpiState *s = VIRT_ACPI(dev);
>  
>      if (s->memhp_state.is_enabled) {
>          acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
>                                   &s->memhp_state,
>                                   memmap[VIRT_PCDIMM_ACPI].base);
> +        acpi_ged_init(get_system_memory(), OBJECT(dev), &s->ged_state,
> +                      memmap[VIRT_ACPI_GED].base, irqmap[VIRT_ACPI_GED]);
>      }
>  }
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9427f4f..352dbb1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -134,6 +134,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
>      [VIRT_PCDIMM_ACPI] =        { 0x09070000, 0x00010000 },
> +    [VIRT_ACPI_GED] =           { 0x09080000, 0x00010000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -169,6 +170,7 @@ static const int a15irqmap[] = {
>      [VIRT_PCIE] = 3, /* ... to 6 */
>      [VIRT_GPIO] = 7,
>      [VIRT_SECURE_UART] = 8,
> +    [VIRT_ACPI_GED] = 9,
>      [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
>      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>      [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
> @@ -184,6 +186,25 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("max"),
>  };
>  
> +static void virt_acpi_ged_conf(VirtMachineState *vms)
> +{
> +    uint8_t events_size;
> +
> +    /* GED events */
> +    GedEvent events[] = {
> +        {
> +            .selector = ACPI_GED_IRQ_SEL_MEM,
> +            .event    = GED_MEMORY_HOTPLUG,
> +        },
> +    };
> +
> +    events_size = ARRAY_SIZE(events);
> +
> +    vms->ged_events = g_malloc0(events_size * sizeof(GedEvent));
> +    memcpy(vms->ged_events, events, events_size * sizeof(GedEvent));
> +    vms->ged_events_size = events_size;
> +}
can't you do the virt_acpi_ged_conf's job directly in virt_acpi_init
avoid this memcpy by using a pointer to a static const GedEvent
ged_events[]?
> +
>  static bool cpu_type_valid(const char *cpu)
>  {
>      int i;
> @@ -1650,6 +1671,7 @@ static void machvirt_init(MachineState *machine)
>      create_platform_bus(vms, pic);
>  
>      vms->acpi = virt_acpi_init();
> +    virt_acpi_ged_conf(vms);

>  
>      vms->bootinfo.ram_size = machine->ram_size;
>      vms->bootinfo.kernel_filename = machine->kernel_filename;
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index e46a051..49fda81 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -37,6 +37,7 @@
>  #include "hw/arm/arm.h"
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
> +#include "hw/acpi/ged.h"
>  
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
> @@ -78,6 +79,7 @@ enum {
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
>      VIRT_PCDIMM_ACPI,
> +    VIRT_ACPI_GED,
>      VIRT_LOWMEMMAP_LAST,
>  };
>  
> @@ -134,6 +136,8 @@ typedef struct {
>      int psci_conduit;
>      hwaddr highest_gpa;
>      DeviceState *acpi;
> +    GedEvent *ged_events;
> +    uint32_t ged_events_size;
I guess we can avoid that one by using a const GedEvent *ged_events and
using ARRAY_SIZE?

Thanks

Eric
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> 
