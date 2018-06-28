Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7202063wrq;
        Thu, 28 Jun 2018 02:31:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdv/6wBEYKHX5luhG3YF7ArZBs9zqEjwdPfS2JCBkXOYKNwPc9OdIx2ZST4/iSCme5re3rF
X-Received: by 2002:a0c:d0eb:: with SMTP id b40-v6mr8373167qvh.236.1530178287690;
        Thu, 28 Jun 2018 02:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530178287; cv=none;
        d=google.com; s=arc-20160816;
        b=jqG+KUmgk1eM+q80DQDiUROmKtLnolLnFfuwsn3lq1rdcjcC4FnmUQC4aJCFD8Vm99
         pkR/0Eg9cwCNzZTi5BU+bfjepX46BVv/GlLhE5byJM0nLwnY6uDyQSif7nljiqvMeI3C
         8MSv9qtwV28BL71cUzbjWx/8ewP3Vsv9IXm57KssuVBW56XX536Ck5zS9F3ZKeEsFTYR
         v/TJZ8zMVsLf4qMqk4TnHQlgowVjVzXi+sM2ECaMt6F5dBRV3V3tiAX+Fdtj0hh+lRAh
         RWUF93/yljbkRF/MjW91MM9C+adsTC7BFVRXMk76Hss3jv8ySO/VDAk55AJnsoUezQ4F
         BZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=VJtQ9A3Z9ZAM0SYDrbBar7+japrJqho4YxeqCsY6hC4=;
        b=Acfg245yI5QYDpx7Ypv7hzk1OSJNyou+lunCBwlHQIEA/ptr5x7iMrDMBmsiaDFCUL
         7db1TRk2PZTolyxPq53cr/X3PmPB2I0gfyDsgBJju4Z7qHi/OoSi6Hqsgo/RIfIb8AOE
         lsI5dxkNmYqtRkeVfW+0zWGlz6Vye0y8FfG3ytQyVkrclET2J7EdzU7MVjzugh88/qMC
         iB0WChPibqyfyvMrOv6EzRBgz8EP0yaqPVADCnB7PhWq56TTDsXI2w1rdk+pXz/WKy74
         iVXGmeOOd0g3eceDNAYSHJzMiFj3WOpenDyqldLTtVACnOalm0apdoRYXupXv9UGnpj5
         Bf0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13-v6si2275217qvn.284.2018.06.28.02.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 02:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYTGx-0002dh-5D
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 05:31:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fYTGl-0002cJ-Gr
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fYTGi-0003W1-Al
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:31:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35918 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fYTGi-0003V6-2i; Thu, 28 Jun 2018 05:31:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CD3F738E0;
	Thu, 28 Jun 2018 09:31:11 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-10.rdu2.redhat.com
	[10.10.120.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 762DB11166FB;
	Thu, 28 Jun 2018 09:31:10 +0000 (UTC)
To: Hongbo Zhang <hongbo.zhang@linaro.org>, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <208784f8-ad5a-ee6c-0322-e4206c4fa11b@redhat.com>
Date: Thu, 28 Jun 2018 11:31:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 28 Jun 2018 09:31:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 28 Jun 2018 09:31:11 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm: Add SBSA machine type
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9EfJ6uagoeHX

On 06/27/18 12:13, Hongbo Zhang wrote:
> This patch introduces a new Arm machine type 'SBSA' with features:
>  - Based on legacy 'virt' machine type.

My understanding is that this new machine type serves a different use
case than the "virt" machine type; i.e. it is not primarily meant to run
on KVM and execute virtualization workloads. Instead, it is meant to
provide an environment as faithful as possible to physical hardware, for
supporting firmware and OS development for physical ARM64 machines.

In other words, this machine type is not a "goal" for running production
workloads (on KVM); instead it is a development and testbed "means",
where the end-goal is writing OS and firmware code for physical machines
that conform to the SBSA spec. Thus, the machine type is similar to e.g.
the "vexpress" machine types, except the emulated hardware platform is
"SBSA".

Can you please confirm that?

If that's the case, then please remove the word "legacy" from the commit
message (multiple instances). This machine type does not obsolete or
replace "virt", for "virt"'s stated use case; this machine type is for
an independent use case.

One consequence of this would be that performance isn't as important.

Another consequence is that paravirt devices are less desirable.

I have another question:

>  - Newly designed memory map.
>  - EL2 and EL3 are enabled by default.
>  - AHCI controller attached to system bus, and then CDROM and hard disc
>    can be added to it.
>  - EHCI controller attached to system bus, with USB mouse and key board
>    installed by default.
>  - E1000 ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>  - No virtio functions enabled, since this is to emulate real hardware.
> 
> This is the prototype, more features can be added in futrue.
> 
> Purpose of this is to have a standard QEMU platform for Arm firmware
> developement etc. where the legacy machines cannot meets requirements.
> 
> Arm Trusted Firmware and UEFI porting to this are done seperately.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c |  59 +++++++++++++-
>  hw/arm/virt.c            | 196 ++++++++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/virt.h    |   3 +
>  3 files changed, 254 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6ea47e2..60af414 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -84,6 +84,52 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>      aml_append(scope, dev);
>  }
>  
> +static void acpi_dsdt_add_ahci(Aml *scope, const MemMapEntry *ahci_memmap,
> +                                           uint32_t ahci_irq)
> +{
> +    Aml *dev = aml_device("AHC0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO001E")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(ahci_memmap->base,
> +                                       ahci_memmap->size, AML_READ_WRITE));
> +    aml_append(crs,
> +               aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> +                             AML_EXCLUSIVE, &ahci_irq, 1));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    Aml *pkg = aml_package(3);
> +    aml_append(pkg, aml_int(0x1));
> +    aml_append(pkg, aml_int(0x6));
> +    aml_append(pkg, aml_int(0x1));
> +
> +    /* append the SATA class id */
> +    aml_append(dev, aml_name_decl("_CLS", pkg));
> +
> +    aml_append(scope, dev);
> +}
> +
> +static void acpi_dsdt_add_ehci(Aml *scope, const MemMapEntry *ehci_memmap,
> +                                           uint32_t ehci_irq)
> +{
> +    Aml *dev = aml_device("EHC0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0D20")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(ehci_memmap->base,
> +                                       ehci_memmap->size, AML_READ_WRITE));
> +    aml_append(crs,
> +               aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> +                             AML_EXCLUSIVE, &ehci_irq, 1));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    aml_append(scope, dev);
> +}
> +
>  static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
>  {
>      Aml *dev = aml_device("FWCF");
> @@ -768,14 +814,23 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> -    acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> -                    (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> +    if (!vms->sbsa) {
> +        acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> +                   (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> +    }
>      acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
>                        vms->highmem, vms->highmem_ecam);
>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
>      acpi_dsdt_add_power_button(scope);
>  
> +    if (vms->sbsa) {
> +        acpi_dsdt_add_ahci(scope, &memmap[VIRT_AHCI],
> +                           (irqmap[VIRT_AHCI] + ARM_SPI_BASE));
> +        acpi_dsdt_add_ehci(scope, &memmap[VIRT_EHCI],
> +                           (irqmap[VIRT_EHCI] + ARM_SPI_BASE));
> +    }
> +
>      aml_append(dsdt, scope);
>  
>      /* copy AML table into ACPI tables blob and patch header there */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 742f68a..491f23b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -59,6 +59,10 @@
>  #include "qapi/visitor.h"
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
> +#include "hw/ide/internal.h"
> +#include "hw/ide/ahci_internal.h"
> +#include "hw/usb.h"
> +#include "qemu/cutils.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -94,6 +98,8 @@
>  
>  #define PLATFORM_BUS_NUM_IRQS 64
>  
> +#define SATA_NUM_PORTS 6
> +
>  /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
>   * RAM can go up to the 256GB mark, leaving 256GB of the physical
>   * address space unallocated and free for future use between 256G and 512G.
> @@ -168,6 +174,47 @@ static const int a15irqmap[] = {
>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
>  };
>  
> +static const MemMapEntry sbsa_memmap[] = {
> +    /* Space up to 0x8000000 is reserved for a boot ROM */
> +    [VIRT_FLASH] =              {          0, 0x08000000 },
> +    [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
> +    /* GIC distributor and CPU interfaces sit inside the CPU peripheral space */
> +    [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
> +    [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
> +    [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
> +    /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
> +    [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
> +    /* This redistributor space allows up to 2*64kB*123 CPUs */
> +    [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
> +    [VIRT_UART] =               { 0x09000000, 0x00001000 },
> +    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
> +    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },

It's hard for any device to be *more* paravirtual than fw_cfg is --
given that (to my understanding) paravirtualization is an explicit
non-goal for this machine type, what do you need fw_cfg for? Is it an
oversight in the memory map, or is it an exception -- a limited paravirt
info channel -- because you need *some* way for passing information from
QEMU to a small subset of guest code?

Thanks
Laszlo

> +    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> +    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> +    [VIRT_AHCI] =               { 0x09050000, 0x00010000 },
> +    [VIRT_EHCI] =               { 0x09060000, 0x00010000 },
> +    [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> +    [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
> +    [VIRT_PCIE_MMIO] =          { 0x10000000, 0x7fff0000 },
> +    [VIRT_PCIE_PIO] =           { 0x8fff0000, 0x00010000 },
> +    [VIRT_PCIE_ECAM] =          { 0x90000000, 0x10000000 },
> +    /* Second PCIe window, 508GB wide at the 4GB boundary */
> +    [VIRT_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0x7F00000000ULL },
> +    [VIRT_MEM] =                { 0x8000000000ULL, RAMLIMIT_BYTES },
> +};
> +
> +static const int sbsa_irqmap[] = {
> +    [VIRT_UART] = 1,
> +    [VIRT_RTC] = 2,
> +    [VIRT_PCIE] = 3, /* ... to 6 */
> +    [VIRT_GPIO] = 7,
> +    [VIRT_SECURE_UART] = 8,
> +    [VIRT_AHCI] = 9,
> +    [VIRT_EHCI] = 10,
> +    [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
> +    [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
> +};
> +
>  static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a15"),
>      ARM_CPU_TYPE_NAME("cortex-a53"),
> @@ -696,6 +743,72 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
>      g_free(nodename);
>  }
>  
> +static void create_ahci(const VirtMachineState *vms, qemu_irq *pic)
> +{
> +    char *nodename;
> +    hwaddr base = vms->memmap[VIRT_AHCI].base;
> +    hwaddr size = vms->memmap[VIRT_AHCI].size;
> +    int irq = vms->irqmap[VIRT_AHCI];
> +    const char compat[] = "qemu,mach-virt-ahci\0generic-ahci";
> +    DeviceState *dev;
> +    DriveInfo *hd[SATA_NUM_PORTS];
> +    SysbusAHCIState *sysahci;
> +    AHCIState *ahci;
> +    int i;
> +
> +    dev = qdev_create(NULL, "sysbus-ahci");
> +    qdev_prop_set_uint32(dev, "num-ports", SATA_NUM_PORTS);
> +    qdev_init_nofail(dev);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
> +
> +    sysahci = SYSBUS_AHCI(dev);
> +    ahci = &sysahci->ahci;
> +    ide_drive_get(hd, ARRAY_SIZE(hd));
> +    for (i = 0; i < ahci->ports; i++) {
> +        if (hd[i] == NULL) {
> +            continue;
> +        }
> +        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
> +    }
> +
> +    nodename = g_strdup_printf("/sata@%" PRIx64, base);
> +    qemu_fdt_add_subnode(vms->fdt, nodename);
> +    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
> +    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
> +                           GIC_FDT_IRQ_TYPE_SPI, irq,
> +                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +    g_free(nodename);
> +}
> +
> +static void create_ehci(const VirtMachineState *vms, qemu_irq *pic)
> +{
> +    char *nodename;
> +    hwaddr base = vms->memmap[VIRT_EHCI].base;
> +    hwaddr size = vms->memmap[VIRT_EHCI].size;
> +    int irq = vms->irqmap[VIRT_EHCI];
> +    const char compat[] = "qemu,mach-virt-ehci\0generic-ehci";
> +    USBBus *usb_bus;
> +
> +    sysbus_create_simple("exynos4210-ehci-usb", base, pic[irq]);
> +
> +    usb_bus = usb_bus_find(-1);
> +    usb_create_simple(usb_bus, "usb-kbd");
> +    usb_create_simple(usb_bus, "usb-mouse");
> +
> +    nodename = g_strdup_printf("/ehci@%" PRIx64, base);
> +    qemu_fdt_add_subnode(vms->fdt, nodename);
> +    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
> +    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
> +                           GIC_FDT_IRQ_TYPE_SPI, irq,
> +                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +    g_free(nodename);
> +}
> +
>  static DeviceState *gpio_key_dev;
>  static void virt_powerdown_req(Notifier *n, void *opaque)
>  {
> @@ -1107,13 +1220,21 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
>              NICInfo *nd = &nd_table[i];
>  
>              if (!nd->model) {
> -                nd->model = g_strdup("virtio");
> +                if (vms->sbsa) {
> +                    nd->model = g_strdup("e1000");
> +                } else {
> +                    nd->model = g_strdup("virtio");
> +                }
>              }
>  
>              pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
>          }
>      }
>  
> +    if (vms->sbsa) {
> +        pci_create_simple(pci->bus, -1, "VGA");
> +    }
> +
>      nodename = g_strdup_printf("/pcie@%" PRIx64, base);
>      qemu_fdt_add_subnode(vms->fdt, nodename);
>      qemu_fdt_setprop_string(vms->fdt, nodename,
> @@ -1502,11 +1623,18 @@ static void machvirt_init(MachineState *machine)
>  
>      create_gpio(vms, pic);
>  
> +    if (vms->sbsa) {
> +        create_ahci(vms, pic);
> +        create_ehci(vms, pic);
> +    }
> +
>      /* Create mmio transports, so the user can create virtio backends
>       * (which will be automatically plugged in to the transports). If
>       * no backend is created the transport will just sit harmlessly idle.
>       */
> -    create_virtio_devices(vms, pic);
> +    if (!vms->sbsa) {
> +        create_virtio_devices(vms, pic);
> +    }
>  
>      vms->fw_cfg = create_fw_cfg(vms, &address_space_memory);
>      rom_set_fw(vms->fw_cfg);
> @@ -1818,6 +1946,7 @@ static void virt_3_0_instance_init(Object *obj)
>  
>      vms->memmap = a15memmap;
>      vms->irqmap = a15irqmap;
> +    vms->sbsa = false;
>  }
>  
>  static void virt_machine_3_0_options(MachineClass *mc)
> @@ -1950,3 +2079,66 @@ static void virt_machine_2_6_options(MachineClass *mc)
>      vmc->no_pmu = true;
>  }
>  DEFINE_VIRT_MACHINE(2, 6)
> +
> +static void sbsa_instance_init(Object *obj)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->secure = true;
> +    object_property_add_bool(obj, "secure", virt_get_secure,
> +                             virt_set_secure, NULL);
> +    object_property_set_description(obj, "secure",
> +                                    "Set on/off to enable/disable the ARM "
> +                                    "Security Extensions (TrustZone)",
> +                                    NULL);
> +
> +    vms->virt = true;
> +    object_property_add_bool(obj, "virtualization", virt_get_virt,
> +                             virt_set_virt, NULL);
> +    object_property_set_description(obj, "virtualization",
> +                                    "Set on/off to enable/disable emulating a "
> +                                    "guest CPU which implements the ARM "
> +                                    "Virtualization Extensions",
> +                                    NULL);
> +
> +    vms->highmem = true;
> +
> +    /* This can be changed to GICv3 when firmware is ready*/
> +    vms->gic_version = 2;
> +    object_property_add_str(obj, "gic-version", virt_get_gic_version,
> +                        virt_set_gic_version, NULL);
> +    object_property_set_description(obj, "gic-version",
> +                                    "Set GIC version. "
> +                                    "Valid values are 2, 3, host, max", NULL);
> +    vms->its = true;
> +
> +    vms->memmap = sbsa_memmap;
> +    vms->irqmap = sbsa_irqmap;
> +    vms->sbsa = true;
> +}
> +
> +static void sbsa_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->max_cpus = 246;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
> +    mc->block_default_type = IF_IDE;
> +    mc->default_ram_size = 1 * G_BYTE;
> +    mc->default_cpus = 4;
> +    mc->desc = "QEMU 'SBSA' ARM Virtual Machine";
> +}
> +
> +static const TypeInfo sbsa_info = {
> +    .name          = MACHINE_TYPE_NAME("sbsa"),
> +    .parent        = TYPE_VIRT_MACHINE,
> +    .instance_init = sbsa_instance_init,
> +    .class_init    = sbsa_class_init,
> +};
> +
> +static void sbsa_machine_init(void)
> +{
> +    type_register_static(&sbsa_info);
> +}
> +
> +type_init(sbsa_machine_init);
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9a870cc..619473e 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -78,6 +78,8 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_AHCI,
> +    VIRT_EHCI,
>  };
>  
>  typedef enum VirtIOMMUType {
> @@ -124,6 +126,7 @@ typedef struct {
>      uint32_t msi_phandle;
>      uint32_t iommu_phandle;
>      int psci_conduit;
> +    bool sbsa;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
> 

